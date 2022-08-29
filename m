Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C10555A4131
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Aug 2022 05:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiH2DBU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Aug 2022 23:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiH2DBS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Aug 2022 23:01:18 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB06712751
        for <linux-gpio@vger.kernel.org>; Sun, 28 Aug 2022 20:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661742076; x=1693278076;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fn3iLh3tj7ALEYX6r5I6fhrqLlgirm93ermrz3w0THk=;
  b=CII7wcxyS2GgFd47pyIDA4Ue/+A8rM75zBh2kL9jLPpKo6xynOhrkh1Z
   jImRkIgIgU959A/G/sKotFa4z4ioqz97yEuw/EWSJ26bHQdXxXrQmCovd
   9OCDntYsqTYI4AqqDRgVNV0g44SYIgh1Y1F3h+rgNQECK6Wg+72RhbnAh
   DnG5NzwyGj3uV2oC4WXUZAoivWpR7xvRU9yaXSrAQwSlZ6xH+MuJzcesY
   mwRByOG3+I7Wpe5dFoWsAOX/YHJn5x6ehdPRVES1Czl99DibgjNmn4u2H
   HO+NC6CSXPb3IVKCnaPrytYbLNumulGxTHskxCsDTQNCFU2nFBiHaLqmb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="296069308"
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="296069308"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 20:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="672210011"
Received: from lkp-server01.sh.intel.com (HELO b2bbdd52f619) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2022 20:01:13 -0700
Received: from kbuild by b2bbdd52f619 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSV1U-00005r-1z;
        Mon, 29 Aug 2022 03:01:12 +0000
Date:   Mon, 29 Aug 2022 11:00:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 303e6da99429510b1e4edf833afe90ac8542e747
Message-ID: <630c2bcd.4fdT0fS7YXum9mx1%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 303e6da99429510b1e4edf833afe90ac8542e747  gpio: mockup: remove gpio debugfs when remove device

elapsed time: 721m

configs tested: 132
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
loongarch                         allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
nios2                               defconfig
um                           x86_64_defconfig
x86_64                              defconfig
um                             i386_defconfig
s390                             allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                        randconfig-a004
csky                                defconfig
x86_64                           rhel-8.3-kvm
sparc                               defconfig
nios2                            allyesconfig
parisc                           allyesconfig
parisc64                            defconfig
loongarch                           defconfig
parisc                              defconfig
x86_64                        randconfig-a002
i386                        debian-10.3-kunit
x86_64                                  kexec
i386                         debian-10.3-func
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
i386                          debian-10.3-kvm
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a006
x86_64                           allyesconfig
i386                                defconfig
riscv                             allnoconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
i386                          randconfig-a014
x86_64                        randconfig-a015
i386                   debian-10.3-kselftests
arm                              allmodconfig
i386                              debian-10.3
riscv                    nommu_k210_defconfig
arm64                               defconfig
m68k                                defconfig
arc                  randconfig-r043-20220828
ia64                                defconfig
i386                          randconfig-a012
sparc                            allyesconfig
s390                 randconfig-r044-20220828
i386                          randconfig-a016
riscv                            allmodconfig
riscv                randconfig-r042-20220828
powerpc                          allyesconfig
riscv                            allyesconfig
riscv                               defconfig
mips                             allmodconfig
ia64                             allmodconfig
i386                             allyesconfig
arm                              allyesconfig
xtensa                           allyesconfig
arm64                            allyesconfig
arm                           stm32_defconfig
i386                          randconfig-a001
openrisc                 simple_smp_defconfig
i386                          randconfig-a003
arc                          axs103_defconfig
s390                       zfcpdump_defconfig
arc                               allnoconfig
i386                          randconfig-a005
alpha                             allnoconfig
riscv             nommu_k210_sdcard_defconfig
csky                              allnoconfig
arc                              allyesconfig
i386                          randconfig-c001
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
sh                      rts7751r2d1_defconfig
arm                          badge4_defconfig
powerpc                      makalu_defconfig
arm                             pxa_defconfig
m68k                       bvme6000_defconfig
arc                        nsimosci_defconfig
s390                          debug_defconfig
powerpc                     tqm8555_defconfig
arm                          pxa3xx_defconfig
sh                          urquell_defconfig
ia64                             allyesconfig
powerpc                      mgcoge_defconfig
mips                         cobalt_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
sh                           se7780_defconfig
x86_64                           alldefconfig
sh                            titan_defconfig
xtensa                              defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220828
arm                         lubbock_defconfig
loongarch                        alldefconfig
sh                                  defconfig
arm                           corgi_defconfig
um                                  defconfig
powerpc                        cell_defconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220828
x86_64                        randconfig-a016
x86_64                        randconfig-a003
i386                          randconfig-a013
hexagon              randconfig-r045-20220828
x86_64                        randconfig-a012
i386                          randconfig-a011
x86_64                        randconfig-a014
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
mips                        bcm63xx_defconfig
mips                       lemote2f_defconfig
powerpc                     powernv_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
powerpc                    ge_imp3a_defconfig
arm                     davinci_all_defconfig
riscv                    nommu_virt_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
