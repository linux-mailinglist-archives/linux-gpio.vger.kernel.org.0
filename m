Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD3371FA31
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 08:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbjFBGiU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 02:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233572AbjFBGiT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 02:38:19 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8071E132
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 23:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685687897; x=1717223897;
  h=date:from:to:cc:subject:message-id;
  bh=gTZjh/cWZK0aeC9yqfdVjUPL/81PKZTusKjLFnBaagU=;
  b=YfLe/NtnP79MBjvuivKAn2yBiVEeYX4DCPS6V68uN2CTj3gUP2qIp1EJ
   udIfvvKvhnuToFBCNhFkYZ5AdkQLHIWnkHeeo9R6VjeN6WoDkEa4zdv2U
   eZ8Ra+ikJIM5x60d6QVN8yVjloEHaMNNXeVFtHiN2oSLQzzFkq0JHXHoA
   aeZ3lQy/16wY+wI8DUyNYz9tgN0m13z3RB/at0fbAjW9MFA1W99L4CeGg
   ExlA0OousSER4dLWdjWUHghpbSGFSAdXxIUTzQ1P+91WF14FLrlaEvbgs
   tooRerVOVqlDlNdoyBzfDx/8WTu4MYch5W3T3H9Wy0u8Uzl/xOkGosJa2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="340417376"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="340417376"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 23:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777525273"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="777525273"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2023 23:38:15 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q4yQR-0000Be-16;
        Fri, 02 Jun 2023 06:38:15 +0000
Date:   Fri, 02 Jun 2023 14:38:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 1a55fc4012d977de5f88fc7f07535783c9f8d86c
Message-ID: <20230602063808.Nr3VO%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 1a55fc4012d977de5f88fc7f07535783c9f8d86c  gpiolib: Unify allocation and initialization of GPIO valid mask

elapsed time: 723m

configs tested: 95
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230531   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230601   gcc  
arc                  randconfig-r043-20230531   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r026-20230531   gcc  
arm                  randconfig-r046-20230531   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230531   gcc  
arm64                randconfig-r036-20230602   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r035-20230602   gcc  
hexagon      buildonly-randconfig-r003-20230531   clang
hexagon              randconfig-r015-20230601   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230602   gcc  
i386                 randconfig-i002-20230602   gcc  
i386                 randconfig-i003-20230602   gcc  
i386                 randconfig-i004-20230602   gcc  
i386                 randconfig-i005-20230602   gcc  
i386                 randconfig-i006-20230602   gcc  
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i061-20230602   gcc  
i386                 randconfig-i062-20230602   gcc  
i386                 randconfig-i063-20230602   gcc  
i386                 randconfig-i064-20230602   gcc  
i386                 randconfig-i065-20230602   gcc  
i386                 randconfig-i066-20230602   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230531   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230601   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230531   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230531   gcc  
m68k                 randconfig-r016-20230601   gcc  
microblaze           randconfig-r024-20230531   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230531   clang
mips                 randconfig-r011-20230601   clang
mips                 randconfig-r022-20230531   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r002-20230531   gcc  
parisc       buildonly-randconfig-r005-20230531   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230531   clang
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230601   gcc  
riscv                randconfig-r034-20230602   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64               randconfig-r003-20230531   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r033-20230602   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
