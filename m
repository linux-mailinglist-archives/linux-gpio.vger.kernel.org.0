Return-Path: <linux-gpio+bounces-31302-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JiBHxV0e2mMEgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31302-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 15:52:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C26EB12CB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 15:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE9E5300337A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 14:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18EF32E724;
	Thu, 29 Jan 2026 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1e7M0Io"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DA020E023
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698322; cv=none; b=LAQpSdB1r971dqcup1UmCPRQBY70r1McTcd1KnyBJNGm72dzhY1+h82RjstkMjeCef+nybpIMaxkENhU9BznowmYozGuF+t+aYOJUbmy7GErZFs6HGqRNwD8tDqfrEDChUMAJWbgnG30x6a3X+Hk1nnceGRsFoQuYO5nDRcd0qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698322; c=relaxed/simple;
	bh=x1o101CmChdP8/r2/eZ+KXxszBUQ+un/EpAXlU2Qyyg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BEQ/8fbGJphRyZ5k+ljq9df2A2LPHnuUlyRd4yPzIWsLuugN8OM3wlKp2HgUAJezfW+enNzFHNSSMvoiTtkkWNG52m5JIl3wC9xeG709wm9OMX16oMy7qvWxs7XwQLzqsvvliaN4oD4oEDlat/s70IQYSrePeLu53Gne9Hx4BRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1e7M0Io; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769698321; x=1801234321;
  h=date:from:to:cc:subject:message-id;
  bh=x1o101CmChdP8/r2/eZ+KXxszBUQ+un/EpAXlU2Qyyg=;
  b=Z1e7M0IorpH16BP9h2WgHQzeMz3grtoSJLamlYjQQ0WjJZ82EG9i46xW
   AUoivDNvELOQLSM3sLwNn2ncVL9umQk7740ByuLcva1kZcFxnhooN2ZZ1
   +VV107tavZLq6v2L3KBxXcv40199el2mDVrwpn9t2q2qNMUIxrKK14gan
   XKse1IUg4zg3Jsk10pswxtCSC7VqREGAS+r6Z7eA1KSGfqcQ4auidBXHY
   EwNBfTjKtMWokA5t4AGcQVMLWS9o/tn0sq/oN+AF9KjUseJYUMcgEmp1H
   D2at2YtY4+XE3Z6p9NAL+IsrpCvAmh+ThNHz2CbieT5n4BXuCDCDs+2ai
   Q==;
X-CSE-ConnectionGUID: 4fH3tWWdStqWiFhCOsaFqQ==
X-CSE-MsgGUID: yhxUdVBITuSztUEr7UHtbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70991519"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="70991519"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 06:52:01 -0800
X-CSE-ConnectionGUID: 5tHZbwQATVW9NH2tBmy14Q==
X-CSE-MsgGUID: Cd5xXfdsTOa5NzclzWTHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="246222530"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2026 06:51:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlTNE-00000000bZ6-2hpH;
	Thu, 29 Jan 2026 14:51:56 +0000
Date: Thu, 29 Jan 2026 22:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 e64d1cb21a1c6ecd51bc1c94c83f6fc656f7c94d
Message-ID: <202601292222.6gREsEiO-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31302-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C26EB12CB
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: e64d1cb21a1c6ecd51bc1c94c83f6fc656f7c94d  gpiolib: acpi: Fix potential out-of-boundary left shift

elapsed time: 1441m

configs tested: 210
configs skipped: 5

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
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260129    clang-18
arc                   randconfig-002-20260129    clang-18
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         at91_dt_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                       imx_v6_v7_defconfig    clang-22
arm                         mv78xx0_defconfig    clang-22
arm                        mvebu_v5_defconfig    clang-22
arm                   randconfig-001-20260129    clang-18
arm                   randconfig-002-20260129    clang-18
arm                   randconfig-003-20260129    clang-18
arm                   randconfig-004-20260129    clang-18
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260129    gcc-11.5.0
arm64                 randconfig-002-20260129    gcc-11.5.0
arm64                 randconfig-003-20260129    gcc-11.5.0
arm64                 randconfig-004-20260129    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260129    gcc-11.5.0
csky                  randconfig-002-20260129    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260129    clang-22
hexagon               randconfig-002-20260129    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260129    clang-20
i386        buildonly-randconfig-002-20260129    clang-20
i386        buildonly-randconfig-003-20260129    clang-20
i386        buildonly-randconfig-004-20260129    clang-20
i386        buildonly-randconfig-005-20260129    clang-20
i386        buildonly-randconfig-006-20260129    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260129    clang-20
i386                  randconfig-002-20260129    clang-20
i386                  randconfig-003-20260129    clang-20
i386                  randconfig-004-20260129    clang-20
i386                  randconfig-005-20260129    clang-20
i386                  randconfig-006-20260129    clang-20
i386                  randconfig-007-20260129    clang-20
i386                  randconfig-011-20260129    clang-20
i386                  randconfig-012-20260129    clang-20
i386                  randconfig-013-20260129    clang-20
i386                  randconfig-014-20260129    clang-20
i386                  randconfig-015-20260129    clang-20
i386                  randconfig-016-20260129    clang-20
i386                  randconfig-017-20260129    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260129    clang-22
loongarch             randconfig-002-20260129    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    clang-22
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip28_defconfig    clang-22
mips                      pic32mzda_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260129    clang-22
nios2                 randconfig-002-20260129    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260129    gcc-8.5.0
parisc                randconfig-002-20260129    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     ep8248e_defconfig    clang-22
powerpc               randconfig-001-20260129    gcc-8.5.0
powerpc               randconfig-002-20260129    gcc-8.5.0
powerpc                    sam440ep_defconfig    clang-22
powerpc64             randconfig-001-20260129    gcc-8.5.0
powerpc64             randconfig-002-20260129    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20260129    gcc-15.2.0
riscv                 randconfig-002-20260129    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260129    gcc-15.2.0
s390                  randconfig-002-20260129    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260129    gcc-15.2.0
sh                    randconfig-002-20260129    gcc-15.2.0
sh                          rsk7201_defconfig    clang-22
sh                           se7705_defconfig    clang-22
sh                           se7722_defconfig    clang-22
sh                             shx3_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260129    gcc-15.2.0
sparc                 randconfig-002-20260129    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260129    gcc-15.2.0
sparc64               randconfig-002-20260129    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260129    gcc-15.2.0
um                    randconfig-002-20260129    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260129    gcc-13
x86_64      buildonly-randconfig-002-20260129    gcc-13
x86_64      buildonly-randconfig-003-20260129    gcc-13
x86_64      buildonly-randconfig-004-20260129    gcc-13
x86_64      buildonly-randconfig-005-20260129    gcc-13
x86_64      buildonly-randconfig-006-20260129    gcc-13
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260129    clang-20
x86_64                randconfig-002-20260129    clang-20
x86_64                randconfig-003-20260129    clang-20
x86_64                randconfig-004-20260129    clang-20
x86_64                randconfig-005-20260129    clang-20
x86_64                randconfig-006-20260129    clang-20
x86_64                randconfig-011-20260129    clang-20
x86_64                randconfig-012-20260129    clang-20
x86_64                randconfig-013-20260129    clang-20
x86_64                randconfig-014-20260129    clang-20
x86_64                randconfig-015-20260129    clang-20
x86_64                randconfig-016-20260129    clang-20
x86_64                randconfig-071-20260129    gcc-14
x86_64                randconfig-072-20260129    gcc-14
x86_64                randconfig-073-20260129    gcc-14
x86_64                randconfig-074-20260129    gcc-14
x86_64                randconfig-075-20260129    gcc-14
x86_64                randconfig-076-20260129    gcc-14
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
xtensa                randconfig-001-20260129    gcc-15.2.0
xtensa                randconfig-002-20260129    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

