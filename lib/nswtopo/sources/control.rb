module NSWTopo
  class ControlSource
    include VectorRenderer
    attr_reader :path

    PARAMS = %q[
      diameter: 7.0
      stroke: "#880088"
      stroke-width: 0.2
      water:
        stroke: blue
      labels:
        dupe: outline
        outline:
          stroke: white
          fill: none
          stroke-width: 0.25
          stroke-opacity: 0.75
        position: [ aboveright, belowright, aboveleft, belowleft, right, left, above, below ]
        font-family: sans-serif
        font-size: 4.9
        stroke: none
        fill: "#880088"
    ]
    SCALING_PARAMS = %q[
      fence: 2.0
      control:
        symbol:
        - circle:
            r: 1.0
            fill: none
      hashhouse:
        symbol:
          path:
            d: M 0.0 -1.0 L -0.866 0.5 L 0.866 0.5 Z
            fill: none
      anc:
        symbol:
          path:
            d: M 0.7071 0.7071 L -0.7071 0.7071 L -0.7071 -0.7071 L 0.7071 -0.7071 Z
            fill: none
      water:
        symbol:
          path:
            d:
              M 0 0 m -0.63954,0.063887 -0.0040064,0.32652 0.33453,0.034055 0,-0.38261 -0.33052,0.022034 z
              M 0 0 m -0.0095612,-0.43108 0,0.11413
              M 0 0 m 0.11225,-0.43108 0,0.11413
              M 0 0 m -0.30901,0.04046 c 0.020447,0.0013422 0.029653,0.024004 0.049078,0.031048 0.018777,0.0053462 0.038045,0.0035119 0.05709,0.0020132 0.0063728,-0.0033554 0.042405,-0.030227 0.044414,-0.034299 0.01612,-0.013399 0.037913,-0.04687 0.037717,-0.065861 l 0.0040064,-0.10517 c 0.00020519,-0.0053688 -0.021845,-0.022347 -0.025354,-0.026427 -0.0042688,-0.0049656 0.0055968,-0.05284 -0.0026192,-0.051919 -0.0092762,-0.0035792 -0.013901,0.00044738 -0.02763,-0.0061064 -0.0033824,-0.010245 -0.0050752,-0.053478 0.0081307,-0.051037 0.022266,0.0013424 0.036219,0.0040488 0.061533,-0.0045856 0.015342,0 0.068088,-0.048747 0.083316,-0.048747 l 0.13477,0.00067107 c 0.0086143,0 0.025117,0.022723 0.029266,0.026872 0.019873,0.024221 0.046404,0.029805 0.082646,0.041671 0.0092704,0.0011184 0.041429,-0.0045408 0.044242,0.0020136 0.0063744,0.021228 0.0042104,0.0427 0.0024896,0.050818 -0.0023072,0.010894 -0.023914,-0.00015658 -0.025061,0.013936 -0.0009304,0.011453 -0.00032659,0.031954 -0.0034784,0.046116 -0.019142,0.019707 -0.042333,0.032122 -0.034371,0.040092 l -0.00052567,0.090013 c 0.0024592,0.02049 0.0088222,0.043385 0.016268,0.056554 0.020901,0.046083 0.064072,0.047163 0.06903,0.04844 0.0022744,0.00067108 0.1974,0.025825 0.30749,0.13121 0.0093678,0.00897 0.029965,0.026342 0.053084,0.097154 0.02234,0.068425 0.037538,0.2914 0.030048,0.29447 -0.06374,0.026123 -0.15033,0.053353 -0.2534,0.020043 -0.01286,-0.0041608 0.0013624,-0.088139 -0.0070112,-0.1282 -0.0085866,-0.041085 0.0002729,-0.12091 -0.08864,-0.13672 -0.037049,-0.0065768 -0.15685,0.014316 -0.24088,0.03205 -0.040012,0.0084555 -0.094156,0.013712 -0.12269,0.0080082 -0.017636,-0.0035344 -0.12587,-0.027022 -0.1458,-0.032006 -0.013224,-0.0033104 -0.042701,-0.0050104 -0.087246,0.0088806 -0.033064,0.010312 -0.050813,0.035506 -0.049812,0.026722 0.00073147,-0.00642 0.0012504,-0.371 -8.5944e-05,-0.37768 z
              M 0 0 m 0.050734,-0.6446 c -0.020293,-0.00022369 -0.052848,0.029116 -0.09202,0.057281 -0.051683,0.032021 -0.11317,0.0094174 -0.16568,-0.00774 -0.049831,-0.019774 -0.12933,-0.0033552 -0.13608,0.058974 0.0013488,0.036319 0.014608,0.092861 0.058748,0.095185 0.074174,-0.010044 0.15057,-0.043112 0.22528,-0.018924 0.029827,0.013175 0.035194,0.033585 0.037678,0.033102 l 0.14636,0 c 0.002484,0.00044738 0.0078512,-0.019931 0.037678,-0.033102 0.074708,-0.024188 0.1511,0.0088806 0.22528,0.018924 0.044141,-0.0023264 0.057457,-0.058867 0.058805,-0.095185 -0.006752,-0.062332 -0.086307,-0.078753 -0.13614,-0.058974 -0.052507,0.017157 -0.114,0.039761 -0.16568,0.00774 -0.039878,-0.028673 -0.072888,-0.058556 -0.093094,-0.057225 -0.00036462,-2.4608e-05 -0.00072.451,-5.1456e-05 -0.0011296,-5.5928e-05 z
              M 0 0 m -0.16679,-0.26528 c 0.23655,0.036829 0.43804,0.013466 0.43804,0.013466
              M 0 0 m -0.17245,-0.2153 c 0.23655,0.036826 0.44371,0.017694 0.44371,0.017694
            fill: none
      labels:
        margin: 1.4142
    ]

    def initialize(name, params)
      @name = name
      @params = YAML.load(PARAMS).deep_merge(params)
      radius = 0.5 * @params["diameter"]
      scaled_params = YAML.load(SCALING_PARAMS.gsub(/\-?\d\.\d+/) { |number| "%.5g" % (number.to_f * radius) })
      spot_radius = 0.5 * @params["spot-diameter"] if @params["spot-diameter"]
      scaled_params["control"]["symbol"] << { "circle" => { "r" => 0.5 * spot_radius, "stroke-width" => spot_radius, "fill" => "none" } } if spot_radius
      @params = scaled_params.deep_merge(@params)
      @path = Pathname.new(@params["path"]).expand_path
    end

    def types_waypoints
      raise BadLayerError.new("#{name} file not found at #{path}") unless path.exist?
      gps_waypoints = GPS.new(path).waypoints
      [ [ /\d{2,3}/, :control   ],
        [ /HH/,      :hashhouse ],
        [ /ANC/,     :anc       ],
        [ /W/,       :water     ],
      ].map do |selector, type|
        waypoints = gps_waypoints.map do |waypoint, name|
          [ waypoint, name[selector] ]
        end.select(&:last)
        [ type, waypoints ]
      end
    rescue BadGpxKmlFile => e
      raise BadLayerError.new("#{e.message} not a valid GPX or KML file")
    end

    def features
      types_waypoints.map do |type, waypoints|
        [ 0, CONFIG.map.coords_to_mm(CONFIG.map.reproject_from_wgs84(waypoints)), type ]
      end
    end

    def labels
      types_waypoints.reject do |type, waypoints|
        type == :water
      end.map do |type, waypoints|
        waypoints.map do |waypoint, label|
          [ 0, [ CONFIG.map.reproject_from_wgs84(waypoint) ], label, [ type, label ] ]
        end
      end.flatten(1)
    end
  end
end
