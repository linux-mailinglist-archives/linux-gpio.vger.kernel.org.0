Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168C47D21CA
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Oct 2023 10:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbjJVIRx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Oct 2023 04:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjJVIRw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Oct 2023 04:17:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270C7D6
        for <linux-gpio@vger.kernel.org>; Sun, 22 Oct 2023 01:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697962671; x=1729498671;
  h=date:from:to:cc:subject:message-id;
  bh=hne5agmDstY/RjJZeWzecTx4q7oBtJ48aG/6hdbac/o=;
  b=LCrb2L9z4SwAUVkaxWsvR05O/iclzooxAeSdLLL5i0FGa9t1QwpFxHwd
   xRFE5ZtBA1lOWNOgCVe0QHRbSDn4TfXDuObT6q7nJKJRYxDCCzMXowGTv
   yLv71+4TA6i/YNFstrfryIYKRAkW3cIBEd08INMYP6Y92cKUSPB0hdEBA
   2JS54Jobzx7X1mWHHKr6846zqLS82hExIUqiO7qKVaMGEZ90uPPE19xFr
   xfDJ6mzb4vHL7FkE6OenskeM5eN0sq5YA/JYZgX2JLmkFeaVMfRz7oJyY
   BVDzAtcgd5Dh5AxphfyqCSSZ9sm1weSHh3c3zUZnCWLW7zTl/sg1g/4H9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383889432"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383889432"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 01:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="874363432"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="874363432"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2023 01:17:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1quTea-0005jO-29;
        Sun, 22 Oct 2023 08:17:44 +0000
Date:   Sun, 22 Oct 2023 16:16:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 479ac419206b5fe4ce4e40de61ac3210a36711aa
Message-ID: <202310221648.MjnH9hiC-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 479ac419206b5fe4ce4e40de61ac3210a36711aa  gpiolib: acpi: Add missing memset(0) to acpi_get_gpiod_from_data()

elapsed time: 2807m

configs tested: 155
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
arc                   randconfig-001-20231021   gcc  
arc                   randconfig-001-20231022   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                                 defconfig   gcc  
arm                   randconfig-001-20231022   gcc  
arm                         socfpga_defconfig   clang
arm                           tegra_defconfig   gcc  
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
i386         buildonly-randconfig-001-20231022   gcc  
i386         buildonly-randconfig-002-20231022   gcc  
i386         buildonly-randconfig-003-20231022   gcc  
i386         buildonly-randconfig-004-20231022   gcc  
i386         buildonly-randconfig-005-20231022   gcc  
i386         buildonly-randconfig-006-20231022   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231022   gcc  
i386                  randconfig-002-20231022   gcc  
i386                  randconfig-003-20231022   gcc  
i386                  randconfig-004-20231022   gcc  
i386                  randconfig-005-20231022   gcc  
i386                  randconfig-006-20231022   gcc  
i386                  randconfig-011-20231022   gcc  
i386                  randconfig-012-20231022   gcc  
i386                  randconfig-013-20231022   gcc  
i386                  randconfig-014-20231022   gcc  
i386                  randconfig-015-20231022   gcc  
i386                  randconfig-016-20231022   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231021   gcc  
loongarch             randconfig-001-20231022   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                      fuloong2e_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
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
powerpc                   lite5200b_defconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                      obs600_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231021   gcc  
riscv                 randconfig-001-20231022   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231021   gcc  
s390                  randconfig-001-20231022   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231022   gcc  
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
x86_64       buildonly-randconfig-001-20231021   gcc  
x86_64       buildonly-randconfig-001-20231022   gcc  
x86_64       buildonly-randconfig-002-20231021   gcc  
x86_64       buildonly-randconfig-002-20231022   gcc  
x86_64       buildonly-randconfig-003-20231021   gcc  
x86_64       buildonly-randconfig-003-20231022   gcc  
x86_64       buildonly-randconfig-004-20231021   gcc  
x86_64       buildonly-randconfig-004-20231022   gcc  
x86_64       buildonly-randconfig-005-20231021   gcc  
x86_64       buildonly-randconfig-005-20231022   gcc  
x86_64       buildonly-randconfig-006-20231021   gcc  
x86_64       buildonly-randconfig-006-20231022   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231022   gcc  
x86_64                randconfig-002-20231022   gcc  
x86_64                randconfig-003-20231022   gcc  
x86_64                randconfig-004-20231022   gcc  
x86_64                randconfig-005-20231022   gcc  
x86_64                randconfig-006-20231022   gcc  
x86_64                randconfig-011-20231022   gcc  
x86_64                randconfig-012-20231022   gcc  
x86_64                randconfig-013-20231022   gcc  
x86_64                randconfig-014-20231022   gcc  
x86_64                randconfig-015-20231022   gcc  
x86_64                randconfig-016-20231022   gcc  
x86_64                randconfig-071-20231022   gcc  
x86_64                randconfig-072-20231022   gcc  
x86_64                randconfig-073-20231022   gcc  
x86_64                randconfig-074-20231022   gcc  
x86_64                randconfig-075-20231022   gcc  
x86_64                randconfig-076-20231022   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
