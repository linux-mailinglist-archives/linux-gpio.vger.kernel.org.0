Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF23A779DB9
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Aug 2023 08:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjHLGfO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Aug 2023 02:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjHLGfO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Aug 2023 02:35:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED9E1FD9
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691822113; x=1723358113;
  h=date:from:to:cc:subject:message-id;
  bh=CAvZSBhovK7hvOxO4/+CBdm8sqUIct9i1jCax4vx3qc=;
  b=aeFAVv51vU/bzbqpsgY/lOJlQwhV6GhdJxt3VaqAr0v0H+eco3TbsqAF
   9d0rmEt/rECOsiR5PNmtN3AudOL8bZgraOswjDUi5YIfl9yy2h2/C6qbb
   NURfkZcDhBjLL60/yTTGc+RpXP5Xgc7g515t1WLJF9jdaDLTqzpRHQE7S
   tslL6LdUIbWxsiJyjgxpIJIem/dme5FQwrSCTOAwmG+PlyRetOxqyEZzu
   w+hl/+47kCgf5W8sKUZcJwqPzxfwL1cOf18LTSDza/ytzEScz/cioCX4G
   7sbtFP3B3Xzpv9k+78/HPmj/QM62ISWZDosRcgJKhNFM8WRq9WgovlS78
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="361951200"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="361951200"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 23:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726480840"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="726480840"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Aug 2023 23:35:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qUiDI-0008KS-09;
        Sat, 12 Aug 2023 06:35:04 +0000
Date:   Sat, 12 Aug 2023 14:34:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 5f6d1998adeb5374ef248b5ba2e2a0c30ab0f60b
Message-ID: <202308121405.HCDMgw40-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 5f6d1998adeb5374ef248b5ba2e2a0c30ab0f60b  gpio: mxc: release the parent IRQ in runtime suspend

elapsed time: 863m

configs tested: 124
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r034-20230812   gcc  
arc                  randconfig-r043-20230812   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230812   gcc  
arm                         socfpga_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230812   clang
csky                                defconfig   gcc  
csky                 randconfig-r033-20230812   gcc  
hexagon              randconfig-r002-20230812   clang
hexagon              randconfig-r006-20230812   clang
hexagon              randconfig-r023-20230812   clang
hexagon              randconfig-r041-20230812   clang
hexagon              randconfig-r045-20230812   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230812   gcc  
i386         buildonly-randconfig-r005-20230812   gcc  
i386         buildonly-randconfig-r006-20230812   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230812   gcc  
i386                 randconfig-i002-20230812   gcc  
i386                 randconfig-i003-20230812   gcc  
i386                 randconfig-i004-20230812   gcc  
i386                 randconfig-i005-20230812   gcc  
i386                 randconfig-i006-20230812   gcc  
i386                 randconfig-i011-20230812   clang
i386                 randconfig-i012-20230812   clang
i386                 randconfig-i013-20230812   clang
i386                 randconfig-i014-20230812   clang
i386                 randconfig-i015-20230812   clang
i386                 randconfig-i016-20230812   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230812   gcc  
loongarch            randconfig-r015-20230812   gcc  
loongarch            randconfig-r023-20230812   gcc  
loongarch            randconfig-r035-20230812   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r026-20230812   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r011-20230812   gcc  
microblaze           randconfig-r016-20230812   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         rt305x_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230812   gcc  
openrisc             randconfig-r004-20230812   gcc  
openrisc             randconfig-r021-20230812   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r024-20230812   gcc  
parisc               randconfig-r025-20230812   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                  mpc885_ads_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                randconfig-r014-20230812   clang
riscv                randconfig-r035-20230812   gcc  
riscv                randconfig-r042-20230812   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230812   gcc  
s390                 randconfig-r034-20230812   gcc  
s390                 randconfig-r044-20230812   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r015-20230812   gcc  
sh                           se7619_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r036-20230812   gcc  
sparc64              randconfig-r013-20230812   gcc  
sparc64              randconfig-r022-20230812   gcc  
sparc64              randconfig-r026-20230812   gcc  
sparc64              randconfig-r031-20230812   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r003-20230812   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230812   gcc  
x86_64       buildonly-randconfig-r002-20230812   gcc  
x86_64       buildonly-randconfig-r003-20230812   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230812   clang
x86_64               randconfig-x002-20230812   clang
x86_64               randconfig-x003-20230812   clang
x86_64               randconfig-x004-20230812   clang
x86_64               randconfig-x005-20230812   clang
x86_64               randconfig-x006-20230812   clang
x86_64               randconfig-x011-20230812   gcc  
x86_64               randconfig-x012-20230812   gcc  
x86_64               randconfig-x013-20230812   gcc  
x86_64               randconfig-x014-20230812   gcc  
x86_64               randconfig-x015-20230812   gcc  
x86_64               randconfig-x016-20230812   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r005-20230812   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
