Return-Path: <linux-gpio+bounces-11687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F979A4F93
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 18:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86D53B25C2C
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 16:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40109155747;
	Sat, 19 Oct 2024 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xyf8NHyc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3B02F3E
	for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729353942; cv=none; b=u4pNW7T4c4KcVBjmoUqr4V1SKiZUls+uf/s8nKroM7wf6/INTDsAjFBKVy4xE0fCpE31Lk6gtg4+AzimziegCkDFwwGJbAvPnhgoh3sgL9k3uyzL+qY9SgKgZH83vqv8K4OOg8WBGOvpKb7zsZXkpUWR0pB9HtbaMc5GdZ6wMYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729353942; c=relaxed/simple;
	bh=mJe338VpTjnbfGKvyCyttdRwe5W2tJfUJ6vivqMCmgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gwU7ynCuOi4+NjazHOgVFIsjZ56gabSNvqdkpZiVxrQE4OIwUqsF6R1UAEUg7MdjKmu80wfOgKGKbvLiPDM36vPCTadCk9BLr9scnUdjt31AoU0R1nkJZ2GFB4hrWODFGEoKtFEiYq5XGiiarFwo55zGrNqFSy++4SzbfG5/TRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xyf8NHyc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729353939; x=1760889939;
  h=date:from:to:cc:subject:message-id;
  bh=mJe338VpTjnbfGKvyCyttdRwe5W2tJfUJ6vivqMCmgU=;
  b=Xyf8NHyceEkMuanWDFhDWDCa6mWyFuZ+NP7yuRj+L/QV1JVdSiUgx9+0
   j15GOz+je5qW60fXnbZXrcFIusRQT4S1/EtLkKL6L+O0YK5sc+RnGTxkp
   r0DE9DAyN5gmVucMqi/ScgZFQHRuc3Wi1m5JJvbr/wSvxg2jrcdpNyJkG
   Gj79fG80+Daj9Vl/1WmRD+rNXG8mBUNP93il035IuxGRxb+C6/ni5ZlL6
   Fow58WgWWj9wq1IK4QFLJR7desOT+SrsbDYfYw9pAFtNCfmXRswjfEiOM
   Sl3XWg3HDvV0EKm33gmQIb1TOe8v86bp+o2dBTR670wMBK7LCWawnJlx9
   A==;
X-CSE-ConnectionGUID: tqbNhXLqTTKUM/VHuu2/Ug==
X-CSE-MsgGUID: k1wEYqL/Rzi0kUEUBDVtCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32558389"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32558389"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 09:05:39 -0700
X-CSE-ConnectionGUID: TyTMGP7JQAe0/3hBjvpyzg==
X-CSE-MsgGUID: en5fNfmvRQa8swerhg21Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79150123"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Oct 2024 09:05:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2BxQ-000P8L-0A;
	Sat, 19 Oct 2024 16:05:36 +0000
Date: Sun, 20 Oct 2024 00:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 b4c69d471b72aa70766d94a11c31bc4c13f29eac
Message-ID: <202410200050.40A7rDlJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: b4c69d471b72aa70766d94a11c31bc4c13f29eac  dt-bindings: gpio-mmio: Add ngpios property

elapsed time: 1639m

configs tested: 101
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                         nhk8815_defconfig    clang-20
arm                       omap2plus_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          alldefconfig    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241019    clang-18
i386        buildonly-randconfig-002-20241019    clang-18
i386        buildonly-randconfig-003-20241019    clang-18
i386        buildonly-randconfig-004-20241019    clang-18
i386        buildonly-randconfig-005-20241019    clang-18
i386        buildonly-randconfig-006-20241019    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241019    clang-18
i386                  randconfig-002-20241019    clang-18
i386                  randconfig-003-20241019    clang-18
i386                  randconfig-004-20241019    clang-18
i386                  randconfig-005-20241019    clang-18
i386                  randconfig-006-20241019    clang-18
i386                  randconfig-011-20241019    clang-18
i386                  randconfig-012-20241019    clang-18
i386                  randconfig-013-20241019    clang-18
i386                  randconfig-014-20241019    clang-18
i386                  randconfig-015-20241019    clang-18
i386                  randconfig-016-20241019    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    clang-20
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    clang-20
mips                         rt305x_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                   currituck_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                    mvme5100_defconfig    clang-20
powerpc                     tqm8541_defconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                      rts7751r2d1_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

