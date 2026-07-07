Return-Path: <linux-gpio+bounces-39612-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HcNNKiZzTWoI0QEAu9opvQ
	(envelope-from <linux-gpio+bounces-39612-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 23:44:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E1B71FD41
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 23:44:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TRqbhTI0;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39612-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39612-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 362DE300E727
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 21:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15D343F4DA;
	Tue,  7 Jul 2026 21:44:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B92346FB3
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 21:44:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460643; cv=none; b=Fj4V0LOyeQHObQs0dLG6rBwujqgh77S/LlFttuA8CeXsR0kCGurc5flwzxyCeU4QyNXhfb2HwZBU9/gF45M0sU4iV5MH1+HhLk16tasgjRIH81Dm23IS/ZbgqpHGxJhV8QA3xCMlSPiciLaPE1XmSA3ps7oIPQbx8qvXVCHYZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460643; c=relaxed/simple;
	bh=wc4PURjp58jJO28Q1oclJFmWUSr/FujMO0HWd5t9aGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CLLGLir6mDJwkQ5KmcI3vvSNzjr28SsrcEvLeW6+hCCEwfconDd4rbDZXIqIi23HEB/P9PYg0FRtXT/+N3b/LVK7UoR8z0p1ADp2kB/0hRKpoAhqk/FtO2kgLj7qdYNJLmos+8NGEYQ5qTTKcD0rcjSqwbdPlipYdn8JTeK85xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRqbhTI0; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783460642; x=1814996642;
  h=date:from:to:cc:subject:message-id;
  bh=wc4PURjp58jJO28Q1oclJFmWUSr/FujMO0HWd5t9aGw=;
  b=TRqbhTI03K0+r4pRN15GCNE5IiyeV08HOEMJ7gvzgv7+Bf4W9VCR33h7
   bNPPyt7EjqAZoqWJ0aXfNCvIBEjxvn3hzq6V4EP4zII4nXf1eN63bD17q
   GLFbWUhxAmvlch8haevTpEjpbUabkcNMG/m48VikgC4bIBO84DEdhZXFA
   vmBJYLlBu/4hLGqt82tA0NX2v8AtOU3Ikym0DWDwIXEBPlaf7/7Qhdp01
   i2KvNdoksgTYYv0W53btlSyDpYkSf95WmuhMcBbQgshbw7ggmuotmsBvM
   a5DAPet9jl8zvpuw0rXoGHA6/Y42bRQCbzGGE0V14ekSwW0Snjd5v1BNE
   g==;
X-CSE-ConnectionGUID: 0O9jYd1QS7i6TUZZbp+R5Q==
X-CSE-MsgGUID: GfQvP/cPTD2FD1mkL6Q0ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84214967"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84214967"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 14:44:01 -0700
X-CSE-ConnectionGUID: iEUr1T5ERTGwaVSZz/EzLQ==
X-CSE-MsgGUID: NLuaX3oSQvaQcNw2cD0thg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250748570"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jul 2026 14:43:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whDa8-00000000Fhf-3ymJ;
	Tue, 07 Jul 2026 21:43:56 +0000
Date: Wed, 08 Jul 2026 05:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS WITH WARNING
 611fd6cfe13997245f1f1b59b81e957163491773
Message-ID: <202607080547.IijsRDM8-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39612-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:from_mime,intel.com:dkim,intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68E1B71FD41

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 611fd6cfe13997245f1f1b59b81e957163491773  gpio: swnode: remove deprecated lookup mechanism

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606270433.gAWekfd3-lkp@intel.com

    Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'

Warning ids grouped by kconfigs:

recent_errors
|-- hexagon-randconfig-r123-20260707
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- microblaze-randconfig-r062-20260707
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- powerpc-randconfig-r111-20260707
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- sparc-randconfig-r063-20260707
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
`-- sparc-randconfig-r131-20260707
    `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info

elapsed time: 1190m

configs tested: 158
configs skipped: 1

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260708    gcc-13.4.0
arc                   randconfig-002-20260708    gcc-13.4.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260708    gcc-13.4.0
arm                   randconfig-002-20260708    gcc-13.4.0
arm                   randconfig-003-20260708    gcc-13.4.0
arm                   randconfig-004-20260708    gcc-13.4.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260708    gcc-9.5.0
arm64                 randconfig-002-20260708    gcc-9.5.0
arm64                 randconfig-003-20260708    gcc-9.5.0
arm64                 randconfig-004-20260708    gcc-9.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260708    gcc-9.5.0
csky                  randconfig-002-20260708    gcc-9.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260707    clang-18
hexagon               randconfig-002-20260707    clang-18
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260707    clang-22
i386        buildonly-randconfig-001-20260708    clang-22
i386        buildonly-randconfig-002-20260707    clang-22
i386        buildonly-randconfig-002-20260708    clang-22
i386        buildonly-randconfig-003-20260707    clang-22
i386        buildonly-randconfig-003-20260708    clang-22
i386        buildonly-randconfig-004-20260707    clang-22
i386        buildonly-randconfig-004-20260708    clang-22
i386        buildonly-randconfig-005-20260707    clang-22
i386        buildonly-randconfig-005-20260708    clang-22
i386        buildonly-randconfig-006-20260707    clang-22
i386        buildonly-randconfig-006-20260708    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260707    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260707    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260707    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260707    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260707    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260707    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260707    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260707    clang-18
loongarch             randconfig-002-20260707    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260707    clang-18
nios2                 randconfig-002-20260707    clang-18
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                randconfig-001-20260707    clang-22
parisc                randconfig-001-20260708    clang-22
parisc                randconfig-002-20260707    clang-22
parisc                randconfig-002-20260708    clang-22
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                      bamboo_defconfig    clang-21
powerpc               randconfig-001-20260707    clang-22
powerpc               randconfig-001-20260708    clang-22
powerpc               randconfig-002-20260707    clang-22
powerpc               randconfig-002-20260708    clang-22
powerpc64             randconfig-001-20260707    clang-22
powerpc64             randconfig-001-20260708    clang-22
powerpc64             randconfig-002-20260707    clang-22
powerpc64             randconfig-002-20260708    clang-22
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                 randconfig-001-20260708    clang-23
riscv                 randconfig-002-20260708    clang-23
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                  randconfig-001-20260708    clang-23
s390                  randconfig-002-20260708    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260708    clang-23
sh                    randconfig-002-20260708    clang-23
sparc                             allnoconfig    clang-23
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260708    gcc-12
x86_64      buildonly-randconfig-002-20260708    gcc-12
x86_64      buildonly-randconfig-003-20260708    gcc-12
x86_64      buildonly-randconfig-004-20260708    gcc-12
x86_64      buildonly-randconfig-005-20260708    gcc-12
x86_64      buildonly-randconfig-006-20260708    gcc-12
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20260707    clang-22
x86_64                randconfig-012-20260707    clang-22
x86_64                randconfig-013-20260707    clang-22
x86_64                randconfig-014-20260707    clang-22
x86_64                randconfig-015-20260707    clang-22
x86_64                randconfig-016-20260707    clang-22
x86_64                randconfig-071-20260708    clang-22
x86_64                randconfig-072-20260708    clang-22
x86_64                randconfig-073-20260708    clang-22
x86_64                randconfig-074-20260708    clang-22
x86_64                randconfig-075-20260708    clang-22
x86_64                randconfig-076-20260708    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                          iss_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

