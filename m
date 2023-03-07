Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F31CE6AD394
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 01:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjCGA6z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 19:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjCGA6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 19:58:54 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6592F3252D
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 16:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678150731; x=1709686731;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6dCK4QNG/yL8VFc5n5Wc19TYKZPeVqli+HNdSekqc+g=;
  b=cHt3p0KqGQ+9aWwNypE6TpriRoLj2QFweY+DRAAkHyRxMh12P7UF7Eol
   y8maSAXy84aM7sGe/RZ80fE+i83geDzfJVBa7cOhT8VvpWuPHy7tp7Ih4
   5fw8nmuCfAepaePhRIoxGN+K7L7enRkCDZYR/o7yGB6NRob58ES+sySL7
   MdSOIWNdDwlrfaz9hyH/OgOEIlg7J3LFnGEBhua8BQP9mrg97QKXvwYAw
   0ezyb094/oT8HI/Sw3O0gppSGLVX+tNw7oVNHcyCLTOMQA5iKeI87zU6X
   PPOjDGjVTPD1I837Va0jMBKiSqRKYVJPhCOT51k83nJ99Qh3cTNaiy5jD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="324033197"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="324033197"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 16:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669672419"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="669672419"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Mar 2023 16:58:49 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZLfA-0000oh-0F;
        Tue, 07 Mar 2023 00:58:44 +0000
Date:   Tue, 07 Mar 2023 08:58:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 d49765b5f4320a402fbc4ed5edfd73d87640f27c
Message-ID: <64068c3b.EMOvfK8FGfzZCCjX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: d49765b5f4320a402fbc4ed5edfd73d87640f27c  gpio: GPIO_REGMAP: select REGMAP instead of depending on it

elapsed time: 724m

configs tested: 126
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230306   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230306   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r021-20230306   gcc  
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230306   gcc  
arm64                randconfig-r022-20230305   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230306   gcc  
csky                 randconfig-r015-20230306   gcc  
csky                 randconfig-r032-20230305   gcc  
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230306   gcc  
i386                 randconfig-a002-20230306   gcc  
i386                 randconfig-a003-20230306   gcc  
i386                 randconfig-a004-20230306   gcc  
i386                 randconfig-a005-20230306   gcc  
i386                 randconfig-a006-20230306   gcc  
i386                 randconfig-a011-20230306   clang
i386                 randconfig-a012-20230306   clang
i386                 randconfig-a013-20230306   clang
i386                 randconfig-a014-20230306   clang
i386                 randconfig-a015-20230306   clang
i386                 randconfig-a016-20230306   clang
i386                 randconfig-r012-20230306   clang
i386                 randconfig-r034-20230306   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230305   gcc  
ia64                 randconfig-r006-20230305   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230305   gcc  
loongarch            randconfig-r036-20230305   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230306   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230305   gcc  
m68k                 randconfig-r011-20230306   gcc  
microblaze   buildonly-randconfig-r001-20230306   gcc  
microblaze           randconfig-r003-20230306   gcc  
microblaze           randconfig-r026-20230305   gcc  
microblaze           randconfig-r031-20230306   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230305   gcc  
mips                 randconfig-r005-20230305   gcc  
mips                 randconfig-r006-20230306   clang
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230305   gcc  
nios2                randconfig-r035-20230306   gcc  
openrisc             randconfig-r011-20230305   gcc  
openrisc             randconfig-r014-20230305   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230305   gcc  
parisc               randconfig-r022-20230306   gcc  
parisc               randconfig-r024-20230305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r025-20230306   clang
powerpc              randconfig-r031-20230305   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r034-20230305   clang
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r035-20230305   clang
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230306   gcc  
sh                   randconfig-r033-20230305   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230306   gcc  
sparc                randconfig-r016-20230306   gcc  
sparc64              randconfig-r005-20230306   gcc  
sparc64              randconfig-r023-20230306   gcc  
sparc64              randconfig-r025-20230305   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230306   gcc  
x86_64               randconfig-a002-20230306   gcc  
x86_64               randconfig-a003-20230306   gcc  
x86_64               randconfig-a004-20230306   gcc  
x86_64               randconfig-a005-20230306   gcc  
x86_64               randconfig-a006-20230306   gcc  
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64               randconfig-r024-20230306   clang
x86_64               randconfig-r026-20230306   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230305   gcc  
xtensa               randconfig-r014-20230306   gcc  
xtensa               randconfig-r015-20230305   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
