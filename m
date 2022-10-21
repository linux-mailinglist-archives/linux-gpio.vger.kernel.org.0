Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58346606F41
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 07:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiJUFMj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 01:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiJUFMg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 01:12:36 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9B117E202
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 22:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666329151; x=1697865151;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D8bu7UuPuGi3+Mtj5ET6Y+oDOdwkiu+z/eUHvu/fKew=;
  b=ekC3PzawVT2ref2ye7wEW3tjib/740wTRlFTfHRyH/d1cPKVGq860Xdz
   wDt/QWcAkxUXDgix3Azxk1PYR1H2D5JPIcJ1QximOB7kiu0X3W5qQ3UXA
   cp1N8RnT9/kv51I7nDXr59n9528O8eCcNY9NJoVdKApgNGnBvjkn0AucD
   Qf/0DhNg5XYRbv9Ev8qrdwhD/HveAkv3820o+9Mx+I9FGaUi09uQUPvuy
   AJOuIjtrc9RvXhrDXA6+2bm18y2jOW6v7O0+NkN3TOY3IFf1YmfCsg3tL
   FCmO/LaAf+ox21kHn31a70SVmVpAQMWwKOut63yksINnID0sh+mZQZ53P
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305648986"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="305648986"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 22:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="581379844"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="581379844"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 Oct 2022 22:12:27 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1olkKY-0002CV-12;
        Fri, 21 Oct 2022 05:12:26 +0000
Date:   Fri, 21 Oct 2022 13:12:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 dbdcade2d3f4445eb16149c0555ea1634fc5c41d
Message-ID: <63522a33.sk1cnr0XGwQCdSjb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: dbdcade2d3f4445eb16149c0555ea1634fc5c41d  gpiolib: acpi: Use METHOD_NAME__AEI macro for acpi_walk_resources

elapsed time: 887m

configs tested: 130
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
i386                          randconfig-a001
x86_64                        randconfig-a013
arc                              allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a003
alpha                            allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a015
csky                                defconfig
sh                             shx3_defconfig
m68k                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
openrisc                         alldefconfig
powerpc                       holly_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                        oxnas_v6_defconfig
arc                  randconfig-r043-20221018
s390                 randconfig-r044-20221018
riscv                randconfig-r042-20221018
m68k                       m5475evb_defconfig
xtensa                              defconfig
sparc                            alldefconfig
arm                          badge4_defconfig
m68k                            q40_defconfig
powerpc                     tqm8541_defconfig
arm                           stm32_defconfig
powerpc                      chrp32_defconfig
i386                          randconfig-c001
sh                           se7750_defconfig
sh                           se7343_defconfig
nios2                         10m50_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
um                               alldefconfig
powerpc                  iss476-smp_defconfig
sh                         apsh4a3a_defconfig
m68k                         apollo_defconfig
arc                        vdk_hs38_defconfig
sh                           se7712_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                 randconfig-c004-20221020
x86_64                        randconfig-c001
arm                  randconfig-c002-20221019
mips                           ci20_defconfig
m68k                        mvme147_defconfig
openrisc                            defconfig
mips                       bmips_be_defconfig
sh                ecovec24-romimage_defconfig
arm                      footbridge_defconfig
sh                     magicpanelr2_defconfig
arm                          gemini_defconfig
mips                  maltasmvp_eva_defconfig
arc                  randconfig-r043-20221020
s390                 randconfig-r044-20221020
riscv                randconfig-r042-20221020

clang tested configs:
hexagon              randconfig-r045-20221018
hexagon              randconfig-r041-20221018
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
s390                 randconfig-r044-20221019
hexagon              randconfig-r045-20221019
riscv                randconfig-r042-20221019
hexagon              randconfig-r041-20221019
x86_64                        randconfig-k001
mips                       lemote2f_defconfig
powerpc                    socrates_defconfig
arm                         orion5x_defconfig
powerpc                     tqm8560_defconfig
powerpc                     kmeter1_defconfig
mips                          ath79_defconfig
arm                         shannon_defconfig
mips                     cu1830-neo_defconfig
arm                           omap1_defconfig
mips                      malta_kvm_defconfig
arm                                 defconfig
arm                        magician_defconfig
powerpc                    gamecube_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-c007
mips                 randconfig-c004-20221019
i386                          randconfig-c001
s390                 randconfig-c005-20221019
arm                  randconfig-c002-20221019
riscv                randconfig-c006-20221019
powerpc              randconfig-c003-20221019
arm                          ep93xx_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       mainstone_defconfig
arm                  colibri_pxa300_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
