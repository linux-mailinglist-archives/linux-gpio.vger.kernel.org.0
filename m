Return-Path: <linux-gpio+bounces-33664-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM0XCsqXuWkJKwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33664-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:04:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 943D12B091C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2670430E6794
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 17:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA5037BE8B;
	Tue, 17 Mar 2026 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCKbPbgp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31074364E9F
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 17:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769460; cv=none; b=BChflNMq1a9xDXvlBUGb4+QqEzS47m2wUb1t4YUjmAaZxR1e9QFB9x2br/VVXZeFaPNTbbTRtQV9raeQuDt0ucNEzraXj94n1t5H/mmKMKBYqR+1uZp0V8ETozsVaieIywyDb9VkahePWbHorgPP1oWUlPSvw1yX7v5U87S2E6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769460; c=relaxed/simple;
	bh=u1evdLCyIC0YjEUkM68OVoYi4e8azthFniHXdWxrHf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X9otpATgIbXRWyIBoG0LKMGFFZsNPmtQHn4dW+/VzqVlllK3hMTBnQzeEvjREnvnm8p60BeZMty6URYvxOdWMD2fW2DtCZMMyKSW2O+13+gWgNAAV9AKL+YEIZrLd3ZD83ukC2vCS2gxgSkWUhDL+iix9YySL3mWQsUbX6pPrXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCKbPbgp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773769458; x=1805305458;
  h=date:from:to:cc:subject:message-id;
  bh=u1evdLCyIC0YjEUkM68OVoYi4e8azthFniHXdWxrHf4=;
  b=HCKbPbgpG7nPy+EAGt8vKO7VRCLXhcAFaQvlb15aZqqsG79Uk7TT5mWa
   DxWrkPYzu6dnkCJJDdcsfxisgRhEBSmneyxHQTU62EvJKCFH+rahmTC+O
   FnOEuV8Vbj4Vv8jSpKbkPrXT3y12hrfseDeingg4iE2TMVMZr3KuXrTxu
   KVcKEAIG/uGMeYlnOt2+LLvUnWtWk7J6s7Jlx2wPPpw4+km2GCz+gM2oH
   s8pUecE+I4Wfa7kuZR+8MHfcU//MTBzhTYh44SDgsWSCQq7U0BPl5PhT8
   z130aohUIE/HtJfwMsy8zzmEtUFmjw/RqXToUQ3Y65hEpw+JW3AGUm9zR
   w==;
X-CSE-ConnectionGUID: fK39wAAaQ1G+pF6f299WCA==
X-CSE-MsgGUID: epjlID7YQzm9sKmPMqHqyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74889608"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74889608"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:44:17 -0700
X-CSE-ConnectionGUID: CwnoagfcRDyBxOOF2iT52g==
X-CSE-MsgGUID: 2DnUnVxLR56BzW14NyceeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219831413"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Mar 2026 10:44:16 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2YSj-000000001dR-2PCf;
	Tue, 17 Mar 2026 17:44:13 +0000
Date: Wed, 18 Mar 2026 01:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 a6e53d05ab849779d55ca985566a1da7f22435b9
Message-ID: <202603180101.roH6bo8U-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-33664-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 943D12B091C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: a6e53d05ab849779d55ca985566a1da7f22435b9  gpio: cs5535: use dynamically allocated priv struct

elapsed time: 1934m

configs tested: 169
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
arc                   randconfig-001-20260317    clang-23
arc                   randconfig-002-20260317    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                   randconfig-001-20260317    clang-23
arm                   randconfig-002-20260317    clang-23
arm                   randconfig-003-20260317    clang-23
arm                   randconfig-004-20260317    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260317    clang-23
arm64                 randconfig-002-20260317    clang-23
arm64                 randconfig-003-20260317    clang-23
arm64                 randconfig-004-20260317    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260317    clang-23
csky                  randconfig-002-20260317    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260317    gcc-8.5.0
hexagon               randconfig-002-20260317    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260317    clang-20
i386        buildonly-randconfig-002-20260317    clang-20
i386        buildonly-randconfig-003-20260317    clang-20
i386        buildonly-randconfig-004-20260317    clang-20
i386        buildonly-randconfig-005-20260317    clang-20
i386        buildonly-randconfig-006-20260317    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260317    gcc-14
i386                  randconfig-002-20260317    gcc-14
i386                  randconfig-003-20260317    gcc-14
i386                  randconfig-004-20260317    gcc-14
i386                  randconfig-005-20260317    gcc-14
i386                  randconfig-006-20260317    gcc-14
i386                  randconfig-007-20260317    gcc-14
i386                  randconfig-011-20260317    clang-20
i386                  randconfig-012-20260317    clang-20
i386                  randconfig-013-20260317    clang-20
i386                  randconfig-014-20260317    clang-20
i386                  randconfig-015-20260317    clang-20
i386                  randconfig-016-20260317    clang-20
i386                  randconfig-017-20260317    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260317    gcc-8.5.0
loongarch             randconfig-002-20260317    gcc-8.5.0
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
mips                 decstation_r4k_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260317    gcc-8.5.0
nios2                 randconfig-002-20260317    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260317    gcc-8.5.0
parisc                randconfig-002-20260317    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260317    gcc-8.5.0
powerpc               randconfig-002-20260317    gcc-8.5.0
powerpc64             randconfig-001-20260317    gcc-8.5.0
powerpc64             randconfig-002-20260317    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260317    gcc-10.5.0
riscv                 randconfig-002-20260317    gcc-10.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260317    gcc-10.5.0
s390                  randconfig-002-20260317    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260317    gcc-10.5.0
sh                    randconfig-002-20260317    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260317    gcc-12.5.0
sparc                 randconfig-002-20260317    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260317    gcc-12.5.0
sparc64               randconfig-002-20260317    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260317    gcc-12.5.0
um                    randconfig-002-20260317    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260317    gcc-14
x86_64      buildonly-randconfig-002-20260317    gcc-14
x86_64      buildonly-randconfig-003-20260317    gcc-14
x86_64      buildonly-randconfig-004-20260317    gcc-14
x86_64      buildonly-randconfig-005-20260317    gcc-14
x86_64      buildonly-randconfig-006-20260317    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260317    clang-20
x86_64                randconfig-002-20260317    clang-20
x86_64                randconfig-003-20260317    clang-20
x86_64                randconfig-004-20260317    clang-20
x86_64                randconfig-005-20260317    clang-20
x86_64                randconfig-006-20260317    clang-20
x86_64                randconfig-011-20260317    clang-20
x86_64                randconfig-012-20260317    clang-20
x86_64                randconfig-013-20260317    clang-20
x86_64                randconfig-014-20260317    clang-20
x86_64                randconfig-015-20260317    clang-20
x86_64                randconfig-016-20260317    clang-20
x86_64                randconfig-071-20260317    clang-20
x86_64                randconfig-072-20260317    clang-20
x86_64                randconfig-073-20260317    clang-20
x86_64                randconfig-074-20260317    clang-20
x86_64                randconfig-075-20260317    clang-20
x86_64                randconfig-076-20260317    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260317    gcc-12.5.0
xtensa                randconfig-002-20260317    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

