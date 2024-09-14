Return-Path: <linux-gpio+bounces-10112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 102849791D2
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 17:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7571C213F4
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 15:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DB51D048D;
	Sat, 14 Sep 2024 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcOz2c9/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3CB1CFEC1;
	Sat, 14 Sep 2024 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726328061; cv=none; b=Rv29lxgBtQ0RBd3WV7QEMWZwLiPDsMyz8eYYQnLB56nzsBecOQDOzHmK5ChTorXxN0Cdwm0qaP4AENJl6UUcUcKAc83lHPhlXJNqQKQgOGG1HnY3RTDc/0o38lJxYGe5FFRDHzRtL5Vm5YcLXsRcuMvbYkkRnmrjdQilSt1aWso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726328061; c=relaxed/simple;
	bh=QBOVB0yM2vWg5VsUrg726BxZNDRJISV0VOA08vKcut4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BndMD6L0sabHDzR24B3aS0eZm6jVEK0AZj4Kqgjualx6k81xXT2W21xSk483UjXZfAvCxnXGwJUd+6bAIFboWrPmXvcfUqwSKg4q5HU7OQMRYFmgSLwJfjQNvJuGuKDBhzKK0eVLCcbG5fOvZ33m4iNq7guqst6kJjXBUTfNBTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcOz2c9/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726328060; x=1757864060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QBOVB0yM2vWg5VsUrg726BxZNDRJISV0VOA08vKcut4=;
  b=bcOz2c9/JxfV2MYZcKLRZDAhF0o2iZS29XCNQ+oQIMLKOzcIrvC50wm5
   hqvqHFlGWJpVefPIk5QkpBrKiVjVocV1D5YLOuX/WRuSB6DFByUlURToZ
   abmRy52jVpuxRxlx6gpyTOr5hgzSCOgxEQG64XeH4TkiUI3We0+2aG65H
   dBNhKmJgdXfZzWm51UzO+pGE7/zgLWel8ydYLasNaZjf3PElVugEWvBkr
   YK/IZ5rsz3zzryH3C8mM0bu2qCw13IlQB4u7+6jZC6rqO+vToQkhVHfFb
   ZqAR6GaNVZdvQF3M7gHAxNxnp+k5m2wOKWLBAWduexyUS/fhEmjZl+oIF
   w==;
X-CSE-ConnectionGUID: fKtYEDC4TPKaUQVEnVM2GQ==
X-CSE-MsgGUID: wbkB+K5+Qcy5tmReeT4FGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="42695731"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="42695731"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 08:34:10 -0700
X-CSE-ConnectionGUID: bxZoZih5SFOFijIVQ5phng==
X-CSE-MsgGUID: txFGEYR2TWmI7oVjMJY0xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="72808096"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2024 08:34:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spUmh-0007ta-20;
	Sat, 14 Sep 2024 15:34:03 +0000
Date: Sat, 14 Sep 2024 23:33:50 +0800
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
Message-ID: <202409142334.UEVN1oRP-lkp@intel.com>
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
config: arm-randconfig-003-20240914 (https://download.01.org/0day-ci/archive/20240914/202409142334.UEVN1oRP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142334.UEVN1oRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142334.UEVN1oRP-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
>> WARNING: modpost: drivers/gpio/gpio-aspeed: section mismatch in reference: aspeed_gpio_driver+0x0 (section: .data) -> aspeed_gpio_probe (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/qcaux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symbolserial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

