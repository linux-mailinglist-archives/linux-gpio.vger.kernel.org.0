Return-Path: <linux-gpio+bounces-39048-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PCR0JI1uP2o5TQkAu9opvQ
	(envelope-from <linux-gpio+bounces-39048-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 08:32:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0285E6D1517
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 08:32:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=AqBlq7AI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39048-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39048-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F27130221DC
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 06:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7951839023A;
	Sat, 27 Jun 2026 06:32:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B973563DD
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 06:32:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782541961; cv=none; b=aWhKrRCvbE9QNe4UkQd+i4UMDuQvOTx3NgcJFhkXfCrn3wITdymXo3+u8AGHtQMGz7q9QaCYJpsoGyiyKZNwQS8KvjKAcK8sT6HAzEHjckXPceEbLDsSIBCMSV0IJMn/Chtd9ylTxQokhk2rgwgnYPfw+PbpT2abPfa8vMrGi88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782541961; c=relaxed/simple;
	bh=fPEC1ZJd81Sacd4v9vs+ZgKBaFU7/hvRBKWjgx+5Ljs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OQ8/G9y83y2ldFCLuSf9QrEc8ziVyeynW0STZifhjoC/FWmCfhj8lW2eo/lx7NV3jVTF0TDIDSR4Sz46Uos52lBA7HN5uEs4vKFfE5unmbLgsMxKEVNa10651wD1xgVZ1/tKkeNJxL+KXCZ4up5CX+S+bMzgZrC/y1blXNVspMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqBlq7AI; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782541960; x=1814077960;
  h=date:from:to:cc:subject:message-id;
  bh=fPEC1ZJd81Sacd4v9vs+ZgKBaFU7/hvRBKWjgx+5Ljs=;
  b=AqBlq7AIoJH4+P+WeoEkkBWwUc2GB0tC8UNND4/iGxRuacW4+GjiaeDd
   eGU7VmTbermIOkLPTB/NoQcmekVNz8yEcoUUjT/Y3DXUcrZMU3ViBbLpJ
   FmDlOaBp8SDMebeIrlqwBNDIuEfGccw9QgUX7bvkcpTEobnAxsZpIZ56T
   2WYq5+KTE/zC+EHnYslee+SAaDurc0/OiOhnXs0ngiMRbkA4jSP1mkXGp
   xjShAWqf10C0lmjN3EZ/wxl3ZAv+n10YkXMR9seBwziYSEEIW7apfa8sL
   IGjQM6GP1yGYyCAFKaY8e5Wpm40VBTw7GbpLRQU7nNm1NlS9O+8hbi3oJ
   g==;
X-CSE-ConnectionGUID: WIv1uRF6S4aQJCY6tJT78A==
X-CSE-MsgGUID: D5WtkY2aRsumcf1Mjnqt0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83377620"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="83377620"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 23:32:37 -0700
X-CSE-ConnectionGUID: eIfjXXp+TlqBb5iTAg9Mqw==
X-CSE-MsgGUID: sHrDSaSdT5237gWlYC/7xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="249814262"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Jun 2026 23:32:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdMaf-000000005gL-0f77;
	Sat, 27 Jun 2026 06:32:33 +0000
Date: Sat, 27 Jun 2026 14:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pinctrl-qcom/for-next] BUILD SUCCESS
 62a3aa000055efcc86483e8953775943513fe44d
Message-ID: <202606271401.HGcWoH43-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39048-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0285E6D1517

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pinctrl-qcom/for-next
branch HEAD: 62a3aa000055efcc86483e8953775943513fe44d  pinctrl: qcom: Avoid assigning unused private context in test cases

elapsed time: 749m

configs tested: 289
configs skipped: 11

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
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-001-20260627    gcc-16.1.0
arc                   randconfig-002-20260627    gcc-16.1.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                         lpc18xx_defconfig    clang-23
arm                   randconfig-001-20260627    gcc-16.1.0
arm                   randconfig-002-20260627    gcc-16.1.0
arm                   randconfig-003-20260627    gcc-16.1.0
arm                   randconfig-004-20260627    gcc-16.1.0
arm                           spitz_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260627    clang-23
arm64                 randconfig-001-20260627    gcc-10.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260627    clang-23
arm64                 randconfig-002-20260627    gcc-10.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260627    clang-23
arm64                 randconfig-003-20260627    gcc-10.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260627    clang-23
arm64                 randconfig-004-20260627    gcc-10.5.0
arm64                 randconfig-004-20260627    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260627    clang-23
csky                  randconfig-001-20260627    gcc-10.5.0
csky                  randconfig-001-20260627    gcc-16.1.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260627    clang-23
csky                  randconfig-002-20260627    gcc-10.5.0
csky                  randconfig-002-20260627    gcc-14.3.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260627    clang-23
hexagon               randconfig-001-20260627    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260627    clang-18
hexagon               randconfig-002-20260627    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260627    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260627    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260627    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260627    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260627    clang-22
i386        buildonly-randconfig-005-20260627    gcc-13
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260627    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260627    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260627    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260627    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260627    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260627    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260627    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260627    clang-22
i386                  randconfig-011-20260627    clang-22
i386                  randconfig-012-20260627    clang-22
i386                  randconfig-013-20260627    clang-22
i386                  randconfig-013-20260627    gcc-14
i386                  randconfig-014-20260627    clang-22
i386                  randconfig-015-20260627    clang-22
i386                  randconfig-015-20260627    gcc-14
i386                  randconfig-016-20260627    clang-22
i386                  randconfig-017-20260627    clang-22
i386                  randconfig-017-20260627    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260627    clang-23
loongarch             randconfig-001-20260627    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260627    gcc-11.5.0
loongarch             randconfig-002-20260627    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260627    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260627    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260627    gcc-8.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260627    gcc-8.5.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                   motionpro_defconfig    clang-23
powerpc               mpc834x_itxgp_defconfig    clang-23
powerpc                        randconfig-001    gcc-8.5.0
powerpc               randconfig-001-20260627    clang-23
powerpc               randconfig-001-20260627    gcc-8.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260627    clang-17
powerpc               randconfig-002-20260627    gcc-8.5.0
powerpc64                      randconfig-001    gcc-8.5.0
powerpc64             randconfig-001-20260627    clang-20
powerpc64             randconfig-001-20260627    gcc-8.5.0
powerpc64                      randconfig-002    gcc-8.5.0
powerpc64             randconfig-002-20260627    clang-17
powerpc64             randconfig-002-20260627    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-23
riscv                 randconfig-001-20260627    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260627    clang-23
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-23
s390                  randconfig-001-20260627    clang-17
s390                  randconfig-001-20260627    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260627    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-23
sh                    randconfig-001-20260627    clang-23
sh                    randconfig-001-20260627    gcc-16.1.0
sh                             randconfig-002    clang-23
sh                    randconfig-002-20260627    clang-23
sh                    randconfig-002-20260627    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260627    gcc-13.4.0
sparc                 randconfig-001-20260627    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260627    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260627    gcc-13.4.0
sparc64               randconfig-001-20260627    gcc-8.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260627    gcc-15.2.0
sparc64               randconfig-002-20260627    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260627    clang-22
um                    randconfig-001-20260627    gcc-8.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260627    clang-23
um                    randconfig-002-20260627    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260627    gcc-13
x86_64      buildonly-randconfig-001-20260627    gcc-14
x86_64      buildonly-randconfig-002-20260627    clang-22
x86_64      buildonly-randconfig-002-20260627    gcc-14
x86_64      buildonly-randconfig-003-20260627    clang-22
x86_64      buildonly-randconfig-003-20260627    gcc-14
x86_64      buildonly-randconfig-004-20260627    gcc-14
x86_64      buildonly-randconfig-005-20260627    clang-22
x86_64      buildonly-randconfig-005-20260627    gcc-14
x86_64      buildonly-randconfig-006-20260627    clang-22
x86_64      buildonly-randconfig-006-20260627    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260627    clang-22
x86_64                randconfig-002-20260627    clang-22
x86_64                randconfig-002-20260627    gcc-12
x86_64                randconfig-003-20260627    clang-22
x86_64                randconfig-004-20260627    clang-22
x86_64                randconfig-004-20260627    gcc-14
x86_64                randconfig-005-20260627    clang-22
x86_64                randconfig-005-20260627    gcc-14
x86_64                randconfig-006-20260627    clang-22
x86_64                randconfig-011-20260627    clang-22
x86_64                randconfig-011-20260627    gcc-14
x86_64                randconfig-012-20260627    clang-22
x86_64                randconfig-012-20260627    gcc-14
x86_64                randconfig-013-20260627    gcc-14
x86_64                randconfig-014-20260627    gcc-14
x86_64                randconfig-015-20260627    gcc-14
x86_64                randconfig-016-20260627    gcc-14
x86_64                randconfig-071-20260627    clang-22
x86_64                randconfig-072-20260627    clang-22
x86_64                randconfig-073-20260627    clang-22
x86_64                randconfig-074-20260627    clang-22
x86_64                randconfig-074-20260627    gcc-14
x86_64                randconfig-075-20260627    clang-22
x86_64                randconfig-075-20260627    gcc-14
x86_64                randconfig-076-20260627    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260627    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260627    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

