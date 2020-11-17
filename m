Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6242B55E2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 01:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbgKQA51 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 19:57:27 -0500
Received: from mga03.intel.com ([134.134.136.65]:51355 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727130AbgKQA50 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 19:57:26 -0500
IronPort-SDR: zu8tDzdTWDklOIGJvO8liMyma/TcFupoJG+9+xJ7j1c7OYHdKEM01arA6slenPMP7/uWjmP4Dm
 8X3hFwjuTxYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="170943805"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="gz'50?scan'50,208,50";a="170943805"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 16:57:25 -0800
IronPort-SDR: VLdyGC3WgfAMzoQ4y7DRhU/MSCdwHEnPX3yvX5ZCaoBQye708bYT9t9BafpbeqtpcEcnVwSUkV
 GPYrFIKJEDxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
   d="gz'50?scan'50,208,50";a="475728441"
Received: from lkp-server01.sh.intel.com (HELO 5abab2bd15ab) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Nov 2020 16:57:23 -0800
Received: from kbuild by 5abab2bd15ab with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kepJD-00000S-7W; Tue, 17 Nov 2020 00:57:23 +0000
Date:   Tue, 17 Nov 2020 08:57:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi 2/2]
 drivers/spi/spi-mpc512x-psc.c:469:39: warning: ISO C90 forbids mixed
 declarations and code
Message-ID: <202011170856.4dCDRBcF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   a40edbe3d2bf76cbc1a7c30b50de679811427aaf
commit: a40edbe3d2bf76cbc1a7c30b50de679811427aaf [2/2] spi: mpc512x-psc: Convert to use GPIO descriptors
config: powerpc-mpc512x_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=a40edbe3d2bf76cbc1a7c30b50de679811427aaf
        git remote add gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
        git fetch --no-tags gpio gpio-descriptors-spi
        git checkout a40edbe3d2bf76cbc1a7c30b50de679811427aaf
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/spi/spi-mpc512x-psc.c: In function 'mpc512x_psc_spi_setup':
   drivers/spi/spi-mpc512x-psc.c:350:6: warning: unused variable 'ret' [-Wunused-variable]
     350 |  int ret;
         |      ^~~
   drivers/spi/spi-mpc512x-psc.c: In function 'mpc512x_psc_spi_do_probe':
   drivers/spi/spi-mpc512x-psc.c:469:39: error: unknown type name 'x'
     469 |   mps->cs_control = pdata->cs_control;x
         |                                       ^
   drivers/spi/spi-mpc512x-psc.c:470:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
     470 |   master->bus_num = pdata->bus_num;
         |         ^~
>> drivers/spi/spi-mpc512x-psc.c:469:39: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     469 |   mps->cs_control = pdata->cs_control;x
         |                                       ^

vim +469 drivers/spi/spi-mpc512x-psc.c

   448	
   449	static int mpc512x_psc_spi_do_probe(struct device *dev, u32 regaddr,
   450						      u32 size, unsigned int irq)
   451	{
   452		struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
   453		struct mpc512x_psc_spi *mps;
   454		struct spi_master *master;
   455		int ret;
   456		void *tempp;
   457		struct clk *clk;
   458	
   459		master = spi_alloc_master(dev, sizeof *mps);
   460		if (master == NULL)
   461			return -ENOMEM;
   462	
   463		dev_set_drvdata(dev, master);
   464		mps = spi_master_get_devdata(master);
   465		mps->type = (int)of_device_get_match_data(dev);
   466		mps->irq = irq;
   467	
   468		if (pdata) {
 > 469			mps->cs_control = pdata->cs_control;x
   470			master->bus_num = pdata->bus_num;
   471			master->num_chipselect = pdata->max_chipselect;
   472		}
   473	
   474		master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LSB_FIRST;
   475		master->setup = mpc512x_psc_spi_setup;
   476		master->prepare_transfer_hardware = mpc512x_psc_spi_prep_xfer_hw;
   477		master->transfer_one_message = mpc512x_psc_spi_msg_xfer;
   478		master->unprepare_transfer_hardware = mpc512x_psc_spi_unprep_xfer_hw;
   479		master->set_cs = mpc512x_psc_spi_set_cs;
   480		/* This makes sure our custom .set_cs() is always called */
   481		master->flags = SPI_MASTER_GPIO_SS;
   482		master->use_gpio_descriptors = true;
   483		master->cleanup = mpc512x_psc_spi_cleanup;
   484		master->dev.of_node = dev->of_node;
   485	
   486		tempp = devm_ioremap(dev, regaddr, size);
   487		if (!tempp) {
   488			dev_err(dev, "could not ioremap I/O port range\n");
   489			ret = -EFAULT;
   490			goto free_master;
   491		}
   492		mps->psc = tempp;
   493		mps->fifo =
   494			(struct mpc512x_psc_fifo *)(tempp + sizeof(struct mpc52xx_psc));
   495		ret = devm_request_irq(dev, mps->irq, mpc512x_psc_spi_isr, IRQF_SHARED,
   496					"mpc512x-psc-spi", mps);
   497		if (ret)
   498			goto free_master;
   499		init_completion(&mps->txisrdone);
   500	
   501		clk = devm_clk_get(dev, "mclk");
   502		if (IS_ERR(clk)) {
   503			ret = PTR_ERR(clk);
   504			goto free_master;
   505		}
   506		ret = clk_prepare_enable(clk);
   507		if (ret)
   508			goto free_master;
   509		mps->clk_mclk = clk;
   510		mps->mclk_rate = clk_get_rate(clk);
   511	
   512		clk = devm_clk_get(dev, "ipg");
   513		if (IS_ERR(clk)) {
   514			ret = PTR_ERR(clk);
   515			goto free_mclk_clock;
   516		}
   517		ret = clk_prepare_enable(clk);
   518		if (ret)
   519			goto free_mclk_clock;
   520		mps->clk_ipg = clk;
   521	
   522		ret = mpc512x_psc_spi_port_config(master, mps);
   523		if (ret < 0)
   524			goto free_ipg_clock;
   525	
   526		ret = devm_spi_register_master(dev, master);
   527		if (ret < 0)
   528			goto free_ipg_clock;
   529	
   530		return ret;
   531	
   532	free_ipg_clock:
   533		clk_disable_unprepare(mps->clk_ipg);
   534	free_mclk_clock:
   535		clk_disable_unprepare(mps->clk_mclk);
   536	free_master:
   537		spi_master_put(master);
   538	
   539		return ret;
   540	}
   541	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--xHFwDpU9dbj6ez1V
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AQA=

--xHFwDpU9dbj6ez1V--
