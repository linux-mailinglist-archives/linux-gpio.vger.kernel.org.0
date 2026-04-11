Return-Path: <linux-gpio+bounces-35025-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJD9Hia62WnUsQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35025-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 05:04:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C75E3DE2E5
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 05:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3133030419DF
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 02:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BE62C1788;
	Sat, 11 Apr 2026 02:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2z3jm+W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913E62C15BB
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 02:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875978; cv=none; b=fwkn44mQY7nzCUN5YJi6Z5SoauK1GM11T/DykBHcWZu978UFaLaL9w+PVZE8SAYurtcISmBWNXSLeCwN/4sVFBLBDzIWlsuIyXu6EBKSXZPTzfJX9DgADaDXA4U/BOM2yEiNgyeFNxb2iMu1ifvSR6T8Th2HIcbp7UZ1Hh3rOvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875978; c=relaxed/simple;
	bh=MKgmhE+XKjNePKVGrf2iKn7gUvbquU2JD+LGmxPSifg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M543fZJQ18XUY+tggXfAT4x1dY5ykauFpoK8z2wkussB9+fEMQjvmo+UJGQt1DYZ1Ok8ZbVFkQrhSIswKLRlD3VzXRBJXNyfk7kI55RjXTK0g8ULQoEC5XDICB3quQJ+FPUwcv2GzHM6gW9vu9vMVDqeR1W80bkWz6EJCIIaRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2z3jm+W; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775875976; x=1807411976;
  h=date:from:to:cc:subject:message-id;
  bh=MKgmhE+XKjNePKVGrf2iKn7gUvbquU2JD+LGmxPSifg=;
  b=j2z3jm+WBbNouYL7BVe75bA2m6pKej9oF1RVntRu2AGay+RCuU8otHsA
   6FX95JZvWCJ1Wx3MkcQ73B8hvD2cozY/QZ19lEp9CC7j5g/GwofncGsrl
   07QtYcJqjKnastSF77Ab/DsuZnJyuNaq4zcCQn8FLZ68cwlof+P8NsJWA
   f5W16/RYN4fhkbCI/rLPIrwERC0qfEsLf5z8wWPyyO8g6aYdS2tnz4joq
   maLmBccoxmgHcbe01TqMZC5SSBt+U6cFx521V72qMbK1JQrLDMUGKTmWi
   i5OJDzHonVg2egYzQqKKNEgykQTBaXYsLc42xsJqx23IgzSTgsh1LPVaL
   g==;
X-CSE-ConnectionGUID: RzSCmJTuRlGg+jKhEbvn+Q==
X-CSE-MsgGUID: VwqB0zPzQUCCkX88cAYtoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87189828"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87189828"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 19:52:56 -0700
X-CSE-ConnectionGUID: wc0Ynm8WSnObnYvIqnU+bQ==
X-CSE-MsgGUID: Xj6/smZ4QX2DXgb8lcUWNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259729478"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 19:52:54 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBOSq-000000000fd-2UGD;
	Sat, 11 Apr 2026 02:52:52 +0000
Date: Sat, 11 Apr 2026 10:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 ca13ab654064fee86d6e7c9e87d0af7789561509
Message-ID: <202604111046.jCtqsVSq-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-35025-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C75E3DE2E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: ca13ab654064fee86d6e7c9e87d0af7789561509  gpio: swnode: defer probe on references to unregistered software nodes

elapsed time: 1252m

configs tested: 144
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260411    gcc-12.5.0
arc                   randconfig-002-20260411    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260411    gcc-14.3.0
arm                   randconfig-002-20260411    clang-23
arm                   randconfig-003-20260411    clang-23
arm                   randconfig-004-20260411    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260411    clang-23
arm64                 randconfig-002-20260411    clang-23
arm64                 randconfig-003-20260411    clang-16
arm64                 randconfig-004-20260411    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260411    gcc-12.5.0
csky                  randconfig-002-20260411    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260411    clang-23
hexagon               randconfig-002-20260411    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260411    clang-20
i386        buildonly-randconfig-002-20260411    clang-20
i386        buildonly-randconfig-003-20260411    clang-20
i386        buildonly-randconfig-004-20260411    clang-20
i386        buildonly-randconfig-005-20260411    gcc-14
i386        buildonly-randconfig-006-20260411    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-005-20260411    gcc-14
i386                  randconfig-011-20260411    clang-20
i386                  randconfig-012-20260411    gcc-14
i386                  randconfig-013-20260411    gcc-14
i386                  randconfig-014-20260411    gcc-14
i386                  randconfig-015-20260411    clang-20
i386                  randconfig-016-20260411    gcc-14
i386                  randconfig-017-20260411    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch             randconfig-001-20260411    gcc-14.3.0
loongarch             randconfig-002-20260411    clang-18
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20260411    gcc-9.5.0
nios2                 randconfig-002-20260411    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260411    gcc-10.5.0
parisc                randconfig-002-20260411    gcc-11.5.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260411    clang-17
powerpc               randconfig-002-20260411    clang-17
powerpc64             randconfig-001-20260411    clang-16
powerpc64             randconfig-002-20260411    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260411    clang-17
riscv                 randconfig-002-20260411    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260411    gcc-8.5.0
s390                  randconfig-002-20260411    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260411    gcc-12.5.0
sh                    randconfig-002-20260411    gcc-12.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260411    gcc-8.5.0
sparc                 randconfig-002-20260411    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260411    gcc-15.2.0
sparc64               randconfig-002-20260411    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260411    gcc-14
um                    randconfig-002-20260411    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260411    gcc-14
x86_64      buildonly-randconfig-002-20260411    clang-20
x86_64      buildonly-randconfig-003-20260411    gcc-13
x86_64      buildonly-randconfig-004-20260411    gcc-14
x86_64      buildonly-randconfig-005-20260411    gcc-14
x86_64      buildonly-randconfig-006-20260411    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260411    gcc-12
x86_64                randconfig-002-20260411    gcc-14
x86_64                randconfig-003-20260411    gcc-14
x86_64                randconfig-004-20260411    clang-20
x86_64                randconfig-005-20260411    clang-20
x86_64                randconfig-006-20260411    gcc-12
x86_64                randconfig-011-20260411    gcc-14
x86_64                randconfig-012-20260411    clang-20
x86_64                randconfig-013-20260411    gcc-14
x86_64                randconfig-014-20260411    clang-20
x86_64                randconfig-015-20260411    gcc-14
x86_64                randconfig-016-20260411    clang-20
x86_64                randconfig-073-20260411    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260411    gcc-15.2.0
xtensa                randconfig-002-20260411    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

