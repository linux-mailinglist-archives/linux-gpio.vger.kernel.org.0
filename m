Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6286FFFB1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 May 2023 06:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239828AbjELEil (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 May 2023 00:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239826AbjELEij (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2023 00:38:39 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E5F12D
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 21:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683866318; x=1715402318;
  h=date:from:to:cc:subject:message-id;
  bh=7YKD1vq8nCDO2JkpObbQyhT5iwk9STc1Fr5PfMaMqAo=;
  b=bunH6a+RWJy3g7XxNg5PFOTnMs6GeldVbHZHih0pYOgDagwXZ6M4AGHP
   jzmQRnOAWUe2AtLTsCNM5fS3M+EDrYGHR/qurW4TZotbf9gDHOzzPM3LZ
   jwHJAlRCsvvkcFKMZjGg9l5FrsSbKDSFAVR4Asbew4gjOo5YHDK0zMNIX
   OxbxaWXOHZBK/4osCw4ysOPE/qyAJ/RseN2rUb+dw1wa+mmQX5yYD1uPs
   kG8KCUWnXjKOgIruuUDCTUC9lklsHH3LHsK0Q3ioCQbJri87fJQJWNyNR
   esW5xqTZ3BpXixq5vMFjoaJcQqBfHsqmjzCDWhfqz7uT8Xk1MJrr+H8/Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340009766"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="340009766"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 21:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730661243"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="730661243"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 May 2023 21:38:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pxKY8-0004W2-00;
        Fri, 12 May 2023 04:38:36 +0000
Date:   Fri, 12 May 2023 12:38:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 6c19974d1e83fba2cca1cbea2fbf250f093eb5ed
Message-ID: <20230512043823.KEC2n%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 6c19974d1e83fba2cca1cbea2fbf250f093eb5ed  dt-bindings: gpio: Convert STMPE GPIO to YAML schema

elapsed time: 731m

configs tested: 73
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230509   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
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
csky                                defconfig   gcc  
csky                 randconfig-r011-20230509   gcc  
csky                 randconfig-r021-20230511   gcc  
csky                 randconfig-r026-20230511   gcc  
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
microblaze           randconfig-r012-20230511   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r016-20230509   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230509   gcc  
nios2                randconfig-r016-20230511   gcc  
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
s390                 randconfig-r014-20230511   gcc  
s390                 randconfig-r022-20230511   gcc  
s390                 randconfig-r044-20230511   gcc  
sh                               allmodconfig   gcc  
sh                           se7712_defconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
