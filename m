Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2533223218
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 06:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgGQEWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 00:22:07 -0400
Received: from mga12.intel.com ([192.55.52.136]:23896 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725300AbgGQEWG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 00:22:06 -0400
IronPort-SDR: hSssqcfl7DMM9UICtKCAu+2m8lGvWRsTC+IkNXrY3vj5UOnxf1ndui+2PoAR2jypK1+KVtokRu
 Br2zzZhxnV6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="129099171"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
   d="scan'208";a="129099171"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 21:22:06 -0700
IronPort-SDR: BsyPp4Zwo006J6/Me/V5CuOLD2Vsu3Uw+f4FGIqYfHiBquUFBo6fwKNSR8/pRsfSaKSrWBphUK
 aoTbhv6EC3pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
   d="scan'208";a="308885011"
Received: from lkp-server02.sh.intel.com (HELO 50058c6ee6fc) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jul 2020 21:22:05 -0700
Received: from kbuild by 50058c6ee6fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jwHsq-00005F-Dr; Fri, 17 Jul 2020 04:22:04 +0000
Date:   Fri, 17 Jul 2020 12:20:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi] BUILD SUCCESS
 0d0a405dc116f71b4570892ed5df360dcda3e14b
Message-ID: <5f11272a.PG/4smA7PlozBtf+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-spi
branch HEAD: 0d0a405dc116f71b4570892ed5df360dcda3e14b  spi: omap-100k: Drop include

elapsed time: 725m

configs tested: 74
configs skipped: 1

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
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
i386                             allyesconfig
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
