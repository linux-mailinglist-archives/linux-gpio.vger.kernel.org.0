Return-Path: <linux-gpio+bounces-34978-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNbGHEqG2GlAeggAu9opvQ
	(envelope-from <linux-gpio+bounces-34978-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 07:10:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2635C3D23C1
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 07:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E24F300F1A3
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 05:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CE933343B;
	Fri, 10 Apr 2026 05:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iD4BpbFr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2013346A0
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 05:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775797813; cv=none; b=MRcFb0XA+kuZgzHRR+NZ2VciLEnaGFZ6pNaVIR4T/so+Nm+zSmSWFgcLtZE5YS6Hh/6Qc5cY0czAoXueiNwAY8nG7XcXPfvUP5mlzn+GYgeX05nB8PIKiR4cHFxEgZUFcZNampMqJ9BQmwu/aVG2IFMl8+kmmyg7jNHb+qcOIQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775797813; c=relaxed/simple;
	bh=n1BsBiBYRysHNMIZ4m3EV6QylfxgppxlVxILdMpz508=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PckQoiKgbgjSA+2ZdEXjWp+EciXbt6wzyxIbl4DJluEdCj9YPe8LxwmR8V+0BET4MlXhdngSSBCAf8lc6i8JOcyQIl2ionL2M1HmXdd4V7K43piMRTypsJLoWbcZ0cbcJ3op2nGBoYGaqUncIxvqkXvtTr8hIeJMUXX1HmyXz20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iD4BpbFr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775797811; x=1807333811;
  h=date:from:to:cc:subject:message-id;
  bh=n1BsBiBYRysHNMIZ4m3EV6QylfxgppxlVxILdMpz508=;
  b=iD4BpbFr3fOX73OpQxPhc05nQdGT6oNsBHX65BbUFqIJbpdfVZjaEzVq
   vYZsbfvZpsJV2ZIBkxgFB6P5DhGC90BAdModaSWWlZenF0ThWFK5adF9o
   3BMZB1jJSYnroYTeuGmza1wmBBFSyuzT20vZXTLo/zEEQKfUbDp8f6Kkz
   a86Nhz3Oub99jrUPYU4Lqj6UEUgfp3Inj6AbCpDIxHXX78y1AcNaa8UGD
   JPmX8d8p83DQlwGliVht6Kv4IZNT6Obd2/TIkXc38cl91ccr4crqLygLN
   DpHbEWkLkD+p4QWlASSD8a8nz1Fx1YOzIgF5nFiz47Mu+wABPi1wk9iRm
   Q==;
X-CSE-ConnectionGUID: DYWGH1yHT5+ZySw4QUsrDw==
X-CSE-MsgGUID: PDAT424eSDmN5T3xKJh3KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="99443928"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="99443928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:10:00 -0700
X-CSE-ConnectionGUID: qVofCk62RNSD3rfXPrRPcg==
X-CSE-MsgGUID: 5MnDod47QLOOcE47y3XUdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="227979389"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2026 22:09:57 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB47u-000000001Ga-0G1C;
	Fri, 10 Apr 2026 05:09:54 +0000
Date: Fri, 10 Apr 2026 13:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-mux-pinctrl] BUILD SUCCESS
 62f97854fd4bf56e5eb15970787aa4125ea912cd
Message-ID: <202604101328.5oYU5biw-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-34978-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2635C3D23C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
branch HEAD: 62f97854fd4bf56e5eb15970787aa4125ea912cd  pinctrl: add generic board-level pinctrl driver using mux framework

elapsed time: 2700m

configs tested: 142
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260408    gcc-8.5.0
arc                   randconfig-002-20260408    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    clang-16
arm                         lpc18xx_defconfig    clang-23
arm                   randconfig-001-20260408    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260408    gcc-14.3.0
arm64                 randconfig-002-20260408    gcc-14.3.0
arm64                 randconfig-003-20260408    gcc-14.3.0
arm64                 randconfig-004-20260408    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260408    gcc-14.3.0
csky                  randconfig-002-20260408    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260408    clang-20
i386                  randconfig-002-20260408    clang-20
i386                  randconfig-003-20260408    clang-20
i386                  randconfig-004-20260408    clang-20
i386                  randconfig-005-20260408    clang-20
i386                  randconfig-006-20260408    clang-20
i386                  randconfig-007-20260408    clang-20
i386                  randconfig-011-20260408    gcc-14
i386                  randconfig-012-20260408    gcc-14
i386                  randconfig-013-20260408    gcc-14
i386                  randconfig-014-20260408    gcc-14
i386                  randconfig-015-20260408    gcc-14
i386                  randconfig-016-20260408    gcc-14
i386                  randconfig-017-20260408    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
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
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260408    gcc-8.5.0
parisc                randconfig-002-20260408    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260408    gcc-8.5.0
powerpc               randconfig-002-20260408    gcc-8.5.0
powerpc64             randconfig-002-20260408    gcc-8.5.0
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260408    gcc-15.2.0
riscv                 randconfig-002-20260408    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260408    gcc-15.2.0
sh                    randconfig-002-20260408    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260408    clang-20
x86_64      buildonly-randconfig-002-20260408    clang-20
x86_64      buildonly-randconfig-003-20260408    clang-20
x86_64      buildonly-randconfig-004-20260408    clang-20
x86_64      buildonly-randconfig-005-20260408    clang-20
x86_64      buildonly-randconfig-006-20260408    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260408    gcc-12
x86_64                randconfig-001-20260408    gcc-14
x86_64                randconfig-002-20260408    gcc-12
x86_64                randconfig-002-20260408    gcc-14
x86_64                randconfig-003-20260408    gcc-12
x86_64                randconfig-003-20260408    gcc-14
x86_64                randconfig-004-20260408    gcc-12
x86_64                randconfig-004-20260408    gcc-14
x86_64                randconfig-005-20260408    gcc-12
x86_64                randconfig-005-20260408    gcc-14
x86_64                randconfig-006-20260408    gcc-12
x86_64                randconfig-011-20260408    clang-20
x86_64                randconfig-012-20260408    clang-20
x86_64                randconfig-013-20260408    clang-20
x86_64                randconfig-014-20260408    clang-20
x86_64                randconfig-015-20260408    clang-20
x86_64                randconfig-016-20260408    clang-20
x86_64                randconfig-071-20260408    clang-20
x86_64                randconfig-072-20260408    clang-20
x86_64                randconfig-073-20260408    clang-20
x86_64                randconfig-074-20260408    clang-20
x86_64                randconfig-075-20260408    clang-20
x86_64                randconfig-076-20260408    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

