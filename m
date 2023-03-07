Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E906AD395
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 01:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjCGA6z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 19:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjCGA6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 19:58:54 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14133303DE
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 16:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678150731; x=1709686731;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6BwBRv2SSb/gWqeEv1bwzVtMLyJrbSxd02OfkvDcwmc=;
  b=RhVBCwtYZWBtxq//4YaSTcQkGjYa3gzclAvpP+Z3lkxzH0dtORktjHXk
   Z9O7LfIAM0zSfh5WHxJLxlwhyh5caVz4oVSENRAltgvN+P6TuFAYzdK2q
   Qc/sNGd+dPMxI7eHmDwgc+C9WI884ZorZzb+WL/Bs4zEAXOsm9lwek6HR
   PiC/iVUmGf4Jxlaw4+WLgr7WonqEg74EUwsD7i/6AdgY/h8V+SsTIu32k
   2XdUvUXoMPjhq/NWrYazy9FqI1WfjAJQHyF2vlZgS1hi7jPcgFGy4o412
   Ub78JqOpnP07dpUhHceLx2QKKLrVjO066rMxq1p+Qni+d1ndmY3vPZnc4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337244810"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="337244810"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 16:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676378235"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="676378235"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Mar 2023 16:58:49 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZLfA-0000oj-0K;
        Tue, 07 Mar 2023 00:58:44 +0000
Date:   Tue, 07 Mar 2023 08:58:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 0d8b4049bb4792da225e2c908282bb9ed1024ac7
Message-ID: <64068c30.h+vUPgc8Kr0Mpe/f%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 0d8b4049bb4792da225e2c908282bb9ed1024ac7  kbuild, gpio: gpio-aspeed-sgpio: remove MODULE_LICENSE in non-modules

elapsed time: 723m

configs tested: 113
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230306   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230306   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r034-20230306   clang
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230305   gcc  
arm64                randconfig-r026-20230306   clang
csky         buildonly-randconfig-r006-20230305   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230305   gcc  
csky                 randconfig-r025-20230306   gcc  
hexagon      buildonly-randconfig-r001-20230306   clang
hexagon              randconfig-r023-20230305   clang
hexagon              randconfig-r033-20230306   clang
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230306   gcc  
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
i386                 randconfig-r002-20230306   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r021-20230306   gcc  
ia64                 randconfig-r022-20230306   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230305   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r022-20230305   clang
nios2        buildonly-randconfig-r006-20230306   gcc  
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r001-20230305   gcc  
openrisc             randconfig-r031-20230306   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r032-20230306   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230306   gcc  
riscv                randconfig-r024-20230305   gcc  
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230305   clang
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230306   gcc  
sparc        buildonly-randconfig-r003-20230305   gcc  
sparc        buildonly-randconfig-r004-20230305   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230306   gcc  
sparc64              randconfig-r003-20230305   gcc  
sparc64              randconfig-r004-20230305   gcc  
sparc64              randconfig-r024-20230306   gcc  
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
x86_64               randconfig-r006-20230306   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230305   gcc  
xtensa               randconfig-r036-20230306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
