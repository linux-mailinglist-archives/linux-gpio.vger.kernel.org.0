Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC9F1563E37
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Jul 2022 06:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbiGBERg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Jul 2022 00:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiGBERg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Jul 2022 00:17:36 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C815435A9E
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 21:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656735455; x=1688271455;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kSdMcsSeuw7YG8vt/UuBx6K/u4mCNmo0UD4upKLqPZ8=;
  b=MFU73BsVHmFRydOwE0rAyNhhelwu9QHlk+FCDICKsvlPv6RE3CJzdAdH
   hj3tEhYn8kEpZ+uOZ63mk3TxLb1qsqpy2DxbYhpwsBdoWNSupEjLnd1Hf
   A9mmArI97Uu/aGyTFXJzbJzd/2htnLoi03d46M0wB5A5DmmOwxxuEqyV4
   hAOI4FUIc8djLc4gFAxvvYpurkFyOPYr64Q/Mt3sKoHgf8lhNzT3WDy18
   0xlim4QKeoUTH82Yw2A9azmePbH8Ur8MA4HPsulltLWMRLAl9jhxfBtd9
   ASXjdGXjWWU3DPhsJ2yNw3gHHcInZ6O7V6TmB6LTKVfm9AR13F3srq53M
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="265821037"
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="265821037"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 21:17:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="591914796"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Jul 2022 21:17:34 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o7UZZ-000EoO-Pf;
        Sat, 02 Jul 2022 04:17:33 +0000
Date:   Sat, 02 Jul 2022 12:17:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 d4c0b614b5a47d0b3870e89fd211b6e80f6973eb
Message-ID: <62bfc6c0.Zqc+KHmPxMjXkYdE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: d4c0b614b5a47d0b3870e89fd211b6e80f6973eb  pinctrl: axp209: Support the AXP221/AXP223/AXP809 variant

elapsed time: 2311m

configs tested: 47
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                              allyesconfig
i386                                defconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a006
riscv                randconfig-r042-20220629
s390                 randconfig-r044-20220629
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
