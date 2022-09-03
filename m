Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA015ABEAE
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Sep 2022 13:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbiICLP2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Sep 2022 07:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiICLP1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Sep 2022 07:15:27 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074F7659EB
        for <linux-gpio@vger.kernel.org>; Sat,  3 Sep 2022 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662203726; x=1693739726;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AnOPiPb8K4tcj9lVs7gKY+b4AGClGcXdRY2ZhL5imM4=;
  b=fYMXkVUec37Q53IkPHiv/+/w9QhbutL+JKAsilYn9i11iKaVSfW3GUAH
   V5MzBJD0PtF1c/OfTaMnRm6PphjwdPbdsoZvR/08VOvuU2of2Q0AU2A1R
   T2Iv3Yfsd9mGUrDFTm3SWw0WtA8y6YvBS7uIPz9dxP15AKj5urSTbD5aP
   K2AyN2XYfyG/4LKF5ZgndQ8wZhY4A5knxNnRUU4UVdGKUoxbEV5aWfIus
   hgHI4ar2CEkpZSzMhapIzCRtGIWmVjggzSqWcce/7Eao9uFie89JxO7sd
   uy6PDcL/4fNR9mVB+uNP3SDbi2xrZ4DGMR1hOeBNxvj06dBpog7UoZlyP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="360106461"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="360106461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 04:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="643246243"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Sep 2022 04:15:24 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUR7T-0001Xf-2d;
        Sat, 03 Sep 2022 11:15:23 +0000
Date:   Sat, 03 Sep 2022 19:15:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 1074e1d23a5c201b6558878a09f1d2b7c9506835
Message-ID: <63133739.CrlpAQHRNmlZuy1R%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 1074e1d23a5c201b6558878a09f1d2b7c9506835  pinctrl: pistachio: Switch to use fwnode instead of

elapsed time: 754m

configs tested: 89
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                        randconfig-a002
i386                                defconfig
x86_64                              defconfig
x86_64                        randconfig-a004
x86_64                               rhel-8.3
x86_64                        randconfig-a006
x86_64                           allyesconfig
x86_64                        randconfig-a013
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a001
mips                             allyesconfig
arm                           stm32_defconfig
sh                               allmodconfig
arc                  randconfig-r043-20220901
i386                          randconfig-a003
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
powerpc                      tqm8xx_defconfig
i386                             allyesconfig
m68k                             allmodconfig
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
m68k                       m5249evb_defconfig
x86_64                    rhel-8.3-kselftests
sh                        dreamcast_defconfig
arc                              allyesconfig
arc                  randconfig-r043-20220903
sparc64                          alldefconfig
x86_64                        randconfig-a015
x86_64                           rhel-8.3-syz
i386                          randconfig-a012
sh                                  defconfig
i386                          randconfig-a016
sh                        apsh4ad0a_defconfig
alpha                            allyesconfig
mips                        vocore2_defconfig
m68k                             allyesconfig
xtensa                              defconfig
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig
mips                           jazz_defconfig
arm                           tegra_defconfig
mips                      loongson3_defconfig
um                               alldefconfig
m68k                        m5407c3_defconfig
i386                          randconfig-c001
csky                                defconfig
sparc                               defconfig
x86_64                                  kexec
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc                    adder875_defconfig
powerpc                       ppc64_defconfig
mips                            ar7_defconfig
mips                    maltaup_xpa_defconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a016
riscv                randconfig-r042-20220901
hexagon              randconfig-r045-20220901
x86_64                        randconfig-a012
i386                          randconfig-a004
hexagon              randconfig-r041-20220901
hexagon              randconfig-r045-20220903
arm                         orion5x_defconfig
i386                          randconfig-a006
i386                          randconfig-a011
hexagon              randconfig-r041-20220903
x86_64                        randconfig-a014
s390                 randconfig-r044-20220903
riscv                randconfig-r042-20220903
s390                 randconfig-r044-20220901
arm                        magician_defconfig
arm                    vt8500_v6_v7_defconfig
arm                         bcm2835_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
