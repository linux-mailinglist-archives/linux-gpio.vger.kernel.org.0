Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17654A5B3C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Feb 2022 12:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237268AbiBALdg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Feb 2022 06:33:36 -0500
Received: from mga05.intel.com ([192.55.52.43]:31738 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233560AbiBALdf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Feb 2022 06:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643715215; x=1675251215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=viM1+BDjn4Amnu5+hJIn+lG+9Vz4PcvEr5S1DF3VcXI=;
  b=ZYz3iOxxLp5aHYwvFJY37SEEp03g0c8jT2+IvVC+UXkllodtcNhvB0jz
   9IYmiWvtoFR7uPcT8uw3QDEL2bnUuQAF0gRqmx0ibQEqFKLCg5nYeVkqM
   tPoHOADoLrW+QTmHZyp/rmrpnnD7b08EE/5ej1qGeB+LBLfN4W9FL+fEA
   Q7RbhOIcWOE21fyZnwBZ4BAS8MDRJR0aLaVzydkZg1inLWXtQpa2F5PIY
   PKRS/hGniptZDeh/P/0EfYuZLigg8t4ACVyIuShYbVlr2b2wFtleQT82M
   IarscDNzFhDf59lBFBB9kL8MtHIETFK9sYWjzeclE12tHRlTtLk4Xz2So
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334027348"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="334027348"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 03:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="479661414"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Feb 2022 03:33:33 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nErPg-000TCL-Pe; Tue, 01 Feb 2022 11:33:32 +0000
Date:   Tue, 1 Feb 2022 19:33:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-spi 5/11]
 drivers/spi/spi-mpc512x-psc.c:130:15: error: 'struct mpc512x_psc_spi_cs' has
 no member named 'gpiod'
Message-ID: <202202011916.m45rxna9-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   a4efb11e4ae35a2251b5894b8f84fe7e92af4ab8
commit: bd855ae589a7966dbedbcee6c35292fea901d3cc [5/11] spi: mpc512x-psc: Convert to use GPIO descriptors
config: powerpc-randconfig-r011-20220130 (https://download.01.org/0day-ci/archive/20220201/202202011916.m45rxna9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=bd855ae589a7966dbedbcee6c35292fea901d3cc
        git remote add linusw-gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
        git fetch --no-tags linusw-gpio gpio-descriptors-spi
        git checkout bd855ae589a7966dbedbcee6c35292fea901d3cc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/spi/spi-mpc512x-psc.c: In function 'mpc512x_psc_spi_activate_cs':
>> drivers/spi/spi-mpc512x-psc.c:130:15: error: 'struct mpc512x_psc_spi_cs' has no member named 'gpiod'
     130 |         if (cs->gpiod) {
         |               ^~
   drivers/spi/spi-mpc512x-psc.c: In function 'mpc512x_psc_spi_setup':
   drivers/spi/spi-mpc512x-psc.c:376:13: warning: unused variable 'ret' [-Wunused-variable]
     376 |         int ret;
         |             ^~~


vim +130 drivers/spi/spi-mpc512x-psc.c

    90	
    91	static void mpc512x_psc_spi_activate_cs(struct spi_device *spi)
    92	{
    93		struct mpc512x_psc_spi_cs *cs = spi->controller_state;
    94		struct mpc512x_psc_spi *mps = spi_master_get_devdata(spi->master);
    95		u32 sicr;
    96		u32 ccr;
    97		int speed;
    98		u16 bclkdiv;
    99	
   100		sicr = in_be32(psc_addr(mps, sicr));
   101	
   102		/* Set clock phase and polarity */
   103		if (spi->mode & SPI_CPHA)
   104			sicr |= 0x00001000;
   105		else
   106			sicr &= ~0x00001000;
   107	
   108		if (spi->mode & SPI_CPOL)
   109			sicr |= 0x00002000;
   110		else
   111			sicr &= ~0x00002000;
   112	
   113		if (spi->mode & SPI_LSB_FIRST)
   114			sicr |= 0x10000000;
   115		else
   116			sicr &= ~0x10000000;
   117		out_be32(psc_addr(mps, sicr), sicr);
   118	
   119		ccr = in_be32(psc_addr(mps, ccr));
   120		ccr &= 0xFF000000;
   121		speed = cs->speed_hz;
   122		if (!speed)
   123			speed = 1000000;	/* default 1MHz */
   124		bclkdiv = (mps->mclk_rate / speed) - 1;
   125	
   126		ccr |= (((bclkdiv & 0xff) << 16) | (((bclkdiv >> 8) & 0xff) << 8));
   127		out_be32(psc_addr(mps, ccr), ccr);
   128		mps->bits_per_word = cs->bits_per_word;
   129	
 > 130		if (cs->gpiod) {
   131			if (mps->cs_control)
   132				/* boardfile override */
   133				mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 1 : 0);
   134			else
   135				/* gpiolib will deal with the inversion */
   136				gpiod_set_value(spi->cs_gpiod, 1);
   137		}
   138	}
   139	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
