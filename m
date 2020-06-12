Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF331F73EC
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 08:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgFLGdR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 02:33:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:48080 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbgFLGdR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 02:33:17 -0400
IronPort-SDR: 53tj94CK4Lb8lVkc2bbCDv88rNYIpTa8NeqDYzUjimMuES1vWdhy+2CyLkSjyTijPesUXP3YcF
 d4ARVlcCIYQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 23:33:16 -0700
IronPort-SDR: wf2uuf36WoomdjyQ3f5QJdlQboZjO8bTYFjOzigXxjcoBpDjDQvUHSu8Gv2JckXogQO2iMlUwy
 4ZTp0QmQ+oXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,502,1583222400"; 
   d="scan'208";a="350443525"
Received: from lkp-server01.sh.intel.com (HELO b6eec31c25be) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Jun 2020 23:33:15 -0700
Received: from kbuild by b6eec31c25be with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jjdFa-0000Zj-Gk; Fri, 12 Jun 2020 06:33:14 +0000
Date:   Fri, 12 Jun 2020 14:32:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 f6d984418ffde19322fd149105200224ac2bc089
Message-ID: <5ee3218b.zXfpOR3OScgsKqWy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: f6d984418ffde19322fd149105200224ac2bc089  gpiolib: split character device into gpiolib-cdev

i386-tinyconfig vmlinux size:

+-------+------------------------------------+----------------------------------------------------------------+
| DELTA |               SYMBOL               |                             COMMIT                             |
+-------+------------------------------------+----------------------------------------------------------------+
|  +507 | TOTAL                              | 8f3d9f354286..f6d984418ffd (ALL COMMITS)                       |
|  +507 | TOTAL                              | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|  +430 | TEXT                               | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|   +72 | DATA                               | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|  +240 | free_irq()                         | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|  +136 | arch/x86/events/zhaoxin/built-in.* | 8f3d9f354286..f6d984418ffd (ALL COMMITS)                       |
|  +136 | arch/x86/events/zhaoxin/built-in.* | 76bbea9a24df MAINTAINERS: Add gpio regmap section              |
|  +136 | arch/x86/events/zhaoxin/built-in.* | f6d984418ffd gpiolib: split character device into gpiolib-cdev |
|  -136 | arch/x86/events/zhaoxin/built-in.* | 74910e15ab25 gpio: pca953x: Drop unneeded ACPI_PTR()           |
|   +72 | copy_clone_args_from_user()        | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|   +64 | noop_backing_dev_info              | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|   -86 | setup_irq()                        | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|  -253 | __free_irq()                       | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
+-------+------------------------------------+----------------------------------------------------------------+

elapsed time: 1105m

configs tested: 92
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
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
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
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
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200612
i386                 randconfig-a002-20200612
i386                 randconfig-a001-20200612
i386                 randconfig-a004-20200612
i386                 randconfig-a005-20200612
i386                 randconfig-a003-20200612
i386                 randconfig-a015-20200611
i386                 randconfig-a011-20200611
i386                 randconfig-a014-20200611
i386                 randconfig-a013-20200611
i386                 randconfig-a016-20200611
i386                 randconfig-a012-20200611
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
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
