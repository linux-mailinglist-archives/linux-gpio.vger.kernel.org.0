Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCC267F8F2
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jan 2023 16:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbjA1PCl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Jan 2023 10:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbjA1PCl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Jan 2023 10:02:41 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB4128D3F
        for <linux-gpio@vger.kernel.org>; Sat, 28 Jan 2023 07:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674918158; x=1706454158;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RjmkWA9HGfH+CEta8pgp5rWNA02IXmHkGvZgD7AOpHQ=;
  b=WPy3xtVPASuqldjTLr20yTmbk6wi7F3oW4gtGrf3sNa/CY6yU31SSB77
   EPI6jcr0N2kDMeupDp+TgPSX20jmLrRfWgmymXc7otEd9GtaIfIGGGjVJ
   +RYx1MeCEaobcb8oi7ibwAxmzv33UyqSeeLk/BxHc9oYBXTAFEylsUgZC
   GEnDTrRa6YZfuY30cE0LDUgWEf48qPU9vxMsohVq09hTBkIHRX9luazK8
   vef7EUTg5UWLMfXNWwQzQmv1AfU02SeRHkL415HrLz2I+uU8+Hr1zqkVy
   MtAUNgzWdgFB2fSTwWeW5ycweY7cNylaQwT6Lm8VrUWNSXjXR1y0L9Ifi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="310918153"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="310918153"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 07:02:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="806158016"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="806158016"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2023 07:02:36 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLmix-0000p1-38;
        Sat, 28 Jan 2023 15:02:35 +0000
Date:   Sat, 28 Jan 2023 23:01:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 677d85e1a1ee69fa05ccea83847309484be3781c
Message-ID: <63d538de.IFalTEA63GwtvjoI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 677d85e1a1ee69fa05ccea83847309484be3781c  tools: gpio: fix -c option of gpio-event-mon

elapsed time: 775m

configs tested: 94
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a002-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a006-20230123
x86_64               randconfig-a003-20230123
x86_64               randconfig-a004-20230123
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a004-20230123
i386                 randconfig-a006-20230123
i386                 randconfig-a005-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a003-20230123
i386                 randconfig-a001-20230123
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
ia64                             allmodconfig
i386                 randconfig-c001-20230123
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          randconfig-c001
m68k                         amcore_defconfig
powerpc                      makalu_defconfig
m68k                        mvme147_defconfig
m68k                          amiga_defconfig
mips                          rb532_defconfig
arc                        nsim_700_defconfig
sh                           se7724_defconfig
sh                            shmin_defconfig
sh                        sh7763rdp_defconfig
sh                          rsk7264_defconfig
arm                          exynos_defconfig
xtensa                  nommu_kc705_defconfig
arc                      axs103_smp_defconfig
xtensa                    smp_lx200_defconfig
s390                          debug_defconfig

clang tested configs:
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a014-20230123
riscv                randconfig-r042-20230123
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a015-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
powerpc                      walnut_defconfig
arm                        mvebu_v5_defconfig
arm                           sama7_defconfig
powerpc                 mpc832x_mds_defconfig
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230124
hexagon              randconfig-r045-20230124
arm                  randconfig-r046-20230124
x86_64               randconfig-k001-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
