Return-Path: <linux-gpio+bounces-31260-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM6SGzKgemmn8gEAu9opvQ
	(envelope-from <linux-gpio+bounces-31260-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 00:48:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF559AA066
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 00:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 725AF300B9ED
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 23:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1232F2D6E75;
	Wed, 28 Jan 2026 23:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAf3+8sO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C1821D5AA
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 23:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769644079; cv=none; b=eeK8pR1ls0FYMkxAt9Nktdu4lDMecKd93/7b8NlkkBbl0l8GnG1XucSWghijhSyj0OnKGR6glTVzxwZK2RzpamoGBOSsRTnhpmF/7APotCkT4pPadiXEM23mPIPzygqIZCdzjzCsFIPTnlZjvK2sjgdg/8gh42bfvkB8xtwXG1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769644079; c=relaxed/simple;
	bh=TvisoCl+nhJ3Ek+i1gz/Xnq+Gn24hbYJbOFS0gapmbo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZnX2GitC5qdvC6xNzT7H2aHvcX7AKJVfW73RUiUGvtGmaIEt/P/dbRPL9WiXdvQglhEs2ZBOpo6qSfdhAzL/NLqn8OciQAcizigCoAEhLe+ARcDEDton/PXchPqolxUeiZRh5ehlAVsoNTIyV4kGLhrMjZcJA7rqknOIK3ThdNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAf3+8sO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769644078; x=1801180078;
  h=date:from:to:cc:subject:message-id;
  bh=TvisoCl+nhJ3Ek+i1gz/Xnq+Gn24hbYJbOFS0gapmbo=;
  b=LAf3+8sOSTv+qpLZfDQh3A+iHpKvKfywJVj3AaVOQXC6DcOZiIAKb6mU
   j9PgNoD4MYMs2FfFrIuJkz/9oLWcUSFYJKlkuvEE8snOcfz9GvaR1NLxw
   m9QTPmWP/1c1EnyPWOZAlUFt+eKt2ZjLryEep1I64NkbJ6R64P8cdwagO
   ZYd/twxripln/lQpl6AQbyUb47XODtdpYmS89dm13oEDNQ7FP1sPASFvl
   07D2LslRUwki5ujIjjeHMz/TLOoVkMTyKmi+haLBRA09BXF5NdAVpJKiC
   hn99s//namp4XblzGpMzB1qrI5HLZH2+aIw2u+ylcjwvBwx4n7wyq0AQa
   A==;
X-CSE-ConnectionGUID: 1iBubk/zRpaaYGv9VF990g==
X-CSE-MsgGUID: u0HNWosjTDirrOG9sl4QSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70774415"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70774415"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 15:47:56 -0800
X-CSE-ConnectionGUID: m6M+bh/STn2ZsBHWdsvAEA==
X-CSE-MsgGUID: Icf83CqBTnCGlvnHwpBJ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212950795"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2026 15:47:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlFGH-00000000auq-1AMQ;
	Wed, 28 Jan 2026 23:47:49 +0000
Date: Thu, 29 Jan 2026 07:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD REGRESSION
 c0b4a4feeb43305a754893d8d9c6b2b5a52d45ac
Message-ID: <202601290738.MQnHb7RU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-31260-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF559AA066
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: c0b4a4feeb43305a754893d8d9c6b2b5a52d45ac  pinctrl: equilibrium: Fix device node reference leak in pinbank_init()

Unverified Error/Warning (likely false positive, kindly check if interested):

    ERROR: modpost: __ex_table+0x25fc references non-executable section '.data..ro_after_init'
    ERROR: modpost: __ex_table+0x2608 references non-executable section '.data..unlikely'
    drivers/pinctrl/pinctrl-rockchip.c:3683 rockchip_pinconf_set() error: we previously assumed 'gpio->direction_output' could be null (see line 3644)

Error/Warning ids grouped by kconfigs:

recent_errors
|-- riscv-randconfig-001-20260128
|   |-- ERROR:__ex_table-references-non-executable-section-.data..ro_after_init
|   `-- ERROR:__ex_table-references-non-executable-section-.data..unlikely
`-- sparc-randconfig-r073-20260128
    `-- drivers-pinctrl-pinctrl-rockchip.c-rockchip_pinconf_set()-error:we-previously-assumed-gpio-direction_output-could-be-null-(see-line-)

elapsed time: 932m

configs tested: 299
configs skipped: 9

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260128    gcc-9.5.0
arc                   randconfig-001-20260129    clang-18
arc                   randconfig-002-20260128    gcc-8.5.0
arc                   randconfig-002-20260129    clang-18
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         at91_dt_defconfig    clang-22
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                        mvebu_v5_defconfig    clang-22
arm                   randconfig-001-20260128    gcc-15.2.0
arm                   randconfig-001-20260129    clang-18
arm                   randconfig-002-20260128    gcc-15.2.0
arm                   randconfig-002-20260129    clang-18
arm                   randconfig-003-20260128    gcc-8.5.0
arm                   randconfig-003-20260129    clang-18
arm                   randconfig-004-20260128    gcc-8.5.0
arm                   randconfig-004-20260129    clang-18
arm                           sama7_defconfig    clang-22
arm                           u8500_defconfig    gcc-15.2.0
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260128    clang-22
arm64                 randconfig-001-20260129    gcc-11.5.0
arm64                 randconfig-002-20260128    gcc-12.5.0
arm64                 randconfig-002-20260129    gcc-11.5.0
arm64                 randconfig-003-20260128    gcc-14.3.0
arm64                 randconfig-003-20260129    gcc-11.5.0
arm64                 randconfig-004-20260128    gcc-13.4.0
arm64                 randconfig-004-20260129    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260128    gcc-15.2.0
csky                  randconfig-001-20260129    gcc-11.5.0
csky                  randconfig-002-20260128    gcc-14.3.0
csky                  randconfig-002-20260129    gcc-11.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260128    clang-20
hexagon               randconfig-001-20260129    clang-22
hexagon               randconfig-002-20260128    clang-20
hexagon               randconfig-002-20260129    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260128    gcc-14
i386        buildonly-randconfig-001-20260129    clang-20
i386        buildonly-randconfig-002-20260128    clang-20
i386        buildonly-randconfig-002-20260129    clang-20
i386        buildonly-randconfig-003-20260128    gcc-14
i386        buildonly-randconfig-003-20260129    clang-20
i386        buildonly-randconfig-004-20260128    clang-20
i386        buildonly-randconfig-004-20260129    clang-20
i386        buildonly-randconfig-005-20260128    gcc-14
i386        buildonly-randconfig-005-20260129    clang-20
i386        buildonly-randconfig-006-20260128    clang-20
i386        buildonly-randconfig-006-20260129    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260128    gcc-14
i386                  randconfig-001-20260129    clang-20
i386                  randconfig-002-20260128    gcc-14
i386                  randconfig-002-20260129    clang-20
i386                  randconfig-003-20260128    gcc-14
i386                  randconfig-003-20260129    clang-20
i386                  randconfig-004-20260128    gcc-14
i386                  randconfig-004-20260129    clang-20
i386                  randconfig-005-20260128    gcc-14
i386                  randconfig-005-20260129    clang-20
i386                  randconfig-006-20260128    gcc-14
i386                  randconfig-006-20260129    clang-20
i386                  randconfig-007-20260128    gcc-14
i386                  randconfig-007-20260129    clang-20
i386                  randconfig-011-20260128    clang-20
i386                  randconfig-011-20260129    clang-20
i386                  randconfig-012-20260128    gcc-14
i386                  randconfig-012-20260129    clang-20
i386                  randconfig-013-20260128    gcc-14
i386                  randconfig-013-20260129    clang-20
i386                  randconfig-014-20260128    clang-20
i386                  randconfig-014-20260129    clang-20
i386                  randconfig-015-20260128    clang-20
i386                  randconfig-015-20260129    clang-20
i386                  randconfig-016-20260128    gcc-14
i386                  randconfig-016-20260129    clang-20
i386                  randconfig-017-20260128    clang-20
i386                  randconfig-017-20260129    clang-20
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260128    clang-22
loongarch             randconfig-001-20260129    clang-22
loongarch             randconfig-002-20260128    clang-20
loongarch             randconfig-002-20260129    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    clang-22
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                           ip32_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260128    gcc-8.5.0
nios2                 randconfig-001-20260129    clang-22
nios2                 randconfig-002-20260128    gcc-11.5.0
nios2                 randconfig-002-20260129    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    gcc-15.2.0
openrisc                       virt_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260128    gcc-11.5.0
parisc                randconfig-001-20260129    gcc-8.5.0
parisc                randconfig-002-20260128    gcc-12.5.0
parisc                randconfig-002-20260129    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      bamboo_defconfig    clang-22
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                     ep8248e_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20260128    clang-22
powerpc               randconfig-001-20260129    gcc-8.5.0
powerpc               randconfig-002-20260128    gcc-8.5.0
powerpc               randconfig-002-20260129    gcc-8.5.0
powerpc64             randconfig-001-20260128    clang-22
powerpc64             randconfig-001-20260129    gcc-8.5.0
powerpc64             randconfig-002-20260128    clang-22
powerpc64             randconfig-002-20260129    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260128    gcc-13.4.0
riscv                 randconfig-001-20260129    gcc-15.2.0
riscv                 randconfig-002-20260128    gcc-15.2.0
riscv                 randconfig-002-20260129    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260128    gcc-13.4.0
s390                  randconfig-001-20260129    gcc-15.2.0
s390                  randconfig-002-20260128    gcc-8.5.0
s390                  randconfig-002-20260129    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                 kfr2r09-romimage_defconfig    gcc-15.2.0
sh                    randconfig-001-20260128    gcc-15.2.0
sh                    randconfig-001-20260129    gcc-15.2.0
sh                    randconfig-002-20260128    gcc-15.2.0
sh                    randconfig-002-20260129    gcc-15.2.0
sh                          rsk7201_defconfig    clang-22
sh                           se7705_defconfig    clang-22
sh                           se7722_defconfig    clang-22
sh                  sh7785lcr_32bit_defconfig    gcc-15.2.0
sh                            shmin_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260128    gcc-8.5.0
sparc                 randconfig-001-20260129    gcc-15.2.0
sparc                 randconfig-002-20260128    gcc-8.5.0
sparc                 randconfig-002-20260129    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260128    gcc-12.5.0
sparc64               randconfig-001-20260129    gcc-15.2.0
sparc64               randconfig-002-20260128    gcc-10.5.0
sparc64               randconfig-002-20260129    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260128    gcc-12
um                    randconfig-001-20260129    gcc-15.2.0
um                    randconfig-002-20260128    clang-22
um                    randconfig-002-20260129    gcc-15.2.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260128    gcc-14
x86_64      buildonly-randconfig-001-20260129    gcc-13
x86_64      buildonly-randconfig-002-20260128    gcc-14
x86_64      buildonly-randconfig-002-20260129    gcc-13
x86_64      buildonly-randconfig-003-20260128    gcc-14
x86_64      buildonly-randconfig-003-20260129    gcc-13
x86_64      buildonly-randconfig-004-20260128    gcc-12
x86_64      buildonly-randconfig-004-20260129    gcc-13
x86_64      buildonly-randconfig-005-20260128    clang-20
x86_64      buildonly-randconfig-005-20260129    gcc-13
x86_64      buildonly-randconfig-006-20260128    clang-20
x86_64      buildonly-randconfig-006-20260129    gcc-13
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260128    clang-20
x86_64                randconfig-001-20260129    clang-20
x86_64                randconfig-002-20260128    clang-20
x86_64                randconfig-002-20260129    clang-20
x86_64                randconfig-003-20260128    clang-20
x86_64                randconfig-003-20260129    clang-20
x86_64                randconfig-004-20260128    gcc-14
x86_64                randconfig-004-20260129    clang-20
x86_64                randconfig-005-20260128    gcc-13
x86_64                randconfig-005-20260129    clang-20
x86_64                randconfig-006-20260128    gcc-14
x86_64                randconfig-006-20260129    clang-20
x86_64                randconfig-011-20260128    clang-20
x86_64                randconfig-012-20260128    gcc-14
x86_64                randconfig-013-20260128    clang-20
x86_64                randconfig-014-20260128    clang-20
x86_64                randconfig-015-20260128    gcc-14
x86_64                randconfig-016-20260128    clang-20
x86_64                randconfig-071-20260128    clang-20
x86_64                randconfig-071-20260129    gcc-14
x86_64                randconfig-072-20260128    clang-20
x86_64                randconfig-072-20260129    gcc-14
x86_64                randconfig-073-20260128    gcc-12
x86_64                randconfig-073-20260129    gcc-14
x86_64                randconfig-074-20260128    gcc-14
x86_64                randconfig-074-20260129    gcc-14
x86_64                randconfig-075-20260128    gcc-14
x86_64                randconfig-075-20260129    gcc-14
x86_64                randconfig-076-20260128    gcc-14
x86_64                randconfig-076-20260129    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260128    gcc-8.5.0
xtensa                randconfig-001-20260129    gcc-15.2.0
xtensa                randconfig-002-20260128    gcc-11.5.0
xtensa                randconfig-002-20260129    gcc-15.2.0
xtensa                         virt_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

