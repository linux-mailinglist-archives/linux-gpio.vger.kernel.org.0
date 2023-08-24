Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9235786E88
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 13:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241229AbjHXL47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 07:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241236AbjHXL4c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 07:56:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C466B1993
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692878190; x=1724414190;
  h=date:from:to:cc:subject:message-id;
  bh=bGAh88E8EsUOlktirm3Su0doo0zgkcPWC9CWpG0Y2ks=;
  b=EcFbtD6B/4X7m8yWvH8/nhZOSxc0X/C23SZJmP/iVFJjQmUWah3SwYGP
   jL5LtrwdDDrxYTB5xlAqz4h9ClsSJDNzriri01mxVblj2cDO1C6NGZaBB
   Djfy7zfYfG+7TT+m+2ICfnMqsxjiApbaBs3AjCjE3eIs5mNEMi8N/z5Je
   q07ogP7grxLVmaOWrkzmi8CcOfGZ8DscJxiQOa3xlZZSke7lf17RZoMev
   VHUIS6hajk3pYYGWKFhJdGF94DJIe7GnrjxV+ejtMuY9SeXjcN8NQeOZm
   AKSJGd3EIL/aN2iqRa4wajVYAw+Iq97/Vp19jRzkJVcAscVFq1pWMWjUb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="373298681"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373298681"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 04:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880774303"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 04:56:17 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qZ8we-0002Er-1T;
        Thu, 24 Aug 2023 11:56:12 +0000
Date:   Thu, 24 Aug 2023 19:56:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/delete-l3] BUILD SUCCESS
 75298d6bd148aade978b5e00e399794bebfefe25
Message-ID: <202308241905.Sxbo6h6p-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/delete-l3
branch HEAD: 75298d6bd148aade978b5e00e399794bebfefe25  ASoC: Delete UDA134x/L3 audio codec

elapsed time: 2311m

configs tested: 195
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230823   gcc  
alpha                randconfig-r014-20230823   gcc  
alpha                randconfig-r021-20230823   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230823   gcc  
arc                  randconfig-r011-20230823   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                   randconfig-001-20230823   clang
arm                  randconfig-r002-20230823   gcc  
arm                  randconfig-r003-20230823   gcc  
arm                  randconfig-r025-20230823   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230823   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230823   gcc  
hexagon                             defconfig   clang
hexagon               randconfig-001-20230823   clang
hexagon               randconfig-002-20230823   clang
hexagon              randconfig-r014-20230823   clang
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20230823   clang
i386         buildonly-randconfig-002-20230823   clang
i386         buildonly-randconfig-003-20230823   clang
i386         buildonly-randconfig-004-20230823   clang
i386         buildonly-randconfig-005-20230823   clang
i386         buildonly-randconfig-006-20230823   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20230823   clang
i386                  randconfig-002-20230823   clang
i386                  randconfig-003-20230823   clang
i386                  randconfig-004-20230823   clang
i386                  randconfig-005-20230823   clang
i386                  randconfig-006-20230823   clang
i386                  randconfig-011-20230823   gcc  
i386                  randconfig-012-20230823   gcc  
i386                  randconfig-013-20230823   gcc  
i386                  randconfig-014-20230823   gcc  
i386                  randconfig-015-20230823   gcc  
i386                  randconfig-016-20230823   gcc  
i386                 randconfig-r025-20230823   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230823   gcc  
loongarch            randconfig-r024-20230823   gcc  
loongarch            randconfig-r026-20230823   gcc  
loongarch            randconfig-r032-20230823   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r006-20230823   gcc  
microblaze           randconfig-r034-20230823   gcc  
microblaze           randconfig-r036-20230823   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230823   gcc  
mips                 randconfig-r006-20230823   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230823   gcc  
nios2                randconfig-r005-20230823   gcc  
nios2                randconfig-r016-20230823   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r003-20230823   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r001-20230823   gcc  
parisc               randconfig-r023-20230823   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc              randconfig-r031-20230823   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230823   clang
riscv                randconfig-r013-20230823   gcc  
riscv                randconfig-r016-20230823   gcc  
riscv                randconfig-r024-20230823   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230823   gcc  
s390                 randconfig-r013-20230823   gcc  
s390                 randconfig-r015-20230823   gcc  
s390                 randconfig-r025-20230823   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                   randconfig-r006-20230823   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r022-20230823   gcc  
sparc64              randconfig-r026-20230823   gcc  
sparc64              randconfig-r033-20230823   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r024-20230823   clang
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230823   clang
x86_64       buildonly-randconfig-001-20230824   gcc  
x86_64       buildonly-randconfig-002-20230823   clang
x86_64       buildonly-randconfig-002-20230824   gcc  
x86_64       buildonly-randconfig-003-20230823   clang
x86_64       buildonly-randconfig-003-20230824   gcc  
x86_64       buildonly-randconfig-004-20230823   clang
x86_64       buildonly-randconfig-004-20230824   gcc  
x86_64       buildonly-randconfig-005-20230823   clang
x86_64       buildonly-randconfig-005-20230824   gcc  
x86_64       buildonly-randconfig-006-20230823   clang
x86_64       buildonly-randconfig-006-20230824   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230823   gcc  
x86_64                randconfig-001-20230824   clang
x86_64                randconfig-002-20230823   gcc  
x86_64                randconfig-002-20230824   clang
x86_64                randconfig-003-20230823   gcc  
x86_64                randconfig-003-20230824   clang
x86_64                randconfig-004-20230823   gcc  
x86_64                randconfig-004-20230824   clang
x86_64                randconfig-005-20230823   gcc  
x86_64                randconfig-005-20230824   clang
x86_64                randconfig-006-20230823   gcc  
x86_64                randconfig-006-20230824   clang
x86_64                randconfig-011-20230823   clang
x86_64                randconfig-012-20230823   clang
x86_64                randconfig-013-20230823   clang
x86_64                randconfig-014-20230823   clang
x86_64                randconfig-015-20230823   clang
x86_64                randconfig-016-20230823   clang
x86_64                randconfig-071-20230823   clang
x86_64                randconfig-072-20230823   clang
x86_64                randconfig-073-20230823   clang
x86_64                randconfig-074-20230823   clang
x86_64                randconfig-075-20230823   clang
x86_64                randconfig-076-20230823   clang
x86_64               randconfig-r022-20230823   gcc  
x86_64               randconfig-r035-20230823   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r001-20230823   gcc  
xtensa               randconfig-r004-20230823   gcc  
xtensa               randconfig-r015-20230823   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
