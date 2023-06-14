Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32980715E23
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 13:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjE3L5L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 07:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjE3L5K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 07:57:10 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136FD124
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685447798; x=1716983798;
  h=date:from:to:cc:subject:message-id;
  bh=9shBSKfaUJxKI6Bz73Jl3b5jmAOMvoGSmKheZ8PTvwc=;
  b=a7tdEOg0dLDyeDB0Y9Sl0O5Y2u8dNvkrF0DkDUGz1QL5/sO4BwIAsRoa
   dhS/ev/P8Q2NxOeBNqfM6kzRgOaObgdFalzPDJJO/AdPUnTNHNS19PFqM
   kiGEdUtJIam7jl/kQQIKsDIplSt8O3TYd5JWc1x98nCH6D3fkRsdKQyHk
   gAJfKHUlmxOd43h36QFhBEyXAih3Om54LMQeqJckirIkxZYOc1LYjtxmJ
   /b7K7CoVcNnCFgUMEInyoP3CJayVCYxWaPYRx3zBYBe7qXi11wINOjCo/
   7Hes6KGe3KGKm3SwYhtZg9l2btO9akAo/t8kV3sTEvU0i/qUv2PYqFBBN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="334514634"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="334514634"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 04:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796251516"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="796251516"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 May 2023 04:56:11 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q3xxS-0000MI-0f;
        Tue, 30 May 2023 11:56:10 +0000
Date:   Tue, 30 May 2023 19:55:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 b2b56a16323043b49dea915bc47408b30b91b0b6
Message-ID: <20230530115510.Weif7%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: b2b56a16323043b49dea915bc47408b30b91b0b6  gpio: tegra186: Check GPIO pin permission before access.

elapsed time: 5658m

configs tested: 173
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230526   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230526   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc          buildonly-randconfig-r005-20230526   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                  randconfig-r035-20230526   gcc  
arc                  randconfig-r043-20230526   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          ixp4xx_defconfig   clang
arm                      jornada720_defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                  randconfig-r014-20230526   gcc  
arm                  randconfig-r022-20230526   gcc  
arm                  randconfig-r046-20230526   gcc  
arm                        spear6xx_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r025-20230526   clang
arm64                randconfig-r034-20230526   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r024-20230526   gcc  
hexagon              randconfig-r041-20230526   clang
hexagon              randconfig-r045-20230526   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230526   gcc  
i386                 randconfig-i002-20230526   gcc  
i386                 randconfig-i003-20230526   gcc  
i386                 randconfig-i004-20230526   gcc  
i386                 randconfig-i005-20230526   gcc  
i386                 randconfig-i006-20230526   gcc  
i386                 randconfig-i011-20230526   clang
i386                 randconfig-i012-20230526   clang
i386                 randconfig-i013-20230526   clang
i386                 randconfig-i014-20230526   clang
i386                 randconfig-i015-20230526   clang
i386                 randconfig-i016-20230526   clang
i386                 randconfig-i051-20230526   gcc  
i386                 randconfig-i052-20230526   gcc  
i386                 randconfig-i053-20230526   gcc  
i386                 randconfig-i054-20230526   gcc  
i386                 randconfig-i055-20230526   gcc  
i386                 randconfig-i056-20230526   gcc  
i386                 randconfig-i061-20230526   gcc  
i386                 randconfig-i062-20230526   gcc  
i386                 randconfig-i063-20230526   gcc  
i386                 randconfig-i064-20230526   gcc  
i386                 randconfig-i065-20230526   gcc  
i386                 randconfig-i066-20230526   gcc  
i386                 randconfig-i071-20230526   clang
i386                 randconfig-i072-20230526   clang
i386                 randconfig-i073-20230526   clang
i386                 randconfig-i074-20230526   clang
i386                 randconfig-i075-20230526   clang
i386                 randconfig-i076-20230526   clang
i386                 randconfig-i081-20230526   clang
i386                 randconfig-i082-20230526   clang
i386                 randconfig-i083-20230526   clang
i386                 randconfig-i084-20230526   clang
i386                 randconfig-i085-20230526   clang
i386                 randconfig-i086-20230526   clang
i386                 randconfig-i091-20230526   gcc  
i386                 randconfig-i092-20230526   gcc  
i386                 randconfig-i093-20230526   gcc  
i386                 randconfig-i094-20230526   gcc  
i386                 randconfig-i095-20230526   gcc  
i386                 randconfig-i096-20230526   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230526   gcc  
loongarch            randconfig-r023-20230526   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze           randconfig-r033-20230526   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230526   clang
mips                     cu1830-neo_defconfig   clang
mips                 randconfig-r013-20230526   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230526   gcc  
openrisc             randconfig-r011-20230526   gcc  
openrisc             randconfig-r012-20230526   gcc  
openrisc             randconfig-r021-20230526   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r036-20230526   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230526   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230526   clang
s390                                defconfig   gcc  
s390                 randconfig-r002-20230526   gcc  
s390                 randconfig-r026-20230526   clang
s390                 randconfig-r044-20230526   clang
sh                               allmodconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                   randconfig-r004-20230526   gcc  
sh                   randconfig-r031-20230526   gcc  
sh                             shx3_defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230526   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230526   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230526   gcc  
x86_64               randconfig-a002-20230526   gcc  
x86_64               randconfig-a003-20230526   gcc  
x86_64               randconfig-a004-20230526   gcc  
x86_64               randconfig-a005-20230526   gcc  
x86_64               randconfig-a006-20230526   gcc  
x86_64               randconfig-a011-20230526   clang
x86_64               randconfig-a012-20230526   clang
x86_64               randconfig-a013-20230526   clang
x86_64               randconfig-a014-20230526   clang
x86_64               randconfig-a015-20230526   clang
x86_64               randconfig-a016-20230526   clang
x86_64               randconfig-k001-20230528   clang
x86_64               randconfig-x051-20230526   clang
x86_64               randconfig-x052-20230526   clang
x86_64               randconfig-x053-20230526   clang
x86_64               randconfig-x054-20230526   clang
x86_64               randconfig-x055-20230526   clang
x86_64               randconfig-x056-20230526   clang
x86_64               randconfig-x061-20230526   clang
x86_64               randconfig-x062-20230526   clang
x86_64               randconfig-x063-20230526   clang
x86_64               randconfig-x064-20230526   clang
x86_64               randconfig-x065-20230526   clang
x86_64               randconfig-x066-20230526   clang
x86_64               randconfig-x071-20230526   gcc  
x86_64               randconfig-x072-20230526   gcc  
x86_64               randconfig-x073-20230526   gcc  
x86_64               randconfig-x074-20230526   gcc  
x86_64               randconfig-x075-20230526   gcc  
x86_64               randconfig-x076-20230526   gcc  
x86_64               randconfig-x081-20230526   gcc  
x86_64               randconfig-x082-20230526   gcc  
x86_64               randconfig-x083-20230526   gcc  
x86_64               randconfig-x084-20230526   gcc  
x86_64               randconfig-x085-20230526   gcc  
x86_64               randconfig-x086-20230526   gcc  
x86_64               randconfig-x091-20230526   clang
x86_64               randconfig-x092-20230526   clang
x86_64               randconfig-x093-20230526   clang
x86_64               randconfig-x094-20230526   clang
x86_64               randconfig-x095-20230526   clang
x86_64               randconfig-x096-20230526   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
