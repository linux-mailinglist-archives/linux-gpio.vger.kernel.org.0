Return-Path: <linux-gpio+bounces-28981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E10ABC7DAB0
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Nov 2025 03:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDDB3AAFFE
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Nov 2025 02:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669721DE8AF;
	Sun, 23 Nov 2025 02:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbVDHmiS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED301A0728
	for <linux-gpio@vger.kernel.org>; Sun, 23 Nov 2025 02:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763863649; cv=none; b=WxpHTibz4V4BMbjA+LkJQiYW3Bu7gUTGeZ1/fC3R8hgENuJcT91qxIhhwXQ/VWNg+IH8CORG7fvm5KlbwmB04hCLtP5Kva1csLB5c6ATIk6M8ALN/OcjLQy4ldpZY/1Z0p4mI1an8RgmykEYcz05YMXYYPyBnPZyvk4Ea04zW+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763863649; c=relaxed/simple;
	bh=HmjTUAnCayUxfevKhCVDopZoIngFNGhrBfpGq/d4iUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cd1+dm9REaCB7tH+j7vEEs/vtQdRU4z9lSX5nncRWMQZq1WNQSZN4xF46iNh7+giVL8h7D3DiCjFTGln1FfvUXHcGvFILp9cxUx3ZAjOFM0K0xssBPx5lx4Y0xnH7u1+8cunXK/ile6g0sZi0wO83Y/LEkYm1xYGOt7BAcqqYGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbVDHmiS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763863647; x=1795399647;
  h=date:from:to:cc:subject:message-id;
  bh=HmjTUAnCayUxfevKhCVDopZoIngFNGhrBfpGq/d4iUs=;
  b=QbVDHmiShtvQH3dcicKJooxM99BpPt+KDXKvVu+/Ur5pV/RtjVL77aS7
   wT5sh0PKj246t/Oi7fVfniT8GJdv3WohVy5tYM6fJtS5RV23eSDjzCLRU
   Oih5p8pkKV7+Z18PPBeRNXPou6A/Hf9C/MVURhfGFUpckx+M3u6SiBflR
   ZTnJA8LBez0fEI0lwQ5SVL59sH9VuoBeWPpI73nD91ZCrMH9EOkM7aDqh
   rVlUSApG3WPmo9W5x1THu1OCr/tNjCK+Ry0MMxdpwhSzHW3D2VYUhn2VR
   mplG62pHnh0R9GAaRbnuGLeQDFnqvQrIY0VyHQ2uCwBXMcxAEw2pGj4CQ
   w==;
X-CSE-ConnectionGUID: Gq43oOT5Rbe810UWQkVKrw==
X-CSE-MsgGUID: ZRdHPmnNQ/mDb+kxyLal0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76597235"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="76597235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 18:07:27 -0800
X-CSE-ConnectionGUID: fSU8E2MoTviuVRKox+veow==
X-CSE-MsgGUID: YkMgzUuUTeK5tAtVjU3Unw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="191802967"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2025 18:07:26 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMzVb-0007zP-1j;
	Sun, 23 Nov 2025 02:07:23 +0000
Date: Sun, 23 Nov 2025 10:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 72eb5b1f5d7c0ab76e4db1b2d4eb8a880dbdbfad
Message-ID: <202511231017.GBJkJKu3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 72eb5b1f5d7c0ab76e4db1b2d4eb8a880dbdbfad  Merge tag 'reset-gpio-for-v6.19-2' of https://git.pengutronix.de/git/pza/linux into gpio/for-next

elapsed time: 2033m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251122    gcc-14.3.0
arc                   randconfig-002-20251122    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251122    clang-22
arm                   randconfig-002-20251122    clang-22
arm                   randconfig-003-20251122    clang-22
arm                   randconfig-004-20251122    gcc-12.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251122    gcc-8.5.0
arm64                 randconfig-002-20251122    gcc-9.5.0
arm64                 randconfig-003-20251122    gcc-10.5.0
arm64                 randconfig-004-20251122    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251122    gcc-15.1.0
csky                  randconfig-002-20251122    gcc-14.3.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251122    clang-22
hexagon               randconfig-002-20251122    clang-17
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251123    clang-20
i386                  randconfig-001-20251123    gcc-14
i386                  randconfig-002-20251123    gcc-14
i386                  randconfig-003-20251123    gcc-14
i386                  randconfig-004-20251123    gcc-14
i386                  randconfig-005-20251123    gcc-14
i386                  randconfig-006-20251123    clang-20
i386                  randconfig-007-20251123    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251122    gcc-12.5.0
loongarch             randconfig-002-20251122    gcc-14.3.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                            alldefconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251122    gcc-11.5.0
nios2                 randconfig-002-20251122    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251122    gcc-14.3.0
parisc                randconfig-002-20251122    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251122    clang-16
powerpc               randconfig-002-20251122    gcc-11.5.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251122    clang-17
powerpc64             randconfig-002-20251122    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251122    clang-22
riscv                 randconfig-002-20251122    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251122    clang-16
s390                  randconfig-002-20251122    gcc-13.4.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20251122    gcc-15.1.0
sh                    randconfig-002-20251122    gcc-10.5.0
sh                          rsk7203_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251122    gcc-13.4.0
sparc                 randconfig-002-20251122    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251122    gcc-13.4.0
sparc64               randconfig-002-20251122    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251122    clang-22
um                    randconfig-002-20251122    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251123    gcc-14
x86_64      buildonly-randconfig-002-20251123    gcc-12
x86_64      buildonly-randconfig-003-20251123    gcc-14
x86_64      buildonly-randconfig-004-20251123    clang-20
x86_64      buildonly-randconfig-005-20251123    gcc-14
x86_64      buildonly-randconfig-006-20251123    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251123    gcc-14
x86_64                randconfig-012-20251123    gcc-14
x86_64                randconfig-013-20251123    clang-20
x86_64                randconfig-014-20251123    gcc-14
x86_64                randconfig-015-20251123    gcc-14
x86_64                randconfig-016-20251123    clang-20
x86_64                randconfig-071-20251123    clang-20
x86_64                randconfig-072-20251123    gcc-14
x86_64                randconfig-073-20251123    gcc-12
x86_64                randconfig-074-20251123    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251122    gcc-12.5.0
xtensa                randconfig-002-20251122    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

