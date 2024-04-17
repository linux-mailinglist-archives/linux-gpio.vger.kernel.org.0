Return-Path: <linux-gpio+bounces-5616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B838A82EE
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 14:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01FB2835E4
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 12:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCEE13D26C;
	Wed, 17 Apr 2024 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWZMhZ9q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF713CF94
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713355987; cv=none; b=ivsgKvZqvPf76xpJw3cIvhhz8iCJ1DKKlCbi4LX02kjrAebWoMPI7uL21vDLpl/J5AuNhoqTIWkD0MUl0+A8riQD13Nh9jDSPD8dzlsbUeYD9Ash6c4JU6l+xMQkh4i1pQdb8ZPlbccJ9Buh+UCsWx1YLkkvOLDbxfcJfjVj5Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713355987; c=relaxed/simple;
	bh=W/azP5vPBFIbCpeawE24tb74jexs8bJ0MHWZ+ffrhKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rhXXxfdZaMA5fwXbITQK7pzKGXCFVXQrtx3MGv0KHhtnhZH+UVyNkpT4wq1Z6g/Q42PkGXC4gkkA6H1SO1Y/116S0lvTCN6+x9+3xtjV4QTNHXLJwJOF4pK9WrdAAN1rj+Y5xQlmnJveRwYudDsc85EcJrXGGW29K4ZV3zcvJPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWZMhZ9q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713355986; x=1744891986;
  h=date:from:to:cc:subject:message-id;
  bh=W/azP5vPBFIbCpeawE24tb74jexs8bJ0MHWZ+ffrhKs=;
  b=cWZMhZ9qshf4v7hB1iVas34S0JaHrqbHJc2AW6+nH+KjcQlqrPaKUvRL
   lLJhqFAlLypbQ05bvoz2Izej33tdiW/isC6nUKNqCL6lcv2fRSCbD0mKb
   QyFU+up35X+k/94QPSmpUnwIFPH1aAQj58iGQr2/qb7xhk2Uzjwuj166K
   rJZk76wYXDdqJqfSQNQckTxLp4Vwv656nk0kfiZabUH/QYRUwmDUVGUTG
   7Qe0Kd0zwgvXj8NosOKSKfeUiPzq+q6649XprOEz8kBx9T+gThTFZbixg
   /CbFyWG3UBo44zrg4IFAF0u5AdrZheq94Qk2IRcEL4i4MA+n+9Lgn1FVc
   g==;
X-CSE-ConnectionGUID: d32XIWLcQd2HnH9IicgzGg==
X-CSE-MsgGUID: 6kjZ7B8TRxSD22u4Nxkjdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20232796"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="20232796"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 05:13:05 -0700
X-CSE-ConnectionGUID: yG/+OTtPSOi6Le4PZM3jZA==
X-CSE-MsgGUID: al3+esqxRAWRnIlrCQePKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="27185606"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Apr 2024 05:13:04 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx49t-0006Ya-16;
	Wed, 17 Apr 2024 12:13:01 +0000
Date: Wed, 17 Apr 2024 20:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 cdbd87951e21eb869acd7bb5bdd78877ff5347fb
Message-ID: <202404172045.043UoNoZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: cdbd87951e21eb869acd7bb5bdd78877ff5347fb  Merge branch 'devel' into for-next

elapsed time: 1340m

configs tested: 115
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240417   clang
i386         buildonly-randconfig-002-20240417   gcc  
i386         buildonly-randconfig-003-20240417   clang
i386         buildonly-randconfig-004-20240417   gcc  
i386         buildonly-randconfig-005-20240417   gcc  
i386         buildonly-randconfig-006-20240417   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240417   clang
i386                  randconfig-002-20240417   gcc  
i386                  randconfig-003-20240417   gcc  
i386                  randconfig-004-20240417   clang
i386                  randconfig-005-20240417   clang
i386                  randconfig-006-20240417   clang
i386                  randconfig-011-20240417   gcc  
i386                  randconfig-012-20240417   gcc  
i386                  randconfig-013-20240417   clang
i386                  randconfig-014-20240417   gcc  
i386                  randconfig-015-20240417   gcc  
i386                  randconfig-016-20240417   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240417   clang
x86_64       buildonly-randconfig-002-20240417   gcc  
x86_64       buildonly-randconfig-003-20240417   clang
x86_64       buildonly-randconfig-004-20240417   clang
x86_64       buildonly-randconfig-005-20240417   clang
x86_64       buildonly-randconfig-006-20240417   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240417   gcc  
x86_64                randconfig-002-20240417   gcc  
x86_64                randconfig-003-20240417   gcc  
x86_64                randconfig-004-20240417   clang
x86_64                randconfig-005-20240417   clang
x86_64                randconfig-006-20240417   gcc  
x86_64                randconfig-011-20240417   clang
x86_64                randconfig-012-20240417   clang
x86_64                randconfig-014-20240417   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

