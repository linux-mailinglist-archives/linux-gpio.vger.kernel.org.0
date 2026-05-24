Return-Path: <linux-gpio+bounces-37415-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id R/KIMBNlEmrlywYAu9opvQ
	(envelope-from <linux-gpio+bounces-37415-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 04:40:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7955C1230
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 04:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1117300D94D
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2026 02:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E68625B0BB;
	Sun, 24 May 2026 02:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KM4OIaOU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD1487BE
	for <linux-gpio@vger.kernel.org>; Sun, 24 May 2026 02:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779590415; cv=none; b=PW0PEpbuHj2uPgT1NMBoTfnkJSEceEgPTxUmukW5PsIPW56oAqKvUR3m426HcKvFpmFtdYEGeevJvk+MPXzM2W1m/eUhEVIuSHutCZMPQvXEq1OUm9D9qj0CDtwfExcRHQI/nA+WIQKBn4vhjLnCFZvpNibNaR+v5RQAGuZNPkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779590415; c=relaxed/simple;
	bh=AIZunMY6lf0hPBLAXfTVIgzDTlpkSR3/RHqe5Vr0NI8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hg00fW//JIJ7bEUIsISnej3IkUzAckXoWq7+AkOfWLyUP+8Tr09uHhGU3VDF0m33RCmPxCUDYksN/ybQrp57YWv85N0+uy2xvVj1v+35bxkhqmhQBuNqSZZbJxTt0sFIoooJJNf1vgTBWvdGEB5kYVmbSRnV2Sdz7uIZmYTk2EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KM4OIaOU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779590413; x=1811126413;
  h=date:from:to:cc:subject:message-id;
  bh=AIZunMY6lf0hPBLAXfTVIgzDTlpkSR3/RHqe5Vr0NI8=;
  b=KM4OIaOU87xR4BsKXCGQshqnjFME9WwMkM6W1vPaPuWchDOf06Rxo1jR
   GuDptuSmGaIPnXIV02YLv2PedFeNiQ5xMLO1JS7RrouWdQ5B5bepRHyll
   IFOcJSMT3F9uCJsX1Gh1r5AThV0vkVSqT7i5PwHH7bCQlWpx9XtaULGDY
   mVpoKjKYHI/J2xGTT115j4r3mteyWJQnIp7Vo8pV1xvk8avKY5zVPmGep
   fKpSBzvznbk2F3GuRt25Mq9D6DzodPVyRbbkWAm5Z4rG4J1lZZQjDxGlI
   sEpt2+DN9gjVC/5n09ZCQsrY/82x2K0xv0ntfBhO2g6CjaZsKUo/Fhd4u
   A==;
X-CSE-ConnectionGUID: kGTqQzVXTDynCIf8WDLpCw==
X-CSE-MsgGUID: 4JR71p7cTyaSwKbFUUWTxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91573504"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91573504"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 19:40:13 -0700
X-CSE-ConnectionGUID: k8S8XGNyRyWlRJ6SXW9vbA==
X-CSE-MsgGUID: v7KjQY1iRfi5kj8KbC2Wtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="279377178"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 May 2026 19:40:11 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQyl7-000000000c9-1sWw;
	Sun, 24 May 2026 02:40:09 +0000
Date: Sun, 24 May 2026 10:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 fd2b6ac4f141b4b234d4578bf51619ba3eeb7d2d
Message-ID: <202605241045.kOMdJMhn-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37415-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 7E7955C1230
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: fd2b6ac4f141b4b234d4578bf51619ba3eeb7d2d  pinctrl: core: Make pin group callbacks optional for pin-only drivers

elapsed time: 799m

configs tested: 174
configs skipped: 6

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
arc                   randconfig-001-20260524    clang-23
arc                   randconfig-002-20260524    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260524    clang-23
arm                   randconfig-002-20260524    clang-23
arm                   randconfig-003-20260524    clang-23
arm                   randconfig-004-20260524    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260524    clang-23
arm64                 randconfig-002-20260524    clang-23
arm64                 randconfig-003-20260524    clang-23
arm64                 randconfig-004-20260524    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260524    gcc-9.5.0
csky                  randconfig-002-20260524    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260524    gcc-8.5.0
hexagon               randconfig-002-20260524    gcc-8.5.0
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260524    gcc-14
i386        buildonly-randconfig-002-20260524    gcc-14
i386        buildonly-randconfig-003-20260524    gcc-14
i386        buildonly-randconfig-004-20260524    gcc-14
i386        buildonly-randconfig-005-20260524    gcc-14
i386        buildonly-randconfig-006-20260524    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260524    gcc-14
i386                  randconfig-002-20260524    gcc-14
i386                  randconfig-003-20260524    gcc-14
i386                  randconfig-004-20260524    gcc-14
i386                  randconfig-005-20260524    gcc-14
i386                  randconfig-006-20260524    gcc-14
i386                  randconfig-007-20260524    gcc-14
i386                  randconfig-011-20260524    gcc-14
i386                  randconfig-012-20260524    gcc-14
i386                  randconfig-013-20260524    gcc-14
i386                  randconfig-014-20260524    clang-20
i386                  randconfig-015-20260524    clang-20
i386                  randconfig-016-20260524    clang-20
i386                  randconfig-017-20260524    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260524    gcc-8.5.0
loongarch             randconfig-002-20260524    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260524    gcc-8.5.0
nios2                 randconfig-002-20260524    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260524    clang-23
parisc                randconfig-001-20260524    gcc-15.2.0
parisc                randconfig-002-20260524    clang-23
parisc                randconfig-002-20260524    gcc-12.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260524    clang-23
powerpc               randconfig-001-20260524    gcc-8.5.0
powerpc               randconfig-002-20260524    clang-23
powerpc64             randconfig-001-20260524    clang-23
powerpc64             randconfig-002-20260524    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    clang-23
riscv                 randconfig-002-20260524    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260524    clang-20
s390                  randconfig-002-20260524    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260524    gcc-15.2.0
sh                    randconfig-002-20260524    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260524    clang-20
x86_64      buildonly-randconfig-002-20260524    clang-20
x86_64      buildonly-randconfig-003-20260524    clang-20
x86_64      buildonly-randconfig-004-20260524    clang-20
x86_64      buildonly-randconfig-005-20260524    clang-20
x86_64      buildonly-randconfig-006-20260524    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260524    clang-20
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260524    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260524    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260524    clang-20
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260524    clang-20
x86_64                randconfig-005-20260524    gcc-14
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260524    clang-20
x86_64                randconfig-006-20260524    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

