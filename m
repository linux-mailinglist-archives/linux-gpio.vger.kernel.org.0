Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0B9B60CA34
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 12:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbiJYKhP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Oct 2022 06:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbiJYKhN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2022 06:37:13 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8EFA4B90
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2022 03:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666694231; x=1698230231;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aZAqewCHTw2HNaPtziPFkWNgPY7+W7a851cfRpyLFC0=;
  b=i8cLmx7qGYGm73DP45WWLWHsCEcnzQJvDAmyj3b2ZnhVPb4tUrPJuZs5
   BdmOiDSJ86bRGdiTPMTWPP9FNwLeaI42quhnO9qdcIjRwq5Rs4Nv7fPWL
   EKAJ31SAi74QvGfDWHfcEfls4H7oWawx3gg0/lxgOdnQqomORnwMdUGAb
   AMmvt3OQLpBZaZNPUlEYhmBDEvlQbvt3hLKhbW7wU/6AXXpUzuKvf8viR
   1Jf8yNIhPpZIMmJoIZ8Du/NC/xreAeD2fVHs4C3Ej+nNrjs5JI2sxVB3A
   L0Ca0AYv/pyjwMepBvLL6qpOjRKyeOUHVYmpZ0Jjria4+40FcF5sioKWp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="369709854"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="369709854"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 03:37:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609527941"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="609527941"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Oct 2022 03:37:08 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onHIx-0006BQ-2b;
        Tue, 25 Oct 2022 10:37:07 +0000
Date:   Tue, 25 Oct 2022 18:36:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 dbbd909eeb26037fc38a4d29d6d94f7c39631a5e
Message-ID: <6357bc33.DsKLUpnv7s5nAUZH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: dbbd909eeb26037fc38a4d29d6d94f7c39631a5e  pinctrl: qcom: sdm670: change sdm670_reserved_gpios to static

elapsed time: 726m

configs tested: 92
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                                 defconfig
alpha                               defconfig
i386                                defconfig
ia64                             allmodconfig
i386                 randconfig-a011-20221024
x86_64                              defconfig
s390                                defconfig
i386                 randconfig-a013-20221024
s390                             allmodconfig
i386                 randconfig-a012-20221024
i386                 randconfig-a016-20221024
i386                 randconfig-a015-20221024
x86_64                               rhel-8.3
i386                 randconfig-a014-20221024
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
s390                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                  randconfig-r043-20221024
riscv                randconfig-r042-20221024
arc                  randconfig-r043-20221023
s390                 randconfig-r044-20221024
mips                     decstation_defconfig
arm                           h5000_defconfig
arm                       multi_v4t_defconfig
sh                           se7712_defconfig
arm                        mini2440_defconfig
powerpc                      chrp32_defconfig
sh                          lboxre2_defconfig
x86_64               randconfig-a014-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
m68k                           sun3_defconfig
sh                        dreamcast_defconfig
sh                          urquell_defconfig
x86_64               randconfig-k001-20221024
arc                  randconfig-r043-20221025
sparc                               defconfig
arm                      footbridge_defconfig
sh                          landisk_defconfig
riscv                    nommu_k210_defconfig
openrisc                            defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
powerpc                   motionpro_defconfig
csky                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
x86_64               randconfig-a001-20221024
x86_64               randconfig-a005-20221024
i386                 randconfig-a001-20221024
x86_64               randconfig-a003-20221024
i386                 randconfig-a002-20221024
x86_64               randconfig-a004-20221024
i386                 randconfig-a005-20221024
x86_64               randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a004-20221024
x86_64               randconfig-a006-20221024
hexagon              randconfig-r045-20221023
hexagon              randconfig-r041-20221024
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221024
i386                 randconfig-a006-20221024
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
