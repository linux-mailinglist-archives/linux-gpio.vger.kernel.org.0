Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 923726CBC68
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 12:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjC1KUE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 06:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjC1KUE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 06:20:04 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D122A5FC0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679998802; x=1711534802;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H9h4onXTM9/BKFqJ9M7pNPTPWwggIzk/NVW4rtMgX40=;
  b=elOYj9sYYI6q+XurZho1C9sZ9f+e/d5U04S4m5q6KYgeXOpGF9VosoV+
   XzGLNQm534DAxajQmsO0+HbPXkltXHkq8O444jyyOshoTzb/i1UOxNCmk
   QHW/7DyfcZIV+yIwKP9mclAPDWT4dzHt71j5HAeef7EofkIrUAcb9S0vR
   r6RralBF5zIsyy0L2brEQo20a8dEXKRmliaGvEW4cBBLALpqb10IO3J6E
   LFpWgYb/LYj5T8t+5IMW1DzBD5Sd9J42pr+ItpdIdLaRuCuYo/ousWUsm
   eMbdPe6G1VpOgJi6KiqBPhDXIpsKje4cBAJo/rJKZC6TrJwC4Ua7oZOTH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="403140071"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="403140071"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 03:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="858023216"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="858023216"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Mar 2023 03:20:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ph6Qq-000ITH-1M;
        Tue, 28 Mar 2023 10:20:00 +0000
Date:   Tue, 28 Mar 2023 18:19:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 94df03a4527611bfa7b461f2ba45370341e763b8
Message-ID: <6422bf1f.ZRy5pYA6TfHiSimA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 94df03a4527611bfa7b461f2ba45370341e763b8  dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding

elapsed time: 721m

configs tested: 122
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r034-20230327   gcc  
arc                  randconfig-r043-20230326   gcc  
arc                  randconfig-r043-20230327   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230327   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r022-20230326   clang
arm                  randconfig-r031-20230327   clang
arm                  randconfig-r046-20230326   clang
arm                  randconfig-r046-20230327   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230326   clang
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230326   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230326   gcc  
csky                 randconfig-r016-20230326   gcc  
csky                 randconfig-r024-20230326   gcc  
csky                 randconfig-r026-20230326   gcc  
csky                 randconfig-r034-20230326   gcc  
hexagon              randconfig-r022-20230327   clang
hexagon              randconfig-r041-20230326   clang
hexagon              randconfig-r041-20230327   clang
hexagon              randconfig-r045-20230326   clang
hexagon              randconfig-r045-20230327   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230327   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230327   gcc  
i386                 randconfig-a002-20230327   gcc  
i386                 randconfig-a003-20230327   gcc  
i386                 randconfig-a004-20230327   gcc  
i386                 randconfig-a005-20230327   gcc  
i386                 randconfig-a006-20230327   gcc  
i386                 randconfig-a011-20230327   clang
i386                 randconfig-a012-20230327   clang
i386                 randconfig-a013-20230327   clang
i386                 randconfig-a014-20230327   clang
i386                 randconfig-a015-20230327   clang
i386                 randconfig-a016-20230327   clang
i386                 randconfig-r004-20230327   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230327   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230327   gcc  
loongarch            randconfig-r004-20230326   gcc  
loongarch            randconfig-r015-20230326   gcc  
loongarch            randconfig-r025-20230326   gcc  
loongarch            randconfig-r032-20230326   gcc  
loongarch            randconfig-r033-20230327   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230327   gcc  
m68k         buildonly-randconfig-r004-20230326   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230326   gcc  
m68k                 randconfig-r023-20230326   gcc  
m68k                 randconfig-r031-20230326   gcc  
microblaze   buildonly-randconfig-r004-20230327   gcc  
microblaze   buildonly-randconfig-r005-20230326   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230326   gcc  
mips                 randconfig-r006-20230326   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r021-20230327   gcc  
openrisc             randconfig-r025-20230327   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r036-20230327   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230326   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230326   gcc  
riscv                randconfig-r026-20230327   clang
riscv                randconfig-r042-20230326   gcc  
riscv                randconfig-r042-20230327   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230327   gcc  
s390                 randconfig-r024-20230327   clang
s390                 randconfig-r044-20230326   gcc  
s390                 randconfig-r044-20230327   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r011-20230326   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230327   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230327   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230327   gcc  
x86_64               randconfig-a002-20230327   gcc  
x86_64               randconfig-a003-20230327   gcc  
x86_64               randconfig-a004-20230327   gcc  
x86_64               randconfig-a005-20230327   gcc  
x86_64               randconfig-a006-20230327   gcc  
x86_64               randconfig-a011-20230327   clang
x86_64               randconfig-a012-20230327   clang
x86_64               randconfig-a013-20230327   clang
x86_64               randconfig-a014-20230327   clang
x86_64               randconfig-a015-20230327   clang
x86_64               randconfig-a016-20230327   clang
x86_64               randconfig-r035-20230327   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230326   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
