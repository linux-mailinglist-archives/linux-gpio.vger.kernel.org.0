Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 191456BC395
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Mar 2023 03:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCPCJX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 22:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjCPCJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 22:09:22 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA6E22C9E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 19:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678932560; x=1710468560;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SXppaR7OsUeu8AnfjtBKv4JLlZz4SdZs+kPuLtero9s=;
  b=RWufjtXBpU+cYOORq2bofk8zCz3/BtqnV/tZq4/GMK2SApBw9NrfFRvg
   2f7RZA/0orVi1JiSujWcB/xdSNKS85OArSmYNG18VYI7xUXW8ytmLjl26
   pnWWxRrqFq6GEfF20ngZWufaWUU5P416hAC3XrkIzArNErhW+AVYMQg/B
   pZQwM2qtjZBWukZt5XodeBr0Td5GsX/72AIcr+EHCXkek/PuEZbJ5cgi+
   eyPjx2nYf8C7gdJ9Dicn4dhAPZu+FN9ineOJagrzCNG1eZDLHkC3oEGbY
   UkkS0/sEBemXjb61P46Fz9TZ4X5aVkwsNUIq3Awm4LdEBy9hrwcJY9Fqv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="326224973"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="326224973"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 19:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="823019717"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="823019717"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2023 19:09:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pcd3N-0008El-0r;
        Thu, 16 Mar 2023 02:09:17 +0000
Date:   Thu, 16 Mar 2023 10:08:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 03810031c91dfe448cd116ee987d5dc4139006f4
Message-ID: <64127a1e.NHBQDjkfhTXkrILI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 03810031c91dfe448cd116ee987d5dc4139006f4  gpio: fxl6408: add I2C GPIO expander driver

elapsed time: 729m

configs tested: 308
configs skipped: 28

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230312   gcc  
alpha                randconfig-r024-20230312   gcc  
alpha                randconfig-r025-20230312   gcc  
alpha                randconfig-r026-20230313   gcc  
alpha                randconfig-r031-20230313   gcc  
alpha                randconfig-r034-20230313   gcc  
alpha                randconfig-r035-20230313   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc          buildonly-randconfig-r001-20230312   gcc  
arc          buildonly-randconfig-r003-20230312   gcc  
arc          buildonly-randconfig-r003-20230313   gcc  
arc          buildonly-randconfig-r004-20230312   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230312   gcc  
arc                  randconfig-r004-20230312   gcc  
arc                  randconfig-r011-20230313   gcc  
arc                  randconfig-r012-20230312   gcc  
arc                  randconfig-r013-20230313   gcc  
arc                  randconfig-r014-20230312   gcc  
arc                  randconfig-r015-20230312   gcc  
arc                  randconfig-r021-20230312   gcc  
arc                  randconfig-r023-20230313   gcc  
arc                  randconfig-r031-20230312   gcc  
arc                  randconfig-r031-20230313   gcc  
arc                  randconfig-r034-20230312   gcc  
arc                  randconfig-r036-20230312   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arc                  randconfig-r043-20230315   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230313   gcc  
arm          buildonly-randconfig-r005-20230313   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                        multi_v5_defconfig   clang
arm                  randconfig-r001-20230312   gcc  
arm                  randconfig-r004-20230312   gcc  
arm                  randconfig-r005-20230312   gcc  
arm                  randconfig-r006-20230312   gcc  
arm                  randconfig-r011-20230313   gcc  
arm                  randconfig-r013-20230313   gcc  
arm                  randconfig-r016-20230313   gcc  
arm                  randconfig-r021-20230313   gcc  
arm                  randconfig-r025-20230313   gcc  
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm                  randconfig-r046-20230315   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230313   gcc  
arm64        buildonly-randconfig-r006-20230313   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230313   gcc  
arm64                randconfig-r003-20230313   gcc  
arm64                randconfig-r011-20230312   gcc  
arm64                randconfig-r015-20230312   gcc  
arm64                randconfig-r022-20230312   gcc  
arm64                randconfig-r034-20230313   gcc  
csky         buildonly-randconfig-r005-20230313   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230313   gcc  
csky                 randconfig-r012-20230313   gcc  
csky                 randconfig-r014-20230313   gcc  
csky                 randconfig-r022-20230313   gcc  
csky                 randconfig-r023-20230312   gcc  
csky                 randconfig-r025-20230313   gcc  
csky                 randconfig-r026-20230312   gcc  
csky                 randconfig-r035-20230312   gcc  
csky                 randconfig-r036-20230313   gcc  
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r002-20230313   gcc  
i386         buildonly-randconfig-r003-20230313   gcc  
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
i386                 randconfig-r002-20230313   gcc  
i386                 randconfig-r005-20230313   gcc  
i386                 randconfig-r032-20230313   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230313   gcc  
ia64         buildonly-randconfig-r003-20230313   gcc  
ia64         buildonly-randconfig-r005-20230312   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230313   gcc  
ia64                 randconfig-r002-20230312   gcc  
ia64                 randconfig-r002-20230313   gcc  
ia64                 randconfig-r006-20230313   gcc  
ia64                 randconfig-r011-20230312   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230313   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230312   gcc  
loongarch            randconfig-r004-20230313   gcc  
loongarch            randconfig-r016-20230312   gcc  
loongarch            randconfig-r021-20230313   gcc  
loongarch            randconfig-r026-20230312   gcc  
loongarch            randconfig-r033-20230313   gcc  
loongarch            randconfig-r036-20230313   gcc  
m68k                             allmodconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k         buildonly-randconfig-r005-20230312   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230312   gcc  
m68k                 randconfig-r004-20230313   gcc  
m68k                 randconfig-r006-20230312   gcc  
m68k                 randconfig-r011-20230313   gcc  
m68k                 randconfig-r014-20230313   gcc  
m68k                 randconfig-r015-20230313   gcc  
m68k                 randconfig-r016-20230312   gcc  
m68k                 randconfig-r025-20230313   gcc  
m68k                 randconfig-r032-20230312   gcc  
microblaze   buildonly-randconfig-r001-20230312   gcc  
microblaze   buildonly-randconfig-r002-20230312   gcc  
microblaze   buildonly-randconfig-r005-20230312   gcc  
microblaze   buildonly-randconfig-r006-20230312   gcc  
microblaze           randconfig-r001-20230312   gcc  
microblaze           randconfig-r001-20230313   gcc  
microblaze           randconfig-r003-20230312   gcc  
microblaze           randconfig-r005-20230312   gcc  
microblaze           randconfig-r006-20230312   gcc  
microblaze           randconfig-r006-20230313   gcc  
microblaze           randconfig-r032-20230312   gcc  
microblaze           randconfig-r034-20230312   gcc  
microblaze           randconfig-r035-20230313   gcc  
microblaze           randconfig-r036-20230313   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230312   gcc  
mips                           ip27_defconfig   clang
mips                 randconfig-r014-20230312   clang
mips                 randconfig-r015-20230313   gcc  
mips                 randconfig-r022-20230313   gcc  
mips                 randconfig-r033-20230312   gcc  
mips                 randconfig-r035-20230312   gcc  
nios2        buildonly-randconfig-r001-20230313   gcc  
nios2        buildonly-randconfig-r003-20230312   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230312   gcc  
nios2                randconfig-r003-20230313   gcc  
nios2                randconfig-r012-20230312   gcc  
nios2                randconfig-r013-20230312   gcc  
nios2                randconfig-r014-20230312   gcc  
nios2                randconfig-r023-20230313   gcc  
nios2                randconfig-r025-20230312   gcc  
nios2                randconfig-r026-20230312   gcc  
nios2                randconfig-r036-20230312   gcc  
openrisc     buildonly-randconfig-r001-20230312   gcc  
openrisc     buildonly-randconfig-r001-20230313   gcc  
openrisc     buildonly-randconfig-r003-20230312   gcc  
openrisc     buildonly-randconfig-r005-20230313   gcc  
openrisc             randconfig-r014-20230312   gcc  
openrisc             randconfig-r023-20230312   gcc  
openrisc             randconfig-r031-20230312   gcc  
openrisc             randconfig-r032-20230312   gcc  
openrisc             randconfig-r034-20230313   gcc  
openrisc             randconfig-r036-20230312   gcc  
parisc       buildonly-randconfig-r002-20230312   gcc  
parisc       buildonly-randconfig-r006-20230312   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230312   gcc  
parisc               randconfig-r004-20230312   gcc  
parisc               randconfig-r005-20230312   gcc  
parisc               randconfig-r011-20230312   gcc  
parisc               randconfig-r014-20230313   gcc  
parisc               randconfig-r021-20230313   gcc  
parisc               randconfig-r031-20230313   gcc  
parisc               randconfig-r033-20230313   gcc  
parisc               randconfig-r034-20230312   gcc  
parisc               randconfig-r035-20230312   gcc  
parisc               randconfig-r036-20230313   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc              randconfig-r003-20230313   gcc  
powerpc              randconfig-r012-20230312   gcc  
powerpc              randconfig-r014-20230312   gcc  
powerpc              randconfig-r015-20230312   gcc  
powerpc              randconfig-r023-20230312   gcc  
powerpc              randconfig-r033-20230313   gcc  
powerpc              randconfig-r035-20230313   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230312   gcc  
riscv        buildonly-randconfig-r004-20230312   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                randconfig-r005-20230313   gcc  
riscv                randconfig-r006-20230313   gcc  
riscv                randconfig-r011-20230313   clang
riscv                randconfig-r025-20230312   gcc  
riscv                randconfig-r032-20230313   gcc  
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230313   gcc  
s390                 randconfig-r012-20230313   clang
s390                 randconfig-r013-20230312   gcc  
s390                 randconfig-r016-20230312   gcc  
s390                 randconfig-r032-20230313   gcc  
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230312   gcc  
sh           buildonly-randconfig-r004-20230313   gcc  
sh           buildonly-randconfig-r006-20230312   gcc  
sh           buildonly-randconfig-r006-20230313   gcc  
sh                   randconfig-r004-20230313   gcc  
sh                   randconfig-r005-20230312   gcc  
sh                   randconfig-r005-20230313   gcc  
sh                   randconfig-r016-20230313   gcc  
sh                   randconfig-r021-20230313   gcc  
sh                   randconfig-r024-20230313   gcc  
sh                   randconfig-r034-20230312   gcc  
sh                          rsk7269_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230312   gcc  
sparc        buildonly-randconfig-r003-20230313   gcc  
sparc        buildonly-randconfig-r004-20230313   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230313   gcc  
sparc                randconfig-r013-20230313   gcc  
sparc                randconfig-r015-20230313   gcc  
sparc                randconfig-r016-20230313   gcc  
sparc                randconfig-r023-20230312   gcc  
sparc                randconfig-r024-20230312   gcc  
sparc                randconfig-r025-20230313   gcc  
sparc                randconfig-r032-20230313   gcc  
sparc                randconfig-r034-20230312   gcc  
sparc                randconfig-r034-20230313   gcc  
sparc                randconfig-r035-20230312   gcc  
sparc                randconfig-r036-20230313   gcc  
sparc64      buildonly-randconfig-r002-20230313   gcc  
sparc64      buildonly-randconfig-r006-20230312   gcc  
sparc64              randconfig-r002-20230312   gcc  
sparc64              randconfig-r004-20230312   gcc  
sparc64              randconfig-r004-20230313   gcc  
sparc64              randconfig-r012-20230313   gcc  
sparc64              randconfig-r013-20230312   gcc  
sparc64              randconfig-r021-20230312   gcc  
sparc64              randconfig-r025-20230312   gcc  
sparc64              randconfig-r026-20230312   gcc  
sparc64              randconfig-r033-20230313   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r005-20230313   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64                        randconfig-a011   gcc  
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64                        randconfig-a015   gcc  
x86_64               randconfig-a016-20230313   clang
x86_64               randconfig-k001-20230313   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r033-20230313   gcc  
x86_64               randconfig-r035-20230313   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230312   gcc  
xtensa       buildonly-randconfig-r004-20230312   gcc  
xtensa                       common_defconfig   gcc  
xtensa               randconfig-r012-20230313   gcc  
xtensa               randconfig-r016-20230312   gcc  
xtensa               randconfig-r023-20230312   gcc  
xtensa               randconfig-r024-20230313   gcc  
xtensa               randconfig-r031-20230312   gcc  
xtensa               randconfig-r032-20230313   gcc  
xtensa               randconfig-r036-20230312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
