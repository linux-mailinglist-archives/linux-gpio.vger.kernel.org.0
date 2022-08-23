Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF19659CD40
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Aug 2022 02:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbiHWAjV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 20:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238589AbiHWAjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 20:39:19 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E779C4BA5A
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 17:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661215158; x=1692751158;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x03RmmRUs/Im/E5l7MHnmkDwlrIBDY/8I8CVVone1Ao=;
  b=FRHSbW4mvEFyTtjOb/G+yIh2569YP+Hx9bupsLbqmq73rPQiQ0aLMPIq
   CFq9W+5vWXaX5JGiRbJEJjb009FNp7pexs9jou03Hyhr9d67Z+Kf2GOxX
   k+55aHds0karPLfES2rSVgC1AhR0o/IeYJOUp4eF1ReoYTFgWMsY/NKi4
   wFB/EvbsC2QmIpKWcLxiqJW9nvG9Q0YlsDQuPAu8CPdXSblzw+LBCwyQz
   aXRJN5RYp4mIpIe5bXfi98N2bK1k7z6tCHcyiDSsDULPuHeMZvsd49Kx/
   YhGGCf9VrjsWwDWY3vMvDym8oNfI0cDBimYD+gSN0gYHUvbhIFFgMkiQl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="319595043"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="319595043"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 17:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="612226961"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2022 17:39:17 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQHwq-0000uV-39;
        Tue, 23 Aug 2022 00:39:16 +0000
Date:   Tue, 23 Aug 2022 08:38:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 64e4744ee1448e786e3cafd9121e22ef98a5f8ff
Message-ID: <6304219c.0YGNXo9yZHQMOMn9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 64e4744ee1448e786e3cafd9121e22ef98a5f8ff  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 155
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
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
