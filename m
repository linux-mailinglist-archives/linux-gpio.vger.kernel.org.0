Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30BA26B86E3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 01:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjCNA3B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 20:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCNA27 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 20:28:59 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FE458B7E
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 17:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678753738; x=1710289738;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=11+if79O2GOXq9p08485PCzMow49M5hjxeW48xPx5cA=;
  b=YrzDVnr8S60YXlJwvYAKUdibkmM4AOol4Aq8j2Q7A3rM9czpTpUudhrv
   PCbv8/CNydkvJvjq3kFjXFrKW8/Fn+BFQ1mQJUXuVaIaA8w2ercKHfL6U
   Pa0lTIaJISxnqAGvL/bdqNcAdGnQ/VH7NrR9+15BfjQVxzjtWrIvd/yG/
   rZyTTRiSBWn5BAWKxRnIrNgJtt0S3GH4uCsayCnq6PqlF1fsy4oM2z2CC
   C7/g2bKwBR4L7+f/Dhkw/X0Gog8oZIqyE/W/O4EI/km1T/tDtdE9a2ioH
   qJKHIPdE6Mwmx0ur3LKVLg1kYHQmMvZcXYC3x8BVLxTEEr/meWhh1D2z/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="339658513"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="339658513"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 17:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="628823688"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="628823688"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Mar 2023 17:28:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pbsX9-0006J8-1U;
        Tue, 14 Mar 2023 00:28:55 +0000
Date:   Tue, 14 Mar 2023 08:28:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 5c6073d29c45de473db1c63cf957672e3ba91520
Message-ID: <640fbfa3.4auOJZ5dNNf12jZO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 5c6073d29c45de473db1c63cf957672e3ba91520  Merge branch 'devel' into for-next

elapsed time: 732m

configs tested: 128
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230312   gcc  
arc                  randconfig-r023-20230313   gcc  
arc                  randconfig-r032-20230312   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230313   clang
arm                  randconfig-r006-20230312   gcc  
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230312   clang
arm64                randconfig-r005-20230312   clang
arm64                randconfig-r016-20230312   gcc  
arm64                randconfig-r022-20230312   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r033-20230313   gcc  
csky                 randconfig-r036-20230312   gcc  
hexagon              randconfig-r015-20230312   clang
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
i386                 randconfig-r011-20230313   clang
i386                 randconfig-r035-20230313   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r031-20230312   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230312   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230312   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230312   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230312   gcc  
microblaze   buildonly-randconfig-r005-20230312   gcc  
microblaze           randconfig-r006-20230313   gcc  
microblaze           randconfig-r013-20230313   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230313   clang
mips                 randconfig-r003-20230313   clang
mips                 randconfig-r011-20230312   clang
mips                 randconfig-r013-20230312   clang
mips                 randconfig-r021-20230313   gcc  
mips                 randconfig-r022-20230313   gcc  
nios2        buildonly-randconfig-r006-20230312   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r026-20230312   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230313   gcc  
parisc               randconfig-r034-20230313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r036-20230313   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r025-20230312   gcc  
riscv                randconfig-r026-20230313   clang
riscv                randconfig-r031-20230313   gcc  
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230312   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r024-20230313   clang
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r035-20230312   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230312   gcc  
sparc                randconfig-r025-20230313   gcc  
sparc64      buildonly-randconfig-r002-20230313   gcc  
sparc64              randconfig-r012-20230312   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64               randconfig-a016-20230313   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230313   gcc  
xtensa               randconfig-r014-20230313   gcc  
xtensa               randconfig-r023-20230312   gcc  
xtensa               randconfig-r032-20230313   gcc  
xtensa               randconfig-r033-20230312   gcc  
xtensa               randconfig-r034-20230312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
