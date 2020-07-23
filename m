Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E170222A727
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 08:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgGWGDH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 02:03:07 -0400
Received: from mga14.intel.com ([192.55.52.115]:58310 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgGWGDG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 02:03:06 -0400
IronPort-SDR: I7IcR9HNM5P/nN11dvikScDHxpLB9TRr5NOm4Cl/WjugsAlvFDTQ6W6Y4oF6ZpmMwDKMmFLjck
 4OotZVfy7jhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="149645760"
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="149645760"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 23:03:05 -0700
IronPort-SDR: D2OquMUQ1VbKPyLwFX8kCEu/D5Ms89cHPD6ghTySwS/T/sh6Hz+jd6HSFZw+aEexORizdtOuWk
 z0tA27Ftt6fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="302194525"
Received: from lkp-server01.sh.intel.com (HELO 7a9a14fb1d52) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Jul 2020 23:03:03 -0700
Received: from kbuild by 7a9a14fb1d52 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jyUJq-0000Do-JE; Thu, 23 Jul 2020 06:03:02 +0000
Date:   Thu, 23 Jul 2020 14:02:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS WITH WARNING
 66c00f561d94f8b5eae8c0e1aa8e4cfad9cf64f9
Message-ID: <5f1927e8.R3SaNlwulabYN8H5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: 66c00f561d94f8b5eae8c0e1aa8e4cfad9cf64f9  dt-bindings: ingenic,pinctrl: Support pinmux/pinconf nodes

Warning in current branch:

drivers/pinctrl/pinctrl-ocelot.c:734:29: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]

Warning ids grouped by kconfigs:

recent_errors
|-- i386-allmodconfig
|   `-- drivers-pinctrl-pinctrl-ocelot.c:warning:Clarify-calculation-precedence-for-and-.-clarifyCalculation
`-- x86_64-allyesconfig
    `-- drivers-pinctrl-pinctrl-ocelot.c:warning:Clarify-calculation-precedence-for-and-.-clarifyCalculation

elapsed time: 2362m

configs tested: 101
configs skipped: 2

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sh                          rsk7264_defconfig
c6x                                 defconfig
c6x                        evmc6474_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
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
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
mips                             allyesconfig
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
i386                 randconfig-a001-20200719
i386                 randconfig-a006-20200719
i386                 randconfig-a002-20200719
i386                 randconfig-a005-20200719
i386                 randconfig-a003-20200719
i386                 randconfig-a004-20200719
x86_64               randconfig-a014-20200720
x86_64               randconfig-a015-20200720
x86_64               randconfig-a016-20200720
x86_64               randconfig-a012-20200720
x86_64               randconfig-a013-20200720
x86_64               randconfig-a011-20200720
i386                 randconfig-a015-20200719
i386                 randconfig-a011-20200719
i386                 randconfig-a016-20200719
i386                 randconfig-a012-20200719
i386                 randconfig-a013-20200719
i386                 randconfig-a014-20200719
x86_64               randconfig-a005-20200719
x86_64               randconfig-a002-20200719
x86_64               randconfig-a006-20200719
x86_64               randconfig-a001-20200719
x86_64               randconfig-a003-20200719
x86_64               randconfig-a004-20200719
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
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
