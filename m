Return-Path: <linux-gpio+bounces-35932-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIcUIz1r82lf2gEAu9opvQ
	(envelope-from <linux-gpio+bounces-35932-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 16:46:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEB04A435B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 16:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A94F301DE33
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C606C42EEA0;
	Thu, 30 Apr 2026 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFUF1cYX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0888F401A26
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560276; cv=none; b=f4zySO16A5dvMDwNnCJsL09kU/u2lPvd50oHkDalQ5wC97KbBlbEIJybvLc8M9uSkCyfderIDyJnsRHQ+9G5T6PV6dxoMDECrcOibOIgs166RKkOCWwA5M7Kp6uX46iPAmPsW62cbg4wgiZ49ngbHImdBC6swKQlq7LtEu2PLJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560276; c=relaxed/simple;
	bh=lCR9+TS46seWur5o4ydlzfO2wMpg+U2dKPdLJHilx4M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FURrfNBFmSbw7lMmQl/rG9sRBQfYv/TfU45jyWVXyaEqKSv34FDB6PB3kVTzI6vnqqMcogLq8gJVTxybFkrtFOpZFaWIVkUaycluwbZz1l82lM94jbacop6r2RKrqtYOtAPB+Qtfnys0UHmGIZOuxA9wSmBvU2cSqd5PzFQMuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFUF1cYX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777560275; x=1809096275;
  h=date:from:to:cc:subject:message-id;
  bh=lCR9+TS46seWur5o4ydlzfO2wMpg+U2dKPdLJHilx4M=;
  b=mFUF1cYX7GsGahYdQTbzZwnl7nAEFtKWHGv9baH+6NwCG0wHp4cbGt2F
   8QtL+N0Tt+h57n2LVtIQWiue/8BtyAdI/5GDbol1nU6bR49pC0i0I8T7R
   gfFXqK3yuwcIqrnlWRJisvnhpXPw4HTQgHqOpe6MAfXuWrRJF7Bb4Es5P
   zzMgsHOKucnhO1GaZlE+xa+cEG33YTCXxHjlByF0qWlxzjLw0G3QHkyGY
   n+SxKTzkyDoGniz35MKc14lV7r1d1lQEWM0JFaa8wrRaRejlANqq9cUht
   +Edu+rK01XG8o8ntw4xJv8S4wX6nDModsD9qUKlHHU0JtB4Ma0KQ8HrlZ
   Q==;
X-CSE-ConnectionGUID: dOlmbA9ITxe4Qj9yddzPXg==
X-CSE-MsgGUID: GqNlrogqTPCoaQ62O8tV5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82363012"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="82363012"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:44:34 -0700
X-CSE-ConnectionGUID: QMY3P2y/QJK8D7SInEjZig==
X-CSE-MsgGUID: t81HRzy3Q8GUNUOQwUUXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="272710563"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2026 07:44:32 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIScw-00000000CUW-1fXn;
	Thu, 30 Apr 2026 14:44:30 +0000
Date: Thu, 30 Apr 2026 22:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 87182ef0bf93c283b2ab350fa4d1e0b098eb1324
Message-ID: <202604302233.b7VSpYza-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: EEEB04A435B
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35932-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 87182ef0bf93c283b2ab350fa4d1e0b098eb1324  pinctrl: starfive: jh7110: use struct_size

elapsed time: 2679m

configs tested: 191
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260430    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260430    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260430    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260430    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260430    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260430    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260430    clang-23
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260430    clang-23
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260430    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260430    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260430    clang-23
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260430    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260430    gcc-14.3.0
hexagon               randconfig-002-20260430    gcc-14.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260430    gcc-14
i386        buildonly-randconfig-002-20260430    gcc-14
i386        buildonly-randconfig-003-20260430    gcc-14
i386        buildonly-randconfig-004-20260430    gcc-14
i386        buildonly-randconfig-005-20260430    gcc-14
i386        buildonly-randconfig-006-20260430    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260430    clang-20
i386                  randconfig-002-20260430    clang-20
i386                  randconfig-003-20260430    clang-20
i386                  randconfig-004-20260430    clang-20
i386                  randconfig-005-20260430    clang-20
i386                  randconfig-006-20260430    clang-20
i386                  randconfig-007-20260430    clang-20
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260430    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260430    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260430    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260430    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260430    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260430    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260430    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260430    gcc-14.3.0
loongarch             randconfig-002-20260430    gcc-14.3.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           xway_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260430    gcc-14.3.0
nios2                 randconfig-002-20260430    gcc-14.3.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
openrisc                 simple_smp_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260430    gcc-13.4.0
parisc                randconfig-002-20260430    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                    mvme5100_defconfig    gcc-15.2.0
powerpc                      pasemi_defconfig    clang-23
powerpc               randconfig-001-20260430    gcc-13.4.0
powerpc               randconfig-002-20260430    gcc-13.4.0
powerpc64             randconfig-001-20260430    gcc-13.4.0
powerpc64             randconfig-002-20260430    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    clang-23
riscv                 randconfig-001-20260430    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260430    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    clang-23
s390                  randconfig-001-20260430    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260430    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-23
sh                    randconfig-001-20260430    clang-23
sh                             randconfig-002    clang-23
sh                    randconfig-002-20260430    clang-23
sh                           se7206_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260430    gcc-12.5.0
sparc                 randconfig-002-20260430    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260430    gcc-12.5.0
sparc64               randconfig-002-20260430    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260430    gcc-12.5.0
um                    randconfig-002-20260430    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260430    gcc-14
x86_64      buildonly-randconfig-002-20260430    gcc-14
x86_64      buildonly-randconfig-003-20260430    gcc-14
x86_64      buildonly-randconfig-004-20260430    gcc-14
x86_64      buildonly-randconfig-005-20260430    gcc-14
x86_64      buildonly-randconfig-006-20260430    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-011-20260430    clang-20
x86_64                randconfig-012-20260430    clang-20
x86_64                randconfig-013-20260430    clang-20
x86_64                randconfig-014-20260430    clang-20
x86_64                randconfig-015-20260430    clang-20
x86_64                randconfig-016-20260430    clang-20
x86_64                randconfig-071-20260430    gcc-14
x86_64                randconfig-072-20260430    gcc-14
x86_64                randconfig-073-20260430    gcc-14
x86_64                randconfig-074-20260430    gcc-14
x86_64                randconfig-075-20260430    gcc-14
x86_64                randconfig-076-20260430    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260430    gcc-12.5.0
xtensa                randconfig-002-20260430    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

