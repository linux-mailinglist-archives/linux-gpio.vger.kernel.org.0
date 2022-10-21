Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B092606F4B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 07:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiJUFQd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 01:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiJUFQd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 01:16:33 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C640116F40E
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 22:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666329391; x=1697865391;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WxUXijgpsmlzQFm8nzMJTUxQaiJYNqfwpLmOHeyjgMY=;
  b=ghse8fyDAWPuTnAPj/LeFGCINuUVUFmH4ZxpQSpL7/OEY0XEtbJ5o1rn
   vwpsKUH3tCoe04LCXcKIlMtwnvZq8grl2xDKVrYTZGGgIuB6zwe0SHXKF
   6nQNAOr2qmwVg8wO7K0ksoKsjjxqinKhepMgfFr81US1Y9/usHxkCO9Aw
   Oam+8dh3wbXXln999L4NU1BKkt6bENycwcI6flaUBplE/PCwK7pnyxosS
   s/bNlCjMqhHsw2nBv9EEGNwqPVAdEUZ3TNlhyZf0c1DfT2jgt+F9AoLKz
   9l2VBLiajJQorSzYAitXWxHoJj+RuIi58QXMgL+nU277kGD0W0k6h/HP5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="306904714"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="306904714"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 22:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="875464856"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="875464856"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 20 Oct 2022 22:16:30 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1olkOT-0002FA-2p;
        Fri, 21 Oct 2022 05:16:29 +0000
Date:   Fri, 21 Oct 2022 13:15:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 7d1aa08aff0621a595c1b42efb493c475eefeeb3
Message-ID: <63522b07.YOP5AjoxykQgiaUl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 7d1aa08aff0621a595c1b42efb493c475eefeeb3  gpio: tegra: Convert to immutable irq chip

elapsed time: 1041m

configs tested: 138
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                          allmodconfig
mips                             allyesconfig
s390                             allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
s390                                defconfig
i386                                defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a002
arm                                 defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a004
arc                  randconfig-r043-20221020
x86_64                        randconfig-a006
s390                 randconfig-r044-20221020
arm                              allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a013
arc                  randconfig-r043-20221018
x86_64                        randconfig-a011
m68k                             allmodconfig
arm64                            allyesconfig
riscv                randconfig-r042-20221020
arc                              allyesconfig
riscv                randconfig-r042-20221018
x86_64                        randconfig-a015
alpha                            allyesconfig
s390                 randconfig-r044-20221018
powerpc                      ppc6xx_defconfig
sh                   rts7751r2dplus_defconfig
m68k                       m5475evb_defconfig
powerpc                   currituck_defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
sh                ecovec24-romimage_defconfig
arm                      footbridge_defconfig
sh                     magicpanelr2_defconfig
arm                          gemini_defconfig
mips                  maltasmvp_eva_defconfig
um                               alldefconfig
powerpc                  iss476-smp_defconfig
sh                         apsh4a3a_defconfig
csky                                defconfig
sh                             shx3_defconfig
i386                          randconfig-c001
openrisc                         alldefconfig
powerpc                       holly_defconfig
m68k                         apollo_defconfig
arc                        vdk_hs38_defconfig
sh                           se7712_defconfig
mips                 randconfig-c004-20221020
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                        oxnas_v6_defconfig
m68k                            q40_defconfig
powerpc                     tqm8541_defconfig
arm                           stm32_defconfig
powerpc                      chrp32_defconfig
xtensa                              defconfig
sparc                            alldefconfig
arm                          badge4_defconfig
sh                           se7750_defconfig
sh                           se7343_defconfig
nios2                         10m50_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20221019
mips                           ci20_defconfig
m68k                        mvme147_defconfig
openrisc                            defconfig
mips                       bmips_be_defconfig

clang tested configs:
x86_64                        randconfig-a001
hexagon              randconfig-r041-20221020
x86_64                        randconfig-a003
hexagon              randconfig-r045-20221020
x86_64                        randconfig-a005
hexagon              randconfig-r041-20221018
hexagon              randconfig-r045-20221018
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
s390                 randconfig-r044-20221019
hexagon              randconfig-r045-20221019
riscv                randconfig-r042-20221019
hexagon              randconfig-r041-20221019
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
powerpc                    gamecube_defconfig
x86_64                        randconfig-c007
mips                 randconfig-c004-20221019
i386                          randconfig-c001
s390                 randconfig-c005-20221019
arm                  randconfig-c002-20221019
riscv                randconfig-c006-20221019
powerpc              randconfig-c003-20221019
mips                          ath79_defconfig
arm                         shannon_defconfig
mips                     cu1830-neo_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                       lemote2f_defconfig
powerpc                    socrates_defconfig
arm                         orion5x_defconfig
powerpc                     tqm8560_defconfig
powerpc                     kmeter1_defconfig
arm                           omap1_defconfig
mips                      malta_kvm_defconfig
arm                                 defconfig
arm                        magician_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
arm                       mainstone_defconfig
arm                  colibri_pxa300_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
