Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710AD7AE2CE
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 02:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjIZALs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Sep 2023 20:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjIZALr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2023 20:11:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F8210A
        for <linux-gpio@vger.kernel.org>; Mon, 25 Sep 2023 17:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695687101; x=1727223101;
  h=date:from:to:cc:subject:message-id;
  bh=UqBpV5p/pHZcL7Xa5goCr7n0gtuiITn0hYL6d3e0s3U=;
  b=TBecb0iExLaMKHRn80bjyC/Ty3devrX+VME7ryX50BhVzupyiHX9r1Nq
   VqY53Iqz1zDbK03J0d63wqqFSfrb/bPTWDHlpPvCM5PkyhpBqNWvfYBTk
   TfEftBUPwy7jjGHXrGakPpjJGKJJma1eTrFX3pzJTdWQ2ML/77gDUDgNe
   VSfk5ZqDEUwc7Ld6RhXlA+xxY3otPvba1OAJHhp0ZNjx+ebfxQuZi0cib
   AVw7zAKoweOFz9YixF0ufzbm2Qy3D2u4nhvJ4bSaVNHJXFflnznYDY5TC
   BVvJhrm/9HxCaoRU3pSKV8tdjJQJRDO3NDDwp89nKy6jQfGtW8+W8Fnw0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385292465"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="385292465"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 17:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838787755"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="838787755"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2023 17:11:39 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qkvft-0002Af-19;
        Tue, 26 Sep 2023 00:11:37 +0000
Date:   Tue, 26 Sep 2023 08:10:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 a512635da9f7223b97262a5f376c7f1c3e9f6f7d
Message-ID: <202309260836.9Fq3rdCG-lkp@intel.com>
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
branch HEAD: a512635da9f7223b97262a5f376c7f1c3e9f6f7d  gpiolib: cdev: annotate struct linereq with __counted_by

elapsed time: 941m

configs tested: 159
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
arc                   randconfig-001-20230925   gcc  
arc                   randconfig-001-20230926   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230925   gcc  
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
i386         buildonly-randconfig-001-20230925   gcc  
i386         buildonly-randconfig-001-20230926   gcc  
i386         buildonly-randconfig-002-20230925   gcc  
i386         buildonly-randconfig-002-20230926   gcc  
i386         buildonly-randconfig-003-20230925   gcc  
i386         buildonly-randconfig-003-20230926   gcc  
i386         buildonly-randconfig-004-20230925   gcc  
i386         buildonly-randconfig-004-20230926   gcc  
i386         buildonly-randconfig-005-20230925   gcc  
i386         buildonly-randconfig-005-20230926   gcc  
i386         buildonly-randconfig-006-20230925   gcc  
i386         buildonly-randconfig-006-20230926   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230925   gcc  
i386                  randconfig-002-20230925   gcc  
i386                  randconfig-003-20230925   gcc  
i386                  randconfig-004-20230925   gcc  
i386                  randconfig-005-20230925   gcc  
i386                  randconfig-006-20230925   gcc  
i386                  randconfig-011-20230925   gcc  
i386                  randconfig-012-20230925   gcc  
i386                  randconfig-013-20230925   gcc  
i386                  randconfig-014-20230925   gcc  
i386                  randconfig-015-20230925   gcc  
i386                  randconfig-016-20230925   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230925   gcc  
loongarch             randconfig-001-20230926   gcc  
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
mips                        bcm63xx_defconfig   clang
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
riscv                 randconfig-001-20230925   gcc  
riscv                 randconfig-001-20230926   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230925   gcc  
s390                  randconfig-001-20230926   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230925   gcc  
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
x86_64       buildonly-randconfig-001-20230925   gcc  
x86_64       buildonly-randconfig-001-20230926   gcc  
x86_64       buildonly-randconfig-002-20230925   gcc  
x86_64       buildonly-randconfig-002-20230926   gcc  
x86_64       buildonly-randconfig-003-20230925   gcc  
x86_64       buildonly-randconfig-003-20230926   gcc  
x86_64       buildonly-randconfig-004-20230925   gcc  
x86_64       buildonly-randconfig-004-20230926   gcc  
x86_64       buildonly-randconfig-005-20230925   gcc  
x86_64       buildonly-randconfig-005-20230926   gcc  
x86_64       buildonly-randconfig-006-20230925   gcc  
x86_64       buildonly-randconfig-006-20230926   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230925   gcc  
x86_64                randconfig-002-20230925   gcc  
x86_64                randconfig-003-20230925   gcc  
x86_64                randconfig-004-20230925   gcc  
x86_64                randconfig-005-20230925   gcc  
x86_64                randconfig-006-20230925   gcc  
x86_64                randconfig-011-20230925   gcc  
x86_64                randconfig-012-20230925   gcc  
x86_64                randconfig-013-20230925   gcc  
x86_64                randconfig-014-20230925   gcc  
x86_64                randconfig-015-20230925   gcc  
x86_64                randconfig-016-20230925   gcc  
x86_64                randconfig-071-20230925   gcc  
x86_64                randconfig-071-20230926   gcc  
x86_64                randconfig-072-20230925   gcc  
x86_64                randconfig-072-20230926   gcc  
x86_64                randconfig-073-20230925   gcc  
x86_64                randconfig-073-20230926   gcc  
x86_64                randconfig-074-20230925   gcc  
x86_64                randconfig-074-20230926   gcc  
x86_64                randconfig-075-20230925   gcc  
x86_64                randconfig-075-20230926   gcc  
x86_64                randconfig-076-20230925   gcc  
x86_64                randconfig-076-20230926   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
