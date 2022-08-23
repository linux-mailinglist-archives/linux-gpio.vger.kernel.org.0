Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66EFF59CD3F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Aug 2022 02:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238446AbiHWAjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 20:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238558AbiHWAjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 20:39:19 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEA74BA56
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 17:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661215158; x=1692751158;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sUmGV3lm1xyjIER7SVye0gc3ISd5q8qHLl85FL5fPX0=;
  b=H6iI3CZGE8P/aXUClsQGhvaJENXiXx2smqbvTQVLaUMycOKHjFNizPnN
   8U/eUcz1XZ7yFF1dugoVLfP9trIA13Dt3tdYC5BnLIY0agJ64Tw11bdCf
   VE4V20/tQ6anuID6rudJ0gYXFdZYBlZb2ezrUCw+cuEQIfqts6bRISr8c
   kgh9hU4fuVfnW3ZNmfnztrEH9JdWiHvh/2t0ckOp9LRuJ0K+hVzTmH/Vl
   L/cF6Xh4pe5Yk8ri+ikjQ3GQvythbweytjBE+qGMF6IV0IfrrNQu1rnRw
   Mmyrdy+B1lQeAJksHhzRFDxgLVWGhJC2+tndFTChnmlgpuowrzaSXXleG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="291112646"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="291112646"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 17:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="854671980"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2022 17:39:17 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQHwq-0000uS-33;
        Tue, 23 Aug 2022 00:39:16 +0000
Date:   Tue, 23 Aug 2022 08:38:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 2648ede07315728963347e7eea148f53a646bb19
Message-ID: <63042199.hT8gWQPEsdp/HXEV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 2648ede07315728963347e7eea148f53a646bb19  pinctrl: rockchip: Enhance support for IRQ_TYPE_EDGE_BOTH

elapsed time: 724m

configs tested: 155
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
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
