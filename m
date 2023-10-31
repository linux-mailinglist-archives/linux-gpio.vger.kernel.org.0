Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65BE37DD85D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Oct 2023 23:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346820AbjJaWe1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Oct 2023 18:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346809AbjJaWe0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2023 18:34:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0312F5
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2023 15:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698791664; x=1730327664;
  h=date:from:to:cc:subject:message-id;
  bh=SJks30c/RBSKULMZ2oOT1J/81fResSQnAlu1q4Qh6CY=;
  b=Pr0yCLggcS5ii3/gUQxHpRWn4/wf+V7jKriv6j8i5q9mfWBkwm/o7luk
   ioZKx2Yl/b9uJktJG94pXlhmN0Hb2MffbzVVPP9YOg2NBxnobOOBKe0By
   Gg69SMACWB+4BWVlVDP7yZbL62Av5ScWKUfwjUbNz5EQcFCs5QFrByo9O
   Vwu++x8N8f6nx0d3Ci86F3dY7V7ZUx7MLBL72l9LUJVcPMlGNaSAdFLxv
   7a5uaauoyVoTs1RJZaKKIJ94kZaEwcfDpgne8ZkwxlxxkKUvoF/da+LyS
   meZ8YPdDOeED9Cqafx5FI4CdCf0TVSSpQttc0tUKKxQdhurAOftpbbVua
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="7007958"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="7007958"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 15:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="884349321"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="884349321"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Oct 2023 15:34:21 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qxxJS-0000QY-2s;
        Tue, 31 Oct 2023 22:34:18 +0000
Date:   Wed, 01 Nov 2023 06:33:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 63bffc2d3a99eaabc786c513eea71be3f597f175
Message-ID: <202311010644.JLNgsob1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 63bffc2d3a99eaabc786c513eea71be3f597f175  pinctrl: Use device_get_match_data()

elapsed time: 1939m

configs tested: 248
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231030   gcc  
arc                   randconfig-001-20231031   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20231030   gcc  
arm                   randconfig-001-20231031   gcc  
arm                           sama5_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231030   gcc  
i386         buildonly-randconfig-001-20231031   gcc  
i386         buildonly-randconfig-001-20231101   gcc  
i386         buildonly-randconfig-002-20231030   gcc  
i386         buildonly-randconfig-002-20231031   gcc  
i386         buildonly-randconfig-002-20231101   gcc  
i386         buildonly-randconfig-003-20231030   gcc  
i386         buildonly-randconfig-003-20231031   gcc  
i386         buildonly-randconfig-003-20231101   gcc  
i386         buildonly-randconfig-004-20231030   gcc  
i386         buildonly-randconfig-004-20231031   gcc  
i386         buildonly-randconfig-004-20231101   gcc  
i386         buildonly-randconfig-005-20231030   gcc  
i386         buildonly-randconfig-005-20231031   gcc  
i386         buildonly-randconfig-005-20231101   gcc  
i386         buildonly-randconfig-006-20231030   gcc  
i386         buildonly-randconfig-006-20231031   gcc  
i386         buildonly-randconfig-006-20231101   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231030   gcc  
i386                  randconfig-001-20231031   gcc  
i386                  randconfig-002-20231030   gcc  
i386                  randconfig-002-20231031   gcc  
i386                  randconfig-003-20231030   gcc  
i386                  randconfig-003-20231031   gcc  
i386                  randconfig-004-20231030   gcc  
i386                  randconfig-004-20231031   gcc  
i386                  randconfig-005-20231030   gcc  
i386                  randconfig-005-20231031   gcc  
i386                  randconfig-006-20231030   gcc  
i386                  randconfig-006-20231031   gcc  
i386                  randconfig-011-20231030   gcc  
i386                  randconfig-011-20231031   gcc  
i386                  randconfig-011-20231101   gcc  
i386                  randconfig-012-20231030   gcc  
i386                  randconfig-012-20231031   gcc  
i386                  randconfig-012-20231101   gcc  
i386                  randconfig-013-20231030   gcc  
i386                  randconfig-013-20231031   gcc  
i386                  randconfig-013-20231101   gcc  
i386                  randconfig-014-20231030   gcc  
i386                  randconfig-014-20231031   gcc  
i386                  randconfig-014-20231101   gcc  
i386                  randconfig-015-20231030   gcc  
i386                  randconfig-015-20231031   gcc  
i386                  randconfig-015-20231101   gcc  
i386                  randconfig-016-20231030   gcc  
i386                  randconfig-016-20231031   gcc  
i386                  randconfig-016-20231101   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20231030   gcc  
loongarch             randconfig-001-20231031   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                           jazz_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231030   gcc  
riscv                 randconfig-001-20231031   gcc  
riscv                 randconfig-001-20231101   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231030   gcc  
s390                  randconfig-001-20231031   gcc  
s390                  randconfig-001-20231101   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231031   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231030   gcc  
x86_64       buildonly-randconfig-001-20231031   gcc  
x86_64       buildonly-randconfig-002-20231030   gcc  
x86_64       buildonly-randconfig-002-20231031   gcc  
x86_64       buildonly-randconfig-003-20231030   gcc  
x86_64       buildonly-randconfig-003-20231031   gcc  
x86_64       buildonly-randconfig-004-20231030   gcc  
x86_64       buildonly-randconfig-004-20231031   gcc  
x86_64       buildonly-randconfig-005-20231030   gcc  
x86_64       buildonly-randconfig-005-20231031   gcc  
x86_64       buildonly-randconfig-006-20231030   gcc  
x86_64       buildonly-randconfig-006-20231031   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231030   gcc  
x86_64                randconfig-001-20231031   gcc  
x86_64                randconfig-001-20231101   gcc  
x86_64                randconfig-002-20231030   gcc  
x86_64                randconfig-002-20231031   gcc  
x86_64                randconfig-002-20231101   gcc  
x86_64                randconfig-003-20231030   gcc  
x86_64                randconfig-003-20231031   gcc  
x86_64                randconfig-003-20231101   gcc  
x86_64                randconfig-004-20231030   gcc  
x86_64                randconfig-004-20231031   gcc  
x86_64                randconfig-004-20231101   gcc  
x86_64                randconfig-005-20231030   gcc  
x86_64                randconfig-005-20231031   gcc  
x86_64                randconfig-005-20231101   gcc  
x86_64                randconfig-006-20231030   gcc  
x86_64                randconfig-006-20231031   gcc  
x86_64                randconfig-006-20231101   gcc  
x86_64                randconfig-011-20231030   gcc  
x86_64                randconfig-011-20231031   gcc  
x86_64                randconfig-011-20231101   gcc  
x86_64                randconfig-012-20231030   gcc  
x86_64                randconfig-012-20231031   gcc  
x86_64                randconfig-012-20231101   gcc  
x86_64                randconfig-013-20231030   gcc  
x86_64                randconfig-013-20231031   gcc  
x86_64                randconfig-013-20231101   gcc  
x86_64                randconfig-014-20231030   gcc  
x86_64                randconfig-014-20231031   gcc  
x86_64                randconfig-014-20231101   gcc  
x86_64                randconfig-015-20231030   gcc  
x86_64                randconfig-015-20231031   gcc  
x86_64                randconfig-015-20231101   gcc  
x86_64                randconfig-016-20231030   gcc  
x86_64                randconfig-016-20231031   gcc  
x86_64                randconfig-016-20231101   gcc  
x86_64                randconfig-071-20231030   gcc  
x86_64                randconfig-071-20231031   gcc  
x86_64                randconfig-071-20231101   gcc  
x86_64                randconfig-072-20231030   gcc  
x86_64                randconfig-072-20231031   gcc  
x86_64                randconfig-072-20231101   gcc  
x86_64                randconfig-073-20231030   gcc  
x86_64                randconfig-073-20231031   gcc  
x86_64                randconfig-073-20231101   gcc  
x86_64                randconfig-074-20231030   gcc  
x86_64                randconfig-074-20231031   gcc  
x86_64                randconfig-074-20231101   gcc  
x86_64                randconfig-075-20231030   gcc  
x86_64                randconfig-075-20231031   gcc  
x86_64                randconfig-075-20231101   gcc  
x86_64                randconfig-076-20231030   gcc  
x86_64                randconfig-076-20231031   gcc  
x86_64                randconfig-076-20231101   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
