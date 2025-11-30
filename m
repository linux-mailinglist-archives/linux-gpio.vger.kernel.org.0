Return-Path: <linux-gpio+bounces-29189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E901CC94F88
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Nov 2025 13:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A563A1E5F
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Nov 2025 12:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFC9229B2A;
	Sun, 30 Nov 2025 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHqRZglS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C364FAD5A
	for <linux-gpio@vger.kernel.org>; Sun, 30 Nov 2025 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764506337; cv=none; b=qDpdk0u7CkUdmKjdIw7xqHZMTts1MKIwUkv6lW/BMBodbEO4Y87rqcWANHiDqynjBnDDKeFXLpO0wIV9DADLl92Yvp2Ijaf+9EHnv8PgW10ocpi/xiN8WUrV827LYKOntdKkdf20ESb1CyHA1TinTmV1edoAQ1xaJwTxd1sQA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764506337; c=relaxed/simple;
	bh=a7ycd8UzP4cWukTXcqyaBlT1pH5VDCc+mhBatCEomS4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e+OVp+Rsw2HiurSpFncr/suahz1P5NbtTAkuAVgV+RtdD5zs7mtgpH13rLI3+JVLtai/bwVj5r65PUCzWuMoW99/W3N5Gqz3c4YKmTkUFTNbnhCzcnrM5zmlfltoilOLRa220exH+OIdnNfe9tXYX/TJ9SEEaGvF/cpfOQAaxa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHqRZglS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764506336; x=1796042336;
  h=date:from:to:cc:subject:message-id;
  bh=a7ycd8UzP4cWukTXcqyaBlT1pH5VDCc+mhBatCEomS4=;
  b=jHqRZglSt4/tA8CLLe0hJ5/Jw3KedWewENk6d2mb0hrQy6NKtUVkOVUM
   Wk4l6N7BIQgyNGbkgRhCHH1k0Nw/iU1qWmGOgkLmCt4P7yaPyzohbioBR
   nrf0PhVb9PoiFVLDXTEYxmsQMb3ziEJWrZGQ33+tvkv48hjA9IXoXltTW
   9nqV3mqydCdz9SIf3Sk9AdtU6H8H5RDxPzjkZfmRZun9OeEoob0jTXBIu
   LDz/IZ8Oeqo5jtG+kr6LOAHjEMbBfAioz/IMIsWrBl+MNV0Mm+mJSw5WC
   sK+YNRSUlMGIuOTV0rh8G+XME4st9cbA543UmAI3vWyvHBGTGToyF5R9E
   w==;
X-CSE-ConnectionGUID: 1Lm77dJkTqSXkhLHNaCwtQ==
X-CSE-MsgGUID: DJqgpJdDTSyXo4HrIKYL+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66486536"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="66486536"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 04:38:55 -0800
X-CSE-ConnectionGUID: ZciCjRoBQhOuY+Z1EqK2uw==
X-CSE-MsgGUID: 7P90B7NMSnOOify1/TJJfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="224539428"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Nov 2025 04:38:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPghX-000000007xR-2pxV;
	Sun, 30 Nov 2025 12:38:51 +0000
Date: Sun, 30 Nov 2025 20:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 dae9750105cf93ac1e156ef91f4beeb53bd64777
Message-ID: <202511302021.xbAhpPot-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: dae9750105cf93ac1e156ef91f4beeb53bd64777  gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE

elapsed time: 2884m

configs tested: 65
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                     defconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                       defconfig    gcc-15.1.0
arc         randconfig-001-20251129    gcc-8.5.0
arc         randconfig-002-20251129    gcc-8.5.0
arm                     allnoconfig    clang-22
arm                       defconfig    clang-22
arm         randconfig-001-20251129    clang-20
arm         randconfig-002-20251129    gcc-10.5.0
arm         randconfig-003-20251129    gcc-13.4.0
arm         randconfig-004-20251129    gcc-8.5.0
arm64                   allnoconfig    gcc-15.1.0
arm64                     defconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                      defconfig    gcc-15.1.0
hexagon                 allnoconfig    clang-22
hexagon                   defconfig    clang-22
i386                    allnoconfig    gcc-14
i386                      defconfig    clang-20
i386        randconfig-011-20251129    clang-20
i386        randconfig-012-20251129    gcc-13
i386        randconfig-013-20251129    clang-20
i386        randconfig-014-20251129    clang-20
i386        randconfig-015-20251129    gcc-14
i386        randconfig-016-20251129    clang-20
i386        randconfig-017-20251129    gcc-14
loongarch               allnoconfig    clang-22
m68k                    allnoconfig    gcc-15.1.0
m68k              stmark2_defconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze                defconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    gcc-11.5.0
openrisc               alldefconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
openrisc                  defconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                    defconfig    gcc-15.1.0
parisc      randconfig-001-20251129    gcc-10.5.0
parisc      randconfig-002-20251129    gcc-13.4.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc            ep88xc_defconfig    gcc-15.1.0
powerpc              icon_defconfig    gcc-15.1.0
powerpc       mpc8315_rdb_defconfig    clang-22
powerpc       mpc837x_rdb_defconfig    gcc-15.1.0
powerpc           ppa8548_defconfig    gcc-15.1.0
powerpc     randconfig-001-20251129    gcc-8.5.0
powerpc     randconfig-002-20251129    clang-22
powerpc64   randconfig-001-20251129    gcc-8.5.0
powerpc64   randconfig-002-20251129    gcc-13.4.0
riscv                   allnoconfig    gcc-15.1.0
s390                    allnoconfig    clang-22
sh                      allnoconfig    gcc-15.1.0
sh                        defconfig    gcc-15.1.0
sh                  hp6xx_defconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
um                      allnoconfig    clang-22
um                        defconfig    clang-22
x86_64                  allnoconfig    clang-20
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

