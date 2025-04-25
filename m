Return-Path: <linux-gpio+bounces-19308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B27CA9C340
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FB221BA20D1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BAA2356BE;
	Fri, 25 Apr 2025 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Loduba4f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C7C235355;
	Fri, 25 Apr 2025 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572986; cv=none; b=Zz2g74fr5Rpr4dMLL7YS9Fdp+4KgjmJ8ui9jYuYGb4kJqBBDdEN+YAuxRvbAz+5BYollza3moSTohsjw1mQr9XHpYqjZ5uAfOsdrS1glH3rp0sg2JTrF6t+XXnwGm+0T2iXvZWTBwkjWs91NfGHHXuWU8tlQAhv0zVBq94bvfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572986; c=relaxed/simple;
	bh=gMprlHkVxi6gnMvmMb4cMRUtpyme/sohQ1ulPVQ8zCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aC4XLHPimyjbK2d0lOWpa6g2VmSia61f+7h1k4nCwlUlRvGdj/8ao126OgffUBx4KpqtPUSb3mCduH7T6RQYQDHb513eeSs44GRyuDozL5yGpQdtpw2GLj07tFJGXI4i7Z0JY+CIGVLMLIlO8+VFT2ZZknNwlN0koBwLJ6LJYaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Loduba4f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745572985; x=1777108985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMprlHkVxi6gnMvmMb4cMRUtpyme/sohQ1ulPVQ8zCM=;
  b=Loduba4fO1Kdh6vLs9aVzxdST+Zdm65VH7SrjUaZvnoS2AqmshDM3Ad2
   qpnQCmJZFIPaNzW9vcdAkAYIXbLYFoLa4pjNSx8GAwo/L7flafLSH2T36
   OWzRfU/vzHsLSNzd9l+oZIoY/prO1mk+vxbQhvYl4OokEl5/3R8t5G3Be
   Vbarq45gFo4U5Y1d5m21X1buHKMrAriUDHSLvCnWQama6rodxV5rALjTD
   2ML5xx00N2xA/N5SxT5TEdS+zjtFfMZUttVYQz70YDOC6/zXDRrWTiMEK
   dXm6ErNjvZfyCXByHgVTJoNEnc5aexL+OYop8ORhG/sqc9Q5k81D7AZmi
   Q==;
X-CSE-ConnectionGUID: 9t6LmmlLQmWf/69gLFrZmQ==
X-CSE-MsgGUID: OVTe40i1ScGLMWTGT0Tw+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47103843"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47103843"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:23:04 -0700
X-CSE-ConnectionGUID: fGyaWEyHRD2/osn7rGCrNw==
X-CSE-MsgGUID: 0hbx2HneSVGKZl80TOtVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="156090082"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2025 02:22:55 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8FGm-00051J-2c;
	Fri, 25 Apr 2025 09:22:52 +0000
Date: Fri, 25 Apr 2025 17:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: jh7110-pine64-star64: force
 no USB overcurrent
Message-ID: <202504251758.YghAqPPR-lkp@intel.com>
References: <20250424062154.655128-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424062154.655128-1-uwu@icenowy.me>

Hi Icenowy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/dt-bindings-pinctrl-starfive-jh7110-add-PAD_INTERNAL_-virtual-pins/20250424-142640
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250424062154.655128-1-uwu%40icenowy.me
patch subject: [PATCH v2 3/3] riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent
config: riscv-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251758.YghAqPPR-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251758.YghAqPPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251758.YghAqPPR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts:96.87-88 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

