Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42FA0508794
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Apr 2022 13:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378348AbiDTMBN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 08:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378370AbiDTMBK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 08:01:10 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71DE403F2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650455904; x=1681991904;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AcImVDsqb6mOq58IXng3nBdWTuW0ogKq7+6ZbogjFxI=;
  b=nSxyzl29eSQ8BtH+DaO6D2est1ttBF/k22Q0Yq26L/ZNhWOEHLDNg6Gt
   Y6N2Rs2WeOUvBEiNGqZzkQyUFf/ru3lMMGETZjDRZz02/FV1vU6nK62Iw
   zpWXb02pqepcAneYdjk+mDTImrfLtSstVcQFycVh7YZhD8Dq/De7PMuW1
   VO1dPCP0Bj0pE1ELTJ5hZHRiD8SyY16KXS57sLvsquMylcW/AK2eVd+vF
   2z0I74BTV1KlpNnPo9DgEbbY6YAbWfoW+JMsnX98XI818QNLOvbGUd2tV
   IEenABQ7ROKl8QxVDZFcmlZ9s+gQQIjfVSpaCNX8mHzYf77VbaEH2lO2S
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="243939220"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="243939220"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 04:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="863664891"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2022 04:58:23 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nh8yU-0006yN-F6;
        Wed, 20 Apr 2022 11:58:22 +0000
Date:   Wed, 20 Apr 2022 19:58:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 1d3cdf06d1ad2a2712a29668bb342584932da842
Message-ID: <625ff558.r5j2tfhdILoLS2Kt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 1d3cdf06d1ad2a2712a29668bb342584932da842  pinctrl: meson: fix unused variable warning

elapsed time: 724m

configs tested: 137
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
mips                 randconfig-c004-20220420
i386                          randconfig-c001
sh                              ul2_defconfig
arm                       aspeed_g5_defconfig
nios2                               defconfig
powerpc                 mpc85xx_cds_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                       imx_v6_v7_defconfig
powerpc64                           defconfig
arc                        nsim_700_defconfig
ia64                             alldefconfig
arm                            qcom_defconfig
xtensa                    xip_kc705_defconfig
h8300                       h8s-sim_defconfig
powerpc                   motionpro_defconfig
sh                 kfr2r09-romimage_defconfig
xtensa                       common_defconfig
arc                      axs103_smp_defconfig
sh                             espt_defconfig
openrisc                 simple_smp_defconfig
powerpc                 canyonlands_defconfig
powerpc                      ep88xc_defconfig
sh                           se7722_defconfig
parisc                           alldefconfig
powerpc                       maple_defconfig
ia64                         bigsur_defconfig
arm                        keystone_defconfig
powerpc                     redwood_defconfig
mips                     loongson1b_defconfig
sh                           se7721_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        mvme16x_defconfig
arc                            hsdk_defconfig
mips                       bmips_be_defconfig
arc                           tb10x_defconfig
arm                          iop32x_defconfig
m68k                        mvme147_defconfig
sh                        dreamcast_defconfig
sh                   rts7751r2dplus_defconfig
mips                         cobalt_defconfig
arc                     nsimosci_hs_defconfig
arm                        mvebu_v7_defconfig
powerpc                     asp8347_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220420
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220420
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220420
mips                 randconfig-c004-20220420
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220420
powerpc              randconfig-c003-20220420
s390                 randconfig-c005-20220420
arm                       mainstone_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           ip22_defconfig
arm                         shannon_defconfig
powerpc                      katmai_defconfig
powerpc                  mpc885_ads_defconfig
arm                         mv78xx0_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220420
riscv                randconfig-r042-20220420
hexagon              randconfig-r045-20220420
s390                 randconfig-r044-20220420

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
