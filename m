Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE5153C046
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jun 2022 23:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239393AbiFBVGz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jun 2022 17:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239390AbiFBVGx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2022 17:06:53 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B604812768
        for <linux-gpio@vger.kernel.org>; Thu,  2 Jun 2022 14:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654204012; x=1685740012;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IcMlWbLRXzCLBhtZe3Aihjwo0jvGjU6y9UE/6lKd9mU=;
  b=Y0gZCi482brXAjH9DyIZ8CtT2ewP908hJDyJqyE54fKbtnuh6Y8Bpl2h
   MH7MP1cJqeTcqV87FbrJ3s/32ZJxN6h+wepAnf2E8nG1dfDK0zentvh0Y
   bWGswkVUGD7d0mZjts6m67zfRlsQoLGbH0WyB4DTMBITJlboXH0+1suKQ
   h1/BdLRXhlgG7L1MiUM5evvNUxDnAJqY9qH8Gulm0j47HIB4sB9AFQadC
   aUj/YXEaH3XQKM0yaNI21hkii5AQ1Jl4eTGbfemPEgqC0ibMx0zzAtDnk
   iOmmWd46uWWw3/suTYgbkxtAyKHeVChwBc6CpqXE7reY+M0ZJLDtYdUOS
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="255945313"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; 
   d="scan'208";a="255945313"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 14:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; 
   d="scan'208";a="530744376"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2022 14:06:50 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nws1p-0005Rh-W5;
        Thu, 02 Jun 2022 21:06:50 +0000
Date:   Fri, 03 Jun 2022 05:06:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 7bb8a0cf49d5fede1104afdcb43bd2f8a1df3253
Message-ID: <6299263f.gfFXM0+H+QDHj1oM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 7bb8a0cf49d5fede1104afdcb43bd2f8a1df3253  gpio: adp5588: Remove support for platform setup and teardown callbacks

elapsed time: 775m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
s390                       zfcpdump_defconfig
sh                          r7785rp_defconfig
sh                          rsk7201_defconfig
arm                       omap2plus_defconfig
arm                      footbridge_defconfig
ia64                        generic_defconfig
mips                          rb532_defconfig
ia64                             alldefconfig
arm                         lpc18xx_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                             rpc_defconfig
arm                        mini2440_defconfig
sh                           se7343_defconfig
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20220531
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220531
s390                 randconfig-r044-20220531
riscv                randconfig-r042-20220531
arc                  randconfig-r043-20220601
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
mips                 randconfig-c004-20220531
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20220531
arm                  randconfig-c002-20220531
powerpc              randconfig-c003-20220531
riscv                randconfig-c006-20220531
powerpc                   lite5200b_defconfig
powerpc                      acadia_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220601
hexagon              randconfig-r045-20220601
riscv                randconfig-r042-20220601
s390                 randconfig-r044-20220601

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
