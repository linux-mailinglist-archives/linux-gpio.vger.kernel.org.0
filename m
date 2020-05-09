Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C661CC04A
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 12:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgEIKYn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 06:24:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:53707 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726877AbgEIKYn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 9 May 2020 06:24:43 -0400
IronPort-SDR: rE40sPE6jyZs8vQMdgHewoOVCw0fQZIgPKlNL1Oda2e99zevSI6WyvneaRmlUAqJQBZWuWzryc
 Wx8P5vrwZ77w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2020 03:24:42 -0700
IronPort-SDR: WtcaDgUbxxzTtfP8g3cCYcBD+g0Utfc4AmzUG5gkSHixeuTrTPvk3S7fAqfxcxAbtaYfLTMhfe
 7TvoUuLwP5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,371,1583222400"; 
   d="scan'208";a="279287451"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 May 2020 03:24:41 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jXMev-0004GV-39; Sat, 09 May 2020 18:24:41 +0800
Date:   Sat, 09 May 2020 18:23:44 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 7740dda5b465b67df7cbe3c4c2b96c10e874b09f
Message-ID: <5eb684b0.GAvFdPsHUX+/3zA3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: 7740dda5b465b67df7cbe3c4c2b96c10e874b09f  Merge tag 'sh-pfc-for-v5.8-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 699m

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
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
