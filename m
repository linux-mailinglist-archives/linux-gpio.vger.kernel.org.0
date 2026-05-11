Return-Path: <linux-gpio+bounces-36620-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKk5HHk7AmrmpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36620-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:26:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E91515D66
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4763C301C8BF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C502537FF60;
	Mon, 11 May 2026 20:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uprzrdly"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72A337B02B
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531104; cv=none; b=nkUoPpJJCsGY5shE7ID47sckxCuj0WhmP/6Rup0f0VcsPZazspXbWZxU3YYGJ5V1gtFQgtXhrWC57lcJKpYj4Hlk5JGuAetW70bkq6b4V4TPes5XLPouUlP1DBOJMK1RNlLFn/10S58S3lhVr1uRALYZR4CsvKCsh6mnBOFrO1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531104; c=relaxed/simple;
	bh=Wb6GRp3FWzLkTobiubGbby9rPL8BwYVTGCSPqVNT18U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EA1lfeLH/5qeolo+e87e8MDAbNijq0tq3elT6z2IffqUL78eofcJ5y+Bh4Q8HGNTuQ0N7A8e+O1Q/JdyE8AbSgOhNXq2S6WP0Z/dY6PY5dPH8ztDut74dd8dixVc9UG3lBKgZw0mUBknfPC4m/nHhVfm57InqjXTLooHnPZBxhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uprzrdly; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778531102; x=1810067102;
  h=date:from:to:cc:subject:message-id;
  bh=Wb6GRp3FWzLkTobiubGbby9rPL8BwYVTGCSPqVNT18U=;
  b=Uprzrdly0uidLbmPB3BvxbY+wprxRKarnrrXm3QHnqdt4mOopJYusppt
   X4jQStbaS0SvwseBgFzH/ioDfss4UqVExtV/sAdB1Iz+G7AlLu878K1yf
   wVj91opEsNk94J9mTFgEhGhagaVq6AV12Wxy3YEFhtClc4GWa9rJoeuOX
   F4X3e73P9TCfGq77QJh7EVn3pDluJgBw26/1Ccn5lz5j7LeFtzou/jIfu
   4ZJIeDjZmLSqHOJsCua80EKbNJZVPgt1X4dqElEj0SM4VR1LT8D6p2NQt
   YFQiFGhO49Y8tdZPBSe4OGR02InCL/pHXHRLc0pmEliQqoShV5TgrP066
   g==;
X-CSE-ConnectionGUID: H+m49KsTQU6kSux4ZB8oLA==
X-CSE-MsgGUID: Sk32P+UfSIyKTbEMJnYu3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="96997085"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="96997085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 13:25:01 -0700
X-CSE-ConnectionGUID: eNhl7LFqRzK2zdZlz4RKtw==
X-CSE-MsgGUID: WiXp9a7eQn6cxsKHhjMtSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="237784512"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 May 2026 13:24:59 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMXBR-0000000017x-1fsK;
	Mon, 11 May 2026 20:24:57 +0000
Date: Tue, 12 May 2026 04:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-next] BUILD SUCCESS
 513f49c33e91e58975ada7967b44512179f0e703
Message-ID: <202605120449.8aggFODw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: C7E91515D66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36620-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: 513f49c33e91e58975ada7967b44512179f0e703  power: sequencing: print power sequencing device parent in debugfs

elapsed time: 725m

configs tested: 304
configs skipped: 2

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
arc                   randconfig-001-20260511    gcc-10.5.0
arc                   randconfig-002-20260511    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260511    gcc-10.5.0
arm                   randconfig-002-20260511    gcc-10.5.0
arm                   randconfig-003-20260511    gcc-10.5.0
arm                   randconfig-004-20260511    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260511    clang-17
arm64                 randconfig-001-20260511    clang-23
arm64                 randconfig-001-20260512    gcc-14.3.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260511    clang-17
arm64                 randconfig-002-20260511    clang-23
arm64                 randconfig-002-20260512    gcc-14.3.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260511    clang-17
arm64                 randconfig-003-20260511    clang-23
arm64                 randconfig-003-20260512    gcc-14.3.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260511    clang-17
arm64                 randconfig-004-20260511    clang-23
arm64                 randconfig-004-20260512    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260511    clang-17
csky                  randconfig-001-20260511    clang-23
csky                  randconfig-001-20260512    gcc-14.3.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260511    clang-17
csky                  randconfig-002-20260511    clang-23
csky                  randconfig-002-20260512    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    clang-17
hexagon               randconfig-001-20260511    clang-23
hexagon               randconfig-001-20260511    gcc-8.5.0
hexagon               randconfig-001-20260512    gcc-10.5.0
hexagon                        randconfig-002    clang-23
hexagon               randconfig-002-20260511    clang-16
hexagon               randconfig-002-20260511    gcc-8.5.0
hexagon               randconfig-002-20260512    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260511    gcc-14
i386        buildonly-randconfig-002-20260511    gcc-14
i386        buildonly-randconfig-003-20260511    gcc-14
i386        buildonly-randconfig-004-20260511    gcc-14
i386        buildonly-randconfig-005-20260511    gcc-14
i386        buildonly-randconfig-006-20260511    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260511    gcc-12
i386                  randconfig-002-20260511    gcc-12
i386                  randconfig-003-20260511    gcc-12
i386                  randconfig-004-20260511    gcc-12
i386                  randconfig-005-20260511    gcc-12
i386                  randconfig-006-20260511    gcc-12
i386                  randconfig-007-20260511    gcc-12
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260511    clang-20
i386                  randconfig-011-20260512    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260511    clang-20
i386                  randconfig-012-20260512    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260511    clang-20
i386                  randconfig-013-20260512    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260511    clang-20
i386                  randconfig-014-20260512    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260511    clang-20
i386                  randconfig-015-20260512    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260511    clang-20
i386                  randconfig-016-20260512    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260511    clang-20
i386                  randconfig-017-20260512    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    clang-18
loongarch             randconfig-001-20260511    clang-23
loongarch             randconfig-001-20260511    gcc-8.5.0
loongarch             randconfig-001-20260512    gcc-10.5.0
loongarch                      randconfig-002    gcc-13.4.0
loongarch             randconfig-002-20260511    clang-18
loongarch             randconfig-002-20260511    gcc-8.5.0
loongarch             randconfig-002-20260512    gcc-10.5.0
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
mips                           jazz_defconfig    clang-17
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260511    gcc-8.5.0
nios2                 randconfig-001-20260511    gcc-9.5.0
nios2                 randconfig-001-20260512    gcc-10.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260511    gcc-8.5.0
nios2                 randconfig-002-20260512    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-20
parisc                randconfig-001-20260511    clang-20
parisc                         randconfig-002    clang-20
parisc                randconfig-002-20260511    clang-20
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      arches_defconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                        randconfig-001    clang-20
powerpc               randconfig-001-20260511    clang-20
powerpc                        randconfig-002    clang-20
powerpc               randconfig-002-20260511    clang-20
powerpc64                      randconfig-001    clang-20
powerpc64             randconfig-001-20260511    clang-20
powerpc64                      randconfig-002    clang-20
powerpc64             randconfig-002-20260511    clang-20
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-12.5.0
riscv                 randconfig-001-20260511    gcc-12.5.0
riscv                 randconfig-001-20260512    gcc-15.2.0
riscv                          randconfig-002    gcc-12.5.0
riscv                 randconfig-002-20260511    gcc-12.5.0
riscv                 randconfig-002-20260512    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-12.5.0
s390                  randconfig-001-20260511    gcc-12.5.0
s390                  randconfig-001-20260512    gcc-15.2.0
s390                           randconfig-002    gcc-12.5.0
s390                  randconfig-002-20260511    gcc-12.5.0
s390                  randconfig-002-20260512    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-12.5.0
sh                    randconfig-001-20260511    gcc-12.5.0
sh                    randconfig-001-20260512    gcc-15.2.0
sh                             randconfig-002    gcc-12.5.0
sh                    randconfig-002-20260511    gcc-12.5.0
sh                    randconfig-002-20260512    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260511    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260511    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260511    gcc-8.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260511    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260511    gcc-8.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260511    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-14
x86_64      buildonly-randconfig-001-20260511    gcc-14
x86_64      buildonly-randconfig-001-20260512    gcc-14
x86_64               buildonly-randconfig-002    gcc-14
x86_64      buildonly-randconfig-002-20260511    gcc-14
x86_64      buildonly-randconfig-002-20260512    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260511    gcc-14
x86_64      buildonly-randconfig-003-20260512    gcc-14
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260511    gcc-14
x86_64      buildonly-randconfig-004-20260512    gcc-14
x86_64               buildonly-randconfig-005    gcc-14
x86_64      buildonly-randconfig-005-20260511    gcc-14
x86_64      buildonly-randconfig-005-20260512    gcc-14
x86_64               buildonly-randconfig-006    gcc-14
x86_64      buildonly-randconfig-006-20260511    gcc-14
x86_64      buildonly-randconfig-006-20260512    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260511    clang-20
x86_64                randconfig-001-20260512    gcc-14
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260511    clang-20
x86_64                randconfig-002-20260512    gcc-14
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260511    clang-20
x86_64                randconfig-003-20260512    gcc-14
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260511    clang-20
x86_64                randconfig-004-20260512    gcc-14
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260511    clang-20
x86_64                randconfig-005-20260512    gcc-14
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260511    clang-20
x86_64                randconfig-006-20260512    gcc-14
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260511    clang-20
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260511    clang-20
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260511    clang-20
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260511    clang-20
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260511    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260511    clang-20
x86_64                randconfig-071-20260511    clang-20
x86_64                randconfig-072-20260511    clang-20
x86_64                randconfig-073-20260511    clang-20
x86_64                randconfig-074-20260511    clang-20
x86_64                randconfig-075-20260511    clang-20
x86_64                randconfig-076-20260511    clang-20
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
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260511    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260511    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

