Return-Path: <linux-gpio+bounces-21606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC4ADA09F
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 04:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FAFA7AAB42
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 02:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB0626058B;
	Sun, 15 Jun 2025 02:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRFEje/2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6923B17548;
	Sun, 15 Jun 2025 02:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749954366; cv=none; b=IkSFKqp/uKDMCXyKgern+NbaE+nChr8YYr6Rp0xNXa+vav7qrG1fevUuUlFHCrO8aAdXNcqjWXd3HvbDaxKLKV419R+hBtygTSEdoqwMtfKKCyp7nQb0Dmf3swtkdz+3m1+a525SnohaIdP+IW9kN2N22CJPJg0PuXMZsGMsHZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749954366; c=relaxed/simple;
	bh=iB4cIatf5tEhkaxazedaZKJ8PlFwYKX8Qrc7cvws45k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEoYjPG3bhKQvjUXQ57ef2l9Boi7DiMLFz2EnyJ89DL3i42h8bP+NFU206APvxLknUl+XRLdsp79U7uUHDqzkpVE63PkayIHLMadld/tXQJAvWw/rwp13MC9lFeIWqw3+z01LsthUZEwW2ixuCfHdgkV3kHH49tH1K6mrnl5UkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRFEje/2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749954364; x=1781490364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iB4cIatf5tEhkaxazedaZKJ8PlFwYKX8Qrc7cvws45k=;
  b=kRFEje/2GVAxsXWrBpmDjuUN2iIVhA5KdHGAkdLc8v47EStNAlfOxY66
   c4FJp/LYUp3AuIeohA3+ZwXl9eXYMLktlq1wF7/H/MHiBwV5LHoOUuUX/
   YEBlqpW9DRsRptkuMzt2D3eYQzHyUofQ9fl/ub6hlpGLm0T4QvWZnEc23
   CKJ/qLE34ZMw2JOr4MfZAIy0s6gLsLfZT0DVv0OV+KaqQpHLbxKw7xOpp
   cebrhUYq3j0jqE9NeNVD666aDpvuNDNZ/Tbj71ZuxVF/6c6B5IUaV+obA
   wbGbkYSNpKr+bWAwYURPc5AwBL5ubdjV0UMGdLFfmhCS99kZpX0LbF0+Z
   g==;
X-CSE-ConnectionGUID: 8bkK/YYrSy2H8569FjMBXw==
X-CSE-MsgGUID: 9fAMr8q/QAitrNVpqm9R/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="69706488"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="69706488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 19:26:04 -0700
X-CSE-ConnectionGUID: zSZDeOGPREKgcK3eXK8pQA==
X-CSE-MsgGUID: jbqnQ90ZRt+wXFI4LRD4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="153045407"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jun 2025 19:26:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQd4I-000E3Y-2T;
	Sun, 15 Jun 2025 02:25:58 +0000
Date: Sun, 15 Jun 2025 10:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev,
	Harshit Shah <hshah@axiado.com>
Subject: Re: [PATCH 6/6] MAINTAINERS: Add entry for AXIADO
Message-ID: <202506151027.IduXJqR2-lkp@intel.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-6-327ab344c16d@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-6-327ab344c16d@axiado.com>

Hi Harshit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8c6bc74c7f8910ed4c969ccec52e98716f98700a]

url:    https://github.com/intel-lab-lkp/linux/commits/Harshit-Shah/dt-bindings-vendor-prefixes-Add-Axiado-Corporation/20250615-091516
base:   8c6bc74c7f8910ed4c969ccec52e98716f98700a
patch link:    https://lore.kernel.org/r/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-6-327ab344c16d%40axiado.com
patch subject: [PATCH 6/6] MAINTAINERS: Add entry for AXIADO
reproduce: (https://download.01.org/0day-ci/archive/20250615/202506151027.IduXJqR2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151027.IduXJqR2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/axiado/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

