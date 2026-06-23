Return-Path: <linux-gpio+bounces-38831-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xFBlKho8Omr04QcAu9opvQ
	(envelope-from <linux-gpio+bounces-38831-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 09:56:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 764126B5072
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 09:56:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ialgUzkg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38831-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38831-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C834303A66E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 07:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16143C5DC5;
	Tue, 23 Jun 2026 07:56:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A463C4B91
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 07:56:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201367; cv=none; b=fhe2l4ZVLgLZcf3y7xMFSy92Bdx+expH5cjmWkcIkL+AV8NornM5xtvuCO6a1lPGAqyxiY1xn5zW0wjuGI4WK0Ng7B83MjQKc3+hO5gd7qThGdBE2TCAHwNWIJGVS+B+ts2eVHJ0cEla7iBl99bHK2zaqkH+5/zb8OnAKrzvVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201367; c=relaxed/simple;
	bh=0/JEk8SfTHi9tozvYPK9MOKjd+K9slccHWqnFgoI2K8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SvSmnPfxp/OkhUaiThzisNQUXAZyTaTW6ij4c7hiAl0HdoBJxBj+beCcMJXI0dlCqlLAMMiiJzuDxScco7m55oYJfSecfkyWJbLFHOe52sOpDlT7KnroQp/qCJpGGATpmaxuoYARKuXDj/14JR688lBZHgU8IjAMmM1szlyP0pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ialgUzkg; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782201367; x=1813737367;
  h=date:from:to:cc:subject:message-id;
  bh=0/JEk8SfTHi9tozvYPK9MOKjd+K9slccHWqnFgoI2K8=;
  b=ialgUzkgerT2THQpy1CSAbTbcTElmU0SBAnQI29oGKuDkgENZhEfROn7
   6oLdQXFpr6NNCrlZ4O80b1aYRrwP4o6jzj2QNHIZHsBj5Gu8RzP2UE8R7
   q6oy3CZQfLbCMoW/GyFts4gl6A3525KRTURTq5hHdLPB+3vvR2f6iICOh
   hNisXfArmhyBItG/kdLneXUWu7hkIJ/qmAW1TF0xrFCbjIFbH6gM4DC69
   GLz6Q5Pv2XGDx/fkgFatB429gLZ76ULUF+CuuolYRaghzjjgnpJrPT9YI
   2OJnSPOsdLLsRQfy9TWaixiJgj5hGj/0e6AJJhRgBLNeex6kn/e9BhE+9
   Q==;
X-CSE-ConnectionGUID: 8iJs2fjnS2+N8Hmez91LnA==
X-CSE-MsgGUID: S4VFOp73Rt+Q2USw6OxdZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93301939"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="93301939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 00:56:06 -0700
X-CSE-ConnectionGUID: sucv+LnRQRO/r3n27Kze0A==
X-CSE-MsgGUID: KOfyRpLkS1Swj4etw3vtYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="248564772"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Jun 2026 00:56:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbvzF-000000002KT-3wDw;
	Tue, 23 Jun 2026 07:56:01 +0000
Date: Tue, 23 Jun 2026 15:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-current] BUILD SUCCESS
 2d5a7d406ecece5837af1e278ffbbf6c0315560a
Message-ID: <202606231540.IEi38K0O-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38831-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 764126B5072

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-current
branch HEAD: 2d5a7d406ecece5837af1e278ffbbf6c0315560a  power: sequencing: fix ABBA deadlock in pwrseq_device_unregister()

elapsed time: 729m

configs tested: 196
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260623    clang-23
arc                   randconfig-002-20260623    clang-23
arc                           tb10x_defconfig    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260623    clang-23
arm                   randconfig-002-20260623    clang-23
arm                   randconfig-003-20260623    clang-23
arm                   randconfig-004-20260623    clang-23
arm                           spitz_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260623    gcc-14.3.0
arm64                 randconfig-002-20260623    gcc-14.3.0
arm64                 randconfig-003-20260623    gcc-14.3.0
arm64                 randconfig-004-20260623    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260623    gcc-14.3.0
csky                  randconfig-002-20260623    gcc-14.3.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260623    gcc-11.5.0
hexagon               randconfig-001-20260623    gcc-8.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260623    gcc-11.5.0
hexagon               randconfig-002-20260623    gcc-8.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260623    gcc-14
i386        buildonly-randconfig-002-20260623    gcc-14
i386        buildonly-randconfig-003-20260623    gcc-14
i386        buildonly-randconfig-004-20260623    gcc-14
i386        buildonly-randconfig-005-20260623    gcc-14
i386        buildonly-randconfig-006-20260623    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260623    clang-22
i386                  randconfig-002-20260623    clang-22
i386                  randconfig-003-20260623    clang-22
i386                  randconfig-004-20260623    clang-22
i386                  randconfig-005-20260623    clang-22
i386                  randconfig-006-20260623    clang-22
i386                  randconfig-007-20260623    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260623    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260623    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260623    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260623    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260623    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260623    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260623    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260623    gcc-11.5.0
loongarch             randconfig-001-20260623    gcc-8.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260623    gcc-11.5.0
loongarch             randconfig-002-20260623    gcc-8.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
m68k                       m5249evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260623    gcc-11.5.0
nios2                 randconfig-001-20260623    gcc-8.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260623    gcc-11.5.0
nios2                 randconfig-002-20260623    gcc-8.5.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260623    gcc-11.5.0
parisc                randconfig-002-20260623    gcc-11.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                      ppc44x_defconfig    clang-17
powerpc               randconfig-001-20260623    gcc-11.5.0
powerpc               randconfig-002-20260623    gcc-11.5.0
powerpc64             randconfig-001-20260623    gcc-11.5.0
powerpc64             randconfig-002-20260623    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260623    gcc-8.5.0
riscv                          randconfig-002    gcc-8.5.0
riscv                 randconfig-002-20260623    gcc-8.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-8.5.0
s390                  randconfig-001-20260623    gcc-8.5.0
s390                           randconfig-002    gcc-8.5.0
s390                  randconfig-002-20260623    gcc-8.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-8.5.0
sh                    randconfig-001-20260623    gcc-8.5.0
sh                             randconfig-002    gcc-8.5.0
sh                    randconfig-002-20260623    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260623    gcc-8.5.0
sparc                 randconfig-002-20260623    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260623    gcc-8.5.0
sparc64               randconfig-002-20260623    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260623    gcc-8.5.0
um                    randconfig-002-20260623    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260623    clang-22
x86_64      buildonly-randconfig-002-20260623    clang-22
x86_64      buildonly-randconfig-003-20260623    clang-22
x86_64      buildonly-randconfig-004-20260623    clang-22
x86_64      buildonly-randconfig-005-20260623    clang-22
x86_64      buildonly-randconfig-006-20260623    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260623    gcc-14
x86_64                randconfig-002-20260623    gcc-14
x86_64                randconfig-003-20260623    gcc-14
x86_64                randconfig-004-20260623    gcc-14
x86_64                randconfig-005-20260623    gcc-14
x86_64                randconfig-006-20260623    gcc-14
x86_64                randconfig-011-20260623    gcc-14
x86_64                randconfig-012-20260623    gcc-14
x86_64                randconfig-013-20260623    gcc-14
x86_64                randconfig-014-20260623    gcc-14
x86_64                randconfig-015-20260623    gcc-14
x86_64                randconfig-016-20260623    gcc-14
x86_64                randconfig-071-20260623    gcc-14
x86_64                randconfig-072-20260623    gcc-14
x86_64                randconfig-073-20260623    gcc-14
x86_64                randconfig-074-20260623    gcc-14
x86_64                randconfig-075-20260623    gcc-14
x86_64                randconfig-076-20260623    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260623    gcc-8.5.0
xtensa                randconfig-002-20260623    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

