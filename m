Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE215A1E57
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 03:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244595AbiHZBsq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 21:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244596AbiHZBsp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 21:48:45 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B936C7BAB
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 18:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661478524; x=1693014524;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=neqElFNGJ19Q1nvzCkYkSKeSgNX8l1a6dXlbBD49U7I=;
  b=g9wCjCemNAG2LMRawFjLXqtYmdEtYUxlLOIs20orjwhqYEtKV1zZV7L4
   VZ5+R462SCzISCkdehjBaZyrcRZQjcr7CnuxXZlIhRA5xojvRd9M62r4L
   Tnr9HUVUg39zBDowDmz1PWzvJOoiiz0OPeOiW4GqGuI7cKk7JdPyu7ifA
   adaFcqj4ShXo8ZlW4BYm14rFgR+5GQOrsduIU9XrpZA1Aw9UuaqWvYLEM
   FX/e8Ysbjg0neYWN4Iqjag/2cE19RyeIlXUf+4zuJOXGJbijaT3iKUMGM
   DDztsBjve6kHjAVeho/ZSxgNmJhEQ2D9pIzLwUhmaLticd2ki61QHn0fM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="274793724"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="274793724"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 18:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="587121563"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2022 18:48:42 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oROSf-0003EU-35;
        Fri, 26 Aug 2022 01:48:41 +0000
Date:   Fri, 26 Aug 2022 09:48:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 a0d281349ac5b6c58b507afe5ce0e5eb450f888c
Message-ID: <63082671.YdWxpx1cbeNAdhKg%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: a0d281349ac5b6c58b507afe5ce0e5eb450f888c  Merge branch 'devel' into for-next

elapsed time: 721m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
loongarch                         allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
loongarch                           defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
sh                               allmodconfig
i386                                defconfig
powerpc                          allmodconfig
mips                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a013
i386                          randconfig-a014
x86_64                        randconfig-a011
arm                                 defconfig
x86_64                        randconfig-a004
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a002
x86_64                        randconfig-a015
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-a006
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                        m5272c3_defconfig
arm                          iop32x_defconfig
arm                          gemini_defconfig
powerpc                     tqm8548_defconfig
riscv                randconfig-r042-20220824
s390                 randconfig-r044-20220824
arc                  randconfig-r043-20220824
arc                  randconfig-r043-20220825
sparc                       sparc32_defconfig
sh                           se7750_defconfig
sh                         microdev_defconfig
arc                     nsimosci_hs_defconfig
sh                            hp6xx_defconfig
m68k                           virt_defconfig
arm                            qcom_defconfig
m68k                       bvme6000_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
i386                          randconfig-c001
arm                       imx_v6_v7_defconfig
ia64                             alldefconfig
powerpc                 mpc8540_ads_defconfig
mips                           gcw0_defconfig
ia64                             allmodconfig
sh                            shmin_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                      fuloong2e_defconfig
arm64                               defconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig

clang tested configs:
i386                          randconfig-a011
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-k001
hexagon              randconfig-r045-20220825
hexagon              randconfig-r045-20220823
riscv                randconfig-r042-20220823
riscv                randconfig-r042-20220825
hexagon              randconfig-r041-20220823
hexagon              randconfig-r041-20220825
s390                 randconfig-r044-20220825
s390                 randconfig-r044-20220823

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
