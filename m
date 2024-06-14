Return-Path: <linux-gpio+bounces-7439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70D4908088
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 03:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B26B2832DE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 01:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C554158D81;
	Fri, 14 Jun 2024 01:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dhftr+Ub"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DCE2F2D
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 01:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718327547; cv=none; b=Nm/Ej6YAZmtWl+U3jg+CDRGddg4Op+C6rpcZvABGWy1/QEDkkuU5wc5FFvaacioUdl8rLBR97AA6vKjSo6DNg+R5qfimb1ev+HL+22JiltMZ+vpRYclZcVzlu9i+s0bpoPHlhCTlueKnT158kN8Lrj4+dBRtncBW6IdT9rfoCNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718327547; c=relaxed/simple;
	bh=ttLP7jzJgn113lGS28y0JdPkA5ftnimAsizKycI2wFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AGUgjhMbrcELs+DEyHKjXO3YKD/Xg+1pwspsoN5YyZvG1QBY5Inusv8eKbSbSDBh9RyCFdhhX1P/j5kukfjFLVtde+fxVaNOo4w0K7LUm2Lj2wHjP+XaXjRMnDt1InMXw8EhmFEIcep+kKl0Wf8zPBKfk29mXHs7HlerY22yRuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dhftr+Ub; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718327545; x=1749863545;
  h=date:from:to:cc:subject:message-id;
  bh=ttLP7jzJgn113lGS28y0JdPkA5ftnimAsizKycI2wFA=;
  b=Dhftr+UbdZyfvQLKB9/jwPRkzrCzJELAHBlbiuDj3YAEmgevaJyVl91g
   ObXMV+gNzZ/KZkdIp7GwkU1+grvTFandY1IsJfw2fRj0CzUMuSGot9EHN
   r6F4V2DKNCMWXXKt5ILy88uI08S8PljIcrUVZx1COgMi9s0chi6TIFz0g
   TwJcfqJQXtnQn1Uikj/dM2YXn9drbiiyo7iYk2jgiAFPMswS0DyxvUm0A
   +S5nBXt1YjxHm+Th4ogD20cvGbdHEf2cR+XzICsl7x2foj2x5gJgh2mhw
   +U8vX3mMBavnrnGXXbF5Cs3kLkyge74klUlrmniyX8k2OP65uEzNlcmbO
   A==;
X-CSE-ConnectionGUID: R5eAGMSRR1qOZ+nTDIGL5g==
X-CSE-MsgGUID: fIw0QLSuSkmA3ID3kroZXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26595854"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="26595854"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 18:12:24 -0700
X-CSE-ConnectionGUID: qRUdzVkaQIe3WFdCCZOWPA==
X-CSE-MsgGUID: FwabnZReRQydSySmnuO8Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="41009993"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jun 2024 18:12:23 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHvUL-0000cY-13;
	Fri, 14 Jun 2024 01:12:21 +0000
Date: Fri, 14 Jun 2024 09:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 08d94c7428680715527757585a6c4575fcf571b9
Message-ID: <202406140912.AaJhOzfd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 08d94c7428680715527757585a6c4575fcf571b9  Documentation: gpio: Clarify effect of active low flag on line edges

elapsed time: 2222m

configs tested: 93
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240613   gcc-13
x86_64       buildonly-randconfig-002-20240613   gcc-9
x86_64       buildonly-randconfig-003-20240613   clang-18
x86_64       buildonly-randconfig-004-20240613   clang-18
x86_64       buildonly-randconfig-005-20240613   clang-18
x86_64       buildonly-randconfig-006-20240613   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240613   gcc-13
x86_64                randconfig-002-20240613   clang-18
x86_64                randconfig-003-20240613   gcc-13
x86_64                randconfig-004-20240613   clang-18
x86_64                randconfig-005-20240613   clang-18
x86_64                randconfig-006-20240613   clang-18
x86_64                randconfig-011-20240613   gcc-9
x86_64                randconfig-012-20240613   clang-18
x86_64                randconfig-013-20240613   clang-18
x86_64                randconfig-014-20240613   clang-18
x86_64                randconfig-015-20240613   gcc-7
x86_64                randconfig-016-20240613   clang-18
x86_64                randconfig-071-20240613   clang-18
x86_64                randconfig-072-20240613   clang-18
x86_64                randconfig-073-20240613   gcc-9
x86_64                randconfig-074-20240613   clang-18
x86_64                randconfig-075-20240613   clang-18
x86_64                randconfig-076-20240613   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

