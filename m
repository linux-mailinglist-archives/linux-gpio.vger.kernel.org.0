Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A028E6FFFB2
	for <lists+linux-gpio@lfdr.de>; Fri, 12 May 2023 06:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239832AbjELEjk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 May 2023 00:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239826AbjELEjj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2023 00:39:39 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F8112D
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 21:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683866378; x=1715402378;
  h=date:from:to:cc:subject:message-id;
  bh=T3ifLTeqd0KLjfWYKXH7prMkYj3O1jgTRUH8yDWBMk8=;
  b=E/nia3qPk0oLQSJZpKRky5QmPpyBI/80S1/IZtVSf8bNQge3qn9bthGa
   44IHhmVUOpgK9v1NzBulCcEtB2c7itgHILshYzPGm6K63nB6g+/RMSpoo
   qW0BhJlklk1+Q8Wqe6PGVZMcJT4AohnkT2uwoAS0FxMgO+tHNtJdLVo5y
   kmdMn5UOwEfUI9m4FspcV1qiq9jxpKln2ZeQUC4i55NQF12oVSTPcY5JT
   0gTI9bIa2OyXczo0dFHEkJ7S7GncAt/v6jfjQ4GIT0aHwIusBOFj1Vp8n
   GjkjnpeMgU5aF/AxzABynFg+hT31oFmrezSZQbQUnRwBbRIgQS+YmM4Fi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="414066051"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414066051"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 21:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650493919"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650493919"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 May 2023 21:39:37 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pxKZ6-0004We-0t;
        Fri, 12 May 2023 04:39:36 +0000
Date:   Fri, 12 May 2023 12:39:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 976d3c6778e99390c6d854d140b746d12ea18a51
Message-ID: <20230512043902.9n4hk%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 976d3c6778e99390c6d854d140b746d12ea18a51  selftests: gpio: gpio-sim: Fix BUG: test FAILED due to recent change

elapsed time: 732m

configs tested: 90
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230509   gcc  
alpha                randconfig-r016-20230509   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r015-20230509   gcc  
arc                  randconfig-r043-20230509   gcc  
arc                  randconfig-r043-20230511   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r046-20230509   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230509   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230509   gcc  
csky                 randconfig-r021-20230511   gcc  
csky                 randconfig-r026-20230511   gcc  
hexagon              randconfig-r016-20230511   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a012   gcc  
i386                          randconfig-a014   gcc  
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230509   gcc  
microblaze           randconfig-r012-20230511   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r016-20230509   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230509   gcc  
nios2                randconfig-r016-20230511   gcc  
openrisc             randconfig-r013-20230511   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230511   gcc  
parisc               randconfig-r024-20230511   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r001-20230511   clang
powerpc              randconfig-r015-20230511   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230511   clang
riscv                randconfig-r006-20230511   clang
riscv                randconfig-r042-20230511   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230509   clang
s390                 randconfig-r014-20230511   gcc  
s390                 randconfig-r022-20230511   gcc  
s390                 randconfig-r044-20230511   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r011-20230511   gcc  
sh                           se7712_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230511   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230511   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
