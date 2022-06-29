Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4342255FB22
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 10:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiF2I5z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 04:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiF2I5y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 04:57:54 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B613C703
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 01:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656493074; x=1688029074;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pSfd2Q5DbRrLDr78bbFvVphOS/e8SiYlFDo0Vn7CFZI=;
  b=cBBa+bvV7f2PXuTcrHKvNbE/NSkaN2PWoqbKZ/Tiktzp2xMAd/oO/grW
   d/VZ4RdCXddSe7F45Uz+OhsJjwxOphc2NW8YWch1JKfHhF+4e6L36FAi1
   /5ke2qo1eyyOXKRyzG38wpBabxC3rZrFotm+6RsS650kBW4mtBWYkOd8c
   H0MdILR8Bu9SvRSC7ox7CK1snzdW+YYVpazwNs6vg+Sy3t1J3vQhKkrYt
   vLfocESplYrlvL0CgeOL7tL5FvvAA7BsvwFIjpCDyK+LQ7Z5o+m91+BIb
   HxIhLopYxDbGV19Bsr5Mplu5wo2o1zf7p7w2dYczZF5KoBJbvP+6E28E+
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="368289941"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="368289941"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 01:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="658478160"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jun 2022 01:57:53 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o6TWC-000B2K-7X;
        Wed, 29 Jun 2022 08:57:52 +0000
Date:   Wed, 29 Jun 2022 16:57:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 a1d4ef1adf8bbd302067534ead671a94759687ed
Message-ID: <62bc13e9.wfHpb+bPqSCzVLbK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: a1d4ef1adf8bbd302067534ead671a94759687ed  pinctrl: stm32: fix optional IRQ support to gpios

elapsed time: 1089m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220627
i386                          randconfig-c001
xtensa                  audio_kc705_defconfig
sh                              ul2_defconfig
sh                               j2_defconfig
sh                           se7343_defconfig
parisc64                         alldefconfig
powerpc                      ppc40x_defconfig
arm                        realview_defconfig
arm                            pleb_defconfig
parisc64                            defconfig
arm                          pxa910_defconfig
i386                             alldefconfig
powerpc                         ps3_defconfig
m68k                        stmark2_defconfig
arm                            mps2_defconfig
arm                          simpad_defconfig
sh                ecovec24-romimage_defconfig
arm                            hisi_defconfig
arc                     nsimosci_hs_defconfig
arm                        cerfcube_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc837x_mds_defconfig
sh                           se7712_defconfig
arm                      jornada720_defconfig
sh                           se7721_defconfig
m68k                             allmodconfig
sh                  sh7785lcr_32bit_defconfig
arm                             ezx_defconfig
powerpc                       holly_defconfig
ia64                         bigsur_defconfig
arm                       aspeed_g5_defconfig
sh                   sh7770_generic_defconfig
arc                            hsdk_defconfig
arm                         cm_x300_defconfig
riscv                            allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64               randconfig-c001-20220627
arm                  randconfig-c002-20220627
ia64                             allmodconfig
x86_64               randconfig-k001-20220627
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64               randconfig-a013-20220627
x86_64               randconfig-a012-20220627
x86_64               randconfig-a016-20220627
x86_64               randconfig-a015-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a014-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a016-20220627
i386                 randconfig-a013-20220627
arc                  randconfig-r043-20220627
s390                 randconfig-r044-20220627
riscv                randconfig-r042-20220627
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                      pxa255-idp_defconfig
arm                            dove_defconfig
mips                       lemote2f_defconfig
arm                         lpc32xx_defconfig
arm                        neponset_defconfig
x86_64                        randconfig-k001
x86_64               randconfig-a004-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
i386                 randconfig-a002-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a005-20220627
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
