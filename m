Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B0F4DA328
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 20:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240804AbiCOTRK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 15:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbiCOTRJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 15:17:09 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2063B2BB07
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647371757; x=1678907757;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bwVGIppsGXlt6DJJWIXB7PRzxTKKWGbSYruyiY3/+ZY=;
  b=jMcAlmBcU5SJMzIQIWrPGiu2f3zpJXqlCm02AFxYJ/tqEJmlLM3yzT91
   hPVrtiGegIhb5N9SAns7ArGLxEZqY8goB9i3CNr6S49dx17IelQ0FeYTT
   /eSSb7k7swBqIWCzYZ61UnJvE8Pf1kRopH+mEoCG8wwMyWuXQa105w5AX
   T0TdR28jy2l57PvJvQ0CtCW/uS0VQB+hfIht13EyN6cIjOcPQWx8GJHA+
   QGy7sJHJ3YcYRoMP1G4w72C/czH4KJk+31ONLGlr+aclnX1lEmxHMPU14
   4qAEWPKJmevf0VRlUZUP99rf5QzgbJ3hMQJ0v51CJfnV5VCL/0UQPbz0p
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="319624046"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="319624046"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 12:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="498155573"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2022 12:15:51 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nUCe7-000BP1-2Q; Tue, 15 Mar 2022 19:15:51 +0000
Date:   Wed, 16 Mar 2022 03:15:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 89388f8730699c259f8090ec435fb43569efe4ac
Message-ID: <6230e5c1.n2PyDceZFjTdfyH4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 89388f8730699c259f8090ec435fb43569efe4ac  pinctrl/rockchip: Add missing of_node_put() in rockchip_pinctrl_probe

Unverified Warning (likely false positive, please contact us if interested):

drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:626:9: sparse: sparse: obsolete array initializer, use C99 syntax

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
|-- alpha-allyesconfig
|   `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
`-- arc-allmodconfig
    `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax

elapsed time: 732m

configs tested: 181
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220314
mips                 randconfig-c004-20220314
powerpc              randconfig-c003-20220313
i386                          randconfig-c001
riscv                            allyesconfig
um                             i386_defconfig
mips                             allmodconfig
um                           x86_64_defconfig
mips                             allyesconfig
h8300                            allyesconfig
parisc                           allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
powerpc                      pasemi_defconfig
arm                       imx_v6_v7_defconfig
x86_64                              defconfig
xtensa                              defconfig
arm                         nhk8815_defconfig
powerpc                 mpc834x_itx_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
mips                        vocore2_defconfig
arm                             pxa_defconfig
sh                             espt_defconfig
powerpc64                        alldefconfig
sh                         apsh4a3a_defconfig
sh                           se7780_defconfig
arc                         haps_hs_defconfig
h8300                    h8300h-sim_defconfig
s390                          debug_defconfig
arm                         lubbock_defconfig
powerpc                 canyonlands_defconfig
xtensa                  cadence_csp_defconfig
arc                          axs101_defconfig
openrisc                  or1klitex_defconfig
arm                            xcep_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            migor_defconfig
powerpc                       ppc64_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7705_defconfig
powerpc                      bamboo_defconfig
csky                             alldefconfig
parisc                generic-32bit_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                  storcenter_defconfig
arm                         vf610m4_defconfig
s390                       zfcpdump_defconfig
sh                          r7780mp_defconfig
powerpc                     tqm8548_defconfig
um                               alldefconfig
mips                           jazz_defconfig
sh                   secureedge5410_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
arm                        shmobile_defconfig
arm                          pxa910_defconfig
h8300                     edosk2674_defconfig
m68k                         apollo_defconfig
powerpc                      arches_defconfig
arm                        spear6xx_defconfig
m68k                        mvme147_defconfig
sh                             shx3_defconfig
parisc64                            defconfig
sh                         microdev_defconfig
sh                     sh7710voipgw_defconfig
arm                           stm32_defconfig
arm                            mps2_defconfig
sh                          lboxre2_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                  decstation_64_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a006-20220314
x86_64               randconfig-a001-20220314
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220313
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
arc                  randconfig-r043-20220314
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20220313
arm                  randconfig-c002-20220313
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220313
riscv                randconfig-c006-20220313
mips                 randconfig-c004-20220313
i386                          randconfig-c001
powerpc                       ebony_defconfig
mips                      bmips_stb_defconfig
arm                       cns3420vb_defconfig
arm                      pxa255-idp_defconfig
arm                        magician_defconfig
mips                           mtx1_defconfig
powerpc                          allyesconfig
powerpc               mpc834x_itxgp_defconfig
mips                     cu1000-neo_defconfig
arm                           omap1_defconfig
mips                          ath25_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314
hexagon              randconfig-r045-20220314
hexagon              randconfig-r045-20220313
riscv                randconfig-r042-20220314
hexagon              randconfig-r041-20220313
hexagon              randconfig-r041-20220314
s390                 randconfig-r044-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
