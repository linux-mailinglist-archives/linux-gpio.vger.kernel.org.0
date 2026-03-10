Return-Path: <linux-gpio+bounces-33038-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLTWDiuPsGkukgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33038-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 22:37:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972E258631
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 22:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 072FE32386E0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 21:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6F93EC2EE;
	Tue, 10 Mar 2026 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0VNSjFs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9350735A397
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 21:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178528; cv=none; b=gaX/5w1rtorruhqOE78EcxfeGTqAlY33kl2yHBV3t7JC1NxF4cAgezP3F5BQ/WspY4ElIHjhc6hqAl96mgnCIU9UoVroY+5KEmLmMr0Txm3kIGuSEZtaiz/i/EHC/8Vg0qAHA9EHVw13ctG/EXDxvqbBIkb3BGWvDVM2TWm8TiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178528; c=relaxed/simple;
	bh=Q9/aEP7qxcwcOQ6Q2Zcz3D/x5C/08mQZpHZQpiDUPxk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rX1LA2PAMU3qRF8CpmcsUAegdH+V0MUaEESAKHFhacG4bCirKkJMyajhD/nKGjku4MMXDRs3uJfqMeHmO+uKVq7adG+xk2zWgwElxmib3PBI1IcAHX4Ydbz6nzCTCY2hwg1zkrpioI2riWGkwGskEfDACLPjbLEEJ20ujawqVbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0VNSjFs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773178525; x=1804714525;
  h=date:from:to:cc:subject:message-id;
  bh=Q9/aEP7qxcwcOQ6Q2Zcz3D/x5C/08mQZpHZQpiDUPxk=;
  b=G0VNSjFsyfU74uR4wymUZjbfgRUQ7x5/qzneGxeDLF5Spp7QrSRQggXS
   Ad2LCJwMmMxYnBe23USrEfM01AkYlbZViM2DqBk3AFgpv3dbyfKdxn8O+
   OnKWISRF1Bg/aDIWTqQnLGi8mvNg5wrXvr7AxgC1B3h+YBODQsogjSLgz
   mzZyHLjZrsJhMDnpZyHKEo/T8+75d6C+056jnlZ2xV4iVjlh4dWsAuOOz
   qrSulObrIfv4TsgCNWCtB23136iWUNYL2KEE2KaQqXrpMEp6B19ODXheK
   jWAy6/3UqXDrtBlQ0yVFUnrlLKy8ZphmPTnaDGUZPXNVAsE5qsUfb+V9s
   g==;
X-CSE-ConnectionGUID: 5SlTcS+9Tm2quET7FOjyLQ==
X-CSE-MsgGUID: wv3lQMWSQAi3mfBmF9SFOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74427831"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74427831"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:35:25 -0700
X-CSE-ConnectionGUID: Uvntue39TcucNWixTgXA6w==
X-CSE-MsgGUID: J86d+SRhRzW7MurWMP8oqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220429997"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Mar 2026 14:35:23 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w04jY-000000000Ij-45tE;
	Tue, 10 Mar 2026 21:35:20 +0000
Date: Wed, 11 Mar 2026 05:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 8f0aecf2957e7dba78603544368846133bf6d22e
Message-ID: <202603110506.6XAXhVlG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 8972E258631
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33038-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 8f0aecf2957e7dba78603544368846133bf6d22e  gpio: realtek-otto: add rtl9607 support

elapsed time: 734m

configs tested: 246
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260310    gcc-8.5.0
arc                   randconfig-001-20260311    gcc-8.5.0
arc                   randconfig-002-20260310    gcc-8.5.0
arc                   randconfig-002-20260311    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                           omap1_defconfig    gcc-15.2.0
arm                   randconfig-001-20260310    gcc-8.5.0
arm                   randconfig-001-20260311    gcc-8.5.0
arm                   randconfig-002-20260310    gcc-8.5.0
arm                   randconfig-002-20260311    gcc-8.5.0
arm                   randconfig-003-20260310    gcc-8.5.0
arm                   randconfig-003-20260311    gcc-8.5.0
arm                   randconfig-004-20260310    gcc-8.5.0
arm                   randconfig-004-20260311    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260310    gcc-11.5.0
arm64                 randconfig-001-20260311    gcc-12.5.0
arm64                 randconfig-002-20260310    gcc-11.5.0
arm64                 randconfig-002-20260311    gcc-12.5.0
arm64                 randconfig-003-20260310    gcc-11.5.0
arm64                 randconfig-003-20260311    gcc-12.5.0
arm64                 randconfig-004-20260310    gcc-11.5.0
arm64                 randconfig-004-20260311    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260310    gcc-11.5.0
csky                  randconfig-001-20260311    gcc-12.5.0
csky                  randconfig-002-20260310    gcc-11.5.0
csky                  randconfig-002-20260311    gcc-12.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260310    gcc-11.5.0
hexagon               randconfig-001-20260311    gcc-8.5.0
hexagon               randconfig-002-20260310    gcc-11.5.0
hexagon               randconfig-002-20260311    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260310    gcc-14
i386        buildonly-randconfig-001-20260311    clang-20
i386        buildonly-randconfig-002-20260311    clang-20
i386        buildonly-randconfig-003-20260310    gcc-14
i386        buildonly-randconfig-003-20260311    clang-20
i386        buildonly-randconfig-004-20260310    gcc-14
i386        buildonly-randconfig-004-20260311    clang-20
i386        buildonly-randconfig-005-20260310    gcc-14
i386        buildonly-randconfig-005-20260311    clang-20
i386        buildonly-randconfig-006-20260310    gcc-14
i386        buildonly-randconfig-006-20260311    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260310    clang-20
i386                  randconfig-002-20260310    clang-20
i386                  randconfig-003-20260310    clang-20
i386                  randconfig-004-20260310    clang-20
i386                  randconfig-005-20260310    clang-20
i386                  randconfig-006-20260310    clang-20
i386                  randconfig-007-20260310    clang-20
i386                  randconfig-011-20260310    clang-20
i386                  randconfig-011-20260311    gcc-14
i386                  randconfig-012-20260310    clang-20
i386                  randconfig-012-20260311    gcc-14
i386                  randconfig-013-20260310    clang-20
i386                  randconfig-013-20260311    gcc-14
i386                  randconfig-014-20260310    clang-20
i386                  randconfig-014-20260311    gcc-14
i386                  randconfig-015-20260310    clang-20
i386                  randconfig-015-20260311    gcc-14
i386                  randconfig-016-20260310    clang-20
i386                  randconfig-016-20260311    gcc-14
i386                  randconfig-017-20260310    clang-20
i386                  randconfig-017-20260311    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260310    gcc-11.5.0
loongarch             randconfig-001-20260311    gcc-8.5.0
loongarch             randconfig-002-20260310    gcc-11.5.0
loongarch             randconfig-002-20260311    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260310    gcc-11.5.0
nios2                 randconfig-001-20260311    gcc-8.5.0
nios2                 randconfig-002-20260310    gcc-11.5.0
nios2                 randconfig-002-20260311    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260310    gcc-15.2.0
parisc                randconfig-001-20260311    clang-23
parisc                randconfig-002-20260310    gcc-15.2.0
parisc                randconfig-002-20260311    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     mpc83xx_defconfig    clang-23
powerpc               randconfig-001-20260310    gcc-15.2.0
powerpc               randconfig-001-20260311    clang-23
powerpc               randconfig-002-20260310    gcc-15.2.0
powerpc               randconfig-002-20260311    clang-23
powerpc                 xes_mpc85xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260310    gcc-15.2.0
powerpc64             randconfig-001-20260311    clang-23
powerpc64             randconfig-002-20260310    gcc-15.2.0
powerpc64             randconfig-002-20260311    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260310    clang-19
riscv                 randconfig-001-20260310    gcc-15.2.0
riscv                 randconfig-002-20260310    gcc-15.2.0
riscv                 randconfig-002-20260310    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260310    gcc-15.2.0
s390                  randconfig-001-20260310    gcc-9.5.0
s390                  randconfig-002-20260310    clang-19
s390                  randconfig-002-20260310    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          r7785rp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260310    gcc-15.2.0
sh                    randconfig-002-20260310    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260310    gcc-12.5.0
sparc                 randconfig-002-20260310    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260310    gcc-12.5.0
sparc64               randconfig-002-20260310    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260310    gcc-12.5.0
um                    randconfig-002-20260310    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260310    gcc-14
x86_64      buildonly-randconfig-002-20260310    gcc-14
x86_64      buildonly-randconfig-003-20260310    gcc-12
x86_64      buildonly-randconfig-003-20260310    gcc-14
x86_64      buildonly-randconfig-004-20260310    gcc-12
x86_64      buildonly-randconfig-004-20260310    gcc-14
x86_64      buildonly-randconfig-005-20260310    gcc-14
x86_64      buildonly-randconfig-006-20260310    clang-20
x86_64      buildonly-randconfig-006-20260310    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260310    clang-20
x86_64                randconfig-001-20260310    gcc-14
x86_64                randconfig-002-20260310    clang-20
x86_64                randconfig-003-20260310    clang-20
x86_64                randconfig-004-20260310    clang-20
x86_64                randconfig-005-20260310    clang-20
x86_64                randconfig-006-20260310    clang-20
x86_64                randconfig-006-20260310    gcc-14
x86_64                randconfig-011-20260310    clang-20
x86_64                randconfig-011-20260311    gcc-13
x86_64                randconfig-012-20260310    clang-20
x86_64                randconfig-012-20260311    gcc-13
x86_64                randconfig-013-20260310    clang-20
x86_64                randconfig-013-20260311    gcc-13
x86_64                randconfig-014-20260310    clang-20
x86_64                randconfig-014-20260311    gcc-13
x86_64                randconfig-015-20260310    clang-20
x86_64                randconfig-015-20260311    gcc-13
x86_64                randconfig-016-20260310    clang-20
x86_64                randconfig-016-20260311    gcc-13
x86_64                randconfig-071-20260310    clang-20
x86_64                randconfig-072-20260310    clang-20
x86_64                randconfig-073-20260310    clang-20
x86_64                randconfig-074-20260310    clang-20
x86_64                randconfig-075-20260310    clang-20
x86_64                randconfig-076-20260310    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260310    gcc-12.5.0
xtensa                randconfig-002-20260310    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

