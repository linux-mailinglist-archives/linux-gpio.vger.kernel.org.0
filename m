Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC365233DDF
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jul 2020 06:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgGaEFW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Jul 2020 00:05:22 -0400
Received: from mga01.intel.com ([192.55.52.88]:14144 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbgGaEFW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 31 Jul 2020 00:05:22 -0400
IronPort-SDR: of0U9alNNSt1YpwAeHDOhjNzU2vY13DhxDVGvTjtEHZYUD5Xig7pvhhdLWId+7ocqz2wQ0/zed
 H2UD9eev8XgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="169840601"
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="169840601"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 21:05:19 -0700
IronPort-SDR: pS/PZnqZtnSaYAZzrzCVlmYQzCjRMrJxsJUmumc+8rRBgzGVVCHjJMjirCycETd3VdVN9M8cMX
 Wornb1M8p0wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="329141903"
Received: from lkp-server02.sh.intel.com (HELO d4d86dd808e0) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2020 21:05:18 -0700
Received: from kbuild by d4d86dd808e0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k1MIH-0000Pu-EM; Fri, 31 Jul 2020 04:05:17 +0000
Date:   Fri, 31 Jul 2020 12:05:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 43dd0f2fff0e0971d024b97c30b5b8fd11c02ce6
Message-ID: <5f239872.OF12F+B/GvV8vvwd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 43dd0f2fff0e0971d024b97c30b5b8fd11c02ce6  Merge branch 'devel' into for-next

elapsed time: 1582m

configs tested: 54
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
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
