Return-Path: <linux-gpio+bounces-32517-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CPGNo2jqGnKwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32517-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:26:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81163207F63
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 22:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD3913012528
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 21:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56414388395;
	Wed,  4 Mar 2026 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5/mgt0S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC3327E049
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659595; cv=none; b=QvFKIbKlN2U5L0kAXp0hViFEXfamsE6kSUOfArHtHQJcMGMbrm2PStZjBPHxA6ifp6Lc87Fuo+Wgwqc7Q+d/DtXtQ6f316tTq2RgTRFpbdZtx3ayfZUTEoHoqcWz1JTyXUCIpCVnePp3x0SjJ0rNPD9+ORXlEFqEHIuMBL5deLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659595; c=relaxed/simple;
	bh=nnB5I9HYqd7ysCYK+FUrRmOExK5a3uFOysYxujQwyEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=letpFXm4LdtEruaGqkLvrCaiktGzSuVJ1jYHrUmbd2canaG/PEZWP9auUthyyNFY+puDenCxN4ENG9fxP7u++5qUdysQ4WkSXNwouOew3fKAkhYNe8CES1cGHSvS6Voee1/rhMnsBGfQi9ycJPW4V5rPrj+rJbtfgeKi+440Rrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5/mgt0S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772659593; x=1804195593;
  h=date:from:to:cc:subject:message-id;
  bh=nnB5I9HYqd7ysCYK+FUrRmOExK5a3uFOysYxujQwyEc=;
  b=b5/mgt0SgFfBYFZu5oLTYXXSlbgV930tB3DIdn+ur0LBds6OTbe/ErfH
   wJ7ygzKfDQFAaxz/kq4VU4zc1qskU9lo67nuz7kdAHZSjxadzJ2Rw+xQm
   gUbcwYQ1IkTyxqm/So5ct8yQ8OA5wTAmfLw2JgLJ3npcyq4trRfLUhiRB
   l/xecxbGz5YGizI5kDqtSjcPkXHFTuWaNljowvQ3QyJSCXJKkNwXCaKSx
   mC8C1XmTvi2HkZsJ52X4Gb9yLI9maTS0PIcnmUfM/m4H1g0Ykvqbrsw1O
   zijS8MqgBkD7Y5Y2m/qW135AZFcuGzhFbFhrmNl6JUcfhn7sf3dNBOvTw
   w==;
X-CSE-ConnectionGUID: QHp8W9oPQtKncDSAI1C/rg==
X-CSE-MsgGUID: QwO6QgBuSiqWH8oOIGUJQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72933531"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72933531"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:26:33 -0800
X-CSE-ConnectionGUID: TMy1MJ3oS4WDNNM1pLtkNw==
X-CSE-MsgGUID: b5/vcXjnSGWGaFisICZQNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="241475797"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 13:26:31 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxtjh-000000004WT-2Lgz;
	Wed, 04 Mar 2026 21:26:29 +0000
Date: Thu, 05 Mar 2026 05:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 b678676b7a0ab65ad5b4278505d6bcf706e53230
Message-ID: <202603050504.THrBIAMW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 81163207F63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32517-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: b678676b7a0ab65ad5b4278505d6bcf706e53230  dt-bindings: gpio: mpfs-gpio: permit resets

elapsed time: 760m

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
arc                   randconfig-001-20260304    clang-23
arc                   randconfig-002-20260304    clang-23
arm                              alldefconfig    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260304    clang-23
arm                   randconfig-002-20260304    clang-23
arm                   randconfig-003-20260304    clang-23
arm                   randconfig-004-20260304    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260304    gcc-15.2.0
arm64                 randconfig-002-20260304    gcc-15.2.0
arm64                 randconfig-003-20260304    gcc-15.2.0
arm64                 randconfig-004-20260304    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260304    gcc-15.2.0
csky                  randconfig-002-20260304    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260304    gcc-15.2.0
hexagon               randconfig-002-20260304    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260304    gcc-14
i386        buildonly-randconfig-001-20260305    clang-20
i386        buildonly-randconfig-002-20260304    gcc-14
i386        buildonly-randconfig-002-20260305    clang-20
i386        buildonly-randconfig-003-20260304    gcc-14
i386        buildonly-randconfig-003-20260305    clang-20
i386        buildonly-randconfig-004-20260304    gcc-14
i386        buildonly-randconfig-004-20260305    clang-20
i386        buildonly-randconfig-005-20260304    gcc-14
i386        buildonly-randconfig-005-20260305    clang-20
i386        buildonly-randconfig-006-20260304    gcc-14
i386        buildonly-randconfig-006-20260305    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260304    clang-20
i386                  randconfig-002-20260304    clang-20
i386                  randconfig-003-20260304    clang-20
i386                  randconfig-004-20260304    clang-20
i386                  randconfig-005-20260304    clang-20
i386                  randconfig-006-20260304    clang-20
i386                  randconfig-007-20260304    clang-20
i386                  randconfig-011-20260304    gcc-14
i386                  randconfig-012-20260304    gcc-14
i386                  randconfig-013-20260304    gcc-14
i386                  randconfig-014-20260304    gcc-14
i386                  randconfig-015-20260304    gcc-14
i386                  randconfig-016-20260304    gcc-14
i386                  randconfig-017-20260304    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260304    gcc-15.2.0
loongarch             randconfig-002-20260304    gcc-15.2.0
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
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260304    gcc-15.2.0
nios2                 randconfig-002-20260304    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260304    gcc-8.5.0
parisc                randconfig-002-20260304    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260304    gcc-8.5.0
powerpc               randconfig-002-20260304    gcc-8.5.0
powerpc64             randconfig-001-20260304    gcc-8.5.0
powerpc64             randconfig-002-20260304    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260304    clang-23
riscv                 randconfig-001-20260305    clang-23
riscv                 randconfig-002-20260304    clang-23
riscv                 randconfig-002-20260305    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260304    clang-23
s390                  randconfig-001-20260305    clang-23
s390                  randconfig-002-20260304    clang-23
s390                  randconfig-002-20260305    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260304    clang-23
sh                    randconfig-001-20260305    clang-23
sh                    randconfig-002-20260304    clang-23
sh                    randconfig-002-20260305    clang-23
sh                           se7751_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260304    gcc-14
x86_64      buildonly-randconfig-002-20260304    gcc-14
x86_64      buildonly-randconfig-003-20260304    gcc-14
x86_64      buildonly-randconfig-004-20260304    gcc-14
x86_64      buildonly-randconfig-005-20260304    gcc-14
x86_64      buildonly-randconfig-006-20260304    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260304    clang-20
x86_64                randconfig-002-20260304    clang-20
x86_64                randconfig-003-20260304    clang-20
x86_64                randconfig-004-20260304    clang-20
x86_64                randconfig-005-20260304    clang-20
x86_64                randconfig-006-20260304    clang-20
x86_64                randconfig-011-20260304    gcc-14
x86_64                randconfig-012-20260304    gcc-14
x86_64                randconfig-013-20260304    gcc-14
x86_64                randconfig-014-20260304    gcc-14
x86_64                randconfig-015-20260304    gcc-14
x86_64                randconfig-016-20260304    gcc-14
x86_64                randconfig-071-20260304    clang-20
x86_64                randconfig-072-20260304    clang-20
x86_64                randconfig-073-20260304    clang-20
x86_64                randconfig-074-20260304    clang-20
x86_64                randconfig-075-20260304    clang-20
x86_64                randconfig-076-20260304    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

