Return-Path: <linux-gpio+bounces-37334-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFoQMJgkEGqsUAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37334-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:40:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C341F5B1596
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC970302A580
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EE436921B;
	Fri, 22 May 2026 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAX+C9jL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DEB280331
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442127; cv=none; b=k+tvVXZsM0QfzuvXAT0ByaoFHKhh6PTqBGE1ZGMMDxQkUB9KVmhh8uWsbmQ7vL7LJ6vbIq53YJd/m0cGI0UzuHYZSajenCkkXcO3dErIjn1Dp1keKhgjxnzR3zJTUoJEu519eFi6yuJ4oe6IpGVfTp0deQP6Wn37cMt30QlbQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442127; c=relaxed/simple;
	bh=twKJn4+dW8gkSWhaN6tMW6hcGHGSBKN6DVs654z38XA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PBF8ukN3tUHXuJteOmVQP418hfXlNQKFxu+5esszLDmq+e6keLAvt/Jl4ArVQbfCUXzTe63NfD6GkmRSvsTlWxnt0IJ1DUSk0UGyu1EbEyG8Mqcdt72eZO1Xpy71o3fh57cdcXiGhWOH706IOC2XEBvJolWG9XimSc7OPkbgo8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAX+C9jL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779442125; x=1810978125;
  h=date:from:to:cc:subject:message-id;
  bh=twKJn4+dW8gkSWhaN6tMW6hcGHGSBKN6DVs654z38XA=;
  b=BAX+C9jLP9itbTeEfn4yd/yMmo0jT8NfpdpK9lSdBpyDQnzgqGd2bLHu
   ndWeaKKM6x5qNEzH9ubrsaB/DY8/KWGmkl88MmyezbNJqDBP+s57A0DqQ
   hwkURgWeeZ5HNO/TDw8UzlN5smGXdwFYiFSY6NCE+R9PFmYiXObJge44I
   qC1G+O/bcwMdYzE7Ar/FkGkr+if43xvhHqa/Q5f8GjsI4dooEQ3bMuUUs
   Tq2VP0Yzn8evPoi3SdF1ctBVOGHhty2qFTpQzP3+pt/f6piNUTv15BgML
   7wIIyFfC7D23MDZHkFkEVseTIIhY3KUersPOwTU/x5bpJzItA6txpLzIl
   A==;
X-CSE-ConnectionGUID: Ceekh/6/TRCDJrhdihlAjA==
X-CSE-MsgGUID: ITO1guEmQ/ujkqdJ8dhJ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90668346"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="90668346"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 02:28:45 -0700
X-CSE-ConnectionGUID: Gg2O21XpTGW6kjUqIAKKvA==
X-CSE-MsgGUID: vet5N6HETZaKH486ZrfzUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="238263565"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 May 2026 02:28:44 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQMBN-0000000028h-2Abx;
	Fri, 22 May 2026 09:28:41 +0000
Date: Fri, 22 May 2026 17:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 a4fa45c1d980bc2b9837f469119af24a9304a1fc
Message-ID: <202605221720.nQkRAsYa-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37334-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: C341F5B1596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: a4fa45c1d980bc2b9837f469119af24a9304a1fc  gpio: virtuser: lock device when calling device_is_bound()

elapsed time: 1246m

configs tested: 319
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260521    gcc-8.5.0
arc                   randconfig-001-20260522    clang-23
arc                   randconfig-002-20260521    gcc-8.5.0
arc                   randconfig-002-20260522    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260521    gcc-8.5.0
arm                   randconfig-001-20260522    clang-23
arm                   randconfig-002-20260521    gcc-8.5.0
arm                   randconfig-002-20260522    clang-23
arm                   randconfig-003-20260521    gcc-8.5.0
arm                   randconfig-003-20260522    clang-23
arm                   randconfig-004-20260521    gcc-8.5.0
arm                   randconfig-004-20260522    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-14.3.0
arm64                 randconfig-001-20260521    gcc-8.5.0
arm64                 randconfig-001-20260522    gcc-14.3.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260521    gcc-8.5.0
arm64                 randconfig-002-20260522    gcc-14.3.0
arm64                          randconfig-003    gcc-14.3.0
arm64                 randconfig-003-20260521    gcc-8.5.0
arm64                 randconfig-003-20260522    gcc-14.3.0
arm64                          randconfig-004    gcc-14.3.0
arm64                 randconfig-004-20260521    gcc-8.5.0
arm64                 randconfig-004-20260522    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-14.3.0
csky                  randconfig-001-20260521    gcc-8.5.0
csky                  randconfig-001-20260522    gcc-14.3.0
csky                           randconfig-002    gcc-14.3.0
csky                  randconfig-002-20260521    gcc-8.5.0
csky                  randconfig-002-20260522    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260521    gcc-11.5.0
hexagon               randconfig-001-20260522    gcc-8.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260521    gcc-11.5.0
hexagon               randconfig-002-20260522    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260521    clang-20
i386        buildonly-randconfig-001-20260522    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260521    clang-20
i386        buildonly-randconfig-002-20260522    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260521    clang-20
i386        buildonly-randconfig-003-20260522    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260521    clang-20
i386        buildonly-randconfig-004-20260522    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260521    clang-20
i386        buildonly-randconfig-005-20260522    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260521    clang-20
i386        buildonly-randconfig-006-20260522    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260521    clang-20
i386                  randconfig-001-20260522    gcc-13
i386                           randconfig-002    clang-20
i386                  randconfig-002-20260521    clang-20
i386                  randconfig-002-20260522    gcc-13
i386                           randconfig-003    clang-20
i386                  randconfig-003-20260521    clang-20
i386                  randconfig-003-20260522    gcc-13
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260521    clang-20
i386                  randconfig-004-20260522    gcc-13
i386                           randconfig-005    clang-20
i386                  randconfig-005-20260521    clang-20
i386                  randconfig-005-20260522    gcc-13
i386                           randconfig-006    clang-20
i386                  randconfig-006-20260521    clang-20
i386                  randconfig-006-20260522    gcc-13
i386                           randconfig-007    clang-20
i386                  randconfig-007-20260521    clang-20
i386                  randconfig-007-20260522    gcc-13
i386                  randconfig-011-20260521    gcc-14
i386                  randconfig-011-20260522    clang-20
i386                  randconfig-012-20260521    clang-20
i386                  randconfig-012-20260522    clang-20
i386                  randconfig-013-20260521    gcc-13
i386                  randconfig-013-20260522    clang-20
i386                  randconfig-014-20260521    gcc-14
i386                  randconfig-014-20260522    clang-20
i386                  randconfig-015-20260521    gcc-14
i386                  randconfig-015-20260522    clang-20
i386                  randconfig-016-20260521    clang-20
i386                  randconfig-016-20260522    clang-20
i386                  randconfig-017-20260521    clang-20
i386                  randconfig-017-20260522    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260521    gcc-11.5.0
loongarch             randconfig-001-20260522    gcc-8.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260521    gcc-11.5.0
loongarch             randconfig-002-20260522    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260521    gcc-11.5.0
nios2                 randconfig-001-20260522    gcc-8.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260521    gcc-11.5.0
nios2                 randconfig-002-20260522    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260522    gcc-12.5.0
parisc                randconfig-002-20260522    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260522    gcc-12.5.0
powerpc               randconfig-002-20260522    gcc-12.5.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260522    gcc-12.5.0
powerpc64             randconfig-002-20260522    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-15.2.0
riscv                 randconfig-001-20260521    gcc-15.2.0
riscv                 randconfig-001-20260522    gcc-10.5.0
riscv                          randconfig-002    gcc-15.2.0
riscv                 randconfig-002-20260521    gcc-15.2.0
riscv                 randconfig-002-20260522    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-15.2.0
s390                  randconfig-001-20260521    gcc-15.2.0
s390                  randconfig-001-20260522    gcc-10.5.0
s390                           randconfig-002    gcc-15.2.0
s390                  randconfig-002-20260521    gcc-15.2.0
s390                  randconfig-002-20260522    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260521    gcc-15.2.0
sh                    randconfig-001-20260522    gcc-10.5.0
sh                             randconfig-002    gcc-15.2.0
sh                    randconfig-002-20260521    gcc-15.2.0
sh                    randconfig-002-20260522    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260521    gcc-8.5.0
sparc                 randconfig-001-20260522    gcc-9.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260521    gcc-8.5.0
sparc                 randconfig-002-20260522    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260521    gcc-8.5.0
sparc64               randconfig-001-20260522    gcc-9.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260521    gcc-8.5.0
sparc64               randconfig-002-20260522    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260521    gcc-8.5.0
um                    randconfig-001-20260522    gcc-9.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260521    gcc-8.5.0
um                    randconfig-002-20260522    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260521    clang-20
x86_64      buildonly-randconfig-001-20260522    gcc-14
x86_64      buildonly-randconfig-002-20260521    clang-20
x86_64      buildonly-randconfig-002-20260522    gcc-14
x86_64      buildonly-randconfig-003-20260521    clang-20
x86_64      buildonly-randconfig-003-20260522    gcc-14
x86_64      buildonly-randconfig-004-20260521    clang-20
x86_64      buildonly-randconfig-004-20260522    gcc-14
x86_64      buildonly-randconfig-005-20260521    clang-20
x86_64      buildonly-randconfig-005-20260522    gcc-14
x86_64      buildonly-randconfig-006-20260521    clang-20
x86_64      buildonly-randconfig-006-20260522    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260521    clang-20
x86_64                randconfig-001-20260522    gcc-14
x86_64                randconfig-002-20260521    clang-20
x86_64                randconfig-002-20260522    gcc-14
x86_64                randconfig-003-20260521    clang-20
x86_64                randconfig-003-20260522    gcc-14
x86_64                randconfig-004-20260521    clang-20
x86_64                randconfig-004-20260522    gcc-14
x86_64                randconfig-005-20260521    clang-20
x86_64                randconfig-005-20260522    gcc-14
x86_64                randconfig-006-20260521    clang-20
x86_64                randconfig-006-20260522    gcc-14
x86_64                randconfig-011-20260521    gcc-14
x86_64                randconfig-011-20260522    gcc-14
x86_64                randconfig-012-20260521    gcc-14
x86_64                randconfig-012-20260522    gcc-14
x86_64                randconfig-013-20260521    gcc-14
x86_64                randconfig-013-20260522    gcc-14
x86_64                randconfig-014-20260521    gcc-14
x86_64                randconfig-014-20260522    gcc-14
x86_64                randconfig-015-20260521    gcc-14
x86_64                randconfig-015-20260522    gcc-14
x86_64                randconfig-016-20260521    gcc-14
x86_64                randconfig-016-20260522    gcc-14
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260521    clang-20
x86_64                randconfig-071-20260522    clang-20
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260521    clang-20
x86_64                randconfig-072-20260522    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260521    clang-20
x86_64                randconfig-073-20260522    clang-20
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260521    clang-20
x86_64                randconfig-074-20260522    clang-20
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260521    clang-20
x86_64                randconfig-075-20260522    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260521    clang-20
x86_64                randconfig-076-20260522    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260521    gcc-8.5.0
xtensa                randconfig-001-20260522    gcc-9.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260521    gcc-8.5.0
xtensa                randconfig-002-20260522    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

