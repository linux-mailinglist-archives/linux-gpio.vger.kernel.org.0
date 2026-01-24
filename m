Return-Path: <linux-gpio+bounces-31030-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHmhET1kdGnb5AAAu9opvQ
	(envelope-from <linux-gpio+bounces-31030-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 07:18:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2D7CA41
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 07:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82C3D30097F8
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 06:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FF41400C;
	Sat, 24 Jan 2026 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ld9KkVDc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507319CC0C
	for <linux-gpio@vger.kernel.org>; Sat, 24 Jan 2026 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769235421; cv=none; b=b2o8GHF8zfBG8T2Z80DNetWm7z7dh/tPSPI8KL/1VguAucWvc0g+ni7uVzYSgq8yj0wsD2zBb0nJBmAn9iS/aC63P/l04luzF001AAdyWQYZ3REKMB9UUznDldmpgORxltApQWrvYJVpnSVzh3/is7y9N40ldgYYJarP03U8rXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769235421; c=relaxed/simple;
	bh=5HDRhEq/9njbAzYQEAXozLZKomXfc6plNjwTR/dQ6kc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rrczOfzbyoWkuTtWOULqWSHhEC01ykgp9ltomo0qkVUZr9fn93AWq5rYyX+2mZdMaee6HJMTANYM64q83SLvg/dNGfVLzopfPgJfGAJ6yZwRT3y8JJ7u5ZlRYY6cxwc7mNvBVdOcBCQrsDHOVb5rj9s8eM8XBLf0XAYGtfYZ330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ld9KkVDc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769235420; x=1800771420;
  h=date:from:to:cc:subject:message-id;
  bh=5HDRhEq/9njbAzYQEAXozLZKomXfc6plNjwTR/dQ6kc=;
  b=ld9KkVDcbTv5awtMz4k+eiqgIr+rT22DQxqmFv8kMO6pAO8/v3MmmYD1
   +3KLqy+vsJz4CCarOkwcCbZy7ws04+LHijtYA4YMLFSyZ/fRN7FUFLtlh
   5nhtw6sc9ur657LKOeJxMdPDpjBYeWwS5gOKGRSQW8LRo9UUoJ5FfIUa9
   cP+NJaAAU6bz2FDUWvRDu5F/JZ0d0JJ5QPyuoiNvEPXJMF1fVSqXrl8C1
   +Cu/RbCEpbkTagW97ecZ6N96exD2hd4e+iHAz8yaFpiIIRPBbVlDdn7Cy
   gpl4mpPOYd1kE+MiX7IaS00Qqy4pPK9rWufauO0SdAyydXE2O8TRovWJl
   Q==;
X-CSE-ConnectionGUID: IC5xQpOhT8em7axnXUnLWA==
X-CSE-MsgGUID: NKqi3mDBSkmPOTphTnZaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70389956"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70389956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 22:16:59 -0800
X-CSE-ConnectionGUID: 8o/Pjio0T4ijElJCA9PG2Q==
X-CSE-MsgGUID: VPKkJHmVSJ+MyqAki5Ef1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211705661"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2026 22:16:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjWx4-00000000UxO-2Apr;
	Sat, 24 Jan 2026 06:16:54 +0000
Date: Sat, 24 Jan 2026 14:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-next] BUILD SUCCESS
 52e7b5bd62bab3851f25d8b70ad7eae9e94aba60
Message-ID: <202601241429.wEkn92E9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-31030-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EF2D7CA41
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: 52e7b5bd62bab3851f25d8b70ad7eae9e94aba60  power: sequencing: Add the Power Sequencing driver for the PCIe M.2 connectors

elapsed time: 1229m

configs tested: 306
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
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                      axs103_smp_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    clang-17
arc                        nsim_700_defconfig    gcc-15.2.0
arc                   randconfig-001-20260123    gcc-10.5.0
arc                   randconfig-001-20260124    clang-18
arc                   randconfig-002-20260123    gcc-10.5.0
arc                   randconfig-002-20260124    clang-18
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          gemini_defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    gcc-15.2.0
arm                         lpc32xx_defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    clang-16
arm                          pxa168_defconfig    clang-16
arm                          pxa168_defconfig    gcc-15.2.0
arm                          pxa910_defconfig    gcc-15.2.0
arm                   randconfig-001-20260123    gcc-10.5.0
arm                   randconfig-001-20260124    clang-18
arm                   randconfig-002-20260123    gcc-10.5.0
arm                   randconfig-002-20260124    clang-18
arm                   randconfig-003-20260123    gcc-10.5.0
arm                   randconfig-003-20260124    clang-18
arm                   randconfig-004-20260123    gcc-10.5.0
arm                   randconfig-004-20260124    clang-18
arm                           sama7_defconfig    clang-16
arm                        spear3xx_defconfig    clang-17
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           tegra_defconfig    gcc-15.2.0
arm                       versatile_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    gcc-15.2.0
arm64                            alldefconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260124    gcc-15.2.0
arm64                 randconfig-002-20260124    gcc-15.2.0
arm64                 randconfig-003-20260124    gcc-15.2.0
arm64                 randconfig-004-20260124    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260124    gcc-15.2.0
csky                  randconfig-002-20260124    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260123    gcc-12.5.0
hexagon               randconfig-001-20260124    gcc-15.2.0
hexagon               randconfig-002-20260123    gcc-12.5.0
hexagon               randconfig-002-20260124    gcc-15.2.0
i386                             alldefconfig    clang-16
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260123    clang-20
i386        buildonly-randconfig-001-20260124    gcc-14
i386        buildonly-randconfig-002-20260123    clang-20
i386        buildonly-randconfig-002-20260124    gcc-14
i386        buildonly-randconfig-003-20260123    clang-20
i386        buildonly-randconfig-003-20260124    gcc-14
i386        buildonly-randconfig-004-20260123    clang-20
i386        buildonly-randconfig-004-20260124    gcc-14
i386        buildonly-randconfig-005-20260123    clang-20
i386        buildonly-randconfig-005-20260124    gcc-14
i386        buildonly-randconfig-006-20260123    clang-20
i386        buildonly-randconfig-006-20260124    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260123    gcc-14
i386                  randconfig-001-20260124    gcc-14
i386                  randconfig-002-20260123    gcc-14
i386                  randconfig-002-20260124    gcc-14
i386                  randconfig-003-20260123    gcc-14
i386                  randconfig-003-20260124    gcc-14
i386                  randconfig-004-20260123    gcc-14
i386                  randconfig-004-20260124    gcc-14
i386                  randconfig-005-20260123    gcc-14
i386                  randconfig-005-20260124    gcc-14
i386                  randconfig-006-20260123    gcc-14
i386                  randconfig-006-20260124    gcc-14
i386                  randconfig-007-20260123    gcc-14
i386                  randconfig-007-20260124    gcc-14
i386                  randconfig-011-20260124    clang-20
i386                  randconfig-012-20260124    clang-20
i386                  randconfig-013-20260124    clang-20
i386                  randconfig-014-20260124    clang-20
i386                  randconfig-015-20260124    clang-20
i386                  randconfig-016-20260124    clang-20
i386                  randconfig-017-20260124    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260123    gcc-12.5.0
loongarch             randconfig-001-20260124    gcc-15.2.0
loongarch             randconfig-002-20260123    gcc-12.5.0
loongarch             randconfig-002-20260124    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5475evb_defconfig    gcc-15.2.0
m68k                           virt_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                         db1xxx_defconfig    gcc-15.2.0
mips                malta_qemu_32r6_defconfig    clang-16
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
mips                  maltasmvp_eva_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    gcc-15.2.0
mips                    maltaup_xpa_defconfig    gcc-15.2.0
mips                        qi_lb60_defconfig    clang-16
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260123    gcc-12.5.0
nios2                 randconfig-001-20260124    gcc-15.2.0
nios2                 randconfig-002-20260123    gcc-12.5.0
nios2                 randconfig-002-20260124    gcc-15.2.0
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
parisc                randconfig-001-20260123    gcc-12.5.0
parisc                randconfig-001-20260124    gcc-8.5.0
parisc                randconfig-002-20260123    gcc-12.5.0
parisc                randconfig-002-20260124    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                     akebono_defconfig    clang-17
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                 linkstation_defconfig    gcc-15.2.0
powerpc                   microwatt_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                      pmac32_defconfig    gcc-15.2.0
powerpc                     ppa8548_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260123    gcc-12.5.0
powerpc               randconfig-001-20260124    gcc-8.5.0
powerpc               randconfig-002-20260123    gcc-12.5.0
powerpc               randconfig-002-20260124    gcc-8.5.0
powerpc                     redwood_defconfig    clang-17
powerpc                     skiroot_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260123    gcc-12.5.0
powerpc64             randconfig-001-20260124    gcc-8.5.0
powerpc64             randconfig-002-20260123    gcc-12.5.0
powerpc64             randconfig-002-20260124    gcc-8.5.0
riscv                            alldefconfig    clang-17
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    clang-17
riscv                 randconfig-001-20260123    clang-22
riscv                 randconfig-001-20260124    gcc-8.5.0
riscv                 randconfig-002-20260124    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260123    clang-22
s390                  randconfig-001-20260124    gcc-8.5.0
s390                  randconfig-002-20260123    clang-22
s390                  randconfig-002-20260124    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.2.0
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                            migor_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    clang-16
sh                    randconfig-001-20260123    clang-22
sh                    randconfig-001-20260124    gcc-8.5.0
sh                    randconfig-002-20260123    clang-22
sh                    randconfig-002-20260124    gcc-8.5.0
sh                           se7721_defconfig    gcc-15.2.0
sh                   secureedge5410_defconfig    clang-16
sh                           sh2007_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260123    gcc-13.4.0
sparc                 randconfig-001-20260124    gcc-13.4.0
sparc                 randconfig-002-20260123    gcc-13.4.0
sparc                 randconfig-002-20260124    gcc-13.4.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260123    gcc-13.4.0
sparc64               randconfig-001-20260124    gcc-13.4.0
sparc64               randconfig-002-20260123    gcc-13.4.0
sparc64               randconfig-002-20260124    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260123    gcc-13.4.0
um                    randconfig-001-20260124    gcc-13.4.0
um                    randconfig-002-20260123    gcc-13.4.0
um                    randconfig-002-20260124    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-15.2.0
x86_64                           alldefconfig    gcc-15.2.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260124    clang-20
x86_64      buildonly-randconfig-002-20260124    clang-20
x86_64      buildonly-randconfig-003-20260124    clang-20
x86_64      buildonly-randconfig-004-20260124    clang-20
x86_64      buildonly-randconfig-005-20260124    clang-20
x86_64      buildonly-randconfig-006-20260124    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260123    clang-20
x86_64                randconfig-001-20260124    gcc-13
x86_64                randconfig-002-20260123    gcc-14
x86_64                randconfig-002-20260124    gcc-13
x86_64                randconfig-003-20260123    gcc-14
x86_64                randconfig-003-20260124    gcc-13
x86_64                randconfig-004-20260123    gcc-14
x86_64                randconfig-004-20260124    gcc-13
x86_64                randconfig-005-20260123    gcc-14
x86_64                randconfig-005-20260124    gcc-13
x86_64                randconfig-006-20260123    gcc-14
x86_64                randconfig-006-20260124    gcc-13
x86_64                randconfig-011-20260123    gcc-14
x86_64                randconfig-011-20260124    gcc-12
x86_64                randconfig-012-20260123    gcc-14
x86_64                randconfig-012-20260124    gcc-12
x86_64                randconfig-013-20260123    gcc-14
x86_64                randconfig-013-20260124    gcc-12
x86_64                randconfig-014-20260123    gcc-14
x86_64                randconfig-014-20260124    gcc-12
x86_64                randconfig-015-20260123    gcc-14
x86_64                randconfig-015-20260124    gcc-12
x86_64                randconfig-016-20260123    gcc-14
x86_64                randconfig-016-20260124    gcc-12
x86_64                randconfig-071-20260123    clang-20
x86_64                randconfig-071-20260124    gcc-14
x86_64                randconfig-072-20260123    clang-20
x86_64                randconfig-072-20260124    gcc-14
x86_64                randconfig-073-20260123    clang-20
x86_64                randconfig-073-20260124    gcc-14
x86_64                randconfig-074-20260123    clang-20
x86_64                randconfig-074-20260124    gcc-14
x86_64                randconfig-075-20260123    clang-20
x86_64                randconfig-075-20260124    gcc-14
x86_64                randconfig-076-20260123    clang-20
x86_64                randconfig-076-20260124    gcc-14
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
xtensa                  nommu_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260123    gcc-13.4.0
xtensa                randconfig-001-20260124    gcc-13.4.0
xtensa                randconfig-002-20260123    gcc-13.4.0
xtensa                randconfig-002-20260124    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

