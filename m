Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE5E1CBF1D
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 10:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgEIIg4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 04:36:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:46681 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726214AbgEIIgz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 9 May 2020 04:36:55 -0400
IronPort-SDR: bvrb/eXRdb2Yx1+MhYlIL/hTxMWKy7yvs6cKv1Tw8CBN3yLB25GxScHmFe1hAfPsoWg8J1SI0P
 qGJt1OuPzOCQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2020 01:36:55 -0700
IronPort-SDR: GLzvVSWeGGXJml7k5nf7883W2uZyrhOQQkypFIniLBFORNOd6U7KBTQJEoZTHrrYr0i4eArAXn
 AFFtrZZF+M1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,371,1583222400"; 
   d="scan'208";a="250683091"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 May 2020 01:36:52 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jXKyb-0002C0-39; Sat, 09 May 2020 16:36:53 +0800
Date:   Sat, 09 May 2020 16:36:20 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 29f9f8e1fc93d7fd78d16c9b09fbc2b5c41d6959
Message-ID: <5eb66b84.A8d2cgApiEWmkFUR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 29f9f8e1fc93d7fd78d16c9b09fbc2b5c41d6959  Merge tag 'gpio-updates-for-v5.8-part1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel

elapsed time: 592m

configs tested: 86
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
riscv                               defconfig
i386                                defconfig
nds32                               defconfig
sparc64                             defconfig
parisc                              defconfig
csky                                defconfig
nios2                               defconfig
m68k                             allyesconfig
m68k                                defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                             allnoconfig
csky                             allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                       allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20200509
i386                 randconfig-a004-20200509
i386                 randconfig-a003-20200509
i386                 randconfig-a002-20200509
i386                 randconfig-a001-20200509
i386                 randconfig-a006-20200509
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
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
