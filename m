Return-Path: <linux-gpio+bounces-35026-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKBKGGHe2WnQtwgAu9opvQ
	(envelope-from <linux-gpio+bounces-35026-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 07:38:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE73DE736
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 07:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 814D2302C6D3
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 05:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CEF2F5491;
	Sat, 11 Apr 2026 05:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZT/MdUX/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F4F2F25F0
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775885893; cv=none; b=meQw3RDnbSuxSc0TCBPOQfsmhDlumFOL4EXv6ybNr9Eu/RcBjEqwh9rL8Z4VG74LTYGCGJ1rMtI0KF2vczXelsAxblCfAX1JX3opNjdDf7I/2E5Fj1pYI1PafACUkA+oFQzIjSoes5Doy1hwYSVW35shB5mveAhzDpC6iPPfmhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775885893; c=relaxed/simple;
	bh=q+/o62P8a9ejZcaGqRX8HJcys894cPFmcPmiA+mHnpk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M4S7X+4f0dDAnwYKuWIEXFGSZURw6s8CiHTsPviq1IPK/O48ZQRTbH2yqanLu53WdDq+NMzXjTYfVzUg5IyAA1TTEpsGXRYL/rC4mjqhYjqRx3PbPurT0hmKkj3mgtp9QXuPIx9PidgH74zkpnTRvGEbsoxfmeGOpT8KXJ+aTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZT/MdUX/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775885892; x=1807421892;
  h=date:from:to:cc:subject:message-id;
  bh=q+/o62P8a9ejZcaGqRX8HJcys894cPFmcPmiA+mHnpk=;
  b=ZT/MdUX/FN94sRKh/HHtjETL3w+/zSLWZClTZNKDXemvg5Cji0hYGFr4
   GlJcpzijFYI0BSVr4OgZkZbxeiokuXLdVV0Y1LkPA8D7FCxtdHrxvvNtc
   TqN95Xy8PnFnvTnr0hVD/opCBia3itipkMAr6L52cG/eSt5bc4+wsA9+Y
   xaHnrCnY4T+X+yt5DwEkDTTlOr/na7zKnRhGGEfX1hpwYNIrJCoQbRVu4
   uhozmMcMl+VKv6uEY6xgGxMuJ22KpJ70eRvfpqTPHF0jWSf9tIVOfLU/N
   PQr/oh+qVSLslporPx4XDEaS6ScUofxJu7JpHStJkZ0mljVdKSniiKvP2
   A==;
X-CSE-ConnectionGUID: IZJ1gbbXRnafro+BIsPMDA==
X-CSE-MsgGUID: PvNSI4JHRYCiqIioUx2adg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76920912"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76920912"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 22:38:09 -0700
X-CSE-ConnectionGUID: esBzgdEmQbSC6+fwxtJQ3g==
X-CSE-MsgGUID: fsZvs4SuQrinhEuO+hdJ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="231020543"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 22:38:08 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBR2j-000000000r1-2kKf;
	Sat, 11 Apr 2026 05:38:05 +0000
Date: Sat, 11 Apr 2026 13:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 90700e10d2ad61c13a5117cfa5e08d9f2e497dcc
Message-ID: <202604111339.OR0Fy05B-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-35026-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: D0CE73DE736
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 90700e10d2ad61c13a5117cfa5e08d9f2e497dcc  pinctrl: qcom: Add Hawi pinctrl driver

elapsed time: 1417m

configs tested: 267
configs skipped: 3

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
arc                   randconfig-001-20260410    gcc-8.5.0
arc                   randconfig-001-20260411    gcc-12.5.0
arc                   randconfig-002-20260410    gcc-8.5.0
arc                   randconfig-002-20260411    gcc-12.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260410    gcc-8.5.0
arm                   randconfig-001-20260411    gcc-12.5.0
arm                   randconfig-002-20260410    gcc-8.5.0
arm                   randconfig-002-20260411    gcc-12.5.0
arm                   randconfig-003-20260410    gcc-8.5.0
arm                   randconfig-003-20260411    gcc-12.5.0
arm                   randconfig-004-20260410    gcc-8.5.0
arm                   randconfig-004-20260411    gcc-12.5.0
arm                        shmobile_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260410    gcc-10.5.0
arm64                 randconfig-001-20260411    clang-23
arm64                 randconfig-002-20260410    gcc-10.5.0
arm64                 randconfig-002-20260411    clang-23
arm64                 randconfig-003-20260410    gcc-10.5.0
arm64                 randconfig-003-20260411    clang-23
arm64                 randconfig-004-20260410    gcc-10.5.0
arm64                 randconfig-004-20260411    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260410    gcc-10.5.0
csky                  randconfig-001-20260411    clang-23
csky                  randconfig-002-20260410    gcc-10.5.0
csky                  randconfig-002-20260411    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260410    gcc-15.2.0
hexagon               randconfig-002-20260410    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260410    clang-20
i386        buildonly-randconfig-001-20260411    gcc-14
i386        buildonly-randconfig-002-20260410    clang-20
i386        buildonly-randconfig-002-20260411    gcc-14
i386        buildonly-randconfig-003-20260410    clang-20
i386        buildonly-randconfig-003-20260411    gcc-14
i386        buildonly-randconfig-004-20260410    clang-20
i386        buildonly-randconfig-004-20260411    gcc-14
i386        buildonly-randconfig-005-20260410    clang-20
i386        buildonly-randconfig-005-20260411    gcc-14
i386        buildonly-randconfig-006-20260410    clang-20
i386        buildonly-randconfig-006-20260411    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260410    gcc-14
i386                  randconfig-001-20260411    clang-20
i386                  randconfig-002-20260410    gcc-14
i386                  randconfig-002-20260411    clang-20
i386                  randconfig-003-20260410    gcc-14
i386                  randconfig-003-20260411    clang-20
i386                  randconfig-004-20260410    gcc-14
i386                  randconfig-004-20260411    clang-20
i386                  randconfig-005-20260410    gcc-14
i386                  randconfig-005-20260411    clang-20
i386                  randconfig-006-20260410    gcc-14
i386                  randconfig-006-20260411    clang-20
i386                  randconfig-007-20260410    gcc-14
i386                  randconfig-007-20260411    clang-20
i386                  randconfig-011-20260410    clang-20
i386                  randconfig-011-20260411    clang-20
i386                  randconfig-012-20260410    clang-20
i386                  randconfig-012-20260411    clang-20
i386                  randconfig-013-20260410    clang-20
i386                  randconfig-013-20260411    clang-20
i386                  randconfig-014-20260410    clang-20
i386                  randconfig-014-20260411    clang-20
i386                  randconfig-015-20260410    clang-20
i386                  randconfig-015-20260411    clang-20
i386                  randconfig-016-20260410    clang-20
i386                  randconfig-016-20260411    clang-20
i386                  randconfig-017-20260410    clang-20
i386                  randconfig-017-20260411    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260410    gcc-15.2.0
loongarch             randconfig-002-20260410    gcc-15.2.0
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
mips                        vocore2_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260410    gcc-15.2.0
nios2                 randconfig-002-20260410    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260410    gcc-14.3.0
parisc                randconfig-002-20260410    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260410    gcc-14.3.0
powerpc               randconfig-002-20260410    gcc-14.3.0
powerpc64             randconfig-001-20260410    gcc-14.3.0
powerpc64             randconfig-002-20260410    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260410    gcc-8.5.0
riscv                 randconfig-001-20260411    gcc-10.5.0
riscv                 randconfig-002-20260411    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260410    gcc-8.5.0
s390                  randconfig-001-20260411    gcc-10.5.0
s390                  randconfig-002-20260410    gcc-8.5.0
s390                  randconfig-002-20260411    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260410    gcc-8.5.0
sh                    randconfig-001-20260411    gcc-10.5.0
sh                    randconfig-002-20260410    gcc-8.5.0
sh                    randconfig-002-20260411    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260410    clang-23
sparc                 randconfig-001-20260411    gcc-14
sparc                 randconfig-002-20260410    clang-23
sparc                 randconfig-002-20260411    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260410    clang-23
sparc64               randconfig-001-20260411    gcc-14
sparc64               randconfig-002-20260410    clang-23
sparc64               randconfig-002-20260411    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260410    clang-23
um                    randconfig-001-20260411    gcc-14
um                    randconfig-002-20260410    clang-23
um                    randconfig-002-20260411    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260410    clang-20
x86_64      buildonly-randconfig-001-20260411    gcc-14
x86_64      buildonly-randconfig-002-20260410    clang-20
x86_64      buildonly-randconfig-002-20260411    gcc-14
x86_64      buildonly-randconfig-003-20260410    clang-20
x86_64      buildonly-randconfig-003-20260411    gcc-14
x86_64      buildonly-randconfig-004-20260410    clang-20
x86_64      buildonly-randconfig-004-20260411    gcc-14
x86_64      buildonly-randconfig-005-20260410    clang-20
x86_64      buildonly-randconfig-005-20260411    gcc-14
x86_64      buildonly-randconfig-006-20260410    clang-20
x86_64      buildonly-randconfig-006-20260411    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260410    clang-20
x86_64                randconfig-001-20260411    gcc-14
x86_64                randconfig-002-20260410    clang-20
x86_64                randconfig-002-20260411    gcc-14
x86_64                randconfig-003-20260410    clang-20
x86_64                randconfig-003-20260411    gcc-14
x86_64                randconfig-004-20260410    clang-20
x86_64                randconfig-004-20260411    gcc-14
x86_64                randconfig-005-20260410    clang-20
x86_64                randconfig-005-20260411    gcc-14
x86_64                randconfig-006-20260410    clang-20
x86_64                randconfig-006-20260411    gcc-14
x86_64                randconfig-011-20260410    gcc-14
x86_64                randconfig-011-20260411    clang-20
x86_64                randconfig-012-20260410    gcc-14
x86_64                randconfig-012-20260411    clang-20
x86_64                randconfig-013-20260410    gcc-14
x86_64                randconfig-013-20260411    clang-20
x86_64                randconfig-014-20260410    gcc-14
x86_64                randconfig-014-20260411    clang-20
x86_64                randconfig-015-20260410    gcc-14
x86_64                randconfig-015-20260411    clang-20
x86_64                randconfig-016-20260410    gcc-14
x86_64                randconfig-016-20260411    clang-20
x86_64                randconfig-071-20260410    clang-20
x86_64                randconfig-071-20260411    clang-20
x86_64                randconfig-072-20260410    clang-20
x86_64                randconfig-072-20260411    clang-20
x86_64                randconfig-073-20260410    clang-20
x86_64                randconfig-073-20260411    clang-20
x86_64                randconfig-074-20260410    clang-20
x86_64                randconfig-074-20260411    clang-20
x86_64                randconfig-075-20260410    clang-20
x86_64                randconfig-075-20260411    clang-20
x86_64                randconfig-076-20260410    clang-20
x86_64                randconfig-076-20260411    clang-20
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
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260410    clang-23
xtensa                randconfig-001-20260411    gcc-14
xtensa                randconfig-002-20260410    clang-23
xtensa                randconfig-002-20260411    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

