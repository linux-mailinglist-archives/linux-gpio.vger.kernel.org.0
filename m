Return-Path: <linux-gpio+bounces-34660-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIy7DT1V0GkA6gYAu9opvQ
	(envelope-from <linux-gpio+bounces-34660-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 02:03:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBBB3992BA
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 02:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15FCC300F5F9
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 00:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C34AF4F1;
	Sat,  4 Apr 2026 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E67yL9uj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29E8F49
	for <linux-gpio@vger.kernel.org>; Sat,  4 Apr 2026 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775260974; cv=none; b=d/JnnjEgINn6Ldty3p9Hsk7f4mPctoPyCYrTFrRCxfGmO7gu/wuutLpisajBSbiuKbNTdg2+O/DDh/Wi1a1pu1ak66Z9PJ7i6q/VN170TlXg/WAQ2mMHxQ00RHKFcoOD1UtfDVTsGJYaTtc9jsoPAuFcbujteJcLWQ0uktuCDgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775260974; c=relaxed/simple;
	bh=jwYOO6MkG/uqYZ86HebJDeKiiKkQVLhzqknzV4Z467s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R0VzACo5kDYcdTAGHcde6nqq5aiVCLCtYnKLW8uHn6WiP9U4bAPl/Kw0ssxlUOtQy6Qdr95Tho9WbkqyyTZmDw4f0ECn+Bpm7JzLCsgzOtgXkgpdNPXeUtp58/JKa5ZDJs0VZe4GG1EONfijTcIgbNPPLsEdkP/SkybHCOaD7Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E67yL9uj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775260972; x=1806796972;
  h=date:from:to:cc:subject:message-id;
  bh=jwYOO6MkG/uqYZ86HebJDeKiiKkQVLhzqknzV4Z467s=;
  b=E67yL9uj/hZziYPbqzvmWVrc7FApTUTuhbTZ9Jb3FOMhR5nhXI9b4gL+
   ozCcvG3mFw1jVpvb0nKxGmgQdgYqdmH9pVf7but2v8qarLyT1y+o/ifte
   dLtfW1mvpiBTRPqcc0oEpur21af4RzLOipkTnQCd9Xi3c89lc69ikKbgU
   Ees9o95iDFjhQYJr7Y73cAPb/l2Pzirl/hYFt/x+zysGQ2Z8r74jQW3Ra
   ydza7lXFgLYXT0z2JCYYcsCxSFcZCE730vw9YiaCQ8c7IR4lmiOOH0/kt
   zf8o0OVtEGJj76X6c3Ct+avkaN/20HFWx5MHcM0dAY7Jvy5bAnMc56um0
   g==;
X-CSE-ConnectionGUID: Li750+uiTG22n4gu3pVhow==
X-CSE-MsgGUID: 7I/dsao0TGaXTWdvCzn0gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76440100"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="76440100"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 17:02:52 -0700
X-CSE-ConnectionGUID: c4dxEHsfSnK5FOVp41akfA==
X-CSE-MsgGUID: sQkIA/3ZS3yJgJioNCJPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="223024948"
Received: from lkp-server01.sh.intel.com (HELO 3afb7d003cac) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Apr 2026 17:02:50 -0700
Received: from kbuild by 3afb7d003cac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8oTQ-000000000MH-0tOB;
	Sat, 04 Apr 2026 00:02:48 +0000
Date: Sat, 04 Apr 2026 08:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 779ae2232cd1fd80661327e503606df004b4cda4
Message-ID: <202604040837.3z4388pU-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-34660-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 8DBBB3992BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 779ae2232cd1fd80661327e503606df004b4cda4  gpiolib: Make deferral warnings debug messages

elapsed time: 745m

configs tested: 292
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
arc                   randconfig-001-20260403    gcc-10.5.0
arc                   randconfig-001-20260403    gcc-8.5.0
arc                   randconfig-001-20260404    gcc-15.2.0
arc                   randconfig-002-20260403    gcc-10.5.0
arc                   randconfig-002-20260403    gcc-8.5.0
arc                   randconfig-002-20260404    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260403    clang-23
arm                   randconfig-001-20260403    gcc-10.5.0
arm                   randconfig-001-20260404    gcc-15.2.0
arm                   randconfig-002-20260403    gcc-10.5.0
arm                   randconfig-002-20260404    gcc-15.2.0
arm                   randconfig-003-20260403    gcc-10.5.0
arm                   randconfig-003-20260403    gcc-15.2.0
arm                   randconfig-003-20260404    gcc-15.2.0
arm                   randconfig-004-20260403    gcc-10.5.0
arm                   randconfig-004-20260403    gcc-8.5.0
arm                   randconfig-004-20260404    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260403    gcc-13.4.0
arm64                 randconfig-001-20260404    gcc-15.2.0
arm64                 randconfig-002-20260403    gcc-13.4.0
arm64                 randconfig-002-20260404    gcc-15.2.0
arm64                 randconfig-003-20260403    gcc-13.4.0
arm64                 randconfig-003-20260404    gcc-15.2.0
arm64                 randconfig-004-20260403    gcc-13.4.0
arm64                 randconfig-004-20260404    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260403    gcc-13.4.0
csky                  randconfig-001-20260404    gcc-15.2.0
csky                  randconfig-002-20260403    gcc-13.4.0
csky                  randconfig-002-20260404    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-001-20260404    gcc-15.2.0
hexagon               randconfig-002-20260403    clang-23
hexagon               randconfig-002-20260404    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-001-20260404    clang-20
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-002-20260404    clang-20
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-003-20260404    clang-20
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-004-20260404    clang-20
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-005-20260404    clang-20
i386        buildonly-randconfig-006-20260403    gcc-14
i386        buildonly-randconfig-006-20260404    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260404    clang-20
i386                  randconfig-002-20260404    clang-20
i386                  randconfig-003-20260404    clang-20
i386                  randconfig-004-20260404    clang-20
i386                  randconfig-005-20260404    clang-20
i386                  randconfig-006-20260404    clang-20
i386                  randconfig-007-20260404    clang-20
i386                  randconfig-011-20260403    clang-20
i386                  randconfig-011-20260403    gcc-14
i386                  randconfig-011-20260404    clang-20
i386                  randconfig-012-20260403    clang-20
i386                  randconfig-012-20260404    clang-20
i386                  randconfig-013-20260403    clang-20
i386                  randconfig-013-20260404    clang-20
i386                  randconfig-014-20260403    clang-20
i386                  randconfig-014-20260404    clang-20
i386                  randconfig-015-20260403    clang-20
i386                  randconfig-015-20260404    clang-20
i386                  randconfig-016-20260403    clang-20
i386                  randconfig-016-20260403    gcc-14
i386                  randconfig-016-20260404    clang-20
i386                  randconfig-017-20260403    clang-20
i386                  randconfig-017-20260403    gcc-13
i386                  randconfig-017-20260404    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-001-20260404    gcc-15.2.0
loongarch             randconfig-002-20260403    clang-23
loongarch             randconfig-002-20260404    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                      mmu_defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-001-20260404    gcc-15.2.0
nios2                 randconfig-002-20260403    clang-23
nios2                 randconfig-002-20260404    gcc-15.2.0
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
parisc                randconfig-001-20260403    gcc-10.5.0
parisc                randconfig-001-20260403    gcc-11.5.0
parisc                randconfig-001-20260404    gcc-10.5.0
parisc                randconfig-002-20260403    gcc-10.5.0
parisc                randconfig-002-20260403    gcc-8.5.0
parisc                randconfig-002-20260404    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     mpc83xx_defconfig    clang-23
powerpc               randconfig-001-20260403    clang-23
powerpc               randconfig-001-20260403    gcc-10.5.0
powerpc               randconfig-001-20260404    gcc-10.5.0
powerpc               randconfig-002-20260403    gcc-10.5.0
powerpc               randconfig-002-20260403    gcc-13.4.0
powerpc               randconfig-002-20260404    gcc-10.5.0
powerpc                  storcenter_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260403    clang-23
powerpc64             randconfig-001-20260403    gcc-10.5.0
powerpc64             randconfig-001-20260404    gcc-10.5.0
powerpc64             randconfig-002-20260403    gcc-10.5.0
powerpc64             randconfig-002-20260404    gcc-10.5.0
riscv                            alldefconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260403    gcc-10.5.0
riscv                 randconfig-001-20260404    clang-20
riscv                 randconfig-002-20260403    gcc-10.5.0
riscv                 randconfig-002-20260404    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260403    clang-23
s390                  randconfig-001-20260404    clang-20
s390                  randconfig-002-20260403    clang-18
s390                  randconfig-002-20260404    clang-20
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                        apsh4ad0a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260403    gcc-13.4.0
sh                    randconfig-001-20260404    clang-20
sh                    randconfig-002-20260403    gcc-15.2.0
sh                    randconfig-002-20260404    clang-20
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260403    clang-20
sparc                 randconfig-001-20260403    gcc-8.5.0
sparc                 randconfig-001-20260404    clang-20
sparc                 randconfig-002-20260403    clang-20
sparc                 randconfig-002-20260403    gcc-15.2.0
sparc                 randconfig-002-20260404    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260403    clang-20
sparc64               randconfig-001-20260403    gcc-15.2.0
sparc64               randconfig-001-20260404    clang-20
sparc64               randconfig-002-20260403    clang-20
sparc64               randconfig-002-20260404    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260403    clang-20
um                    randconfig-001-20260404    clang-20
um                    randconfig-002-20260403    clang-20
um                    randconfig-002-20260403    gcc-14
um                    randconfig-002-20260404    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260403    clang-20
x86_64      buildonly-randconfig-001-20260404    gcc-13
x86_64      buildonly-randconfig-002-20260403    clang-20
x86_64      buildonly-randconfig-002-20260403    gcc-14
x86_64      buildonly-randconfig-002-20260404    gcc-13
x86_64      buildonly-randconfig-003-20260403    clang-20
x86_64      buildonly-randconfig-003-20260404    gcc-13
x86_64      buildonly-randconfig-004-20260403    clang-20
x86_64      buildonly-randconfig-004-20260403    gcc-14
x86_64      buildonly-randconfig-004-20260404    gcc-13
x86_64      buildonly-randconfig-005-20260403    clang-20
x86_64      buildonly-randconfig-005-20260404    gcc-13
x86_64      buildonly-randconfig-006-20260403    clang-20
x86_64      buildonly-randconfig-006-20260403    gcc-12
x86_64      buildonly-randconfig-006-20260404    gcc-13
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260403    clang-20
x86_64                randconfig-001-20260404    gcc-14
x86_64                randconfig-002-20260403    clang-20
x86_64                randconfig-002-20260404    gcc-14
x86_64                randconfig-003-20260403    clang-20
x86_64                randconfig-003-20260404    gcc-14
x86_64                randconfig-004-20260403    clang-20
x86_64                randconfig-004-20260404    gcc-14
x86_64                randconfig-005-20260403    clang-20
x86_64                randconfig-005-20260404    gcc-14
x86_64                randconfig-006-20260403    clang-20
x86_64                randconfig-006-20260404    gcc-14
x86_64                randconfig-011-20260403    gcc-14
x86_64                randconfig-011-20260404    gcc-14
x86_64                randconfig-012-20260403    gcc-14
x86_64                randconfig-012-20260404    gcc-14
x86_64                randconfig-013-20260403    gcc-14
x86_64                randconfig-013-20260404    gcc-14
x86_64                randconfig-014-20260403    gcc-14
x86_64                randconfig-014-20260404    gcc-14
x86_64                randconfig-015-20260403    gcc-14
x86_64                randconfig-015-20260404    gcc-14
x86_64                randconfig-016-20260403    gcc-14
x86_64                randconfig-016-20260404    gcc-14
x86_64                randconfig-071-20260403    gcc-14
x86_64                randconfig-071-20260404    gcc-14
x86_64                randconfig-072-20260403    gcc-14
x86_64                randconfig-072-20260404    gcc-14
x86_64                randconfig-073-20260403    gcc-14
x86_64                randconfig-073-20260404    gcc-14
x86_64                randconfig-074-20260403    gcc-14
x86_64                randconfig-074-20260404    gcc-14
x86_64                randconfig-075-20260403    gcc-14
x86_64                randconfig-075-20260404    gcc-14
x86_64                randconfig-076-20260403    gcc-14
x86_64                randconfig-076-20260404    gcc-14
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
xtensa                randconfig-001-20260403    clang-20
xtensa                randconfig-001-20260403    gcc-9.5.0
xtensa                randconfig-001-20260404    clang-20
xtensa                randconfig-002-20260403    clang-20
xtensa                randconfig-002-20260403    gcc-8.5.0
xtensa                randconfig-002-20260404    clang-20
xtensa                    xip_kc705_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

