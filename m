Return-Path: <linux-gpio+bounces-34447-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLqAKBvqymkkBQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34447-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 23:24:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F23616C5
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 23:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACEAC302E315
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 21:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E2E393DC0;
	Mon, 30 Mar 2026 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZ8MwPv4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676FE2E285C
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905768; cv=none; b=sV08Ayq0vdZ9FZOuytzzWGUqteghWwBEBR3Gw+qDuiuDAq6EB+G+EPH+mZrbaRujXiDh3lk+kl1ekYsZiy+xzpvzw/IIheOPSYN7t0o8eiRoRwxdksCjYm5dBhCs3kgdt4yS4H90Vf/e55L41MVKJ6G44ru+QcaGdm/X1RRA9uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905768; c=relaxed/simple;
	bh=e1z86+0dgEshpzFsrG+9DytciWvtHgzovvRLWDmKW7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HQxyQLp0mCpq/+fVHpJsP9vozBKd3d66xUa5i0rlNfdbXXSnPZ/npjdoq5mzCYwltgErT5HswFucn4Dl6kAlfzN9H5ciOYyF45R134Uew6lQTAaNiMqn3FMNul6J2oM1768ekKGTW+uPDsf6Tc8nRAyN1xdA4nR+tfpJFIvDJSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZ8MwPv4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774905768; x=1806441768;
  h=date:from:to:cc:subject:message-id;
  bh=e1z86+0dgEshpzFsrG+9DytciWvtHgzovvRLWDmKW7M=;
  b=JZ8MwPv4bkfYs/MXIl9/y9rojjd24Vs7ldF5+1VLhlPIQfrOZt7poUu6
   8kMIpQatjQ7SZ9g1RpYVF+iFSI8GQrmviPZP0znOS5SkqGmAUR6fMHIrG
   VaYfXFaf9jZtc9lOOxjqYsLUaAGXwGQHDDhPQpDarU4KU7fjmJiJ3iQ+R
   oi+xj2+iBG3pqojbBeNU4ekQ89gHkW0BFZv7KJgZunzNqnCz9AFtieUzG
   TjdodRlePKRYjpZ82wkqCDxQ80hDtUvkQ35GvarW44q2Ecgi5yu9RpqLd
   48p8czs/n8uZPGEY+AbAu5Uto05UukpBj+uILzM8v9YLGZ/ilbWhu32Xp
   A==;
X-CSE-ConnectionGUID: IylJmwz8TcK764fQVsetYQ==
X-CSE-MsgGUID: fhUFmtCWQneeSKiwOHXrzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75926169"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75926169"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 14:22:48 -0700
X-CSE-ConnectionGUID: MpeXDW/SRD2Yy7FtKSRibQ==
X-CSE-MsgGUID: IehOfmjCTvWX8eqQg5/EBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="230638198"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Mar 2026 14:22:45 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7K4J-000000001jN-18y0;
	Mon, 30 Mar 2026 21:22:43 +0000
Date: Tue, 31 Mar 2026 05:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 6b5ef8c88854b343b733b574ea8754c9dab61f41
Message-ID: <202603310523.jmEVToj6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34447-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 1A8F23616C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 6b5ef8c88854b343b733b574ea8754c9dab61f41  dt-bindings: gpio: fix microchip #interrupt-cells

elapsed time: 770m

configs tested: 239
configs skipped: 2

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
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260330    clang-23
arc                   randconfig-001-20260331    clang-23
arc                   randconfig-002-20260330    clang-23
arc                   randconfig-002-20260331    clang-23
arc                        vdk_hs38_defconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                        clps711x_defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260330    clang-23
arm                   randconfig-001-20260331    clang-23
arm                   randconfig-002-20260330    clang-23
arm                   randconfig-002-20260331    clang-23
arm                   randconfig-003-20260330    clang-23
arm                   randconfig-003-20260331    clang-23
arm                   randconfig-004-20260330    clang-23
arm                   randconfig-004-20260331    clang-23
arm                             rpc_defconfig    clang-18
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260330    clang-23
arm64                 randconfig-001-20260331    clang-18
arm64                 randconfig-002-20260330    clang-23
arm64                 randconfig-002-20260331    clang-18
arm64                 randconfig-003-20260330    clang-23
arm64                 randconfig-003-20260331    clang-18
arm64                 randconfig-004-20260330    clang-23
arm64                 randconfig-004-20260331    clang-18
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260330    clang-23
csky                  randconfig-001-20260331    clang-18
csky                  randconfig-002-20260330    clang-23
csky                  randconfig-002-20260331    clang-18
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260330    gcc-11.5.0
hexagon               randconfig-001-20260331    gcc-11.5.0
hexagon               randconfig-002-20260330    gcc-11.5.0
hexagon               randconfig-002-20260331    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260330    gcc-14
i386        buildonly-randconfig-001-20260331    clang-20
i386        buildonly-randconfig-002-20260330    gcc-14
i386        buildonly-randconfig-002-20260331    clang-20
i386        buildonly-randconfig-003-20260330    gcc-14
i386        buildonly-randconfig-003-20260331    clang-20
i386        buildonly-randconfig-004-20260330    gcc-14
i386        buildonly-randconfig-004-20260331    clang-20
i386        buildonly-randconfig-005-20260330    gcc-14
i386        buildonly-randconfig-005-20260331    clang-20
i386        buildonly-randconfig-006-20260330    gcc-14
i386        buildonly-randconfig-006-20260331    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260330    clang-20
i386                  randconfig-001-20260331    gcc-14
i386                  randconfig-002-20260330    clang-20
i386                  randconfig-002-20260331    gcc-14
i386                  randconfig-003-20260330    clang-20
i386                  randconfig-003-20260331    gcc-14
i386                  randconfig-004-20260330    clang-20
i386                  randconfig-004-20260331    gcc-14
i386                  randconfig-005-20260330    clang-20
i386                  randconfig-005-20260331    gcc-14
i386                  randconfig-006-20260330    clang-20
i386                  randconfig-006-20260331    gcc-14
i386                  randconfig-007-20260330    clang-20
i386                  randconfig-007-20260331    gcc-14
i386                  randconfig-011-20260330    gcc-14
i386                  randconfig-012-20260330    gcc-14
i386                  randconfig-013-20260330    gcc-14
i386                  randconfig-014-20260330    gcc-14
i386                  randconfig-015-20260330    gcc-14
i386                  randconfig-016-20260330    gcc-14
i386                  randconfig-017-20260330    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260330    gcc-11.5.0
loongarch             randconfig-001-20260331    gcc-11.5.0
loongarch             randconfig-002-20260330    gcc-11.5.0
loongarch             randconfig-002-20260331    gcc-11.5.0
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
nios2                 randconfig-001-20260330    gcc-11.5.0
nios2                 randconfig-001-20260331    gcc-11.5.0
nios2                 randconfig-002-20260330    gcc-11.5.0
nios2                 randconfig-002-20260331    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                 simple_smp_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260330    gcc-8.5.0
parisc                randconfig-001-20260331    clang-23
parisc                randconfig-002-20260330    gcc-8.5.0
parisc                randconfig-002-20260331    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260330    gcc-8.5.0
powerpc               randconfig-001-20260331    clang-23
powerpc               randconfig-002-20260330    gcc-8.5.0
powerpc               randconfig-002-20260331    clang-23
powerpc64             randconfig-001-20260330    gcc-8.5.0
powerpc64             randconfig-001-20260331    clang-23
powerpc64             randconfig-002-20260330    gcc-8.5.0
powerpc64             randconfig-002-20260331    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260331    gcc-15.2.0
riscv                 randconfig-002-20260331    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260331    gcc-15.2.0
s390                  randconfig-002-20260331    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260331    gcc-15.2.0
sh                    randconfig-002-20260331    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260330    gcc-12.5.0
sparc                 randconfig-002-20260330    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260330    gcc-12.5.0
sparc64               randconfig-002-20260330    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260330    gcc-12.5.0
um                    randconfig-002-20260330    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260330    gcc-14
x86_64      buildonly-randconfig-002-20260330    gcc-14
x86_64      buildonly-randconfig-003-20260330    gcc-14
x86_64      buildonly-randconfig-004-20260330    gcc-14
x86_64      buildonly-randconfig-005-20260330    gcc-14
x86_64      buildonly-randconfig-006-20260330    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260330    clang-20
x86_64                randconfig-002-20260330    clang-20
x86_64                randconfig-003-20260330    clang-20
x86_64                randconfig-004-20260330    clang-20
x86_64                randconfig-005-20260330    clang-20
x86_64                randconfig-006-20260330    clang-20
x86_64                randconfig-011-20260330    gcc-14
x86_64                randconfig-012-20260330    gcc-14
x86_64                randconfig-013-20260330    gcc-14
x86_64                randconfig-014-20260330    gcc-14
x86_64                randconfig-015-20260330    gcc-14
x86_64                randconfig-016-20260330    gcc-14
x86_64                randconfig-071-20260330    gcc-14
x86_64                randconfig-071-20260331    clang-20
x86_64                randconfig-072-20260330    gcc-14
x86_64                randconfig-072-20260331    clang-20
x86_64                randconfig-073-20260330    gcc-14
x86_64                randconfig-073-20260331    clang-20
x86_64                randconfig-074-20260330    gcc-14
x86_64                randconfig-074-20260331    clang-20
x86_64                randconfig-075-20260330    gcc-14
x86_64                randconfig-075-20260331    clang-20
x86_64                randconfig-076-20260330    gcc-14
x86_64                randconfig-076-20260331    clang-20
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
xtensa                randconfig-001-20260330    gcc-12.5.0
xtensa                randconfig-002-20260330    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

