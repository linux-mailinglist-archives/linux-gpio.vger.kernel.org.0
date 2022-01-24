Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A60D497B06
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 10:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242332AbiAXJH1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 04:07:27 -0500
Received: from mga02.intel.com ([134.134.136.20]:26089 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236469AbiAXJH1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jan 2022 04:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643015247; x=1674551247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2JqrVjv71rgHKQpHXaabC7QdiruTKn7Jc2bbAZs10Wk=;
  b=hbXRukoRF8j7ayiihbpOWNA5/GZehvPivRMl0mIc2ttjvFGXK/tja+HN
   TgsiNsIqaBAmzwh6+ZnbGZzoQ5m4HgzYalSV3CwvhdLb+yobQLkjPNG6/
   vkZ3NZD/Q/IcpO/hDmaXhHz8VjYmM7pnTvu+n70G9cjohgiyW1/G4cKdh
   f3toxbhPyiyEecSLuhYz4ONKcM6wof8MP7610nI1apOoNc1NP1B3Tp9Rg
   KvgkWmeGdwpr210YN+GzYjV7dnnA9LXFYppcepbM7EBg+I7Td74g8EPG2
   DIMnGOPj9sMf1WpqSIVpE2FeDr+1IlNatHUOPkIO/v/Wu3Wvc7EPFo80Q
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="233360098"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="233360098"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 01:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="766334419"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2022 01:07:25 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nBvJs-000I50-VI; Mon, 24 Jan 2022 09:07:24 +0000
Date:   Mon, 24 Jan 2022 17:07:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-spi 10/10]
 drivers/spi/spi-st-ssc4.c:176:24: error: 'struct spi_device' has no member
 named 'cs_gpio'; did you mean 'cs_gpiod'?
Message-ID: <202201241743.NUmtEx5k-lkp@intel.com>
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
config: arc-randconfig-r043-20220124 (https://download.01.org/0day-ci/archive/20220124/202201241743.NUmtEx5k-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=b91ec14d0a206a5f58d8df605e7b5fe31a62a7ea
        git remote add linusw-gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
        git fetch --no-tags linusw-gpio gpio-descriptors-spi
        git checkout b91ec14d0a206a5f58d8df605e7b5fe31a62a7ea
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/spi/spi-st-ssc4.c: In function 'spi_st_cleanup':
>> drivers/spi/spi-st-ssc4.c:176:24: error: 'struct spi_device' has no member named 'cs_gpio'; did you mean 'cs_gpiod'?
     176 |         gpio_free(spi->cs_gpio);
         |                        ^~~~~~~
         |                        cs_gpiod
   drivers/spi/spi-st-ssc4.c: In function 'spi_st_setup':
   drivers/spi/spi-st-ssc4.c:186:23: error: 'struct spi_device' has no member named 'cs_gpio'; did you mean 'cs_gpiod'?
     186 |         int cs = spi->cs_gpio;
         |                       ^~~~~~~
         |                       cs_gpiod


vim +176 drivers/spi/spi-st-ssc4.c

9e862375c5420a Lee Jones 2014-12-09  173  
9e862375c5420a Lee Jones 2014-12-09  174  static void spi_st_cleanup(struct spi_device *spi)
9e862375c5420a Lee Jones 2014-12-09  175  {
42531686639d6a Axel Lin  2016-06-05 @176  	gpio_free(spi->cs_gpio);
9e862375c5420a Lee Jones 2014-12-09  177  }
9e862375c5420a Lee Jones 2014-12-09  178  

:::::: The code at line 176 was first introduced by commit
:::::: 42531686639d6a3fe49518f2baca3f7256708242 spi: st-ssc4: Fix misuse of devm_gpio_request/devm_gpio_free APIs

:::::: TO: Axel Lin <axel.lin@ingics.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
