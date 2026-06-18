Return-Path: <linux-gpio+bounces-38652-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cOqrBFk7M2o6+gUAu9opvQ
	(envelope-from <linux-gpio+bounces-38652-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 02:27:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A4B69CE36
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 02:27:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Fe7F1pvU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38652-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38652-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C422301E6C1
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 00:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDB220D4FF;
	Thu, 18 Jun 2026 00:22:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813115E8B
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 00:22:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781742124; cv=none; b=fLD60mGpTMPBwfjavu4xE0d1/WixnbrAAd4SMMiw1z6a2B+tw5/3v64xLWpJEq65iOnlNQ8t7KDjm6zIgti/pR65/0ebB07eg1l5LwTysH6q3F9aPEpjzvBSqFXqvfG+PnZBxU3dElHmR7X+8VkUzcmlyDjGaHwcWEX5WfIvZBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781742124; c=relaxed/simple;
	bh=IvVxCQKyjtD4qfRSotGz38Y+fRH83bN97aZMyLfCN9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q4k+9tP/VxUGPWfuLVHsxUlby/yu9RFTZMEmNIIKI5JzXFWm9ZeLofQu816+PloU6dvETwSft/38SpHcNEo++tswnhmQ2Zr5bhpjgX49r97MY/UMeeknSTbllnt/q7mz92hlJtIfkQ7E8GG+mXX/W4Kbtr6uqwBlHvIKuIDttEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fe7F1pvU; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781742122; x=1813278122;
  h=date:from:to:cc:subject:message-id;
  bh=IvVxCQKyjtD4qfRSotGz38Y+fRH83bN97aZMyLfCN9s=;
  b=Fe7F1pvUEFJKarNJUOEYEiQ1ohWwKQUqSYhscmMHgwRpf4W3HkQiFm1Q
   ujYZthwzFmQLs++DO0GlqcMfQKQ0PKQoQT74HaCyAOLsXqxv+n1mjBfNc
   0ZpGKejYRCXfE9KLF6NbsbuTd/TVtr1LAl7d5UATkIVH+xVeBViUgAgIq
   Js/0rGRVYyM4x96YbXQsyMUX7aX0NFio/MiJ1jx+r3ZzwQDKpCsG1nsBl
   mivbh6LD9eSOduFBsGceIovlVOlnZq/9Z6hOPLs09QDT+yZmjbM9R0RfR
   ilPKGe1ZUOZnCOCHoFVvxGYUdPSSwd0UdDf5kz47NNEUG+/ytFKGGPffK
   g==;
X-CSE-ConnectionGUID: xVHc7TvCRmqU99MSJs5a/A==
X-CSE-MsgGUID: FqrGY5W7RMel+u01V3/nRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82566314"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82566314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:22:02 -0700
X-CSE-ConnectionGUID: hRsi+XbITsCSccKVo7CXwA==
X-CSE-MsgGUID: IPkIeDpLShmiWerIZ6esvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="244046161"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jun 2026 17:22:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa0W6-00000000V5m-1rno;
	Thu, 18 Jun 2026 00:21:58 +0000
Date: Thu, 18 Jun 2026 08:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 ae9f812df3149729643d27d2af488c112f62af9a
Message-ID: <202606180848.0TnNTNYh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38652-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75A4B69CE36

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: ae9f812df3149729643d27d2af488c112f62af9a  gpiolib: acpi: Prevent out-of-bounds pin access in OperationRegion handler

elapsed time: 822m

configs tested: 270
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260617    gcc-16.1.0
arc                   randconfig-001-20260618    gcc-15.2.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260617    gcc-16.1.0
arc                   randconfig-002-20260618    gcc-15.2.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260617    gcc-16.1.0
arm                   randconfig-001-20260618    gcc-15.2.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260617    gcc-16.1.0
arm                   randconfig-002-20260618    gcc-15.2.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260617    gcc-16.1.0
arm                   randconfig-003-20260618    gcc-15.2.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260617    gcc-16.1.0
arm                   randconfig-004-20260618    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260617    gcc-12.5.0
arm64                 randconfig-001-20260618    gcc-15.2.0
arm64                 randconfig-002-20260617    gcc-12.5.0
arm64                 randconfig-002-20260618    gcc-15.2.0
arm64                 randconfig-003-20260617    gcc-12.5.0
arm64                 randconfig-003-20260618    gcc-15.2.0
arm64                 randconfig-004-20260617    gcc-12.5.0
arm64                 randconfig-004-20260618    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260617    gcc-12.5.0
csky                  randconfig-001-20260618    gcc-15.2.0
csky                  randconfig-002-20260617    gcc-12.5.0
csky                  randconfig-002-20260618    gcc-15.2.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260617    clang-17
hexagon               randconfig-001-20260618    clang-23
hexagon               randconfig-002-20260617    clang-17
hexagon               randconfig-002-20260618    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260617    gcc-14
i386        buildonly-randconfig-001-20260618    gcc-14
i386        buildonly-randconfig-002-20260617    gcc-14
i386        buildonly-randconfig-002-20260618    gcc-14
i386        buildonly-randconfig-003-20260617    gcc-14
i386        buildonly-randconfig-003-20260618    gcc-14
i386        buildonly-randconfig-004-20260617    gcc-14
i386        buildonly-randconfig-004-20260618    gcc-14
i386        buildonly-randconfig-005-20260617    gcc-14
i386        buildonly-randconfig-005-20260618    gcc-14
i386        buildonly-randconfig-006-20260617    gcc-14
i386        buildonly-randconfig-006-20260618    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260617    gcc-13
i386                  randconfig-001-20260618    clang-22
i386                  randconfig-002-20260617    gcc-13
i386                  randconfig-002-20260618    clang-22
i386                  randconfig-003-20260617    gcc-13
i386                  randconfig-003-20260618    clang-22
i386                  randconfig-004-20260617    gcc-13
i386                  randconfig-004-20260618    clang-22
i386                  randconfig-005-20260617    gcc-13
i386                  randconfig-005-20260618    clang-22
i386                  randconfig-006-20260617    gcc-13
i386                  randconfig-006-20260618    clang-22
i386                  randconfig-007-20260617    gcc-13
i386                  randconfig-007-20260618    clang-22
i386                  randconfig-011-20260617    clang-22
i386                  randconfig-011-20260618    clang-22
i386                  randconfig-012-20260617    clang-22
i386                  randconfig-012-20260618    clang-22
i386                  randconfig-013-20260617    clang-22
i386                  randconfig-013-20260618    clang-22
i386                  randconfig-014-20260617    clang-22
i386                  randconfig-014-20260618    clang-22
i386                  randconfig-015-20260617    clang-22
i386                  randconfig-015-20260618    clang-22
i386                  randconfig-016-20260617    clang-22
i386                  randconfig-016-20260618    clang-22
i386                  randconfig-017-20260617    clang-22
i386                  randconfig-017-20260618    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260617    clang-17
loongarch             randconfig-001-20260618    clang-23
loongarch             randconfig-002-20260617    clang-17
loongarch             randconfig-002-20260618    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260617    clang-17
nios2                 randconfig-001-20260618    clang-23
nios2                 randconfig-002-20260617    clang-17
nios2                 randconfig-002-20260618    clang-23
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc         de0_nano_multicore_defconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260617    gcc-15.2.0
parisc                randconfig-001-20260618    gcc-16.1.0
parisc                randconfig-002-20260617    gcc-15.2.0
parisc                randconfig-002-20260618    gcc-16.1.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                          g5_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260617    gcc-15.2.0
powerpc               randconfig-001-20260618    gcc-16.1.0
powerpc               randconfig-002-20260617    gcc-15.2.0
powerpc               randconfig-002-20260618    gcc-16.1.0
powerpc64             randconfig-001-20260617    gcc-15.2.0
powerpc64             randconfig-001-20260618    gcc-16.1.0
powerpc64             randconfig-002-20260617    gcc-15.2.0
powerpc64             randconfig-002-20260618    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-16.1.0
riscv                 randconfig-001-20260617    gcc-16.1.0
riscv                 randconfig-001-20260618    gcc-13.4.0
riscv                          randconfig-002    gcc-16.1.0
riscv                 randconfig-002-20260617    gcc-16.1.0
riscv                 randconfig-002-20260618    gcc-13.4.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-16.1.0
s390                  randconfig-001-20260617    gcc-16.1.0
s390                  randconfig-001-20260618    gcc-13.4.0
s390                           randconfig-002    gcc-16.1.0
s390                  randconfig-002-20260617    gcc-16.1.0
s390                  randconfig-002-20260618    gcc-13.4.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                         ap325rxa_defconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-16.1.0
sh                    randconfig-001-20260617    gcc-16.1.0
sh                    randconfig-001-20260618    gcc-13.4.0
sh                             randconfig-002    gcc-16.1.0
sh                    randconfig-002-20260617    gcc-16.1.0
sh                    randconfig-002-20260618    gcc-13.4.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260617    gcc-16.1.0
sparc                 randconfig-001-20260618    gcc-14.3.0
sparc                 randconfig-002-20260617    gcc-16.1.0
sparc                 randconfig-002-20260618    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260617    gcc-16.1.0
sparc64               randconfig-001-20260618    gcc-14.3.0
sparc64               randconfig-002-20260617    gcc-16.1.0
sparc64               randconfig-002-20260618    gcc-14.3.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260617    gcc-16.1.0
um                    randconfig-001-20260618    gcc-14.3.0
um                    randconfig-002-20260617    gcc-16.1.0
um                    randconfig-002-20260618    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260617    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260617    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260617    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260617    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260617    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260617    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260617    clang-22
x86_64                randconfig-001-20260618    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260617    clang-22
x86_64                randconfig-002-20260618    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260617    clang-22
x86_64                randconfig-003-20260618    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260617    clang-22
x86_64                randconfig-004-20260618    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260617    clang-22
x86_64                randconfig-005-20260618    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260617    clang-22
x86_64                randconfig-006-20260618    clang-22
x86_64                randconfig-011-20260617    clang-22
x86_64                randconfig-012-20260617    clang-22
x86_64                randconfig-013-20260617    clang-22
x86_64                randconfig-014-20260617    clang-22
x86_64                randconfig-015-20260617    clang-22
x86_64                randconfig-016-20260617    clang-22
x86_64                         randconfig-071    gcc-13
x86_64                randconfig-071-20260617    gcc-13
x86_64                randconfig-071-20260618    clang-22
x86_64                         randconfig-072    gcc-13
x86_64                randconfig-072-20260617    gcc-13
x86_64                randconfig-072-20260618    clang-22
x86_64                         randconfig-073    gcc-13
x86_64                randconfig-073-20260617    gcc-13
x86_64                randconfig-073-20260618    clang-22
x86_64                         randconfig-074    gcc-13
x86_64                randconfig-074-20260617    gcc-13
x86_64                randconfig-074-20260618    clang-22
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260617    gcc-13
x86_64                randconfig-075-20260618    clang-22
x86_64                         randconfig-076    gcc-13
x86_64                randconfig-076-20260617    gcc-13
x86_64                randconfig-076-20260618    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260617    gcc-16.1.0
xtensa                randconfig-001-20260618    gcc-14.3.0
xtensa                randconfig-002-20260617    gcc-16.1.0
xtensa                randconfig-002-20260618    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

