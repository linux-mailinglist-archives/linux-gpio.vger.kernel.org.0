Return-Path: <linux-gpio+bounces-30143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C15CF2F98
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 11:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD82A302ABB9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 10:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4D51D54FA;
	Mon,  5 Jan 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxPa15hp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC81A9FAB
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 10:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608676; cv=none; b=TlCGAiu5hQT8Wwi4Xf0onTXnAasLWTxC9dD800rOsu7fVMh29w8SLCaqZy+4XRPU4fCE0AinndKmKbECzjzh0qI1fgkT+gk+bwYUbvhzgbpLYBAwGninEJuBWEATTlm9XW8DoWtLcM+UkYFw5Qbd9FuZPEPj5fBBBg90EmhFFoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608676; c=relaxed/simple;
	bh=rCdUctoDPX1n1LupuS7hQP3ah6UMokxYtUUPC3hnUkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p3Xodw35UsTwb6aqK1nfJwi7uKLMEwERbDMK1R5odUckUANMlf2Oc2b81o7/NOUGlxdo4Jzr0OnzmiLREsvntIAlEV/DEHYek5dP1y/RqezkZ3MX/FcEL2PTYvxbjdt46JYYDAtlK85cxWr8bMdWQDYySYuEj2ch5fHCuCtJg5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxPa15hp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767608674; x=1799144674;
  h=date:from:to:cc:subject:message-id;
  bh=rCdUctoDPX1n1LupuS7hQP3ah6UMokxYtUUPC3hnUkQ=;
  b=ZxPa15hpHlcIp6kvI9djBtPD07xuD+wexIWxEUeRB4EL5sy60t8/PuyX
   Duh1y3A6MZrfHTQc0f7Lk/4UwOjMUUr9P6vcWHDgOe7mQPik4nT6gh3XU
   hOHS6L9YyDAbmNDG+Zh4hsAwVfZ8+mpSpPwWOvRVlXXlKwD7vekgt8wqD
   7r9te/E9zmR2lNpHa0Uyw/Wyn8tv/gEHmR53zMDDl+kmxrQXqPjiPTi7X
   WHQ5zpmAd4dlKTDPQpj8PNZ1PKscY4Y6hlIQ1eoEvyYDJyMT4QNf8RhSw
   EBnah42pJVgAfRCZmq1xf647D7gpRe0Xjeq1lxUdqoaDqBi7bjYzitP2X
   Q==;
X-CSE-ConnectionGUID: 0eH6kHqdQgy7538L72HGKg==
X-CSE-MsgGUID: uqb8KLp9SfmnscXmkyaRmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68952961"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68952961"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 02:24:33 -0800
X-CSE-ConnectionGUID: zo75U73bQaCCPCaYf5okrw==
X-CSE-MsgGUID: 8Nwa9/QWRy6Qg6yd1i4dmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="233498433"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jan 2026 02:24:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vchlG-0000000015F-18o7;
	Mon, 05 Jan 2026 10:24:30 +0000
Date: Mon, 05 Jan 2026 18:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/maintainer-fix-mailmap] BUILD SUCCESS
 4c0a9baaa002d8f2ce841b6df28bb68bd0399b45
Message-ID: <202601051830.7tppLjvM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/maintainer-fix-mailmap
branch HEAD: 4c0a9baaa002d8f2ce841b6df28bb68bd0399b45  Update .mailmap for Linus Walleij

elapsed time: 5466m

configs tested: 54
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.1.0
alpha        allyesconfig    gcc-15.1.0
arc          allmodconfig    gcc-15.1.0
arc           allnoconfig    gcc-15.1.0
arc          allyesconfig    gcc-15.1.0
arm           allnoconfig    clang-22
arm          allyesconfig    gcc-15.1.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.1.0
csky         allmodconfig    gcc-15.1.0
csky          allnoconfig    gcc-15.1.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-22
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-22
m68k         allmodconfig    gcc-15.1.0
m68k          allnoconfig    gcc-15.1.0
m68k         allyesconfig    gcc-15.1.0
microblaze    allnoconfig    gcc-15.1.0
microblaze   allyesconfig    gcc-15.1.0
mips         allmodconfig    gcc-15.1.0
mips          allnoconfig    gcc-15.1.0
mips         allyesconfig    gcc-15.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.1.0
openrisc      allnoconfig    gcc-15.1.0
parisc       allmodconfig    gcc-15.1.0
parisc        allnoconfig    gcc-15.1.0
parisc       allyesconfig    gcc-15.1.0
powerpc      allmodconfig    gcc-15.1.0
powerpc       allnoconfig    gcc-15.1.0
riscv        allmodconfig    clang-22
riscv         allnoconfig    gcc-15.1.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-22
s390         allyesconfig    gcc-15.1.0
sh           allmodconfig    gcc-15.1.0
sh            allnoconfig    gcc-15.1.0
sh           allyesconfig    gcc-15.1.0
sparc         allnoconfig    gcc-15.1.0
sparc64      allmodconfig    clang-22
um           allmodconfig    clang-19
um            allnoconfig    clang-22
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

