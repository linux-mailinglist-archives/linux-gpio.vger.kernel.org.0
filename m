Return-Path: <linux-gpio+bounces-7447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA09087AC
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 11:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EBEC1F2558F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 09:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECCC1922FB;
	Fri, 14 Jun 2024 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoAtEW5z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E441922F7
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357992; cv=none; b=iGHcIQTfVdDHR2Movlva7j/7TGIl5rKEK2/VPIQUsZP8Adb/f+cDsJn6RpIorTfmT+Z3hu4K6FHhLOqkI9GPD2AkxNJukp6zmscKfzdHxK93UV3kmte3MzQVZ6YU70f4qQ/v61q5zd8Xf2Lt/EVMrDknEi5voLx16kEPoJkhFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357992; c=relaxed/simple;
	bh=0snIGkX1/54Rf0/VdHg0wdgybRs4TcNv6ZiHsJtKQI0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CJ7FU3zjo7si6/DypReZU1rtThaL0/do7Rg1/bGs4e8URVYfVm7OgnwOvM770lPxWKvg5YqJiqQ4G+RDoctiLX9D7Dx1SmyJMoBrUYdRAPvJ22QiAqUA6zPd5ZtoaYOZ13NIwxS/u2ijZgGzGAMWyh9UYpaokkDl6Lkkkhvdi+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoAtEW5z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718357990; x=1749893990;
  h=date:from:to:cc:subject:message-id;
  bh=0snIGkX1/54Rf0/VdHg0wdgybRs4TcNv6ZiHsJtKQI0=;
  b=BoAtEW5z7tSlQyyA+mmQxTYNPdbyyNxSpt0YxYeG9QF+epfb5yczwSTA
   FLI7Xp3OXa/MLOZhJvYLcJR5ayBA1szkUDlHum3Am8WpOeVua+pvjsXg7
   7R5N4prbu5CG0d9JsdgbPGyILyMcGYsZCtakc27m+7pmajw75Dgf7Bl4X
   Gr6Ch8AIb+AkqmWixsMAhMbDFHSHo5oRyeNmlE+NAkm64G2i1arshcKeh
   G3N8M31DTHwvsNTkWcmP2Y97edsmg+cVSh9PXfnH0urMHsf7/NU91V+U4
   eEr+SelhZR1g+8mL55FZyeEoAYGRhgA1htZY6tmjR8MaSQKjCS4gMEXH1
   g==;
X-CSE-ConnectionGUID: W6Wut/QDTjeiiXck8gNL4Q==
X-CSE-MsgGUID: ZVyG/E23R7uJkIsAVjzcuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25873228"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="25873228"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 02:39:50 -0700
X-CSE-ConnectionGUID: WZxES9SzR0e9HHsqU3Q/eA==
X-CSE-MsgGUID: Ft12jJkVSxup9g8VKP88jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40378091"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2024 02:39:49 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI3PO-000168-1T;
	Fri, 14 Jun 2024 09:39:46 +0000
Date: Fri, 14 Jun 2024 17:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/fix-keembay] BUILD SUCCESS
 f752b6771178e30e0174334b0d9eb659bf9d4cd2
Message-ID: <202406141751.oeZjbogA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/fix-keembay
branch HEAD: f752b6771178e30e0174334b0d9eb659bf9d4cd2  pinctrl: keembay: Fixed missing member check

elapsed time: 1513m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240614   gcc-13.2.0
arc                   randconfig-002-20240614   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm                   randconfig-001-20240614   gcc-13.2.0
arm                   randconfig-002-20240614   gcc-13.2.0
arm                   randconfig-003-20240614   gcc-13.2.0
arm                   randconfig-004-20240614   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240614   gcc-13.2.0
arm64                 randconfig-002-20240614   clang-19
arm64                 randconfig-003-20240614   gcc-13.2.0
arm64                 randconfig-004-20240614   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240614   gcc-13.2.0
csky                  randconfig-002-20240614   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240614   clang-19
hexagon               randconfig-002-20240614   clang-19
i386         buildonly-randconfig-001-20240614   clang-18
i386         buildonly-randconfig-002-20240614   clang-18
i386         buildonly-randconfig-003-20240614   gcc-12
i386         buildonly-randconfig-004-20240614   gcc-8
i386         buildonly-randconfig-005-20240614   gcc-13
i386         buildonly-randconfig-006-20240614   gcc-10
i386                  randconfig-001-20240614   gcc-13
i386                  randconfig-002-20240614   gcc-8
i386                  randconfig-003-20240614   gcc-13
i386                  randconfig-004-20240614   clang-18
i386                  randconfig-005-20240614   gcc-13
i386                  randconfig-006-20240614   gcc-10
i386                  randconfig-011-20240614   gcc-13
i386                  randconfig-012-20240614   clang-18
i386                  randconfig-013-20240614   gcc-13
i386                  randconfig-014-20240614   gcc-13
i386                  randconfig-015-20240614   clang-18
i386                  randconfig-016-20240614   clang-18
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240614   gcc-13.2.0
loongarch             randconfig-002-20240614   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240614   gcc-13.2.0
nios2                 randconfig-002-20240614   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240614   gcc-13.2.0
parisc                randconfig-002-20240614   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240614   gcc-13.2.0
powerpc               randconfig-002-20240614   clang-19
powerpc               randconfig-003-20240614   gcc-13.2.0
powerpc64             randconfig-001-20240614   clang-19
powerpc64             randconfig-002-20240614   gcc-13.2.0
powerpc64             randconfig-003-20240614   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240614   gcc-13.2.0
riscv                 randconfig-002-20240614   clang-19
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240614   gcc-13.2.0
s390                  randconfig-002-20240614   clang-19
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240614   gcc-13.2.0
sh                    randconfig-002-20240614   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240614   gcc-13.2.0
sparc64               randconfig-002-20240614   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240614   gcc-13
um                    randconfig-002-20240614   gcc-13
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240614   clang-18
x86_64       buildonly-randconfig-002-20240614   gcc-8
x86_64       buildonly-randconfig-003-20240614   clang-18
x86_64       buildonly-randconfig-004-20240614   gcc-8
x86_64       buildonly-randconfig-005-20240614   gcc-10
x86_64       buildonly-randconfig-006-20240614   clang-18
x86_64                randconfig-001-20240614   clang-18
x86_64                randconfig-002-20240614   clang-18
x86_64                randconfig-003-20240614   clang-18
x86_64                randconfig-004-20240614   gcc-11
x86_64                randconfig-005-20240614   clang-18
x86_64                randconfig-006-20240614   clang-18
x86_64                randconfig-011-20240614   clang-18
x86_64                randconfig-012-20240614   clang-18
x86_64                randconfig-013-20240614   gcc-10
x86_64                randconfig-014-20240614   gcc-8
x86_64                randconfig-015-20240614   gcc-13
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240614   gcc-13.2.0
xtensa                randconfig-002-20240614   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

