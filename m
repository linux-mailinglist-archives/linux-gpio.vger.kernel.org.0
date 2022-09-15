Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB0AD5BA1FF
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 22:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbiIOUus (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 16:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiIOUur (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 16:50:47 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3742481E8
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 13:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663275046; x=1694811046;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cEgtD3kCI534wDcoN77XOOa59BTexETKLMSoJ5N849Y=;
  b=IA4I3gDtZfpQFQY/m5Dbe8s8U7ETwrlNuMmJg/+bjKp45koU/3Yj3eTL
   LCuX48Rs8HYXPfmQaOsbyfyrDqH5FllOYu5EKqXTh+uistZXLa/M+px7G
   MX4V5/Hz1Xdy2ifllzp9PdpIBSRImkVKCTfGzZs9zbRguSdd8aEXnUxy7
   nqW7JQ0TlsdNV2YPjp1kSDHbb/4SEU0Zq6gpuu+5wHC/FfrUiXILROHBt
   cbWujEbMfQx5DdDbYHNPS3ynu3cIhw/nPaDLQ+bxdPTPSGKaS5uFEXASn
   kQ6c/CWiWm2QTt3fAks7CmBYdtYPHIm/qHXct5B2fa4fIs53vW1QfZH1P
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="278563797"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="278563797"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 13:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="706509000"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2022 13:50:45 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYvoq-0000zj-2O;
        Thu, 15 Sep 2022 20:50:44 +0000
Date:   Fri, 16 Sep 2022 04:49:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 d9e7f0e320516c660d6f33e6c16a3d99970eb14e
Message-ID: <63238ff5.I0ZXfrnyV2pdgrrk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: d9e7f0e320516c660d6f33e6c16a3d99970eb14e  gpiolib: of: factor out conversion from OF flags

elapsed time: 724m

configs tested: 110
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
ia64                             allmodconfig
s390                 randconfig-r044-20220915
arc                  randconfig-r043-20220915
riscv                randconfig-r042-20220915
arc                           tb10x_defconfig
sh                          kfr2r09_defconfig
xtensa                    xip_kc705_defconfig
powerpc                    klondike_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
mips                     decstation_defconfig
m68k                        m5272c3_defconfig
m68k                       m5275evb_defconfig
powerpc                     asp8347_defconfig
i386                          randconfig-c001
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                        warp_defconfig
xtensa                           alldefconfig
powerpc                      mgcoge_defconfig
m68k                        m5307c3_defconfig
arm                           viper_defconfig
sh                         ap325rxa_defconfig
arc                          axs103_defconfig
mips                            gpr_defconfig
sh                             sh03_defconfig
powerpc                         wii_defconfig
openrisc                       virt_defconfig
powerpc                      ep88xc_defconfig
sparc                       sparc32_defconfig
powerpc                      arches_defconfig
sh                          rsk7203_defconfig
arm                         vf610m4_defconfig
powerpc                        cell_defconfig
nios2                               defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
loongarch                           defconfig
loongarch                         allnoconfig

clang tested configs:
s390                 randconfig-r044-20220914
hexagon              randconfig-r045-20220914
riscv                randconfig-r042-20220914
hexagon              randconfig-r041-20220914
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220915
hexagon              randconfig-r041-20220915
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
powerpc                      acadia_defconfig
x86_64                        randconfig-k001
powerpc                     kmeter1_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
