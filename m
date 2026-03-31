Return-Path: <linux-gpio+bounces-34478-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAkNOiDHy2mnLgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34478-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:07:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F24369F0F
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78AE23030D1D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B223E1217;
	Tue, 31 Mar 2026 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfi73Pxw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AE83E3D8D
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962098; cv=none; b=d9DY8lwxuEHLR+ekWLkg+LzZkepclxdiS+iMg2AMeM6q4xTqXUZlqXGui84Tdjh0r4JKhxLfPCHQnua0VJnHWbsK8WGgR8/oayoXdmDGUIwuHOeEDXnq9vjcijKryr1ov3J8gnaTpV+X9zTQ9gm2dUeGeHV+RicUD9SG28eswEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962098; c=relaxed/simple;
	bh=tMzs4Fu7cXkOiQz1hLq73EELeHJfkbTHLXH2dLdoS78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QoEbM5e0dwn8YWKCrEiOtmSn5tbL1ZAJzyIhaNqCiMKBnwtFIUzQkFEtD/MUoRYT5ldFvQB2VfmKxk2xinL1+/DlIULX+XxpxUt4vSPcpnT16l1ogZry3Omu5BDALqabYif/7d+wZOQyyebws92imaG0+NCVujmvy9BdNnllO48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfi73Pxw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774962097; x=1806498097;
  h=date:from:to:cc:subject:message-id;
  bh=tMzs4Fu7cXkOiQz1hLq73EELeHJfkbTHLXH2dLdoS78=;
  b=bfi73PxwcgSyZoJ1SolumTfa4yc1f6+Pwn/8vnZw8OtPtFXEMh+VJcZm
   KxcsnkCGR5VQjhFeGZiwWv8nxzpCZz3giCwfD/llCtoKmvuKR1/TCQBcn
   +W9lRkpu2Oye6Pp30Fo09cpNLe43kDiKcBsP8FmmeqjYy974UeKgL8UTb
   uWc9cZSlpWtGh2XBaCoBmSbvVyFkQn4TZkQAnUlgI3ejtEbkZXnO3KgB4
   1YRplhxl09lWD7CNJWQE4F/J0GhGTc71R8xrJY5mo1oux2gg2a0ZXp32B
   n/Y4PyXy22U2UxXW9AFFc0r7Y4WrriBob6XnHIZ/DlGy91XtlgneiiURq
   w==;
X-CSE-ConnectionGUID: H5fGy7WpTF6tJHvbB4uzSA==
X-CSE-MsgGUID: Krft0aTPTDiT09s0TgQhnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75145815"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75145815"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:01:36 -0700
X-CSE-ConnectionGUID: pimwqL/wRZaCYPRfIxF1RA==
X-CSE-MsgGUID: NaQu2goxRiGZCG/0YaeDuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="225530187"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Mar 2026 06:01:34 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Yip-000000002dl-2DkB;
	Tue, 31 Mar 2026 13:01:31 +0000
Date: Tue, 31 Mar 2026 21:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 802c51a83e9a0617d1e97ecd383471f4c6fd5437
Message-ID: <202603312137.yy0PGLQ8-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34478-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72F24369F0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 802c51a83e9a0617d1e97ecd383471f4c6fd5437  gpiolib: fix hogs with multiple lines

elapsed time: 752m

configs tested: 174
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
arc                   randconfig-001-20260331    clang-23
arc                   randconfig-002-20260331    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    clang-23
arm                   randconfig-001-20260331    clang-23
arm                   randconfig-002-20260331    clang-23
arm                   randconfig-003-20260331    clang-23
arm                   randconfig-004-20260331    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260331    clang-18
arm64                 randconfig-002-20260331    clang-18
arm64                 randconfig-003-20260331    clang-18
arm64                 randconfig-004-20260331    clang-18
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260331    clang-18
csky                  randconfig-002-20260331    clang-18
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260331    gcc-11.5.0
hexagon               randconfig-002-20260331    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260331    clang-20
i386        buildonly-randconfig-002-20260331    clang-20
i386        buildonly-randconfig-003-20260331    clang-20
i386        buildonly-randconfig-004-20260331    clang-20
i386        buildonly-randconfig-005-20260331    clang-20
i386        buildonly-randconfig-006-20260331    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260331    gcc-14
i386                  randconfig-002-20260331    gcc-14
i386                  randconfig-003-20260331    gcc-14
i386                  randconfig-004-20260331    gcc-14
i386                  randconfig-005-20260331    gcc-14
i386                  randconfig-006-20260331    gcc-14
i386                  randconfig-007-20260331    gcc-14
i386                  randconfig-011-20260331    clang-20
i386                  randconfig-012-20260331    clang-20
i386                  randconfig-013-20260331    clang-20
i386                  randconfig-014-20260331    clang-20
i386                  randconfig-015-20260331    clang-20
i386                  randconfig-016-20260331    clang-20
i386                  randconfig-017-20260331    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260331    gcc-11.5.0
loongarch             randconfig-002-20260331    gcc-11.5.0
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
mips                           ip32_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260331    gcc-11.5.0
nios2                 randconfig-002-20260331    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260331    clang-23
parisc                randconfig-002-20260331    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      pcm030_defconfig    clang-23
powerpc               randconfig-001-20260331    clang-23
powerpc               randconfig-002-20260331    clang-23
powerpc64                        alldefconfig    clang-23
powerpc64             randconfig-001-20260331    clang-23
powerpc64             randconfig-002-20260331    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260331    gcc-15.2.0
riscv                 randconfig-002-20260331    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260331    gcc-15.2.0
s390                  randconfig-002-20260331    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260331    gcc-15.2.0
sh                    randconfig-002-20260331    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260331    gcc-15.2.0
sparc                 randconfig-002-20260331    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260331    gcc-15.2.0
sparc64               randconfig-002-20260331    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260331    gcc-15.2.0
um                    randconfig-002-20260331    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260331    clang-20
x86_64      buildonly-randconfig-002-20260331    clang-20
x86_64      buildonly-randconfig-003-20260331    clang-20
x86_64      buildonly-randconfig-004-20260331    clang-20
x86_64      buildonly-randconfig-005-20260331    clang-20
x86_64      buildonly-randconfig-006-20260331    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260331    gcc-14
x86_64                randconfig-002-20260331    gcc-14
x86_64                randconfig-003-20260331    gcc-14
x86_64                randconfig-004-20260331    gcc-14
x86_64                randconfig-005-20260331    gcc-14
x86_64                randconfig-006-20260331    gcc-14
x86_64                randconfig-011-20260331    clang-20
x86_64                randconfig-012-20260331    clang-20
x86_64                randconfig-013-20260331    clang-20
x86_64                randconfig-014-20260331    clang-20
x86_64                randconfig-015-20260331    clang-20
x86_64                randconfig-016-20260331    clang-20
x86_64                randconfig-071-20260331    clang-20
x86_64                randconfig-072-20260331    clang-20
x86_64                randconfig-073-20260331    clang-20
x86_64                randconfig-074-20260331    clang-20
x86_64                randconfig-075-20260331    clang-20
x86_64                randconfig-076-20260331    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260331    gcc-15.2.0
xtensa                randconfig-002-20260331    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

