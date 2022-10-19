Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD2C6037AE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 03:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiJSBwQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 21:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiJSBwP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 21:52:15 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B680390801
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 18:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666144334; x=1697680334;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9NQMFGUUGshGzCweGGtC44O/XvI/d+JDVbsHM+odt7M=;
  b=NnKg46H3lkL6bS8xQmfjz4Ahtr4ra8gXsQSp+fIgtmlHkIxAX14l10jD
   X2j6LfaKrtkxrMIjvlnEmXM/zxzn1js9oxV5gUEzsAYjuKkMQQf+ANIsz
   8Rpj5DyTK3tn6ciYdFq6g2FD1/ACpwBRhVTLcxlEXOlp7WWuZ4jH1aOlF
   y40OqZ0+/R0lZuc/shr2+Wc2WeaxL/qoqvRfZM5YIGPT9l+u4fC0K/jEi
   nW293Z/j+E0XCAPIh0VEjVFOk50ozINO/B9tFbv051SnD7DymtiZp/aPy
   t49aWjF1ZSR/SXWaV2NfGpH3s6BmToBJk7mJ1SFB33VqBHjJ8wc7JCT0B
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="368334374"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; 
   d="scan'208";a="368334374"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 18:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="606843833"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; 
   d="scan'208";a="606843833"
Received: from lkp-server01.sh.intel.com (HELO 8381f64adc98) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Oct 2022 18:52:13 -0700
Received: from kbuild by 8381f64adc98 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1okyFg-0002Fz-1G;
        Wed, 19 Oct 2022 01:52:12 +0000
Date:   Wed, 19 Oct 2022 09:51:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 60031704a7942f81a0cbcbe4dafbb69a25aa9d62
Message-ID: <634f581e.Y9NZZwBGCXXITf13%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 60031704a7942f81a0cbcbe4dafbb69a25aa9d62  Merge branch 'devel' into for-next

elapsed time: 721m

configs tested: 136
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221018
s390                 randconfig-r044-20221018
riscv                randconfig-r042-20221018
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
m68k                             allyesconfig
arm                        cerfcube_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                           jazz_defconfig
arm                         lpc18xx_defconfig
powerpc                     asp8347_defconfig
mips                  maltasmvp_eva_defconfig
i386                          randconfig-c001
xtensa                  audio_kc705_defconfig
arc                           tb10x_defconfig
openrisc                 simple_smp_defconfig
sh                   sh7724_generic_defconfig
ia64                          tiger_defconfig
microblaze                      mmu_defconfig
powerpc                      ppc6xx_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
sparc                             allnoconfig
powerpc                     tqm8541_defconfig
powerpc                     stx_gp3_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        trizeps4_defconfig
powerpc                 linkstation_defconfig
m68k                        mvme16x_defconfig
ia64                                defconfig
arm                        mvebu_v7_defconfig
nios2                               defconfig
m68k                          amiga_defconfig
openrisc                         alldefconfig
arm                      jornada720_defconfig
ia64                             allmodconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221018
powerpc                      ep88xc_defconfig
csky                              allnoconfig
arm                            mps2_defconfig
arm                       imx_v6_v7_defconfig
sparc                       sparc64_defconfig
m68k                       m5475evb_defconfig
arm                          gemini_defconfig
arc                  randconfig-r043-20221017
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                        spear6xx_defconfig
arm                         assabet_defconfig
mips                 decstation_r4k_defconfig
sh                          r7780mp_defconfig
arm                         axm55xx_defconfig
ia64                        generic_defconfig
arm                           tegra_defconfig
powerpc                      chrp32_defconfig
mips                         db1xxx_defconfig
powerpc                  storcenter_defconfig
powerpc                 canyonlands_defconfig
sh                          urquell_defconfig
m68k                                defconfig
sh                 kfr2r09-romimage_defconfig
s390                       zfcpdump_defconfig
openrisc                            defconfig
powerpc                     tqm8548_defconfig
openrisc                  or1klitex_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
x86_64                        randconfig-c007
mips                 randconfig-c004-20221018
i386                          randconfig-c001
s390                 randconfig-c005-20221018
arm                  randconfig-c002-20221018
riscv                randconfig-c006-20221018
powerpc              randconfig-c003-20221018
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
arm                      tct_hammer_defconfig
riscv                             allnoconfig
arm                      pxa255-idp_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                 mpc832x_mds_defconfig
powerpc                      ppc44x_defconfig
mips                        maltaup_defconfig
arm                                 defconfig
mips                           rs90_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
