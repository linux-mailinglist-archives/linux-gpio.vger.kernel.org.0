Return-Path: <linux-gpio+bounces-7285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB79013B5
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 23:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 970061F21620
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 21:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A11210E4;
	Sat,  8 Jun 2024 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2d328up"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FEF1C696
	for <linux-gpio@vger.kernel.org>; Sat,  8 Jun 2024 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717883188; cv=none; b=Pwc6xwGm6YBX5+57ZJ5q18UemPqFSQ7j7JPpnsoj+wIfj2nMWLzLrLnUTgfjC/xtZcRrucS/k5UjtVuJAUlgO7j+Kgi9eRWtLO9LpILY4Zu6afms9vx68UVwnNAfy4Hmodw5zhmFEOOMTKD1eMl2U3Q/Scf7chkx8pWL6S/exCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717883188; c=relaxed/simple;
	bh=EhpH+6PwsMnFAjzmcCSdhRXPq+jTqCq+70vC/XRQkfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B0jRzjeFzmRWiYYpx8e5frAW2iagPShoE8Yl2dalhKiHsbk2i1RDPVK+MBdoNtHXM9kIyU7paAo3YkYmRQbLD5WKeB98XSlC9aIjTF9+XEad1n0KPaBAA05KSHcvCWgG3uuC24y2zqaLwZaFA4p2BquBB4zFjFcFoKi8cqUM4/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2d328up; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717883187; x=1749419187;
  h=date:from:to:cc:subject:message-id;
  bh=EhpH+6PwsMnFAjzmcCSdhRXPq+jTqCq+70vC/XRQkfk=;
  b=R2d328upszzz4Uzya5+tG5fU4SMDcjcudt1HsDdnnSQpOQpWcRhj9SnW
   BCpi4aCTZ6zanVEZf2xpRRHIfXyKbg6hkIl2XyEhFfc7KrjLsrFSagEnE
   shhkPHj0Kx8XX+2msMN+qKxFo+eJSsYVrf48WpBL7s4wO5sLYCdgyP6fc
   0tEpEW3dLzRPVNsL0nH80y3soe42blPvqh1UuN7GfT3MZRUiGxCooEXOI
   U+qiXTtlSNmP4TdPyzAT+CKGIc7C8Rcyse+jijGCLJNtgemIJNSg1AXI2
   egu3OGVB1vXkR5ZleIC7xBtlQrXM0LkICnrTve8bdN66qaAubV0H7V2N8
   g==;
X-CSE-ConnectionGUID: pYq8tnNcR5GL1rCClkAVFw==
X-CSE-MsgGUID: w/aTYE0ZSe+TGzFLpD/mEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="18441637"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="18441637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 14:46:27 -0700
X-CSE-ConnectionGUID: ObEqqs2vT/qMvcAqDDrNww==
X-CSE-MsgGUID: lzkU1ZXVQwmlBlKq/eDprA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43794450"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jun 2024 14:46:25 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG3tH-0000W8-1t;
	Sat, 08 Jun 2024 21:46:23 +0000
Date: Sun, 09 Jun 2024 05:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 cef56291a5de3e835813af1e74f422a11989e3d4
Message-ID: <202406090508.vFuetLpn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: cef56291a5de3e835813af1e74f422a11989e3d4  Merge branch 'devel' into for-next

elapsed time: 1449m

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

