Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416A482B95
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 08:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731594AbfHFGZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 02:25:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:14034 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731560AbfHFGZC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Aug 2019 02:25:02 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Aug 2019 23:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; 
   d="gz'50?scan'50,208,50";a="349328508"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Aug 2019 23:24:56 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hustz-0001fM-IB; Tue, 06 Aug 2019 14:24:55 +0800
Date:   Tue, 6 Aug 2019 14:24:49 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi 5/5] drivers/spi/spi-pl022.c:1852:4:
 error: implicit declaration of function 'of_property_read_u32'; did you mean
 '__percpu_read_32'?
Message-ID: <201908061432.jfO66Jml%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vptprnikkplczen3"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--vptprnikkplczen3
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   6e5614b6476001adb8ce6e2859bc2ca0a4339398
commit: 6e5614b6476001adb8ce6e2859bc2ca0a4339398 [5/5] slask
config: arm64-allmodconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6e5614b6476001adb8ce6e2859bc2ca0a4339398
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=arm64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/spi/spi-pl022.c:17:
   drivers/spi/spi-pl022.c: In function 'pl022_set_cs':
   drivers/spi/spi-pl022.c:442:22: error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
      tmp &= ~BIT(pl022->cur_cs);
                         ^
   include/linux/bits.h:8:30: note: in definition of macro 'BIT'
    #define BIT(nr)   (UL(1) << (nr))
                                 ^~
   drivers/spi/spi-pl022.c:444:21: error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
      tmp |= BIT(pl022->cur_cs);
                        ^
   include/linux/bits.h:8:30: note: in definition of macro 'BIT'
    #define BIT(nr)   (UL(1) << (nr))
                                 ^~
   drivers/spi/spi-pl022.c: In function 'giveback':
   drivers/spi/spi-pl022.c:493:4: error: implicit declaration of function 'pl022_cs_control'; did you mean 'pl022_set_cs'? [-Werror=implicit-function-declaration]
       pl022_cs_control(pl022, SSP_CHIP_DESELECT);
       ^~~~~~~~~~~~~~~~
       pl022_set_cs
   drivers/spi/spi-pl022.c: In function 'pl022_transfer_one_message':
   drivers/spi/spi-pl022.c:1571:9: error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
     pl022->cur_cs = pl022->chipselects[msg->spi->chip_select];
            ^~~~~~
            cur_msg
   drivers/spi/spi-pl022.c:1571:23: error: 'struct pl022' has no member named 'chipselects'
     pl022->cur_cs = pl022->chipselects[msg->spi->chip_select];
                          ^~
   drivers/spi/spi-pl022.c: In function 'pl022_setup':
>> drivers/spi/spi-pl022.c:1852:4: error: implicit declaration of function 'of_property_read_u32'; did you mean '__percpu_read_32'? [-Werror=implicit-function-declaration]
       of_property_read_u32(np, "pl022,interface",
       ^~~~~~~~~~~~~~~~~~~~
       __percpu_read_32
   drivers/spi/spi-pl022.c:1914:7: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
     if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
          ^~~~~~~~~~~~~
          uuid_is_valid
   drivers/spi/spi-pl022.c:1914:26: error: 'struct pl022' has no member named 'chipselects'
     if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
                             ^~
   drivers/spi/spi-pl022.c: In function 'pl022_platform_data_dt_get':
   drivers/spi/spi-pl022.c:2081:11: error: implicit declaration of function 'of_property_read_bool' [-Werror=implicit-function-declaration]
     pd->rt = of_property_read_bool(np, "pl022,rt");
              ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-pl022.c: In function 'pl022_probe':
   drivers/spi/spi-pl022.c:2125:7: error: 'struct pl022' has no member named 'chipselects'
     pl022->chipselects = devm_kcalloc(dev, num_cs, sizeof(int),
          ^~
   drivers/spi/spi-pl022.c:2127:12: error: 'struct pl022' has no member named 'chipselects'
     if (!pl022->chipselects) {
               ^~
   drivers/spi/spi-pl022.c:2137:8: warning: statement with no effect [-Wunused-value]
     master->use_gpio_descriptors;
     ~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-pl022.c:2150:9: error: 'struct pl022' has no member named 'chipselects'
       pl022->chipselects[i] = i;
            ^~
   drivers/spi/spi-pl022.c:2153:18: error: implicit declaration of function 'of_get_named_gpio'; did you mean 'fwnode_get_named_gpiod'? [-Werror=implicit-function-declaration]
       int cs_gpio = of_get_named_gpio(np, "cs-gpios", i);
                     ^~~~~~~~~~~~~~~~~
                     fwnode_get_named_gpiod
   drivers/spi/spi-pl022.c:2160:9: error: 'struct pl022' has no member named 'chipselects'
       pl022->chipselects[i] = cs_gpio;
            ^~
   drivers/spi/spi-pl022.c:2163:9: error: implicit declaration of function 'devm_gpio_request'; did you mean 'devm_gpiod_put'? [-Werror=implicit-function-declaration]
        if (devm_gpio_request(dev, cs_gpio, "ssp-pl022"))
            ^~~~~~~~~~~~~~~~~
            devm_gpiod_put
   drivers/spi/spi-pl022.c:2167:14: error: implicit declaration of function 'gpio_direction_output'; did you mean 'gpiod_direction_output'? [-Werror=implicit-function-declaration]
        else if (gpio_direction_output(cs_gpio, 1))
                 ^~~~~~~~~~~~~~~~~~~~~
                 gpiod_direction_output
   cc1: some warnings being treated as errors

vim +1852 drivers/spi/spi-pl022.c

f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1805  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1806  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1807   * pl022_setup - setup function registered to SPI master framework
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1808   * @spi: spi device which is requesting setup
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1809   *
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1810   * This function is registered to the SPI framework for this SPI master
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1811   * controller. If it is the first time when setup is called by this device,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1812   * this function will initialize the runtime state for this chip and save
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1813   * the same in the device structure. Else it will update the runtime info
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1814   * with the updated chip info. Nothing is really being written to the
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1815   * controller hardware here, that is not done until the actual transfer
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1816   * commence.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1817   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1818  static int pl022_setup(struct spi_device *spi)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1819  {
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1820  	struct pl022_config_chip const *chip_info;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1821  	struct pl022_config_chip chip_info_dt;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1822  	struct chip_data *chip;
c4a4784308f5cb8 drivers/spi/spi-pl022.c  Jonas Aaberg             2011-02-28  1823  	struct ssp_clock_params clk_freq = { .cpsdvsr = 0, .scr = 0};
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1824  	int status = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1825  	struct pl022 *pl022 = spi_master_get_devdata(spi->master);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1826  	unsigned int bits = spi->bits_per_word;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1827  	u32 tmp;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1828  	struct device_node *np = spi->dev.of_node;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1829  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1830  	if (!spi->max_speed_hz)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1831  		return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1832  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1833  	/* Get controller_state if one is supplied */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1834  	chip = spi_get_ctldata(spi);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1835  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1836  	if (chip == NULL) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1837  		chip = kzalloc(sizeof(struct chip_data), GFP_KERNEL);
77538f4a98dc542 drivers/spi/spi-pl022.c  Jingoo Han               2014-04-29  1838  		if (!chip)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1839  			return -ENOMEM;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1840  		dev_dbg(&spi->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1841  			"allocated memory for controller's runtime state\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1842  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1843  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1844  	/* Get controller data if one is supplied */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1845  	chip_info = spi->controller_data;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1846  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1847  	if (chip_info == NULL) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1848  		if (np) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1849  			chip_info_dt = pl022_default_chip_info;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1850  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1851  			chip_info_dt.hierarchy = SSP_MASTER;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22 @1852  			of_property_read_u32(np, "pl022,interface",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1853  				&chip_info_dt.iface);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1854  			of_property_read_u32(np, "pl022,com-mode",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1855  				&chip_info_dt.com_mode);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1856  			of_property_read_u32(np, "pl022,rx-level-trig",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1857  				&chip_info_dt.rx_lev_trig);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1858  			of_property_read_u32(np, "pl022,tx-level-trig",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1859  				&chip_info_dt.tx_lev_trig);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1860  			of_property_read_u32(np, "pl022,ctrl-len",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1861  				&chip_info_dt.ctrl_len);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1862  			of_property_read_u32(np, "pl022,wait-state",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1863  				&chip_info_dt.wait_state);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1864  			of_property_read_u32(np, "pl022,duplex",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1865  				&chip_info_dt.duplex);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1866  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1867  			chip_info = &chip_info_dt;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1868  		} else {
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1869  			chip_info = &pl022_default_chip_info;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1870  			/* spi_board_info.controller_data not is supplied */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1871  			dev_dbg(&spi->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1872  				"using default controller_data settings\n");
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1873  		}
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1874  	} else
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1875  		dev_dbg(&spi->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1876  			"using user supplied controller_data settings\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1877  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1878  	/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1879  	 * We can override with custom divisors, else we use the board
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1880  	 * frequency setting
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1881  	 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1882  	if ((0 == chip_info->clk_freq.cpsdvsr)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1883  	    && (0 == chip_info->clk_freq.scr)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1884  		status = calculate_effective_freq(pl022,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1885  						  spi->max_speed_hz,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1886  						  &clk_freq);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1887  		if (status < 0)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1888  			goto err_config_params;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1889  	} else {
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1890  		memcpy(&clk_freq, &chip_info->clk_freq, sizeof(clk_freq));
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1891  		if ((clk_freq.cpsdvsr % 2) != 0)
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1892  			clk_freq.cpsdvsr =
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1893  				clk_freq.cpsdvsr - 1;
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1894  	}
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1895  	if ((clk_freq.cpsdvsr < CPSDVR_MIN)
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1896  	    || (clk_freq.cpsdvsr > CPSDVR_MAX)) {
e3f88ae99609205 drivers/spi/amba-pl022.c Virupax Sadashivpetimath 2011-06-13  1897  		status = -EINVAL;
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1898  		dev_err(&spi->dev,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1899  			"cpsdvsr is configured incorrectly\n");
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1900  		goto err_config_params;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1901  	}
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1902  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1903  	status = verify_controller_parameters(pl022, chip_info);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1904  	if (status) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1905  		dev_err(&spi->dev, "controller data is incorrect");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1906  		goto err_config_params;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1907  	}
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1908  
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1909  	pl022->rx_lev_trig = chip_info->rx_lev_trig;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1910  	pl022->tx_lev_trig = chip_info->tx_lev_trig;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1911  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1912  	/* Now set controller state based on controller data */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1913  	chip->xfer_type = chip_info->com_mode;
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1914  	if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1915  		dev_warn(&spi->dev,
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1916  			 "invalid chip select\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1917  
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1918  	/* Check bits per word with vendor specific range */
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1919  	if ((bits <= 3) || (bits > pl022->vendor->max_bpw)) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1920  		status = -ENOTSUPP;
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1921  		dev_err(&spi->dev, "illegal data size for this controller!\n");
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1922  		dev_err(&spi->dev, "This controller can only handle 4 <= n <= %d bit words\n",
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1923  				pl022->vendor->max_bpw);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1924  		goto err_config_params;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1925  	} else if (bits <= 8) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1926  		dev_dbg(&spi->dev, "4 <= n <=8 bits per word\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1927  		chip->n_bytes = 1;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1928  		chip->read = READING_U8;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1929  		chip->write = WRITING_U8;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1930  	} else if (bits <= 16) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1931  		dev_dbg(&spi->dev, "9 <= n <= 16 bits per word\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1932  		chip->n_bytes = 2;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1933  		chip->read = READING_U16;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1934  		chip->write = WRITING_U16;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1935  	} else {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1936  		dev_dbg(&spi->dev, "17 <= n <= 32 bits per word\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1937  		chip->n_bytes = 4;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1938  		chip->read = READING_U32;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1939  		chip->write = WRITING_U32;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1940  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1941  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1942  	/* Now Initialize all register settings required for this chip */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1943  	chip->cr0 = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1944  	chip->cr1 = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1945  	chip->dmacr = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1946  	chip->cpsr = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1947  	if ((chip_info->com_mode == DMA_TRANSFER)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1948  	    && ((pl022->master_info)->enable_dma)) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1949  		chip->enable_dma = true;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1950  		dev_dbg(&spi->dev, "DMA mode set in controller state\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1951  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_ENABLED,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1952  			       SSP_DMACR_MASK_RXDMAE, 0);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1953  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_ENABLED,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1954  			       SSP_DMACR_MASK_TXDMAE, 1);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1955  	} else {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1956  		chip->enable_dma = false;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1957  		dev_dbg(&spi->dev, "DMA mode NOT set in controller state\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1958  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_DISABLED,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1959  			       SSP_DMACR_MASK_RXDMAE, 0);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1960  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_DISABLED,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1961  			       SSP_DMACR_MASK_TXDMAE, 1);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1962  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1963  
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1964  	chip->cpsr = clk_freq.cpsdvsr;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1965  
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1966  	/* Special setup for the ST micro extended control registers */
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1967  	if (pl022->vendor->extended_cr) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1968  		u32 etx;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1969  
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1970  		if (pl022->vendor->pl023) {
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1971  			/* These bits are only in the PL023 */
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1972  			SSP_WRITE_BITS(chip->cr1, chip_info->clkdelay,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1973  				       SSP_CR1_MASK_FBCLKDEL_ST, 13);
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1974  		} else {
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1975  			/* These bits are in the PL022 but not PL023 */
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1976  			SSP_WRITE_BITS(chip->cr0, chip_info->duplex,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1977  				       SSP_CR0_MASK_HALFDUP_ST, 5);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1978  			SSP_WRITE_BITS(chip->cr0, chip_info->ctrl_len,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1979  				       SSP_CR0_MASK_CSS_ST, 16);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1980  			SSP_WRITE_BITS(chip->cr0, chip_info->iface,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1981  				       SSP_CR0_MASK_FRF_ST, 21);
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1982  			SSP_WRITE_BITS(chip->cr1, chip_info->wait_state,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1983  				       SSP_CR1_MASK_MWAIT_ST, 6);
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1984  		}
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1985  		SSP_WRITE_BITS(chip->cr0, bits - 1,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1986  			       SSP_CR0_MASK_DSS_ST, 0);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1987  
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1988  		if (spi->mode & SPI_LSB_FIRST) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1989  			tmp = SSP_RX_LSB;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1990  			etx = SSP_TX_LSB;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1991  		} else {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1992  			tmp = SSP_RX_MSB;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1993  			etx = SSP_TX_MSB;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1994  		}
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1995  		SSP_WRITE_BITS(chip->cr1, tmp, SSP_CR1_MASK_RENDN_ST, 4);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1996  		SSP_WRITE_BITS(chip->cr1, etx, SSP_CR1_MASK_TENDN_ST, 5);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1997  		SSP_WRITE_BITS(chip->cr1, chip_info->rx_lev_trig,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1998  			       SSP_CR1_MASK_RXIFLSEL_ST, 7);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1999  		SSP_WRITE_BITS(chip->cr1, chip_info->tx_lev_trig,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2000  			       SSP_CR1_MASK_TXIFLSEL_ST, 10);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2001  	} else {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2002  		SSP_WRITE_BITS(chip->cr0, bits - 1,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2003  			       SSP_CR0_MASK_DSS, 0);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2004  		SSP_WRITE_BITS(chip->cr0, chip_info->iface,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2005  			       SSP_CR0_MASK_FRF, 4);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2006  	}
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2007  
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2008  	/* Stuff that is common for all versions */
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2009  	if (spi->mode & SPI_CPOL)
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2010  		tmp = SSP_CLK_POL_IDLE_HIGH;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2011  	else
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2012  		tmp = SSP_CLK_POL_IDLE_LOW;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2013  	SSP_WRITE_BITS(chip->cr0, tmp, SSP_CR0_MASK_SPO, 6);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2014  
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2015  	if (spi->mode & SPI_CPHA)
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2016  		tmp = SSP_CLK_SECOND_EDGE;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2017  	else
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2018  		tmp = SSP_CLK_FIRST_EDGE;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2019  	SSP_WRITE_BITS(chip->cr0, tmp, SSP_CR0_MASK_SPH, 7);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2020  
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  2021  	SSP_WRITE_BITS(chip->cr0, clk_freq.scr, SSP_CR0_MASK_SCR, 8);
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2022  	/* Loopback is available on all versions except PL023 */
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2023  	if (pl022->vendor->loopback) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2024  		if (spi->mode & SPI_LOOP)
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2025  			tmp = LOOPBACK_ENABLED;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2026  		else
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2027  			tmp = LOOPBACK_DISABLED;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2028  		SSP_WRITE_BITS(chip->cr1, tmp, SSP_CR1_MASK_LBM, 0);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2029  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2030  	SSP_WRITE_BITS(chip->cr1, SSP_DISABLED, SSP_CR1_MASK_SSE, 1);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2031  	SSP_WRITE_BITS(chip->cr1, chip_info->hierarchy, SSP_CR1_MASK_MS, 2);
f1e45f86ed93b9e drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2032  	SSP_WRITE_BITS(chip->cr1, chip_info->slave_tx_disable, SSP_CR1_MASK_SOD,
f1e45f86ed93b9e drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2033  		3);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2034  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2035  	/* Save controller_state */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2036  	spi_set_ctldata(spi, chip);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2037  	return status;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2038   err_config_params:
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2039  	spi_set_ctldata(spi, NULL);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2040  	kfree(chip);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2041  	return status;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2042  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2043  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2044  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2045   * pl022_cleanup - cleanup function registered to SPI master framework
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2046   * @spi: spi device which is requesting cleanup
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2047   *
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2048   * This function is registered to the SPI framework for this SPI master
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2049   * controller. It will free the runtime state of chip.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2050   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2051  static void pl022_cleanup(struct spi_device *spi)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2052  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2053  	struct chip_data *chip = spi_get_ctldata(spi);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2054  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2055  	spi_set_ctldata(spi, NULL);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2056  	kfree(chip);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2057  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2058  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2059  static struct pl022_ssp_controller *
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2060  pl022_platform_data_dt_get(struct device *dev)
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2061  {
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2062  	struct device_node *np = dev->of_node;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2063  	struct pl022_ssp_controller *pd;
849794c50b24b93 drivers/spi/spi-pl022.c  Rabin Vincent            2017-04-06  2064  	u32 tmp = 0;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2065  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2066  	if (!np) {
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2067  		dev_err(dev, "no dt node defined\n");
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2068  		return NULL;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2069  	}
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2070  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2071  	pd = devm_kzalloc(dev, sizeof(struct pl022_ssp_controller), GFP_KERNEL);
77538f4a98dc542 drivers/spi/spi-pl022.c  Jingoo Han               2014-04-29  2072  	if (!pd)
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2073  		return NULL;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2074  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2075  	pd->bus_id = -1;
dbd897b9c6fac8b drivers/spi/spi-pl022.c  Linus Walleij            2013-05-23  2076  	pd->enable_dma = 1;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2077  	of_property_read_u32(np, "num-cs", &tmp);
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2078  	pd->num_chipselect = tmp;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2079  	of_property_read_u32(np, "pl022,autosuspend-delay",
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2080  			     &pd->autosuspend_delay);
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2081  	pd->rt = of_property_read_bool(np, "pl022,rt");
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2082  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2083  	return pd;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2084  }
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2085  
fd4a319bc933ae9 drivers/spi/spi-pl022.c  Grant Likely             2012-12-07  2086  static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2087  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2088  	struct device *dev = &adev->dev;
8074cf063e410a2 drivers/spi/spi-pl022.c  Jingoo Han               2013-07-30  2089  	struct pl022_ssp_controller *platform_info =
8074cf063e410a2 drivers/spi/spi-pl022.c  Jingoo Han               2013-07-30  2090  			dev_get_platdata(&adev->dev);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2091  	struct spi_master *master;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2092  	struct pl022 *pl022 = NULL;	/*Data for this driver */
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2093  	struct device_node *np = adev->dev.of_node;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2094  	int status = 0, i, num_cs;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2095  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2096  	dev_info(&adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2097  		 "ARM PL022 driver, device ID: 0x%08x\n", adev->periphid);
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2098  	if (!platform_info && IS_ENABLED(CONFIG_OF))
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2099  		platform_info = pl022_platform_data_dt_get(dev);
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2100  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2101  	if (!platform_info) {
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2102  		dev_err(dev, "probe: no platform data defined\n");
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2103  		return -ENODEV;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2104  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2105  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2106  	if (platform_info->num_chipselect) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2107  		num_cs = platform_info->num_chipselect;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2108  	} else {
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2109  		dev_err(dev, "probe: no chip select defined\n");
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2110  		return -ENODEV;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2111  	}
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2112  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2113  	/* Allocate master with space for data */
b4b8482690d97ea drivers/spi/spi-pl022.c  Roland Stigge            2012-09-03  2114  	master = spi_alloc_master(dev, sizeof(struct pl022));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2115  	if (master == NULL) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2116  		dev_err(&adev->dev, "probe - cannot alloc SPI master\n");
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2117  		return -ENOMEM;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2118  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2119  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2120  	pl022 = spi_master_get_devdata(master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2121  	pl022->master = master;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2122  	pl022->master_info = platform_info;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2123  	pl022->adev = adev;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2124  	pl022->vendor = id->data;
a86854d0c599b32 drivers/spi/spi-pl022.c  Kees Cook                2018-06-12  2125  	pl022->chipselects = devm_kcalloc(dev, num_cs, sizeof(int),
b4b8482690d97ea drivers/spi/spi-pl022.c  Roland Stigge            2012-09-03  2126  					  GFP_KERNEL);
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2127  	if (!pl022->chipselects) {
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2128  		status = -ENOMEM;
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2129  		goto err_no_mem;
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2130  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2131  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2132  	/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2133  	 * Bus Number Which has been Assigned to this SSP controller
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2134  	 * on this board
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2135  	 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2136  	master->bus_num = platform_info->bus_id;
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  2137  	master->use_gpio_descriptors;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2138  	master->num_chipselect = num_cs;
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  2139  	master->set_cs = pl022_set_cs;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2140  	master->cleanup = pl022_cleanup;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2141  	master->setup = pl022_setup;
29b6e906a70a47c drivers/spi/spi-pl022.c  Mark Brown               2013-07-28  2142  	master->auto_runtime_pm = true;
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2143  	master->transfer_one_message = pl022_transfer_one_message;
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2144  	master->unprepare_transfer_hardware = pl022_unprepare_transfer_hardware;
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2145  	master->rt = platform_info->rt;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2146  	master->dev.of_node = dev->of_node;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2147  
516843702bb5fd8 drivers/spi/spi-pl022.c  Linus Walleij            2019-04-28  2148  	if (pl022->vendor->internal_cs_ctrl) {
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2149  		for (i = 0; i < num_cs; i++)
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2150  			pl022->chipselects[i] = i;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2151  	} else if (IS_ENABLED(CONFIG_OF)) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2152  		for (i = 0; i < num_cs; i++) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2153  			int cs_gpio = of_get_named_gpio(np, "cs-gpios", i);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2154  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2155  			if (cs_gpio == -EPROBE_DEFER) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2156  				status = -EPROBE_DEFER;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2157  				goto err_no_gpio;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2158  			}
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2159  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2160  			pl022->chipselects[i] = cs_gpio;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2161  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2162  			if (gpio_is_valid(cs_gpio)) {
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2163  				if (devm_gpio_request(dev, cs_gpio, "ssp-pl022"))
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2164  					dev_err(&adev->dev,
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2165  						"could not request %d gpio\n",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2166  						cs_gpio);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2167  				else if (gpio_direction_output(cs_gpio, 1))
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2168  					dev_err(&adev->dev,
61e89e65e31516c drivers/spi/spi-pl022.c  Roland Stigge            2014-09-09  2169  						"could not set gpio %d as output\n",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2170  						cs_gpio);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2171  			}
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2172  		}
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2173  	}
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2174  
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2175  	/*
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2176  	 * Supports mode 0-3, loopback, and active low CS. Transfers are
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2177  	 * always MS bit first on the original pl022.
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2178  	 */
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2179  	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LOOP;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2180  	if (pl022->vendor->extended_cr)
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2181  		master->mode_bits |= SPI_LSB_FIRST;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2182  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2183  	dev_dbg(&adev->dev, "BUSNO: %d\n", master->bus_num);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2184  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2185  	status = amba_request_regions(adev, NULL);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2186  	if (status)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2187  		goto err_no_ioregion;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2188  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2189  	pl022->phybase = adev->res.start;
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2190  	pl022->virtbase = devm_ioremap(dev, adev->res.start,
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2191  				       resource_size(&adev->res));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2192  	if (pl022->virtbase == NULL) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2193  		status = -ENOMEM;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2194  		goto err_no_ioremap;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2195  	}
2c067509a1e3540 drivers/spi/spi-pl022.c  Jingoo Han               2013-10-11  2196  	dev_info(&adev->dev, "mapped registers from %pa to %p\n",
7085f403517615c drivers/spi/spi-pl022.c  Fabio Estevam            2013-08-21  2197  		&adev->res.start, pl022->virtbase);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2198  
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2199  	pl022->clk = devm_clk_get(&adev->dev, NULL);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2200  	if (IS_ERR(pl022->clk)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2201  		status = PTR_ERR(pl022->clk);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2202  		dev_err(&adev->dev, "could not retrieve SSP/SPI bus clock\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2203  		goto err_no_clk;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2204  	}
7ff6bcf048e6a98 drivers/spi/spi-pl022.c  Russell King             2011-09-22  2205  
6cac167b826eced drivers/spi/spi-pl022.c  Ulf Hansson              2014-02-04  2206  	status = clk_prepare_enable(pl022->clk);
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2207  	if (status) {
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2208  		dev_err(&adev->dev, "could not enable SSP/SPI bus clock\n");
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2209  		goto err_no_clk_en;
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2210  	}
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2211  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2212  	/* Initialize transfer pump */
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2213  	tasklet_init(&pl022->pump_transfers, pump_transfers,
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2214  		     (unsigned long)pl022);
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2215  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2216  	/* Disable SSP */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2217  	writew((readw(SSP_CR1(pl022->virtbase)) & (~SSP_CR1_MASK_SSE)),
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2218  	       SSP_CR1(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2219  	load_ssp_default_config(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2220  
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2221  	status = devm_request_irq(dev, adev->irq[0], pl022_interrupt_handler,
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2222  				  0, "pl022", pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2223  	if (status < 0) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2224  		dev_err(&adev->dev, "probe - cannot get IRQ (%d)\n", status);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2225  		goto err_no_irq;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2226  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2227  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2228  	/* Get DMA channels, try autoconfiguration first */
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2229  	status = pl022_dma_autoprobe(pl022);
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  2230  	if (status == -EPROBE_DEFER) {
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  2231  		dev_dbg(dev, "deferring probe to get DMA channel\n");
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  2232  		goto err_no_irq;
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  2233  	}
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2234  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2235  	/* If that failed, use channels from platform_info */
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2236  	if (status == 0)
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2237  		platform_info->enable_dma = 1;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2238  	else if (platform_info->enable_dma) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2239  		status = pl022_dma_probe(pl022);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2240  		if (status != 0)
43c640157d4366a drivers/spi/amba-pl022.c Viresh Kumar             2011-05-16  2241  			platform_info->enable_dma = 0;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2242  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2243  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2244  	/* Register with the SPI framework */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2245  	amba_set_drvdata(adev, pl022);
35794a77168b739 drivers/spi/spi-pl022.c  Jingoo Han               2013-09-24  2246  	status = devm_spi_register_master(&adev->dev, master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2247  	if (status != 0) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2248  		dev_err(&adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2249  			"probe - problem registering spi master\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2250  		goto err_spi_register;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2251  	}
25985edcedea639 drivers/spi/amba-pl022.c Lucas De Marchi          2011-03-30  2252  	dev_dbg(dev, "probe succeeded\n");
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2253  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2254  	/* let runtime pm put suspend */
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2255  	if (platform_info->autosuspend_delay > 0) {
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2256  		dev_info(&adev->dev,
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2257  			"will use autosuspend for runtime pm, delay %dms\n",
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2258  			platform_info->autosuspend_delay);
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2259  		pm_runtime_set_autosuspend_delay(dev,
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2260  			platform_info->autosuspend_delay);
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2261  		pm_runtime_use_autosuspend(dev);
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2262  	}
0df349945752bf0 drivers/spi/spi-pl022.c  Ulf Hansson              2012-10-17  2263  	pm_runtime_put(dev);
0df349945752bf0 drivers/spi/spi-pl022.c  Ulf Hansson              2012-10-17  2264  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2265  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2266  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2267   err_spi_register:
3e3ea716270dc64 drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2268  	if (platform_info->enable_dma)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2269  		pl022_dma_remove(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2270   err_no_irq:
6cac167b826eced drivers/spi/spi-pl022.c  Ulf Hansson              2014-02-04  2271  	clk_disable_unprepare(pl022->clk);
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2272   err_no_clk_en:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2273   err_no_clk:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2274   err_no_ioremap:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2275  	amba_release_regions(adev);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2276   err_no_ioregion:
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2277   err_no_gpio:
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2278   err_no_mem:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2279  	spi_master_put(master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2280  	return status;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2281  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2282  
fd4a319bc933ae9 drivers/spi/spi-pl022.c  Grant Likely             2012-12-07  2283  static int
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2284  pl022_remove(struct amba_device *adev)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2285  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2286  	struct pl022 *pl022 = amba_get_drvdata(adev);
50658b6602dad6d drivers/spi/spi-pl022.c  Linus Walleij            2011-08-02  2287  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2288  	if (!pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2289  		return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2290  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2291  	/*
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2292  	 * undo pm_runtime_put() in probe.  I assume that we're not
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2293  	 * accessing the primecell here.
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2294  	 */
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2295  	pm_runtime_get_noresume(&adev->dev);
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2296  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2297  	load_ssp_default_config(pl022);
3e3ea716270dc64 drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2298  	if (pl022->master_info->enable_dma)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2299  		pl022_dma_remove(pl022);
3e3ea716270dc64 drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2300  
6cac167b826eced drivers/spi/spi-pl022.c  Ulf Hansson              2014-02-04  2301  	clk_disable_unprepare(pl022->clk);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2302  	amba_release_regions(adev);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2303  	tasklet_disable(&pl022->pump_transfers);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2304  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2305  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2306  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2307  #ifdef CONFIG_PM_SLEEP
6cfa6279edbffa9 drivers/spi/spi-pl022.c  Peter Hüwe               2011-09-05  2308  static int pl022_suspend(struct device *dev)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2309  {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2310  	struct pl022 *pl022 = dev_get_drvdata(dev);
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2311  	int ret;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2312  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2313  	ret = spi_master_suspend(pl022->master);
7c5d8a249acadc3 drivers/spi/spi-pl022.c  Geert Uytterhoeven       2018-09-05  2314  	if (ret)
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2315  		return ret;
4964a26df72c4a8 drivers/spi/spi-pl022.c  Ulf Hansson              2012-10-17  2316  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2317  	ret = pm_runtime_force_suspend(dev);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2318  	if (ret) {
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2319  		spi_master_resume(pl022->master);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2320  		return ret;
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2321  	}
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2322  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2323  	pinctrl_pm_select_sleep_state(dev);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2324  
6cfa6279edbffa9 drivers/spi/spi-pl022.c  Peter Hüwe               2011-09-05  2325  	dev_dbg(dev, "suspended\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2326  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2327  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2328  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2329  static int pl022_resume(struct device *dev)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2330  {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2331  	struct pl022 *pl022 = dev_get_drvdata(dev);
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2332  	int ret;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2333  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2334  	ret = pm_runtime_force_resume(dev);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2335  	if (ret)
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2336  		dev_err(dev, "problem resuming\n");
ada7aec7eec0ca2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2337  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2338  	/* Start the queue running */
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2339  	ret = spi_master_resume(pl022->master);
7c5d8a249acadc3 drivers/spi/spi-pl022.c  Geert Uytterhoeven       2018-09-05  2340  	if (!ret)
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2341  		dev_dbg(dev, "resumed\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2342  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2343  	return ret;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2344  }
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2345  #endif
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2346  
736198b0486c8d5 drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2347  #ifdef CONFIG_PM
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2348  static int pl022_runtime_suspend(struct device *dev)
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2349  {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2350  	struct pl022 *pl022 = dev_get_drvdata(dev);
4f5e1b370845a0a drivers/spi/spi-pl022.c  Patrice Chotard          2012-09-19  2351  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2352  	clk_disable_unprepare(pl022->clk);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2353  	pinctrl_pm_select_idle_state(dev);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2354  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2355  	return 0;
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2356  }
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2357  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2358  static int pl022_runtime_resume(struct device *dev)
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2359  {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2360  	struct pl022 *pl022 = dev_get_drvdata(dev);
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2361  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2362  	pinctrl_pm_select_default_state(dev);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2363  	clk_prepare_enable(pl022->clk);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2364  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2365  	return 0;
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2366  }
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2367  #endif
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2368  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2369  static const struct dev_pm_ops pl022_dev_pm_ops = {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2370  	SET_SYSTEM_SLEEP_PM_OPS(pl022_suspend, pl022_resume)
6ed23b806e73bdd drivers/spi/spi-pl022.c  Rafael J. Wysocki        2014-12-04  2371  	SET_RUNTIME_PM_OPS(pl022_runtime_suspend, pl022_runtime_resume, NULL)
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2372  };
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2373  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2374  static struct vendor_data vendor_arm = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2375  	.fifodepth = 8,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2376  	.max_bpw = 16,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2377  	.unidir = false,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2378  	.extended_cr = false,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2379  	.pl023 = false,
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2380  	.loopback = true,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2381  	.internal_cs_ctrl = false,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2382  };
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2383  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2384  static struct vendor_data vendor_st = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2385  	.fifodepth = 32,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2386  	.max_bpw = 32,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2387  	.unidir = false,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2388  	.extended_cr = true,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2389  	.pl023 = false,
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2390  	.loopback = true,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2391  	.internal_cs_ctrl = false,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2392  };
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2393  
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2394  static struct vendor_data vendor_st_pl023 = {
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2395  	.fifodepth = 32,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2396  	.max_bpw = 32,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2397  	.unidir = false,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2398  	.extended_cr = true,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2399  	.pl023 = true,
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2400  	.loopback = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2401  	.internal_cs_ctrl = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2402  };
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2403  
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2404  static struct vendor_data vendor_lsi = {
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2405  	.fifodepth = 8,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2406  	.max_bpw = 16,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2407  	.unidir = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2408  	.extended_cr = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2409  	.pl023 = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2410  	.loopback = true,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2411  	.internal_cs_ctrl = true,
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2412  };
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2413  
5b8d5ad2308d2d5 drivers/spi/spi-pl022.c  Arvind Yadav             2017-08-23  2414  static const struct amba_id pl022_ids[] = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2415  	{
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2416  		/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2417  		 * ARM PL022 variant, this has a 16bit wide
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2418  		 * and 8 locations deep TX/RX FIFO
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2419  		 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2420  		.id	= 0x00041022,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2421  		.mask	= 0x000fffff,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2422  		.data	= &vendor_arm,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2423  	},
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2424  	{
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2425  		/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2426  		 * ST Micro derivative, this has 32bit wide
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2427  		 * and 32 locations deep TX/RX FIFO
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2428  		 */
e89e04fcdce6146 drivers/spi/amba-pl022.c Srinidhi Kasagar         2009-10-05  2429  		.id	= 0x01080022,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2430  		.mask	= 0xffffffff,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2431  		.data	= &vendor_st,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2432  	},
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2433  	{
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2434  		/*
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2435  		 * ST-Ericsson derivative "PL023" (this is not
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2436  		 * an official ARM number), this is a PL022 SSP block
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2437  		 * stripped to SPI mode only, it has 32bit wide
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2438  		 * and 32 locations deep TX/RX FIFO but no extended
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2439  		 * CR0/CR1 register
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2440  		 */
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2441  		.id	= 0x00080023,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2442  		.mask	= 0xffffffff,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2443  		.data	= &vendor_st_pl023,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2444  	},
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2445  	{
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2446  		/*
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2447  		 * PL022 variant that has a chip select control register whih
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2448  		 * allows control of 5 output signals nCS[0:4].
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2449  		 */
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2450  		.id	= 0x000b6022,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2451  		.mask	= 0x000fffff,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2452  		.data	= &vendor_lsi,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2453  	},
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2454  	{ 0, 0 },
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2455  };
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2456  
7eeac71b9fc9b3d drivers/spi/spi-pl022.c  Dave Martin              2011-10-05  2457  MODULE_DEVICE_TABLE(amba, pl022_ids);
7eeac71b9fc9b3d drivers/spi/spi-pl022.c  Dave Martin              2011-10-05  2458  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2459  static struct amba_driver pl022_driver = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2460  	.drv = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2461  		.name	= "ssp-pl022",
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2462  		.pm	= &pl022_dev_pm_ops,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2463  	},
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2464  	.id_table	= pl022_ids,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2465  	.probe		= pl022_probe,
fd4a319bc933ae9 drivers/spi/spi-pl022.c  Grant Likely             2012-12-07  2466  	.remove		= pl022_remove,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2467  };
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2468  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2469  static int __init pl022_init(void)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2470  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2471  	return amba_driver_register(&pl022_driver);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2472  }
25c8e03bdb769df drivers/spi/amba-pl022.c Linus Walleij            2010-09-06  2473  subsys_initcall(pl022_init);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2474  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2475  static void __exit pl022_exit(void)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2476  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2477  	amba_driver_unregister(&pl022_driver);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2478  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2479  module_exit(pl022_exit);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2480  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2481  MODULE_AUTHOR("Linus Walleij <linus.walleij@stericsson.com>");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2482  MODULE_DESCRIPTION("PL022 SSP Controller Driver");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2483  MODULE_LICENSE("GPL");

:::::: The code at line 1852 was first introduced by commit
:::::: 6d3952a7dfa80919842bbe01ac7f693d40a1eb84 spi/pl022: Add devicetree support

:::::: TO: Roland Stigge <stigge@antcom.de>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--vptprnikkplczen3
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
DHilkpYrBAA=

--vptprnikkplczen3--
