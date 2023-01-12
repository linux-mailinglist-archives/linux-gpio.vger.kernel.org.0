Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADF0F6669EA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jan 2023 05:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbjALECr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 23:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235483AbjALECp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 23:02:45 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773484BD71
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 20:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673496164; x=1705032164;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=93OVPihUwrbNUMheLcZho0eGSfOFo/1UwnWNezGKjeU=;
  b=CO/KpVIAOgqHtlvVKPpIm7CqqUqeFWPf7gTNbFrE8i98evgdsJH8FP2e
   qhvLOb9xH/ypVvjSyWsf97agVM79sfLnhGDoG8ZboTWkBLcbDlbAwpK0k
   5Asfv3TNe2IynSJcI/9ShoyR+x78LAUSMuUKZUnT8r+JzDwImnR4vuCYS
   N0BlmNLIvELuIprjU/1c/Z9erZVHBWW+w7yxru3WjvivPiikd86yD09A6
   K6keVZKzmUQJjUbmTdB9TPTPR1wTZUClLfvDwJmKk7yF/bkig3HKozJFz
   60QOmm3kBkbVzRRSaDKo5nAjz5UqS8sPI/j5vo+ANTUoIDSV857Dv1Kts
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322309002"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="322309002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 20:02:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="903025955"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="903025955"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jan 2023 20:02:42 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFonV-0009mC-0N;
        Thu, 12 Jan 2023 04:02:37 +0000
Date:   Thu, 12 Jan 2023 12:02:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-media] BUILD SUCCESS
 64d51d8c2ab3dd6a5eee060162e2f0796bfab82c
Message-ID: <63bf8658.MW1V2UU4JnLvTjcs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-media
branch HEAD: 64d51d8c2ab3dd6a5eee060162e2f0796bfab82c  media: em28xx: Drop abuse of gpiolib

elapsed time: 726m

configs tested: 94
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                               rhel-8.3
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
mips                             allyesconfig
alpha                               defconfig
x86_64                           allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
s390                                defconfig
m68k                             allmodconfig
arc                  randconfig-r043-20230110
arc                              allyesconfig
s390                 randconfig-r044-20230110
riscv                randconfig-r042-20230110
i386                                defconfig
powerpc                          allmodconfig
s390                             allyesconfig
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
um                             i386_defconfig
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-bpf
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm64                            allyesconfig
i386                             allyesconfig
i386                          randconfig-a005
arm                              allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a015
m68k                         amcore_defconfig
arm                        multi_v7_defconfig
sh                              ul2_defconfig
m68k                             alldefconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                    klondike_defconfig
arm                          gemini_defconfig
powerpc                     tqm8548_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                  sh7785lcr_32bit_defconfig
powerpc                     pq2fads_defconfig
alpha                            alldefconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r041-20230110
arm                  randconfig-r046-20230110
hexagon              randconfig-r045-20230110
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a001
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a003
i386                          randconfig-a015
x86_64                        randconfig-a014
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a016
powerpc                      chrp32_defconfig
powerpc                        fsp2_defconfig
arm                         shannon_defconfig
x86_64                        randconfig-k001
arm                         s5pv210_defconfig
hexagon                          alldefconfig
powerpc                     ksi8560_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
