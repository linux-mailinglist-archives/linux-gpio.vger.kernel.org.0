Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B659C608091
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 23:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiJUVLN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 17:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiJUVLM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 17:11:12 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B01225E8B9
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666386671; x=1697922671;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zxmvMTuvu+ZnBDKZQynxDDnqchYiqDRuNWUIIUB4wbY=;
  b=QhuLpIlsG/l2Xj5aCkM4FlhfHfbNV2uKN2lpcokfcRD8jARFULlDh+pU
   7M+vYUnJaTZBfftly7JWrgNFHFepGLqEdWUVgctOoVYWdtLSQ43mdLSva
   +DCzooNaV8ckffOGzKSVgnEfQNXeebq392JNW3HOX9SiNDq6mqr3kotPX
   gOSHYLTxB4XhVbdFm9w1P8WHbgmrBS3Q/FO+l1mdUiJEYsqazxJtfGaO5
   gkzkZLlHA1FGa3cDqBrTschk/n0+bRUVPA+Bguut6BFEnBcKU5Iy6yjAa
   AmevMlfQx1NI/zGEcfW6mZ8jqDNy3aypM164NCyKxCTca1toVrLnDbZNQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="393414931"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="393414931"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 14:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="719877963"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="719877963"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2022 14:11:09 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1olzIK-0002yS-2z;
        Fri, 21 Oct 2022 21:11:08 +0000
Date:   Sat, 22 Oct 2022 05:10:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 417c326091b06eadb93511e638e8c36230dae2e6
Message-ID: <63530ac1.YcZtoWvLS6Jam18B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 417c326091b06eadb93511e638e8c36230dae2e6  pinctrl: cy8c95x0: Don't use cy8c95x0_set_mode() twice

elapsed time: 727m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
alpha                               defconfig
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
s390                                defconfig
m68k                             allmodconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                                defconfig
arc                  randconfig-r043-20221018
mips                             allyesconfig
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
x86_64                        randconfig-a004
riscv                randconfig-r042-20221018
x86_64                         rhel-8.3-kunit
s390                 randconfig-r044-20221018
x86_64                        randconfig-a002
x86_64                              defconfig
m68k                             allyesconfig
x86_64                        randconfig-a006
i386                             allyesconfig
arm                                 defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
sh                           se7750_defconfig
sh                           se7343_defconfig
nios2                         10m50_defconfig
i386                          randconfig-a001
i386                          randconfig-a012
i386                          randconfig-a003
i386                          randconfig-a016
i386                          randconfig-a005
i386                          randconfig-a014
arm                              allyesconfig
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
m68k                       m5475evb_defconfig
xtensa                              defconfig
sparc                            alldefconfig
arm                          badge4_defconfig
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
arc                  randconfig-r043-20221019
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
hexagon              randconfig-r045-20221018
hexagon              randconfig-r041-20221018
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a015
i386                          randconfig-a006
i386                          randconfig-a004
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
s390                 randconfig-r044-20221019
hexagon              randconfig-r045-20221019
riscv                randconfig-r042-20221019
hexagon              randconfig-r041-20221019
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
