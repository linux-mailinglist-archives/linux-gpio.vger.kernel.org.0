Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 004A175C089
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 09:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjGUH4j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jul 2023 03:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjGUH4h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 03:56:37 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3079113
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jul 2023 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689926188; x=1721462188;
  h=date:from:to:cc:subject:message-id;
  bh=qwK1RVrkpmy++dCu3c0ugXOwA/d78gDRV8RiP29y+CU=;
  b=g5BiDH7oEYSk3KRjKHVVL1I8Z1A9Rvc3/f+tcD1WN1OEMUb3fr/PZMh5
   Lb1H3/hy0Pign8ku+maMouc8Sxcof5KVgqKVn7GrTLUwKED6B9/T0JDvH
   ew4BXv3HPf5DV/dSo6SM+AXwnR8Hu5//jCvJYqckZbsDws8nJfdBlk9/A
   XmuElWif6cGwQC0bgu8iwLHgBbhgFUfUK8DTtnjpW131wkrxju/2Scwji
   aC5n7/Pc7BKgDQXMFivFhDrjx96S3lV5s7N5OXtidGsC/5nWt56sRDNfF
   bmQJhS7bN1bZ+0Ev3AodWjsi3x9bjm70QXOSnXO3Fj174vlK3cIgMc0V7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370565053"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="370565053"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 00:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="971352847"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="971352847"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jul 2023 00:56:09 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qMkzg-00072L-36;
        Fri, 21 Jul 2023 07:56:08 +0000
Date:   Fri, 21 Jul 2023 15:55:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 060f03e95454a0f4a1deff3e5f912e461ae0f0c5
Message-ID: <202307211531.iutlVYA1-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 060f03e95454a0f4a1deff3e5f912e461ae0f0c5  pinctrl: Explicitly include correct DT includes

elapsed time: 727m

configs tested: 130
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230720   gcc  
alpha                randconfig-r026-20230720   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230720   gcc  
arc                  randconfig-r012-20230720   gcc  
arc                  randconfig-r021-20230720   gcc  
arc                  randconfig-r036-20230720   gcc  
arc                  randconfig-r043-20230720   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r014-20230720   gcc  
arm                  randconfig-r023-20230720   gcc  
arm                  randconfig-r031-20230720   clang
arm                  randconfig-r033-20230720   clang
arm                  randconfig-r046-20230720   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230720   clang
csky                                defconfig   gcc  
csky                 randconfig-r005-20230720   gcc  
csky                 randconfig-r011-20230720   gcc  
hexagon              randconfig-r041-20230720   clang
hexagon              randconfig-r045-20230720   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230720   gcc  
i386         buildonly-randconfig-r005-20230720   gcc  
i386         buildonly-randconfig-r006-20230720   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230720   gcc  
i386                 randconfig-i002-20230720   gcc  
i386                 randconfig-i003-20230720   gcc  
i386                 randconfig-i004-20230720   gcc  
i386                 randconfig-i005-20230720   gcc  
i386                 randconfig-i006-20230720   gcc  
i386                 randconfig-i011-20230720   clang
i386                 randconfig-i012-20230720   clang
i386                 randconfig-i013-20230720   clang
i386                 randconfig-i014-20230720   clang
i386                 randconfig-i015-20230720   clang
i386                 randconfig-i016-20230720   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230720   gcc  
m68k                 randconfig-r012-20230720   gcc  
microblaze           randconfig-r005-20230720   gcc  
microblaze           randconfig-r016-20230720   gcc  
microblaze           randconfig-r021-20230720   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230720   clang
mips                 randconfig-r002-20230720   clang
mips                 randconfig-r013-20230720   gcc  
mips                 randconfig-r016-20230720   gcc  
mips                 randconfig-r035-20230720   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r004-20230720   gcc  
openrisc             randconfig-r006-20230720   gcc  
openrisc             randconfig-r025-20230720   gcc  
openrisc             randconfig-r036-20230720   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230720   gcc  
parisc               randconfig-r006-20230720   gcc  
parisc               randconfig-r031-20230720   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc              randconfig-r002-20230720   gcc  
powerpc              randconfig-r015-20230720   clang
powerpc              randconfig-r025-20230720   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r032-20230720   gcc  
riscv                randconfig-r042-20230720   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230720   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230720   gcc  
sh                   randconfig-r023-20230720   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230720   gcc  
sparc                randconfig-r034-20230720   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r003-20230720   clang
um                   randconfig-r026-20230720   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230720   gcc  
x86_64       buildonly-randconfig-r002-20230720   gcc  
x86_64       buildonly-randconfig-r003-20230720   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r022-20230720   clang
x86_64               randconfig-r033-20230720   gcc  
x86_64               randconfig-x001-20230720   clang
x86_64               randconfig-x002-20230720   clang
x86_64               randconfig-x003-20230720   clang
x86_64               randconfig-x004-20230720   clang
x86_64               randconfig-x005-20230720   clang
x86_64               randconfig-x006-20230720   clang
x86_64               randconfig-x011-20230720   gcc  
x86_64               randconfig-x012-20230720   gcc  
x86_64               randconfig-x013-20230720   gcc  
x86_64               randconfig-x014-20230720   gcc  
x86_64               randconfig-x015-20230720   gcc  
x86_64               randconfig-x016-20230720   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230720   gcc  
xtensa               randconfig-r005-20230720   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
