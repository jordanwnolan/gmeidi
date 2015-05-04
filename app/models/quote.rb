require_relative '../../config/constants'
require_relative '../../config/utils'

class Quote
  @@QUOTES = [
      [[228.70, 313.30], [150.08, 204.61], [126.90, 172.80]],
      [[240.94, 329.72], [157.64, 214.86], [133.29, 181.47]],
      [[253.64, 326.87], [166.08, 226.23], [140.36, 190.99]],
      [[268.93, 366.81], [176.10, 239.45], [148.99, 202.39]],
      [[284.94, 387.76], [187.32, 254.16], [158.81, 215.28]],
      [[302.26, 410.27], [199.06, 269.60], [169.42, 229.27]],
      [[319.92, 433.27], [211.96, 287.47], [181.07, 244.53]],
      [[338.80, 457.69], [225.31, 303.96], [193.06, 260.27]],
      [[355.89, 480.42], [238.18, 321.11], [204.54, 275.58]],
      [[373.40, 503.66], [251.31, 338.58], [216.17, 291.07]],
      [[391.20, 527.22], [264.82, 356.50], [227.85, 306.54]],
      [[409.10, 550.85], [278.26, 374.29], [239.12, 321.47]],
      [[426.72, 574.08], [291.73, 392.06], [250.01, 335.82]],
      [[444.89, 597.17], [306.48, 411.02], [261.56, 350.59]],
      [[463.86, 621.21], [321.33, 429.97], [272.80, 364.86]],
      [[483.34, 645.77], [336.26, 448.91], [283.87, 378.79]],
      [[503.25, 670.76], [351.42, 468.04], [294.93, 392.62]],
      [[523.38, 695.85], [366.90, 487.46], [306.01, 406.36]],
      [[417.03, 594.26], [293.94, 418.41], [243.85, 346.86]],
      [[427.68, 609.47], [303.18, 431.61], [250.02, 366.67]],
      [[437.88, 624.05], [312.78, 445.33], [256.50, 364.93]],
      [[447.58, 637.89], [322.75, 459.57], [263.27, 374.59]],
      [[456.78, 651.04], [333.34, 474.71], [270.72, 385.24]],
      [[465.52, 663.54], [344.37, 490.46], [278.59, 396.49]],
      [[474.12, 675.82], [355.86, 506.87], [286.84, 408.27]]
    ]

  @@FINAL_YEAR_QUOTES = [
                          [[116.30], [76.20], [64.70]],
                          [[121.88],[79.80],[67.74]],
                          [[127.80],[83.71],[71.02]],
                          [[134.01],[87.96],[74.69]],
                          [[140.59],[92.62],[78.79]],
                          [[147.51],[97.55],[83.30]],
                          [[154.63],[102.84],[88.12]],
                          [[162.02],[108.37],[93.12]],
                          [[169.54],[114.08],[98.23]],
                          [[177.19],[119.86],[103.36]],
                          [[184.85],[125.73],[108.44]],
                          [[192.50],[131.54],[113.30]],
                          [[199.94],[137.28],[117.91]],
                          [[206.55],[142.88],[122.21]],
                          [[213.31],[148.35],[126.24]],
                          [[220.08],[153.70],[130.05]],
                          [[226.85],[158.99],[133.74]],
                          [[233.47],[164.25],[137.31]],
                          [[239.80],[169.46],[140.84]],
                          [[245.89],[174.74],[144.37]],
                          [[251.72],[180.23],[148.07]],
                          [[257.26],[185.93],[151.94]],
                          [[262.52],[191.98],[156.20]],
                          [[267.51],[198.28],[160.70]],
                          [[272.43],[204.85],[165.41]]
                        ]

  def self.get_quotes(params)
    p params
    if params[:is_final_year]
      @@FINAL_YEAR_QUOTES[Utils::get_age(params[:age])][Utils::get_level(params[:level])]
    else
      @@QUOTES[Utils::get_age(params[:age])][Utils::get_level(params[:level])]
    end
  end

  attr_reader :email, :amount
  attr_accessor :payout_choice

  def initialize(params)
    @email = params[:email]
    @amounts = self.class.get_quotes(params)
  end

  def to_json
    { amounts: @amounts }.to_json
  end
end