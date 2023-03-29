Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6340D6CD379
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 09:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjC2Hlz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 03:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjC2Hlx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 03:41:53 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098FBB5
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 00:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680075713; x=1711611713;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rFUzhPpUAiyfXHQVVYtPjg0B1gAy3IvI4laUbwGaBpY=;
  b=JB7cdMZ49iL7jHDBFbXf3OIGcegrXJojOdXD4qzNi0/cy44kN4/ORX3+
   /9q713bqZQsaxgy5twYAuK7lmrtpDx8Sc6eHXFkHN3Jsil3zk6Z4FHCae
   aHXUxDx9RMyQ1S0T7gpDexd39TkwKIwMn4cMPxLRt1Rck+LsKkuc7qf1v
   4M5QOLqJPPvoC0g1gwNMK8bVIZZQ8aagljYjsuaGUN+D/fuL69N0CseY5
   MpWcN1DiNqXNjYtubwtxwRfiFnoTpkj+pK9E+wPUsaeYHH0J4PQTjcL1u
   G9vdWLtbjD4ZH7VYxF9BzfKk0j4iixYtd9KJsWv4gsRflv1sd0NiHKfqM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338306975"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="338306975"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 00:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="753482669"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="753482669"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2023 00:41:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1phQRB-000JK9-0A;
        Wed, 29 Mar 2023 07:41:41 +0000
Date:   Wed, 29 Mar 2023 15:40:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 b26cd9325be4c1fcd331b77f10acb627c560d4d7
Message-ID: <6423eb86.nhjPv1lI/KBcuEt5%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: b26cd9325be4c1fcd331b77f10acb627c560d4d7  pinctrl: amd: Disable and mask interrupts on resume

elapsed time: 724m

configs tested: 129
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230327   gcc  
alpha                randconfig-r034-20230326   gcc  
alpha                randconfig-r036-20230326   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230326   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r034-20230327   gcc  
arc                  randconfig-r043-20230326   gcc  
arc                  randconfig-r043-20230327   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230327   gcc  
arm                  randconfig-r031-20230327   clang
arm                  randconfig-r046-20230326   clang
arm                  randconfig-r046-20230327   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230327   gcc  
arm64                randconfig-r012-20230326   gcc  
arm64                randconfig-r026-20230326   gcc  
csky         buildonly-randconfig-r002-20230327   gcc  
csky         buildonly-randconfig-r003-20230326   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230326   gcc  
csky                 randconfig-r006-20230326   gcc  
csky                 randconfig-r015-20230326   gcc  
hexagon              randconfig-r041-20230326   clang
hexagon              randconfig-r041-20230327   clang
hexagon              randconfig-r045-20230326   clang
hexagon              randconfig-r045-20230327   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230327   clang
i386                 randconfig-a012-20230327   clang
i386                 randconfig-a013-20230327   clang
i386                 randconfig-a014-20230327   clang
i386                 randconfig-a015-20230327   clang
i386                 randconfig-a016-20230327   clang
i386                 randconfig-r012-20230327   clang
i386                 randconfig-r032-20230327   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230327   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230327   gcc  
m68k                 randconfig-r021-20230326   gcc  
microblaze           randconfig-r011-20230326   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230327   clang
mips                 randconfig-r001-20230326   gcc  
mips                 randconfig-r033-20230327   clang
nios2        buildonly-randconfig-r001-20230326   gcc  
nios2        buildonly-randconfig-r002-20230326   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230326   gcc  
openrisc     buildonly-randconfig-r001-20230327   gcc  
openrisc             randconfig-r006-20230327   gcc  
openrisc             randconfig-r011-20230327   gcc  
openrisc             randconfig-r013-20230326   gcc  
openrisc             randconfig-r016-20230326   gcc  
openrisc             randconfig-r033-20230326   gcc  
parisc       buildonly-randconfig-r004-20230327   gcc  
parisc       buildonly-randconfig-r005-20230327   gcc  
parisc       buildonly-randconfig-r006-20230326   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230327   gcc  
parisc               randconfig-r036-20230327   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230326   clang
powerpc              randconfig-r014-20230327   clang
powerpc              randconfig-r031-20230326   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230327   clang
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230326   gcc  
riscv                randconfig-r042-20230327   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230326   gcc  
s390                 randconfig-r044-20230327   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r022-20230326   gcc  
sh                   randconfig-r035-20230326   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r001-20230327   gcc  
sparc64              randconfig-r003-20230327   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
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
x86_64               randconfig-r023-20230327   clang
x86_64               randconfig-r025-20230327   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230327   gcc  
xtensa               randconfig-r032-20230326   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
