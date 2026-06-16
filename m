Return-Path: <linux-gpio+bounces-38600-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id szvODG/KMWqaqAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38600-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 00:13:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B4B6958AC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 00:13:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="Rlz/FmM4";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38600-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38600-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31F91301E7F6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 22:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D83A3A7D74;
	Tue, 16 Jun 2026 22:12:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662A32C302
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 22:12:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781647978; cv=none; b=o7eB72PDRWsxHItEsHJkwjUu8Yar1X8/4uUQ3tEcSKc9o3gfh7G9LB8r1noRmQ08wywI1LKKl/do/IL4f0Y1MjTxA3SQ2O0Yv+UxH78o17bBrBSqxbCMlnpo2cwJHCqBW1do1bfdO014kWmiXI5GYNljDdaRc//sF1WefoNf7UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781647978; c=relaxed/simple;
	bh=YGGzkCiEIHY5JVUNDwfUxlFfCpJmAxCaodh3R216Wpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p/WeFIzbpZrCDsJFHa37S0AO+bCjnBcO8hPDKmDb6oED96nisr4QYp5UDmIqJ8rsqJAcxjAOPwEbifIgwHtm5oCuvooWmxHrzEmDymcZtnVmjpNZ9NDlJDZ2j2RrbxOELlc1o9AkhscNP1rkfCwHEh/DZnpQpfEwOvSuYCYHdWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rlz/FmM4; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781647977; x=1813183977;
  h=date:from:to:cc:subject:message-id;
  bh=YGGzkCiEIHY5JVUNDwfUxlFfCpJmAxCaodh3R216Wpg=;
  b=Rlz/FmM4lF4RMM3lJhx4yPD5PfvYmx3g5Y+xU+ougC+DNCsdVS/pkIO2
   ne6IVx0VMVTe2zRI2776vqtIon+7hXIKdyEb6nJuup1kETaPXSqffgaj0
   Ee4idgcYjS2x7T/XafY/6FkcmFr8T2NDnnynVykzy+gH7rDBjTAl75t4h
   SznA/BI3YhA77BuwcjcpGtuHJgn9GBZvianUySaHRyZofpmly1FOI7i3i
   gk/7kpk2weCuDNxwU/n0iA+YuGg8EgV+aUKFgZARVXvQLWMP3aDSg4UPc
   Q14Ggusy3fO5vpKgNQBS/w0V3Br/TNWDN0Hfge+dKheC5QLRsBghvWUR4
   Q==;
X-CSE-ConnectionGUID: 6jWrYbD1QOaP2dHuDQxYSw==
X-CSE-MsgGUID: G4bXHMV3QBK6LPBT4obbmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86344606"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="86344606"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 15:12:57 -0700
X-CSE-ConnectionGUID: X4TMf5LiTwSphx/d3QFUSQ==
X-CSE-MsgGUID: 408MxUp1T9C4Ttwaq+y+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="243730772"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jun 2026 15:12:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZc1d-00000000TnW-0bsX;
	Tue, 16 Jun 2026 22:12:53 +0000
Date: Wed, 17 Jun 2026 06:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 86c04b2960af2aa7ad573fe11db1be0a2156ea2c
Message-ID: <202606170644.kMdLwy4w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38600-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26B4B6958AC

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 86c04b2960af2aa7ad573fe11db1be0a2156ea2c  Merge tag 'intel-gpio-v7.1-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

elapsed time: 729m

configs tested: 297
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260616    gcc-9.5.0
arc                   randconfig-001-20260617    gcc-16.1.0
arc                   randconfig-002-20260616    gcc-9.5.0
arc                   randconfig-002-20260617    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                         lpc18xx_defconfig    clang-23
arm                   randconfig-001-20260616    gcc-9.5.0
arm                   randconfig-001-20260617    gcc-16.1.0
arm                   randconfig-002-20260616    gcc-9.5.0
arm                   randconfig-002-20260617    gcc-16.1.0
arm                   randconfig-003-20260616    gcc-9.5.0
arm                   randconfig-003-20260617    gcc-16.1.0
arm                   randconfig-004-20260616    gcc-9.5.0
arm                   randconfig-004-20260617    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260616    clang-23
arm64                 randconfig-001-20260617    gcc-12.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260616    clang-23
arm64                 randconfig-002-20260617    gcc-12.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260616    clang-23
arm64                 randconfig-003-20260617    gcc-12.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260616    clang-23
arm64                 randconfig-004-20260617    gcc-12.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260616    clang-23
csky                  randconfig-001-20260617    gcc-12.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260616    clang-23
csky                  randconfig-002-20260617    gcc-12.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260616    clang-23
hexagon               randconfig-001-20260617    clang-17
hexagon               randconfig-002-20260616    clang-23
hexagon               randconfig-002-20260617    clang-17
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260616    clang-22
i386        buildonly-randconfig-001-20260617    gcc-14
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260616    clang-22
i386        buildonly-randconfig-002-20260617    gcc-14
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260616    clang-22
i386        buildonly-randconfig-003-20260617    gcc-14
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260616    clang-22
i386        buildonly-randconfig-004-20260617    gcc-14
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260616    clang-22
i386        buildonly-randconfig-005-20260617    gcc-14
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260616    clang-22
i386        buildonly-randconfig-006-20260617    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260616    gcc-14
i386                  randconfig-002-20260616    gcc-14
i386                  randconfig-003-20260616    gcc-14
i386                  randconfig-004-20260616    gcc-14
i386                  randconfig-005-20260616    gcc-14
i386                  randconfig-006-20260616    gcc-14
i386                  randconfig-007-20260616    gcc-14
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260616    clang-22
i386                  randconfig-011-20260617    clang-22
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260616    clang-22
i386                  randconfig-012-20260617    clang-22
i386                           randconfig-013    clang-22
i386                  randconfig-013-20260616    clang-22
i386                  randconfig-013-20260617    clang-22
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260616    clang-22
i386                  randconfig-014-20260617    clang-22
i386                           randconfig-015    clang-22
i386                  randconfig-015-20260616    clang-22
i386                  randconfig-015-20260617    clang-22
i386                           randconfig-016    clang-22
i386                  randconfig-016-20260616    clang-22
i386                  randconfig-016-20260617    clang-22
i386                           randconfig-017    clang-22
i386                  randconfig-017-20260616    clang-22
i386                  randconfig-017-20260617    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260616    clang-23
loongarch             randconfig-001-20260617    clang-17
loongarch             randconfig-002-20260616    clang-23
loongarch             randconfig-002-20260617    clang-17
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                          hp300_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                      malta_kvm_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260616    clang-23
nios2                 randconfig-001-20260617    clang-17
nios2                 randconfig-002-20260616    clang-23
nios2                 randconfig-002-20260617    clang-17
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260616    gcc-8.5.0
parisc                randconfig-001-20260617    gcc-15.2.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260616    gcc-8.5.0
parisc                randconfig-002-20260617    gcc-15.2.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                 mpc8315_rdb_defconfig    clang-23
powerpc                        randconfig-001    gcc-8.5.0
powerpc               randconfig-001-20260616    gcc-8.5.0
powerpc               randconfig-001-20260617    gcc-15.2.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260616    gcc-8.5.0
powerpc               randconfig-002-20260617    gcc-15.2.0
powerpc64                      randconfig-001    gcc-8.5.0
powerpc64             randconfig-001-20260616    gcc-8.5.0
powerpc64             randconfig-001-20260617    gcc-15.2.0
powerpc64                      randconfig-002    gcc-8.5.0
powerpc64             randconfig-002-20260616    gcc-8.5.0
powerpc64             randconfig-002-20260617    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260616    gcc-16.1.0
riscv                 randconfig-001-20260617    gcc-16.1.0
riscv                 randconfig-002-20260616    gcc-16.1.0
riscv                 randconfig-002-20260617    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260616    gcc-16.1.0
s390                  randconfig-001-20260617    gcc-16.1.0
s390                  randconfig-002-20260616    gcc-16.1.0
s390                  randconfig-002-20260617    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260616    gcc-16.1.0
sh                    randconfig-001-20260617    gcc-16.1.0
sh                    randconfig-002-20260616    gcc-16.1.0
sh                    randconfig-002-20260617    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260616    gcc-8.5.0
sparc                 randconfig-001-20260617    gcc-16.1.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260616    gcc-8.5.0
sparc                 randconfig-002-20260617    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260616    gcc-8.5.0
sparc64               randconfig-001-20260617    gcc-16.1.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260616    gcc-8.5.0
sparc64               randconfig-002-20260617    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260616    gcc-8.5.0
um                    randconfig-001-20260617    gcc-16.1.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260616    gcc-8.5.0
um                    randconfig-002-20260617    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260616    gcc-14
x86_64      buildonly-randconfig-001-20260617    clang-22
x86_64      buildonly-randconfig-002-20260616    gcc-14
x86_64      buildonly-randconfig-002-20260617    clang-22
x86_64      buildonly-randconfig-003-20260616    gcc-14
x86_64      buildonly-randconfig-003-20260617    clang-22
x86_64      buildonly-randconfig-004-20260616    gcc-14
x86_64      buildonly-randconfig-004-20260617    clang-22
x86_64      buildonly-randconfig-005-20260616    gcc-14
x86_64      buildonly-randconfig-005-20260617    clang-22
x86_64      buildonly-randconfig-006-20260616    gcc-14
x86_64      buildonly-randconfig-006-20260617    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260616    clang-22
x86_64                randconfig-001-20260617    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260616    clang-22
x86_64                randconfig-002-20260617    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260616    clang-22
x86_64                randconfig-003-20260617    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260616    clang-22
x86_64                randconfig-004-20260617    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260616    clang-22
x86_64                randconfig-005-20260617    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260616    clang-22
x86_64                randconfig-006-20260617    clang-22
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260616    clang-22
x86_64                randconfig-011-20260617    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260616    clang-22
x86_64                randconfig-012-20260617    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260616    clang-22
x86_64                randconfig-013-20260617    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260616    clang-22
x86_64                randconfig-014-20260617    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260616    clang-22
x86_64                randconfig-015-20260617    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260616    clang-22
x86_64                randconfig-016-20260617    clang-22
x86_64                         randconfig-071    gcc-13
x86_64                randconfig-071-20260616    gcc-13
x86_64                randconfig-071-20260617    clang-22
x86_64                         randconfig-072    gcc-13
x86_64                randconfig-072-20260616    gcc-13
x86_64                randconfig-072-20260617    clang-22
x86_64                         randconfig-073    gcc-13
x86_64                randconfig-073-20260616    gcc-13
x86_64                randconfig-073-20260617    clang-22
x86_64                         randconfig-074    gcc-13
x86_64                randconfig-074-20260616    gcc-13
x86_64                randconfig-074-20260617    clang-22
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260616    gcc-13
x86_64                randconfig-075-20260617    clang-22
x86_64                         randconfig-076    gcc-13
x86_64                randconfig-076-20260616    gcc-13
x86_64                randconfig-076-20260617    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260616    gcc-8.5.0
xtensa                randconfig-001-20260617    gcc-16.1.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260616    gcc-8.5.0
xtensa                randconfig-002-20260617    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

