Return-Path: <linux-gpio+bounces-25698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C5B469FD
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 09:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2103B0A0D
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Sep 2025 07:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E37219319;
	Sat,  6 Sep 2025 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hML6mTys"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42C1315D36
	for <linux-gpio@vger.kernel.org>; Sat,  6 Sep 2025 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757144719; cv=none; b=IRqr11GoY9ukxNw/vhiA9Owa6UpH5AUOxNu9xtWsbLZmtHHOI1kqxazftPhx0Zwxnc+EnV0EjV220ysAlwyQD6LFVE434jsDhgmVmmoP3BZb8wgcBuiomogPEvW+EObrcKIOemiCd04XPqzJsudviG8WFkbfzpDe9eGQEZljCI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757144719; c=relaxed/simple;
	bh=rHH63zFShuzwPtjbabRa5HEceBbb4TqQETOaYsstnsI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qTe3HgEraDUeUQxfpDzVuaA6iK2ZMhisU4Ege0f0ox/m3dHEOJE5q5tYFDQAPdvJA8xc3DwbuOF9al4yjynrJkGpkoFhwEl9FaKBJsXoHWr/TXgLOkITuIY285fqTVb6CuPP4MCF3q2QDK2z23P2mEfi4o/fg0BWVbR3+j+qMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hML6mTys; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757144717; x=1788680717;
  h=date:from:to:cc:subject:message-id;
  bh=rHH63zFShuzwPtjbabRa5HEceBbb4TqQETOaYsstnsI=;
  b=hML6mTysciafXWkj3hQw/yaQVFP3d/Vp8MsIibKp1v+fIILQ7gzpyTSh
   g9h+4uox4uK+Sp/s1j3fMYCJPy+dBDvrZODgCbcmNODDeH/dGM4J9/cRf
   HpsD/Kks82NLlzG3BLRxKJWMlD3vIbotfLrSy/AAKs93d9XWsSj1DLYZy
   9uurWiHRZMTcVPzgAKJ7imm3vmzv13VF41lMzteOfffyWQa1yQ5WoyaaL
   y7VjLLVhXcEeZpVoVNm0PD7P7mNIE9aLRxGmeemaG62PjT4PvdUkNobFC
   GFnIyQvS1Stp3Ouf1kEGb89OOo33IBe3EaTkAU3G1zml9npnI00+aDHRE
   w==;
X-CSE-ConnectionGUID: IkNTq610QBeuxpzFYVpN9A==
X-CSE-MsgGUID: qe1L0p71TFWkDDapXFW7GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70186660"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="70186660"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 00:45:12 -0700
X-CSE-ConnectionGUID: OWwYlcmnSDenY6ju3mRGng==
X-CSE-MsgGUID: /kVCumuSQP+wxm0oDkcJfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="171901462"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Sep 2025 00:45:09 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uunbe-0001Hn-2l;
	Sat, 06 Sep 2025 07:45:06 +0000
Date: Sat, 06 Sep 2025 15:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 97766392ec96bdd8ef0b64bf94025d680298fa4a
Message-ID: <202509061535.GUKbWY3C-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 97766392ec96bdd8ef0b64bf94025d680298fa4a  Merge branch 'devel' into for-next

elapsed time: 2121m

configs tested: 98
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250905    gcc-11.5.0
arc                   randconfig-002-20250905    gcc-13.4.0
arm                               allnoconfig    clang-22
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-002-20250905    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-004-20250905    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250905    gcc-15.1.0
csky                  randconfig-002-20250905    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250905    clang-22
hexagon               randconfig-002-20250905    clang-22
i386                             allmodconfig    gcc-13
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250905    clang-20
i386        buildonly-randconfig-002-20250905    clang-20
i386        buildonly-randconfig-003-20250905    clang-20
i386        buildonly-randconfig-004-20250905    gcc-13
i386        buildonly-randconfig-005-20250905    clang-20
i386        buildonly-randconfig-006-20250905    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250905    clang-18
loongarch             randconfig-002-20250905    clang-18
m68k                              allnoconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250905    gcc-10.5.0
nios2                 randconfig-002-20250905    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250905    gcc-15.1.0
parisc                randconfig-002-20250905    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250905    gcc-8.5.0
powerpc               randconfig-002-20250905    clang-22
powerpc               randconfig-003-20250905    gcc-8.5.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250905    clang-22
powerpc64             randconfig-002-20250905    clang-22
powerpc64             randconfig-003-20250905    gcc-14.3.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250905    gcc-14.3.0
riscv                 randconfig-002-20250905    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250905    gcc-9.5.0
s390                  randconfig-002-20250905    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250905    gcc-15.1.0
sh                    randconfig-002-20250905    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250905    gcc-8.5.0
sparc                 randconfig-002-20250905    gcc-15.1.0
sparc64               randconfig-001-20250905    gcc-8.5.0
sparc64               randconfig-002-20250905    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250905    clang-22
um                    randconfig-002-20250905    gcc-13
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250905    clang-20
x86_64      buildonly-randconfig-002-20250905    clang-20
x86_64      buildonly-randconfig-003-20250905    gcc-13
x86_64      buildonly-randconfig-004-20250905    clang-20
x86_64      buildonly-randconfig-005-20250905    clang-20
x86_64      buildonly-randconfig-006-20250905    gcc-13
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250905    gcc-8.5.0
xtensa                randconfig-002-20250905    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

