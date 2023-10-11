Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB5747C59B5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 18:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbjJKQ6K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 12:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJKQ6J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 12:58:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C966AF
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697043488; x=1728579488;
  h=date:from:to:cc:subject:message-id;
  bh=4VBPGYxhPZH6f9wdygQEL0oKWhGy8NmYjwhDj1Rx+C0=;
  b=eofT2W1bNxw9xzdMiSIOf1X49fcV1+NHhDgq3RHrf0wq5DX/WH+CETND
   B2MxLTCX0Z2OH1EzF6vbpgTL9Mj5tC7WtW2C0JJlRghRIr+vr/4wBQkYA
   hKNcpMWEWQMt7LbsSgt/qS8MoN+3rCZWOU8vNzteVG4qvuvTdYc50SFMW
   WfoIaAegMLkmyW4domrJs3R0b2h+AF0tARWr3hchjOlnCX2XviXc45vF8
   PmSP1AYMqhtp/ABf/cTAndDZjJ4TD5lEicaHAxMF9q/9fcDxNk1Xt6ZbC
   B2Kv4YYcELK+Hm6BsYkdsn4vixsqikOXdYM8jo7k7Ln/Dy330khnkEOIF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384566061"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="384566061"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 09:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747528170"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="747528170"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 09:58:06 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qqcX6-0002Ub-1g;
        Wed, 11 Oct 2023 16:58:04 +0000
Date:   Thu, 12 Oct 2023 00:57:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 c341ac65bf2bf297a6e4db61c34c00971876fad6
Message-ID: <202310120016.2waG867Z-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: c341ac65bf2bf297a6e4db61c34c00971876fad6  pinctrl: sprd-sc9860: Convert to platform remove callback returning void

elapsed time: 1567m

configs tested: 130
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
arc                   randconfig-001-20231011   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231011   gcc  
i386         buildonly-randconfig-002-20231011   gcc  
i386         buildonly-randconfig-003-20231011   gcc  
i386         buildonly-randconfig-004-20231011   gcc  
i386         buildonly-randconfig-005-20231011   gcc  
i386         buildonly-randconfig-006-20231011   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231011   gcc  
i386                  randconfig-002-20231011   gcc  
i386                  randconfig-003-20231011   gcc  
i386                  randconfig-004-20231011   gcc  
i386                  randconfig-005-20231011   gcc  
i386                  randconfig-006-20231011   gcc  
i386                  randconfig-011-20231011   gcc  
i386                  randconfig-012-20231011   gcc  
i386                  randconfig-013-20231011   gcc  
i386                  randconfig-014-20231011   gcc  
i386                  randconfig-015-20231011   gcc  
i386                  randconfig-016-20231011   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231011   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
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
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231011   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231011   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231011   gcc  
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
x86_64       buildonly-randconfig-001-20231011   gcc  
x86_64       buildonly-randconfig-002-20231011   gcc  
x86_64       buildonly-randconfig-003-20231011   gcc  
x86_64       buildonly-randconfig-004-20231011   gcc  
x86_64       buildonly-randconfig-005-20231011   gcc  
x86_64       buildonly-randconfig-006-20231011   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231011   gcc  
x86_64                randconfig-002-20231011   gcc  
x86_64                randconfig-003-20231011   gcc  
x86_64                randconfig-004-20231011   gcc  
x86_64                randconfig-005-20231011   gcc  
x86_64                randconfig-006-20231011   gcc  
x86_64                randconfig-011-20231011   gcc  
x86_64                randconfig-012-20231011   gcc  
x86_64                randconfig-013-20231011   gcc  
x86_64                randconfig-014-20231011   gcc  
x86_64                randconfig-015-20231011   gcc  
x86_64                randconfig-016-20231011   gcc  
x86_64                randconfig-071-20231011   gcc  
x86_64                randconfig-072-20231011   gcc  
x86_64                randconfig-073-20231011   gcc  
x86_64                randconfig-074-20231011   gcc  
x86_64                randconfig-075-20231011   gcc  
x86_64                randconfig-076-20231011   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
