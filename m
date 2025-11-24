Return-Path: <linux-gpio+bounces-29031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C50B3C8144E
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 16:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 201114E04F5
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 15:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5129F313267;
	Mon, 24 Nov 2025 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Whl2gLr7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2F32749FE
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997255; cv=none; b=IxzdNXOerXBjFQankabCT0Cb/5m5tjfBN/yPi3+Ih1JeifprlXrC/P0copFcvCe2b3HHUXcO7LxZA3gYKtmCt7LMJ929PMsHRSOF4Zm/vy/195qU95dWog45FjvZC99qK4EMmb2uf/9xp/qVPT3NDtvFI96J91ZOYw76ipceoPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997255; c=relaxed/simple;
	bh=SD0fxEZaReCl69EXDf9rUSFR7lMwBcOjOcnnNwxh4JU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s7avAh6Cb4RFWIkj9hfN8FtPsVET28WTgWra6geI/4ZUe08Ln2NYjTpeeSgbx5FGgm+OvlloSjPu4TH4EYgDf5u38PZyBapQAx+H44vThnTszowq9woNnE3LXx1Y3kMEjJ1UPG9NnG+Ap/uECTCkOcNp7jfwzgx5HbZo7KrHZVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Whl2gLr7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763997254; x=1795533254;
  h=date:from:to:cc:subject:message-id;
  bh=SD0fxEZaReCl69EXDf9rUSFR7lMwBcOjOcnnNwxh4JU=;
  b=Whl2gLr7xXo/LU+eMCgimBZHgiZM1CxNBxag4UnZ9AxKuKX6P0vWuxoA
   3K2TuYW9KEOJFZ7t7hi33prgXWA5LobbmxBfy3lHA+/XoQepMDHXArlrj
   D5XfDpb5oGFrcuTAZlt+CcpfrLljmBPehzpXrsK3x+vL9tabUlFzlfoEt
   2qlJ2vbkCgD66cP6leGXzM4jqk7axBq4FyGO/nZx0koAyBk+A06Ng9n7u
   3ZlolyzHYFdtMzEPV9mADdL8zhbHUv4KjIYH+5SCNZkdPlaS/i0JE4qRG
   l1h+UHcbzZY/hfqs6/F3nh7dLV69ukzEbQ2Nmj46ctEAZWE3IbXVGflB5
   Q==;
X-CSE-ConnectionGUID: 5MiLY6A5Q0+FguftGVlpvw==
X-CSE-MsgGUID: 5/FNjnbgRiithDRbQol+cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66027596"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="66027596"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 07:14:14 -0800
X-CSE-ConnectionGUID: c+Bs0LSzSiOYnUqvDyqHlw==
X-CSE-MsgGUID: Lcfo/wo+TvCGG/GUaPKE7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="223334857"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2025 07:14:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNYGX-000000000qR-44ao;
	Mon, 24 Nov 2025 15:14:09 +0000
Date: Mon, 24 Nov 2025 23:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 2b6d546ba83e8332870741eca469aed662d819ff
Message-ID: <202511242321.dXO5d5Tn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 2b6d546ba83e8332870741eca469aed662d819ff  MAINTAINERS: update my email address

elapsed time: 7448m

configs tested: 73
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251119    gcc-10.5.0
arc         randconfig-002-20251119    gcc-8.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251119    gcc-8.5.0
arm         randconfig-002-20251119    clang-16
arm         randconfig-003-20251119    clang-22
arm64                   allnoconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
parisc      randconfig-001-20251120    gcc-11.5.0
parisc      randconfig-002-20251120    gcc-12.5.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251120    clang-22
powerpc     randconfig-002-20251120    clang-22
powerpc64   randconfig-001-20251120    clang-22
powerpc64   randconfig-002-20251120    gcc-13.4.0
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20251119    gcc-15.1.0
riscv       randconfig-002-20251119    gcc-10.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251119    gcc-8.5.0
s390        randconfig-002-20251119    clang-22
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh          randconfig-001-20251119    gcc-11.5.0
sh          randconfig-002-20251119    gcc-9.5.0
sparc                   allnoconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

