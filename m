Return-Path: <linux-gpio+bounces-20230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62CAB8C4F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 18:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE08D7AAB6C
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 16:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3379A220F36;
	Thu, 15 May 2025 16:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlN2tOk+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B790921CC70
	for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326364; cv=none; b=Bqt6Pd1JOAzJAS9McrO63lYBuAFrb2Cjjc2YEulNrtWNny/ShU5Ku+R6wL9zdgT6/x0ZrbIQYX0qfGqpACJpCeJbgIB1UomlgsalJAvv6sXU0GHVH1H0MI/lrN+qsP52Qqzb1VHStshJjawH4cTeCj64vUayonbxuHygZ8BwM7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326364; c=relaxed/simple;
	bh=pTiA0DzkOCfFjIOjUjfvMUb+gM+6+sdSLHFP05FhHCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TvVuRMKKK7IvGnA/05JuDM/U1ey07iB/vTdDVkqAOOamQG538msEUvRpmnlOwoyCU3NvGseB1ZeZdu+4rnOsp7GmK247wGW4i2AZdzs0Bf3S0SQkwzyPmS1rUY10a5H86CDUkzElxNH+1Mgjxu2ncPVw/XgKoL5Z2JhIM8b7n8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlN2tOk+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747326362; x=1778862362;
  h=date:from:to:cc:subject:message-id;
  bh=pTiA0DzkOCfFjIOjUjfvMUb+gM+6+sdSLHFP05FhHCU=;
  b=jlN2tOk+5JKpVlGt+w9gu00rszylkgftdwdz8seZ5ThVnKHyKsxniyBU
   Q8Bkq6HNaWT1NJcCpdqK2UVPmxEOkjFoSLWw7ZAO73rjiVTn9QiIzEDWO
   NJ1X83r7iQzfHdAqmbb83zyPkBOclb5wwRR5q/IC0Nq3kei53N+HtDkWd
   uFSO9KptBGhioEzmeTWY6bP4hzLyUhlPb30oTgvfwP8q0/8b+I4LMY8J2
   X+8lHdTdQcULmDvfjLwXilpRG9jzMDUFhyrED5FRhn+eckm2VXDdVvnpj
   3lMta0XK94XAKFp2ql8A5eZfr0EnVLAvwM8pS9jvGMSd7nTlSRRJx2p8C
   Q==;
X-CSE-ConnectionGUID: 28ILF27bTjSM6Q3PSXE3tA==
X-CSE-MsgGUID: S4c/pU5RRjqkpKrF55awmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49411299"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="49411299"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 09:26:01 -0700
X-CSE-ConnectionGUID: LQ3/YssEQiCRHqEw/Ay3xw==
X-CSE-MsgGUID: b9zWyOE1TeqeEueLMOO4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143311315"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2025 09:26:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFbPC-000IYd-0N;
	Thu, 15 May 2025 16:25:58 +0000
Date: Fri, 16 May 2025 00:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:davinci/for-next] BUILD SUCCESS
 55da73fa7a68ccbe23c94ecc070d2ee0013f4fbd
Message-ID: <202505160002.ZckF5aAd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git davinci/for-next
branch HEAD: 55da73fa7a68ccbe23c94ecc070d2ee0013f4fbd  ARM: dts: davinci: da850-evm: Increase fifo threshold

elapsed time: 1449m

configs tested: 64
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                             alldefconfig    gcc-14.2.0
arc                              allnoconfig    gcc-14.2.0
arc                  randconfig-001-20250515    gcc-6.5.0
arc                  randconfig-002-20250515    gcc-6.5.0
arm                              allnoconfig    clang-21
arm                              allnoconfig    gcc-14.2.0
arm                  randconfig-001-20250515    clang-21
arm                  randconfig-001-20250515    gcc-6.5.0
arm                  randconfig-002-20250515    gcc-6.5.0
arm                  randconfig-002-20250515    gcc-8.5.0
arm                  randconfig-003-20250515    gcc-6.5.0
arm                  randconfig-003-20250515    gcc-8.5.0
arm                  randconfig-004-20250515    clang-21
arm                  randconfig-004-20250515    gcc-6.5.0
arm                        vf610m4_defconfig    gcc-14.2.0
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250515    gcc-6.5.0
arm64                randconfig-002-20250515    gcc-6.5.0
arm64                randconfig-003-20250515    gcc-6.5.0
arm64                randconfig-004-20250515    gcc-6.5.0
csky                             allnoconfig    gcc-14.2.0
hexagon                          allnoconfig    gcc-14.2.0
i386       buildonly-randconfig-001-20250515    gcc-11
i386       buildonly-randconfig-002-20250515    gcc-11
i386       buildonly-randconfig-003-20250515    gcc-11
i386       buildonly-randconfig-004-20250515    gcc-11
i386       buildonly-randconfig-005-20250515    gcc-11
i386       buildonly-randconfig-006-20250515    gcc-11
i386                 randconfig-011-20250515    gcc-12
i386                 randconfig-012-20250515    gcc-12
i386                 randconfig-013-20250515    gcc-12
i386                 randconfig-014-20250515    gcc-12
i386                 randconfig-015-20250515    gcc-12
i386                 randconfig-016-20250515    gcc-12
i386                 randconfig-017-20250515    gcc-12
loongarch                        allnoconfig    gcc-14.2.0
m68k                        amcore_defconfig    gcc-14.2.0
mips                  sb1250_swarm_defconfig    gcc-14.2.0
openrisc                         allnoconfig    clang-21
openrisc                simple_smp_defconfig    gcc-14.2.0
parisc                           allnoconfig    clang-21
powerpc                   adder875_defconfig    gcc-14.2.0
powerpc                          allnoconfig    clang-21
riscv                            allnoconfig    clang-21
riscv                randconfig-001-20250515    gcc-9.3.0
riscv                randconfig-002-20250515    gcc-9.3.0
s390                             allnoconfig    clang-21
s390                 randconfig-001-20250515    gcc-9.3.0
s390                 randconfig-002-20250515    gcc-9.3.0
sh                       apsh4ad0a_defconfig    gcc-14.2.0
sh                   randconfig-001-20250515    gcc-9.3.0
sh                   randconfig-002-20250515    gcc-9.3.0
sparc                randconfig-001-20250515    gcc-9.3.0
sparc                randconfig-002-20250515    gcc-9.3.0
sparc64              randconfig-001-20250515    gcc-9.3.0
sparc64              randconfig-002-20250515    gcc-9.3.0
um                               allnoconfig    clang-21
um                   randconfig-001-20250515    gcc-9.3.0
um                   randconfig-002-20250515    gcc-9.3.0
x86_64                                 kexec    clang-20
x86_64                              rhel-9.4    clang-20
xtensa               randconfig-001-20250515    gcc-9.3.0
xtensa               randconfig-002-20250515    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

