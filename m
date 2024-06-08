Return-Path: <linux-gpio+bounces-7286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7819013B6
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 23:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A861C20B47
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 21:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D9724205;
	Sat,  8 Jun 2024 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRQ9sGQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8398828
	for <linux-gpio@vger.kernel.org>; Sat,  8 Jun 2024 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717883248; cv=none; b=SaVh+J5RooCOwW+hmisne3Z1yLJMbShu1wpVcXEhfbzMP3uFBZhojP+lgVkrUPqdCBCVrgrHd4dTD9rKEhzvlZWNX9oJbx4VTyNKY56lWPHOy83hgdAf6aID1buf+NJNXTJnECUvxjeVMzlzHlOfHnJQ5ns0xNJUzsKtBAQhYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717883248; c=relaxed/simple;
	bh=q58ttbFnHT5MOeMFjoSazzEESlKjGqPg1PBckOgEeec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RAeOY9dJeb878m91l3GPu+QpwIUmVxZvZxts6XhDh/rpRJnofEFikX7eOvQN3opiT3Yd23yiR2Pq7YUeT2SqPsoZPl+hCe7Z4jQ7t4RLSY4r0Y7DbraGAU1KMmR+vSiE6yUjQ5GwW3/fCDv9uSbivzHaYLPYmybtlHI/sL96iTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRQ9sGQF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717883247; x=1749419247;
  h=date:from:to:cc:subject:message-id;
  bh=q58ttbFnHT5MOeMFjoSazzEESlKjGqPg1PBckOgEeec=;
  b=hRQ9sGQFAO13K1XVmslNQrFIONJwjWTnEmKJIkQ80zXSpfvqJRX9Jgzc
   TRVuS/VPKFo7Vc+nBoP3dgEv1UusP2V4ijFAUOyMy6uvO7HnM75h2mjGv
   2VpEGuKbI70XpdRgH9JdR4O0ri3aC0UN38OICkmwQO3vc1/HxjodRSMqF
   VXzHrk08K7vjpWvDJB/tAxfGMhb+CUBIaFOVOJljogoQOjcNeCkN6OMR5
   IA4+UypcABUvtJGYZARbqUFsEzPAf341ILG1cpMGR/Gyhtw8SbAC5hqrH
   mnZo5pKFdRR0QCVO1z1sqjxupvdZQeFfM5ODrJSXGbwNlCWBB8s3fxM/W
   A==;
X-CSE-ConnectionGUID: XiaRXcP/TI+e6fQ+P8y6rA==
X-CSE-MsgGUID: FDcdQLRkQYiLQQoa6JRjfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="11979079"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="11979079"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 14:47:27 -0700
X-CSE-ConnectionGUID: f/AKhHlYQu6WLZY6b/t6Pg==
X-CSE-MsgGUID: lxazrgUrTvujxEF+50rroQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43094800"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2024 14:47:27 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG3uF-0000WY-2b;
	Sat, 08 Jun 2024 21:47:23 +0000
Date: Sun, 09 Jun 2024 05:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 e53de87ac331eb2186477f69bf90e95d1ba39d55
Message-ID: <202406090526.zIRc8MqK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: e53de87ac331eb2186477f69bf90e95d1ba39d55  pinctrl: qcom: sdm670: add pdc wakeirq map

elapsed time: 1450m

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

