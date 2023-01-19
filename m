Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C065672FC7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 04:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjASDw6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 22:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbjASDtP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 22:49:15 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8FDC4B773
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 19:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674100075; x=1705636075;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/3KvuDi4rKfzrtAEGKTWojHq+u7EvxemLPH16K5nGMI=;
  b=GkRonjM0jI5Zh8rlxpds2pFmG7FV81AJOV0mx5JvGGbUeOWWs/A8hmTL
   k9nr6Cvle5sXCB899JibH0UKUvxJl0DMqHfv32dzRwY4/FK069uEOJ02G
   P27NOXXqWkMkwFNhm0ckVR4W66BVnOkhWmn8j/Tl/DC0+KaUPmGtU81mP
   NkzF9eLjdH8cYX8QdpeCztaxVCgAqnXXefAQ6/VuWOmv26aylaN0c8sLd
   QssqALCU8GBVLNxA9YHrlwMwcKdZunobnEQOvk0HKR354kQfi6sp3NcQP
   i9BIRzjrv4Pa23kLtfPJJ+1uGqq8SCzeCK8biHnnOXrBUVdNjt7S1pL3X
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305558342"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="305558342"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 19:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661980288"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661980288"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 19:43:30 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pILpq-00012w-0D;
        Thu, 19 Jan 2023 03:43:30 +0000
Date:   Thu, 19 Jan 2023 11:42:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 4cb786180dfb5258ff3111181b5e4ecb1d4a297b
Message-ID: <63c8bc27.ND51OIUgYZRCLAiI%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 4cb786180dfb5258ff3111181b5e4ecb1d4a297b  gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xRU

elapsed time: 728m

configs tested: 84
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
s390                             allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig
m68k                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
ia64                             allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
powerpc                          allmodconfig
mips                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm                       omap2plus_defconfig
sparc                             allnoconfig
arm                           tegra_defconfig
arm                         assabet_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
arc                  randconfig-r043-20230118
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
powerpc                      mgcoge_defconfig
sh                        dreamcast_defconfig
sh                           se7722_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
m68k                            q40_defconfig
mips                     loongson1b_defconfig
i386                          randconfig-c001
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
sh                                  defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
parisc                           allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
microblaze                          defconfig
nios2                         10m50_defconfig
arm                               allnoconfig
sh                           se7705_defconfig
arc                      axs103_smp_defconfig

clang tested configs:
x86_64                          rhel-8.3-rust
powerpc                 xes_mpc85xx_defconfig
mips                     cu1830-neo_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
mips                       lemote2f_defconfig
arm                         socfpga_defconfig
arm                         orion5x_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
arm                        spear3xx_defconfig
arm                        neponset_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
