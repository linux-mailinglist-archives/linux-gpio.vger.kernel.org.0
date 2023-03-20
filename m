Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8C86C1108
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 12:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjCTLmA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 07:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbjCTLlz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 07:41:55 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560ED1ADEB
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 04:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679312512; x=1710848512;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F5T9gQLe5HLJ0Y+7r7KiDoYqYNsiZ0g8V1ZGGlyIREw=;
  b=WdTq2e06l2Ib5wewk65efrKozry7mECepKJWr/D+omXqVaDBgv4KYjoE
   Ye92VtdbtAd5GznzrHfKkEP33i0yknXKc+iV4qaDcQq7vmB1ICsnDKzOJ
   soOrwXxgA6uaDJDUgIEFLgIPjEQskivp27gmOg8qqpeonEkK3g6HsZh7n
   A+/xyYO6lKNUoQ5VnFfV7ogwrgC2eR9jkuRltLTp/ZNOmIAwEsoQDtzrz
   x1uk2X4z6GPJjyu2UsZbPjM7Q/VogiY/IwxJIwk4ILAT7vNQfmk2uJrpg
   Ux836Cr4et0zjGR39HbH6K3ZnRsySVq8PV5ooIBeTPrsNOGiaRQIsS8C/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="403508578"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="403508578"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 04:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="750065489"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="750065489"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2023 04:41:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peDtU-000B0m-3A;
        Mon, 20 Mar 2023 11:41:40 +0000
Date:   Mon, 20 Mar 2023 19:41:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 d11f932808dc689717e409bbc81b5093e7902fc9
Message-ID: <64184651.F6gavlYnj/ZNzQmC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: d11f932808dc689717e409bbc81b5093e7902fc9  pinctrl: mlxbf3: Add pinctrl driver support

elapsed time: 787m

configs tested: 171
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230319   gcc  
alpha        buildonly-randconfig-r002-20230319   gcc  
alpha        buildonly-randconfig-r004-20230319   gcc  
alpha        buildonly-randconfig-r005-20230320   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230319   gcc  
alpha                randconfig-r035-20230319   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230320   gcc  
arc                  randconfig-r034-20230319   gcc  
arc                  randconfig-r043-20230319   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                  randconfig-r006-20230319   clang
arm                  randconfig-r013-20230319   gcc  
arm                  randconfig-r016-20230319   gcc  
arm                  randconfig-r046-20230319   gcc  
arm                  randconfig-r046-20230320   clang
arm                         s3c6400_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230319   gcc  
arm64                               defconfig   gcc  
csky                             alldefconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r014-20230319   gcc  
hexagon      buildonly-randconfig-r006-20230319   clang
hexagon              randconfig-r003-20230320   clang
hexagon              randconfig-r004-20230320   clang
hexagon              randconfig-r006-20230320   clang
hexagon              randconfig-r041-20230319   clang
hexagon              randconfig-r041-20230320   clang
hexagon              randconfig-r045-20230319   clang
hexagon              randconfig-r045-20230320   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230320   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r011-20230319   gcc  
ia64                 randconfig-r014-20230319   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230320   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230319   gcc  
loongarch            randconfig-r014-20230319   gcc  
loongarch            randconfig-r031-20230319   gcc  
m68k                             allmodconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                 randconfig-r015-20230319   gcc  
m68k                           virt_defconfig   gcc  
microblaze   buildonly-randconfig-r003-20230319   gcc  
microblaze           randconfig-r016-20230320   gcc  
microblaze           randconfig-r032-20230319   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips         buildonly-randconfig-r001-20230320   gcc  
mips         buildonly-randconfig-r002-20230319   clang
mips         buildonly-randconfig-r004-20230320   gcc  
mips                            gpr_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                 randconfig-r021-20230319   gcc  
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230319   gcc  
nios2                randconfig-r031-20230319   gcc  
nios2                randconfig-r034-20230319   gcc  
openrisc             randconfig-r033-20230319   gcc  
openrisc             randconfig-r035-20230319   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230319   gcc  
parisc               randconfig-r033-20230319   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                 mpc85xx_cds_defconfig   gcc  
powerpc                     pq2fads_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc              randconfig-r013-20230320   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r016-20230319   clang
riscv                randconfig-r036-20230319   gcc  
riscv                randconfig-r042-20230319   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230319   clang
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r032-20230319   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230319   gcc  
sparc                randconfig-r015-20230319   gcc  
sparc                randconfig-r024-20230319   gcc  
sparc                randconfig-r025-20230319   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r011-20230319   gcc  
sparc64              randconfig-r013-20230319   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230320   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230320   clang
x86_64                        randconfig-a002   gcc  
x86_64               randconfig-a003-20230320   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230320   clang
x86_64                        randconfig-a004   gcc  
x86_64               randconfig-a005-20230320   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230320   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230320   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                              defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r012-20230320   gcc  
xtensa               randconfig-r026-20230319   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
