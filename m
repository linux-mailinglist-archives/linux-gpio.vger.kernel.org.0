Return-Path: <linux-gpio+bounces-7838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38891D45D
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 00:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88123B20B40
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jun 2024 22:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384275A79B;
	Sun, 30 Jun 2024 22:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEW92zN2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536B858203
	for <linux-gpio@vger.kernel.org>; Sun, 30 Jun 2024 22:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719785514; cv=none; b=Rqe9B9gO1WquRrXLPt3ZYG9xgtCBTsQ//RmjB8eU+rj4MkjCjgHUQ3dqx6NCtNS+fHnLyq4Rgpw3lZeJEnU90FU5lhvpLEpFhHlR+4CHDDxW2bRyzATTCZC1cjtXGYwBKUiTVf7IXkGzjPuyFIbuN6ND3Cg1dYzeIvumkB9gggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719785514; c=relaxed/simple;
	bh=paoMWgojSsKsR+UFcG45zJQdVfWei+ugvxIne1vqjHU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C5qGrO4O+7OFRj5qdyU/O+siNpNDlN65UR0pqd3cvmL6oG/eHT1N+H5Vg6kcRZa+R48tCX37VrSQopBebVkS4FO8YN0ti7c1pLfyzx18Tor1o6Gvjw5mXyij5fZbMG5FtAGUV8ZmF/FF66WxX8TkXJIfZamps+fYZi5wwDep98s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEW92zN2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719785512; x=1751321512;
  h=date:from:to:cc:subject:message-id;
  bh=paoMWgojSsKsR+UFcG45zJQdVfWei+ugvxIne1vqjHU=;
  b=cEW92zN2NdbWksUGIaoqyyvmczrCl9Usu3KNc0Fra3CN3X9Ph/mVYAQQ
   urONObnBV8/j4cgIaSJIaOPlHkGgioBBJL5yjMxFwvYRVAcDwQwzqPC67
   tpwNKX0hIEDZu5TPVY1YtA0OmSmUIEq2C+tAvOkpMubqBTVHvA4pqcodB
   jhMvKMCPIywbUxPx2mjdzOIF3SJ6WdsLMtsyt+AXOAHLSL5F8+7rkaw4k
   A/N5DFRS6Pl8/lvIePmX9nSSCyZjpI9E7u5b2yz4uNkqOFR4kO3BjoJOy
   0WD5JrZsV/G2hl9JkpnqbtQmA8qb+VhyyLkYH9PNXB15shfJ+IAnDhRCG
   Q==;
X-CSE-ConnectionGUID: fs1uiWe0QMy5oXqv/hICiQ==
X-CSE-MsgGUID: br75yoxsRey3sw7kciULIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="17024814"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="17024814"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 15:11:51 -0700
X-CSE-ConnectionGUID: TwDBOH1pRn6pagPVqllg0g==
X-CSE-MsgGUID: AXd7pmDXQF6Snq9y4go+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="45384312"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jun 2024 15:11:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sO2lw-000M4Q-10;
	Sun, 30 Jun 2024 22:11:48 +0000
Date: Mon, 01 Jul 2024 06:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 3550b5db3af4d0ff7f2ad07367af6427534620f0
Message-ID: <202407010638.rq2WaOJ6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 3550b5db3af4d0ff7f2ad07367af6427534620f0  dt-bindings: gpio: fsl,qoriq-gpio: add common property gpio-line-names

elapsed time: 3652m

configs tested: 67
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240701   gcc-13.2.0
arc                   randconfig-002-20240701   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                   randconfig-001-20240701   gcc-13.2.0
arm                   randconfig-002-20240701   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
hexagon                           allnoconfig   clang-19
i386         buildonly-randconfig-001-20240629   gcc-7
i386         buildonly-randconfig-001-20240630   clang-18
i386         buildonly-randconfig-002-20240629   gcc-7
i386         buildonly-randconfig-002-20240630   clang-18
i386         buildonly-randconfig-003-20240629   gcc-7
i386         buildonly-randconfig-003-20240630   clang-18
i386         buildonly-randconfig-004-20240629   gcc-7
i386         buildonly-randconfig-004-20240630   clang-18
i386         buildonly-randconfig-005-20240629   gcc-7
i386         buildonly-randconfig-005-20240630   clang-18
i386         buildonly-randconfig-006-20240629   gcc-7
i386         buildonly-randconfig-006-20240630   clang-18
i386                  randconfig-001-20240629   gcc-7
i386                  randconfig-001-20240630   clang-18
i386                  randconfig-002-20240629   gcc-7
i386                  randconfig-002-20240630   clang-18
i386                  randconfig-003-20240629   gcc-7
i386                  randconfig-003-20240630   clang-18
i386                  randconfig-004-20240629   gcc-7
i386                  randconfig-004-20240630   clang-18
i386                  randconfig-005-20240629   gcc-7
i386                  randconfig-005-20240630   clang-18
i386                  randconfig-006-20240629   gcc-7
i386                  randconfig-006-20240630   clang-18
i386                  randconfig-011-20240629   gcc-7
i386                  randconfig-011-20240630   clang-18
i386                  randconfig-012-20240629   gcc-7
i386                  randconfig-012-20240630   clang-18
i386                  randconfig-013-20240629   gcc-7
i386                  randconfig-013-20240630   clang-18
i386                  randconfig-014-20240629   gcc-7
i386                  randconfig-014-20240630   clang-18
i386                  randconfig-015-20240629   gcc-7
i386                  randconfig-015-20240630   clang-18
i386                  randconfig-016-20240629   gcc-7
i386                  randconfig-016-20240630   clang-18
loongarch                         allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
x86_64       buildonly-randconfig-001-20240701   gcc-11
x86_64       buildonly-randconfig-002-20240701   gcc-13
x86_64       buildonly-randconfig-003-20240701   clang-18
x86_64       buildonly-randconfig-004-20240701   clang-18
x86_64                                  kexec   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

