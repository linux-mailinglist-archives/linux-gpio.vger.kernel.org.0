Return-Path: <linux-gpio+bounces-7284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5459013B4
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 23:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19E011C20B52
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 21:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE6320B12;
	Sat,  8 Jun 2024 21:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLwhp0EG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AF11C696
	for <linux-gpio@vger.kernel.org>; Sat,  8 Jun 2024 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717883128; cv=none; b=OJqPOByfCwW7ZTUmGAoRDVsuAOUr9HX+SrqHPSFKVyRCsT45LJ2AmuCcPeMCbiW6rpDpvrftg88OYafAoHNyjdssVplfaVw2HW/iTclBIKtbpTnBXS78s7RVWI8Ve5didANpOzs9THyzGgBbQaI/JXKjJVtbKtTFx+pmXhsN8a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717883128; c=relaxed/simple;
	bh=1PM9KOizsidQQyP2x7DKMaDOjMdF7CDMFUkT3qeUJmM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QeVwuNQsM/+V6QHGCnrG4c8a/RitIqrjFIv/aL3AFIN7uVw9zdLAwd0QCQgFdnD/1HLJ7Scp/ff47SK9O+I20GPhpO31pKHygTeTVgTXJRlM4795S81RVpnOLfOh+7EhD51tnF09V7jpycG9ManPaCG+JsBlew3kUs7241swcfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLwhp0EG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717883127; x=1749419127;
  h=date:from:to:cc:subject:message-id;
  bh=1PM9KOizsidQQyP2x7DKMaDOjMdF7CDMFUkT3qeUJmM=;
  b=bLwhp0EGlkU/7esMAksPMqpufR6Yefw9wGllsy+i90588MPT/T6cwI9k
   OHK7fxLiStX7Mol9IoAQmSVZPqeThdZyfS2m/ekcIU18p0Z20Keo1n/tM
   f2YGmkxT9Fv1yXrB38Ik33gnCP7i72KOO6rl/aG26rRSiIAc0osx2u+zI
   zkdcAW/r7nfSLNzjnbpOzfqnPn4qlryuGVgqoUhGEBojOg8B+bCYaGDNK
   wdciO3GjI5us4iYDxIGbmUz/Nr4mpD+wkyuhUKGGUFVzx6CajKTYLecoZ
   uhKD2XV40NoG4uudOvHlsaMdaABG5DKFWYseQ9PWbw+j+joeh7Vnb3SOQ
   w==;
X-CSE-ConnectionGUID: ahTxnUqhRL6/AnfDamI+NQ==
X-CSE-MsgGUID: HU0nXpvpT/y8/2q+KiZAEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14464574"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14464574"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 14:45:26 -0700
X-CSE-ConnectionGUID: Wfp9vd8HT6yHMA4MzXMf+g==
X-CSE-MsgGUID: 0Bi45oT6SSCBe+5pwmil1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43217990"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 14:45:25 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG3sJ-0000Vm-1U;
	Sat, 08 Jun 2024 21:45:23 +0000
Date: Sun, 09 Jun 2024 05:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 08a9a6cd229db4b325fa5861049de268e24f6309
Message-ID: <202406090542.OyWRY4KE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 08a9a6cd229db4b325fa5861049de268e24f6309  dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008

elapsed time: 1448m

configs tested: 20
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                                allnoconfig   clang
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

