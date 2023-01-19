Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 149EA672F07
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 03:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjASCdZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 21:33:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjASCdW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 21:33:22 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52EA69B1E
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 18:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674095600; x=1705631600;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tRcsW0PVgqB2yuB4RaaRAvoeEzhjKIQ1XW5oFlpD0EQ=;
  b=JLwi4S6cFBatps78D45q2vT+x8jd+dOXt2xfVQXxrmepdwkW85s/CCRM
   Nf6mp3yNlabl350u9VIQ3vjI9ehwdj8LtnBRYOv1CJ9DCfyKBKX9WsiNP
   gUrGr8/KOV39P8andYwHjV9Vww4HYYNX1J/u2Bu8U06eAKIPx7PG0LnMp
   e8f0VXLjxqaW+EBF5Ls8IvMmt+V6MKqNxX4u8zXcL/IoeeMmh3efJhI4q
   VwQdIaIJd3qDQ2D9oufgG7tk3gM0hH/Q8AJn90adejld5FgdbxtvQaRHV
   UywGoM1n4f8mAQHHLSwiyU6oeI723+t9Mf1i6jQSg+0l+JuNeA7qhexui
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="313047942"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="313047942"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 18:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="660026772"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="660026772"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2023 18:32:26 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIKj3-0000yI-30;
        Thu, 19 Jan 2023 02:32:25 +0000
Date:   Thu, 19 Jan 2023 10:31:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 7e3643bfbb7e753b37e08f61df1c93b2d63cdd36
Message-ID: <63c8ab90.IkH7ejZZpAvrWCca%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 7e3643bfbb7e753b37e08f61df1c93b2d63cdd36  gpio: pcf857x: Drop unneeded explicit casting

elapsed time: 730m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                              defconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
s390                                defconfig
arc                  randconfig-r043-20230118
s390                 randconfig-r044-20230118
riscv                randconfig-r042-20230118
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
s390                             allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-c001
arm                       omap2plus_defconfig
sparc                             allnoconfig
arm                           tegra_defconfig
arm                         assabet_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
um                                  defconfig
xtensa                  cadence_csp_defconfig
arm                           h3600_defconfig
arm                            pleb_defconfig
powerpc                      mgcoge_defconfig
sh                        dreamcast_defconfig
sh                           se7722_defconfig
m68k                            q40_defconfig
mips                     loongson1b_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
sh                                  defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
parisc                           allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig

clang tested configs:
hexagon              randconfig-r045-20230118
hexagon              randconfig-r041-20230118
arm                  randconfig-r046-20230118
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                          rhel-8.3-rust
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                 xes_mpc85xx_defconfig
mips                     cu1830-neo_defconfig
mips                       lemote2f_defconfig
arm                         socfpga_defconfig
arm                         orion5x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
