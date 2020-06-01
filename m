Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4061E9DC6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 07:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgFAF7p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 01:59:45 -0400
Received: from mga09.intel.com ([134.134.136.24]:15546 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbgFAF7p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Jun 2020 01:59:45 -0400
IronPort-SDR: Xz/zYGcjsIcSLjnYkJt1LlrFufpwr22Q9yatXK/Nu4ruZQQZV/p4FX/0xwtPZzcDTO2WDyWOYB
 vtjkQFAW5Itw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2020 22:59:44 -0700
IronPort-SDR: evXrIUKxEzQ5Te6wiBgQwF8n6+rF58g36CeI+lMReX4iA0qICDJur8wUJrv/jh6EHdMXOHMms8
 HtNFGm01Tgvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; 
   d="scan'208";a="346928270"
Received: from lkp-server01.sh.intel.com (HELO 49d03d9b0ee7) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2020 22:59:43 -0700
Received: from kbuild by 49d03d9b0ee7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jfdU6-0000Zm-H7; Mon, 01 Jun 2020 05:59:42 +0000
Date:   Mon, 01 Jun 2020 13:59:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 a8173820f441ab3e2a45c4bb66b70da9a57a349e
Message-ID: <5ed4993b.AFo3fQEJOE2YGc3T%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: a8173820f441ab3e2a45c4bb66b70da9a57a349e  gpio: gpiolib: Allow GPIO IRQs to lazy disable

i386-tinyconfig vmlinux size:

+-------+-----------------------------+----------------------------------------------+
| DELTA |           SYMBOL            |                    COMMIT                    |
+-------+-----------------------------+----------------------------------------------+
|  +508 | TOTAL                       | 8f3d9f354286..a8173820f441 (ALL COMMITS)     |
|  +507 | TOTAL                       | ce1d966a3022 Merge tag 'v5.7-rc7' into devel |
|  +430 | TEXT                        | ce1d966a3022 Merge tag 'v5.7-rc7' into devel |
|   +72 | DATA                        | ce1d966a3022 Merge tag 'v5.7-rc7' into devel |
|  +240 | free_irq()                  | ce1d966a3022 Merge tag 'v5.7-rc7' into devel |
|   +72 | copy_clone_args_from_user() | ce1d966a3022 Merge tag 'v5.7-rc7' into devel |
|   +64 | noop_backing_dev_info       | ce1d966a3022 Merge tag 'v5.7-rc7' into devel |
|   -86 | setup_irq()                 | ce1d966a3022 Merge tag 'v5.7-rc7' into devel |
|  -253 | __free_irq()                | ce1d966a3022 Merge tag 'v5.7-rc7' into devel |
+-------+-----------------------------+----------------------------------------------+

elapsed time: 4797m

configs tested: 85
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
i386                 randconfig-a013-20200531
i386                 randconfig-a012-20200531
i386                 randconfig-a015-20200531
i386                 randconfig-a011-20200531
i386                 randconfig-a016-20200531
i386                 randconfig-a014-20200531
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
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
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
