Return-Path: <linux-gpio+bounces-39163-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hHwODp3QQmoYDQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39163-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 22:07:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD6B6DE8DE
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 22:07:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=XYX+cBxi;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39163-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39163-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E4413002F58
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 20:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3256933F5BC;
	Mon, 29 Jun 2026 20:07:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DBE331214
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 20:07:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763672; cv=none; b=S6MneSCu8u695C1yi9qusR/TwkC+2xjFYsbJ/ZU//iwZ4fOWz1493ZJCWsB8Asj8kjQ8Ot1BdCDVDl3qnZ2ATjxisQEEgvPf/PhManYfeyClipbC93mkIih8t80QmWAuFz5kmkyvXhPQMC7m4wlVvwr6FFBfK+ETJcK1jokQ9ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763672; c=relaxed/simple;
	bh=8RXKv5oTzLkokYRew631xyOGvl075w3bvGKD93nHwmI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PcytQm5alxVpQ8VyKZU27umch0fpRdwkSxmqMoM4JPuVZZZ9QgcYzCR1Sp375UVuJDAP2BIVCg/kjBzBfKWvy6qTdp3VyGYZr2/znjatCZVgjUmkxgr58SCl4jEOQuSVmnzWCIi6oglQ0NwYT7ei8hNvKZmVWYx06DrZZgZSR80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYX+cBxi; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782763669; x=1814299669;
  h=date:from:to:cc:subject:message-id;
  bh=8RXKv5oTzLkokYRew631xyOGvl075w3bvGKD93nHwmI=;
  b=XYX+cBxigO9RhtRDgoX5Q5bE7sh0nJamsWOQOFsCcPSVhEatbJ3RhIbX
   gmtX+wVEy/gNz//A/J/VwBSoUafHGeRlPMPn5fWhUKrp3iXUInjHBG//l
   lmZg8rFJ9s/Q0XvG75NHVTJx4Violaf0a7SKYSTZVrjS/WGVR04Yn1xI4
   JZoBCGelCOt6VjU0g0TWOdyUFclHf6/ik+UIHJaL4ZQ5bJ5xx3J/Ja6hG
   xNJ4d7xMFEjgbu/YZ3FYAfHzvtJD938UDqgOmg+hfehEfmAlLlwxaKXOQ
   4oIy/r6cI41jkhD8StLKrtgKYLlw8MO0G075zYDy0egSu9x5eYWNc1jnQ
   g==;
X-CSE-ConnectionGUID: vC2VochCRtavMYIqiPOFDg==
X-CSE-MsgGUID: vKxvKsSvTRucdF/42W9GhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82462851"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="82462851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 13:07:48 -0700
X-CSE-ConnectionGUID: wTO/bDxJSsqP51bg8wG1Pw==
X-CSE-MsgGUID: MUJMpIyqT9iMxYRFKhcq+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="247596516"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 13:07:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weIGe-000000007iP-1sxS;
	Mon, 29 Jun 2026 20:07:44 +0000
Date: Tue, 30 Jun 2026 04:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS WITH WARNING
 79db21e77c560b2b9eaf950674efa845cca5854b
Message-ID: <202606300425.VmK3oSOm-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39163-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DD6B6DE8DE

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 79db21e77c560b2b9eaf950674efa845cca5854b  Merge tag 'v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606270433.gAWekfd3-lkp@intel.com

    Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arc-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arc-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm64-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm64-randconfig-002-20260629
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm64-randconfig-003-20260629
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- csky-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- m68k-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- m68k-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- microblaze-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- mips-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- mips-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- nios2-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- openrisc-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- parisc-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- parisc-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- powerpc-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- riscv-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- riscv-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- s390-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- s390-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- sh-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- sh-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- sparc64-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- um-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- um-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
`-- xtensa-allyesconfig
    `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info

elapsed time: 741m

configs tested: 305
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260629    clang-17
arc                   randconfig-001-20260629    gcc-16.1.0
arc                   randconfig-001-20260630    clang-23
arc                   randconfig-002-20260629    clang-17
arc                   randconfig-002-20260629    gcc-8.5.0
arc                   randconfig-002-20260630    clang-23
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260629    clang-17
arm                   randconfig-001-20260629    gcc-10.5.0
arm                   randconfig-001-20260630    clang-23
arm                   randconfig-002-20260629    clang-17
arm                   randconfig-002-20260630    clang-23
arm                   randconfig-003-20260629    clang-17
arm                   randconfig-003-20260630    clang-23
arm                   randconfig-004-20260629    clang-17
arm                   randconfig-004-20260629    gcc-16.1.0
arm                   randconfig-004-20260630    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260629    gcc-16.1.0
arm64                 randconfig-001-20260630    clang-23
arm64                 randconfig-002-20260629    clang-22
arm64                 randconfig-002-20260629    gcc-16.1.0
arm64                 randconfig-002-20260630    clang-23
arm64                 randconfig-003-20260629    clang-23
arm64                 randconfig-003-20260629    gcc-16.1.0
arm64                 randconfig-003-20260630    clang-23
arm64                 randconfig-004-20260629    clang-20
arm64                 randconfig-004-20260629    gcc-16.1.0
arm64                 randconfig-004-20260630    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260629    gcc-10.5.0
csky                  randconfig-001-20260629    gcc-16.1.0
csky                  randconfig-001-20260630    clang-23
csky                  randconfig-002-20260629    gcc-12.5.0
csky                  randconfig-002-20260629    gcc-16.1.0
csky                  randconfig-002-20260630    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260629    gcc-11.5.0
hexagon               randconfig-001-20260630    clang-18
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260629    gcc-11.5.0
hexagon               randconfig-002-20260630    clang-18
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260629    clang-22
i386        buildonly-randconfig-001-20260629    gcc-14
i386        buildonly-randconfig-001-20260630    clang-22
i386        buildonly-randconfig-002-20260629    gcc-13
i386        buildonly-randconfig-002-20260629    gcc-14
i386        buildonly-randconfig-002-20260630    clang-22
i386        buildonly-randconfig-003-20260629    gcc-14
i386        buildonly-randconfig-003-20260630    clang-22
i386        buildonly-randconfig-004-20260629    clang-22
i386        buildonly-randconfig-004-20260629    gcc-14
i386        buildonly-randconfig-004-20260630    clang-22
i386        buildonly-randconfig-005-20260629    gcc-14
i386        buildonly-randconfig-005-20260630    clang-22
i386        buildonly-randconfig-006-20260629    clang-22
i386        buildonly-randconfig-006-20260629    gcc-14
i386        buildonly-randconfig-006-20260630    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260629    clang-22
i386                  randconfig-001-20260630    clang-22
i386                  randconfig-002-20260629    clang-22
i386                  randconfig-002-20260630    clang-22
i386                  randconfig-003-20260629    clang-22
i386                  randconfig-003-20260630    clang-22
i386                  randconfig-004-20260629    clang-22
i386                  randconfig-004-20260630    clang-22
i386                  randconfig-005-20260629    clang-22
i386                  randconfig-005-20260630    clang-22
i386                  randconfig-006-20260629    clang-22
i386                  randconfig-006-20260630    clang-22
i386                  randconfig-007-20260629    clang-22
i386                  randconfig-007-20260630    clang-22
i386                  randconfig-011-20260629    gcc-14
i386                  randconfig-012-20260629    gcc-14
i386                  randconfig-013-20260629    gcc-14
i386                  randconfig-014-20260629    gcc-14
i386                  randconfig-015-20260629    gcc-14
i386                  randconfig-016-20260629    gcc-14
i386                  randconfig-017-20260629    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260629    gcc-11.5.0
loongarch             randconfig-001-20260630    clang-18
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260629    gcc-11.5.0
loongarch             randconfig-002-20260630    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        bcm47xx_defconfig    clang-23
mips                          malta_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260629    gcc-11.5.0
nios2                 randconfig-001-20260630    clang-18
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260629    gcc-11.5.0
nios2                 randconfig-002-20260630    clang-18
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260629    gcc-9.5.0
parisc                randconfig-001-20260630    clang-22
parisc                randconfig-002-20260629    gcc-9.5.0
parisc                randconfig-002-20260630    clang-22
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260629    gcc-9.5.0
powerpc               randconfig-001-20260630    clang-22
powerpc               randconfig-002-20260629    gcc-9.5.0
powerpc               randconfig-002-20260630    clang-22
powerpc                        warp_defconfig    gcc-16.1.0
powerpc                         wii_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260629    gcc-9.5.0
powerpc64             randconfig-001-20260630    clang-22
powerpc64             randconfig-002-20260629    gcc-9.5.0
powerpc64             randconfig-002-20260630    clang-22
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-17
riscv                 randconfig-001-20260629    clang-17
riscv                 randconfig-001-20260629    gcc-12.5.0
riscv                 randconfig-001-20260630    gcc-9.5.0
riscv                          randconfig-002    clang-17
riscv                 randconfig-002-20260629    clang-17
riscv                 randconfig-002-20260630    gcc-9.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-17
s390                  randconfig-001-20260629    clang-17
s390                  randconfig-001-20260629    gcc-8.5.0
s390                  randconfig-001-20260630    gcc-9.5.0
s390                           randconfig-002    clang-17
s390                  randconfig-002-20260629    clang-17
s390                  randconfig-002-20260629    clang-23
s390                  randconfig-002-20260630    gcc-9.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-17
sh                    randconfig-001-20260629    clang-17
sh                    randconfig-001-20260629    gcc-10.5.0
sh                    randconfig-001-20260630    gcc-9.5.0
sh                             randconfig-002    clang-17
sh                    randconfig-002-20260629    clang-17
sh                    randconfig-002-20260629    gcc-12.5.0
sh                    randconfig-002-20260630    gcc-9.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260629    gcc-15.2.0
sparc                 randconfig-001-20260630    clang-17
sparc                 randconfig-002-20260629    gcc-15.2.0
sparc                 randconfig-002-20260630    clang-17
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260629    gcc-15.2.0
sparc64               randconfig-001-20260630    clang-17
sparc64               randconfig-002-20260629    gcc-15.2.0
sparc64               randconfig-002-20260630    clang-17
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260629    gcc-15.2.0
um                    randconfig-001-20260630    clang-17
um                    randconfig-002-20260629    gcc-15.2.0
um                    randconfig-002-20260630    clang-17
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260629    clang-22
x86_64      buildonly-randconfig-001-20260630    clang-22
x86_64      buildonly-randconfig-002-20260629    clang-22
x86_64      buildonly-randconfig-002-20260630    clang-22
x86_64      buildonly-randconfig-003-20260629    clang-22
x86_64      buildonly-randconfig-003-20260630    clang-22
x86_64      buildonly-randconfig-004-20260629    clang-22
x86_64      buildonly-randconfig-004-20260630    clang-22
x86_64      buildonly-randconfig-005-20260629    clang-22
x86_64      buildonly-randconfig-005-20260630    clang-22
x86_64      buildonly-randconfig-006-20260629    clang-22
x86_64      buildonly-randconfig-006-20260630    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260629    gcc-14
x86_64                randconfig-001-20260630    gcc-14
x86_64                randconfig-002-20260629    clang-22
x86_64                randconfig-002-20260629    gcc-14
x86_64                randconfig-002-20260630    gcc-14
x86_64                randconfig-003-20260629    gcc-14
x86_64                randconfig-003-20260630    gcc-14
x86_64                randconfig-004-20260629    gcc-14
x86_64                randconfig-004-20260630    gcc-14
x86_64                randconfig-005-20260629    clang-22
x86_64                randconfig-005-20260629    gcc-14
x86_64                randconfig-005-20260630    gcc-14
x86_64                randconfig-006-20260629    gcc-14
x86_64                randconfig-006-20260630    gcc-14
x86_64                randconfig-011-20260629    clang-22
x86_64                randconfig-011-20260629    gcc-13
x86_64                randconfig-011-20260630    gcc-14
x86_64                randconfig-012-20260629    clang-22
x86_64                randconfig-012-20260629    gcc-13
x86_64                randconfig-012-20260630    gcc-14
x86_64                randconfig-013-20260629    clang-22
x86_64                randconfig-013-20260629    gcc-13
x86_64                randconfig-013-20260630    gcc-14
x86_64                randconfig-014-20260629    clang-22
x86_64                randconfig-014-20260629    gcc-13
x86_64                randconfig-014-20260630    gcc-14
x86_64                randconfig-015-20260629    gcc-13
x86_64                randconfig-015-20260630    gcc-14
x86_64                randconfig-016-20260629    gcc-13
x86_64                randconfig-016-20260629    gcc-14
x86_64                randconfig-016-20260630    gcc-14
x86_64                randconfig-071-20260629    clang-22
x86_64                randconfig-071-20260630    clang-22
x86_64                randconfig-072-20260629    clang-22
x86_64                randconfig-072-20260630    clang-22
x86_64                randconfig-073-20260629    clang-22
x86_64                randconfig-073-20260630    clang-22
x86_64                randconfig-074-20260629    clang-22
x86_64                randconfig-074-20260630    clang-22
x86_64                randconfig-075-20260629    clang-22
x86_64                randconfig-075-20260630    clang-22
x86_64                randconfig-076-20260629    clang-22
x86_64                randconfig-076-20260630    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260629    gcc-15.2.0
xtensa                randconfig-001-20260630    clang-17
xtensa                randconfig-002-20260629    gcc-15.2.0
xtensa                randconfig-002-20260630    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

