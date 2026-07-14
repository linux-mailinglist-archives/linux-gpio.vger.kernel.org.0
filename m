Return-Path: <linux-gpio+bounces-40053-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IAlmAocaVmrozAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40053-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:16:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D5753D0B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=J8lsbv8w;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40053-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40053-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3857430D0D32
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 11:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C050A3806D5;
	Tue, 14 Jul 2026 11:14:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C937FF61
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 11:14:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027649; cv=none; b=u9IoEbG52Kptxibox37ZPKHbvV/dufOAucPYgYdJ/zN2bm55bPujgzjZsfDYnPewori0SHAMpTMQe2VSabGYBss1M2H3Bkcj6aGE4VK6sYxPsThW1+ecYc/GFit3RYe69XDlhZWYGT1lV9a85Cdya74fI3BCokD7lZOFqTkugw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027649; c=relaxed/simple;
	bh=6cGwnarSRFN13vFzeKF9zgtZaBFU72i0WnkmDqfvFdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BqaRUfQK8oAQuNjcck8Hu9Ecxabrj47tMOSbEOHya6xTNaS4bj5ljbSenmohHN7q9ex0xLQANWyXx2bKAwz8gC/fTpjm2ay9c4JAQSkjefMpbu9XsqPdmuUTVCI+88Rx2pI+z1zWoOA6AA8O6+VNpJxpg7bqwtVII1dMjuoL5Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8lsbv8w; arc=none smtp.client-ip=192.198.163.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784027647; x=1815563647;
  h=date:from:to:cc:subject:message-id;
  bh=6cGwnarSRFN13vFzeKF9zgtZaBFU72i0WnkmDqfvFdY=;
  b=J8lsbv8wnLy82HyRLQNWbCoJ+cnHgg+9R5FpD/zwjlWy2KOjPzffSX6Z
   2AhSDJvn0hxv8WFLCy71At3/2o/oIoicbapnRF471gY9ihaMISTcKg24m
   TU/+STXzaDMSObj0RSRFUvfQXO8qHF0Mzq2U9tJ1MOd0AaPJmiWOkJieS
   RuFQCx1sErvvBq69G1rRogXNQ3qb1qWyZldgYvQMxIE9IHqUtrL6DUtfN
   hdKjum2LMRe0CSwLaAgBX6TkWcAAspM42yujs/ASe1lGmy6AedzDShV+Y
   zeN77ZaQB4HaatIvGNORfCI6NuAO121t4KdQEgR5yFFBOJ9emzJ7SfUzN
   Q==;
X-CSE-ConnectionGUID: szWzwbTQRiiR3IHbTlv/FA==
X-CSE-MsgGUID: 2IbXTsO1RSyvvzyl7nSPgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95292942"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="95292942"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:14:06 -0700
X-CSE-ConnectionGUID: zbNqiI85RsmO+MO+hVl5Fg==
X-CSE-MsgGUID: WLdju5XvTM2KOFckpYhRIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="285904723"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Jul 2026 04:14:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjb5K-00000000Mbs-2kiA;
	Tue, 14 Jul 2026 11:13:59 +0000
Date: Tue, 14 Jul 2026 19:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS WITH WARNING
 fccb8d28a4e3b8dcfa8606c1a8d225299f20b64e
Message-ID: <202607141916.ePqKscDi-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40053-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,intel.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 517D5753D0B

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: fccb8d28a4e3b8dcfa8606c1a8d225299f20b64e  dt-bindings: gpio: pca95xx: Document Kinetic KTS1622

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606270433.gAWekfd3-lkp@intel.com

    Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'

Warning ids grouped by kconfigs:

recent_errors
|-- i386-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- x86_64-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
`-- x86_64-allyesconfig
    `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info

elapsed time: 1289m

configs tested: 283
configs skipped: 40

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              alldefconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    clang-23
arc                          axs103_defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    clang-23
arc                   randconfig-001-20260713    gcc-8.5.0
arc                   randconfig-001-20260714    clang-23
arc                            randconfig-002    clang-23
arc                   randconfig-002-20260713    gcc-8.5.0
arc                   randconfig-002-20260714    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                       imx_v6_v7_defconfig    clang-23
arm                          ixp4xx_defconfig    gcc-16.1.0
arm                            randconfig-001    clang-23
arm                   randconfig-001-20260713    gcc-8.5.0
arm                   randconfig-001-20260714    clang-23
arm                            randconfig-002    clang-23
arm                   randconfig-002-20260713    gcc-8.5.0
arm                   randconfig-002-20260714    clang-23
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260713    gcc-8.5.0
arm                   randconfig-003-20260714    clang-23
arm                            randconfig-004    clang-23
arm                   randconfig-004-20260713    gcc-8.5.0
arm                   randconfig-004-20260714    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260713    gcc-13.4.0
arm64                 randconfig-001-20260714    gcc-16.1.0
arm64                 randconfig-002-20260713    gcc-13.4.0
arm64                 randconfig-002-20260714    gcc-16.1.0
arm64                 randconfig-003-20260713    gcc-13.4.0
arm64                 randconfig-003-20260714    gcc-16.1.0
arm64                 randconfig-004-20260713    gcc-13.4.0
arm64                 randconfig-004-20260714    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260713    gcc-13.4.0
csky                  randconfig-001-20260714    gcc-16.1.0
csky                  randconfig-002-20260713    gcc-13.4.0
csky                  randconfig-002-20260714    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260714    gcc-16.1.0
hexagon               randconfig-002-20260714    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260713    gcc-14
i386        buildonly-randconfig-001-20260714    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260713    gcc-14
i386        buildonly-randconfig-002-20260714    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260713    gcc-14
i386        buildonly-randconfig-003-20260714    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260713    gcc-14
i386        buildonly-randconfig-004-20260714    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260713    gcc-14
i386        buildonly-randconfig-005-20260714    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260713    gcc-14
i386        buildonly-randconfig-006-20260714    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260713    gcc-14
i386                  randconfig-001-20260714    gcc-13
i386                  randconfig-002-20260714    gcc-13
i386                  randconfig-003-20260713    gcc-14
i386                  randconfig-003-20260714    gcc-13
i386                  randconfig-004-20260713    gcc-14
i386                  randconfig-004-20260714    gcc-13
i386                  randconfig-005-20260713    gcc-14
i386                  randconfig-005-20260714    gcc-13
i386                  randconfig-006-20260713    gcc-14
i386                  randconfig-006-20260714    gcc-13
i386                  randconfig-007-20260713    gcc-14
i386                  randconfig-007-20260714    gcc-13
i386                  randconfig-011-20260714    clang-22
i386                  randconfig-011-20260714    gcc-14
i386                  randconfig-012-20260714    clang-22
i386                  randconfig-013-20260714    clang-22
i386                  randconfig-014-20260714    clang-22
i386                  randconfig-014-20260714    gcc-14
i386                  randconfig-015-20260714    clang-22
i386                  randconfig-015-20260714    gcc-14
i386                  randconfig-016-20260714    clang-22
i386                  randconfig-017-20260714    clang-22
i386                  randconfig-017-20260714    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260714    gcc-16.1.0
loongarch             randconfig-002-20260714    gcc-16.1.0
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
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260714    gcc-16.1.0
nios2                 randconfig-002-20260714    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-17
parisc                randconfig-001-20260713    clang-23
parisc                randconfig-001-20260714    clang-17
parisc                randconfig-001-20260714    gcc-11.5.0
parisc                         randconfig-002    clang-17
parisc                randconfig-002-20260713    clang-23
parisc                randconfig-002-20260714    clang-17
parisc                randconfig-002-20260714    gcc-11.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                   bluestone_defconfig    clang-23
powerpc                       holly_defconfig    clang-23
powerpc                        randconfig-001    clang-17
powerpc               randconfig-001-20260713    clang-23
powerpc               randconfig-001-20260714    clang-17
powerpc                        randconfig-002    clang-17
powerpc               randconfig-002-20260713    clang-23
powerpc               randconfig-002-20260714    clang-17
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260713    clang-23
powerpc64             randconfig-001-20260714    clang-17
powerpc64                      randconfig-002    clang-17
powerpc64             randconfig-002-20260713    clang-23
powerpc64             randconfig-002-20260714    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv             nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-10.5.0
riscv                 randconfig-001-20260713    gcc-16.1.0
riscv                 randconfig-001-20260714    gcc-10.5.0
riscv                          randconfig-002    gcc-10.5.0
riscv                 randconfig-002-20260714    gcc-10.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-10.5.0
s390                  randconfig-001-20260713    gcc-16.1.0
s390                  randconfig-001-20260714    gcc-10.5.0
s390                           randconfig-002    gcc-10.5.0
s390                  randconfig-002-20260713    gcc-16.1.0
s390                  randconfig-002-20260714    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-16.1.0
sh                             randconfig-001    gcc-10.5.0
sh                    randconfig-001-20260713    gcc-16.1.0
sh                    randconfig-001-20260714    gcc-10.5.0
sh                             randconfig-002    gcc-10.5.0
sh                    randconfig-002-20260713    gcc-16.1.0
sh                    randconfig-002-20260714    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260714    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260714    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260714    gcc-8.5.0
sparc64               randconfig-002-20260714    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260714    gcc-8.5.0
um                    randconfig-002-20260714    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260714    gcc-14
x86_64      buildonly-randconfig-002-20260714    gcc-14
x86_64      buildonly-randconfig-003-20260714    gcc-14
x86_64      buildonly-randconfig-004-20260714    gcc-14
x86_64      buildonly-randconfig-005-20260714    gcc-14
x86_64      buildonly-randconfig-006-20260714    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260714    clang-22
x86_64                randconfig-001-20260714    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260714    clang-22
x86_64                randconfig-002-20260714    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260714    clang-22
x86_64                randconfig-003-20260714    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260714    clang-22
x86_64                randconfig-004-20260714    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260714    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260714    clang-22
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260713    gcc-14
x86_64                randconfig-011-20260714    clang-22
x86_64                randconfig-011-20260714    gcc-14
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260713    gcc-14
x86_64                randconfig-012-20260714    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260713    gcc-14
x86_64                randconfig-013-20260714    clang-22
x86_64                randconfig-013-20260714    gcc-14
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260713    gcc-14
x86_64                randconfig-014-20260714    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260713    gcc-14
x86_64                randconfig-015-20260714    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260713    gcc-14
x86_64                randconfig-016-20260714    clang-22
x86_64                randconfig-016-20260714    gcc-14
x86_64                randconfig-071-20260714    gcc-14
x86_64                randconfig-072-20260714    gcc-14
x86_64                randconfig-073-20260713    gcc-14
x86_64                randconfig-073-20260714    gcc-14
x86_64                randconfig-074-20260713    gcc-14
x86_64                randconfig-074-20260714    gcc-14
x86_64                randconfig-075-20260713    gcc-14
x86_64                randconfig-075-20260714    gcc-14
x86_64                randconfig-076-20260713    gcc-14
x86_64                randconfig-076-20260714    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260714    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260714    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

