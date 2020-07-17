Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A50622321D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 06:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgGQEWt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 00:22:49 -0400
Received: from mga03.intel.com ([134.134.136.65]:40938 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725300AbgGQEWt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 00:22:49 -0400
IronPort-SDR: T4ClpAWieLXY+ZdhiY0M0JAuuQ0aHkLPxN99KDttvmlrdqX7jQBv+BUN4dr1xDeqMEBN4K1kg8
 ob7CJ+iRA0wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="149523129"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
   d="scan'208";a="149523129"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 21:22:05 -0700
IronPort-SDR: tjQcVLKJt05uqDaQkaJfqP1WA02Huz1p0xnq1RtXfJB5H+nWpQykVbNbO2TCbrO3qLxVVZkx4+
 p/YWfm40ZM3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
   d="scan'208";a="326737750"
Received: from lkp-server02.sh.intel.com (HELO 50058c6ee6fc) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Jul 2020 21:22:04 -0700
Received: from kbuild by 50058c6ee6fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jwHsp-000056-Cx; Fri, 17 Jul 2020 04:22:03 +0000
Date:   Fri, 17 Jul 2020 12:20:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:ib-for-each-clump] BUILD SUCCESS WITH WARNING
 3358c938236d6a1be51124fbbb2698e50689d382
Message-ID: <5f112727.waiAjBR9TazYoSu4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  ib-for-each-clump
branch HEAD: 3358c938236d6a1be51124fbbb2698e50689d382  gpio: xilinx: Utilize generic bitmap_get_value and _set_value.

Warning in current branch:

include/linux/bitmap.h:638:17: sparse: sparse: invalid access past the end of 'old' (8 8)
include/linux/bitmap.h:639:45: sparse: sparse: shift too big (32) for type unsigned long
include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-randconfig-s031-20200716
|   |-- include-linux-bitmap.h:sparse:sparse:invalid-access-past-the-end-of-old-(-)
|   `-- include-linux-bitmap.h:sparse:sparse:shift-too-big-()-for-type-unsigned-long
|-- i386-randconfig-s001-20200716
|   `-- include-linux-bitmap.h:sparse:sparse:shift-too-big-()-for-type-unsigned-long
`-- i386-randconfig-s002-20200716
    `-- include-linux-bitmap.h:sparse:sparse:shift-too-big-()-for-type-unsigned-long

elapsed time: 725m

configs tested: 92
configs skipped: 1

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
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
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200716
i386                 randconfig-a005-20200716
i386                 randconfig-a002-20200716
i386                 randconfig-a006-20200716
i386                 randconfig-a003-20200716
i386                 randconfig-a004-20200716
x86_64               randconfig-a012-20200716
x86_64               randconfig-a011-20200716
x86_64               randconfig-a016-20200716
x86_64               randconfig-a014-20200716
x86_64               randconfig-a013-20200716
x86_64               randconfig-a015-20200716
i386                 randconfig-a016-20200716
i386                 randconfig-a011-20200716
i386                 randconfig-a015-20200716
i386                 randconfig-a012-20200716
i386                 randconfig-a013-20200716
i386                 randconfig-a014-20200716
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
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
