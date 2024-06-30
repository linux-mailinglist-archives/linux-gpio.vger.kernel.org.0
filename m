Return-Path: <linux-gpio+bounces-7837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CCA91D3FA
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jun 2024 22:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 903892811AD
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jun 2024 20:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640231527BB;
	Sun, 30 Jun 2024 20:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJ21E2/F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5714532C
	for <linux-gpio@vger.kernel.org>; Sun, 30 Jun 2024 20:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719779959; cv=none; b=pFqM8oeM4blYRcv4w2ecxuqgNEJxLZ//b6SsFpDD1Lz+i2tO1hqnsI+CxPlUoeU91c2URA87vwDvE66MyZs6kbqt/4B79FYbeeuuQ/kGgSYunsxr1eThtSSRiPf4O0wUxTHZBMe+xfIO8XDVQVOlVsa4wFt4qeeE0r0gU7szTYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719779959; c=relaxed/simple;
	bh=NHzyQWaC5UDO1Pc+XcQXFhE7O702yv4hZ6EXq1H19Jo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fqT2eYiHprfDw+iwapzgrMKQXDgueiousxJo5BiZs1012Fci0HOcjG0Aw7gEfSGLiFsJ8h3eD5dZqp1bbX+j9HLfvf1Lq/9UrCwZ1NuDM9vvuuv87up5NPHKPyyieAKcwDd+tGvl6/fwRjTB3Ks9kU2E7JjfWAfm3ZuqUReBO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJ21E2/F; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719779957; x=1751315957;
  h=date:from:to:cc:subject:message-id;
  bh=NHzyQWaC5UDO1Pc+XcQXFhE7O702yv4hZ6EXq1H19Jo=;
  b=YJ21E2/FqLmnrEA3E5kVnwJCEGOuOjE/NjnT3ali012r5GSSQS3hAeHC
   s6K2TB/4jrbxuX21LH8vu0yIMfMpvK90EdU4gcPdbSv75OTDfN+0VYTk1
   tAAUx13hvI6Kw6189zLQ+r0PMAfWjRF2GgVOea1Q0Gc3pzkC4CIN7vvkq
   xu4OiBGJeIQWgi3Q9G90X1v/Io33V5hWnF4gviTd9Snvv0PnZuTsqiiRW
   JJwKabIlsbjUkDdBrMD7/q/nE83Ttnug4eYLA2m8wg0Lt41+qSLcw7eNn
   aZ4DAqaTfftmt/lFBmNAHlAirII7JkEPd2K20713wYn74P7rxdBDXy05u
   g==;
X-CSE-ConnectionGUID: zH6kdHD8SaGUXCO5+Tj4gw==
X-CSE-MsgGUID: Z6LhABDdSLuGrk9RiCbmOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="16763955"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="16763955"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 13:39:17 -0700
X-CSE-ConnectionGUID: qG3O4tjdQDKNbUqA6hDY+A==
X-CSE-MsgGUID: uiRG9qUvSAGbTSKVHZvqyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="49899527"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jun 2024 13:39:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sO1KL-000LuR-33;
	Sun, 30 Jun 2024 20:39:13 +0000
Date: Mon, 01 Jul 2024 04:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 b440396387418fe2feaacd41ca16080e7a8bc9ad
Message-ID: <202407010400.QNdL1Dsc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: b440396387418fe2feaacd41ca16080e7a8bc9ad  gpiolib: cdev: Ignore reconfiguration without direction

elapsed time: 4581m

configs tested: 67
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240630   gcc-13.2.0
arc                   randconfig-002-20240630   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                   randconfig-001-20240630   gcc-13.2.0
arm                   randconfig-002-20240630   gcc-13.2.0
arm                   randconfig-003-20240630   gcc-13.2.0
arm                   randconfig-004-20240630   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240630   gcc-13.2.0
arm64                 randconfig-002-20240630   gcc-13.2.0
arm64                 randconfig-003-20240630   gcc-13.2.0
arm64                 randconfig-004-20240630   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240630   gcc-13.2.0
csky                  randconfig-002-20240630   gcc-13.2.0
hexagon                           allnoconfig   clang-19
i386         buildonly-randconfig-001-20240628   gcc-10
i386         buildonly-randconfig-002-20240628   gcc-10
i386         buildonly-randconfig-003-20240628   gcc-10
i386         buildonly-randconfig-004-20240628   gcc-10
i386         buildonly-randconfig-005-20240628   gcc-10
i386         buildonly-randconfig-006-20240628   gcc-10
i386                  randconfig-001-20240628   gcc-10
i386                  randconfig-002-20240628   gcc-10
i386                  randconfig-003-20240628   gcc-10
i386                  randconfig-004-20240628   gcc-10
i386                  randconfig-005-20240628   gcc-10
i386                  randconfig-006-20240628   gcc-10
i386                  randconfig-011-20240628   gcc-10
i386                  randconfig-012-20240628   gcc-10
i386                  randconfig-013-20240628   gcc-10
i386                  randconfig-014-20240628   gcc-10
i386                  randconfig-015-20240628   gcc-10
i386                  randconfig-016-20240628   gcc-10
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240630   gcc-13.2.0
loongarch             randconfig-002-20240630   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240630   gcc-13.2.0
nios2                 randconfig-002-20240630   gcc-13.2.0
parisc                randconfig-001-20240630   gcc-13.2.0
parisc                randconfig-002-20240630   gcc-13.2.0
powerpc               randconfig-001-20240630   gcc-13.2.0
powerpc               randconfig-002-20240630   gcc-13.2.0
powerpc               randconfig-003-20240630   gcc-13.2.0
powerpc64             randconfig-001-20240630   gcc-13.2.0
powerpc64             randconfig-002-20240630   gcc-13.2.0
powerpc64             randconfig-003-20240630   gcc-13.2.0
riscv                 randconfig-001-20240630   gcc-13.2.0
riscv                 randconfig-002-20240630   gcc-13.2.0
s390                  randconfig-001-20240630   gcc-13.2.0
s390                  randconfig-002-20240630   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240630   gcc-13.2.0
sh                    randconfig-002-20240630   gcc-13.2.0
sparc64               randconfig-001-20240630   gcc-13.2.0
sparc64               randconfig-002-20240630   gcc-13.2.0
um                    randconfig-001-20240630   gcc-13.2.0
um                    randconfig-002-20240630   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240630   gcc-13.2.0
xtensa                randconfig-002-20240630   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

