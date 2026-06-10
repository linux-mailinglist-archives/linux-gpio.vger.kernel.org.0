Return-Path: <linux-gpio+bounces-38300-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GZ7eDyfiKWrgewMAu9opvQ
	(envelope-from <linux-gpio+bounces-38300-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 00:16:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BA66D2B6
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 00:16:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=RWzt+5H0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38300-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38300-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 481B830CF1B3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 22:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4162306749;
	Wed, 10 Jun 2026 22:16:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9084D26FD9B
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 22:16:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781129763; cv=none; b=FXmgqnHEVH8hCN7QFOJWsHxHBzKcJCObLm/HeywuDswQxTOl7WT65Ycc8xfQsiSDuCV5s1jcuB4O8y9NVaC0NAKonegq3IGiiDm+G/Qvbc2exZUQqUL2RLXj8I5isvYvM55VXmJGKDad6+Mb0uzI0aOxX8MwGzWpsaLPSNtbyD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781129763; c=relaxed/simple;
	bh=MIKuF0mjEhGK9oAxQnDzbs6SjIefXF/IybS5p0oIsko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gjNM64YRlg5wFBPhxrY1E2yQ4iV3IgWdoGsPBXlHbawYpP9kcb9sOWJ2WKlQYIinSxu6SKSYw1160RfqnY44/yx1FJSv4vqSLnUzjGa7zKtm+LGVYILJJPeyxZuuUzJv+75wcvregsJxh+rrZZ5/24ual+YjDS7CoGKTv7oKHyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWzt+5H0; arc=none smtp.client-ip=198.175.65.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781129761; x=1812665761;
  h=date:from:to:cc:subject:message-id;
  bh=MIKuF0mjEhGK9oAxQnDzbs6SjIefXF/IybS5p0oIsko=;
  b=RWzt+5H0P9KM9S1SNb7q2Ejz6+ujWQA2prgrXPmlqRBbX5x1lUzqQv2X
   xfASHi1bMiOuIf/9fxVykUuJg+lU3OoBpg0zsDs0OhtLLeBZdZKTtWKog
   HVbW5rzNH2qgd1ir3llDupYXcurCrhB75usDWrVD13CCmD8hYP3nez5Xt
   bKMVqN1DQUahsbQhCpfKZ0QCKxur/+jOt+WSLvMmf64UVSYA40aghAYaJ
   x1PmZjF++2arxUjRgO9VqMcCXpe/GeX3B8qaE/Svgw399sM3a/yffvgqT
   eLVvyLHq5+fkz0oi5jZ4HWY7X2nO4DisbJX+5ES9qsf54Vn4bfrAA2h/S
   Q==;
X-CSE-ConnectionGUID: 8EwFTa+qQI+ztWbYDmST1Q==
X-CSE-MsgGUID: pzuwbrAKRRS2nKrJGgXXVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82129654"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="82129654"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 15:16:01 -0700
X-CSE-ConnectionGUID: TnUZTg4PTpqJH6cBYcnOXw==
X-CSE-MsgGUID: RYjL/M71R8qeIOyQlDLmIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="270302602"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jun 2026 15:15:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXRDJ-00000000Lxk-0g5i;
	Wed, 10 Jun 2026 22:15:57 +0000
Date: Thu, 11 Jun 2026 06:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 a23226b7c1f69eafd9ced4e037fb51c9758c0501
Message-ID: <202606110653.V72aHT4Y-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38300-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B0BA66D2B6

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: a23226b7c1f69eafd9ced4e037fb51c9758c0501  gpiolib: handle gpio-hogs only once

elapsed time: 831m

configs tested: 269
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

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
arc                   randconfig-001-20260610    gcc-8.5.0
arc                   randconfig-001-20260611    gcc-14.3.0
arc                   randconfig-002-20260610    gcc-8.5.0
arc                   randconfig-002-20260611    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                        mvebu_v7_defconfig    clang-23
arm                   randconfig-001-20260610    gcc-8.5.0
arm                   randconfig-001-20260611    gcc-14.3.0
arm                   randconfig-002-20260610    gcc-8.5.0
arm                   randconfig-002-20260611    gcc-14.3.0
arm                   randconfig-003-20260610    gcc-8.5.0
arm                   randconfig-003-20260611    gcc-14.3.0
arm                   randconfig-004-20260610    gcc-8.5.0
arm                   randconfig-004-20260611    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260610    gcc-11.5.0
arm64                 randconfig-001-20260611    gcc-14.3.0
arm64                 randconfig-002-20260610    gcc-11.5.0
arm64                 randconfig-002-20260611    gcc-14.3.0
arm64                 randconfig-003-20260610    gcc-11.5.0
arm64                 randconfig-003-20260611    gcc-14.3.0
arm64                 randconfig-004-20260610    gcc-11.5.0
arm64                 randconfig-004-20260611    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260610    gcc-11.5.0
csky                  randconfig-001-20260611    gcc-14.3.0
csky                  randconfig-002-20260610    gcc-11.5.0
csky                  randconfig-002-20260611    gcc-14.3.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260611    clang-17
hexagon               randconfig-002-20260611    clang-17
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260610    gcc-14
i386        buildonly-randconfig-001-20260611    clang-22
i386        buildonly-randconfig-002-20260610    gcc-14
i386        buildonly-randconfig-002-20260611    clang-22
i386        buildonly-randconfig-003-20260610    gcc-14
i386        buildonly-randconfig-003-20260611    clang-22
i386        buildonly-randconfig-004-20260610    gcc-14
i386        buildonly-randconfig-004-20260611    clang-22
i386        buildonly-randconfig-005-20260610    gcc-14
i386        buildonly-randconfig-005-20260611    clang-22
i386        buildonly-randconfig-006-20260610    gcc-14
i386        buildonly-randconfig-006-20260611    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260610    gcc-14
i386                  randconfig-001-20260611    gcc-14
i386                  randconfig-002-20260610    gcc-14
i386                  randconfig-002-20260611    gcc-14
i386                  randconfig-003-20260610    gcc-14
i386                  randconfig-003-20260611    gcc-14
i386                  randconfig-004-20260610    gcc-14
i386                  randconfig-004-20260611    gcc-14
i386                  randconfig-005-20260610    gcc-14
i386                  randconfig-005-20260611    gcc-14
i386                  randconfig-006-20260610    gcc-14
i386                  randconfig-006-20260611    gcc-14
i386                  randconfig-007-20260610    gcc-14
i386                  randconfig-007-20260611    gcc-14
i386                  randconfig-011-20260610    gcc-14
i386                  randconfig-011-20260611    gcc-14
i386                  randconfig-012-20260610    gcc-14
i386                  randconfig-012-20260611    gcc-14
i386                  randconfig-013-20260610    gcc-14
i386                  randconfig-013-20260611    gcc-14
i386                  randconfig-014-20260610    gcc-14
i386                  randconfig-014-20260611    gcc-14
i386                  randconfig-015-20260610    gcc-14
i386                  randconfig-015-20260611    gcc-14
i386                  randconfig-016-20260610    gcc-14
i386                  randconfig-016-20260611    gcc-14
i386                  randconfig-017-20260610    gcc-14
i386                  randconfig-017-20260611    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260611    clang-17
loongarch             randconfig-002-20260611    clang-17
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                         apollo_defconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                        m5272c3_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260611    clang-17
nios2                 randconfig-002-20260611    clang-17
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
openrisc                 simple_smp_defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260611    gcc-13.4.0
parisc                randconfig-002-20260611    gcc-13.4.0
parisc64                            defconfig    clang-23
powerpc                     akebono_defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260611    gcc-13.4.0
powerpc               randconfig-002-20260611    gcc-13.4.0
powerpc64             randconfig-001-20260611    gcc-13.4.0
powerpc64             randconfig-002-20260611    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260610    gcc-16.1.0
riscv                 randconfig-001-20260611    gcc-12.5.0
riscv                 randconfig-002-20260610    gcc-16.1.0
riscv                 randconfig-002-20260611    gcc-12.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260610    gcc-16.1.0
s390                  randconfig-001-20260611    gcc-12.5.0
s390                  randconfig-002-20260610    gcc-16.1.0
s390                  randconfig-002-20260611    gcc-12.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260610    gcc-16.1.0
sh                    randconfig-001-20260611    gcc-12.5.0
sh                    randconfig-002-20260610    gcc-16.1.0
sh                    randconfig-002-20260611    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260610    gcc-14.3.0
sparc                 randconfig-001-20260611    gcc-15.2.0
sparc                 randconfig-002-20260610    gcc-14.3.0
sparc                 randconfig-002-20260611    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260610    gcc-14.3.0
sparc64               randconfig-001-20260611    gcc-15.2.0
sparc64               randconfig-002-20260610    gcc-14.3.0
sparc64               randconfig-002-20260611    gcc-15.2.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260610    gcc-14.3.0
um                    randconfig-001-20260611    gcc-15.2.0
um                    randconfig-002-20260610    gcc-14.3.0
um                    randconfig-002-20260611    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260610    gcc-14
x86_64      buildonly-randconfig-001-20260611    gcc-14
x86_64      buildonly-randconfig-002-20260610    gcc-14
x86_64      buildonly-randconfig-002-20260611    gcc-14
x86_64      buildonly-randconfig-003-20260610    gcc-14
x86_64      buildonly-randconfig-003-20260611    gcc-14
x86_64      buildonly-randconfig-004-20260610    gcc-14
x86_64      buildonly-randconfig-004-20260611    gcc-14
x86_64      buildonly-randconfig-005-20260610    gcc-14
x86_64      buildonly-randconfig-005-20260611    gcc-14
x86_64      buildonly-randconfig-006-20260610    gcc-14
x86_64      buildonly-randconfig-006-20260611    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260610    gcc-13
x86_64                randconfig-001-20260611    gcc-14
x86_64                randconfig-002-20260610    gcc-13
x86_64                randconfig-002-20260611    gcc-14
x86_64                randconfig-003-20260610    gcc-13
x86_64                randconfig-003-20260611    gcc-14
x86_64                randconfig-004-20260610    gcc-13
x86_64                randconfig-004-20260611    gcc-14
x86_64                randconfig-005-20260610    gcc-13
x86_64                randconfig-005-20260611    gcc-14
x86_64                randconfig-006-20260610    gcc-13
x86_64                randconfig-006-20260611    gcc-14
x86_64                randconfig-011-20260610    gcc-14
x86_64                randconfig-011-20260611    gcc-14
x86_64                randconfig-012-20260610    gcc-14
x86_64                randconfig-012-20260611    gcc-14
x86_64                randconfig-013-20260610    gcc-14
x86_64                randconfig-013-20260611    gcc-14
x86_64                randconfig-014-20260610    gcc-14
x86_64                randconfig-014-20260611    gcc-14
x86_64                randconfig-015-20260610    gcc-14
x86_64                randconfig-015-20260611    gcc-14
x86_64                randconfig-016-20260610    gcc-14
x86_64                randconfig-016-20260611    gcc-14
x86_64                randconfig-071-20260610    gcc-14
x86_64                randconfig-071-20260611    clang-22
x86_64                randconfig-072-20260610    gcc-14
x86_64                randconfig-072-20260611    clang-22
x86_64                randconfig-073-20260610    gcc-14
x86_64                randconfig-073-20260611    clang-22
x86_64                randconfig-074-20260610    gcc-14
x86_64                randconfig-074-20260611    clang-22
x86_64                randconfig-075-20260610    gcc-14
x86_64                randconfig-075-20260611    clang-22
x86_64                randconfig-076-20260610    gcc-14
x86_64                randconfig-076-20260611    clang-22
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
xtensa                randconfig-001-20260610    gcc-14.3.0
xtensa                randconfig-001-20260611    gcc-15.2.0
xtensa                randconfig-002-20260610    gcc-14.3.0
xtensa                randconfig-002-20260611    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

