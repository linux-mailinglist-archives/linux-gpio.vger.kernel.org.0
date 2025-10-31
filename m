Return-Path: <linux-gpio+bounces-27905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DA1C259F8
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 15:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653D91886D5B
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 14:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F3134C814;
	Fri, 31 Oct 2025 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEVpTu55"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F9334C12D
	for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921605; cv=none; b=BofnSdVKlfWzmRB0dMaKJR3u/AcrUruz4v3MXtoXqerBKjsAn6sMoujHTRMmGR7e7KA+MIaMZzJK3qEi9JHKLCDS5GFEYQgIIUoRT10IOebR3+R9iFvruyZTXhPTKcSluUFyHXh5OZjJf6+wNPk9rXH/rGxbYYWGAMZSoRxg+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921605; c=relaxed/simple;
	bh=IpLJ9GRT90Xdk099knFN16ArWU+CSt7hHFtZrS4M4YU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GW1pWJGFIAY+ryIjB6sRt4XvpzMXZW5h+eMYevBpyjV+vdTUGZYlYUc0+Dlsr2JvWy7FUrCZUxbWFepwcjWZMwJ1jXlhB+mT4r8Ma7+50nu1S43eOiR/dQ80FQ6GezcYH3zbsSGH3qmeCxU+SpkeDdKeUTnSmQWlWnhFyv+o9jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEVpTu55; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761921603; x=1793457603;
  h=date:from:to:cc:subject:message-id;
  bh=IpLJ9GRT90Xdk099knFN16ArWU+CSt7hHFtZrS4M4YU=;
  b=KEVpTu558ZHcipxEaXwhMaGkXJWVdoezMj6XUKRNJ49LSeN3NjvIZuIR
   GNdPR+OPq1+h4Rgket6aroWptDvYCI7PgtmCDRORM0pPENePpkwjpCIbu
   Ah6YKWeZIgYvNBOPyPlTBnjvuMPConI8stHnb+z1O4vYPQR/v0Pj2lmPY
   eNxu++XRaFEdaY8+UNrefNAJMO9eJDMG1a2XgWjmZx1vsGdty7My9/ipV
   crzsYXfT+LZq9oULYYkEvoH9dKewon/WotuMESFEqdboV4wrya8K/4SNG
   UI5/zNc0gK/avgS8Dzz2AI8FyIcFZuTxpveAdjDqM+H1850q9MPQtF8KH
   g==;
X-CSE-ConnectionGUID: ScKXyoEARtW4WruAhs0LHA==
X-CSE-MsgGUID: 3nf6NWU1RiG23s/vO4zbow==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74760418"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="74760418"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 07:39:39 -0700
X-CSE-ConnectionGUID: dbqDeTTKTZucBVlv5MlZvg==
X-CSE-MsgGUID: oNVDvq6TRiyPYlbwdhMvdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="209816506"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2025 07:39:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEqHw-000NJK-1Q;
	Fri, 31 Oct 2025 14:39:36 +0000
Date: Fri, 31 Oct 2025 22:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 2aea4b47e7a5ef171645302b036fa5fb21837274
Message-ID: <202510312241.gT2YZofQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 2aea4b47e7a5ef171645302b036fa5fb21837274  Merge branch 'devel' into for-next

elapsed time: 1491m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251030    gcc-11.5.0
arc                   randconfig-002-20251030    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20251030    gcc-10.5.0
arm                   randconfig-002-20251030    clang-19
arm                   randconfig-003-20251030    clang-22
arm                   randconfig-004-20251030    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251031    gcc-8.5.0
arm64                 randconfig-002-20251031    clang-22
arm64                 randconfig-003-20251031    gcc-10.5.0
arm64                 randconfig-004-20251031    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251031    gcc-9.5.0
csky                  randconfig-002-20251031    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251031    clang-22
hexagon               randconfig-002-20251031    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251031    gcc-14
i386        buildonly-randconfig-002-20251031    gcc-14
i386        buildonly-randconfig-003-20251031    clang-20
i386        buildonly-randconfig-004-20251031    gcc-14
i386        buildonly-randconfig-005-20251031    clang-20
i386        buildonly-randconfig-006-20251031    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251031    clang-22
loongarch             randconfig-001-20251031    gcc-15.1.0
loongarch             randconfig-002-20251031    clang-22
loongarch             randconfig-002-20251031    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251031    clang-22
nios2                 randconfig-001-20251031    gcc-9.5.0
nios2                 randconfig-002-20251031    clang-22
nios2                 randconfig-002-20251031    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251031    clang-22
parisc                randconfig-001-20251031    gcc-14.3.0
parisc                randconfig-002-20251031    clang-22
parisc                randconfig-002-20251031    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   lite5200b_defconfig    clang-22
powerpc                     mpc5200_defconfig    clang-22
powerpc               randconfig-001-20251031    clang-22
powerpc               randconfig-002-20251031    clang-22
powerpc               randconfig-002-20251031    gcc-12.5.0
powerpc64             randconfig-001-20251031    clang-22
powerpc64             randconfig-002-20251031    clang-22
powerpc64             randconfig-002-20251031    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251030    gcc-13.4.0
riscv                 randconfig-001-20251031    clang-17
riscv                 randconfig-002-20251030    gcc-15.1.0
riscv                 randconfig-002-20251031    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251030    clang-17
s390                  randconfig-001-20251031    clang-17
s390                  randconfig-002-20251030    gcc-8.5.0
s390                  randconfig-002-20251031    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20251030    gcc-15.1.0
sh                    randconfig-001-20251031    clang-17
sh                    randconfig-002-20251030    gcc-15.1.0
sh                    randconfig-002-20251031    clang-17
sh                           se7705_defconfig    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251031    gcc-8.5.0
sparc                 randconfig-002-20251031    gcc-8.5.0
sparc64               randconfig-001-20251031    gcc-8.5.0
sparc64               randconfig-002-20251031    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251031    gcc-14
um                    randconfig-002-20251031    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251031    clang-20
x86_64      buildonly-randconfig-002-20251031    gcc-14
x86_64      buildonly-randconfig-003-20251031    clang-20
x86_64      buildonly-randconfig-004-20251031    gcc-14
x86_64      buildonly-randconfig-005-20251031    gcc-14
x86_64      buildonly-randconfig-006-20251031    gcc-14
x86_64                randconfig-011-20251031    gcc-14
x86_64                randconfig-012-20251031    clang-20
x86_64                randconfig-013-20251031    gcc-14
x86_64                randconfig-014-20251031    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251031    gcc-13.4.0
xtensa                randconfig-002-20251031    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

