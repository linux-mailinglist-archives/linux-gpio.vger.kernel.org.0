Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0339D59CD41
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Aug 2022 02:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238558AbiHWAjV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 20:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238614AbiHWAjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 20:39:19 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280FD4BA5D
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 17:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661215159; x=1692751159;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZlU8T99LROfcR/HpvGcM7zLCg16ksF0hj2WCltfQoJk=;
  b=HBrqL4fEJ5W3yUx070vtF2zfqzHMNJqVzHcRmgHl0p3CbHGIzUSj+UA+
   49GwkDxLM9uddHK7ELrmSPz9aq43rMTeO5fWP/+3aFZQqt1eavnafrKOv
   VbE5Ba1HmdFywm/yOO1mSjY0sv4JHpx3bvA+Sj+BouHyOcgsqFses1OXd
   VGJvZJKkMz4HPMpNSs3YR2DUpDfiaJdegjoHd8puyogmZG5Kym4wMQ5fx
   VzPjnDvErRqswTdUr6lzL+lU+74pKt46/AXPL1zSMEs78eLn+DdHJLDeY
   GHv8mM8L6J92WFFPT/MfBHQFqQlnL3SWItDI5NBafJFD2njcEtqdnDKMd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294840088"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="294840088"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 17:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="609155942"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Aug 2022 17:39:17 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQHwq-0000uQ-2w;
        Tue, 23 Aug 2022 00:39:16 +0000
Date:   Tue, 23 Aug 2022 08:38:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 27586b851bae62296b77687a58a8c92ab84d5274
Message-ID: <6304219f.oiXSmcAyeFIMQNjx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 27586b851bae62296b77687a58a8c92ab84d5274  dt-bindings: pinctrl: aspeed: Add missing properties to examples

elapsed time: 724m

configs tested: 155
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                             allyesconfig
i386                                defconfig
sh                          rsk7201_defconfig
powerpc                 canyonlands_defconfig
arm                          badge4_defconfig
i386                 randconfig-a015-20220822
i386                 randconfig-a016-20220822
i386                 randconfig-a011-20220822
i386                 randconfig-a013-20220822
i386                 randconfig-a014-20220822
i386                 randconfig-a012-20220822
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
sh                   sh7724_generic_defconfig
sh                            titan_defconfig
s390                             allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64               randconfig-a013-20220822
x86_64               randconfig-a014-20220822
x86_64               randconfig-a011-20220822
x86_64               randconfig-a016-20220822
x86_64               randconfig-a012-20220822
x86_64               randconfig-a015-20220822
riscv                randconfig-r042-20220822
s390                 randconfig-r044-20220822
arc                  randconfig-r043-20220822
arc                  randconfig-r043-20220821
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
loongarch                           defconfig
loongarch                         allnoconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                          rsk7264_defconfig
arc                     haps_hs_smp_defconfig
arm                          exynos_defconfig
xtensa                  nommu_kc705_defconfig
mips                            gpr_defconfig
sh                   sh7770_generic_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
m68k                             allmodconfig
arm                         lubbock_defconfig
sh                                  defconfig
parisc                generic-32bit_defconfig
i386                          randconfig-c001
arm                      footbridge_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc85xx_cds_defconfig
loongarch                 loongson3_defconfig
mips                           xway_defconfig
arc                              alldefconfig
arc                                 defconfig
sparc                               defconfig
powerpc                      ppc6xx_defconfig
sh                          rsk7269_defconfig
ia64                            zx1_defconfig
arm                        oxnas_v6_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                        cell_defconfig
arm                             pxa_defconfig
mips                    maltaup_xpa_defconfig
mips                          rb532_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                    amigaone_defconfig
arc                           tb10x_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          amiga_defconfig
sh                               j2_defconfig
powerpc                     taishan_defconfig
arm                        cerfcube_defconfig
powerpc                mpc7448_hpc2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220823
ia64                             allmodconfig
s390                                defconfig
alpha                               defconfig
s390                             allyesconfig
powerpc                    sam440ep_defconfig
arm                  randconfig-c002-20220821

clang tested configs:
hexagon              randconfig-r045-20220821
riscv                randconfig-r042-20220821
hexagon              randconfig-r041-20220821
s390                 randconfig-r044-20220821
powerpc                      katmai_defconfig
arm                        neponset_defconfig
mips                      maltaaprp_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          moxart_defconfig
arm                         bcm2835_defconfig
i386                 randconfig-a002-20220822
i386                 randconfig-a005-20220822
i386                 randconfig-a001-20220822
i386                 randconfig-a006-20220822
i386                 randconfig-a003-20220822
i386                 randconfig-a004-20220822
x86_64               randconfig-a002-20220822
x86_64               randconfig-a005-20220822
x86_64               randconfig-a006-20220822
x86_64               randconfig-a003-20220822
x86_64               randconfig-a001-20220822
x86_64               randconfig-a004-20220822
x86_64                        randconfig-k001
arm                     am200epdkit_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     mpc5200_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
powerpc                        fsp2_defconfig
arm                          sp7021_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                    gamecube_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
arm                         palmz72_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
powerpc                     tqm5200_defconfig
arm                          pxa168_defconfig
arm                          ixp4xx_defconfig
arm                         socfpga_defconfig
mips                malta_qemu_32r6_defconfig
mips                           rs90_defconfig
arm                         s3c2410_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
