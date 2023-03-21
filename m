Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D6E6C2862
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Mar 2023 03:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjCUC6N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 22:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjCUC6M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 22:58:12 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1B3F74D
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 19:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679367490; x=1710903490;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7VnWTGKXH5O5py9okk+V9U8SOTfn77zZwUVfbm0n/NE=;
  b=K41RIL0y7hwmXK3Hevmhv8OceVtm0ri/bteNprhm8TgPDCgWRtatgKsE
   BoKLIaffE8ZIH0gAUWdfemvLI+bU0I8Vh9P19BN5QT6CNlKaaGYxsnHNH
   CVzZis4pS6/o9a2rI+cITdmxOTv2hb16LwngXJqClXzPvRR6NaHQ5Y4ys
   /8a854v/sGmBoz0oefTooAG2gtACRujxLiWcLNmf7soUkuCy0O4SmM026
   KkXPv/qfC4qgPwww8dp6FxH2ET0jL3uv+rIUqnn0SSzBuPZEgnUrOZjwo
   s1fPF2tRhiTBRlnoinW/qP6yWGMc2aXaq/2lE+i68yA0PeUtixKKZ+LBu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318484179"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="318484179"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 19:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="1010751735"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="1010751735"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2023 19:58:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peSCO-000BXY-1Q;
        Tue, 21 Mar 2023 02:58:08 +0000
Date:   Tue, 21 Mar 2023 10:57:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 454c44542d3547c8088dedd3efcc94d53b21ec24
Message-ID: <64191d15.BoJc41fVxYgTgW3Q%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 454c44542d3547c8088dedd3efcc94d53b21ec24  Merge branch 'devel' into for-next

elapsed time: 734m

configs tested: 143
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230319   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r036-20230319   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230319   gcc  
csky                 randconfig-r006-20230319   gcc  
csky                 randconfig-r014-20230319   gcc  
csky                 randconfig-r031-20230319   gcc  
hexagon              randconfig-r022-20230319   clang
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r045-20230319   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230320   clang
i386                 randconfig-a002-20230320   clang
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230320   clang
i386                 randconfig-a004-20230320   clang
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230320   clang
i386                 randconfig-a006-20230320   clang
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230320   gcc  
i386                 randconfig-a012-20230320   gcc  
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230320   gcc  
i386                 randconfig-a014-20230320   gcc  
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230320   gcc  
i386                 randconfig-a016-20230320   gcc  
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230319   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230319   gcc  
ia64                 randconfig-r021-20230319   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230319   gcc  
loongarch            randconfig-r025-20230320   gcc  
loongarch            randconfig-r026-20230320   gcc  
loongarch            randconfig-r032-20230319   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r026-20230319   gcc  
m68k                 randconfig-r031-20230319   gcc  
microblaze           randconfig-r034-20230319   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r026-20230319   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230319   gcc  
nios2                randconfig-r003-20230319   gcc  
nios2                randconfig-r023-20230320   gcc  
openrisc             randconfig-r021-20230319   gcc  
openrisc             randconfig-r022-20230319   gcc  
openrisc             randconfig-r023-20230319   gcc  
openrisc             randconfig-r024-20230319   gcc  
openrisc             randconfig-r025-20230319   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230319   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230319   clang
powerpc                        fsp2_defconfig   clang
powerpc                mpc7448_hpc2_defconfig   gcc  
powerpc              randconfig-r002-20230319   gcc  
powerpc              randconfig-r005-20230319   gcc  
powerpc              randconfig-r021-20230319   clang
powerpc              randconfig-r021-20230320   gcc  
powerpc              randconfig-r033-20230319   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230319   gcc  
riscv                randconfig-r042-20230319   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230319   clang
s390                                defconfig   gcc  
s390                 randconfig-r023-20230319   clang
s390                 randconfig-r044-20230319   clang
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230319   gcc  
sh                   randconfig-r032-20230319   gcc  
sh                          rsk7269_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230319   gcc  
sparc                randconfig-r004-20230319   gcc  
sparc                randconfig-r012-20230319   gcc  
sparc                randconfig-r015-20230319   gcc  
sparc                randconfig-r024-20230320   gcc  
sparc                randconfig-r035-20230319   gcc  
sparc64              randconfig-r011-20230319   gcc  
sparc64              randconfig-r033-20230319   gcc  
sparc64              randconfig-r035-20230319   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230320   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230320   clang
x86_64               randconfig-a003-20230320   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230320   clang
x86_64               randconfig-a005-20230320   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230320   clang
x86_64               randconfig-a011-20230320   gcc  
x86_64               randconfig-a012-20230320   gcc  
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230320   gcc  
x86_64               randconfig-a014-20230320   gcc  
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230320   gcc  
x86_64               randconfig-a016-20230320   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r022-20230320   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230319   gcc  
xtensa               randconfig-r034-20230319   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
