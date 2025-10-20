Return-Path: <linux-gpio+bounces-27331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE29BF3F69
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 00:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4D36188E63E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 22:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1A5334372;
	Mon, 20 Oct 2025 22:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpYR8Liw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A714F333437
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 22:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761000631; cv=none; b=geLLUvjc7nf/z3KDMMp1SB0iIRIdr/XCMz1MdUeCACP0xRDK7vgwZc+plTb6EJaSPG3O39c/bs1bcMkf6tmTV39+ttY0fXxTq7EblbVyY/k38DM3YJhNKDcN5bSsHAv/tSd0GQqC+mHxoE4/0At7DKVta6exi72ePgBAAktOUeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761000631; c=relaxed/simple;
	bh=7LiWqmi+Wvbg0+7/0oucdvaIXEeMsHdELKt4VnGvRwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t1x0kZpaX22hR0uOAb9SRFaetUO1QP5lEgqZnU8g3JpUPg9coNaKh7ATeh1MVHedHmovoGxx6cL9FuqpR0rSZGbcnOR2WcRBAgjRB7P7G1Pya/h/r9TBp7zqBDI0r2y5+02+6bmwaYAX5uNI8KuMOVyXxCtxx+jHygLbDRD+k8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpYR8Liw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761000629; x=1792536629;
  h=date:from:to:cc:subject:message-id;
  bh=7LiWqmi+Wvbg0+7/0oucdvaIXEeMsHdELKt4VnGvRwc=;
  b=fpYR8LiwRHbGRC+7UVvUrGhJq01MTR2QaBpYMOp11rR07ox56LQSZ2R/
   /eHN21OaPKeqqzFf1c/axUWq3pNRNytLtVH5Um7otlfX8Y+/U2tInab2C
   /GQARZ16W2CJzCtUE6FknO/Bx6kzkvXT+zQ/AV9BiX5zSrf/HceXTWk2G
   1S3U98tiOmTAmHjZj+SibaFwiCdfSgmeOFOIOIlCMV2kXoyCJW6FEGIil
   d6urNuDzVHqUCKT+EkMthT6XwyfOgVOXKgibKCJ9ZZU3Y+PFXqRrwJGvM
   F4yIf5+6ePMnFHkkHfQKpD6juWMPNeSMoN6itU6j+gFq5RRkFkd8VGhJz
   Q==;
X-CSE-ConnectionGUID: sI+KqhcCSYucUOt9TnzJvQ==
X-CSE-MsgGUID: dlyIqR6PSPq13ycSug00ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80563890"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="80563890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 15:50:29 -0700
X-CSE-ConnectionGUID: 7rtlHwTKTdKNW9e2lroUOA==
X-CSE-MsgGUID: q2lblwLYQbCzcJvdx+barg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="184216738"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2025 15:50:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAyhE-000AEX-0O;
	Mon, 20 Oct 2025 22:49:54 +0000
Date: Tue, 21 Oct 2025 06:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 eb7f1c8415bbbb81f8674a490a5da7c22599a012
Message-ID: <202510210638.ajd5oeqh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: eb7f1c8415bbbb81f8674a490a5da7c22599a012  gpio: mvebu: Slightly optimize mvebu_gpio_irq_handler()

elapsed time: 776m

configs tested: 111
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251020    gcc-14.3.0
arc                   randconfig-002-20251020    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20251020    gcc-14.3.0
arm                   randconfig-002-20251020    clang-22
arm                   randconfig-003-20251020    clang-22
arm                   randconfig-004-20251020    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251020    clang-22
arm64                 randconfig-002-20251020    gcc-12.5.0
arm64                 randconfig-003-20251020    gcc-8.5.0
arm64                 randconfig-004-20251020    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251020    gcc-15.1.0
csky                  randconfig-002-20251020    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251020    clang-22
hexagon               randconfig-002-20251020    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251020    gcc-14
i386        buildonly-randconfig-002-20251020    clang-20
i386        buildonly-randconfig-003-20251020    gcc-14
i386        buildonly-randconfig-004-20251020    gcc-14
i386        buildonly-randconfig-005-20251020    clang-20
i386        buildonly-randconfig-006-20251020    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251020    gcc-15.1.0
loongarch             randconfig-002-20251020    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251020    gcc-10.5.0
nios2                 randconfig-002-20251020    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251020    gcc-13.4.0
parisc                randconfig-002-20251020    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251020    clang-22
powerpc               randconfig-002-20251020    gcc-8.5.0
powerpc               randconfig-003-20251020    clang-22
powerpc64             randconfig-001-20251020    clang-19
powerpc64             randconfig-002-20251020    gcc-11.5.0
powerpc64             randconfig-003-20251020    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251020    gcc-13.4.0
riscv                 randconfig-002-20251020    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251020    gcc-11.5.0
s390                  randconfig-002-20251020    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20251020    gcc-15.1.0
sh                    randconfig-002-20251020    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251020    gcc-8.5.0
sparc                 randconfig-002-20251020    gcc-8.5.0
sparc64               randconfig-001-20251020    gcc-10.5.0
sparc64               randconfig-002-20251020    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251020    clang-22
um                    randconfig-002-20251020    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251020    gcc-14
x86_64      buildonly-randconfig-002-20251020    clang-20
x86_64      buildonly-randconfig-003-20251020    gcc-14
x86_64      buildonly-randconfig-004-20251020    gcc-14
x86_64      buildonly-randconfig-005-20251020    gcc-14
x86_64      buildonly-randconfig-006-20251020    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251020    gcc-8.5.0
xtensa                randconfig-002-20251020    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

