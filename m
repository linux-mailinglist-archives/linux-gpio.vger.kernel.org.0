Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCDF22ED76
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 15:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgG0Ne6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 09:34:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:17419 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726298AbgG0Ne6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 09:34:58 -0400
IronPort-SDR: gf0wAQI7FzhJbupPmHGQYzffUBIP0hY02C12MnKa7FVKyPgZHAyVU6Yvt2uDsDXqOKFlw6H2H7
 1ZQT34VaYhAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="130557652"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="130557652"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2020 06:34:58 -0700
IronPort-SDR: cXQ5UO9xWxJHn99IwRt13ZhcP4KHcb9o2JoKrQAmGs6377gmuY+p+Q2Ar0oED9Ace+yo0kqNMD
 0kGAvDU0WCXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="329681823"
Received: from lkp-server01.sh.intel.com (HELO df0563f96c37) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Jul 2020 06:34:56 -0700
Received: from kbuild by df0563f96c37 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k03HL-0001vp-RD; Mon, 27 Jul 2020 13:34:55 +0000
Date:   Mon, 27 Jul 2020 21:33:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:no-irqchip-nested-threading] BUILD SUCCESS
 98e3e29fb3e93bb9c672c18a38191a5447bcc08e
Message-ID: <5f1ed7a5.6YZMfgn5BoGsLsUb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  no-irqchip-nested-threading
branch HEAD: 98e3e29fb3e93bb9c672c18a38191a5447bcc08e  gpio: Retire the explicit gpio irqchip code

elapsed time: 720m

configs tested: 68
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
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
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20200727
i386                 randconfig-a005-20200727
i386                 randconfig-a004-20200727
i386                 randconfig-a006-20200727
i386                 randconfig-a002-20200727
i386                 randconfig-a001-20200727
x86_64               randconfig-a005-20200727
x86_64               randconfig-a004-20200727
x86_64               randconfig-a003-20200727
x86_64               randconfig-a006-20200727
x86_64               randconfig-a002-20200727
x86_64               randconfig-a001-20200727
i386                 randconfig-a016-20200727
i386                 randconfig-a013-20200727
i386                 randconfig-a012-20200727
i386                 randconfig-a015-20200727
i386                 randconfig-a011-20200727
i386                 randconfig-a014-20200727
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
sparc64                             defconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                              defconfig

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
