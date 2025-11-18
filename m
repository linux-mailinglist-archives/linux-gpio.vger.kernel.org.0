Return-Path: <linux-gpio+bounces-28637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 38091C67C6C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 07:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 1BBEF2905A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 06:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6E12EC57C;
	Tue, 18 Nov 2025 06:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOAZn7uX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079D414A8E
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763448532; cv=none; b=HtcmxwakTmmhcaUsPosHl2mtsta33xQEFZNqSIIYx1rdkbi73UEvopWN/Ba+V/rYa+F4pInTCBV9oNqtkh+nSnxkrzWy42YoyxYv9/UQbBvPcIRa2M9HVeR8kpRygNHoXu7OxcJik/N/XL6/w5HkUanBC+/YeCjuQY6lvzOUIbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763448532; c=relaxed/simple;
	bh=M2+hBmDETiWWYxiWnY85L+burA19ZoVYRPhBEnu/lf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=djfSdvhPjPNkyoN9iNZSlg0k3xeV7FnPES4gHJi39UiV7F1CEMh/gOvujXC+CQ3Hh8MIpPCF3fvd8DaYi5AXYq6hXLJagrJ27549i0D1bpPs0TksDbcr0WN0FC3kYcTT2sOCrHmSWAMWFoIuohw5z1Usg06kLP4GvTkm3d7F6Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOAZn7uX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763448531; x=1794984531;
  h=date:from:to:cc:subject:message-id;
  bh=M2+hBmDETiWWYxiWnY85L+burA19ZoVYRPhBEnu/lf4=;
  b=SOAZn7uXyiz3JqptxzC8GX7BgzsjtnP5TM6E5VVJ3C+LGSMLbK4bWdAe
   0wMC3ajJVJil+3lilllehB23z08VC/DS+33IK7odcWS5fhpv1pakE0XLi
   3VTdNN0+I3jSZRAAcQGUrPTlTagXNJ8605b2jcdX0lOhIP4+QsQxgbDSb
   H3ELJzX2FwK+fADIWX36qlDORliJ6dXFZoRmgwI6cEN0EkpOIEk2aDQGE
   M+ra6YnZqY8pFXrwThbwpyeTuIX2eCFlyDWkGQK8bPQpM3/QUwwoWFI6w
   RiMPhefzeAj4Cwy/en1fVaHV7wahtrodw8dzIFSAnGqQMQPa9jRJQFKdV
   A==;
X-CSE-ConnectionGUID: kMvwcSYuR0C8OJCrz7YzKg==
X-CSE-MsgGUID: /ARiorsESQyPjR2fFPbqrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69331552"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="69331552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 22:48:50 -0800
X-CSE-ConnectionGUID: JXyI5S3USGiXk2yhjxqc5Q==
X-CSE-MsgGUID: sUPKKsBlTdO9VwvaCLmKTg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2025 22:48:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLFWB-0001Pj-0k;
	Tue, 18 Nov 2025 06:48:47 +0000
Date: Tue, 18 Nov 2025 14:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 61cbe48d9d1ff277bc54051fbab8b733b2e64ccb
Message-ID: <202511181430.r4e7EDjA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 61cbe48d9d1ff277bc54051fbab8b733b2e64ccb  Merge branch 'devel' into for-next

elapsed time: 7621m

configs tested: 70
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-15.1.0
alpha              allyesconfig    gcc-15.1.0
arc                allmodconfig    gcc-15.1.0
arc                 allnoconfig    gcc-15.1.0
arc                allyesconfig    gcc-15.1.0
arm                allmodconfig    gcc-15.1.0
arm                 allnoconfig    clang-22
arm                allyesconfig    gcc-15.1.0
arm64               allnoconfig    gcc-15.1.0
csky               allmodconfig    gcc-15.1.0
csky                allnoconfig    gcc-15.1.0
csky               allyesconfig    gcc-15.1.0
hexagon            allmodconfig    clang-17
hexagon             allnoconfig    clang-22
hexagon            allyesconfig    clang-22
i386               allmodconfig    gcc-14
i386                allnoconfig    gcc-14
i386               allyesconfig    gcc-14
loongarch          allmodconfig    clang-19
loongarch           allnoconfig    clang-22
m68k               allmodconfig    gcc-15.1.0
m68k                allnoconfig    gcc-15.1.0
m68k               allyesconfig    gcc-15.1.0
microblaze         allmodconfig    gcc-15.1.0
microblaze          allnoconfig    gcc-15.1.0
microblaze         allyesconfig    gcc-15.1.0
mips               allmodconfig    gcc-15.1.0
mips                allnoconfig    gcc-15.1.0
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    gcc-11.5.0
nios2              allyesconfig    gcc-11.5.0
openrisc           allmodconfig    gcc-15.1.0
openrisc            allnoconfig    gcc-15.1.0
openrisc           allyesconfig    gcc-15.1.0
parisc             allmodconfig    gcc-15.1.0
parisc              allnoconfig    gcc-15.1.0
parisc             allyesconfig    gcc-15.1.0
powerpc            allmodconfig    gcc-15.1.0
powerpc             allnoconfig    gcc-15.1.0
powerpc            allyesconfig    clang-22
riscv              allmodconfig    clang-22
riscv               allnoconfig    gcc-15.1.0
riscv              allyesconfig    clang-16
s390               allmodconfig    clang-18
s390                allnoconfig    clang-22
s390               allyesconfig    gcc-15.1.0
sh                 allmodconfig    gcc-15.1.0
sh                  allnoconfig    gcc-15.1.0
sh                 allyesconfig    gcc-15.1.0
sparc              allmodconfig    gcc-15.1.0
sparc               allnoconfig    gcc-15.1.0
sparc              allyesconfig    gcc-15.1.0
sparc64            allmodconfig    clang-22
sparc64            allyesconfig    gcc-15.1.0
um                 allmodconfig    clang-19
um                  allnoconfig    clang-22
um                 allyesconfig    gcc-14
x86_64             allmodconfig    clang-20
x86_64              allnoconfig    clang-20
x86_64             allyesconfig    clang-20
x86_64                    kexec    clang-20
x86_64                 rhel-9.4    clang-20
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-20
x86_64      rhel-9.4-kselftests    clang-20
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-20
xtensa              allnoconfig    gcc-15.1.0
xtensa             allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

