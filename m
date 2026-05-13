Return-Path: <linux-gpio+bounces-36701-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP9NAiXCA2px+QEAu9opvQ
	(envelope-from <linux-gpio+bounces-36701-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 02:13:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9952B813
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 02:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 465D33056152
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 00:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F4B5474F;
	Wed, 13 May 2026 00:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jExxxDZ9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EFB4204E
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631200; cv=none; b=QLyHqCrz4eI5iAqqtDpxVPM8ENACaIs8Cqa2fk9g1PUpiC9GSKLobB0WfCSv3I6F7RmJyzxNbz8QfDbcgRp1kZy0hDjMGeA58mB1EvJUUfs1mv4ywdIccgYMnrvb2nut4uL4CWGgxHCeMTb0WyFmj84WVjfx65ceWTWNw7Kc9Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631200; c=relaxed/simple;
	bh=eG4BUSPZiIImF9k+//81P9KvD5A03z4zeFC7I4azx7Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LF61ic/RrjoYaLG5ta4j63KjkoxWwkoZ1cx1o4dFUXKFvXpz5ra9IeyrUGdAln7Fq8lcB7Y6Rc9x+NCt0r27V/oiqB7Lw5T4KknNPr0zPhZF3X0cjs2mvM3N+ckqIzzQ8+n4WHegEqVzIO8rMtWfWssuCkdRKaT00uMAfy220tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jExxxDZ9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778631198; x=1810167198;
  h=date:from:to:cc:subject:message-id;
  bh=eG4BUSPZiIImF9k+//81P9KvD5A03z4zeFC7I4azx7Y=;
  b=jExxxDZ9dM4+b8EO7JThiRSeimM9TzOXwsHyY6uybDblPEJhSAzxb1wn
   eizE1oNPJlyUT5cllaeL7IrPvEN00sEUKb+usbvkkIm2Xe+lqIpeXAZtO
   WH9+fTkauZiZsq2YKeE9QvMKbwK8jT4jNNem3rK7Te6jXy3zFyJYRV+jT
   8ZhTVCR9s1U6XnEHM3USW+3tbUIE8Y/JPJgrC/pouDgPs56hUhJq8Q/AT
   YaFEk12dWQ82+4sFXQJFFcZBFM0SOUQ/5VwmKOYRxPFTWQGOBqXGjiab4
   Hd1uuI+9Tkp0C/ADrPeCQHioyQMnMyB6gqoNTWyEn9Yllggz+fvQLGIf7
   A==;
X-CSE-ConnectionGUID: RvURQyTdTyO7qBJVZA+4Eg==
X-CSE-MsgGUID: 95v3CJ9RT3i9Tf8HHYhu4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78580577"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="78580577"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 17:13:18 -0700
X-CSE-ConnectionGUID: 4ETNVoSzRDekCczkf+WbaA==
X-CSE-MsgGUID: h+coLQohRdyQXJLQ8gA8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="239731125"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2026 17:13:16 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMxDu-00000000315-02cq;
	Wed, 13 May 2026 00:13:14 +0000
Date: Wed, 13 May 2026 08:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:soc/pxa-gpio-for-v7.2] BUILD SUCCESS
 2c450dd88161abbadf889711d0bcedd7a0504a84
Message-ID: <202605130831.sDJsKrbp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 6DB9952B813
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36701-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git soc/pxa-gpio-for-v7.2
branch HEAD: 2c450dd88161abbadf889711d0bcedd7a0504a84  ARM: pxa: pxa27x: attach software node to its target GPIO controller

elapsed time: 724m

configs tested: 306
configs skipped: 168

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
arc                         haps_hs_defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260512    gcc-11.5.0
arc                   randconfig-001-20260513    gcc-14.3.0
arc                   randconfig-001-20260513    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260512    gcc-11.5.0
arc                   randconfig-002-20260513    gcc-14.3.0
arc                   randconfig-002-20260513    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      footbridge_defconfig    clang-17
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260512    gcc-11.5.0
arm                   randconfig-001-20260513    gcc-14.3.0
arm                   randconfig-001-20260513    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260512    gcc-11.5.0
arm                   randconfig-002-20260513    gcc-14.3.0
arm                   randconfig-002-20260513    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260512    gcc-11.5.0
arm                   randconfig-003-20260513    gcc-14.3.0
arm                   randconfig-003-20260513    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260512    gcc-11.5.0
arm                   randconfig-004-20260513    gcc-14.3.0
arm                   randconfig-004-20260513    gcc-8.5.0
arm                           sama7_defconfig    clang-23
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260512    clang-23
arm64                 randconfig-001-20260513    gcc-12.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260512    clang-23
arm64                 randconfig-002-20260513    gcc-12.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260512    clang-23
arm64                 randconfig-003-20260513    gcc-12.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260512    clang-23
arm64                 randconfig-004-20260513    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260512    clang-23
csky                  randconfig-001-20260513    gcc-12.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260512    clang-23
csky                  randconfig-002-20260513    gcc-12.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260512    gcc-10.5.0
hexagon               randconfig-001-20260513    gcc-8.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260512    gcc-10.5.0
hexagon               randconfig-002-20260513    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260512    gcc-14
i386        buildonly-randconfig-001-20260513    clang-20
i386        buildonly-randconfig-002-20260512    gcc-14
i386        buildonly-randconfig-002-20260513    clang-20
i386        buildonly-randconfig-003-20260512    gcc-14
i386        buildonly-randconfig-003-20260513    clang-20
i386        buildonly-randconfig-004-20260512    gcc-14
i386        buildonly-randconfig-004-20260513    clang-20
i386        buildonly-randconfig-005-20260512    gcc-14
i386        buildonly-randconfig-005-20260513    clang-20
i386        buildonly-randconfig-006-20260512    gcc-14
i386        buildonly-randconfig-006-20260513    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260512    gcc-14
i386                  randconfig-001-20260513    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260512    gcc-14
i386                  randconfig-002-20260513    clang-20
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260512    gcc-14
i386                  randconfig-003-20260513    clang-20
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260512    gcc-14
i386                  randconfig-004-20260513    clang-20
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260512    gcc-14
i386                  randconfig-005-20260513    clang-20
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260512    gcc-14
i386                  randconfig-006-20260513    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260512    gcc-14
i386                  randconfig-007-20260513    clang-20
i386                  randconfig-011-20260512    clang-20
i386                  randconfig-011-20260513    clang-20
i386                  randconfig-012-20260512    clang-20
i386                  randconfig-012-20260513    clang-20
i386                  randconfig-013-20260512    clang-20
i386                  randconfig-013-20260513    clang-20
i386                  randconfig-014-20260512    clang-20
i386                  randconfig-014-20260513    clang-20
i386                  randconfig-015-20260512    clang-20
i386                  randconfig-015-20260513    clang-20
i386                  randconfig-016-20260512    clang-20
i386                  randconfig-016-20260513    clang-20
i386                  randconfig-017-20260512    clang-20
i386                  randconfig-017-20260513    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260512    gcc-10.5.0
loongarch             randconfig-001-20260513    gcc-8.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260512    gcc-10.5.0
loongarch             randconfig-002-20260513    gcc-8.5.0
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
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260512    gcc-10.5.0
nios2                 randconfig-001-20260513    gcc-8.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260512    gcc-10.5.0
nios2                 randconfig-002-20260513    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260512    gcc-12.5.0
parisc                randconfig-001-20260513    gcc-8.5.0
parisc                randconfig-002-20260512    gcc-12.5.0
parisc                randconfig-002-20260513    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                     rainier_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260512    gcc-12.5.0
powerpc               randconfig-001-20260513    gcc-8.5.0
powerpc               randconfig-002-20260512    gcc-12.5.0
powerpc               randconfig-002-20260513    gcc-8.5.0
powerpc64             randconfig-001-20260512    gcc-12.5.0
powerpc64             randconfig-001-20260513    gcc-8.5.0
powerpc64             randconfig-002-20260512    gcc-12.5.0
powerpc64             randconfig-002-20260513    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260513    gcc-15.2.0
riscv                 randconfig-002-20260513    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260513    gcc-15.2.0
s390                  randconfig-002-20260513    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260513    gcc-15.2.0
sh                    randconfig-002-20260513    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-11.5.0
sparc                          randconfig-001    gcc-13.4.0
sparc                 randconfig-001-20260512    gcc-13.4.0
sparc                 randconfig-001-20260513    gcc-11.5.0
sparc                          randconfig-002    gcc-11.5.0
sparc                          randconfig-002    gcc-13.4.0
sparc                 randconfig-002-20260512    gcc-13.4.0
sparc                 randconfig-002-20260513    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-11.5.0
sparc64                        randconfig-001    gcc-13.4.0
sparc64               randconfig-001-20260512    gcc-13.4.0
sparc64               randconfig-001-20260513    gcc-11.5.0
sparc64                        randconfig-002    gcc-11.5.0
sparc64                        randconfig-002    gcc-13.4.0
sparc64               randconfig-002-20260512    gcc-13.4.0
sparc64               randconfig-002-20260513    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-11.5.0
um                             randconfig-001    gcc-13.4.0
um                    randconfig-001-20260512    gcc-13.4.0
um                    randconfig-001-20260513    gcc-11.5.0
um                             randconfig-002    gcc-11.5.0
um                             randconfig-002    gcc-13.4.0
um                    randconfig-002-20260512    gcc-13.4.0
um                    randconfig-002-20260513    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260512    gcc-14
x86_64      buildonly-randconfig-001-20260513    gcc-12
x86_64      buildonly-randconfig-002-20260512    gcc-14
x86_64      buildonly-randconfig-002-20260513    gcc-12
x86_64      buildonly-randconfig-003-20260512    gcc-14
x86_64      buildonly-randconfig-003-20260513    gcc-12
x86_64      buildonly-randconfig-004-20260512    gcc-14
x86_64      buildonly-randconfig-004-20260513    gcc-12
x86_64      buildonly-randconfig-005-20260512    gcc-14
x86_64      buildonly-randconfig-005-20260513    gcc-12
x86_64      buildonly-randconfig-006-20260512    gcc-14
x86_64      buildonly-randconfig-006-20260513    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260512    gcc-14
x86_64                randconfig-001-20260513    clang-20
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260512    gcc-14
x86_64                randconfig-002-20260513    clang-20
x86_64                         randconfig-003    gcc-14
x86_64                randconfig-003-20260512    gcc-14
x86_64                randconfig-003-20260513    clang-20
x86_64                         randconfig-004    gcc-14
x86_64                randconfig-004-20260512    gcc-14
x86_64                randconfig-004-20260513    clang-20
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260512    gcc-14
x86_64                randconfig-005-20260513    clang-20
x86_64                         randconfig-006    gcc-14
x86_64                randconfig-006-20260512    gcc-14
x86_64                randconfig-006-20260513    clang-20
x86_64                randconfig-011-20260512    clang-20
x86_64                randconfig-011-20260513    gcc-14
x86_64                randconfig-012-20260512    clang-20
x86_64                randconfig-012-20260513    gcc-14
x86_64                randconfig-013-20260512    clang-20
x86_64                randconfig-013-20260513    gcc-14
x86_64                randconfig-014-20260512    clang-20
x86_64                randconfig-014-20260513    gcc-14
x86_64                randconfig-015-20260512    clang-20
x86_64                randconfig-015-20260513    gcc-14
x86_64                randconfig-016-20260512    clang-20
x86_64                randconfig-016-20260513    gcc-14
x86_64                randconfig-071-20260512    clang-20
x86_64                randconfig-071-20260512    gcc-14
x86_64                randconfig-071-20260513    gcc-14
x86_64                randconfig-072-20260512    clang-20
x86_64                randconfig-072-20260513    gcc-14
x86_64                randconfig-073-20260512    clang-20
x86_64                randconfig-073-20260513    gcc-14
x86_64                randconfig-074-20260512    clang-20
x86_64                randconfig-074-20260512    gcc-14
x86_64                randconfig-074-20260513    gcc-14
x86_64                randconfig-075-20260512    clang-20
x86_64                randconfig-075-20260513    gcc-14
x86_64                randconfig-076-20260512    clang-20
x86_64                randconfig-076-20260513    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-11.5.0
xtensa                         randconfig-001    gcc-13.4.0
xtensa                randconfig-001-20260512    gcc-13.4.0
xtensa                randconfig-001-20260513    gcc-11.5.0
xtensa                         randconfig-002    gcc-11.5.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260512    gcc-13.4.0
xtensa                randconfig-002-20260513    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

