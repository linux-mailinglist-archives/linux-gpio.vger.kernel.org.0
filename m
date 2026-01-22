Return-Path: <linux-gpio+bounces-30882-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNFRCaCBcWk1IAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30882-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 02:47:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 088DB607CB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 02:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 33714440F34
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 01:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1A8368293;
	Thu, 22 Jan 2026 01:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSPe1D4t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869BB35CBA0
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 01:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046331; cv=none; b=asLuM3+DrfBIrmPEiVY7rd2ZkOgHeeCeBCqN1+jJnPzIRGuWzf90H4plIUIzvk2/IACl6l3h/GN8i8WxFU+kmJ+c57/B5JBL35DT9UBG7pjsoVLSn5sZDhVjBCAac9R0h4Zpu67UUrYBTMDgl5LECpnkD5BYV6GGHBLjKQp8Cok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046331; c=relaxed/simple;
	bh=v1j/kWGh5Fdge5Z3utKuWQ6cUpvTmTC7fPvZRsihhpM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MNrxrKarwepsblAYRn+xuoZhtB+TXrkQCST4qf3SmwpbNeS5Y1Jdg8xLHplXc6XW71Q154S5kB+IEqm+MgGDILXc5pvNqTRcva+4iLFV41q8qIXKp/vwX+Ahrll+SL+qR2xwnRtPjmt72AYxYIw4XwSN1s7wcpanV1d97p4Vge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSPe1D4t; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769046329; x=1800582329;
  h=date:from:to:cc:subject:message-id;
  bh=v1j/kWGh5Fdge5Z3utKuWQ6cUpvTmTC7fPvZRsihhpM=;
  b=GSPe1D4tAzOIxUbCFgQxizsfOK8qNzgs0oXLnjOdGQKltgfV88msrrUl
   YPwDuuAuuHgPqMKPECzX5Vsm9rSjlCl2XBRGWVgGvhsTOm9AvCQo0JOPf
   HHqmF6WOuTnb3NuYiqlynqWc8OfWNBae0OgDM2ZCo6p0j0ArSAMborrzs
   O/2yzJS/8trBnCWUTeTRB74+WGlsrhwQESAhPWkR2e7Vf16JbTBOelEvm
   lspVf4cqtO1ooqXNsBXEHaL16Z4pv7SKVS2lHwI/iio1tcezoT5J6gehb
   McG1M1WeDlfhdgIBvuDm2OgqUSs9o+T1q8Rq4ZEKUCEYrzh1L00Rg39QZ
   Q==;
X-CSE-ConnectionGUID: /509fKg4T3e2NyCXvaCDkA==
X-CSE-MsgGUID: 6oO9DYasSzOGIzHdSgrw9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70450205"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70450205"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:45:28 -0800
X-CSE-ConnectionGUID: YXr3Wb2NT3G/uDXspF7QSg==
X-CSE-MsgGUID: VtGxKOXdRGaT8tVWsGc8pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211114655"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2026 17:45:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vijlD-00000000SHT-47hz;
	Thu, 22 Jan 2026 01:45:23 +0000
Date: Thu, 22 Jan 2026 09:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 de284988c270cc16a3fb41f8f6955394d4af2a12
Message-ID: <202601220921.pz7dzcqI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30882-lists,linux-gpio=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 088DB607CB
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: de284988c270cc16a3fb41f8f6955394d4af2a12  dt-bindings: eeprom: at24: Add compatible for Puya P24C128F

elapsed time: 938m

configs tested: 290
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260122    gcc-15.2.0
arc                   randconfig-002-20260122    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         axm55xx_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                   randconfig-001-20260122    gcc-15.2.0
arm                   randconfig-002-20260122    gcc-15.2.0
arm                   randconfig-003-20260122    gcc-15.2.0
arm                   randconfig-004-20260122    gcc-15.2.0
arm                         s3c6400_defconfig    gcc-15.2.0
arm                         socfpga_defconfig    gcc-15.2.0
arm                        spear3xx_defconfig    clang-22
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260121    gcc-15.2.0
arm64                 randconfig-001-20260122    gcc-15.2.0
arm64                 randconfig-002-20260121    gcc-15.2.0
arm64                 randconfig-002-20260122    gcc-15.2.0
arm64                 randconfig-003-20260121    gcc-15.2.0
arm64                 randconfig-003-20260122    gcc-15.2.0
arm64                 randconfig-004-20260121    gcc-15.2.0
arm64                 randconfig-004-20260122    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-15.2.0
csky                  randconfig-001-20260122    gcc-15.2.0
csky                  randconfig-002-20260121    gcc-15.2.0
csky                  randconfig-002-20260122    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260121    gcc-15.2.0
hexagon               randconfig-001-20260122    gcc-15.2.0
hexagon               randconfig-002-20260121    gcc-15.2.0
hexagon               randconfig-002-20260122    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260121    clang-20
i386        buildonly-randconfig-001-20260122    clang-20
i386        buildonly-randconfig-002-20260121    clang-20
i386        buildonly-randconfig-002-20260122    clang-20
i386        buildonly-randconfig-003-20260121    clang-20
i386        buildonly-randconfig-003-20260122    clang-20
i386        buildonly-randconfig-004-20260121    clang-20
i386        buildonly-randconfig-004-20260122    clang-20
i386        buildonly-randconfig-005-20260121    clang-20
i386        buildonly-randconfig-005-20260122    clang-20
i386        buildonly-randconfig-006-20260121    clang-20
i386        buildonly-randconfig-006-20260122    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260121    clang-20
i386                  randconfig-001-20260122    gcc-14
i386                  randconfig-002-20260121    clang-20
i386                  randconfig-002-20260122    gcc-14
i386                  randconfig-003-20260121    clang-20
i386                  randconfig-003-20260122    gcc-14
i386                  randconfig-004-20260121    clang-20
i386                  randconfig-004-20260122    gcc-14
i386                  randconfig-005-20260121    clang-20
i386                  randconfig-005-20260122    gcc-14
i386                  randconfig-006-20260121    clang-20
i386                  randconfig-006-20260122    gcc-14
i386                  randconfig-007-20260121    clang-20
i386                  randconfig-007-20260122    gcc-14
i386                  randconfig-011-20260121    gcc-14
i386                  randconfig-011-20260122    clang-20
i386                  randconfig-012-20260121    gcc-14
i386                  randconfig-012-20260122    clang-20
i386                  randconfig-013-20260121    gcc-14
i386                  randconfig-013-20260122    clang-20
i386                  randconfig-014-20260121    gcc-14
i386                  randconfig-014-20260122    clang-20
i386                  randconfig-015-20260121    gcc-14
i386                  randconfig-015-20260122    clang-20
i386                  randconfig-016-20260121    gcc-14
i386                  randconfig-016-20260122    clang-20
i386                  randconfig-017-20260121    gcc-14
i386                  randconfig-017-20260122    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260121    gcc-15.2.0
loongarch             randconfig-001-20260122    gcc-15.2.0
loongarch             randconfig-002-20260121    gcc-15.2.0
loongarch             randconfig-002-20260122    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    gcc-15.2.0
m68k                       m5475evb_defconfig    gcc-15.2.0
m68k                            mac_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       bmips_be_defconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                         db1xxx_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260121    gcc-15.2.0
nios2                 randconfig-001-20260122    gcc-15.2.0
nios2                 randconfig-002-20260121    gcc-15.2.0
nios2                 randconfig-002-20260122    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260121    gcc-9.5.0
parisc                randconfig-001-20260122    gcc-10.5.0
parisc                randconfig-002-20260121    gcc-9.5.0
parisc                randconfig-002-20260122    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                    amigaone_defconfig    clang-22
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                          g5_defconfig    clang-22
powerpc                       holly_defconfig    clang-22
powerpc                      mgcoge_defconfig    clang-22
powerpc                     rainier_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260121    gcc-9.5.0
powerpc               randconfig-001-20260122    gcc-10.5.0
powerpc               randconfig-002-20260121    gcc-9.5.0
powerpc               randconfig-002-20260122    gcc-10.5.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260121    gcc-9.5.0
powerpc64             randconfig-001-20260122    gcc-10.5.0
powerpc64             randconfig-002-20260121    gcc-9.5.0
powerpc64             randconfig-002-20260122    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260121    clang-16
riscv                 randconfig-001-20260122    clang-18
riscv                 randconfig-002-20260121    clang-16
riscv                 randconfig-002-20260122    clang-18
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260121    clang-16
s390                  randconfig-001-20260122    clang-18
s390                  randconfig-002-20260121    clang-16
s390                  randconfig-002-20260122    clang-18
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20260121    clang-16
sh                    randconfig-001-20260122    clang-18
sh                    randconfig-002-20260121    clang-16
sh                    randconfig-002-20260122    clang-18
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7712_defconfig    gcc-15.2.0
sh                           se7721_defconfig    gcc-15.2.0
sh                           se7722_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    gcc-15.2.0
sh                   sh7724_generic_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260121    gcc-8.5.0
sparc                 randconfig-001-20260122    gcc-8.5.0
sparc                 randconfig-002-20260121    gcc-8.5.0
sparc                 randconfig-002-20260122    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260121    gcc-8.5.0
sparc64               randconfig-001-20260122    gcc-8.5.0
sparc64               randconfig-002-20260121    gcc-8.5.0
sparc64               randconfig-002-20260122    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260121    gcc-8.5.0
um                    randconfig-001-20260122    gcc-8.5.0
um                    randconfig-002-20260121    gcc-8.5.0
um                    randconfig-002-20260122    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260121    clang-20
x86_64      buildonly-randconfig-001-20260122    clang-20
x86_64      buildonly-randconfig-002-20260121    clang-20
x86_64      buildonly-randconfig-002-20260122    clang-20
x86_64      buildonly-randconfig-003-20260121    clang-20
x86_64      buildonly-randconfig-003-20260122    clang-20
x86_64      buildonly-randconfig-004-20260121    clang-20
x86_64      buildonly-randconfig-004-20260122    clang-20
x86_64      buildonly-randconfig-005-20260121    clang-20
x86_64      buildonly-randconfig-005-20260122    clang-20
x86_64      buildonly-randconfig-006-20260121    clang-20
x86_64      buildonly-randconfig-006-20260122    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260121    clang-20
x86_64                randconfig-001-20260122    clang-20
x86_64                randconfig-002-20260121    clang-20
x86_64                randconfig-002-20260122    clang-20
x86_64                randconfig-003-20260121    clang-20
x86_64                randconfig-003-20260122    clang-20
x86_64                randconfig-004-20260121    clang-20
x86_64                randconfig-004-20260122    clang-20
x86_64                randconfig-005-20260121    clang-20
x86_64                randconfig-005-20260122    clang-20
x86_64                randconfig-006-20260121    clang-20
x86_64                randconfig-006-20260122    clang-20
x86_64                randconfig-011-20260121    gcc-14
x86_64                randconfig-011-20260122    clang-20
x86_64                randconfig-012-20260121    gcc-14
x86_64                randconfig-012-20260122    clang-20
x86_64                randconfig-013-20260121    gcc-14
x86_64                randconfig-013-20260122    clang-20
x86_64                randconfig-014-20260121    gcc-14
x86_64                randconfig-014-20260122    clang-20
x86_64                randconfig-015-20260121    gcc-14
x86_64                randconfig-015-20260122    clang-20
x86_64                randconfig-016-20260121    gcc-14
x86_64                randconfig-016-20260122    clang-20
x86_64                randconfig-071-20260122    clang-20
x86_64                randconfig-072-20260122    clang-20
x86_64                randconfig-073-20260122    clang-20
x86_64                randconfig-074-20260122    clang-20
x86_64                randconfig-075-20260122    clang-20
x86_64                randconfig-076-20260122    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260121    gcc-8.5.0
xtensa                randconfig-001-20260122    gcc-8.5.0
xtensa                randconfig-002-20260121    gcc-8.5.0
xtensa                randconfig-002-20260122    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

