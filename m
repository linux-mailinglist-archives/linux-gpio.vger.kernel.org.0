Return-Path: <linux-gpio+bounces-30165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EB5CF4EC3
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E47883008F19
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 17:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F372C08AD;
	Mon,  5 Jan 2026 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9hUxFhI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B033C32694E
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633091; cv=none; b=VK55zmTyW0KicAAX8RpphTCjIxYhgzP55LkE59zYq8Tp477F2+F9fwS5z6TgKYXA3aYI8Pva4DSHMTdUiYlFHHQzG6+6DJyQPLQjbXjW/hl3c+WrAXWLWOLhPv5H+luebvCLn/ctUQu8JWiP5nYOYM85GoiW37nYIgjGIaJAyKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633091; c=relaxed/simple;
	bh=lGCxuVG/bo0jWsehD/CeS8+1mDr4BwIgxr86njHZLuc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rpi3legDojrt+gtrRsMJI7SyO/pNiDGOuZRyRQw1futgDHEI802FgPR7klvCIsb/5eC0YVdnnsfVncJBbBR3uQB/CmUvTIqo7/BDvK1VjzJrGAR4g4U7nicSKUmWhTa90/qfBPyxoJGTyWSMp5CyOPDPKWFa5X+5g//baxrLRF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9hUxFhI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767633089; x=1799169089;
  h=date:from:to:cc:subject:message-id;
  bh=lGCxuVG/bo0jWsehD/CeS8+1mDr4BwIgxr86njHZLuc=;
  b=K9hUxFhIo/mJu//9jfoKivjC6OjcW5Jv5eQIhpFqPxKROuxWLReDcMSl
   cWxfV3DwVBifLwDWEt60qRCpvxexAqYhMaS5g0hObnjrrqFpLomdEHSto
   f8GgugeMUJfsPChpH+j7JDkmKg+QK0MFjgRT9ZddNugcJo306ItQc2O62
   7GQ0JwaRp7Nf/Xj7wNGMI7YwyigS02u/7AIJurXOFuZydIRgiMz83ZGOd
   U31dc37+8nIeWthx81SjETNIT8ApQA8O/Fwkh4vQbDqyL5vmabY6NNFxJ
   gT0or0YH5fRBuBP84+CSUzVVJCh05AgrlKXcfW6GUaoUXhJYhGVsojzLm
   A==;
X-CSE-ConnectionGUID: WyZb1DR5Rz2eJ1prgFKTDA==
X-CSE-MsgGUID: NtMnmtVwQ2i0FrQgHa5xrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68979749"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68979749"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 09:11:16 -0800
X-CSE-ConnectionGUID: Mw/pkxwGTzagKYipgv8zBw==
X-CSE-MsgGUID: OBpTomXJQueEK34J8cqqPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202450219"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Jan 2026 09:11:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vco6q-000000001Nt-1hhJ;
	Mon, 05 Jan 2026 17:11:12 +0000
Date: Tue, 06 Jan 2026 01:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 255b721c96046d4c57fa2268e4c72607868ce91f
Message-ID: <202601060132.CtU6cidd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 255b721c96046d4c57fa2268e4c72607868ce91f  pinctrl: mediatek: make devm allocations safer and clearer in mtk_eint_do_init()

elapsed time: 5873m

configs tested: 55
configs skipped: 5

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
xtensa       allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

