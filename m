Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BF5216417
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 04:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgGGCiV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 22:38:21 -0400
Received: from mga11.intel.com ([192.55.52.93]:33422 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727827AbgGGCiV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 6 Jul 2020 22:38:21 -0400
IronPort-SDR: 8n2BWmSbZ0rTcpM5OnLQ3YWfqEuVy0VehKyU04wS7WxHOyN0lJfek43aYk3LNPffKtTivuWZ5m
 WqQXgsHRt9Bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="145630048"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; 
   d="scan'208";a="145630048"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2020 19:38:21 -0700
IronPort-SDR: Fi3RWFRYpP4Bw+UpBNy9GZEs8AMvZbvUbaEA36t7o6hoPPyZNr7hCvEp/QfwHGtZNJQRbUK07P
 1scDQmoDk9Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; 
   d="scan'208";a="279461350"
Received: from lkp-server01.sh.intel.com (HELO f2047cb89c8e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Jul 2020 19:38:19 -0700
Received: from kbuild by f2047cb89c8e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jsdUw-000023-ML; Tue, 07 Jul 2020 02:38:18 +0000
Date:   Tue, 07 Jul 2020 10:37:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 614038d628c02ad6f2439bdf9baa6acceb8ec772
Message-ID: <5f03dff0.vEQyfBa03jfe7tyQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: 614038d628c02ad6f2439bdf9baa6acceb8ec772  pinctrl: imx8dxl: Support building as module

elapsed time: 725m

configs tested: 136
configs skipped: 9

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
sh                                  defconfig
arm                      tct_hammer_defconfig
powerpc64                           defconfig
sh                        dreamcast_defconfig
arm                         orion5x_defconfig
mips                           ip22_defconfig
arc                      axs103_smp_defconfig
mips                          rm200_defconfig
alpha                               defconfig
riscv                    nommu_k210_defconfig
mips                           jazz_defconfig
sh                          r7785rp_defconfig
openrisc                         allyesconfig
sparc                            alldefconfig
mips                  mips_paravirt_defconfig
sh                     sh7710voipgw_defconfig
nios2                            alldefconfig
m68k                            q40_defconfig
mips                      malta_kvm_defconfig
sh                        edosk7760_defconfig
arm                            zeus_defconfig
sh                           se7206_defconfig
arm                         s3c6400_defconfig
arm                            dove_defconfig
s390                          debug_defconfig
c6x                        evmc6457_defconfig
arm                          gemini_defconfig
arm                         bcm2835_defconfig
mips                          ath79_defconfig
mips                 decstation_r4k_defconfig
mips                         rt305x_defconfig
nios2                         3c120_defconfig
arm                            hisi_defconfig
mips                            gpr_defconfig
arm                          pxa168_defconfig
sparc64                          allyesconfig
arm                          moxart_defconfig
parisc                              defconfig
arm                           spitz_defconfig
arm                            mps2_defconfig
m68k                          multi_defconfig
arm                     davinci_all_defconfig
arm                     eseries_pxa_defconfig
arm                              zx_defconfig
parisc                generic-32bit_defconfig
xtensa                  audio_kc705_defconfig
mips                        bcm47xx_defconfig
sh                          rsk7269_defconfig
m68k                        m5307c3_defconfig
mips                         bigsur_defconfig
arm                       versatile_defconfig
m68k                        stmark2_defconfig
sh                           se7705_defconfig
xtensa                          iss_defconfig
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
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
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
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200706
i386                 randconfig-a002-20200706
i386                 randconfig-a006-20200706
i386                 randconfig-a004-20200706
i386                 randconfig-a005-20200706
i386                 randconfig-a003-20200706
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
