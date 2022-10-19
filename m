Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41AC6038E8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 06:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiJSEfc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 00:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJSEfb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 00:35:31 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68674C626
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 21:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666154130; x=1697690130;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TYMvNSBYp4OpI+OdtXam/lHN6A6HtKznJeKe/gQ5PFg=;
  b=HrvMsKwbrVtdKCcg/ahx7FdDA/kIuZfWbUtySKbaVGG38dXBQvutHKaK
   16al3EO5HNBmzXN6SjxOG3Xl5736SPj8tTnhWZfwT9KxPDQyfBLhMXzq/
   FolxhQV8havYUyMvAaVvV3nytrxvzu2EfhUrG3MgIvxs6kone7NFqvC+z
   t+eFGypjg/a0/IVe7DI9CFKyDPj6rMJz93jj/oazbKTNQ/dbR4KB6g3ch
   L8dfwtYX22pjB29Ux/cZB/XcA6y/VETkBzeC+pAOHwowHY9ZPb9UBcT43
   abxUUXSCPdMpMcmpvHVwDSUkz8OJ0fLybge2aM6ILR48q+M0R/McN4NAv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="307411853"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="307411853"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 21:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="692170495"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="692170495"
Received: from lkp-server01.sh.intel.com (HELO 8381f64adc98) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Oct 2022 21:35:28 -0700
Received: from kbuild by 8381f64adc98 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ol0nf-0002S4-2m;
        Wed, 19 Oct 2022 04:35:27 +0000
Date:   Wed, 19 Oct 2022 12:34:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 e9945b2633deccda74a769d94060df49c53ff181
Message-ID: <634f7e64.HSfu3bi+QeNHhE9p%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: e9945b2633deccda74a769d94060df49c53ff181  pinctrl: ocelot: Fix incorrect trigger of the interrupt.

elapsed time: 884m

configs tested: 144
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                                defconfig
s390                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a013
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                               rhel-8.3
x86_64                        randconfig-a015
x86_64                           allyesconfig
i386                             allyesconfig
mips                             allyesconfig
arc                              allyesconfig
powerpc                           allnoconfig
alpha                            allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
powerpc                          allmodconfig
xtensa                  audio_kc705_defconfig
arc                           tb10x_defconfig
openrisc                 simple_smp_defconfig
sh                   sh7724_generic_defconfig
ia64                          tiger_defconfig
microblaze                      mmu_defconfig
powerpc                      ppc6xx_defconfig
arc                  randconfig-r043-20221018
s390                 randconfig-r044-20221018
riscv                randconfig-r042-20221018
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
sparc                             allnoconfig
powerpc                     tqm8541_defconfig
mips                  maltasmvp_eva_defconfig
m68k                             allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
powerpc                     stx_gp3_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc834x_mds_defconfig
i386                          randconfig-c001
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
arm                        cerfcube_defconfig
sh                  sh7785lcr_32bit_defconfig
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
powerpc                      ep88xc_defconfig
arm                         lpc18xx_defconfig
csky                              allnoconfig
arm                            mps2_defconfig
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
x86_64                        randconfig-c001
arm                  randconfig-c002-20221018
parisc                              defconfig
sh                            shmin_defconfig
sh                         apsh4a3a_defconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a014
x86_64                        randconfig-k001
x86_64                        randconfig-c007
mips                 randconfig-c004-20221018
i386                          randconfig-c001
s390                 randconfig-c005-20221018
arm                  randconfig-c002-20221018
riscv                randconfig-c006-20221018
powerpc              randconfig-c003-20221018
arm                      tct_hammer_defconfig
riscv                             allnoconfig
arm                      pxa255-idp_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      ppc44x_defconfig
mips                        maltaup_defconfig
arm                                 defconfig
mips                           rs90_defconfig
powerpc                          g5_defconfig
powerpc                   lite5200b_defconfig
arm                         socfpga_defconfig
mips                 randconfig-c004-20221019
s390                 randconfig-c005-20221019
arm                  randconfig-c002-20221019
riscv                randconfig-c006-20221019
powerpc              randconfig-c003-20221019

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
