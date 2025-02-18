Return-Path: <linux-gpio+bounces-16175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E66C3A39243
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 06:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3973AFC71
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 05:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE99616A956;
	Tue, 18 Feb 2025 05:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbdZTsUE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A5ECF
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739854873; cv=none; b=rdd5gs+QE3Hli2/N8+7NL/IFF9FyAqR7tzPCLRH/jcgj+tsTpkPwnRj/01SnxhAcrNhcvjNj78EcGnPmB2UY9j47+qmMB2UdI/hXT1QHe3yTa31R+XWIfaesyixOdlMJQJtZITw1MlJRPF8TYn9sfZ8w8W2p85HTiLL1UbYjJu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739854873; c=relaxed/simple;
	bh=rOpWdbF759syS3lcoXjCZQ8Fs9Q0/p/X5JTS9twD3b0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YzH5j+Smw+lLxDf5TobGn7yJLKG+WNj6+tvWTQJbURugOf/QO1ZO3xDu2zr4toVQVm71GrFiDwAIVnLu6du5dmiE28FKXmgGnnwhvocoeljrnSEBce3LGFQ5Bhvf89DGLYInxlyukXRVVfbiMjNxoE8fiGSgfNd2SP+URNZwNuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbdZTsUE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739854871; x=1771390871;
  h=date:from:to:cc:subject:message-id;
  bh=rOpWdbF759syS3lcoXjCZQ8Fs9Q0/p/X5JTS9twD3b0=;
  b=mbdZTsUE4JXtTn4Id6gdBnfKtVDtLtNsbL/IXJ+02/2H5XakCki1dhiw
   XDx6YXFSOWat4hH5wjfXm/D+qwYjmbfarGmju+wTi81hV30rtlnUapMv8
   7vxhCP886tu50JfEADZ0Uu9fUMuW9/nOQ7PdlwvKg8eURMXl42Myujyh7
   X5rYMMFgUoLGIpu7vrDezyopzlwoEC8sEt06V8Dmjt/C6GQLrrH4tqfP/
   cC17fPVveNH+Wb49kMgrxohW42lAkfKxKr7J7f5DgyxUXGv9J+kJT6wgx
   zyJWOOZDXnjYFk2NBuzsRgIf32bxss33ubS4Kr86jlaS5FfKtHiiOF4jb
   g==;
X-CSE-ConnectionGUID: fIjnNJK+Q12kSkM6TzUFTQ==
X-CSE-MsgGUID: iHUSZGipQ1yAtQtsZ1Mpdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51521878"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="51521878"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:01:10 -0800
X-CSE-ConnectionGUID: eFvzC3w/SDaTLQGdV6KsPw==
X-CSE-MsgGUID: NEwSd3S+TJq3k9Y8ckOAjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="114149695"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Feb 2025 21:01:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkFjA-0000Bf-1d;
	Tue, 18 Feb 2025 05:01:02 +0000
Date: Tue, 18 Feb 2025 13:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 ba1d9787f890eea908b3c9e680c0055e44af21ee
Message-ID: <202502181321.9HJ8nF5O-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: ba1d9787f890eea908b3c9e680c0055e44af21ee  pinctrl: cy8c95x0: Fix comment style

elapsed time: 1276m

configs tested: 125
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20250217    gcc-13.2.0
arc                   randconfig-002-20250217    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250217    gcc-14.2.0
arm                   randconfig-002-20250217    gcc-14.2.0
arm                   randconfig-003-20250217    gcc-14.2.0
arm                   randconfig-004-20250217    clang-19
arm                           sama7_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250217    gcc-14.2.0
arm64                 randconfig-002-20250217    clang-21
arm64                 randconfig-003-20250217    clang-15
arm64                 randconfig-004-20250217    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250217    gcc-14.2.0
csky                  randconfig-002-20250217    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250217    clang-21
hexagon               randconfig-002-20250217    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250217    clang-19
i386        buildonly-randconfig-002-20250217    gcc-12
i386        buildonly-randconfig-003-20250217    clang-19
i386        buildonly-randconfig-004-20250217    gcc-12
i386        buildonly-randconfig-005-20250217    gcc-12
i386        buildonly-randconfig-006-20250217    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250217    gcc-14.2.0
loongarch             randconfig-002-20250217    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250217    gcc-14.2.0
nios2                 randconfig-002-20250217    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250217    gcc-14.2.0
parisc                randconfig-002-20250217    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       eiger_defconfig    clang-17
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250217    clang-17
powerpc               randconfig-002-20250217    clang-15
powerpc               randconfig-003-20250217    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250217    clang-19
powerpc64             randconfig-002-20250217    clang-21
powerpc64             randconfig-003-20250217    clang-15
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250217    gcc-14.2.0
riscv                 randconfig-002-20250217    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250217    gcc-14.2.0
s390                  randconfig-002-20250217    clang-18
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250217    gcc-14.2.0
sh                    randconfig-002-20250217    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250217    gcc-14.2.0
sparc                 randconfig-002-20250217    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250217    gcc-14.2.0
sparc64               randconfig-002-20250217    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250217    clang-19
um                    randconfig-002-20250217    clang-17
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250217    gcc-12
x86_64      buildonly-randconfig-002-20250217    clang-19
x86_64      buildonly-randconfig-003-20250217    clang-19
x86_64      buildonly-randconfig-004-20250217    gcc-12
x86_64      buildonly-randconfig-005-20250217    gcc-12
x86_64      buildonly-randconfig-006-20250217    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250217    gcc-14.2.0
xtensa                randconfig-002-20250217    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

