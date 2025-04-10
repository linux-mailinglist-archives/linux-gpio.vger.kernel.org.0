Return-Path: <linux-gpio+bounces-18614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E12F9A834E9
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 02:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 287878C105C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 00:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5FD27468;
	Thu, 10 Apr 2025 00:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcBTBp6z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E33C3C
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 00:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744243340; cv=none; b=LlLSMrF74LBVlPE4KUq4//XTBbTfE6UKyhS+LEJz0x+5luCTaBERqXGjaHTLm2/JCmSKaIaBU1bZRRJFb9PDX/k+7y49bK/Xkud5wqyfnzT3H0LdIltdCj8KsFt5YCOPLKQcFiAPNO6bO1wvsImFuNf2IVVlDTLjlQyYNxLQhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744243340; c=relaxed/simple;
	bh=8qsz+syNgjj1B/vLTSxqqrdv+LUokahYeH6EJn+hnRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0rIuP1r4u5xyygZ05uFTHIB0YJczkFV8aGOv284zxsNWgL63sGvuC0J6RNYQ9NDC1aWZLPwapysAUQZ+aOKcgAkE/K3CwpL9ENAi3EhLuHUKVzC/dAGeqNjMkGvPEpwp0wvUg5YJcP1wZiRCaJp66gVrW6qbszqMFjAVVRViNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcBTBp6z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744243337; x=1775779337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8qsz+syNgjj1B/vLTSxqqrdv+LUokahYeH6EJn+hnRk=;
  b=dcBTBp6z29cWD0T9BjICIrbj6aJnfXqy8hlExRaEEeXxd8a5YtZ8fed4
   WVxt5TaZsDSixnw/bdS8fzGmGsP6EoCyAt+9UTf/TSgvFBqaaOul+UuX0
   IV4Ob6WVn60eQ2L0pEjTwEmsNrWmVirIEdBCH/2b/aWVpBWPA/Jhrt4NQ
   +wCQOQFINWYw/Phj8ZH3jSo6/Gyn0cUesSSpkNrm4sSIUSW68MbvEZfOf
   R6t7bYGUX7Pt3JBnmLQKOMbqVMcrbTrKPeIfuZR37zhqQ+pQk72Awhjwn
   FaA8y1Fw93HICsRzYCWFoZJI6P6epUC4WX+EK+v5dUqOXzV+e72gFA9N0
   Q==;
X-CSE-ConnectionGUID: Ygc9R1SKQkCiimtGXuvm6w==
X-CSE-MsgGUID: 6lGFb5ncQgCHfT5BQU1gDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="48444720"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="48444720"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 17:02:16 -0700
X-CSE-ConnectionGUID: f1S95iVMS9WpXhDncuAsWw==
X-CSE-MsgGUID: Wx9qZAKyRpat8HQ8k5d3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128712558"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Apr 2025 17:02:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2fMz-0009Pw-0d;
	Thu, 10 Apr 2025 00:02:13 +0000
Date: Thu, 10 Apr 2025 08:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [brgl:gpio/for-next 13/18] ld.lld: error: relocation R_PPC_ADDR16_HA
 cannot be used against symbol 'vdso32_start'; recompile with -fPIC
Message-ID: <202504100718.3Ftgs2zL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   6d7f0c1103ef3935eb3f302d09af4ef9e85212a3
commit: 86f162e73d2d81ef6d819c06a3b6c2fda77a79b8 [13/18] gpio: aggregator: introduce basic configfs interface
config: powerpc-randconfig-003-20250410 (https://download.01.org/0day-ci/archive/20250410/202504100718.3Ftgs2zL-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504100718.3Ftgs2zL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504100718.3Ftgs2zL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'vdso32_start'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/vdso32_wrapper.o)
   >>> referenced by vdso.c
   >>>               arch/powerpc/kernel/vdso.o:(arch_setup_additional_pages) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

