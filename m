Return-Path: <linux-gpio+bounces-39900-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d/osF1upUmooSAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39900-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:36:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BEE742CEB
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:36:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=e8XI79DK;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39900-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39900-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF3F8300646B
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 20:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB83F301474;
	Sat, 11 Jul 2026 20:36:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968AA149DF1
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 20:36:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802197; cv=none; b=Nm3H9Ps7x1l+LLGIZA33kCq1LPRoFsZbwhaaI0JmvMKDDivcGLT7Ley+QkYh8/QWiMsNCHdW1tW/dildDddm1ILO18b05W3gkD6cL/noVeQA2dJFDX84BbGF1qmwUlF8VOOyAEvhjGeazOhdUKk1UUORk+0aQrsH/jEnPRGTh5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802197; c=relaxed/simple;
	bh=JQqky9Y8Zuw2MM0OA4/UAiRYeiAamlRet7eFKFGQOnU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EP3cItqgd6FKWLknxOx3iC6DD/e0oDwpXR5Svj1MWSjhsxCn5QBee4jiKPgzs852srK4PeQX2maEOCiXGjTXCS9wxTt3VsNeqsJOT9CJy6A7OxEsHjvR3EFWWiVHYgoXlll5Yr0tkOocxSF5jJLsD5/oXcUDSBhFdNvIKm0MFP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8XI79DK; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783802195; x=1815338195;
  h=date:from:to:cc:subject:message-id;
  bh=JQqky9Y8Zuw2MM0OA4/UAiRYeiAamlRet7eFKFGQOnU=;
  b=e8XI79DKBM3ne/7YpIjgyXOUqgr+iMm55xfcPeJ7C4TZLE/JlpcmZQv3
   Z4Wjb6FLke731FkTTAGIciLr3S4I7pbrLdkv79zE6bYyxdsIgtCqH6wSb
   34mbQ7zQ/i/KeL33fQmbvQuZeH0Kfds0hppBY14eepvrJEGpIyUwbizH6
   kLG8JjWAq/jADgEfePFMClCm9TJ86inmYUGi75AYViEjJ6yD8oRamO5cI
   mUDGSKJnojUj/e+YdtdhsXmCEXSbsfgyveEoVBZGRf+F8kKAyKYGPDA7q
   m3386elsYhImjT1YlHWTy9RW+K+ZV63sidTX51Jf70O0EZDyXzEbqjole
   A==;
X-CSE-ConnectionGUID: b8UOfZmySKWI1ofyivF36A==
X-CSE-MsgGUID: b5IgKd0BS3muJ1FZt2kQFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87013886"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87013886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 13:36:34 -0700
X-CSE-ConnectionGUID: vQgJCO+nQV+9RgaM1dl7MQ==
X-CSE-MsgGUID: D1lRbFV0T/2QgvXhFmojGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="260068369"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2026 13:36:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wieR4-00000000KNm-2Xvd;
	Sat, 11 Jul 2026 20:36:30 +0000
Date: Sun, 12 Jul 2026 04:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 e9c086239fc1923d6ecca9138e4caf94b716ff4a
Message-ID: <202607120434.BIzJZfjr-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-39900-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52BEE742CEB

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: e9c086239fc1923d6ecca9138e4caf94b716ff4a  dt-bindings: pinctrl: apple,pinctrl: Add t6030 and t6031 compatibles

elapsed time: 868m

configs tested: 283
configs skipped: 15

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
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260711    gcc-13.4.0
arc                   randconfig-001-20260712    clang-18
arc                   randconfig-002-20260711    gcc-13.4.0
arc                   randconfig-002-20260712    clang-18
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260711    gcc-13.4.0
arm                   randconfig-001-20260712    clang-18
arm                   randconfig-002-20260711    gcc-13.4.0
arm                   randconfig-002-20260712    clang-18
arm                   randconfig-003-20260711    gcc-13.4.0
arm                   randconfig-003-20260712    clang-18
arm                   randconfig-004-20260711    gcc-13.4.0
arm                   randconfig-004-20260712    clang-18
arm                        vexpress_defconfig    gcc-16.1.0
arm                         wpcm450_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260711    gcc-16.1.0
arm64                 randconfig-001-20260712    gcc-16.1.0
arm64                 randconfig-002-20260711    gcc-16.1.0
arm64                 randconfig-002-20260712    gcc-16.1.0
arm64                 randconfig-003-20260711    gcc-16.1.0
arm64                 randconfig-003-20260712    gcc-16.1.0
arm64                 randconfig-004-20260711    gcc-16.1.0
arm64                 randconfig-004-20260712    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260711    gcc-16.1.0
csky                  randconfig-001-20260712    gcc-16.1.0
csky                  randconfig-002-20260711    gcc-16.1.0
csky                  randconfig-002-20260712    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260711    gcc-11.5.0
hexagon               randconfig-001-20260711    gcc-16.1.0
hexagon               randconfig-001-20260712    clang-22
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260711    gcc-11.5.0
hexagon               randconfig-002-20260711    gcc-16.1.0
hexagon               randconfig-002-20260712    clang-22
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260711    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260711    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260711    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260711    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260711    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260711    gcc-14
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260711    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260711    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260711    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260711    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260711    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260711    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260711    clang-22
i386                  randconfig-011-20260711    gcc-13
i386                  randconfig-012-20260711    gcc-13
i386                  randconfig-013-20260711    gcc-13
i386                  randconfig-014-20260711    gcc-13
i386                  randconfig-015-20260711    gcc-13
i386                  randconfig-016-20260711    gcc-13
i386                  randconfig-017-20260711    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260711    gcc-11.5.0
loongarch             randconfig-001-20260711    gcc-16.1.0
loongarch             randconfig-001-20260712    clang-22
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260711    gcc-11.5.0
loongarch             randconfig-002-20260711    gcc-16.1.0
loongarch             randconfig-002-20260712    clang-22
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                          hp300_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260711    gcc-11.5.0
nios2                 randconfig-001-20260711    gcc-16.1.0
nios2                 randconfig-001-20260712    clang-22
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260711    gcc-11.5.0
nios2                 randconfig-002-20260711    gcc-16.1.0
nios2                 randconfig-002-20260712    clang-22
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-17
parisc                randconfig-001-20260711    clang-17
parisc                randconfig-001-20260711    gcc-12.5.0
parisc                         randconfig-002    clang-17
parisc                randconfig-002-20260711    clang-17
parisc                randconfig-002-20260711    gcc-10.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                     asp8347_defconfig    clang-23
powerpc                    mvme5100_defconfig    gcc-16.1.0
powerpc                        randconfig-001    clang-17
powerpc               randconfig-001-20260711    clang-17
powerpc               randconfig-001-20260711    gcc-11.5.0
powerpc                        randconfig-002    clang-17
powerpc               randconfig-002-20260711    clang-17
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260711    clang-17
powerpc64             randconfig-001-20260711    gcc-10.5.0
powerpc64                      randconfig-002    clang-17
powerpc64             randconfig-002-20260711    clang-17
powerpc64             randconfig-002-20260711    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260711    gcc-8.5.0
riscv                 randconfig-001-20260712    clang-22
riscv                          randconfig-002    gcc-8.5.0
riscv                 randconfig-002-20260711    gcc-8.5.0
riscv                 randconfig-002-20260712    clang-22
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-8.5.0
s390                  randconfig-001-20260711    gcc-8.5.0
s390                  randconfig-001-20260712    clang-22
s390                           randconfig-002    gcc-8.5.0
s390                  randconfig-002-20260711    gcc-8.5.0
s390                  randconfig-002-20260712    clang-22
sh                               alldefconfig    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-8.5.0
sh                    randconfig-001-20260711    gcc-8.5.0
sh                    randconfig-001-20260712    clang-22
sh                             randconfig-002    gcc-8.5.0
sh                    randconfig-002-20260711    gcc-8.5.0
sh                    randconfig-002-20260712    clang-22
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260711    gcc-16.1.0
sparc                          randconfig-002    gcc-16.1.0
sparc                 randconfig-002-20260711    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-16.1.0
sparc64               randconfig-001-20260711    gcc-16.1.0
sparc64                        randconfig-002    gcc-16.1.0
sparc64               randconfig-002-20260711    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-16.1.0
um                    randconfig-001-20260711    gcc-16.1.0
um                             randconfig-002    gcc-16.1.0
um                    randconfig-002-20260711    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260711    gcc-14
x86_64      buildonly-randconfig-001-20260712    gcc-14
x86_64      buildonly-randconfig-002-20260711    gcc-14
x86_64      buildonly-randconfig-002-20260712    gcc-14
x86_64      buildonly-randconfig-003-20260711    gcc-14
x86_64      buildonly-randconfig-003-20260712    gcc-14
x86_64      buildonly-randconfig-004-20260711    gcc-14
x86_64      buildonly-randconfig-004-20260712    gcc-14
x86_64      buildonly-randconfig-005-20260711    gcc-14
x86_64      buildonly-randconfig-005-20260712    gcc-14
x86_64      buildonly-randconfig-006-20260711    gcc-14
x86_64      buildonly-randconfig-006-20260712    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260711    clang-22
x86_64                randconfig-001-20260711    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260711    clang-22
x86_64                randconfig-002-20260711    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260711    clang-22
x86_64                randconfig-003-20260711    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260711    clang-22
x86_64                randconfig-004-20260711    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260711    clang-22
x86_64                randconfig-005-20260711    gcc-14
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260711    clang-22
x86_64                randconfig-006-20260711    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260711    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260711    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260711    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260711    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260711    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260711    gcc-14
x86_64                randconfig-071-20260711    gcc-14
x86_64                randconfig-072-20260711    gcc-14
x86_64                randconfig-073-20260711    gcc-14
x86_64                randconfig-074-20260711    gcc-14
x86_64                randconfig-075-20260711    gcc-14
x86_64                randconfig-076-20260711    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                           alldefconfig    gcc-16.1.0
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-16.1.0
xtensa                randconfig-001-20260711    gcc-16.1.0
xtensa                         randconfig-002    gcc-16.1.0
xtensa                randconfig-002-20260711    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

