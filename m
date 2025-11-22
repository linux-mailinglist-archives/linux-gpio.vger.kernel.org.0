Return-Path: <linux-gpio+bounces-28978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B80C7D6AB
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Nov 2025 20:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3175035513F
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Nov 2025 19:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7FC246781;
	Sat, 22 Nov 2025 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYs9rJMh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABC81DDC37
	for <linux-gpio@vger.kernel.org>; Sat, 22 Nov 2025 19:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763840241; cv=none; b=oJQkAntHFJrLis/Ywapa8jY67ZKlbz5ExiOFcUPe3zcwqmYpWLeLY4Cqaxgmpqc+1IfWM9c9IWBpCcp+jzFzx/qScfwunoLd4rg26yjT5Ize5//DKVZPj7iquMBG4ql+eUxgc1rdrwIPZI5fBWOp0Dqnae06qLRFn1QjYnhmAOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763840241; c=relaxed/simple;
	bh=UMw5M7YP40CHJrYF+E2n6FKbms2kcLkGdbf8HbvOSGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W1Q236JFgPhh0YJ0KSzW3Uwl+6G2NEFWNWPEWq3SbIjTfqNayOKcK53ytiWOM76obBnN92Ychdw9dKPcNsau4kGdCumGigMuAlUFAUC3vTjZBxTRbJO32+FtlikLfeqZSftK9DGym5dARG9hT6LoTEI0dFi8r4zEZ67lB8DaVQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYs9rJMh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763840240; x=1795376240;
  h=date:from:to:cc:subject:message-id;
  bh=UMw5M7YP40CHJrYF+E2n6FKbms2kcLkGdbf8HbvOSGc=;
  b=KYs9rJMhsGLAUzsvGjLECjaBkpM9yNZwrC+hiSUXbMBMSibUtqrq7S+4
   b0SUj9WMYaQluqgpeZjMGVfzbKdAWx3C4CeBkUOUoFHWZXtANgXjSGVGV
   XL4URyWaIQD0P6W6+1z+RuwkmZu+g6CgYjZMWh/XO3YDAO0RtsPVEO9qI
   27U4e/g1XfkMuPl8/Ss2ad0syr8W1cQ03zlx7nr0YsXKNCvoLm9Rrz8wX
   ErYRKPdcskBhNPwSoWd3jTH+OOJ+xaQnJ9sh+YKs5KEiCq41XWaZbyCSm
   AKGTofMjWKzuoh98wR212kBYYuAbu5Z4EBaKxu6ZNAgoOJF9zDesxd7Gk
   w==;
X-CSE-ConnectionGUID: FpaeOw5wROKJl6y8RGuViw==
X-CSE-MsgGUID: YdFTR8KoRQ2SALrTSAnaQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="91383430"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="91383430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 11:37:19 -0800
X-CSE-ConnectionGUID: Fvw+IKVSTuO3rVluBHnCEA==
X-CSE-MsgGUID: 9QVGU7vRSzOph4fsXJQBXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192439663"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Nov 2025 11:37:18 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMtQ4-0007n1-0v;
	Sat, 22 Nov 2025 19:37:16 +0000
Date: Sun, 23 Nov 2025 03:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD REGRESSION
 da53dcd54cc35efa7a8236846bb39d40deeee034
Message-ID: <202511230352.zZGPjqki-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: da53dcd54cc35efa7a8236846bb39d40deeee034  dt-bindings: pinctrl: cix,sky1-pinctrl: Drop duplicate newline

Error/Warning (recently discovered and may have been fixed):

    include/linux/pinctrl/pinconf-generic.h:235:(.ltext+0x299): undefined reference to `pinconf_generic_dt_node_to_map'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- um-randconfig-r121-20251121
    `-- include-linux-pinctrl-pinconf-generic.h:(.ltext):undefined-reference-to-pinconf_generic_dt_node_to_map

elapsed time: 1571m

configs tested: 58
configs skipped: 0

tested configs:
alpha                   allnoconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc         randconfig-001-20251122    gcc-14.3.0
arc         randconfig-002-20251122    gcc-9.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251122    clang-22
arm         randconfig-002-20251122    clang-22
arm         randconfig-003-20251122    clang-22
arm         randconfig-004-20251122    gcc-12.5.0
arm64                   allnoconfig    gcc-15.1.0
arm64       randconfig-001-20251122    gcc-8.5.0
arm64       randconfig-002-20251122    gcc-9.5.0
arm64       randconfig-003-20251122    gcc-10.5.0
arm64       randconfig-004-20251122    clang-22
csky                    allnoconfig    gcc-15.1.0
csky        randconfig-001-20251122    gcc-15.1.0
csky        randconfig-002-20251122    gcc-14.3.0
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                    allnoconfig    gcc-14
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                    allnoconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251123    gcc-14.3.0
parisc      randconfig-002-20251123    gcc-14.3.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251123    clang-22
powerpc     randconfig-002-20251123    gcc-8.5.0
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251122    clang-22
riscv       randconfig-002-20251122    clang-22
s390                    allnoconfig    clang-22
s390        randconfig-001-20251122    clang-16
s390        randconfig-002-20251122    gcc-13.4.0
sh                      allnoconfig    gcc-15.1.0
sh          randconfig-001-20251122    gcc-15.1.0
sh          randconfig-002-20251122    gcc-10.5.0
sparc                   allnoconfig    gcc-15.1.0
sparc       randconfig-001-20251122    gcc-13.4.0
sparc       randconfig-002-20251122    gcc-11.5.0
sparc64     randconfig-001-20251122    gcc-13.4.0
sparc64     randconfig-002-20251122    clang-22
um                      allnoconfig    clang-22
um          randconfig-001-20251122    clang-22
um          randconfig-002-20251122    clang-22
x86_64                  allnoconfig    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa      randconfig-001-20251122    gcc-12.5.0
xtensa      randconfig-002-20251122    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

