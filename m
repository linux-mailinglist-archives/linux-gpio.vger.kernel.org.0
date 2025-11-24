Return-Path: <linux-gpio+bounces-29001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D54D1C7EE0A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 04:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7D2F2344C9A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 03:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA84259C80;
	Mon, 24 Nov 2025 03:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPA0Co2K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B54A2AE99
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 03:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763953902; cv=none; b=rvlu56L9GC76VOpD9PhAZjKfq/sEKu+gbncy0H86JEAv0xgC76h7fD22S7K2xkjuEUzlNMZVH0wDrqGK5C/1ogIjzeUc7UVkEzV45uvDKEHX5J18HZ69+k/UXHspTnCHidlqQRuF4sPRZQnEJOvdWkhanf2NXeYSYy2+8q1qzhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763953902; c=relaxed/simple;
	bh=IDBhwjiIBOdgE1OY1/405gj43DKOT85MGqvHTVjd1qs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HuBPLszbme2xj5RU8yN5xxwNsFsCWUjZdtYhe0bYHusC/OYIVNiLBxeEhzDse0IUV1MYLgaaCyHgyw83AVEdkYEYnnReBIRQaE22YbPNx4SZ8Jata1W81byXtIaXGSgVPydRELX8uW+cinY6VO6Y6CM2MDUqAqbu8XNfRlz93vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPA0Co2K; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763953901; x=1795489901;
  h=date:from:to:cc:subject:message-id;
  bh=IDBhwjiIBOdgE1OY1/405gj43DKOT85MGqvHTVjd1qs=;
  b=WPA0Co2K8WsGcJ8Oy5xi1t94hzxLFA72f8WG6YqRhNwNyKWFblYsBPwE
   yyoA/W0zx2IwnXR3nVh2B+Tsz8KQNIeD9hChQvKh8Qd8mwmugxlavo2fp
   dZKHNBBpXzW9+Q0dnVRZNNRdEa2zlT6BdS8vkeobKH9szF7ddnJHLfkvG
   hLM3SxWT6onQ5DaV/jBZ5xBnVawXSQyKHj9ZQA/xj6Sk2vB9scCCQPWur
   uO73tm0lVzIgW+Bs2OOnQTxaLxjD2lU+DH6YF55klUlWZyWKLgqpMI5gX
   +2mbo+IwFGiVnQW7t0vgnZ8xEkab9BCbRr3jbldsjO2iWoiH7DH+wjylk
   g==;
X-CSE-ConnectionGUID: 2H9/VVAuSmiE5NJBlV2znA==
X-CSE-MsgGUID: 2pEfQQDJREayQOdF+PoVAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83567982"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="83567982"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 19:11:41 -0800
X-CSE-ConnectionGUID: Y5mmPtNQRx++cSz7DKaZ9w==
X-CSE-MsgGUID: Oo9wGtYQQqCX53P81DENOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191383498"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Nov 2025 19:11:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNMzJ-000000000KR-25eh;
	Mon, 24 Nov 2025 03:11:37 +0000
Date: Mon, 24 Nov 2025 11:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 130eff6df1e497c445181b8910cb01ffd618ea2a
Message-ID: <202511241114.dNsLPLaO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 130eff6df1e497c445181b8910cb01ffd618ea2a  Merge branch 'devel' into for-next

elapsed time: 7381m

configs tested: 55
configs skipped: 3

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

