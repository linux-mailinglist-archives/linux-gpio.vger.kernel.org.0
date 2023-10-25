Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83527D6D86
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Oct 2023 15:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233249AbjJYNoM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Oct 2023 09:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233757AbjJYNoM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Oct 2023 09:44:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96B4138
        for <linux-gpio@vger.kernel.org>; Wed, 25 Oct 2023 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698241449; x=1729777449;
  h=date:from:to:cc:subject:message-id;
  bh=2H3BTgPnZDQzCZkG1SnoWucqbDIWE3CJ0idbbQbIp74=;
  b=Sgoq75+UyhoyXw+9yYLQFeKtDpuDyXdhLGadH/S5Q57aAlZhktsJ/BuS
   YAwPceGbKNhDuxOMQl7zLwtSCfs4Pmk2zVr+yaVIOboWqxa6YijYCfgIC
   yDCsY9RpNS8aRdUd30pNmpATQIIyrse1aSwF/sSF0WSzVfQt7KwfiyPur
   zZdLWkLnYi9Es2ZU3KoodUDe/nalCr25YOgJX7K7xGGIIjofmIqcBy8ec
   h1kw2UKy2Y1IkF2t0ZK8DOpzDhWyUGMbOAvg98wQFQCMsXpmqqGeGGcQH
   qO6xYvgB786v+jfU/Xiz2VstH7JDcM2wk2A+9VTLesB2mCis7AXXM+o3k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391179487"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="391179487"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 06:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="91740"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2023 06:43:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qveB4-0008ug-0X;
        Wed, 25 Oct 2023 13:44:06 +0000
Date:   Wed, 25 Oct 2023 21:43:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD SUCCESS
 1dc76c3a750230979d782ab44920c6731b592935
Message-ID: <202310252112.RJM0CE7f-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: 1dc76c3a750230979d782ab44920c6731b592935  pinctrl: tegra: drop the wrapper around pinctrl_gpio_request()

elapsed time: 3131m

configs tested: 126
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
arc                   randconfig-001-20231023   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231024   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20231024   gcc  
i386         buildonly-randconfig-002-20231024   gcc  
i386         buildonly-randconfig-003-20231024   gcc  
i386         buildonly-randconfig-004-20231024   gcc  
i386         buildonly-randconfig-005-20231024   gcc  
i386         buildonly-randconfig-006-20231024   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231024   gcc  
i386                  randconfig-002-20231024   gcc  
i386                  randconfig-003-20231024   gcc  
i386                  randconfig-004-20231024   gcc  
i386                  randconfig-005-20231024   gcc  
i386                  randconfig-006-20231024   gcc  
i386                  randconfig-011-20231024   gcc  
i386                  randconfig-012-20231024   gcc  
i386                  randconfig-013-20231024   gcc  
i386                  randconfig-014-20231024   gcc  
i386                  randconfig-015-20231024   gcc  
i386                  randconfig-016-20231024   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231023   gcc  
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
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231023   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231023   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231024   gcc  
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
x86_64       buildonly-randconfig-001-20231023   gcc  
x86_64       buildonly-randconfig-002-20231023   gcc  
x86_64       buildonly-randconfig-003-20231023   gcc  
x86_64       buildonly-randconfig-004-20231023   gcc  
x86_64       buildonly-randconfig-005-20231023   gcc  
x86_64       buildonly-randconfig-006-20231023   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231024   gcc  
x86_64                randconfig-002-20231024   gcc  
x86_64                randconfig-003-20231024   gcc  
x86_64                randconfig-004-20231024   gcc  
x86_64                randconfig-005-20231024   gcc  
x86_64                randconfig-006-20231024   gcc  
x86_64                randconfig-011-20231024   gcc  
x86_64                randconfig-012-20231024   gcc  
x86_64                randconfig-013-20231024   gcc  
x86_64                randconfig-014-20231024   gcc  
x86_64                randconfig-015-20231024   gcc  
x86_64                randconfig-016-20231024   gcc  
x86_64                randconfig-071-20231024   gcc  
x86_64                randconfig-072-20231024   gcc  
x86_64                randconfig-073-20231024   gcc  
x86_64                randconfig-074-20231024   gcc  
x86_64                randconfig-075-20231024   gcc  
x86_64                randconfig-076-20231024   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
