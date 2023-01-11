Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11EBE6666F3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jan 2023 00:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbjAKXHb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 18:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbjAKXHa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 18:07:30 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F8133D43
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 15:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673478449; x=1705014449;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T6iLA4FmSeaJ4wErfKZ8RtL0d1PKppaOOytrvN3umwQ=;
  b=ZjpjxOn7vUBKhrN5QQvwllREgHx7AmBdFDgyraRKT6WKE/KgsdFYJV8L
   5DDsPdPu3IfDbYRQofgzPToy9IoSpY5MwW4edNw66T2eVrnLcLhbSh1Zn
   5pbGkuFBgYPeiQStSdLwksTKHw8puVnBFGPnyzdw/35pxdZ8v9mtohlCD
   6MsUZmcSmO3HBZGE4g9eLZoZhdwJcQM8MCIv4hIxTpKLqxuvDAuda6A8B
   GE7bNL+l0fI+D2j5G049j/deUx+I9+YNmQf1HI3QgCyEdjLXlBMWFw8fP
   D3wHMrO92MYWmmKkHHSqeEjiXX28QtzcUtvX5laEhdyKUSbHmD1BzqLM4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303255113"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="303255113"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 15:07:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607557005"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="607557005"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Jan 2023 15:07:23 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFkBm-0009b4-1U;
        Wed, 11 Jan 2023 23:07:22 +0000
Date:   Thu, 12 Jan 2023 07:06:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 e3d4a634954c8522a6f76e36b8246a1c5d5f9852
Message-ID: <63bf40f7.Bvk0qiYnG8iodM+M%lkp@intel.com>
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
branch HEAD: e3d4a634954c8522a6f76e36b8246a1c5d5f9852  gpio: pcf857x: Implement get_multiple/set_multiple methods

elapsed time: 728m

configs tested: 83
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                                 defconfig
alpha                               defconfig
ia64                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20230110
s390                 randconfig-r044-20230110
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
riscv                randconfig-r042-20230110
x86_64                        randconfig-a006
powerpc                           allnoconfig
s390                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
sh                               allmodconfig
mips                             allyesconfig
x86_64                        randconfig-a015
powerpc                          allmodconfig
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                       zfcpdump_defconfig
arm                         lubbock_defconfig
powerpc                     redwood_defconfig
sh                          rsk7203_defconfig
sh                            hp6xx_defconfig
sh                           se7724_defconfig
arm                            lart_defconfig
mips                     decstation_defconfig
mips                           ci20_defconfig
powerpc                      pcm030_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
xtensa                         virt_defconfig
arc                        nsim_700_defconfig
nios2                               defconfig
arm                          gemini_defconfig
loongarch                 loongson3_defconfig
mips                         rt305x_defconfig
microblaze                      mmu_defconfig
arm                           tegra_defconfig
parisc                           allyesconfig
powerpc                      pasemi_defconfig
mips                       bmips_be_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
hexagon              randconfig-r041-20230110
x86_64                        randconfig-a001
arm                  randconfig-r046-20230110
x86_64                        randconfig-a003
hexagon              randconfig-r045-20230110
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
