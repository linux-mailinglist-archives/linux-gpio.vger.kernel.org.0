Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E00622383
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 06:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiKIFoX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 00:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiKIFoX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 00:44:23 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F882ACC
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 21:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667972662; x=1699508662;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2VNzCaNki0vw3wdWEcZQcCFSMKfjKSZiN9HjCS6C+Yg=;
  b=WJ1PSe6fT6npgMrYiqbGXuiFRnDBTdP36j5hndbZHpb7sZldn7UmsNTy
   q5ev3bLMMGMgOnmBNGRm75pGnpv7ANlIwQfwoxDMFUFe0Zj5a6SKNVkHE
   0dN3PbNJM7uENuBPsYgsdc5g2MiXjOJdshhk6n5Cyerkz3pjmYUvkLPSn
   bxJRBzIUV/vmBeUnLG2lNsMC5lqpl6TZe4n8oDY6wLU+WtTLZGeHB+dQR
   wZyBHhEXxWqlXlN1GJyI6geY+tOGh0obOghHc/iZwGmwQjg/aoJ7oZDfM
   LNamxmUy2E6HTxHiL1PmeVzDwUbgxfk89mW/1zJWc6LaJr6a6tev2Rd6P
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="312692916"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="312692916"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 21:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="761763734"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; 
   d="scan'208";a="761763734"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Nov 2022 21:44:20 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osdsp-00016Z-39;
        Wed, 09 Nov 2022 05:44:19 +0000
Date:   Wed, 09 Nov 2022 13:44:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 ff58d67fd2a986bd43561744a8157a7f93a4cbd6
Message-ID: <636b3e20.7EqOFtEeiPWJnj5Z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: ff58d67fd2a986bd43561744a8157a7f93a4cbd6  Merge branch 'devel' into for-next

elapsed time: 747m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
i386                          randconfig-c001
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
sparc                       sparc32_defconfig
csky                             alldefconfig
sh                           se7712_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
mips                      loongson3_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     sequoia_defconfig
arm                             ezx_defconfig
powerpc                     mpc83xx_defconfig
powerpc                       holly_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                              alldefconfig
arm                          exynos_defconfig
mips                          rb532_defconfig
i386                             allyesconfig
i386                                defconfig
x86_64               randconfig-a006-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a004-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a002-20221107
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
xtensa                           allyesconfig
powerpc                      makalu_defconfig
powerpc                       maple_defconfig
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a002-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
arm                        trizeps4_defconfig
arm                           sunxi_defconfig
arc                        vdk_hs38_defconfig
m68k                        m5272c3_defconfig
sh                          rsk7269_defconfig
arm                             rpc_defconfig
arm                      integrator_defconfig
powerpc                        cell_defconfig
powerpc                     rainier_defconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
arm                        clps711x_defconfig
arm                      footbridge_defconfig
m68k                       m5275evb_defconfig
nios2                            alldefconfig
powerpc                    klondike_defconfig

clang tested configs:
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                       imx_v4_v5_defconfig
arm                          moxart_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
mips                     cu1000-neo_defconfig
mips                        qi_lb60_defconfig
arm                         mv78xx0_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                          ath25_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
