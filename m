Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD21233A56
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 23:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730452AbgG3VKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 17:10:13 -0400
Received: from mga18.intel.com ([134.134.136.126]:23557 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730279AbgG3VKN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Jul 2020 17:10:13 -0400
IronPort-SDR: 24fuMAGeoPd/mj7nRP8Ma3y6UZNExifukOZ5B3Y0daIo74vNKUuNz3g1ig4yBgjPlgmEczWTc6
 TDRwWMsgL5pQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="139253706"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; 
   d="scan'208";a="139253706"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 14:10:08 -0700
IronPort-SDR: OiK1CyBANRFhmNr/gWDBvJUbBJW8Q81SHUNbg2ZEZTmFZZjaYYUpacefBr80hjz88SWK2b5EJT
 /szly3eW29Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; 
   d="scan'208";a="330872048"
Received: from lkp-server02.sh.intel.com (HELO d4d86dd808e0) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Jul 2020 14:10:06 -0700
Received: from kbuild by d4d86dd808e0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k1FoT-0000Ep-GB; Thu, 30 Jul 2020 21:10:05 +0000
Date:   Fri, 31 Jul 2020 05:09:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi] BUILD SUCCESS
 8486e609e13f608fbeb7e894d172eddab8453980
Message-ID: <5f233705.gQmcR4xRTZuCaP9o%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-spi
branch HEAD: 8486e609e13f608fbeb7e894d172eddab8453980  spi: mpc512x-psc: Convert to use GPIO descriptors

elapsed time: 1362m

configs tested: 66
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a001-20200730
x86_64               randconfig-a004-20200730
x86_64               randconfig-a002-20200730
x86_64               randconfig-a006-20200730
x86_64               randconfig-a003-20200730
x86_64               randconfig-a005-20200730
i386                 randconfig-a005-20200730
i386                 randconfig-a004-20200730
i386                 randconfig-a006-20200730
i386                 randconfig-a002-20200730
i386                 randconfig-a001-20200730
i386                 randconfig-a003-20200730
i386                 randconfig-a016-20200730
i386                 randconfig-a012-20200730
i386                 randconfig-a014-20200730
i386                 randconfig-a015-20200730
i386                 randconfig-a011-20200730
i386                 randconfig-a013-20200730
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
