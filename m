Return-Path: <linux-gpio+bounces-10107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAEC978F31
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 10:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DF391C22A46
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 08:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D522147C9B;
	Sat, 14 Sep 2024 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ch3j6soz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859712E5D;
	Sat, 14 Sep 2024 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726303496; cv=none; b=gHvCQ59aqVA14QF9aTtBn4AYeMPo9Xh0om7EReHAMbihShZwDxEqyjan14C9omRTtei+iJDCmB9eynFWE6Vnbc0Twr4BbbeEX5tF+sXMoyFO7V+hway8f2H7LWOjkqzRzmXfZ0bf0K3aoecS+LRPjnRIUdkjy4GkueavM1DcTgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726303496; c=relaxed/simple;
	bh=Yo2t08wq6mqrLt2v9Yb6EbR8Hv+2oN77BrDNhVFJZzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP7zr7lf8usWdS9sNn3+S4Ck3g5dBQC+YuW9mfU4wVkj7YaXe2Jk2j8anjJi/FjtlFazmPvlFuQfBR7Tm3iujIPwI6WtKwZSzf1hKLGolnhTx8rwC0c/SFIx1NmGpJybG1QPLRpaZGT6XLDo2dxhZPFUiyGDLmMi6qC1gyBaM9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ch3j6soz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726303495; x=1757839495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yo2t08wq6mqrLt2v9Yb6EbR8Hv+2oN77BrDNhVFJZzk=;
  b=ch3j6sozVqrlmOrZeHC1SgTh45J7+vh6Y9odXQevxrnJKT8Pvhd8tHOV
   L6wFu3uu+jWPlly8yXW1FwkxbQA6RVG9/NYa2SX7u3rHH4BxfwiAVDA6k
   mwA/dhYyUTuSXeuog/fKJ4TbtWMyGohhIRNQtPBLGnrYbo1acEXwDUYwt
   B1jEs31nrAhTjw9PTclTAfhKctqo9fz7+AFnYPvL0z1JHUuy14E2BGDjQ
   mVjfJlganeAkAIoNIDYvG7RyY4TTsKiP2CMlSEUdpbNcAFMczeeiA41de
   h02i9xM7wqh6hhPYaxWyoSvG7e4V4QV81kL0+rkgLWl3cDffsgTDqAKpS
   g==;
X-CSE-ConnectionGUID: pFpam943RqCDmEwWobTedQ==
X-CSE-MsgGUID: vxIaa1n/SqiZlRu72b9rmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25092067"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25092067"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 01:44:54 -0700
X-CSE-ConnectionGUID: xmrBwu1NS0qQAciLVisk0w==
X-CSE-MsgGUID: E9tgl2zaSju+Bp7vrddTKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="105796452"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2024 01:44:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spOOe-0007Xw-0K;
	Sat, 14 Sep 2024 08:44:48 +0000
Date: Sat, 14 Sep 2024 16:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	Peter.Yin@quantatw.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 5/6] gpio: aspeed: Change the macro to support
 deferred probe
Message-ID: <202409141654.wHuMQLLU-lkp@intel.com>
References: <20240913074325.239390-6-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913074325.239390-6-billy_tsai@aspeedtech.com>

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240913-154911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240913074325.239390-6-billy_tsai%40aspeedtech.com
patch subject: [PATCH v3 5/6] gpio: aspeed: Change the macro to support deferred probe
config: arc-randconfig-001-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141654.wHuMQLLU-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141654.wHuMQLLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141654.wHuMQLLU-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: aspeed_gpio_driver+0x0 (section: .data) -> aspeed_gpio_probe (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

