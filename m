Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98297B00B9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjI0JkX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjI0JkW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:40:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EC713A
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695807620; x=1727343620;
  h=date:from:to:cc:subject:message-id;
  bh=4c7tDH98InlAcpd6cVWv5L+MCmLyemrt2yFAYPceq30=;
  b=LJSk6irLt7sOcIGw6rDZ1Z4awtT4zZ23fguzCga/4a4+j/GeyBUQ2eR3
   85uQwB/iHSvgznMwfOKwSdrVss8gLE7Yrh7jKjZW+Z0tJCcbvzQ4VyHer
   KW9Nwufb+OCsOJ4XHSSzKg0mduylBMS3XKeq69niLZAGbuquz3giV0JQE
   aknmxvIuAUa4TpfEEWm2POOCuoCz0GaKPMH1T6mjbgCQ4XMSKzljZYqhi
   Iw7Kn1/jiibx+1W79nhnaJb1peVFQ5MzBXTdWYMIn95b7SSgHVMP1Q8JE
   AZM2yYYZXYEloBEIX9Ck6Zz3749ixEgdJLowNe7WSY/y3gWlgmpGb0S9p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="379059523"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="379059523"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 02:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819360195"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="819360195"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2023 02:40:18 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlR1k-00003E-1P;
        Wed, 27 Sep 2023 09:40:16 +0000
Date:   Wed, 27 Sep 2023 17:39:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 c153a4edff6ab01370fcac8e46f9c89cca1060c2
Message-ID: <202309271729.BJmzPKeA-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: c153a4edff6ab01370fcac8e46f9c89cca1060c2  pinctrl: avoid unsafe code pattern in find_pinctrl()

elapsed time: 1462m

configs tested: 199
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
arc                   randconfig-001-20230926   gcc  
arc                   randconfig-001-20230927   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230927   gcc  
arm                             rpc_defconfig   gcc  
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
i386         buildonly-randconfig-001-20230926   gcc  
i386         buildonly-randconfig-001-20230927   gcc  
i386         buildonly-randconfig-002-20230926   gcc  
i386         buildonly-randconfig-002-20230927   gcc  
i386         buildonly-randconfig-003-20230926   gcc  
i386         buildonly-randconfig-003-20230927   gcc  
i386         buildonly-randconfig-004-20230926   gcc  
i386         buildonly-randconfig-004-20230927   gcc  
i386         buildonly-randconfig-005-20230926   gcc  
i386         buildonly-randconfig-005-20230927   gcc  
i386         buildonly-randconfig-006-20230926   gcc  
i386         buildonly-randconfig-006-20230927   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230927   gcc  
i386                  randconfig-002-20230927   gcc  
i386                  randconfig-003-20230927   gcc  
i386                  randconfig-004-20230927   gcc  
i386                  randconfig-005-20230927   gcc  
i386                  randconfig-006-20230927   gcc  
i386                  randconfig-011-20230926   gcc  
i386                  randconfig-011-20230927   gcc  
i386                  randconfig-012-20230926   gcc  
i386                  randconfig-012-20230927   gcc  
i386                  randconfig-013-20230926   gcc  
i386                  randconfig-013-20230927   gcc  
i386                  randconfig-014-20230926   gcc  
i386                  randconfig-014-20230927   gcc  
i386                  randconfig-015-20230926   gcc  
i386                  randconfig-015-20230927   gcc  
i386                  randconfig-016-20230926   gcc  
i386                  randconfig-016-20230927   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230926   gcc  
loongarch             randconfig-001-20230927   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip28_defconfig   clang
mips                       lemote2f_defconfig   clang
mips                        vocore2_defconfig   gcc  
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
powerpc                      makalu_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc                       ppc64_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230926   gcc  
riscv                 randconfig-001-20230927   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230926   gcc  
s390                  randconfig-001-20230927   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230927   gcc  
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
x86_64       buildonly-randconfig-001-20230926   gcc  
x86_64       buildonly-randconfig-001-20230927   gcc  
x86_64       buildonly-randconfig-002-20230926   gcc  
x86_64       buildonly-randconfig-002-20230927   gcc  
x86_64       buildonly-randconfig-003-20230926   gcc  
x86_64       buildonly-randconfig-003-20230927   gcc  
x86_64       buildonly-randconfig-004-20230926   gcc  
x86_64       buildonly-randconfig-004-20230927   gcc  
x86_64       buildonly-randconfig-005-20230926   gcc  
x86_64       buildonly-randconfig-005-20230927   gcc  
x86_64       buildonly-randconfig-006-20230926   gcc  
x86_64       buildonly-randconfig-006-20230927   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230926   gcc  
x86_64                randconfig-001-20230927   gcc  
x86_64                randconfig-002-20230926   gcc  
x86_64                randconfig-002-20230927   gcc  
x86_64                randconfig-003-20230926   gcc  
x86_64                randconfig-003-20230927   gcc  
x86_64                randconfig-004-20230926   gcc  
x86_64                randconfig-004-20230927   gcc  
x86_64                randconfig-005-20230926   gcc  
x86_64                randconfig-005-20230927   gcc  
x86_64                randconfig-006-20230926   gcc  
x86_64                randconfig-006-20230927   gcc  
x86_64                randconfig-011-20230926   gcc  
x86_64                randconfig-011-20230927   gcc  
x86_64                randconfig-012-20230926   gcc  
x86_64                randconfig-012-20230927   gcc  
x86_64                randconfig-013-20230926   gcc  
x86_64                randconfig-013-20230927   gcc  
x86_64                randconfig-014-20230926   gcc  
x86_64                randconfig-014-20230927   gcc  
x86_64                randconfig-015-20230926   gcc  
x86_64                randconfig-015-20230927   gcc  
x86_64                randconfig-016-20230926   gcc  
x86_64                randconfig-016-20230927   gcc  
x86_64                randconfig-071-20230926   gcc  
x86_64                randconfig-071-20230927   gcc  
x86_64                randconfig-072-20230926   gcc  
x86_64                randconfig-072-20230927   gcc  
x86_64                randconfig-073-20230926   gcc  
x86_64                randconfig-073-20230927   gcc  
x86_64                randconfig-074-20230926   gcc  
x86_64                randconfig-074-20230927   gcc  
x86_64                randconfig-075-20230926   gcc  
x86_64                randconfig-075-20230927   gcc  
x86_64                randconfig-076-20230926   gcc  
x86_64                randconfig-076-20230927   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
