Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B66D855F53
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 04:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfFZC6W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 22:58:22 -0400
Received: from mga02.intel.com ([134.134.136.20]:8182 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbfFZC6W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 22:58:22 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 19:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,418,1557212400"; 
   d="gz'50?scan'50,208,50";a="163798692"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2019 19:58:14 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hfy8T-000HFj-W0; Wed, 26 Jun 2019 10:58:13 +0800
Date:   Wed, 26 Jun 2019 10:57:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi 14/14] drivers/spi/spi-pl022.c:1861:4:
 error: implicit declaration of function 'of_property_read_u32'; did you mean
 '__percpu_read_32'?
Message-ID: <201906261018.BDcL2pQs%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   d52781e8bf3600398a5da184d4df22072a8e5e57
commit: d52781e8bf3600398a5da184d4df22072a8e5e57 [14/14] slask
config: arm64-allyesconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d52781e8bf3600398a5da184d4df22072a8e5e57
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=arm64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/spi/spi-pl022.c:26:
   drivers/spi/spi-pl022.c: In function 'pl022_set_cs':
   drivers/spi/spi-pl022.c:451:22: error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
      tmp &= ~BIT(pl022->cur_cs);
                         ^
   include/linux/bits.h:6:28: note: in definition of macro 'BIT'
    #define BIT(nr)   (1UL << (nr))
                               ^~
   drivers/spi/spi-pl022.c:453:21: error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
      tmp |= BIT(pl022->cur_cs);
                        ^
   include/linux/bits.h:6:28: note: in definition of macro 'BIT'
    #define BIT(nr)   (1UL << (nr))
                               ^~
   drivers/spi/spi-pl022.c: In function 'giveback':
   drivers/spi/spi-pl022.c:502:4: error: implicit declaration of function 'pl022_cs_control'; did you mean 'pl022_set_cs'? [-Werror=implicit-function-declaration]
       pl022_cs_control(pl022, SSP_CHIP_DESELECT);
       ^~~~~~~~~~~~~~~~
       pl022_set_cs
   drivers/spi/spi-pl022.c: In function 'pl022_transfer_one_message':
   drivers/spi/spi-pl022.c:1580:9: error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
     pl022->cur_cs = pl022->chipselects[msg->spi->chip_select];
            ^~~~~~
            cur_msg
   drivers/spi/spi-pl022.c:1580:23: error: 'struct pl022' has no member named 'chipselects'
     pl022->cur_cs = pl022->chipselects[msg->spi->chip_select];
                          ^~
   drivers/spi/spi-pl022.c: In function 'pl022_setup':
>> drivers/spi/spi-pl022.c:1861:4: error: implicit declaration of function 'of_property_read_u32'; did you mean '__percpu_read_32'? [-Werror=implicit-function-declaration]
       of_property_read_u32(np, "pl022,interface",
       ^~~~~~~~~~~~~~~~~~~~
       __percpu_read_32
   drivers/spi/spi-pl022.c:1923:7: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
     if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
          ^~~~~~~~~~~~~
          uuid_is_valid
   drivers/spi/spi-pl022.c:1923:26: error: 'struct pl022' has no member named 'chipselects'
     if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
                             ^~
   drivers/spi/spi-pl022.c: In function 'pl022_platform_data_dt_get':
   drivers/spi/spi-pl022.c:2090:11: error: implicit declaration of function 'of_property_read_bool' [-Werror=implicit-function-declaration]
     pd->rt = of_property_read_bool(np, "pl022,rt");
              ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-pl022.c: In function 'pl022_probe':
   drivers/spi/spi-pl022.c:2134:7: error: 'struct pl022' has no member named 'chipselects'
     pl022->chipselects = devm_kcalloc(dev, num_cs, sizeof(int),
          ^~
   drivers/spi/spi-pl022.c:2136:12: error: 'struct pl022' has no member named 'chipselects'
     if (!pl022->chipselects) {
               ^~
   drivers/spi/spi-pl022.c:2146:8: warning: statement with no effect [-Wunused-value]
     master->use_gpio_descriptors;
     ~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-pl022.c:2159:9: error: 'struct pl022' has no member named 'chipselects'
       pl022->chipselects[i] = i;
            ^~
   drivers/spi/spi-pl022.c:2162:18: error: implicit declaration of function 'of_get_named_gpio'; did you mean 'fwnode_get_named_gpiod'? [-Werror=implicit-function-declaration]
       int cs_gpio = of_get_named_gpio(np, "cs-gpios", i);
                     ^~~~~~~~~~~~~~~~~
                     fwnode_get_named_gpiod
   drivers/spi/spi-pl022.c:2169:9: error: 'struct pl022' has no member named 'chipselects'
       pl022->chipselects[i] = cs_gpio;
            ^~
   drivers/spi/spi-pl022.c:2172:9: error: implicit declaration of function 'devm_gpio_request'; did you mean 'devm_gpiod_put'? [-Werror=implicit-function-declaration]
        if (devm_gpio_request(dev, cs_gpio, "ssp-pl022"))
            ^~~~~~~~~~~~~~~~~
            devm_gpiod_put
   drivers/spi/spi-pl022.c:2176:14: error: implicit declaration of function 'gpio_direction_output'; did you mean 'gpiod_direction_output'? [-Werror=implicit-function-declaration]
        else if (gpio_direction_output(cs_gpio, 1))
                 ^~~~~~~~~~~~~~~~~~~~~
                 gpiod_direction_output
   cc1: some warnings being treated as errors

vim +1861 drivers/spi/spi-pl022.c

f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1814  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1815  /**
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1816   * pl022_setup - setup function registered to SPI master framework
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1817   * @spi: spi device which is requesting setup
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1818   *
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1819   * This function is registered to the SPI framework for this SPI master
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1820   * controller. If it is the first time when setup is called by this device,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1821   * this function will initialize the runtime state for this chip and save
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1822   * the same in the device structure. Else it will update the runtime info
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1823   * with the updated chip info. Nothing is really being written to the
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1824   * controller hardware here, that is not done until the actual transfer
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1825   * commence.
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1826   */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1827  static int pl022_setup(struct spi_device *spi)
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1828  {
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1829  	struct pl022_config_chip const *chip_info;
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1830  	struct pl022_config_chip chip_info_dt;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1831  	struct chip_data *chip;
c4a478430 drivers/spi/spi-pl022.c  Jonas Aaberg             2011-02-28  1832  	struct ssp_clock_params clk_freq = { .cpsdvsr = 0, .scr = 0};
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1833  	int status = 0;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1834  	struct pl022 *pl022 = spi_master_get_devdata(spi->master);
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1835  	unsigned int bits = spi->bits_per_word;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1836  	u32 tmp;
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1837  	struct device_node *np = spi->dev.of_node;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1838  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1839  	if (!spi->max_speed_hz)
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1840  		return -EINVAL;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1841  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1842  	/* Get controller_state if one is supplied */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1843  	chip = spi_get_ctldata(spi);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1844  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1845  	if (chip == NULL) {
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1846  		chip = kzalloc(sizeof(struct chip_data), GFP_KERNEL);
77538f4a9 drivers/spi/spi-pl022.c  Jingoo Han               2014-04-29  1847  		if (!chip)
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1848  			return -ENOMEM;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1849  		dev_dbg(&spi->dev,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1850  			"allocated memory for controller's runtime state\n");
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1851  	}
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1852  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1853  	/* Get controller data if one is supplied */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1854  	chip_info = spi->controller_data;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1855  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1856  	if (chip_info == NULL) {
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1857  		if (np) {
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1858  			chip_info_dt = pl022_default_chip_info;
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1859  
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1860  			chip_info_dt.hierarchy = SSP_MASTER;
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22 @1861  			of_property_read_u32(np, "pl022,interface",
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1862  				&chip_info_dt.iface);
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1863  			of_property_read_u32(np, "pl022,com-mode",
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1864  				&chip_info_dt.com_mode);
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1865  			of_property_read_u32(np, "pl022,rx-level-trig",
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1866  				&chip_info_dt.rx_lev_trig);
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1867  			of_property_read_u32(np, "pl022,tx-level-trig",
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1868  				&chip_info_dt.tx_lev_trig);
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1869  			of_property_read_u32(np, "pl022,ctrl-len",
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1870  				&chip_info_dt.ctrl_len);
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1871  			of_property_read_u32(np, "pl022,wait-state",
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1872  				&chip_info_dt.wait_state);
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1873  			of_property_read_u32(np, "pl022,duplex",
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1874  				&chip_info_dt.duplex);
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1875  
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1876  			chip_info = &chip_info_dt;
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1877  		} else {
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1878  			chip_info = &pl022_default_chip_info;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1879  			/* spi_board_info.controller_data not is supplied */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1880  			dev_dbg(&spi->dev,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1881  				"using default controller_data settings\n");
6d3952a7d drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1882  		}
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1883  	} else
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1884  		dev_dbg(&spi->dev,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1885  			"using user supplied controller_data settings\n");
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1886  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1887  	/*
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1888  	 * We can override with custom divisors, else we use the board
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1889  	 * frequency setting
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1890  	 */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1891  	if ((0 == chip_info->clk_freq.cpsdvsr)
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1892  	    && (0 == chip_info->clk_freq.scr)) {
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1893  		status = calculate_effective_freq(pl022,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1894  						  spi->max_speed_hz,
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1895  						  &clk_freq);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1896  		if (status < 0)
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1897  			goto err_config_params;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1898  	} else {
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1899  		memcpy(&clk_freq, &chip_info->clk_freq, sizeof(clk_freq));
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1900  		if ((clk_freq.cpsdvsr % 2) != 0)
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1901  			clk_freq.cpsdvsr =
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1902  				clk_freq.cpsdvsr - 1;
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1903  	}
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1904  	if ((clk_freq.cpsdvsr < CPSDVR_MIN)
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1905  	    || (clk_freq.cpsdvsr > CPSDVR_MAX)) {
e3f88ae99 drivers/spi/amba-pl022.c Virupax Sadashivpetimath 2011-06-13  1906  		status = -EINVAL;
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1907  		dev_err(&spi->dev,
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1908  			"cpsdvsr is configured incorrectly\n");
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1909  		goto err_config_params;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1910  	}
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1911  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1912  	status = verify_controller_parameters(pl022, chip_info);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1913  	if (status) {
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1914  		dev_err(&spi->dev, "controller data is incorrect");
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1915  		goto err_config_params;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1916  	}
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1917  
083be3f05 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1918  	pl022->rx_lev_trig = chip_info->rx_lev_trig;
083be3f05 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1919  	pl022->tx_lev_trig = chip_info->tx_lev_trig;
083be3f05 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1920  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1921  	/* Now set controller state based on controller data */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1922  	chip->xfer_type = chip_info->com_mode;
f6f46de10 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1923  	if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1924  		dev_warn(&spi->dev,
f6f46de10 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1925  			 "invalid chip select\n");
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1926  
eb798c641 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1927  	/* Check bits per word with vendor specific range */
eb798c641 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1928  	if ((bits <= 3) || (bits > pl022->vendor->max_bpw)) {
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1929  		status = -ENOTSUPP;
eb798c641 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1930  		dev_err(&spi->dev, "illegal data size for this controller!\n");
eb798c641 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1931  		dev_err(&spi->dev, "This controller can only handle 4 <= n <= %d bit words\n",
eb798c641 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1932  				pl022->vendor->max_bpw);
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1933  		goto err_config_params;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1934  	} else if (bits <= 8) {
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1935  		dev_dbg(&spi->dev, "4 <= n <=8 bits per word\n");
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1936  		chip->n_bytes = 1;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1937  		chip->read = READING_U8;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1938  		chip->write = WRITING_U8;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1939  	} else if (bits <= 16) {
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1940  		dev_dbg(&spi->dev, "9 <= n <= 16 bits per word\n");
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1941  		chip->n_bytes = 2;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1942  		chip->read = READING_U16;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1943  		chip->write = WRITING_U16;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1944  	} else {
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1945  		dev_dbg(&spi->dev, "17 <= n <= 32 bits per word\n");
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1946  		chip->n_bytes = 4;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1947  		chip->read = READING_U32;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1948  		chip->write = WRITING_U32;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1949  	}
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1950  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1951  	/* Now Initialize all register settings required for this chip */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1952  	chip->cr0 = 0;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1953  	chip->cr1 = 0;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1954  	chip->dmacr = 0;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1955  	chip->cpsr = 0;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1956  	if ((chip_info->com_mode == DMA_TRANSFER)
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1957  	    && ((pl022->master_info)->enable_dma)) {
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1958  		chip->enable_dma = true;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1959  		dev_dbg(&spi->dev, "DMA mode set in controller state\n");
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1960  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_ENABLED,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1961  			       SSP_DMACR_MASK_RXDMAE, 0);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1962  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_ENABLED,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1963  			       SSP_DMACR_MASK_TXDMAE, 1);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1964  	} else {
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1965  		chip->enable_dma = false;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1966  		dev_dbg(&spi->dev, "DMA mode NOT set in controller state\n");
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1967  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_DISABLED,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1968  			       SSP_DMACR_MASK_RXDMAE, 0);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1969  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_DISABLED,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1970  			       SSP_DMACR_MASK_TXDMAE, 1);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1971  	}
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1972  
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1973  	chip->cpsr = clk_freq.cpsdvsr;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1974  
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1975  	/* Special setup for the ST micro extended control registers */
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1976  	if (pl022->vendor->extended_cr) {
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1977  		u32 etx;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1978  
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1979  		if (pl022->vendor->pl023) {
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1980  			/* These bits are only in the PL023 */
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1981  			SSP_WRITE_BITS(chip->cr1, chip_info->clkdelay,
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1982  				       SSP_CR1_MASK_FBCLKDEL_ST, 13);
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1983  		} else {
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1984  			/* These bits are in the PL022 but not PL023 */
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1985  			SSP_WRITE_BITS(chip->cr0, chip_info->duplex,
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1986  				       SSP_CR0_MASK_HALFDUP_ST, 5);
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1987  			SSP_WRITE_BITS(chip->cr0, chip_info->ctrl_len,
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1988  				       SSP_CR0_MASK_CSS_ST, 16);
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1989  			SSP_WRITE_BITS(chip->cr0, chip_info->iface,
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1990  				       SSP_CR0_MASK_FRF_ST, 21);
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1991  			SSP_WRITE_BITS(chip->cr1, chip_info->wait_state,
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1992  				       SSP_CR1_MASK_MWAIT_ST, 6);
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1993  		}
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1994  		SSP_WRITE_BITS(chip->cr0, bits - 1,
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1995  			       SSP_CR0_MASK_DSS_ST, 0);
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1996  
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1997  		if (spi->mode & SPI_LSB_FIRST) {
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1998  			tmp = SSP_RX_LSB;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1999  			etx = SSP_TX_LSB;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2000  		} else {
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2001  			tmp = SSP_RX_MSB;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2002  			etx = SSP_TX_MSB;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2003  		}
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2004  		SSP_WRITE_BITS(chip->cr1, tmp, SSP_CR1_MASK_RENDN_ST, 4);
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2005  		SSP_WRITE_BITS(chip->cr1, etx, SSP_CR1_MASK_TENDN_ST, 5);
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2006  		SSP_WRITE_BITS(chip->cr1, chip_info->rx_lev_trig,
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2007  			       SSP_CR1_MASK_RXIFLSEL_ST, 7);
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2008  		SSP_WRITE_BITS(chip->cr1, chip_info->tx_lev_trig,
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2009  			       SSP_CR1_MASK_TXIFLSEL_ST, 10);
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2010  	} else {
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2011  		SSP_WRITE_BITS(chip->cr0, bits - 1,
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2012  			       SSP_CR0_MASK_DSS, 0);
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2013  		SSP_WRITE_BITS(chip->cr0, chip_info->iface,
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2014  			       SSP_CR0_MASK_FRF, 4);
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2015  	}
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2016  
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2017  	/* Stuff that is common for all versions */
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2018  	if (spi->mode & SPI_CPOL)
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2019  		tmp = SSP_CLK_POL_IDLE_HIGH;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2020  	else
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2021  		tmp = SSP_CLK_POL_IDLE_LOW;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2022  	SSP_WRITE_BITS(chip->cr0, tmp, SSP_CR0_MASK_SPO, 6);
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2023  
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2024  	if (spi->mode & SPI_CPHA)
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2025  		tmp = SSP_CLK_SECOND_EDGE;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2026  	else
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2027  		tmp = SSP_CLK_FIRST_EDGE;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2028  	SSP_WRITE_BITS(chip->cr0, tmp, SSP_CR0_MASK_SPH, 7);
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2029  
f9d629c73 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  2030  	SSP_WRITE_BITS(chip->cr0, clk_freq.scr, SSP_CR0_MASK_SCR, 8);
781c7b129 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2031  	/* Loopback is available on all versions except PL023 */
06fb01fd1 drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2032  	if (pl022->vendor->loopback) {
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2033  		if (spi->mode & SPI_LOOP)
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2034  			tmp = LOOPBACK_ENABLED;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2035  		else
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2036  			tmp = LOOPBACK_DISABLED;
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2037  		SSP_WRITE_BITS(chip->cr1, tmp, SSP_CR1_MASK_LBM, 0);
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2038  	}
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2039  	SSP_WRITE_BITS(chip->cr1, SSP_DISABLED, SSP_CR1_MASK_SSE, 1);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2040  	SSP_WRITE_BITS(chip->cr1, chip_info->hierarchy, SSP_CR1_MASK_MS, 2);
f1e45f86e drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2041  	SSP_WRITE_BITS(chip->cr1, chip_info->slave_tx_disable, SSP_CR1_MASK_SOD,
f1e45f86e drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2042  		3);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2043  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2044  	/* Save controller_state */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2045  	spi_set_ctldata(spi, chip);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2046  	return status;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2047   err_config_params:
bde435a9c drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2048  	spi_set_ctldata(spi, NULL);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2049  	kfree(chip);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2050  	return status;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2051  }
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2052  

:::::: The code at line 1861 was first introduced by commit
:::::: 6d3952a7dfa80919842bbe01ac7f693d40a1eb84 spi/pl022: Add devicetree support

:::::: TO: Roland Stigge <stigge@antcom.de>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--5mCyUwZo2JvN/JJP
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--5mCyUwZo2JvN/JJP--
