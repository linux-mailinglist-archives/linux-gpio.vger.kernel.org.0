Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEB11D7E43
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 18:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbgERQVt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 12:21:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:47614 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728142AbgERQVt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 12:21:49 -0400
IronPort-SDR: xzPcpZdxK2vvqoPK2RQEETLzv6LeA3BPGx4qyKCZNvjw4Z1/GdwdB6GWDxcs947mGsOASskpec
 ZlxO0a+QPQ9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 09:21:49 -0700
IronPort-SDR: 4WWVByUTvB7BXpW2dwayG0xDckbPBQhe+8ThjUBkn/FrbJmH2V9pjex/oBsGILCmPSdJCIUrpN
 VLtOkVCGsM7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="299272250"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 May 2020 09:21:48 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jaiWR-0006SV-AG; Tue, 19 May 2020 00:21:47 +0800
Date:   Tue, 19 May 2020 00:21:07 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:fixes] BUILD SUCCESS
 e75dfba311f478f1c2bf928284e1949c20594336
Message-ID: <5ec2b5f3.UCoat5R19/Gw6syV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  fixes
branch HEAD: e75dfba311f478f1c2bf928284e1949c20594336  Merge tag 'gpio-fixes-for-v5.7-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes

elapsed time: 484m

configs tested: 127
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sparc                            allyesconfig
m68k                             allyesconfig
mips                             allyesconfig
powerpc                      tqm8xx_defconfig
arm                       omap2plus_defconfig
sh                         apsh4a3a_defconfig
mips                   sb1250_swarm_defconfig
s390                          debug_defconfig
sh                         ap325rxa_defconfig
c6x                                 defconfig
h8300                    h8300h-sim_defconfig
arm                            u300_defconfig
c6x                        evmc6457_defconfig
arm                           corgi_defconfig
mips                     cu1000-neo_defconfig
mips                           xway_defconfig
arm                          ixp4xx_defconfig
arm                            mps2_defconfig
sh                                  defconfig
mips                          rm200_defconfig
mips                     loongson1c_defconfig
alpha                               defconfig
arm                          imote2_defconfig
mips                     decstation_defconfig
arm                          iop32x_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
mips                           gcw0_defconfig
ia64                        generic_defconfig
powerpc                  storcenter_defconfig
arm                       multi_v4t_defconfig
nds32                               defconfig
arm                          moxart_defconfig
um                               allyesconfig
mips                          rb532_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200518
i386                 randconfig-a005-20200518
i386                 randconfig-a001-20200518
i386                 randconfig-a003-20200518
i386                 randconfig-a004-20200518
i386                 randconfig-a002-20200518
x86_64               randconfig-a016-20200518
x86_64               randconfig-a012-20200518
x86_64               randconfig-a015-20200518
x86_64               randconfig-a013-20200518
x86_64               randconfig-a011-20200518
x86_64               randconfig-a014-20200518
i386                 randconfig-a012-20200518
i386                 randconfig-a014-20200518
i386                 randconfig-a016-20200518
i386                 randconfig-a011-20200518
i386                 randconfig-a015-20200518
i386                 randconfig-a013-20200518
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
