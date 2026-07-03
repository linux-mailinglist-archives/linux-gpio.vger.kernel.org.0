Return-Path: <linux-gpio+bounces-39426-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vmz0D0wiSGrLmgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39426-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 22:57:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E61E7705A86
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 22:57:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=PtcrbCvb;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39426-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39426-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F091301E035
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 20:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA2B34C9AD;
	Fri,  3 Jul 2026 20:57:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3930ACFB
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 20:57:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783112266; cv=none; b=S2YAReaMFNqrXAqXlsBYtv1IthVzLc7gIENOVD+J5RAzhnZgu3bHIki0RKjuUxQLwXRSzsJztDQcIn9JpoIf5QXDVHUnUMO1WNCYNfpeRosPrteTUCLYRMDB9XU797nViGC9KS9A1sSOyEnWLVxmlsa+vytvK15T29EpfZzGjh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783112266; c=relaxed/simple;
	bh=QDjL3JwoZfjXpdK9ehvCA1nXuDObmjD59HQMwwFKeRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pigPNJdETmvfgxQOKlCgN1WuGg8lwz1IUbDzHlfCL6ebFS1t44s3P1lpndSGM98S/u2ucIjJd8mjCMfrTnx3Ojw2k+Z+bMiVf2nRXVjHIvDwCO4LKaUHpE7F4psYcfX62rw4CSNl9vJxe4+D0nQAVN3qY0e/gHlIXNzDVv3q+YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtcrbCvb; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783112263; x=1814648263;
  h=date:from:to:cc:subject:message-id;
  bh=QDjL3JwoZfjXpdK9ehvCA1nXuDObmjD59HQMwwFKeRo=;
  b=PtcrbCvbpv0C+5Fh/CEJcyRqwSSSIbLv+hG9KIN48fqf014WpBc8U3A+
   yblx0L/uYjv1szYDJio0dUYc8KPimT6bV9NUtKyVjE3BH22i/5OQjOnzK
   Jursl1Wckg2VMx5xlEX5+tquVjlgCuVQydYc07OELkzIQefnaIVlZu7zI
   9Z5SndNuun0fiMsgyl6yLH1Ct47eiK1fiYRjBDEs5rxYHc9b6chU/B8Vh
   vxEIWmTIypC3qf5VcrtX4Hbjp52ZzNh6V57OxbRe+0T4aLmH2T16G8aqo
   jUUfPuwaI/Y4gQelHrvWMZD7CEd//Ld83rO0KA7coOHelkgIVHZeq68Ht
   Q==;
X-CSE-ConnectionGUID: KXnpvoaWSYOAqSZ9otXScQ==
X-CSE-MsgGUID: cB3Y4cADR8m4XWgFWjjSdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83841832"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83841832"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 13:57:43 -0700
X-CSE-ConnectionGUID: LzujqwU+TpyjlwzpSEl5OQ==
X-CSE-MsgGUID: 6X2q+aWbR1mqYD+ojChPBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="251457745"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Jul 2026 13:57:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfkx1-00000000CVz-3YTn;
	Fri, 03 Jul 2026 20:57:33 +0000
Date: Sat, 04 Jul 2026 04:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS WITH WARNING
 edbcefc9b0d5925f8be4227fc180a92cd49d126e
Message-ID: <202607040427.uyoUKXrR-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39426-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,intel.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E61E7705A86

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: edbcefc9b0d5925f8be4227fc180a92cd49d126e  gpio: nomadik: drop "chip registered" log on probe success

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606270433.gAWekfd3-lkp@intel.com

    Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'

Warning ids grouped by kconfigs:

recent_errors
|-- nios2-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- openrisc-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- sparc64-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
`-- xtensa-allyesconfig
    `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info

elapsed time: 728m

configs tested: 315
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                          axs103_defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260703    gcc-16.1.0
arc                   randconfig-001-20260703    gcc-8.5.0
arc                   randconfig-001-20260704    gcc-8.5.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260703    gcc-16.1.0
arc                   randconfig-002-20260703    gcc-8.5.0
arc                   randconfig-002-20260704    gcc-8.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                        keystone_defconfig    gcc-16.1.0
arm                        mvebu_v7_defconfig    clang-23
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260703    gcc-16.1.0
arm                   randconfig-001-20260703    gcc-8.5.0
arm                   randconfig-001-20260704    gcc-8.5.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260703    gcc-16.1.0
arm                   randconfig-002-20260703    gcc-8.5.0
arm                   randconfig-002-20260704    gcc-8.5.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260703    gcc-16.1.0
arm                   randconfig-003-20260703    gcc-8.5.0
arm                   randconfig-003-20260704    gcc-8.5.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260703    gcc-16.1.0
arm                   randconfig-004-20260703    gcc-8.5.0
arm                   randconfig-004-20260704    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-10.5.0
arm64                 randconfig-001-20260703    gcc-10.5.0
arm64                 randconfig-001-20260704    gcc-16.1.0
arm64                          randconfig-002    gcc-10.5.0
arm64                 randconfig-002-20260703    gcc-10.5.0
arm64                 randconfig-002-20260704    gcc-16.1.0
arm64                          randconfig-003    gcc-10.5.0
arm64                 randconfig-003-20260703    gcc-10.5.0
arm64                 randconfig-003-20260704    gcc-16.1.0
arm64                          randconfig-004    gcc-10.5.0
arm64                 randconfig-004-20260703    gcc-10.5.0
arm64                 randconfig-004-20260704    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-10.5.0
csky                  randconfig-001-20260703    gcc-10.5.0
csky                  randconfig-001-20260704    gcc-16.1.0
csky                           randconfig-002    gcc-10.5.0
csky                  randconfig-002-20260703    gcc-10.5.0
csky                  randconfig-002-20260704    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260703    gcc-11.5.0
hexagon               randconfig-001-20260703    gcc-16.1.0
hexagon               randconfig-001-20260704    gcc-16.1.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260703    gcc-11.5.0
hexagon               randconfig-002-20260703    gcc-16.1.0
hexagon               randconfig-002-20260704    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260703    clang-22
i386        buildonly-randconfig-001-20260704    gcc-14
i386        buildonly-randconfig-002-20260703    clang-22
i386        buildonly-randconfig-002-20260704    gcc-14
i386        buildonly-randconfig-003-20260703    clang-22
i386        buildonly-randconfig-003-20260704    gcc-14
i386        buildonly-randconfig-004-20260703    clang-22
i386        buildonly-randconfig-004-20260704    gcc-14
i386        buildonly-randconfig-005-20260703    clang-22
i386        buildonly-randconfig-005-20260704    gcc-14
i386        buildonly-randconfig-006-20260703    clang-22
i386        buildonly-randconfig-006-20260704    gcc-14
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260703    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260703    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260703    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260703    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260703    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260703    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260703    clang-22
i386                           randconfig-011    clang-22
i386                  randconfig-011-20260703    clang-22
i386                  randconfig-011-20260704    gcc-13
i386                           randconfig-012    clang-22
i386                  randconfig-012-20260703    clang-22
i386                  randconfig-012-20260704    gcc-13
i386                           randconfig-013    clang-22
i386                  randconfig-013-20260703    clang-22
i386                  randconfig-013-20260704    gcc-13
i386                           randconfig-014    clang-22
i386                  randconfig-014-20260703    clang-22
i386                  randconfig-014-20260704    gcc-13
i386                           randconfig-015    clang-22
i386                  randconfig-015-20260703    clang-22
i386                  randconfig-015-20260704    gcc-13
i386                           randconfig-016    clang-22
i386                  randconfig-016-20260703    clang-22
i386                  randconfig-016-20260704    gcc-13
i386                           randconfig-017    clang-22
i386                  randconfig-017-20260703    clang-22
i386                  randconfig-017-20260704    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260703    gcc-11.5.0
loongarch             randconfig-001-20260703    gcc-16.1.0
loongarch             randconfig-001-20260704    gcc-16.1.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260703    gcc-11.5.0
loongarch             randconfig-002-20260703    gcc-16.1.0
loongarch             randconfig-002-20260704    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                          hp300_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                          eyeq5_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260703    gcc-11.5.0
nios2                 randconfig-001-20260703    gcc-16.1.0
nios2                 randconfig-001-20260704    gcc-16.1.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260703    gcc-11.5.0
nios2                 randconfig-002-20260703    gcc-16.1.0
nios2                 randconfig-002-20260704    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-23
parisc                randconfig-001-20260703    clang-23
parisc                randconfig-001-20260704    clang-23
parisc                         randconfig-002    clang-23
parisc                randconfig-002-20260703    clang-23
parisc                randconfig-002-20260704    clang-23
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                      chrp32_defconfig    clang-23
powerpc                     ep8248e_defconfig    gcc-16.1.0
powerpc                        randconfig-001    clang-23
powerpc               randconfig-001-20260703    clang-23
powerpc               randconfig-001-20260704    clang-23
powerpc                        randconfig-002    clang-23
powerpc               randconfig-002-20260703    clang-23
powerpc               randconfig-002-20260704    clang-23
powerpc64                      randconfig-001    clang-23
powerpc64             randconfig-001-20260703    clang-23
powerpc64             randconfig-001-20260704    clang-23
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260703    clang-23
powerpc64             randconfig-002-20260704    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260703    gcc-9.5.0
riscv                 randconfig-001-20260704    gcc-10.5.0
riscv                 randconfig-002-20260703    gcc-9.5.0
riscv                 randconfig-002-20260704    gcc-10.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260703    gcc-9.5.0
s390                  randconfig-001-20260704    gcc-10.5.0
s390                  randconfig-002-20260703    gcc-9.5.0
s390                  randconfig-002-20260704    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-16.1.0
sh                    randconfig-001-20260703    gcc-9.5.0
sh                    randconfig-001-20260704    gcc-10.5.0
sh                    randconfig-002-20260703    gcc-9.5.0
sh                    randconfig-002-20260704    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260703    gcc-11.5.0
sparc                 randconfig-001-20260704    gcc-16.1.0
sparc                 randconfig-002-20260703    gcc-11.5.0
sparc                 randconfig-002-20260704    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260703    gcc-11.5.0
sparc64               randconfig-001-20260704    gcc-16.1.0
sparc64               randconfig-002-20260703    gcc-11.5.0
sparc64               randconfig-002-20260704    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260703    gcc-11.5.0
um                    randconfig-001-20260704    gcc-16.1.0
um                    randconfig-002-20260703    gcc-11.5.0
um                    randconfig-002-20260704    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260703    gcc-14
x86_64      buildonly-randconfig-001-20260704    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260703    gcc-14
x86_64      buildonly-randconfig-002-20260704    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260703    gcc-14
x86_64      buildonly-randconfig-003-20260704    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260703    gcc-14
x86_64      buildonly-randconfig-004-20260704    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260703    gcc-14
x86_64      buildonly-randconfig-005-20260704    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260703    gcc-14
x86_64      buildonly-randconfig-006-20260704    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260703    clang-22
x86_64                randconfig-001-20260704    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260703    clang-22
x86_64                randconfig-002-20260704    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260703    clang-22
x86_64                randconfig-003-20260704    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260703    clang-22
x86_64                randconfig-004-20260704    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260703    clang-22
x86_64                randconfig-005-20260704    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260703    clang-22
x86_64                randconfig-006-20260704    clang-22
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260703    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260703    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260703    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260703    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260703    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260703    gcc-14
x86_64                         randconfig-071    clang-22
x86_64                randconfig-071-20260703    clang-22
x86_64                         randconfig-072    clang-22
x86_64                randconfig-072-20260703    clang-22
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260703    clang-22
x86_64                         randconfig-074    clang-22
x86_64                randconfig-074-20260703    clang-22
x86_64                         randconfig-075    clang-22
x86_64                randconfig-075-20260703    clang-22
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260703    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260703    gcc-11.5.0
xtensa                randconfig-001-20260704    gcc-16.1.0
xtensa                randconfig-002-20260703    gcc-11.5.0
xtensa                randconfig-002-20260704    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

