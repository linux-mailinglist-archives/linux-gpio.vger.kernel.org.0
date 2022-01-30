Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C89B4A344E
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 06:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241076AbiA3FeW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Jan 2022 00:34:22 -0500
Received: from mga14.intel.com ([192.55.52.115]:52077 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235695AbiA3FeW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 30 Jan 2022 00:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643520862; x=1675056862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hi9uhMZHjkc+PHGC57s+tNz1pN79YMle8QAf/D0eiDU=;
  b=li9Jj8T+0RrCr+/XbBW1ioAZM22LIOYoxPwC4DeM7LyFij3YpGEDdKef
   2inAZiu+I4mVJyyCcblJkYi8Nug/BV0ix0S4nZ4rbxuk0a71dRUNJmKeh
   Lku07I43kBmy77T2dhQqjJXB3uLBL/gZAJAIb1cP80IHhnUqkFYsMvcNh
   +3Lx03q3zbThQgKYnJxn0MeCJLL61NS6W3bF5npiK4/ZoRlWU/JwXOMq+
   s1L7qRoYM3kR4fZOYicnGdkEaiTst56fsLFUNpDNG71R4m9VdI4EQOkAM
   KTVHd6QAiRpwbfJj37/mC72LsJbDP8HIhDCZGKqMA50fLvHt6mhUor6kn
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="247540149"
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="247540149"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 21:34:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="598564917"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2022 21:34:20 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nE2qy-000Q6C-1k; Sun, 30 Jan 2022 05:34:20 +0000
Date:   Sun, 30 Jan 2022 13:33:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 10/12]
 drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable
 'tdm_sclk1_c_pins'
Message-ID: <202201301326.VmKBKVNC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   aa74c44be19c8b1de38d955c2c45c309991c805a
commit: 775214d389c259c77ff2b4de50bdaab5c9bd5db3 [10/12] pinctrl: meson: add pinctrl driver support for Meson-S4 Soc
config: arm64-buildonly-randconfig-r005-20220130 (https://download.01.org/0day-ci/archive/20220130/202201301326.VmKBKVNC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18acb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=775214d389c259c77ff2b4de50bdaab5c9bd5db3
        git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
        git fetch --no-tags linusw-pinctrl devel
        git checkout 775214d389c259c77ff2b4de50bdaab5c9bd5db3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pinctrl/meson/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable 'tdm_sclk1_c_pins' [-Wunused-const-variable]
   static const unsigned int tdm_sclk1_c_pins[]            = { GPIOC_3 };
                             ^
   1 warning generated.


vim +/tdm_sclk1_c_pins +178 drivers/pinctrl/meson/pinctrl-meson-s4.c

   173	
   174	/* Bank C func4 */
   175	static const unsigned int tdm_d2_c_pins[]		= { GPIOC_0 };
   176	static const unsigned int tdm_d3_c_pins[]		= { GPIOC_1 };
   177	static const unsigned int tdm_fs1_c_pins[]		= { GPIOC_2 };
 > 178	static const unsigned int tdm_sclk1_c_pins[]		= { GPIOC_3 };
   179	static const unsigned int mclk_1_c_pins[]		= { GPIOC_4 };
   180	static const unsigned int tdm_d4_c_pins[]		= { GPIOC_5 };
   181	static const unsigned int tdm_d5_c_pins[]		= { GPIOC_6 };
   182	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
