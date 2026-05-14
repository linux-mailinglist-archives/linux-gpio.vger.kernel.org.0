Return-Path: <linux-gpio+bounces-36875-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOTAKGdeBmrijAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36875-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 01:44:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F9547D29
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 01:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6462A300863A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 23:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D16239DBFB;
	Thu, 14 May 2026 23:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VroWgXCh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B12A39DBFA
	for <linux-gpio@vger.kernel.org>; Thu, 14 May 2026 23:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778802274; cv=none; b=iky62sIiBENGHxrFPpE3RRXm/RCdlY6mwQJ8yJy67PDPFGBWAURvFey9TcbKCAPuh3qaRJGPIY+8sa/4NSzyO2vVnz871iL35eGk3X5xAF87vCb4aSTv49GrBUj1jCKiG7sf4R2c/opYP0eS+WSMI3OxSazkzMC6L/Kq6W7IJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778802274; c=relaxed/simple;
	bh=MH6mTpjPdCAZwDie0+iwgnGsq+bdfg6TMyrxfQ0bVcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lN2fts1J2z5VNLiQXEztJMV9xJShKHXGNcACzCReIMmuW2mlXJnsNnJOmrKuhNHn4bRFxacSyZ+BerO8GY8vIdhYibAPZdkpWChEDLuOkwc05FxSGSBRcXr+mCUMmHABgPNDnAl/1x2S5PBvqd4JLYmzPztamzVsCJm/5oI7pTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VroWgXCh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778802272; x=1810338272;
  h=date:from:to:cc:subject:message-id;
  bh=MH6mTpjPdCAZwDie0+iwgnGsq+bdfg6TMyrxfQ0bVcY=;
  b=VroWgXChflA7pvW0uJQl+fknIj+8M0DFLWqv9k4PAo6diaofyxgd8kWQ
   PTdfXHCOwIQPEwbjEeiLG30TT6puiKsH3XcWBEadV1hhtOeDNYqjG3a58
   WEjOSLQfSt8gwnFJPXDztJ5U+CzpAhW/9puW/fbwoawGg26xQ6LMvpIBX
   tprRTVp7tYlXYS2zGYM9snUA0DqfffOj/u6OGcbwr61BT8Dh6wGzdzIiI
   kfYL5XAO1TXtxSWDQ7HlipRm8utdpc0Bb7XLDv1Al9hRqJN+t7I5XXtvo
   /0O2SED9oR+oF++IpIawOIu9D0/1/P/R9R5MZvhZ/El8aCIf+hxCPMAzI
   g==;
X-CSE-ConnectionGUID: Of4ga8aRS/2V96mCbo6CyA==
X-CSE-MsgGUID: U7g3iWODSNe/x+2zUb1bIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78892536"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78892536"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 16:44:32 -0700
X-CSE-ConnectionGUID: Jw4/wAstRJKcZd8feyjwRQ==
X-CSE-MsgGUID: XLYSGSUhSLaJhZolZ8UwJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242523287"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 16:44:29 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNfid-000000000MR-2tSI;
	Thu, 14 May 2026 23:44:04 +0000
Date: Fri, 15 May 2026 07:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 73d4991a6949eedb51e442d4e81415017d85975b
Message-ID: <202605150719.lMqFEoEx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 6F0F9547D29
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-36875-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 73d4991a6949eedb51e442d4e81415017d85975b  Merge branch 'devel' into for-next

elapsed time: 827m

configs tested: 306
configs skipped: 3

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
arc                   randconfig-001-20260514    clang-23
arc                   randconfig-001-20260515    clang-23
arc                   randconfig-002-20260514    clang-23
arc                   randconfig-002-20260515    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260514    clang-23
arm                   randconfig-001-20260515    clang-23
arm                   randconfig-002-20260514    clang-23
arm                   randconfig-002-20260515    clang-23
arm                   randconfig-003-20260514    clang-23
arm                   randconfig-003-20260515    clang-23
arm                   randconfig-004-20260514    clang-23
arm                   randconfig-004-20260515    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260514    clang-23
arm64                 randconfig-001-20260515    gcc-11.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260514    clang-23
arm64                 randconfig-002-20260515    gcc-11.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260514    clang-23
arm64                 randconfig-003-20260515    gcc-11.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260514    clang-23
arm64                 randconfig-004-20260515    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260514    clang-23
csky                  randconfig-001-20260515    gcc-11.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260514    clang-23
csky                  randconfig-002-20260515    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260514    gcc-10.5.0
hexagon               randconfig-001-20260515    gcc-8.5.0
hexagon               randconfig-002-20260514    gcc-10.5.0
hexagon               randconfig-002-20260515    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260514    gcc-14
i386        buildonly-randconfig-001-20260515    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260514    gcc-14
i386        buildonly-randconfig-002-20260515    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260514    gcc-14
i386        buildonly-randconfig-003-20260515    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260514    gcc-14
i386        buildonly-randconfig-004-20260515    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260514    gcc-14
i386        buildonly-randconfig-005-20260515    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260514    gcc-14
i386        buildonly-randconfig-006-20260515    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260514    clang-20
i386                  randconfig-001-20260515    clang-20
i386                  randconfig-002-20260514    clang-20
i386                  randconfig-002-20260515    clang-20
i386                  randconfig-003-20260514    clang-20
i386                  randconfig-003-20260515    clang-20
i386                  randconfig-004-20260514    clang-20
i386                  randconfig-004-20260515    clang-20
i386                  randconfig-005-20260514    clang-20
i386                  randconfig-005-20260515    clang-20
i386                  randconfig-006-20260514    clang-20
i386                  randconfig-006-20260515    clang-20
i386                  randconfig-007-20260514    clang-20
i386                  randconfig-007-20260515    clang-20
i386                  randconfig-011-20260514    clang-20
i386                  randconfig-011-20260515    gcc-14
i386                  randconfig-012-20260514    clang-20
i386                  randconfig-012-20260515    gcc-14
i386                  randconfig-013-20260514    clang-20
i386                  randconfig-013-20260515    gcc-14
i386                  randconfig-014-20260514    clang-20
i386                  randconfig-014-20260515    gcc-14
i386                  randconfig-015-20260514    clang-20
i386                  randconfig-015-20260515    gcc-14
i386                  randconfig-016-20260514    clang-20
i386                  randconfig-016-20260515    gcc-14
i386                  randconfig-017-20260514    clang-20
i386                  randconfig-017-20260515    gcc-14
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260514    gcc-10.5.0
loongarch             randconfig-001-20260515    gcc-8.5.0
loongarch             randconfig-002-20260514    gcc-10.5.0
loongarch             randconfig-002-20260515    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260514    gcc-10.5.0
nios2                 randconfig-001-20260515    gcc-8.5.0
nios2                 randconfig-002-20260514    gcc-10.5.0
nios2                 randconfig-002-20260515    gcc-8.5.0
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
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260514    gcc-13.4.0
parisc                randconfig-001-20260515    gcc-8.5.0
parisc                         randconfig-002    gcc-13.4.0
parisc                randconfig-002-20260514    gcc-13.4.0
parisc                randconfig-002-20260515    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                  mpc885_ads_defconfig    clang-23
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260514    gcc-13.4.0
powerpc               randconfig-001-20260515    gcc-8.5.0
powerpc                        randconfig-002    gcc-13.4.0
powerpc               randconfig-002-20260514    gcc-13.4.0
powerpc               randconfig-002-20260515    gcc-8.5.0
powerpc                     tqm8541_defconfig    clang-23
powerpc64                      randconfig-001    gcc-13.4.0
powerpc64             randconfig-001-20260514    gcc-13.4.0
powerpc64             randconfig-001-20260515    gcc-8.5.0
powerpc64                      randconfig-002    gcc-13.4.0
powerpc64             randconfig-002-20260514    gcc-13.4.0
powerpc64             randconfig-002-20260515    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260514    gcc-14.3.0
riscv                 randconfig-001-20260515    gcc-15.2.0
riscv                 randconfig-002-20260514    gcc-14.3.0
riscv                 randconfig-002-20260515    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260514    gcc-14.3.0
s390                  randconfig-001-20260515    gcc-15.2.0
s390                  randconfig-002-20260514    gcc-14.3.0
s390                  randconfig-002-20260515    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260514    gcc-14.3.0
sh                    randconfig-001-20260515    gcc-15.2.0
sh                    randconfig-002-20260514    gcc-14.3.0
sh                    randconfig-002-20260515    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260514    gcc-15.2.0
sparc                 randconfig-001-20260515    gcc-8.5.0
sparc                 randconfig-002-20260514    gcc-15.2.0
sparc                 randconfig-002-20260515    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260514    gcc-15.2.0
sparc64               randconfig-001-20260515    gcc-8.5.0
sparc64               randconfig-002-20260514    gcc-15.2.0
sparc64               randconfig-002-20260515    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260514    gcc-15.2.0
um                    randconfig-001-20260515    gcc-8.5.0
um                    randconfig-002-20260514    gcc-15.2.0
um                    randconfig-002-20260515    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    clang-20
x86_64      buildonly-randconfig-001-20260514    clang-20
x86_64      buildonly-randconfig-001-20260515    gcc-14
x86_64               buildonly-randconfig-002    clang-20
x86_64      buildonly-randconfig-002-20260514    clang-20
x86_64      buildonly-randconfig-002-20260515    gcc-14
x86_64               buildonly-randconfig-003    clang-20
x86_64      buildonly-randconfig-003-20260514    clang-20
x86_64      buildonly-randconfig-003-20260515    gcc-14
x86_64               buildonly-randconfig-004    clang-20
x86_64      buildonly-randconfig-004-20260514    clang-20
x86_64      buildonly-randconfig-004-20260515    gcc-14
x86_64               buildonly-randconfig-005    clang-20
x86_64      buildonly-randconfig-005-20260514    clang-20
x86_64      buildonly-randconfig-005-20260515    gcc-14
x86_64               buildonly-randconfig-006    clang-20
x86_64      buildonly-randconfig-006-20260514    clang-20
x86_64      buildonly-randconfig-006-20260515    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260514    gcc-14
x86_64                randconfig-001-20260515    clang-20
x86_64                randconfig-002-20260514    gcc-14
x86_64                randconfig-002-20260515    clang-20
x86_64                randconfig-003-20260514    gcc-14
x86_64                randconfig-003-20260515    clang-20
x86_64                randconfig-004-20260514    gcc-14
x86_64                randconfig-004-20260515    clang-20
x86_64                randconfig-005-20260514    gcc-14
x86_64                randconfig-005-20260515    clang-20
x86_64                randconfig-006-20260514    gcc-14
x86_64                randconfig-006-20260515    clang-20
x86_64                randconfig-011-20260515    clang-20
x86_64                randconfig-012-20260515    clang-20
x86_64                randconfig-013-20260515    clang-20
x86_64                randconfig-014-20260515    clang-20
x86_64                randconfig-015-20260515    clang-20
x86_64                randconfig-016-20260515    clang-20
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260514    clang-20
x86_64                randconfig-071-20260515    gcc-12
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260514    clang-20
x86_64                randconfig-072-20260515    gcc-12
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260514    clang-20
x86_64                randconfig-073-20260515    gcc-12
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260514    clang-20
x86_64                randconfig-074-20260515    gcc-12
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260514    clang-20
x86_64                randconfig-075-20260515    gcc-12
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260514    clang-20
x86_64                randconfig-076-20260515    gcc-12
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
xtensa                randconfig-001-20260514    gcc-15.2.0
xtensa                randconfig-001-20260515    gcc-8.5.0
xtensa                randconfig-002-20260514    gcc-15.2.0
xtensa                randconfig-002-20260515    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

