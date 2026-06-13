Return-Path: <linux-gpio+bounces-38411-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J1cALF/dLWr2lgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38411-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 00:44:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40567FF2B
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 00:44:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="YR/1QunY";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38411-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38411-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D32A03018D7A
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 22:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0099A375AD0;
	Sat, 13 Jun 2026 22:44:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FDA223DCE
	for <linux-gpio@vger.kernel.org>; Sat, 13 Jun 2026 22:44:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781390684; cv=none; b=u754esn85GbeTfHxYtDJf3ZGiKOhmULRHJZoXMhErQZn4CQ/yvftt9MHjjz2L/uMKA0EU4YSrz+iN5T+MK3g7Rq0y5lAaxiuaUxo0ign+YOQK+5LiuE2+oL2wqvSIrRomQB8d4BbYbmiPhc9u0hhblLP7NzqmlLj70APCnRRDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781390684; c=relaxed/simple;
	bh=OCSWFKzgDuYsjMxN6mDk9KDcxNTzvq28959VQEZNYHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W27228tafsXFVngEMUFRTE8vib9NW97kHwL4bUuCmHFfp0+wThASTW+il8xpZKpaeBDYmctSaw2fU6/xSErnZpSN/M6AEWVxnvwx7gtKfLbTkZtVnl/EURY9EnSJUF62eGDgVh+AcFzbd/kkPZdl6GxDgEBhzAMXALnXlHrhIaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YR/1QunY; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781390683; x=1812926683;
  h=date:from:to:cc:subject:message-id;
  bh=OCSWFKzgDuYsjMxN6mDk9KDcxNTzvq28959VQEZNYHc=;
  b=YR/1QunYzg9UCCxQffJ6QVFFsEFNj3ILTnAiom5BSk5FLhgdbhv89ez2
   lZPyBYUNv7Lx8ILfx/yYF7Rs5dWp+E3KvuwtHGm+RoyIPJoVn9nuGWcaG
   rzVkh2r0frzIBXc3IbwY7AVw4hJC4H3BjdfTpNxqieWBAK2Mhtzl5vKhi
   pia+YPmo6s75ncZ2e1fzpbkN54fIj87zDvRFnJgxS6oE8rUO511hyYHbT
   RuckkeVrTIu2r+wRTtkRf6dSgs7QhQpYoKfRzxjtqIsoqLEPF9nNjLn1o
   DKf5HXklidrjRTlJdZ32yRfzo/DMeLL992MSQoR42ZZovQlrWhQTqR7CA
   A==;
X-CSE-ConnectionGUID: 8j0OXCRvTku7bf/RClPMGQ==
X-CSE-MsgGUID: eoBm3mg3QamM77zXePUxsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="93295970"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="93295970"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 15:44:43 -0700
X-CSE-ConnectionGUID: umgblWy4TvOyhrEmA3zX/A==
X-CSE-MsgGUID: yXViHueDSJON1b8ZMlrSMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="244714451"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2026 15:44:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYX5i-00000000QKo-3AZZ;
	Sat, 13 Jun 2026 22:44:38 +0000
Date: Sun, 14 Jun 2026 06:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD REGRESSION
 e3d967e6ef2f9605b132eabac64e984d884c81cf
Message-ID: <202606140616.qzPWRKqm-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-38411-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 0B40567FF2B

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: e3d967e6ef2f9605b132eabac64e984d884c81cf  gpio: pisosr: Read "ngpios" as u32

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606130210.ytVPxHlm-lkp@intel.com

    ERROR: modpost: "pinctrl_get_group_selector" [drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.ko] undefined!

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined
|-- csky-allmodconfig
|   `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined
|-- hexagon-allmodconfig
|   `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined
|-- i386-allmodconfig
|   `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined
|-- mips-allmodconfig
|   `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined
|-- nios2-allmodconfig
|   `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined
|-- powerpc-allmodconfig
|   `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined
|-- riscv-allmodconfig
|   `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined
|-- s390-allmodconfig
|   `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined
`-- x86_64-allmodconfig
    `-- ERROR:pinctrl_get_group_selector-drivers-pinctrl-ultrarisc-pinctrl-ultrarisc.ko-undefined

elapsed time: 838m

configs tested: 284
configs skipped: 11

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
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260613    gcc-12.5.0
arc                   randconfig-001-20260614    gcc-11.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260613    gcc-14.3.0
arc                   randconfig-002-20260614    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260613    gcc-8.5.0
arm                   randconfig-001-20260614    gcc-11.5.0
arm                            randconfig-002    gcc-15.2.0
arm                   randconfig-002-20260613    clang-17
arm                   randconfig-002-20260614    gcc-11.5.0
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260613    clang-23
arm                   randconfig-003-20260614    gcc-11.5.0
arm                            randconfig-004    gcc-13.4.0
arm                   randconfig-004-20260613    clang-23
arm                   randconfig-004-20260614    gcc-11.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260613    gcc-16.1.0
arm64                          randconfig-002    gcc-8.5.0
arm64                 randconfig-002-20260613    clang-16
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20260613    clang-23
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260613    clang-19
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-13.4.0
csky                  randconfig-001-20260613    gcc-16.1.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260613    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260613    clang-23
hexagon               randconfig-001-20260614    clang-17
hexagon               randconfig-002-20260613    clang-23
hexagon               randconfig-002-20260614    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260613    gcc-14
i386        buildonly-randconfig-001-20260614    gcc-14
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260613    gcc-14
i386        buildonly-randconfig-002-20260614    gcc-14
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260613    clang-22
i386        buildonly-randconfig-003-20260614    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260613    gcc-13
i386        buildonly-randconfig-004-20260614    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260613    clang-22
i386        buildonly-randconfig-005-20260614    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260613    gcc-14
i386        buildonly-randconfig-006-20260614    gcc-14
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260613    gcc-14
i386                  randconfig-002-20260613    clang-22
i386                  randconfig-003-20260613    gcc-14
i386                  randconfig-004-20260613    clang-22
i386                  randconfig-005-20260613    clang-22
i386                  randconfig-006-20260613    gcc-14
i386                  randconfig-007-20260613    clang-22
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260613    clang-22
i386                  randconfig-011-20260614    clang-22
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260613    clang-22
i386                  randconfig-012-20260614    clang-22
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260613    gcc-14
i386                  randconfig-013-20260614    clang-22
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260613    gcc-14
i386                  randconfig-014-20260614    clang-22
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260613    gcc-14
i386                  randconfig-015-20260614    clang-22
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260613    gcc-14
i386                  randconfig-016-20260614    clang-22
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260613    gcc-14
i386                  randconfig-017-20260614    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260613    clang-18
loongarch             randconfig-001-20260614    clang-17
loongarch             randconfig-002-20260613    clang-23
loongarch             randconfig-002-20260614    clang-17
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                            gpr_defconfig    clang-23
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260613    gcc-11.5.0
nios2                 randconfig-001-20260614    clang-17
nios2                 randconfig-002-20260613    gcc-10.5.0
nios2                 randconfig-002-20260614    clang-17
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260613    gcc-9.5.0
parisc                randconfig-001-20260614    gcc-12.5.0
parisc                         randconfig-002    gcc-12.5.0
parisc                randconfig-002-20260613    gcc-15.2.0
parisc                randconfig-002-20260614    gcc-12.5.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                        randconfig-001    gcc-10.5.0
powerpc               randconfig-001-20260613    gcc-14.3.0
powerpc               randconfig-001-20260614    gcc-12.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260613    gcc-8.5.0
powerpc               randconfig-002-20260614    gcc-12.5.0
powerpc64                      randconfig-001    clang-16
powerpc64             randconfig-001-20260613    clang-23
powerpc64             randconfig-001-20260614    gcc-12.5.0
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260613    clang-16
powerpc64             randconfig-002-20260614    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260614    gcc-9.5.0
riscv                 randconfig-002-20260614    gcc-9.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260614    gcc-9.5.0
s390                  randconfig-002-20260614    gcc-9.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                          r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-001-20260614    gcc-9.5.0
sh                    randconfig-002-20260614    gcc-9.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260613    gcc-11.5.0
sparc                 randconfig-001-20260614    gcc-8.5.0
sparc                 randconfig-002-20260613    gcc-13.4.0
sparc                 randconfig-002-20260614    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260613    gcc-11.5.0
sparc64               randconfig-001-20260614    gcc-8.5.0
sparc64               randconfig-002-20260613    clang-23
sparc64               randconfig-002-20260614    gcc-8.5.0
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260613    gcc-14
um                    randconfig-001-20260614    gcc-8.5.0
um                    randconfig-002-20260613    gcc-14
um                    randconfig-002-20260614    gcc-8.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260613    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260613    clang-22
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260613    clang-22
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260613    clang-22
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260613    gcc-14
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260613    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-003-20260613    gcc-14
x86_64                randconfig-006-20260613    clang-22
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260613    clang-22
x86_64                randconfig-071-20260614    clang-22
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260613    clang-22
x86_64                randconfig-072-20260614    clang-22
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260613    clang-22
x86_64                randconfig-073-20260614    clang-22
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260613    gcc-13
x86_64                randconfig-074-20260614    clang-22
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260613    gcc-14
x86_64                randconfig-075-20260614    clang-22
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260613    gcc-14
x86_64                randconfig-076-20260614    clang-22
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
xtensa                randconfig-001-20260613    gcc-11.5.0
xtensa                randconfig-001-20260614    gcc-8.5.0
xtensa                randconfig-002-20260613    gcc-8.5.0
xtensa                randconfig-002-20260614    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

