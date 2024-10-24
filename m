Return-Path: <linux-gpio+bounces-11898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E759ADB12
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 06:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F7C1F223E4
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 04:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D0316DC36;
	Thu, 24 Oct 2024 04:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/PHj4Me"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21016D9AF
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 04:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729744958; cv=none; b=UVtfUGutlWwJdqc3uRfUgxyN9F+f5K9UDY5b6g5ODcq+PK+IhlP2DkAKCUMXQkvizyZKnZio9Q52LMcwQMZq8BnjUnAAgxJLm5JoQYVNucucIW+MGumVIjzf6YhW0MmT8rgjWqSwodM3szhz1tVL/cZbfiKdks4CaRZQTDoBiCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729744958; c=relaxed/simple;
	bh=xhYjX03aSTJpdA2cdUZkDgJoM6BtehRP7ah67bwf9pY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uyWHYJPXfQN7paWvfHoGXHXhiqSKF2mV/V+RqqKAe9WbPzXj/yBRCTJW4A4r/tOCRd7/aHOvTXCB01kCsUJ56OHgQjYaD99b4Ym4TUHOiv0xyCj7BZ4G8nUG4mt98XZmcS9IfF3JUi2ZkZWTqWgfPzfe7qiqxqrFDmsdHG3dZwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/PHj4Me; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729744956; x=1761280956;
  h=date:from:to:cc:subject:message-id;
  bh=xhYjX03aSTJpdA2cdUZkDgJoM6BtehRP7ah67bwf9pY=;
  b=X/PHj4MerEZruIQHo19a//weS+FV5KJZ9FzhKD5VO/FrBFPjePa4voVI
   tStYH7CFc5QNGnPfDwkq6FnVuQ2rwGoBTJSyjWd2UMeJQ0sO+GUuVV641
   2bnF/DVHKcLLjqJuiL78HuVh4saQezGV0xJpBu8Wr5ar5XwC+wTyfFwkC
   Wbxi1H/LRr4BMObHO/QOmsqqzs/wuFhKclJMLzcZxYPTYudpOFcwtIN/e
   05eqNbScXefJMVzkMGK3lmNrOL+ImWMEtkpZfVHKSbhUDWehwCXDksAYb
   9YQwHH7kxRIJjOoHTl6R1RxxLMEyrHeetKeyas5LaJ5TaOIpKcz1+7/eg
   w==;
X-CSE-ConnectionGUID: h/UIFk2BSm26K2zrdqUa2g==
X-CSE-MsgGUID: neH73esRRgavseVoZy8GRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29469428"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="29469428"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 21:42:35 -0700
X-CSE-ConnectionGUID: URV0G1ZNR8mhdPmMuRG3YA==
X-CSE-MsgGUID: k/vRNYY2SNysRcB9KeA3nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80392699"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2024 21:42:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3pg8-000Vwo-0D;
	Thu, 24 Oct 2024 04:42:32 +0000
Date: Thu, 24 Oct 2024 12:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 5a3e85c3c397c781393ea5fb2f45b1f60f8a4e6e
Message-ID: <202410241237.fJMexkhH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 5a3e85c3c397c781393ea5fb2f45b1f60f8a4e6e  pinmux: Use sequential access to access desc->pinmux data

elapsed time: 1092m

configs tested: 103
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        spear3xx_defconfig    gcc-14.1.0
arm                           stm32_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                             alldefconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241024    clang-18
i386        buildonly-randconfig-002-20241024    clang-18
i386        buildonly-randconfig-003-20241024    clang-18
i386        buildonly-randconfig-004-20241024    clang-18
i386        buildonly-randconfig-005-20241024    clang-18
i386        buildonly-randconfig-006-20241024    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241024    clang-18
i386                  randconfig-002-20241024    clang-18
i386                  randconfig-003-20241024    clang-18
i386                  randconfig-004-20241024    clang-18
i386                  randconfig-005-20241024    clang-18
i386                  randconfig-006-20241024    clang-18
i386                  randconfig-011-20241024    clang-18
i386                  randconfig-012-20241024    clang-18
i386                  randconfig-013-20241024    clang-18
i386                  randconfig-014-20241024    clang-18
i386                  randconfig-015-20241024    clang-18
i386                  randconfig-016-20241024    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                        m5272c3_defconfig    gcc-14.1.0
m68k                       m5275evb_defconfig    gcc-14.1.0
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                        edosk7760_defconfig    gcc-14.1.0
sh                           se7712_defconfig    gcc-14.1.0
sh                           se7751_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

