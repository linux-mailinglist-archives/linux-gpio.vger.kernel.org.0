Return-Path: <linux-gpio+bounces-34112-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGcsEriXw2myrwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34112-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 09:07:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4972F321213
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 09:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 100E130771D1
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 08:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAEB3932ED;
	Wed, 25 Mar 2026 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFmK/TuH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1E92750ED
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425625; cv=none; b=qqtQ8ASZyED0g7ikUdU00aGB7NVTICQf9A0PtDwRuX7pI6fObq/KjzjAY/j4kJhLgs4Uu0qG1RHXqHRu4An2Za15mp9HzZBOT0z6VkXcKrd/3zh6vrzFWF7ZVyBOd8WAvdGwas0wJAoWldaoTv+rr5N2xGSupmVE23YxFVINyKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425625; c=relaxed/simple;
	bh=EE6je02tysa4VqFbtI3ltpocSTmGDZcyW8smu2KLVus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LYS+NjIlx/y0105E5ZRhKtov53zZd/ZK7+1zklJk1LRPecDlGuUhoTEeuivByBWdhgJ8iVnaYdYrWqnnJ+4SH0oJr7K3Ud5h9Daghu/leyQsQpHelyuWqar7kZYWKRVyCQPA+Rf0Of8sdCsc99O1OrKkTSgRJzsS/H1g7cj01uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFmK/TuH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774425623; x=1805961623;
  h=date:from:to:cc:subject:message-id;
  bh=EE6je02tysa4VqFbtI3ltpocSTmGDZcyW8smu2KLVus=;
  b=eFmK/TuHCGhMtLRKOveSfp/vI1qcGPE3QGRb8BPch1VMy1FDUZtJxtoy
   h+NR62taTdJTdGuYlDEcG+prw0AxI87FAMOnZBFZbCBcD/WO6XOUCIxh4
   W6nMN870zz96nfx1351N/5PspjkQQ8u4QVIzxWpYhQeVkm7sEasqHSz/7
   F4oXm1dl2fexbf583+g7z1DnahVC5hxt8YLjtDkNTXggXgr1oym5Bxf3m
   MmzW3Ym00N6WbTc1lD+dhXucF9NSFC3/HbiYNyzYs304PLGloN2e+Rqbg
   VWpSwyGcc5QFTzDFFUz2r+46xXvVWsh9uEsNegyiR4T1JJf7VsMwm41ZQ
   g==;
X-CSE-ConnectionGUID: Mw8GvGuGQTyr5RaIYvgE3g==
X-CSE-MsgGUID: zSneO6tqTF65rPsFZ8Yt9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75524654"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75524654"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:00:22 -0700
X-CSE-ConnectionGUID: U9fuWPpTTGmXhYSwTmbV6Q==
X-CSE-MsgGUID: 8VUxWClbSTyKMNGo2wYkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229069886"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Mar 2026 01:00:21 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5JA2-000000006Rx-09CC;
	Wed, 25 Mar 2026 08:00:18 +0000
Date: Wed, 25 Mar 2026 16:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 4457bc46dad06edaa28892bb02fc4a023d6b3da3
Message-ID: <202603251605.chVvCVfc-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34112-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 4972F321213
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4457bc46dad06edaa28892bb02fc4a023d6b3da3  Merge branch 'devel' into for-next

elapsed time: 805m

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
arc                   randconfig-001-20260325    gcc-8.5.0
arc                   randconfig-002-20260325    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                           omap1_defconfig    gcc-15.2.0
arm                   randconfig-001-20260325    gcc-8.5.0
arm                   randconfig-002-20260325    gcc-8.5.0
arm                   randconfig-003-20260325    gcc-8.5.0
arm                   randconfig-004-20260325    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260325    clang-23
arm64                 randconfig-002-20260325    clang-23
arm64                 randconfig-003-20260325    clang-23
arm64                 randconfig-004-20260325    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260325    clang-23
csky                  randconfig-002-20260325    clang-23
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260325    gcc-11.5.0
hexagon               randconfig-002-20260325    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260325    gcc-14
i386        buildonly-randconfig-002-20260325    gcc-14
i386        buildonly-randconfig-003-20260325    gcc-14
i386        buildonly-randconfig-004-20260325    gcc-14
i386        buildonly-randconfig-005-20260325    gcc-14
i386        buildonly-randconfig-006-20260325    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260325    clang-20
i386                  randconfig-002-20260325    clang-20
i386                  randconfig-003-20260325    clang-20
i386                  randconfig-004-20260325    clang-20
i386                  randconfig-005-20260325    clang-20
i386                  randconfig-006-20260325    clang-20
i386                  randconfig-007-20260325    clang-20
i386                  randconfig-011-20260325    clang-20
i386                  randconfig-012-20260325    clang-20
i386                  randconfig-013-20260325    clang-20
i386                  randconfig-014-20260325    clang-20
i386                  randconfig-015-20260325    clang-20
i386                  randconfig-016-20260325    clang-20
i386                  randconfig-017-20260325    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260325    gcc-11.5.0
loongarch             randconfig-002-20260325    gcc-11.5.0
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
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260325    gcc-11.5.0
nios2                 randconfig-002-20260325    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260325    clang-23
parisc                randconfig-002-20260325    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260325    clang-23
powerpc               randconfig-002-20260325    clang-23
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20260325    clang-23
powerpc64             randconfig-002-20260325    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260325    gcc-8.5.0
riscv                 randconfig-002-20260325    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260325    gcc-8.5.0
s390                  randconfig-002-20260325    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260325    gcc-8.5.0
sh                    randconfig-002-20260325    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260325    gcc-13
sparc                 randconfig-002-20260325    gcc-13
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260325    gcc-13
sparc64               randconfig-002-20260325    gcc-13
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260325    gcc-13
um                    randconfig-002-20260325    gcc-13
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260325    gcc-14
x86_64      buildonly-randconfig-002-20260325    gcc-14
x86_64      buildonly-randconfig-003-20260325    gcc-14
x86_64      buildonly-randconfig-004-20260325    gcc-14
x86_64      buildonly-randconfig-005-20260325    gcc-14
x86_64      buildonly-randconfig-006-20260325    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260325    gcc-12
x86_64                randconfig-002-20260325    gcc-12
x86_64                randconfig-003-20260325    gcc-12
x86_64                randconfig-004-20260325    gcc-12
x86_64                randconfig-005-20260325    gcc-12
x86_64                randconfig-006-20260325    gcc-12
x86_64                randconfig-011-20260325    clang-20
x86_64                randconfig-012-20260325    clang-20
x86_64                randconfig-013-20260325    clang-20
x86_64                randconfig-014-20260325    clang-20
x86_64                randconfig-015-20260325    clang-20
x86_64                randconfig-016-20260325    clang-20
x86_64                randconfig-071-20260325    gcc-14
x86_64                randconfig-072-20260325    gcc-14
x86_64                randconfig-073-20260325    gcc-14
x86_64                randconfig-074-20260325    gcc-14
x86_64                randconfig-075-20260325    gcc-14
x86_64                randconfig-076-20260325    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260325    gcc-13
xtensa                randconfig-002-20260325    gcc-13

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

