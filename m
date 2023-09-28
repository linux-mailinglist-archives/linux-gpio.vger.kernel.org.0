Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 149C37B1E88
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 15:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbjI1NeI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 09:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbjI1NeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 09:34:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898DB1B1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695908034; x=1727444034;
  h=date:from:to:cc:subject:message-id;
  bh=2URr3naZ1TlsdbdfLNczM8sC3qdha5bVAXluH+XKhjE=;
  b=es04FXte340vNC35WlobrzI0tCJrzNPzPV0mZqQULVFE1GzrO6KIb65c
   ZmI3OFgE/X+ET8TMR8umSi3nyVZofEJn0BdNQyFGl3IR/ob3vPTErujj7
   OZNpA6zXNzBMSQNmNddfzRXHpy2g55nnIa5o/IbJbBRrC1vcvxhTrXDrK
   Iri5Xv0Cm9ToXuWaWesTtdBhc5VRgvKBP1qbsp/OUP0Ty2Df0CpzJc8Jl
   /Aj9x1hYRihB5HQYbBMzppg1VsV5w6WMgMP/HYFgXpoDyj7Lz2CSL7Cl/
   TK0uMRD6uuOIFlkjLq3qMVUcAH7QFWdV0s75UawpsI3roShJ+uTKL847V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3624800"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="3624800"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 06:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="749599824"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="749599824"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Sep 2023 06:31:26 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlr6y-0001Uj-29;
        Thu, 28 Sep 2023 13:31:24 +0000
Date:   Thu, 28 Sep 2023 21:30:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 3a7fd473bd5d430c8045830e9a09e8dc35bcca6b
Message-ID: <202309282142.dAMklq5e-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 3a7fd473bd5d430c8045830e9a09e8dc35bcca6b  mtd: rawnand: ingenic: move the GPIO quirk to gpiolib-of.c

elapsed time: 1522m

configs tested: 128
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
arc                   randconfig-001-20230927   gcc  
arc                   randconfig-001-20230928   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230928   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230928   gcc  
i386         buildonly-randconfig-002-20230928   gcc  
i386         buildonly-randconfig-003-20230928   gcc  
i386         buildonly-randconfig-004-20230928   gcc  
i386         buildonly-randconfig-005-20230928   gcc  
i386         buildonly-randconfig-006-20230928   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230928   gcc  
i386                  randconfig-002-20230928   gcc  
i386                  randconfig-003-20230928   gcc  
i386                  randconfig-004-20230928   gcc  
i386                  randconfig-005-20230928   gcc  
i386                  randconfig-006-20230928   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230927   gcc  
loongarch             randconfig-001-20230928   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
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
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230928   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230928   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230928   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230928   gcc  
x86_64       buildonly-randconfig-002-20230928   gcc  
x86_64       buildonly-randconfig-003-20230928   gcc  
x86_64       buildonly-randconfig-004-20230928   gcc  
x86_64       buildonly-randconfig-005-20230928   gcc  
x86_64       buildonly-randconfig-006-20230928   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230928   gcc  
x86_64                randconfig-002-20230928   gcc  
x86_64                randconfig-003-20230928   gcc  
x86_64                randconfig-004-20230928   gcc  
x86_64                randconfig-005-20230928   gcc  
x86_64                randconfig-006-20230928   gcc  
x86_64                randconfig-011-20230928   gcc  
x86_64                randconfig-012-20230928   gcc  
x86_64                randconfig-013-20230928   gcc  
x86_64                randconfig-014-20230928   gcc  
x86_64                randconfig-015-20230928   gcc  
x86_64                randconfig-016-20230928   gcc  
x86_64                randconfig-071-20230928   gcc  
x86_64                randconfig-072-20230928   gcc  
x86_64                randconfig-073-20230928   gcc  
x86_64                randconfig-074-20230928   gcc  
x86_64                randconfig-075-20230928   gcc  
x86_64                randconfig-076-20230928   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
