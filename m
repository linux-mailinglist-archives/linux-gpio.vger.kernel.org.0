Return-Path: <linux-gpio+bounces-19026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69008A92248
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06F4C1898242
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 16:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834C9254846;
	Thu, 17 Apr 2025 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUsh/INX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE50254843;
	Thu, 17 Apr 2025 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906144; cv=none; b=aavI4GaAlaWgLywvsrvqehXZwRhwnPdsFcItfvMjZF9VszL8fKWCEniWY0eC886qCxwddrhHqJDFz+evFVRHWRTBzJfWVw6z5iOvb0IxaRnWJj2iSMK0/c3sszOPiG2rPV/7RqPHvaQc6QrL3KFoHLITt49fBRNvotWbzWgu+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906144; c=relaxed/simple;
	bh=GwGY6CO303Usvicakl4M5GZ5cgW6/60SATjXouEiCCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=se6LRPxZfzdDcJ4EQXk8J5Lrw3an2ZmnWY/Fv8/3QFuVvGn+GgAnRmXhXtQrU/uDKR5EtQNKkpTuV72TeIokedKPgE88Pp0otY2N6Cb5AcnJOgAM6sGBSV1bQZxawvq+WBAsbDcdJFhSsHzME6VxqzaYdGN+IKn/220sotXPMDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUsh/INX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744906141; x=1776442141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GwGY6CO303Usvicakl4M5GZ5cgW6/60SATjXouEiCCM=;
  b=mUsh/INXWS3SQk1HyUo4tEqBvbFA9sRAPj61WcRAX+qRMOtTYIDaz/Mb
   ik13zsjLhODCO2gjvmRQmx5J4bhe93po3dGsC2s/lPsjB+09O71mPxE/e
   +qWZ8fbb4OWcCZVf5BpbRCgANWfC/qXgOVk7uySnD/2sUKXgOWTR3HwfB
   VGRg+gNIM8am0ISl8tWWkb9O+DuDUCQ4mHc5S0rGSgUvPUkEsOdTBgcve
   txxv0wkyuhpLK/riP9qYj/EgYg75n3or8qdeX47t3QPL/SfxCXuH/D0ls
   BoiVWW7vCNKGI1IxHwl3WK7YS1rnavbCMuf3KTlmR/wjEnqieJD+zmEje
   g==;
X-CSE-ConnectionGUID: QJq0PDz7SaWgVMo8UYEkww==
X-CSE-MsgGUID: T20xbA2HSLe3u1n8dz/S+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="71895011"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="71895011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:09:00 -0700
X-CSE-ConnectionGUID: S5WOtJR7S+G7uCE+9PLbOA==
X-CSE-MsgGUID: rRXo41YGRxmmae8X5wXoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135963225"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Apr 2025 09:08:58 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5RnM-0000Tz-0M;
	Thu, 17 Apr 2025 16:08:56 +0000
Date: Fri, 18 Apr 2025 00:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw, Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v3 02/10] pinctrl: core: add
 devm_pinctrl_register_mappings()
Message-ID: <202504172328.mrC81ooJ-lkp@intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richard/gpiolib-add-support-to-register-sparse-pin-range/20250416-221852
base:   8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
patch link:    https://lore.kernel.org/r/20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee%40bootlin.com
patch subject: [PATCH v3 02/10] pinctrl: core: add devm_pinctrl_register_mappings()
config: i386-buildonly-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504172328.mrC81ooJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504172328.mrC81ooJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504172328.mrC81ooJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/renesas/pfc-r8a7791.c:12:
   In file included from drivers/pinctrl/renesas/sh_pfc.h:12:
   In file included from include/linux/pinctrl/pinconf-generic.h:16:
>> include/linux/pinctrl/machine.h:158:50: warning: declaration of 'struct device' will not be visible outside of this function [-Wvisibility]
     158 | extern int devm_pinctrl_register_mappings(struct device *dev,
         |                                                  ^
   1 warning generated.


vim +158 include/linux/pinctrl/machine.h

   155	
   156	extern int pinctrl_register_mappings(const struct pinctrl_map *map,
   157					     unsigned int num_maps);
 > 158	extern int devm_pinctrl_register_mappings(struct device *dev,
   159						  const struct pinctrl_map *map,
   160						  unsigned int num_maps);
   161	extern void pinctrl_unregister_mappings(const struct pinctrl_map *map);
   162	extern void pinctrl_provide_dummies(void);
   163	#else
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

