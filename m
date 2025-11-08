Return-Path: <linux-gpio+bounces-28264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6D1C432F5
	for <lists+linux-gpio@lfdr.de>; Sat, 08 Nov 2025 19:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B5D04E1CF8
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Nov 2025 18:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5D5258EF6;
	Sat,  8 Nov 2025 18:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCWXQdby"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF998244687
	for <linux-gpio@vger.kernel.org>; Sat,  8 Nov 2025 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762625493; cv=none; b=NWUQ/5hKAt3raA1T7IVXFZ7TxWBZvJpMf4FmAk6GsaJ7+mFmn9tRf7363elyU8BOVvdM55A42v/0ZPgISHhAdKEtmyZEMrrT03rqON1rT5Su5xLKOamn889v+PRxIGaowVAWqdcgTRixnOnypKNKWvp+J5Sdty8g3inXFGufPfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762625493; c=relaxed/simple;
	bh=JT4E4MEFU83/3mKrCnilbHwCAWUTtHFX55YzJLTObfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=edC3HlKjJN2DG1rwSb+62zE+kMHimn+FFJUHW2se75ZWq8o8y3AUPnRjJOjHc52/DASSpeNUXUfMOa4WpuNshY94jhZshRnFsfQZmUnVQ7hIIoBvRPhkUFyY0rJatzwE4iWoEDMMJpwiTcQcrfkad7rzqxuqT7PHobxZXynB5NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCWXQdby; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762625492; x=1794161492;
  h=date:from:to:cc:subject:message-id;
  bh=JT4E4MEFU83/3mKrCnilbHwCAWUTtHFX55YzJLTObfc=;
  b=LCWXQdbyWfFogBCueomIxL/hY5S0mFP1Th2W7onZtISbubgC3ozimfqg
   vi6z/N0cqiUwgDhuNw7Fjy78jcRm2uMC70ThGHkRlYxsRm6zFvY0ccgWb
   TADAg+FGrPYAzgvVAieh6LvtjxfXRAzeWuU9/oacHAKUnZFcZjyQiS+yZ
   MzVpA8geOeZEoPS0Kung+eYkm/3VECR8WnZGD1D8WHJf2bt3eRwbMmA3q
   8n9ppqSu6yZglRorKWeueCDTZ2hu+dNmi95nZwlbWo5XLn2Gwvmp3imkh
   9svbJzWfRotofz0QCCAe+YPJqlzjXZJ/pkCeGj4BZB8RKK1Ki2lcK0QHP
   g==;
X-CSE-ConnectionGUID: rJdJYxHaRQyMdVA9jB5umw==
X-CSE-MsgGUID: hE4zfMmoT56yVgOz7KezGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="76191163"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="76191163"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 10:11:32 -0800
X-CSE-ConnectionGUID: W0fLC1TMRlyqI5gQzHG/Vg==
X-CSE-MsgGUID: Tg0fttwFQtmIRRKPko08Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="188752655"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Nov 2025 10:11:30 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHnPM-0001Jv-12;
	Sat, 08 Nov 2025 18:11:28 +0000
Date: Sun, 09 Nov 2025 02:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 4436f484cb437ba28dc58b7f787a6f80a65aa5c3
Message-ID: <202511090220.OCCBiIYl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 4436f484cb437ba28dc58b7f787a6f80a65aa5c3  gpio: tb10x: Drop unused tb10x_set_bits() function

elapsed time: 2911m

configs tested: 78
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arm                    allmodconfig    gcc-15.1.0
arm                     allnoconfig    clang-22
arm                    allyesconfig    gcc-15.1.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.1.0
arm64                  allyesconfig    clang-22
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky                   allyesconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                allyesconfig    clang-22
hexagon     randconfig-001-20251107    clang-22
hexagon     randconfig-002-20251107    clang-22
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch              allyesconfig    clang-22
loongarch   randconfig-001-20251107    gcc-15.1.0
loongarch   randconfig-002-20251107    clang-19
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze             allmodconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2                  allyesconfig    gcc-11.5.0
nios2       randconfig-001-20251107    gcc-11.5.0
nios2       randconfig-002-20251107    gcc-8.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
openrisc               allyesconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc                allyesconfig    clang-22
riscv                  allmodconfig    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
riscv       randconfig-001-20251107    clang-22
riscv       randconfig-002-20251107    gcc-13.4.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251107    gcc-8.5.0
s390        randconfig-002-20251107    gcc-15.1.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh          randconfig-001-20251107    gcc-13.4.0
sh          randconfig-002-20251107    gcc-11.5.0
sparc                  allmodconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc                  allyesconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
sparc64                allyesconfig    gcc-15.1.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

