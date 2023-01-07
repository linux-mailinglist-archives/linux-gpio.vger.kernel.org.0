Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A778660B7E
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Jan 2023 02:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjAGB2W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Jan 2023 20:28:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbjAGB2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jan 2023 20:28:21 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E32A848D6
        for <linux-gpio@vger.kernel.org>; Fri,  6 Jan 2023 17:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673054900; x=1704590900;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vXdx5lHxGnZc6xFhmIRwAWOjJM3e0FVLNUxe6EubqPQ=;
  b=MqXsQ6BfVT113vgKvQlTT3wUgMQdXm80Jkmcq4pjeWBHYwH89/6C8Lrv
   fD8cVW1/A6Vn/QR6xRyVxq9fjYyuFSQ0Y/VQUJn4xgjYIL1OnBAAd1Skn
   quNHZ85TBIuim8hy0Cl/KDT63csFCVaqsNhf3z0/7VdNGpox7XL0AcW+S
   FC+nMDiD9X3f1GrQB+HZt8FdK98hmLTtlANk6McjT1sJhee/6aKTdkEla
   Nm9TNcfJNz5VDtj6bW6UfRPsSl7l7bziqdlonP/8Hkr4OCppsYrhzIOo1
   9+K2iBES3tvDLEwkuAqf0fQ6aA/nUR94DWd3IhP+PGoxLm2YqNozlN1W8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="384902819"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="384902819"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 17:28:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="656112480"
X-IronPort-AV: E=Sophos;i="5.96,307,1665471600"; 
   d="scan'208";a="656112480"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 06 Jan 2023 17:28:18 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pDy0P-00044U-20;
        Sat, 07 Jan 2023 01:28:17 +0000
Date:   Sat, 07 Jan 2023 09:28:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 f9beb1b2a13907fca8c9180b7c7aa505e0ba2ef8
Message-ID: <63b8caa4.DQnhOK4Kwxc9fD3F%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: f9beb1b2a13907fca8c9180b7c7aa505e0ba2ef8  gpio: regmap: use new regmap_might_sleep()

elapsed time: 727m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
alpha                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
sh                               allmodconfig
i386                          randconfig-a016
arm                                 defconfig
mips                             allyesconfig
arc                  randconfig-r043-20230106
x86_64                        randconfig-a004
i386                                defconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
x86_64                        randconfig-a002
i386                          randconfig-a003
x86_64                          rhel-8.3-func
arm64                            allyesconfig
arm                  randconfig-r046-20230106
x86_64                        randconfig-a006
arm                              allyesconfig
x86_64                           rhel-8.3-bpf
i386                          randconfig-a005
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
sh                ecovec24-romimage_defconfig
sh                        dreamcast_defconfig
sh                           se7619_defconfig
mips                            gpr_defconfig
i386                             allyesconfig
sh                                  defconfig
x86_64                           alldefconfig
mips                         rt305x_defconfig
sh                         apsh4a3a_defconfig
sh                          sdk7786_defconfig
arc                    vdk_hs38_smp_defconfig
sparc                            alldefconfig
arc                      axs103_smp_defconfig
arm                            lart_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
powerpc                      ppc6xx_defconfig
mips                         cobalt_defconfig
sparc64                             defconfig
powerpc                       ppc64_defconfig
sh                            titan_defconfig
ia64                             alldefconfig
powerpc                     mpc83xx_defconfig
powerpc                      ppc40x_defconfig
arc                              alldefconfig
mips                           ci20_defconfig
m68k                        mvme147_defconfig
i386                          randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                               defconfig
sh                           sh2007_defconfig
riscv                            allyesconfig
arc                     nsimosci_hs_defconfig
ia64                        generic_defconfig
nios2                            allyesconfig
powerpc                   currituck_defconfig
powerpc                      pasemi_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                           imxrt_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                          gemini_defconfig
powerpc                 linkstation_defconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230106
s390                 randconfig-r044-20230106
riscv                randconfig-r042-20230106
x86_64                        randconfig-a005
x86_64                        randconfig-a001
hexagon              randconfig-r045-20230106
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                   bluestone_defconfig
mips                       rbtx49xx_defconfig
arm                              alldefconfig
hexagon                             defconfig
arm                       cns3420vb_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                          g5_defconfig
arm                          ixp4xx_defconfig
x86_64                        randconfig-k001
arm                          moxart_defconfig
arm                        neponset_defconfig
x86_64                           allyesconfig
hexagon              randconfig-r041-20230107
hexagon              randconfig-r045-20230107
arm                  randconfig-r046-20230107
arm                       aspeed_g4_defconfig
powerpc                     mpc5200_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
