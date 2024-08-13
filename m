Return-Path: <linux-gpio+bounces-8738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE6D950DA7
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 22:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDBCB1C21E12
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 20:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982E41A7052;
	Tue, 13 Aug 2024 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dn5GejX7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D31A4F3B
	for <linux-gpio@vger.kernel.org>; Tue, 13 Aug 2024 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579782; cv=none; b=LUv1j+e2Z7W8Vrszrp9IM0kSbR8b28lofvYUUmNkuru1QMIpiRuHMAZeK1lUHl0/bi2OKhJSskzQMb20vulaYlTum+eEQ4v70qHM1OZRv/3VERRz/XHcm0I12rCaHEfPdZoLX7KRyzUhsvwGG92sL31icV89ypH7GmZeBTGTrHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579782; c=relaxed/simple;
	bh=82upTc6GZWpOToOFPBaHe7WgGinNrBj3P4zWDwZGgsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RHt3ZS/vO1//xFB5UKRqLfHpRr0djfTYRgnl/vu22FmnkhGd/0v59wOjCBwDixvQKJAyRhkvQk8PHKpo4hXNPHhHEQiSIDicK/M3T9vyRntiJHKrADrUGABvi5V1S+KpbmMj2oM3kvBI2YpmbUrQdsuBohBhU2USPYQKhiy5K0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dn5GejX7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723579781; x=1755115781;
  h=date:from:to:cc:subject:message-id;
  bh=82upTc6GZWpOToOFPBaHe7WgGinNrBj3P4zWDwZGgsE=;
  b=dn5GejX771wGQB6v4AxR1twuLCeg8xABV/srR3UPDWlXMMdWM/UkntuA
   0pK/afqDUDogfCBDDzQd/WraetKuLd4g3lCm8DeoSkFqUq4OgL90yS5Xa
   Tz3Zmw/FN2Ppj+mgtFiOBeuUQDhXGu6FzDMMc1jgfeEmYqbdRhY9Dt3OB
   BXNcFYStqD5CclqvlBb6vSb6Txks0sYLHM/Agajy1MDZauqY/0jFnHflO
   1yOLiogvmBHEwwaNSSvNuoZUOZH/8rrKXvX5WAeYM8BWfNTItQpb5sWpC
   h1h8NtA+D2xvRmtBjbwzj3D3R+YkrDs0bki2qI+9WgqFq+VPOqJKjdjjP
   A==;
X-CSE-ConnectionGUID: xILoTHFgSuCD7ABcLu2CBQ==
X-CSE-MsgGUID: 89JLlN4/Q0ioNSxgmUWTaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21582632"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="21582632"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 13:09:39 -0700
X-CSE-ConnectionGUID: msfE1Bc3TKOfA/qWu7+/Mw==
X-CSE-MsgGUID: myZqVW4gTPaFBa+zX8r8WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="58776971"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2024 13:09:37 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdxpn-0000hW-2l;
	Tue, 13 Aug 2024 20:09:35 +0000
Date: Wed, 14 Aug 2024 04:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:davinci/for-next] BUILD SUCCESS
 8205d5c7463d50dc32ebcf3417a9926ca2b25826
Message-ID: <202408140400.wDc2t80c-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git davinci/for-next
branch HEAD: 8205d5c7463d50dc32ebcf3417a9926ca2b25826  ARM: davinci: remove unused davinci_init_ide() declaration

elapsed time: 721m

configs tested: 47
configs skipped: 140

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                   randconfig-001-20240813   gcc-14.1.0
arm                   randconfig-002-20240813   gcc-14.1.0
arm                   randconfig-003-20240813   gcc-14.1.0
arm                   randconfig-004-20240813   gcc-14.1.0
arm64                            allmodconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386                                defconfig   clang-18
loongarch                           defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                                allnoconfig   gcc-14.1.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

