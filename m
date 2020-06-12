Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC50B1F7313
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 06:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgFLEhu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 00:37:50 -0400
Received: from mga09.intel.com ([134.134.136.24]:25632 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgFLEhm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 00:37:42 -0400
IronPort-SDR: HNV8xQJMGVR9LQtOXHTjVLL4HZmyeTMvYsvCw00ZPKRNEPqtuvdhk5WbydkF/fLLZt0mFCkULz
 LjTiPPsPZp2A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 21:37:41 -0700
IronPort-SDR: kjTO55DxKhZBifiJQrrzoU0eQeLphXk9ipSQdMjP4WzJFl6eKLvi7X/lI76HrODSyhE0LpHRpK
 GYfjg3kW7ALg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; 
   d="scan'208";a="289768763"
Received: from lkp-server01.sh.intel.com (HELO b6eec31c25be) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Jun 2020 21:37:39 -0700
Received: from kbuild by b6eec31c25be with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jjbRi-0000VA-UD; Fri, 12 Jun 2020 04:37:38 +0000
Date:   Fri, 12 Jun 2020 12:36:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-charger-mentioned] BUILD SUCCESS
 f9e5824140b913437cc820c3f8bb33353ee4961d
Message-ID: <5ee30660.jqJ/TBq3HiroFni5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-charger-mentioned
branch HEAD: f9e5824140b913437cc820c3f8bb33353ee4961d  gpio: Add gpio-charger to the documentation

Warning in current branch:

drivers/gpio/gpiolib-cdev.c:1127:5: warning: no previous prototype for 'gpiolib_cdev_register' [-Wmissing-prototypes]
drivers/gpio/gpiolib-cdev.c:1145:6: warning: no previous prototype for 'gpiolib_cdev_unregister' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-randconfig-r015-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- arc-allyesconfig
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-allmodconfig
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-allyesconfig
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-debian-10.3
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a001-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a002-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a003-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a004-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a005-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a006-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a011-20200611
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a012-20200611
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a013-20200611
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a014-20200611
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a015-20200611
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-a016-20200611
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- i386-randconfig-m021-20200611
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- mips-allmodconfig
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- mips-allyesconfig
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- nios2-randconfig-r011-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- nios2-randconfig-r014-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- parisc-randconfig-r005-20200611
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- s390-allmodconfig
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- s390-allyesconfig
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- sh-randconfig-r013-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
|-- sparc64-randconfig-r012-20200612
|   |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
|   `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister
`-- x86_64-allyesconfig
    |-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_register
    `-- drivers-gpio-gpiolib-cdev.c:warning:no-previous-prototype-for-gpiolib_cdev_unregister


i386-tinyconfig vmlinux size:

+-------+------------------------------------+----------------------------------------------------------------+
| DELTA |               SYMBOL               |                             COMMIT                             |
+-------+------------------------------------+----------------------------------------------------------------+
|  +507 | TOTAL                              | 8f3d9f354286..f9e5824140b9 (ALL COMMITS)                       |
|  +507 | TOTAL                              | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|  +430 | TEXT                               | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|   +72 | DATA                               | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|  +240 | free_irq()                         | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|  +136 | arch/x86/events/zhaoxin/built-in.* | 76bbea9a24df MAINTAINERS: Add gpio regmap section              |
|  +136 | arch/x86/events/zhaoxin/built-in.* | f6d984418ffd gpiolib: split character device into gpiolib-cdev |
|  -136 | arch/x86/events/zhaoxin/built-in.* | 74910e15ab25 gpio: pca953x: Drop unneeded ACPI_PTR()           |
|  -136 | arch/x86/events/zhaoxin/built-in.* | f9e5824140b9 gpio: Add gpio-charger to the documentation       |
|   +72 | copy_clone_args_from_user()        | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|   +64 | noop_backing_dev_info              | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|   -86 | setup_irq()                        | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
|  -253 | __free_irq()                       | ce1d966a3022 Merge tag 'v5.7-rc7' into devel                   |
+-------+------------------------------------+----------------------------------------------------------------+

elapsed time: 989m

configs tested: 92
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
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
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
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
microblaze                        allnoconfig
sh                               allmodconfig
sh                                allnoconfig
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
