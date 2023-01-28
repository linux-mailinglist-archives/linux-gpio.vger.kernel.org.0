Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC7067F997
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jan 2023 17:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjA1Qcp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Jan 2023 11:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjA1Qcp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Jan 2023 11:32:45 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F2A2069A
        for <linux-gpio@vger.kernel.org>; Sat, 28 Jan 2023 08:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674923564; x=1706459564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hkmkXhMC8Th9ej0/zljfT0Eso2Ce8H6CRCFcvXqU2Y=;
  b=eSYiYMXSUit08Q3GoDfH8TrTZ12fTMMn5L22+UkpOrCZmDR9Ybb96oD0
   qs3htdK2u2w/aL94uAdNE3MsNP1Bmw8GsBINfEbcm4mBJYat7vLwAlKJa
   6u0EBwvVpJSd1pmGtV7oI096kFGF8RikHHQaKd/6ZVVcaDmJXku8BLxGn
   iVOx40Ms9t9SNOmCuRVB/nUk9dEpLIRk3fJ5eMgAYiy9CoPb6fXWRmkxa
   IUdprb4fBzJzQ0DiZ+acTGkvN1GCETudWa/eraDCOcIIFhM/qIsysTkBk
   y1HPus/nRnBXuX1c/xmkB+gwXTeBtgMeOEvYGBTxd5gvE/a6nMMPtnLnf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="307648653"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="307648653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 08:32:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="694054035"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="694054035"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Jan 2023 08:32:42 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLo89-0000uW-1F;
        Sat, 28 Jan 2023 16:32:41 +0000
Date:   Sun, 29 Jan 2023 00:32:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpiochip-no-driver-h 5/5]
 arch/arm/mach-orion5x/board-rd88f5182.c:107:6: error: call to undeclared
 function 'of_machine_is_compatible'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202301290051.LqXniYxY-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpiochip-no-driver-h
head:   df771cce328bbd37333797d0df3471c2e03ecb03
commit: df771cce328bbd37333797d0df3471c2e03ecb03 [5/5] gpio: Make the legacy <linux/gpio.h> consumer-only
config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20230129/202301290051.LqXniYxY-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=df771cce328bbd37333797d0df3471c2e03ecb03
        git remote add linusw-gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
        git fetch --no-tags linusw-gpio gpiochip-no-driver-h
        git checkout df771cce328bbd37333797d0df3471c2e03ecb03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mach-orion5x/board-rd88f5182.c:107:6: error: call to undeclared function 'of_machine_is_compatible'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (of_machine_is_compatible("marvell,rd-88f5182-nas"))
               ^
   1 error generated.


vim +/of_machine_is_compatible +107 arch/arm/mach-orion5x/board-rd88f5182.c

065194a06b4187 Thomas Petazzoni 2014-04-22  104  
065194a06b4187 Thomas Petazzoni 2014-04-22  105  static int __init rd88f5182_pci_init(void)
065194a06b4187 Thomas Petazzoni 2014-04-22  106  {
065194a06b4187 Thomas Petazzoni 2014-04-22 @107  	if (of_machine_is_compatible("marvell,rd-88f5182-nas"))
065194a06b4187 Thomas Petazzoni 2014-04-22  108  		pci_common_init(&rd88f5182_pci);
065194a06b4187 Thomas Petazzoni 2014-04-22  109  
065194a06b4187 Thomas Petazzoni 2014-04-22  110  	return 0;
065194a06b4187 Thomas Petazzoni 2014-04-22  111  }
065194a06b4187 Thomas Petazzoni 2014-04-22  112  

:::::: The code at line 107 was first introduced by commit
:::::: 065194a06b4187f9c1f4a37951904534291fb85b ARM: orion5x: convert RD-88F5182 to Device Tree

:::::: TO: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
:::::: CC: Jason Cooper <jason@lakedaemon.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
