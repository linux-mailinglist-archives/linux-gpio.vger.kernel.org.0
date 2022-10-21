Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187C2608092
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 23:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiJUVLO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 17:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiJUVLM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 17:11:12 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DDA225ED29
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666386671; x=1697922671;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q+HspomQuuJG3DiDbC8sMgSeOJT4EUKuWrHhyznN240=;
  b=eKPc8UwoLAwy1wcsH01G0BemKPBu9P7BcqUugyzzCsJorZeUJBYANsUW
   PFkJgG56U2PoeylS3tRiIzSxX5YZcPHybjyVEEbj24AeRpWAnNwRKzWsS
   G2CXnr/AAKjeun9Z5SpjbOsy1071/tHqn1Shfkrpc4rbyvExIW0ucRS/h
   F5/A/YOgK8GW0WYz4+9NWVG8cLY63PWKv4VywFsDJJHqTh0iMytIgKRco
   mk6tCuDKl5NQ8dxNn3+VOsOWOrrY5pcNQIyf1b7kfBQsquzzIyHf7/PS+
   UUmVijjEApqk3rGluzp6VzvO8qt4fRzY2aznHY65HPNyAToZJ/wJv8K4y
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="307095694"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="307095694"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 14:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="663906038"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="663906038"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Oct 2022 14:11:09 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1olzIK-0002yP-2s;
        Fri, 21 Oct 2022 21:11:08 +0000
Date:   Sat, 22 Oct 2022 05:10:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 b6f5e4402f45a5eedcfe306587c7bcaab3f47773
Message-ID: <63530abe.WsfY98GLKSP/b/7+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b6f5e4402f45a5eedcfe306587c7bcaab3f47773  Merge branch 'devel' into for-next

elapsed time: 726m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
arc                                 defconfig
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
alpha                               defconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
s390                                defconfig
x86_64                        randconfig-a004
x86_64                               rhel-8.3
arc                  randconfig-r043-20221019
x86_64                        randconfig-a002
i386                                defconfig
x86_64                        randconfig-a006
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                             allyesconfig
arm                                 defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
sh                           se7750_defconfig
sh                           se7343_defconfig
nios2                         10m50_defconfig
arm                              allyesconfig
arm64                            allyesconfig
m68k                       m5475evb_defconfig
xtensa                              defconfig
sparc                            alldefconfig
arm                          badge4_defconfig
arc                  randconfig-r043-20221018
s390                 randconfig-r044-20221018
riscv                randconfig-r042-20221018
m68k                         apollo_defconfig
arc                        vdk_hs38_defconfig
sh                           se7712_defconfig
arc                  randconfig-r043-20221020
s390                 randconfig-r044-20221020
riscv                randconfig-r042-20221020
arm64                               defconfig
powerpc                 linkstation_defconfig
m68k                        mvme16x_defconfig
loongarch                           defconfig
arm                        oxnas_v6_defconfig
openrisc                         alldefconfig
powerpc                       holly_defconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                        multi_v7_defconfig
sh                           se7721_defconfig
powerpc                         ps3_defconfig
m68k                           virt_defconfig
powerpc                      ppc40x_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sparc                       sparc32_defconfig
sh                          sdk7786_defconfig
parisc                           alldefconfig
mips                      fuloong2e_defconfig
arc                           tb10x_defconfig
sh                            titan_defconfig
powerpc                     pq2fads_defconfig
arm                         nhk8815_defconfig
ia64                          tiger_defconfig
arm                        mvebu_v7_defconfig
mips                    maltaup_xpa_defconfig
arm                       omap2plus_defconfig
arm                        clps711x_defconfig
arc                            hsdk_defconfig
openrisc                 simple_smp_defconfig
arc                              alldefconfig
m68k                          atari_defconfig
powerpc                     tqm8548_defconfig
arm                          lpd270_defconfig
arm                          exynos_defconfig
alpha                             allnoconfig
arc                               allnoconfig
arm                           u8500_defconfig
csky                                defconfig
parisc                generic-64bit_defconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
hexagon              randconfig-r045-20221019
x86_64                        randconfig-a003
hexagon              randconfig-r041-20221019
s390                 randconfig-r044-20221019
riscv                randconfig-r042-20221019
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20221018
hexagon              randconfig-r041-20221018
mips                       lemote2f_defconfig
powerpc                    socrates_defconfig
arm                         orion5x_defconfig
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                        magician_defconfig
arm                       mainstone_defconfig
powerpc                          allmodconfig
arm                         s3c2410_defconfig
mips                           ip28_defconfig
powerpc                    gamecube_defconfig
x86_64                        randconfig-k001
arm                      pxa255-idp_defconfig
mips                          ath79_defconfig
powerpc                      acadia_defconfig
arm                             mxs_defconfig
arm                       netwinder_defconfig
mips                        maltaup_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        vexpress_defconfig
mips                       rbtx49xx_defconfig
arm                           spitz_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
