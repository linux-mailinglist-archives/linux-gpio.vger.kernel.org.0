Return-Path: <linux-gpio+bounces-37549-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NwOLumRFmrqnQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37549-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 08:40:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 200CD5DFEFA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 08:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB7DA300C03C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 06:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEF6390208;
	Wed, 27 May 2026 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7zsL/1K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0C838F93B
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779863734; cv=none; b=hQM5zltmtZPE7E0spSJkeuFMBUZ/zdXBc8NWE/vKE3odFiHLltXoiEzfWAQlgq1/OygHbQYGC7bdq4cxEB6YHUP3gBWFAx5kvFpeGOo7jwjF9RXZ/fPs5TPr9djIIixhsd8c/lCCPcedKzInShZvZEznFjAOvYudjZ7MiIUWHGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779863734; c=relaxed/simple;
	bh=4HtBIMMyIxcT6T/2WouzssqUQguYCdgS80HXKXStgXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dgQrfh0okY1BnwSSITVVgh5l+nPMHVGb8kklOx0+Y6s2tWuAKo1Eo6HUwdIDrC2RJNznXdcrR7iK3nK3rJFvaxfmGUUfE9bhKDwWvmefP6QOSRUWFF15+H+BBJS9K9f3V+k5nZfnC0fPXgWMMiRUKxcOaEV5N+teAn4nNnkARbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7zsL/1K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779863732; x=1811399732;
  h=date:from:to:cc:subject:message-id;
  bh=4HtBIMMyIxcT6T/2WouzssqUQguYCdgS80HXKXStgXQ=;
  b=H7zsL/1KAU3mylv6npVhSptysLIQ8FEdixB/WtirTO0PKbdPitiJSliS
   z0M7/418L5gZHrCflgLQI+jkvUrDQX80ljPim8flrnFgKwPsWy4NSVofr
   Voedjj3qUfyemcpkpoAnYJ70PH+MewELwGZGuZGwhIOu+fuJmXq9QOocX
   2h273Su5t6gvcOPi3brxF3BMIwv0xF4Ad8IJUhF8a2ZRCnShtoj51Y7k/
   FVlpm5TK0VXCwjTxVdbrymNLtFcgeDuf/FetJz3YD5EPS0l7mvA7G7D/o
   O1mWUdzuMp630mep2YcJtSTIEpX6tucY3V96crtazUmbB4ENr/PHNlUYy
   w==;
X-CSE-ConnectionGUID: Xme0xKfITdGeGEPTYg+giA==
X-CSE-MsgGUID: DzkDlQVySn+W1r1cbjSmaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84577681"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="84577681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 23:35:31 -0700
X-CSE-ConnectionGUID: M27+jZbWS22lDeJIkGbgZA==
X-CSE-MsgGUID: IMeHJJcVRiK1nhMrDxQ40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="237973880"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2026 23:35:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS7rT-000000003UY-1n66;
	Wed, 27 May 2026 06:35:27 +0000
Date: Wed, 27 May 2026 14:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 39785f2b3e9fb8f3375dde1e3e4c94ff953871af
Message-ID: <202605271442.6QnAcg0K-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-37549-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 200CD5DFEFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 39785f2b3e9fb8f3375dde1e3e4c94ff953871af  gpio: virtuser: Fix uninitialized data bug in gpio_virtuser_direction_do_write()

elapsed time: 869m

configs tested: 167
configs skipped: 3

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
arc                   randconfig-001-20260527    gcc-11.5.0
arc                   randconfig-002-20260527    gcc-11.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260527    gcc-11.5.0
arm                   randconfig-002-20260527    gcc-11.5.0
arm                   randconfig-003-20260527    gcc-11.5.0
arm                   randconfig-004-20260527    gcc-11.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260527    gcc-8.5.0
arm64                 randconfig-002-20260527    gcc-8.5.0
arm64                 randconfig-003-20260527    gcc-8.5.0
arm64                 randconfig-004-20260527    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260527    gcc-8.5.0
csky                  randconfig-002-20260527    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260527    gcc-11.5.0
hexagon               randconfig-002-20260527    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260527    clang-20
i386        buildonly-randconfig-002-20260527    clang-20
i386        buildonly-randconfig-003-20260527    clang-20
i386        buildonly-randconfig-004-20260527    clang-20
i386        buildonly-randconfig-005-20260527    clang-20
i386        buildonly-randconfig-006-20260527    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260527    gcc-14
i386                  randconfig-002-20260527    gcc-14
i386                  randconfig-003-20260527    gcc-14
i386                  randconfig-004-20260527    gcc-14
i386                  randconfig-005-20260527    gcc-14
i386                  randconfig-006-20260527    gcc-14
i386                  randconfig-007-20260527    gcc-14
i386                  randconfig-011-20260527    clang-20
i386                  randconfig-012-20260527    clang-20
i386                  randconfig-013-20260527    clang-20
i386                  randconfig-014-20260527    clang-20
i386                  randconfig-015-20260527    clang-20
i386                  randconfig-016-20260527    clang-20
i386                  randconfig-017-20260527    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260527    gcc-11.5.0
loongarch             randconfig-002-20260527    gcc-11.5.0
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
mips                     cu1830-neo_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260527    gcc-11.5.0
nios2                 randconfig-002-20260527    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260527    clang-20
parisc                randconfig-002-20260527    clang-20
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260527    clang-20
powerpc               randconfig-002-20260527    clang-20
powerpc64             randconfig-001-20260527    clang-20
powerpc64             randconfig-002-20260527    clang-20
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260527    gcc-14.3.0
riscv                 randconfig-002-20260527    gcc-14.3.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260527    gcc-14.3.0
s390                  randconfig-002-20260527    gcc-14.3.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260527    gcc-14.3.0
sh                    randconfig-002-20260527    gcc-14.3.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260527    gcc-8.5.0
sparc                 randconfig-002-20260527    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260527    gcc-8.5.0
sparc64               randconfig-002-20260527    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260527    gcc-8.5.0
um                    randconfig-002-20260527    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260527    gcc-14
x86_64      buildonly-randconfig-002-20260527    gcc-14
x86_64      buildonly-randconfig-003-20260527    gcc-14
x86_64      buildonly-randconfig-004-20260527    gcc-14
x86_64      buildonly-randconfig-005-20260527    gcc-14
x86_64      buildonly-randconfig-006-20260527    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260527    clang-20
x86_64                randconfig-002-20260527    clang-20
x86_64                randconfig-003-20260527    clang-20
x86_64                randconfig-004-20260527    clang-20
x86_64                randconfig-005-20260527    clang-20
x86_64                randconfig-006-20260527    clang-20
x86_64                randconfig-011-20260527    clang-20
x86_64                randconfig-012-20260527    clang-20
x86_64                randconfig-013-20260527    clang-20
x86_64                randconfig-014-20260527    clang-20
x86_64                randconfig-015-20260527    clang-20
x86_64                randconfig-016-20260527    clang-20
x86_64                randconfig-071-20260527    clang-20
x86_64                randconfig-072-20260527    clang-20
x86_64                randconfig-073-20260527    clang-20
x86_64                randconfig-074-20260527    clang-20
x86_64                randconfig-075-20260527    clang-20
x86_64                randconfig-076-20260527    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260527    gcc-8.5.0
xtensa                randconfig-002-20260527    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

