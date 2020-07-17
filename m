Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83422232B2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 07:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgGQFBX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 01:01:23 -0400
Received: from mga11.intel.com ([192.55.52.93]:40877 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725300AbgGQFBX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 01:01:23 -0400
IronPort-SDR: mVgK3evILNcNmgKLnJd1NjOYDJXJzb8k06SMAhFKnKiGP0leRbGhWkXmRIx6wMzBl+vpp+S/Na
 64mm5hHCtSBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="147526102"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
   d="scan'208";a="147526102"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 22:01:22 -0700
IronPort-SDR: T64T22Q2CiNrTUWjHOJ8fEATf7k7F5IGmzitzXBiqtRhNweI/mBgEgeyGLIe41Vvg7m4lEQKEu
 5gaCPlVfGkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
   d="scan'208";a="361246604"
Received: from lkp-server02.sh.intel.com (HELO 50058c6ee6fc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Jul 2020 22:01:21 -0700
Received: from kbuild by 50058c6ee6fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jwIUq-00005v-R6; Fri, 17 Jul 2020 05:01:20 +0000
Date:   Fri, 17 Jul 2020 13:00:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD REGRESSION
 d9ce0e9fdfd37d45f669b831d0c084a7c9338ee8
Message-ID: <5f113058.GhAVgHG5o1sGkmMN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: d9ce0e9fdfd37d45f669b831d0c084a7c9338ee8  pinctrl: mediatek: add mt6779 eint support

Error/Warning in current branch:

drivers/pinctrl/mediatek/pinctrl-mt6779.c:775:1: error: type defaults to 'int' in declaration of 'arch_initcall' [-Werror=implicit-int]
drivers/pinctrl/mediatek/pinctrl-mt6779.c:775:1: warning: data definition has no type or storage class
drivers/pinctrl/mediatek/pinctrl-mt6779.c:775:1: warning: parameter names (without types) in function declaration
drivers/pinctrl/mediatek/pinctrl-mt6779.c:783:1: error: type defaults to 'int' in declaration of 'arch_initcall' [-Werror=implicit-int]
drivers/pinctrl/mediatek/pinctrl-mt6779.c:783:1: warning: data definition has no type or storage class
drivers/pinctrl/mediatek/pinctrl-mt6779.c:783:1: warning: parameter names (without types) in function declaration

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
|-- arm64-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
|-- ia64-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
|-- m68k-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
|-- mips-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
|-- parisc-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
|-- powerpc-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
|-- riscv-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
|-- s390-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
|-- sh-allmodconfig
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
|   |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
|   `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration
`-- sparc64-allmodconfig
    |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:error:type-defaults-to-int-in-declaration-of-arch_initcall
    |-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:data-definition-has-no-type-or-storage-class
    `-- drivers-pinctrl-mediatek-pinctrl-mt6779.c:warning:parameter-names-(without-types)-in-function-declaration

elapsed time: 728m

configs tested: 74
configs skipped: 1

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
