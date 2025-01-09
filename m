Return-Path: <linux-gpio+bounces-14624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1EA0836C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 00:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA1D83A18A4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 23:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88CB2054FD;
	Thu,  9 Jan 2025 23:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j69m3iGt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34AD205E25
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jan 2025 23:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736465107; cv=none; b=e+5hhgiE4+ZWQQQ9YO3fg7k9f7HpPpj+J9eK+F05jKz7KqtMoEAVe86BFy7LIt1IYviMoW7auxqqGbZU6usnNjEHwJXJSPJxskFXTF8nHlicZlWeHxFXenkOqG4bL5eX1Zj48PNwXUgk038JiUf/LtWN6wmnlGmZiGST9uh++Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736465107; c=relaxed/simple;
	bh=9USp+/GVWiME+9rac+gvQLpZ0bGgq/KSdhN0UWiXDtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WfimDo6gtOIfbuclKVcL8Up74xMzGTVZfKDsS6IkuFkrmm9yBW+vUBmrfM189tyNuSA7iT22LtnKW6ctjHGTRMdnxVAVUa/LxP2pYgpTm2ErxSehvPo9synCqWrbWHsZgBkyun91PUAvHDDx9SGWu2gLtXW2aOOyYCtKSjlA8kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j69m3iGt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736465106; x=1768001106;
  h=date:from:to:cc:subject:message-id;
  bh=9USp+/GVWiME+9rac+gvQLpZ0bGgq/KSdhN0UWiXDtk=;
  b=j69m3iGt0zCFqbNcdsg2HcwZzIrdBkHUmSR0V1uXheuAKrGDkSkCzVK0
   87q8F9OvKkeIcOF/mtuRMtGy9P9nKheqFMBLzATsQ1+RRubU6Y8I+YdCC
   QDAFuTRagoNDL1i1f1zBH9YuapfVSCzPb4jAEGbbFCTAh3RjVnSkr8Sj5
   9aizZH5dvpSdUJ77xCjekpT6W0E+BQ0O9dmB06kCROxIDUA8+sZtCdmaJ
   5E82nHj5j8hZI6eUPpg9wFM05FFMdjHeRSO1nqom0ATwNIYXy/Ot51R1n
   JV338BmnIBCJlOP5RE8/9Rd6cV2HEJR/SDsJvZU9gY5RjRcNjV0fwUOpG
   g==;
X-CSE-ConnectionGUID: MP13szeRQHOf8nV4akSmtg==
X-CSE-MsgGUID: pBWmF2vrTpCj1UVLpDG5KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="35969730"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="35969730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 15:25:04 -0800
X-CSE-ConnectionGUID: WQvgf+bURO6paaLNVVQKZQ==
X-CSE-MsgGUID: vkwSm9g9SX+W59SgkBjodg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126846209"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 15:25:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW1td-000IH9-1T;
	Thu, 09 Jan 2025 23:25:01 +0000
Date: Fri, 10 Jan 2025 07:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 0e18b099672160698dfbd7c3c82e03e011c907e6
Message-ID: <202501100714.p6cK7F4v-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 0e18b099672160698dfbd7c3c82e03e011c907e6  pinctrl: mediatek: Drop mtk_pinconf_bias_set_pd()

elapsed time: 1455m

configs tested: 76
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                              allnoconfig    gcc-13.2.0
arc                  randconfig-001-20250109    gcc-13.2.0
arc                  randconfig-002-20250109    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                  randconfig-001-20250109    gcc-14.2.0
arm                  randconfig-002-20250109    clang-17
arm                  randconfig-003-20250109    clang-20
arm                  randconfig-004-20250109    gcc-14.2.0
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250109    gcc-14.2.0
arm64                randconfig-002-20250109    clang-20
arm64                randconfig-003-20250109    gcc-14.2.0
arm64                randconfig-004-20250109    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250109    gcc-14.2.0
csky                 randconfig-002-20250109    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20250109    clang-14
hexagon              randconfig-002-20250109    clang-20
i386       buildonly-randconfig-001-20250109    gcc-12
i386       buildonly-randconfig-002-20250109    gcc-12
i386       buildonly-randconfig-003-20250109    clang-19
i386       buildonly-randconfig-004-20250109    clang-19
i386       buildonly-randconfig-005-20250109    clang-19
i386       buildonly-randconfig-006-20250109    gcc-12
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250109    gcc-14.2.0
loongarch            randconfig-002-20250109    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
nios2                randconfig-001-20250109    gcc-14.2.0
nios2                randconfig-002-20250109    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250109    gcc-14.2.0
parisc               randconfig-002-20250109    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-16
powerpc              randconfig-001-20250109    clang-15
powerpc              randconfig-002-20250109    gcc-14.2.0
powerpc              randconfig-003-20250109    gcc-14.2.0
powerpc64            randconfig-001-20250109    gcc-14.2.0
powerpc64            randconfig-002-20250109    clang-20
powerpc64            randconfig-003-20250109    clang-17
riscv                           allmodconfig    clang-20
riscv                           allyesconfig    clang-20
riscv                randconfig-001-20250109    gcc-14.2.0
riscv                randconfig-002-20250109    clang-15
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250109    gcc-14.2.0
s390                 randconfig-002-20250109    clang-16
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250109    gcc-14.2.0
sh                   randconfig-002-20250109    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250109    gcc-14.2.0
sparc                randconfig-002-20250109    gcc-14.2.0
sparc64              randconfig-001-20250109    gcc-14.2.0
sparc64              randconfig-002-20250109    gcc-14.2.0
um                   randconfig-001-20250109    gcc-12
um                   randconfig-002-20250109    gcc-12
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250109    clang-19
x86_64     buildonly-randconfig-002-20250109    gcc-12
x86_64     buildonly-randconfig-003-20250109    clang-19
x86_64     buildonly-randconfig-004-20250109    clang-19
x86_64     buildonly-randconfig-005-20250109    clang-19
x86_64     buildonly-randconfig-006-20250109    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250109    gcc-14.2.0
xtensa               randconfig-002-20250109    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

