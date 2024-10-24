Return-Path: <linux-gpio+bounces-11896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F19ADAFE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 06:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 921AF1C20EA8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 04:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86ED16D9AF;
	Thu, 24 Oct 2024 04:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JL8ofOTS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1334316130C
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 04:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729744898; cv=none; b=FhOCg7CtwpUTUX28L0n79laceYGlHx6Tu5HNaVPirI91Fa+gx2YjW47HdLvxGrNMlxLqwUd/LK6uBg7ciwjMPKBrUFOiyugpVv1a63JKJUCSmr41h1xRH599noMJe+RbbOI9KZBT5jOFwkmFZ9Xc0MbiTX6EKUwlvmBGO+8+Wf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729744898; c=relaxed/simple;
	bh=4GgSsX7VTEjO97XHEvBXnAHkJ5zD6LXqjplCQujdRgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fdzKA9Xih0xbf6J59auIu3lkGxD6HmUQ2A39I7oXDI9LuOd2chEt8cmQglONp9iv0y/cGljeGzcq2U/U855kh3b1T0XtSWr3VngoPhMf3tpr0SDPy7sCZ+ZV70cNn845HGQJ24cqzeCcJkCmj+ZBkpIOhvQN7ZAaeGX76iQ+iTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JL8ofOTS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729744896; x=1761280896;
  h=date:from:to:cc:subject:message-id;
  bh=4GgSsX7VTEjO97XHEvBXnAHkJ5zD6LXqjplCQujdRgE=;
  b=JL8ofOTSOhogRmoojDTR7haZq+z/n89covAe8RkKumQLkBprG+n1FoRK
   LSpT/mUpvaV29WLuVviisjHg9hL/UIIFhUjsvnz+yEmeKUehnBxrAga3e
   n+duGVQdDh0V3ojkntoSgMSbqRb2zKbcKgi2otwkZqMdjoaUMtpG9+fSr
   uy/pTK0UedC4J6LA2Q9Q4Pwt6yV/KoFLhM5Lb6tqjv1d0LzyRVJfVGpGv
   s3WaHrynQ2KBlqbwpcx6BKKZe3oy9W0egIptgQ13Mlu0lKOjiI4K6bhHk
   hCJTx57WAvs6rG5AlSihvvUH7DhyO31acsGomM0ClGPF4oFdgkAKInrFI
   Q==;
X-CSE-ConnectionGUID: yP56xwtJQ9Wv5RQdoXIwnw==
X-CSE-MsgGUID: QMZVmBgjSeCSbnpWVKufsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40725256"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="40725256"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 21:41:35 -0700
X-CSE-ConnectionGUID: mInkJbQQRs++qAqPeMzGkA==
X-CSE-MsgGUID: OqeQAK82RGWDgPBjjmp7dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85255401"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Oct 2024 21:41:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3pfA-000Vwi-01;
	Thu, 24 Oct 2024 04:41:32 +0000
Date: Thu, 24 Oct 2024 12:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 6bb3021d8773d147dc462fd8c864f08744ae2a87
Message-ID: <202410241242.NjejsT08-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 6bb3021d8773d147dc462fd8c864f08744ae2a87  Merge fixup

elapsed time: 1091m

configs tested: 98
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
openrisc                         allyesconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
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

