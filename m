Return-Path: <linux-gpio+bounces-16854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B986DA4A6DA
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 01:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0F0167DA9
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 00:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2845D801;
	Sat,  1 Mar 2025 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5nHVD05"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CDB23A0
	for <linux-gpio@vger.kernel.org>; Sat,  1 Mar 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740787597; cv=none; b=IjzgxLW66OGAuyZK2wqhOo7SmGVg1kDaGmIO2ZvsktdvDbDu0tPK+5BQNuMPsgdPSzpKcY+Kq9i5k2miSUX+UggwQZcqG5GcFPkMhl+odxK/PMDT72DB+xI0m5U5idftJEXRv3biuOObfISrAF4Lxxd5OST8wFWm47g+kGqwUnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740787597; c=relaxed/simple;
	bh=ysKS9ijIvQa2QigYiQUWLsIrmt7b+FL59mIqlsnObdk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ICVzV0xbTtJwGOPU7zsi1+PJE2vv70RQs+1QPE7nhXtmHHN28I6SO4rP9vNaydIhSOoftscDEKY4EKPsHXi/ALSug0lhp5lXh0IOBm9I/Oo/42hhctJTfa2/x4V5i2eSuVnIKL6EKVxBQmluwEmjHN0X4QHdcd42CGupszU8jsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5nHVD05; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740787596; x=1772323596;
  h=date:from:to:cc:subject:message-id;
  bh=ysKS9ijIvQa2QigYiQUWLsIrmt7b+FL59mIqlsnObdk=;
  b=m5nHVD05J8Zbhif/505fggN2HAtIznwtZvHaeYtlmhZFNkcHXuPErklK
   UlLtZ6CoDb18dF2kAoUE4PIpGSK97AFy0YwxXVJx7ExIaoTiTLbuZJ6vh
   y8vP8lFxO3HVFW34iG2Nu/uY5/ENbCxxvPvTFrDikZkhzmz7TxxaKtRxw
   zPHTweRjlS8+e/o8sgXK9BimDk9PZRFq2p8Vc8Wrnbh9Lb+tohlAmmA9p
   9TccJBJgJFva8Yp6pEmhqHnTJBrWEa2z5qzh5jxbI8GNddQVz9uYoDGBE
   8V6IiHMPlbsPWwdNtBHttagpNPfLis1miuxjXIqZmByDMkY0rZZI/Idgz
   Q==;
X-CSE-ConnectionGUID: jkabNJvTRmejzA0dkB5dPQ==
X-CSE-MsgGUID: NLtBQ08iSJOHBgENiRMUug==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52364298"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="52364298"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 16:06:36 -0800
X-CSE-ConnectionGUID: 3kzDAwsOQaOhXZ/DYARa/w==
X-CSE-MsgGUID: wdLAJakIQFOOKgirWZmAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121597607"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Feb 2025 16:06:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toANE-000Feu-24;
	Sat, 01 Mar 2025 00:06:32 +0000
Date: Sat, 01 Mar 2025 08:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 920d1159328017ef0d57cb3172160ad7d33a9709
Message-ID: <202503010852.hiszXZNK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 920d1159328017ef0d57cb3172160ad7d33a9709  Merge branch 'devel' into for-next

elapsed time: 1469m

configs tested: 71
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250228    gcc-13.2.0
arc                   randconfig-002-20250228    gcc-13.2.0
arm                         axm55xx_defconfig    clang-17
arm                         bcm2835_defconfig    clang-16
arm                   randconfig-001-20250228    clang-21
arm                   randconfig-002-20250228    gcc-14.2.0
arm                   randconfig-003-20250228    gcc-14.2.0
arm                   randconfig-004-20250228    gcc-14.2.0
arm64                 randconfig-001-20250228    gcc-14.2.0
arm64                 randconfig-002-20250228    clang-21
arm64                 randconfig-003-20250228    clang-16
arm64                 randconfig-004-20250228    gcc-14.2.0
csky                  randconfig-001-20250228    gcc-14.2.0
csky                  randconfig-002-20250228    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250228    clang-19
hexagon               randconfig-002-20250228    clang-21
i386        buildonly-randconfig-001-20250228    clang-19
i386        buildonly-randconfig-002-20250228    clang-19
i386        buildonly-randconfig-003-20250228    gcc-12
i386        buildonly-randconfig-004-20250228    clang-19
i386        buildonly-randconfig-005-20250228    clang-19
i386        buildonly-randconfig-006-20250228    clang-19
loongarch             randconfig-001-20250228    gcc-14.2.0
loongarch             randconfig-002-20250228    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250228    gcc-14.2.0
nios2                 randconfig-002-20250228    gcc-14.2.0
parisc                randconfig-001-20250228    gcc-14.2.0
parisc                randconfig-002-20250228    gcc-14.2.0
powerpc               randconfig-001-20250228    gcc-14.2.0
powerpc               randconfig-002-20250228    clang-16
powerpc               randconfig-003-20250228    clang-18
powerpc64             randconfig-001-20250228    clang-16
powerpc64             randconfig-002-20250228    clang-18
powerpc64             randconfig-003-20250228    gcc-14.2.0
riscv                 randconfig-001-20250228    gcc-14.2.0
riscv                 randconfig-002-20250228    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250228    gcc-14.2.0
s390                  randconfig-002-20250228    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250228    gcc-14.2.0
sh                    randconfig-002-20250228    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250228    gcc-14.2.0
sparc                 randconfig-002-20250228    gcc-14.2.0
sparc64               randconfig-001-20250228    gcc-14.2.0
sparc64               randconfig-002-20250228    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250228    clang-21
um                    randconfig-002-20250228    clang-21
x86_64      buildonly-randconfig-001-20250228    clang-19
x86_64      buildonly-randconfig-002-20250228    clang-19
x86_64      buildonly-randconfig-003-20250228    gcc-12
x86_64      buildonly-randconfig-004-20250228    clang-19
x86_64      buildonly-randconfig-005-20250228    gcc-12
x86_64      buildonly-randconfig-006-20250228    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250228    gcc-14.2.0
xtensa                randconfig-002-20250228    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

