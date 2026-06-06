Return-Path: <linux-gpio+bounces-38032-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uZI0KEGxJGrB+QEAu9opvQ
	(envelope-from <linux-gpio+bounces-38032-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 01:46:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A168464E86C
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Jun 2026 01:46:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=dvuFYZqI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38032-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38032-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C012300F5CC
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2026 23:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F52B4207A;
	Sat,  6 Jun 2026 23:46:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8652D26AF4
	for <linux-gpio@vger.kernel.org>; Sat,  6 Jun 2026 23:46:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780789566; cv=none; b=pRHg5hLyhT6mzsiwyN9c6RJ+u/YxRHTmDrqyvH1ZwXdu95cUv/Gfqm3+VBTT1L54JLAxSqxvLpnSTWRwQIVYOKnLGKV0MDgV5ZXPBE7sBxsqr62RY9nAtkhODAC2qD/OzCbaPY79EXOqyv1qct3gra+oA/tFesYCSA3cc/S4CRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780789566; c=relaxed/simple;
	bh=oxZoxip2PHCv1CJdbC/7W26T5Geb04Z2ELFFHa4LEE0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZZ+/u2rvRopeft2gx6HWVj6pYFKmCCa3vu3kP55yf1vzSJaZ0ltdWVoBcIbsecFBdQikI8biQqAP9NApFyZraXCQpjbJ6e67OU3QpulgEcu5717MI5L/DvcnWYqXs2naOTdtRbImZg1aw1H6DYQ9/IffmMh3HCOoVQo/RgG/ecA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvuFYZqI; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780789566; x=1812325566;
  h=date:from:to:cc:subject:message-id;
  bh=oxZoxip2PHCv1CJdbC/7W26T5Geb04Z2ELFFHa4LEE0=;
  b=dvuFYZqIOZawDpUVDpUNG7J4MYNgn6Saf4QSgVQRDcTtEzubI2w782aq
   ja11ME2AICHbx3JlJ9sTDWYyy9bDFVDC9djMigkuRNj8TAXFszBnlG54G
   B2bgtnrwuGPJU21F/ulAFCSadSmSC/vIlNfOFU8VCvMf+YAjRQgr5ZwYp
   dS5flyuG2guS2ol5D0PYfRLpoES8K1hijx7v797cqHfJLtLnQbPMteWQG
   kYJjBp6iqVrD0SZTOd8/9gcb07aeslSutPhHZEP48lN8F4XjvYhjfGElG
   vfRFM135hdcoQNEk2oXjGsSUv48HlRfhNtkoBtro+OWS313rHfaHeTiGf
   Q==;
X-CSE-ConnectionGUID: BtUJv/CvSe+TYPnK6nHpZA==
X-CSE-MsgGUID: 0+lcREv6TomAUgFdU3JeiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="99154423"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="99154423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 16:46:05 -0700
X-CSE-ConnectionGUID: 19M6z/frTW6o0LG47Vk/tA==
X-CSE-MsgGUID: iGSw/5qFTaS7QVuzOs1sXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="244314312"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jun 2026 16:46:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW0iG-00000000HS6-2xsn;
	Sat, 06 Jun 2026 23:46:00 +0000
Date: Sun, 07 Jun 2026 07:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 07c44ee9fdf196dcec14675c793e3139ec8a15b5
Message-ID: <202606070707.f0xHjoNV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38032-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:mid,intel.com:from_mime,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A168464E86C

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 07c44ee9fdf196dcec14675c793e3139ec8a15b5  gpio: remove obsolete UAF FIXMEs from lookup paths

elapsed time: 3019m

configs tested: 191
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-17
arc                               allnoconfig    gcc-15.2.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260606    clang-23
arc                   randconfig-002-20260606    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-17
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260606    clang-23
arm                   randconfig-002-20260606    clang-23
arm                   randconfig-003-20260606    clang-23
arm                   randconfig-004-20260606    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260606    clang-23
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260606    clang-23
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260606    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260606    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260606    clang-23
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260606    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260606    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260606    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260606    gcc-13
i386        buildonly-randconfig-002-20260606    gcc-13
i386        buildonly-randconfig-003-20260606    gcc-13
i386        buildonly-randconfig-004-20260606    gcc-13
i386        buildonly-randconfig-005-20260606    gcc-13
i386        buildonly-randconfig-006-20260606    gcc-13
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260606    clang-20
i386                  randconfig-002-20260606    clang-20
i386                  randconfig-003-20260606    clang-20
i386                  randconfig-004-20260606    clang-20
i386                  randconfig-005-20260606    clang-20
i386                  randconfig-006-20260606    clang-20
i386                  randconfig-007-20260606    clang-20
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260606    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260606    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260606    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260606    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260606    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260606    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260606    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260606    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260606    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-17
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      malta_kvm_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-17
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260606    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260606    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-17
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-17
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260606    gcc-8.5.0
parisc                randconfig-002-20260606    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-17
powerpc               randconfig-001-20260606    gcc-8.5.0
powerpc               randconfig-002-20260606    gcc-8.5.0
powerpc64             randconfig-001-20260606    gcc-8.5.0
powerpc64             randconfig-002-20260606    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-17
riscv                            allyesconfig    clang-17
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260606    gcc-8.5.0
riscv                          randconfig-002    gcc-8.5.0
riscv                 randconfig-002-20260606    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-17
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-8.5.0
s390                  randconfig-001-20260606    gcc-8.5.0
s390                           randconfig-002    gcc-8.5.0
s390                  randconfig-002-20260606    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-17
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-8.5.0
sh                    randconfig-001-20260606    gcc-8.5.0
sh                             randconfig-002    gcc-8.5.0
sh                    randconfig-002-20260606    gcc-8.5.0
sparc                             allnoconfig    clang-17
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260606    gcc-11.5.0
sparc                 randconfig-002-20260606    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260606    gcc-11.5.0
sparc64               randconfig-002-20260606    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260606    gcc-11.5.0
um                    randconfig-002-20260606    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-17
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260606    gcc-14
x86_64      buildonly-randconfig-002-20260606    gcc-14
x86_64      buildonly-randconfig-003-20260606    gcc-14
x86_64      buildonly-randconfig-004-20260606    gcc-14
x86_64      buildonly-randconfig-005-20260606    gcc-14
x86_64      buildonly-randconfig-006-20260606    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260606    gcc-14
x86_64                randconfig-002-20260606    gcc-14
x86_64                randconfig-003-20260606    gcc-14
x86_64                randconfig-004-20260606    gcc-14
x86_64                randconfig-005-20260606    gcc-14
x86_64                randconfig-006-20260606    gcc-14
x86_64                randconfig-011-20260606    gcc-14
x86_64                randconfig-012-20260606    gcc-14
x86_64                randconfig-013-20260606    gcc-14
x86_64                randconfig-014-20260606    gcc-14
x86_64                randconfig-015-20260606    gcc-14
x86_64                randconfig-016-20260606    gcc-14
x86_64                randconfig-071-20260607    clang-22
x86_64                randconfig-072-20260607    clang-22
x86_64                randconfig-073-20260607    clang-22
x86_64                randconfig-074-20260607    clang-22
x86_64                randconfig-075-20260607    clang-22
x86_64                randconfig-076-20260607    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-17
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260606    gcc-11.5.0
xtensa                randconfig-002-20260606    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

