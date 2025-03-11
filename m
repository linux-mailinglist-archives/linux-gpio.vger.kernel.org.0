Return-Path: <linux-gpio+bounces-17409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16980A5BA0C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 08:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54EA37A9514
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 07:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39F7222572;
	Tue, 11 Mar 2025 07:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKEqMpx3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A264222569
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741678597; cv=none; b=d6t7YlmDuN8xT8+HC9B2yKcwCdhw24rwvBeErjtxQzc/lYabtEFD9GV4EMDRBV78TTDMW86mElvlmJWHvZsJjSD2h2auvB4aK3HBGWl8qaHPVS57Qbo1iZPhSyMS1K6f6SbVzRD98WJmhJ4YqCXgGMgqkms+MpiYpTuuhdxlfAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741678597; c=relaxed/simple;
	bh=XWDkZFl7ICFNeAIHSGCOy3nBb2IrSKZdO7+at1sq+9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qbLXP2vvYjirTXpZlEdjAtD5tkngpsMF+cBv7S13kotj3qmpI+6QqhApmskV69BfQupz+3Vg7QYP1k9g5m0hY7G2z/3pGO5DEe+3u89xHv+xei/a1C+zOl9/s9lfJcCJevn9P1sBhABLcaElm5598IYObcARhl0fr+SSs4wK/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKEqMpx3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741678596; x=1773214596;
  h=date:from:to:cc:subject:message-id;
  bh=XWDkZFl7ICFNeAIHSGCOy3nBb2IrSKZdO7+at1sq+9E=;
  b=kKEqMpx3DifI09BytXFlHPWQcE1LB07+FIaqFXnoFeGj8a8/smPJfpkt
   qN04InzVGWtMxd3LEguVkWOBIL4+f6pYJYUfgrWtEWB0RwaO008rOkm+I
   17zNMB46NKgknPRYgb4CjOVxSJQLczpLfa1ULnkmAvDP716wV03xijbaa
   cIYply9rgl6JcwMUaPBAKz48qaWhZqxIXP/B5A17yZ7Jf/OB30otBh80c
   ABW2/P0CNi33dUr4Oz5CWU5IzWU35LfAwZ7QoGDeBIPoGqrZqk4IG36Sy
   /lmKEdkvNvyKPHyL/mSDfWTwZFXQmlK3uNp5rMfa85Ttilkoaft+NxSux
   A==;
X-CSE-ConnectionGUID: FxBSDP97T8WbNE+QoPgnMw==
X-CSE-MsgGUID: /l5e3FSYSKmIMeKe+m6IVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="68063275"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="68063275"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 00:36:28 -0700
X-CSE-ConnectionGUID: /lzM0juBTjWV/eTKssbajQ==
X-CSE-MsgGUID: Czh6Z6apTsWDcXFBWilI6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="119967643"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Mar 2025 00:36:26 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1truA3-0006SW-34;
	Tue, 11 Mar 2025 07:36:23 +0000
Date: Tue, 11 Mar 2025 15:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 21c853ad93097619c7966542e838c54c37f57c90
Message-ID: <202503111550.kZ2vCDdz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 21c853ad93097619c7966542e838c54c37f57c90  gpio: adnp: use new line value setter callbacks

elapsed time: 1194m

configs tested: 175
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250310    gcc-13.2.0
arc                   randconfig-002-20250310    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250310    clang-21
arm                   randconfig-002-20250310    gcc-14.2.0
arm                   randconfig-003-20250310    gcc-14.2.0
arm                   randconfig-004-20250310    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250310    clang-19
arm64                 randconfig-002-20250310    clang-17
arm64                 randconfig-003-20250310    clang-15
arm64                 randconfig-004-20250310    clang-17
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250310    gcc-14.2.0
csky                  randconfig-002-20250310    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250310    clang-21
hexagon               randconfig-002-20250310    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250310    clang-19
i386        buildonly-randconfig-001-20250311    clang-19
i386        buildonly-randconfig-002-20250310    clang-19
i386        buildonly-randconfig-002-20250311    clang-19
i386        buildonly-randconfig-003-20250310    clang-19
i386        buildonly-randconfig-003-20250311    clang-19
i386        buildonly-randconfig-004-20250310    clang-19
i386        buildonly-randconfig-004-20250311    clang-19
i386        buildonly-randconfig-005-20250310    clang-19
i386        buildonly-randconfig-005-20250311    clang-19
i386        buildonly-randconfig-006-20250310    clang-19
i386        buildonly-randconfig-006-20250311    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250311    gcc-12
i386                  randconfig-002-20250311    gcc-12
i386                  randconfig-003-20250311    gcc-12
i386                  randconfig-004-20250311    gcc-12
i386                  randconfig-005-20250311    gcc-12
i386                  randconfig-006-20250311    gcc-12
i386                  randconfig-007-20250311    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250310    gcc-14.2.0
loongarch             randconfig-002-20250310    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250310    gcc-14.2.0
nios2                 randconfig-002-20250310    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250310    gcc-14.2.0
parisc                randconfig-002-20250310    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250310    clang-17
powerpc               randconfig-002-20250310    clang-21
powerpc               randconfig-003-20250310    clang-17
powerpc64             randconfig-001-20250310    gcc-14.2.0
powerpc64             randconfig-002-20250310    gcc-14.2.0
powerpc64             randconfig-003-20250310    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250310    clang-19
riscv                 randconfig-001-20250311    gcc-14.2.0
riscv                 randconfig-002-20250310    gcc-14.2.0
riscv                 randconfig-002-20250311    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250310    gcc-14.2.0
s390                  randconfig-001-20250311    gcc-14.2.0
s390                  randconfig-002-20250310    clang-18
s390                  randconfig-002-20250311    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250310    gcc-14.2.0
sh                    randconfig-001-20250311    gcc-14.2.0
sh                    randconfig-002-20250310    gcc-14.2.0
sh                    randconfig-002-20250311    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250310    gcc-14.2.0
sparc                 randconfig-001-20250311    gcc-14.2.0
sparc                 randconfig-002-20250310    gcc-14.2.0
sparc                 randconfig-002-20250311    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250310    gcc-14.2.0
sparc64               randconfig-001-20250311    gcc-14.2.0
sparc64               randconfig-002-20250310    gcc-14.2.0
sparc64               randconfig-002-20250311    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                                allnoconfig    clang-18
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250310    gcc-12
um                    randconfig-001-20250311    gcc-14.2.0
um                    randconfig-002-20250310    clang-17
um                    randconfig-002-20250311    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250310    gcc-12
x86_64      buildonly-randconfig-001-20250311    clang-19
x86_64      buildonly-randconfig-002-20250310    clang-19
x86_64      buildonly-randconfig-002-20250311    clang-19
x86_64      buildonly-randconfig-003-20250310    clang-19
x86_64      buildonly-randconfig-003-20250311    clang-19
x86_64      buildonly-randconfig-004-20250310    clang-19
x86_64      buildonly-randconfig-004-20250311    clang-19
x86_64      buildonly-randconfig-005-20250310    clang-19
x86_64      buildonly-randconfig-005-20250311    clang-19
x86_64      buildonly-randconfig-006-20250310    gcc-12
x86_64      buildonly-randconfig-006-20250311    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250311    clang-19
x86_64                randconfig-072-20250311    clang-19
x86_64                randconfig-073-20250311    clang-19
x86_64                randconfig-074-20250311    clang-19
x86_64                randconfig-075-20250311    clang-19
x86_64                randconfig-076-20250311    clang-19
x86_64                randconfig-077-20250311    clang-19
x86_64                randconfig-078-20250311    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250310    gcc-14.2.0
xtensa                randconfig-001-20250311    gcc-14.2.0
xtensa                randconfig-002-20250310    gcc-14.2.0
xtensa                randconfig-002-20250311    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

