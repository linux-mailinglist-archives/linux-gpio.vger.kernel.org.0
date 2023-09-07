Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9972796F3C
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 05:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjIGDTN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Sep 2023 23:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjIGDTM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Sep 2023 23:19:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E447132
        for <linux-gpio@vger.kernel.org>; Wed,  6 Sep 2023 20:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694056748; x=1725592748;
  h=date:from:to:cc:subject:message-id;
  bh=AqnvDtofu48RKDsfOhg/XUydrLWYn9/hQ3QW4Rx4aWU=;
  b=RvfV7LhuvGk5iiQW4ZgT0tiQaIMFZ1GccNtpfD9QF5Qrc56ElSOSRift
   ziHlmlK9xauZ6A5fNPGb+CgHVxYOKl/KclWNZdwlkk2AWJDP8scmX1ehT
   KJMIq0wYQ6loXMfXuoE8/6VmN0LgAN5JyMgdlschw3BacJuSlyu63gJSw
   Mr2vaqQIxyFIfYjpf+Z/qZMy8VrPh2BOiGGs9mM3KujOAk8+kGH2quxbw
   gvxR7sh45yZInUXOXtIEIwygNUqJB8PC6yXbHxd+HdRigMVkCSXYavjgj
   YzXh/a8qp87yofdHZam/w9HimL0z8HXQd6Co5jlQvRtRXActaD4yRd7YM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357558953"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="357558953"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 20:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="735322883"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="735322883"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Sep 2023 20:18:36 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qe5XN-0000pj-2T;
        Thu, 07 Sep 2023 03:18:33 +0000
Date:   Thu, 07 Sep 2023 11:17:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 180b10bd160b014448366e5bc86e0558f8acb74f
Message-ID: <202309071148.iKeLD5pM-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 180b10bd160b014448366e5bc86e0558f8acb74f  gpio: zynq: restore zynq_gpio_irq_reqres/zynq_gpio_irq_relres callbacks

elapsed time: 723m

configs tested: 251
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230906   gcc  
alpha                randconfig-r015-20230906   gcc  
alpha                randconfig-r016-20230907   gcc  
alpha                randconfig-r022-20230906   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20230906   gcc  
arc                  randconfig-r003-20230907   gcc  
arc                  randconfig-r011-20230907   gcc  
arc                  randconfig-r013-20230907   gcc  
arc                  randconfig-r026-20230907   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                      footbridge_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20230906   gcc  
arm                   randconfig-001-20230907   clang
arm                  randconfig-r002-20230907   gcc  
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230906   gcc  
csky                 randconfig-r021-20230906   gcc  
hexagon               randconfig-001-20230906   clang
hexagon               randconfig-001-20230907   clang
hexagon               randconfig-002-20230906   clang
hexagon               randconfig-002-20230907   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230907   clang
i386         buildonly-randconfig-002-20230907   clang
i386         buildonly-randconfig-003-20230907   clang
i386         buildonly-randconfig-004-20230907   clang
i386         buildonly-randconfig-005-20230907   clang
i386         buildonly-randconfig-006-20230907   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230907   clang
i386                  randconfig-002-20230907   clang
i386                  randconfig-003-20230907   clang
i386                  randconfig-004-20230907   clang
i386                  randconfig-005-20230907   clang
i386                  randconfig-006-20230907   clang
i386                  randconfig-011-20230907   gcc  
i386                  randconfig-012-20230907   gcc  
i386                  randconfig-013-20230907   gcc  
i386                  randconfig-014-20230907   gcc  
i386                  randconfig-015-20230907   gcc  
i386                  randconfig-016-20230907   gcc  
i386                 randconfig-r005-20230906   gcc  
i386                 randconfig-r011-20230906   clang
i386                 randconfig-r014-20230906   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230907   gcc  
loongarch            randconfig-r023-20230907   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r006-20230907   gcc  
m68k                 randconfig-r024-20230907   gcc  
m68k                 randconfig-r034-20230907   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r001-20230906   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                           jazz_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230907   gcc  
nios2                randconfig-r023-20230907   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r002-20230906   gcc  
openrisc             randconfig-r004-20230907   gcc  
openrisc             randconfig-r012-20230907   gcc  
openrisc             randconfig-r015-20230907   gcc  
openrisc             randconfig-r035-20230907   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r033-20230907   clang
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20230906   gcc  
riscv                 randconfig-001-20230907   clang
riscv                randconfig-r005-20230907   clang
riscv                randconfig-r011-20230907   gcc  
riscv                randconfig-r016-20230907   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230906   clang
s390                 randconfig-r001-20230907   clang
s390                 randconfig-r012-20230907   gcc  
s390                 randconfig-r013-20230906   clang
s390                 randconfig-r022-20230907   gcc  
s390                 randconfig-r025-20230906   clang
s390                 randconfig-r031-20230907   clang
s390                 randconfig-r036-20230907   clang
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r001-20230907   gcc  
sh                   randconfig-r003-20230906   gcc  
sh                   randconfig-r006-20230906   gcc  
sh                   randconfig-r022-20230907   gcc  
sh                   randconfig-r024-20230906   gcc  
sh                   randconfig-r033-20230907   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230906   gcc  
sparc                randconfig-r025-20230907   gcc  
sparc                randconfig-r026-20230906   gcc  
sparc                randconfig-r033-20230907   gcc  
sparc                randconfig-r034-20230907   gcc  
sparc                randconfig-r035-20230907   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r012-20230906   gcc  
sparc64              randconfig-r032-20230907   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230906   gcc  
x86_64       buildonly-randconfig-001-20230907   clang
x86_64       buildonly-randconfig-002-20230906   gcc  
x86_64       buildonly-randconfig-002-20230907   clang
x86_64       buildonly-randconfig-003-20230906   gcc  
x86_64       buildonly-randconfig-003-20230907   clang
x86_64       buildonly-randconfig-004-20230906   gcc  
x86_64       buildonly-randconfig-004-20230907   clang
x86_64       buildonly-randconfig-005-20230906   gcc  
x86_64       buildonly-randconfig-005-20230907   clang
x86_64       buildonly-randconfig-006-20230906   gcc  
x86_64       buildonly-randconfig-006-20230907   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230907   gcc  
x86_64                randconfig-002-20230907   gcc  
x86_64                randconfig-003-20230907   gcc  
x86_64                randconfig-004-20230907   gcc  
x86_64                randconfig-005-20230907   gcc  
x86_64                randconfig-006-20230907   gcc  
x86_64                randconfig-011-20230906   gcc  
x86_64                randconfig-011-20230907   clang
x86_64                randconfig-012-20230906   gcc  
x86_64                randconfig-012-20230907   clang
x86_64                randconfig-013-20230906   gcc  
x86_64                randconfig-013-20230907   clang
x86_64                randconfig-014-20230906   gcc  
x86_64                randconfig-014-20230907   clang
x86_64                randconfig-015-20230906   gcc  
x86_64                randconfig-015-20230907   clang
x86_64                randconfig-016-20230906   gcc  
x86_64                randconfig-016-20230907   clang
x86_64                randconfig-071-20230906   gcc  
x86_64                randconfig-071-20230907   clang
x86_64                randconfig-072-20230906   gcc  
x86_64                randconfig-072-20230907   clang
x86_64                randconfig-073-20230906   gcc  
x86_64                randconfig-073-20230907   clang
x86_64                randconfig-074-20230906   gcc  
x86_64                randconfig-074-20230907   clang
x86_64                randconfig-075-20230906   gcc  
x86_64                randconfig-075-20230907   clang
x86_64                randconfig-076-20230906   gcc  
x86_64                randconfig-076-20230907   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r014-20230907   gcc  
xtensa               randconfig-r021-20230907   gcc  
xtensa               randconfig-r024-20230907   gcc  
xtensa               randconfig-r032-20230907   gcc  
xtensa               randconfig-r036-20230907   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
