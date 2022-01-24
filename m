Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098D3497ACF
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 09:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242507AbiAXI4j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 03:56:39 -0500
Received: from mga03.intel.com ([134.134.136.65]:18313 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242505AbiAXI4i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jan 2022 03:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643014598; x=1674550598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8KWZWe8Dnwx+WCvocNmPzE0rw+O2BB2c35CaycEx1Js=;
  b=mWLat2WAIVS0yRYGcp2WRbaW0kSFqpJJzk7qShLT2sqGMUIUL+p9to4b
   RYyKhM+qc4END3YKq1tLMKUcsb9s3mPkoC2+zVidbIt2iv7erKSP+YJGP
   18WIIcrM0hIXXd3bpFMO/ZQ08/NrrYPiQ6/IBNh3SMPeBUJodC5CKiG3e
   9NumidtmJj5P4sxSJWTKB7IEohO0Zcd8Q+eaJehkKYSDYIcL7ef0aDuGc
   dssLm06cYfXaGN9+IKofZIrG4bGdPD8ftcwPQbWXCwWCMljcig5Edwq9b
   TrQIcFtcE1qiNI4e9px5PCUSshrqyIEatcUe6zGmhEJRNYxyYlPP8HLV3
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="245944851"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="245944851"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 00:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="617168099"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2022 00:56:26 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nBv9E-000I3p-GW; Mon, 24 Jan 2022 08:56:24 +0000
Date:   Mon, 24 Jan 2022 16:56:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-spi 10/10]
 drivers/spi/spi-st-ssc4.c:176:17: error: no member named 'cs_gpio' in
 'struct spi_device'; did you mean 'cs_gpiod'?
Message-ID: <202201241627.wcbRmB9C-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   b91ec14d0a206a5f58d8df605e7b5fe31a62a7ea
commit: b91ec14d0a206a5f58d8df605e7b5fe31a62a7ea [10/10] spi: Retire legacy GPIO handling
config: hexagon-randconfig-r045-20220124 (https://download.01.org/0day-ci/archive/20220124/202201241627.wcbRmB9C-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9006bf424847bf91f0a624ffc27ad165c7b804c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=b91ec14d0a206a5f58d8df605e7b5fe31a62a7ea
        git remote add linusw-gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
        git fetch --no-tags linusw-gpio gpio-descriptors-spi
        git checkout b91ec14d0a206a5f58d8df605e7b5fe31a62a7ea
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/spi/spi-st-ssc4.c:176:17: error: no member named 'cs_gpio' in 'struct spi_device'; did you mean 'cs_gpiod'?
           gpio_free(spi->cs_gpio);
                          ^~~~~~~
                          cs_gpiod
   include/linux/spi/spi.h:185:20: note: 'cs_gpiod' declared here
           struct gpio_desc        *cs_gpiod;      /* chip select gpio desc */
                                    ^
   drivers/spi/spi-st-ssc4.c:186:16: error: no member named 'cs_gpio' in 'struct spi_device'; did you mean 'cs_gpiod'?
           int cs = spi->cs_gpio;
                         ^~~~~~~
                         cs_gpiod
   include/linux/spi/spi.h:185:20: note: 'cs_gpiod' declared here
           struct gpio_desc        *cs_gpiod;      /* chip select gpio desc */
                                    ^
>> drivers/spi/spi-st-ssc4.c:186:6: warning: incompatible pointer to integer conversion initializing 'int' with an expression of type 'struct gpio_desc *' [-Wint-conversion]
           int cs = spi->cs_gpio;
               ^    ~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +176 drivers/spi/spi-st-ssc4.c

9e862375c5420a3 Lee Jones 2014-12-09  173  
9e862375c5420a3 Lee Jones 2014-12-09  174  static void spi_st_cleanup(struct spi_device *spi)
9e862375c5420a3 Lee Jones 2014-12-09  175  {
42531686639d6a3 Axel Lin  2016-06-05 @176  	gpio_free(spi->cs_gpio);
9e862375c5420a3 Lee Jones 2014-12-09  177  }
9e862375c5420a3 Lee Jones 2014-12-09  178  
9e862375c5420a3 Lee Jones 2014-12-09  179  /* the spi->mode bits understood by this driver: */
9e862375c5420a3 Lee Jones 2014-12-09  180  #define MODEBITS  (SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST | SPI_LOOP | SPI_CS_HIGH)
9e862375c5420a3 Lee Jones 2014-12-09  181  static int spi_st_setup(struct spi_device *spi)
9e862375c5420a3 Lee Jones 2014-12-09  182  {
9e862375c5420a3 Lee Jones 2014-12-09  183  	struct spi_st *spi_st = spi_master_get_devdata(spi->master);
9e862375c5420a3 Lee Jones 2014-12-09  184  	u32 spi_st_clk, sscbrg, var;
9e862375c5420a3 Lee Jones 2014-12-09  185  	u32 hz = spi->max_speed_hz;
9e862375c5420a3 Lee Jones 2014-12-09 @186  	int cs = spi->cs_gpio;
9e862375c5420a3 Lee Jones 2014-12-09  187  	int ret;
9e862375c5420a3 Lee Jones 2014-12-09  188  
9e862375c5420a3 Lee Jones 2014-12-09  189  	if (!hz)  {
9e862375c5420a3 Lee Jones 2014-12-09  190  		dev_err(&spi->dev, "max_speed_hz unspecified\n");
9e862375c5420a3 Lee Jones 2014-12-09  191  		return -EINVAL;
9e862375c5420a3 Lee Jones 2014-12-09  192  	}
9e862375c5420a3 Lee Jones 2014-12-09  193  
9e862375c5420a3 Lee Jones 2014-12-09  194  	if (!gpio_is_valid(cs)) {
9e862375c5420a3 Lee Jones 2014-12-09  195  		dev_err(&spi->dev, "%d is not a valid gpio\n", cs);
9e862375c5420a3 Lee Jones 2014-12-09  196  		return -EINVAL;
9e862375c5420a3 Lee Jones 2014-12-09  197  	}
9e862375c5420a3 Lee Jones 2014-12-09  198  
42531686639d6a3 Axel Lin  2016-06-05  199  	ret = gpio_request(cs, dev_name(&spi->dev));
42531686639d6a3 Axel Lin  2016-06-05  200  	if (ret) {
9e862375c5420a3 Lee Jones 2014-12-09  201  		dev_err(&spi->dev, "could not request gpio:%d\n", cs);
42531686639d6a3 Axel Lin  2016-06-05  202  		return ret;
9e862375c5420a3 Lee Jones 2014-12-09  203  	}
9e862375c5420a3 Lee Jones 2014-12-09  204  
9e862375c5420a3 Lee Jones 2014-12-09  205  	ret = gpio_direction_output(cs, spi->mode & SPI_CS_HIGH);
9e862375c5420a3 Lee Jones 2014-12-09  206  	if (ret)
42531686639d6a3 Axel Lin  2016-06-05  207  		goto out_free_gpio;
9e862375c5420a3 Lee Jones 2014-12-09  208  
9e862375c5420a3 Lee Jones 2014-12-09  209  	spi_st_clk = clk_get_rate(spi_st->clk);
9e862375c5420a3 Lee Jones 2014-12-09  210  
9e862375c5420a3 Lee Jones 2014-12-09  211  	/* Set SSC_BRF */
9e862375c5420a3 Lee Jones 2014-12-09  212  	sscbrg = spi_st_clk / (2 * hz);
9e862375c5420a3 Lee Jones 2014-12-09  213  	if (sscbrg < 0x07 || sscbrg > BIT(16)) {
9e862375c5420a3 Lee Jones 2014-12-09  214  		dev_err(&spi->dev,
9e862375c5420a3 Lee Jones 2014-12-09  215  			"baudrate %d outside valid range %d\n", sscbrg, hz);
42531686639d6a3 Axel Lin  2016-06-05  216  		ret = -EINVAL;
42531686639d6a3 Axel Lin  2016-06-05  217  		goto out_free_gpio;
9e862375c5420a3 Lee Jones 2014-12-09  218  	}
9e862375c5420a3 Lee Jones 2014-12-09  219  
9e862375c5420a3 Lee Jones 2014-12-09  220  	spi_st->baud = spi_st_clk / (2 * sscbrg);
9e862375c5420a3 Lee Jones 2014-12-09  221  	if (sscbrg == BIT(16)) /* 16-bit counter wraps */
9e862375c5420a3 Lee Jones 2014-12-09  222  		sscbrg = 0x0;
9e862375c5420a3 Lee Jones 2014-12-09  223  
9e862375c5420a3 Lee Jones 2014-12-09  224  	writel_relaxed(sscbrg, spi_st->base + SSC_BRG);
9e862375c5420a3 Lee Jones 2014-12-09  225  
9e862375c5420a3 Lee Jones 2014-12-09  226  	dev_dbg(&spi->dev,
9e862375c5420a3 Lee Jones 2014-12-09  227  		"setting baudrate:target= %u hz, actual= %u hz, sscbrg= %u\n",
9e862375c5420a3 Lee Jones 2014-12-09  228  		hz, spi_st->baud, sscbrg);
9e862375c5420a3 Lee Jones 2014-12-09  229  
9e862375c5420a3 Lee Jones 2014-12-09  230  	/* Set SSC_CTL and enable SSC */
9e862375c5420a3 Lee Jones 2014-12-09  231  	var = readl_relaxed(spi_st->base + SSC_CTL);
9e862375c5420a3 Lee Jones 2014-12-09  232  	var |= SSC_CTL_MS;
9e862375c5420a3 Lee Jones 2014-12-09  233  
9e862375c5420a3 Lee Jones 2014-12-09  234  	if (spi->mode & SPI_CPOL)
9e862375c5420a3 Lee Jones 2014-12-09  235  		var |= SSC_CTL_PO;
9e862375c5420a3 Lee Jones 2014-12-09  236  	else
9e862375c5420a3 Lee Jones 2014-12-09  237  		var &= ~SSC_CTL_PO;
9e862375c5420a3 Lee Jones 2014-12-09  238  
9e862375c5420a3 Lee Jones 2014-12-09  239  	if (spi->mode & SPI_CPHA)
9e862375c5420a3 Lee Jones 2014-12-09  240  		var |= SSC_CTL_PH;
9e862375c5420a3 Lee Jones 2014-12-09  241  	else
9e862375c5420a3 Lee Jones 2014-12-09  242  		var &= ~SSC_CTL_PH;
9e862375c5420a3 Lee Jones 2014-12-09  243  
9e862375c5420a3 Lee Jones 2014-12-09  244  	if ((spi->mode & SPI_LSB_FIRST) == 0)
9e862375c5420a3 Lee Jones 2014-12-09  245  		var |= SSC_CTL_HB;
9e862375c5420a3 Lee Jones 2014-12-09  246  	else
9e862375c5420a3 Lee Jones 2014-12-09  247  		var &= ~SSC_CTL_HB;
9e862375c5420a3 Lee Jones 2014-12-09  248  
9e862375c5420a3 Lee Jones 2014-12-09  249  	if (spi->mode & SPI_LOOP)
9e862375c5420a3 Lee Jones 2014-12-09  250  		var |= SSC_CTL_LPB;
9e862375c5420a3 Lee Jones 2014-12-09  251  	else
9e862375c5420a3 Lee Jones 2014-12-09  252  		var &= ~SSC_CTL_LPB;
9e862375c5420a3 Lee Jones 2014-12-09  253  
9e862375c5420a3 Lee Jones 2014-12-09  254  	var &= ~SSC_CTL_DATA_WIDTH_MSK;
9e862375c5420a3 Lee Jones 2014-12-09  255  	var |= (spi->bits_per_word - 1);
9e862375c5420a3 Lee Jones 2014-12-09  256  
9e862375c5420a3 Lee Jones 2014-12-09  257  	var |= SSC_CTL_EN_TX_FIFO | SSC_CTL_EN_RX_FIFO;
9e862375c5420a3 Lee Jones 2014-12-09  258  	var |= SSC_CTL_EN;
9e862375c5420a3 Lee Jones 2014-12-09  259  
9e862375c5420a3 Lee Jones 2014-12-09  260  	writel_relaxed(var, spi_st->base + SSC_CTL);
9e862375c5420a3 Lee Jones 2014-12-09  261  
9e862375c5420a3 Lee Jones 2014-12-09  262  	/* Clear the status register */
9e862375c5420a3 Lee Jones 2014-12-09  263  	readl_relaxed(spi_st->base + SSC_RBUF);
9e862375c5420a3 Lee Jones 2014-12-09  264  
9e862375c5420a3 Lee Jones 2014-12-09  265  	return 0;
42531686639d6a3 Axel Lin  2016-06-05  266  
42531686639d6a3 Axel Lin  2016-06-05  267  out_free_gpio:
42531686639d6a3 Axel Lin  2016-06-05  268  	gpio_free(cs);
42531686639d6a3 Axel Lin  2016-06-05  269  	return ret;
9e862375c5420a3 Lee Jones 2014-12-09  270  }
9e862375c5420a3 Lee Jones 2014-12-09  271  

:::::: The code at line 176 was first introduced by commit
:::::: 42531686639d6a3fe49518f2baca3f7256708242 spi: st-ssc4: Fix misuse of devm_gpio_request/devm_gpio_free APIs

:::::: TO: Axel Lin <axel.lin@ingics.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
