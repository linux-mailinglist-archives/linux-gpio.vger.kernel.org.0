Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631ED497BF8
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 10:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbiAXJ3x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 04:29:53 -0500
Received: from mga04.intel.com ([192.55.52.120]:63114 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233761AbiAXJ3P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jan 2022 04:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643016555; x=1674552555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6MPNOSMtOF7kFEs94W3jBA/zY7Js3NXSKcfv1dr7dsU=;
  b=QjjsfMEDHK1oSsKiHLapAilfq8awJf1UJxDmyPibUiavhu099GUsl4W/
   X+fgXrAPzuWblu1mjCUiyS9DvNqajDTacw6b8wtchgqNhDXq1PBQTjG0S
   eQAu4JNDoKVGzWkpfKETxMWocvjF/fQDK1FmyIoszfEoGXsPFa23TiQlj
   mT0g5lKgaFRIPChdENX7N6I911SQFiuh7mSJ8ufg0EtycLb5lNKS41OoU
   lpaaIpdXIhLh7nEgs0CuBMJrdISg6qcAeLJTGlHl5zhRGwX23wxvDPZ+E
   VtGwl91OQSGQcglZ+db/8i+bciHdpH8mzD5qEjCaVbHGD41kTrTH59sYO
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="244838623"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="244838623"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 01:28:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="562592202"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2022 01:28:26 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nBveE-000I6U-6K; Mon, 24 Jan 2022 09:28:26 +0000
Date:   Mon, 24 Jan 2022 17:27:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-spi 6/10]
 drivers/spi/spi-pxa2xx.c:1319:9: warning: variable 'err' is uninitialized
 when used here
Message-ID: <202201241741.CxVdsqSk-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   b91ec14d0a206a5f58d8df605e7b5fe31a62a7ea
commit: afde2307f68bdbc83d934d53e3a73ec554e2897f [6/10] spi: pxa2xx_spi: Convert to use GPIO descriptors
config: arm-imote2_defconfig (https://download.01.org/0day-ci/archive/20220124/202201241741.CxVdsqSk-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9006bf424847bf91f0a624ffc27ad165c7b804c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=afde2307f68bdbc83d934d53e3a73ec554e2897f
        git remote add linusw-gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
        git fetch --no-tags linusw-gpio gpio-descriptors-spi
        git checkout afde2307f68bdbc83d934d53e3a73ec554e2897f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-pxa2xx.c:1319:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
           return err;
                  ^~~
   drivers/spi/spi-pxa2xx.c:1173:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   drivers/spi/spi-pxa2xx.c:1433:34: warning: unused variable 'pxa2xx_spi_of_match' [-Wunused-const-variable]
   static const struct of_device_id pxa2xx_spi_of_match[] = {
                                    ^
   2 warnings generated.


vim +/err +1319 drivers/spi/spi-pxa2xx.c

7d94a505858841 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1164  
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1165  static int setup(struct spi_device *spi)
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1166  {
bffc967e93c771 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2016-09-07  1167  	struct pxa2xx_spi_chip *chip_info;
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1168  	struct chip_data *chip;
dccf7369652f39 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-06-04  1169  	const struct lpss_config *config;
3cc7b0e35745ae drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-02-01  1170  	struct driver_data *drv_data =
3cc7b0e35745ae drivers/spi/spi-pxa2xx.c Jarkko Nikula             2018-02-01  1171  		spi_controller_get_devdata(spi->controller);
a0d2642e929688 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1172  	uint tx_thres, tx_hi_thres, rx_thres;
2ec6f20b33eb4f drivers/spi/spi-pxa2xx.c Lukas Wunner              2021-05-27  1173  	int err;
a0d2642e929688 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1174  
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1175  	switch (drv_data->ssp_type) {
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1176  	case QUARK_X1000_SSP:
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1177  		tx_thres = TX_THRESH_QUARK_X1000_DFLT;
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1178  		tx_hi_thres = 0;
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1179  		rx_thres = RX_THRESH_QUARK_X1000_DFLT;
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1180  		break;
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1181  	case MRFLD_SSP:
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1182  		tx_thres = TX_THRESH_MRFLD_DFLT;
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1183  		tx_hi_thres = 0;
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1184  		rx_thres = RX_THRESH_MRFLD_DFLT;
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1185  		break;
7c7289a40425d4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-09-07  1186  	case CE4100_SSP:
7c7289a40425d4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-09-07  1187  		tx_thres = TX_THRESH_CE4100_DFLT;
7c7289a40425d4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-09-07  1188  		tx_hi_thres = 0;
7c7289a40425d4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-09-07  1189  		rx_thres = RX_THRESH_CE4100_DFLT;
7c7289a40425d4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-09-07  1190  		break;
03fbf488cece46 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-06-04  1191  	case LPSS_LPT_SSP:
03fbf488cece46 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-06-04  1192  	case LPSS_BYT_SSP:
30f3a6ab44d8d0 drivers/spi/spi-pxa2xx.c Mika Westerberg           2016-02-08  1193  	case LPSS_BSW_SSP:
34cadd9c1bcbd5 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-07-30  1194  	case LPSS_SPT_SSP:
b7c08cf85c9a3a drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-10-28  1195  	case LPSS_BXT_SSP:
fc0b2acc754a18 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2017-05-30  1196  	case LPSS_CNL_SSP:
dccf7369652f39 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-06-04  1197  		config = lpss_get_config(drv_data);
dccf7369652f39 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-06-04  1198  		tx_thres = config->tx_threshold_lo;
dccf7369652f39 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-06-04  1199  		tx_hi_thres = config->tx_threshold_hi;
dccf7369652f39 drivers/spi/spi-pxa2xx.c Jarkko Nikula             2015-06-04  1200  		rx_thres = config->rx_threshold;
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1201  		break;
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1202  	default:
a0d2642e929688 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1203  		tx_hi_thres = 0;
51eea52d26d493 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16  1204  		if (spi_controller_is_slave(drv_data->controller)) {
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1205  			tx_thres = 1;
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1206  			rx_thres = 2;
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1207  		} else {
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1208  			tx_thres = TX_THRESH_DFLT;
a0d2642e929688 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1209  			rx_thres = RX_THRESH_DFLT;
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1210  		}
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1211  		break;
a0d2642e929688 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1212  	}
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1213  
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1214  	/* Only allocate on the first setup */
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1215  	chip = spi_get_ctldata(spi);
8d94cc50aa4f14 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1216  	if (!chip) {
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1217  		chip = kzalloc(sizeof(struct chip_data), GFP_KERNEL);
9deae4592b66c0 drivers/spi/spi-pxa2xx.c Jingoo Han                2014-04-29  1218  		if (!chip)
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1219  			return -ENOMEM;
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1220  
2a8626a9e2d86d drivers/spi/pxa2xx_spi.c Sebastian Andrzej Siewior 2010-11-22  1221  		if (drv_data->ssp_type == CE4100_SSP) {
2a8626a9e2d86d drivers/spi/pxa2xx_spi.c Sebastian Andrzej Siewior 2010-11-22  1222  			if (spi->chip_select > 4) {
f6bd03a746271f drivers/spi/spi-pxa2xx.c Jarkko Nikula             2013-10-11  1223  				dev_err(&spi->dev,
f6bd03a746271f drivers/spi/spi-pxa2xx.c Jarkko Nikula             2013-10-11  1224  					"failed setup: cs number must not be > 4.\n");
2a8626a9e2d86d drivers/spi/pxa2xx_spi.c Sebastian Andrzej Siewior 2010-11-22  1225  				kfree(chip);
2a8626a9e2d86d drivers/spi/pxa2xx_spi.c Sebastian Andrzej Siewior 2010-11-22  1226  				return -EINVAL;
2a8626a9e2d86d drivers/spi/pxa2xx_spi.c Sebastian Andrzej Siewior 2010-11-22  1227  			}
c18d925fca20d3 drivers/spi/spi-pxa2xx.c Jan Kiszka                2017-08-03  1228  		}
51eea52d26d493 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16  1229  		chip->enable_dma = drv_data->controller_info->enable_dma;
f1f640a9c1d97a drivers/spi/pxa2xx_spi.c Vernon Sauder             2008-10-15  1230  		chip->timeout = TIMOUT_DFLT;
8d94cc50aa4f14 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1231  	}
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1232  
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1233  	/*
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1234  	 * Protocol drivers may change the chip settings, so...
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1235  	 * if chip_info exists, use it.
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1236  	 */
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1237  	chip_info = spi->controller_data;
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1238  
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1239  	/* chip_info isn't always needed */
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1240  	if (chip_info) {
f1f640a9c1d97a drivers/spi/pxa2xx_spi.c Vernon Sauder             2008-10-15  1241  		if (chip_info->timeout)
8d94cc50aa4f14 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1242  			chip->timeout = chip_info->timeout;
f1f640a9c1d97a drivers/spi/pxa2xx_spi.c Vernon Sauder             2008-10-15  1243  		if (chip_info->tx_threshold)
f1f640a9c1d97a drivers/spi/pxa2xx_spi.c Vernon Sauder             2008-10-15  1244  			tx_thres = chip_info->tx_threshold;
a0d2642e929688 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1245  		if (chip_info->tx_hi_threshold)
a0d2642e929688 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1246  			tx_hi_thres = chip_info->tx_hi_threshold;
f1f640a9c1d97a drivers/spi/pxa2xx_spi.c Vernon Sauder             2008-10-15  1247  		if (chip_info->rx_threshold)
f1f640a9c1d97a drivers/spi/pxa2xx_spi.c Vernon Sauder             2008-10-15  1248  			rx_thres = chip_info->rx_threshold;
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1249  		chip->dma_threshold = 0;
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1250  	}
8393961c53b310 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-11-23  1251  
8393961c53b310 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-11-23  1252  	chip->cr1 = 0;
51eea52d26d493 drivers/spi/spi-pxa2xx.c Lubomir Rintel            2019-01-16  1253  	if (spi_controller_is_slave(drv_data->controller)) {
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1254  		chip->cr1 |= SSCR1_SCFR;
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1255  		chip->cr1 |= SSCR1_SCLKDIR;
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1256  		chip->cr1 |= SSCR1_SFRMDIR;
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1257  		chip->cr1 |= SSCR1_SPH;
ec93cb6f827b3e drivers/spi/spi-pxa2xx.c Lubomir Rintel            2018-11-13  1258  	}
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1259  
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1260  	if (is_lpss_ssp(drv_data)) {
a0d2642e929688 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1261  		chip->lpss_rx_threshold = SSIRF_RxThresh(rx_thres);
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1262  		chip->lpss_tx_threshold = SSITF_TxLoThresh(tx_thres) |
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1263  					  SSITF_TxHiThresh(tx_hi_thres);
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1264  	}
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1265  
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1266  	if (is_mrfld_ssp(drv_data)) {
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1267  		chip->lpss_rx_threshold = rx_thres;
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1268  		chip->lpss_tx_threshold = tx_thres;
3fdb59cf10b020 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-10  1269  	}
a0d2642e929688 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1270  
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1271  	/*
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1272  	 * Set DMA burst and threshold outside of chip_info path so that if
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1273  	 * chip_info goes away after setting chip->enable_dma, the burst and
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1274  	 * threshold can still respond to changes in bits_per_word.
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1275  	 */
8d94cc50aa4f14 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1276  	if (chip->enable_dma) {
8083d6b812cac5 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1277  		/* Set up legal burst and threshold for DMA */
cd7bed00340475 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1278  		if (pxa2xx_spi_set_dma_burst_and_threshold(chip, spi,
cd7bed00340475 drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1279  						spi->bits_per_word,
8d94cc50aa4f14 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1280  						&chip->dma_burst_size,
8d94cc50aa4f14 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1281  						&chip->dma_threshold)) {
f6bd03a746271f drivers/spi/spi-pxa2xx.c Jarkko Nikula             2013-10-11  1282  			dev_warn(&spi->dev,
f6bd03a746271f drivers/spi/spi-pxa2xx.c Jarkko Nikula             2013-10-11  1283  				 "in setup: DMA burst size reduced to match bits_per_word\n");
8d94cc50aa4f14 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1284  		}
000c6af4177591 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2019-03-19  1285  		dev_dbg(&spi->dev,
000c6af4177591 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2019-03-19  1286  			"in setup: DMA burst size set to %u\n",
000c6af4177591 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2019-03-19  1287  			chip->dma_burst_size);
8d94cc50aa4f14 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1288  	}
8d94cc50aa4f14 drivers/spi/pxa2xx_spi.c Stephen Street            2006-12-10  1289  
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1290  	switch (drv_data->ssp_type) {
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1291  	case QUARK_X1000_SSP:
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1292  		chip->threshold = (QUARK_X1000_SSCR1_RxTresh(rx_thres)
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1293  				   & QUARK_X1000_SSCR1_RFT)
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1294  				   | (QUARK_X1000_SSCR1_TxTresh(tx_thres)
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1295  				   & QUARK_X1000_SSCR1_TFT);
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1296  		break;
7c7289a40425d4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-09-07  1297  	case CE4100_SSP:
7c7289a40425d4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-09-07  1298  		chip->threshold = (CE4100_SSCR1_RxTresh(rx_thres) & CE4100_SSCR1_RFT) |
7c7289a40425d4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-09-07  1299  			(CE4100_SSCR1_TxTresh(tx_thres) & CE4100_SSCR1_TFT);
7c7289a40425d4 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2016-09-07  1300  		break;
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1301  	default:
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1302  		chip->threshold = (SSCR1_RxTresh(rx_thres) & SSCR1_RFT) |
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1303  			(SSCR1_TxTresh(tx_thres) & SSCR1_TFT);
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1304  		break;
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1305  	}
e5262d0568dc9e drivers/spi/spi-pxa2xx.c Weike Chen                2014-11-26  1306  
7f6ee1adc75bf3 drivers/spi/pxa2xx_spi.c Justin Clacherty          2007-01-26  1307  	chip->cr1 &= ~(SSCR1_SPO | SSCR1_SPH);
eb743ec600be59 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1308  	chip->cr1 |= ((spi->mode & SPI_CPHA) ? SSCR1_SPH : 0) |
eb743ec600be59 drivers/spi/spi-pxa2xx.c Andy Shevchenko           2021-05-17  1309  		     ((spi->mode & SPI_CPOL) ? SSCR1_SPO : 0);
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1310  
b833172fd8f44f drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1311  	if (spi->mode & SPI_LOOP)
b833172fd8f44f drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1312  		chip->cr1 |= SSCR1_LBM;
b833172fd8f44f drivers/spi/spi-pxa2xx.c Mika Westerberg           2013-01-22  1313  
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1314  	spi_set_ctldata(spi, chip);
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1315  
2a8626a9e2d86d drivers/spi/pxa2xx_spi.c Sebastian Andrzej Siewior 2010-11-22  1316  	if (drv_data->ssp_type == CE4100_SSP)
2a8626a9e2d86d drivers/spi/pxa2xx_spi.c Sebastian Andrzej Siewior 2010-11-22  1317  		return 0;
2a8626a9e2d86d drivers/spi/pxa2xx_spi.c Sebastian Andrzej Siewior 2010-11-22  1318  
2ec6f20b33eb4f drivers/spi/spi-pxa2xx.c Lukas Wunner              2021-05-27 @1319  	return err;
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1320  }
e0c9905e87ac1b drivers/spi/pxa2xx_spi.c Stephen Street            2006-03-07  1321  

:::::: The code at line 1319 was first introduced by commit
:::::: 2ec6f20b33eb4f62ab90bdcd620436c883ec3af6 spi: Cleanup on failure of initial setup

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
