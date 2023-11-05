Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18DD47E1261
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Nov 2023 07:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjKEGYK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Nov 2023 01:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjKEGYJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Nov 2023 01:24:09 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A9DC6
        for <linux-gpio@vger.kernel.org>; Sat,  4 Nov 2023 23:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699165445; x=1730701445;
  h=date:from:to:cc:subject:message-id;
  bh=BMgcQTYoM8GlcRnquYJQ1EPA8u7zGL8R+jLEPgl8kEc=;
  b=bxMpQXNSH+SnovbVNa7SuQPDlVUsEOtqSSLmMnbd0yQS+6BzDinerj0d
   jwyxjSGBo/cUhQEip44dXQckg01p/yB9NGuXoxpb+3w0KyMfucI+i2Ipr
   E3jj4InGU8Zrtcgn1OspZCyBl/QOEjAF7pkD/bSt6T4HuRDEK1MOfH380
   1e6ZUKB6EabRJKTUMuF8FEkOsCAbogbV6tTtfn8p+0XOc7EBdjL7QNv2I
   1rnFILo2nrtcKXSTgNbIIYM0fnIh/k9yDx4gVFndTXLL4DCT8k0lKUbHg
   yPILYUsmp53qaTEdOvwNAqe9EQ+NFenzRIt27Ca+Y/zX8VDV5ZXKTnkXq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="374160508"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="374160508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 23:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="3319205"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Nov 2023 23:24:04 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qzWYD-000576-2i;
        Sun, 05 Nov 2023 06:24:01 +0000
Date:   Sun, 05 Nov 2023 14:22:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 5be55473a06475cc1128ccd93831ff57a068a81e
Message-ID: <202311051458.HLsd52JW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 5be55473a06475cc1128ccd93831ff57a068a81e  pinctrl: tegra: drop the wrapper around pinctrl_gpio_request()

elapsed time: 1246m

configs tested: 235
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231104   gcc  
arc                   randconfig-002-20231104   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20231105   gcc  
arm                   randconfig-002-20231105   gcc  
arm                   randconfig-003-20231105   gcc  
arm                   randconfig-004-20231105   gcc  
arm                             rpc_defconfig   gcc  
arm                       versatile_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231105   gcc  
arm64                 randconfig-002-20231105   gcc  
arm64                 randconfig-003-20231105   gcc  
arm64                 randconfig-004-20231105   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231104   gcc  
csky                  randconfig-002-20231104   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231104   gcc  
i386         buildonly-randconfig-001-20231105   gcc  
i386         buildonly-randconfig-002-20231104   gcc  
i386         buildonly-randconfig-002-20231105   gcc  
i386         buildonly-randconfig-003-20231105   gcc  
i386         buildonly-randconfig-004-20231105   gcc  
i386         buildonly-randconfig-005-20231105   gcc  
i386         buildonly-randconfig-006-20231105   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231105   gcc  
i386                  randconfig-002-20231105   gcc  
i386                  randconfig-003-20231105   gcc  
i386                  randconfig-004-20231105   gcc  
i386                  randconfig-005-20231105   gcc  
i386                  randconfig-006-20231105   gcc  
i386                  randconfig-011-20231104   gcc  
i386                  randconfig-011-20231105   gcc  
i386                  randconfig-012-20231104   gcc  
i386                  randconfig-012-20231105   gcc  
i386                  randconfig-013-20231104   gcc  
i386                  randconfig-013-20231105   gcc  
i386                  randconfig-014-20231104   gcc  
i386                  randconfig-014-20231105   gcc  
i386                  randconfig-015-20231104   gcc  
i386                  randconfig-015-20231105   gcc  
i386                  randconfig-016-20231104   gcc  
i386                  randconfig-016-20231105   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20231104   gcc  
loongarch             randconfig-002-20231104   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                          malta_defconfig   clang
mips                    maltaup_xpa_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231104   gcc  
nios2                 randconfig-001-20231105   gcc  
nios2                 randconfig-002-20231104   gcc  
nios2                 randconfig-002-20231105   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231104   gcc  
parisc                randconfig-001-20231105   gcc  
parisc                randconfig-002-20231104   gcc  
parisc                randconfig-002-20231105   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc               randconfig-001-20231104   gcc  
powerpc               randconfig-001-20231105   gcc  
powerpc               randconfig-002-20231104   gcc  
powerpc               randconfig-002-20231105   gcc  
powerpc               randconfig-003-20231104   gcc  
powerpc               randconfig-003-20231105   gcc  
powerpc64             randconfig-001-20231104   gcc  
powerpc64             randconfig-001-20231105   gcc  
powerpc64             randconfig-002-20231104   gcc  
powerpc64             randconfig-002-20231105   gcc  
powerpc64             randconfig-003-20231104   gcc  
powerpc64             randconfig-003-20231105   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231104   gcc  
riscv                 randconfig-001-20231105   gcc  
riscv                 randconfig-002-20231104   gcc  
riscv                 randconfig-002-20231105   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231104   gcc  
s390                  randconfig-001-20231105   gcc  
s390                  randconfig-002-20231104   gcc  
s390                  randconfig-002-20231105   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20231104   gcc  
sh                    randconfig-001-20231105   gcc  
sh                    randconfig-002-20231104   gcc  
sh                    randconfig-002-20231105   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231104   gcc  
sparc                 randconfig-001-20231105   gcc  
sparc                 randconfig-002-20231104   gcc  
sparc                 randconfig-002-20231105   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231104   gcc  
sparc64               randconfig-001-20231105   gcc  
sparc64               randconfig-002-20231104   gcc  
sparc64               randconfig-002-20231105   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231104   gcc  
um                    randconfig-001-20231105   gcc  
um                    randconfig-002-20231104   gcc  
um                    randconfig-002-20231105   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231104   gcc  
x86_64       buildonly-randconfig-001-20231105   gcc  
x86_64       buildonly-randconfig-002-20231104   gcc  
x86_64       buildonly-randconfig-002-20231105   gcc  
x86_64       buildonly-randconfig-003-20231104   gcc  
x86_64       buildonly-randconfig-003-20231105   gcc  
x86_64       buildonly-randconfig-004-20231104   gcc  
x86_64       buildonly-randconfig-004-20231105   gcc  
x86_64       buildonly-randconfig-005-20231104   gcc  
x86_64       buildonly-randconfig-005-20231105   gcc  
x86_64       buildonly-randconfig-006-20231104   gcc  
x86_64       buildonly-randconfig-006-20231105   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231105   gcc  
x86_64                randconfig-002-20231105   gcc  
x86_64                randconfig-003-20231105   gcc  
x86_64                randconfig-004-20231105   gcc  
x86_64                randconfig-005-20231105   gcc  
x86_64                randconfig-006-20231105   gcc  
x86_64                randconfig-011-20231104   gcc  
x86_64                randconfig-011-20231105   gcc  
x86_64                randconfig-012-20231104   gcc  
x86_64                randconfig-012-20231105   gcc  
x86_64                randconfig-013-20231104   gcc  
x86_64                randconfig-013-20231105   gcc  
x86_64                randconfig-014-20231104   gcc  
x86_64                randconfig-014-20231105   gcc  
x86_64                randconfig-015-20231104   gcc  
x86_64                randconfig-015-20231105   gcc  
x86_64                randconfig-016-20231104   gcc  
x86_64                randconfig-016-20231105   gcc  
x86_64                randconfig-071-20231105   gcc  
x86_64                randconfig-072-20231105   gcc  
x86_64                randconfig-073-20231105   gcc  
x86_64                randconfig-074-20231105   gcc  
x86_64                randconfig-075-20231105   gcc  
x86_64                randconfig-076-20231105   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231104   gcc  
xtensa                randconfig-001-20231105   gcc  
xtensa                randconfig-002-20231104   gcc  
xtensa                randconfig-002-20231105   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
