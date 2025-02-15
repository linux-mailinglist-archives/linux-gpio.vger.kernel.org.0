Return-Path: <linux-gpio+bounces-16057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB0A36AAD
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 02:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8A6716A711
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 01:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97C474BE1;
	Sat, 15 Feb 2025 01:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMXHNTG/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A34911187;
	Sat, 15 Feb 2025 01:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739582025; cv=none; b=awDEbnjIC8HNmJIcqbrw+F/vkOm+FkPPVOMIf1QBpf5t8ks/WsECGpDzlNFEIlWo0G23qjM9cT2xFE05k5LwP8azyZe496fp1MhS9xTHQsvkP74PAeThht4YkpkIJFwjT+MXZ6r7vY60sgsSzllmcU/DPsbOLoGU1i1nycuGc44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739582025; c=relaxed/simple;
	bh=WRCtZXjO6Wvl3SDyjYTihILfLHQlQU18HhuRJvAJYEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2AbjQuT6Dk/9C19GSRySJA++4B1ca1F/xhsvIB+7nPiT0R2295AfjIpFafv6EoGMCxFC7+lNbDqOCG3IQRBCzZYqzQ7une9XUnqoFPfsC7RLDoRBeZ9x7bI3JlNCeczqRNCt3jKHIcHeR87DFTwKHu+PaDuLw4rQWjPpzdzIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMXHNTG/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739582023; x=1771118023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WRCtZXjO6Wvl3SDyjYTihILfLHQlQU18HhuRJvAJYEc=;
  b=EMXHNTG/YaLeiAZxYmBbGeIGGwEnAMLIFo75Nf/rWQHPubR7fr0bB9kX
   15dzsf6w/Mbk6EHy0A6QZAnuAsxD8/+hgc9aoV5crWoKoMYsg0KTkoY+h
   jPlLhMnoBUfFpTwpQs5P/hKAGytadz3gH3Put16HB8ul/DYDxBKNWTF3d
   yqnLZdHEguxZVvD/TMRPc+/eAdeCh9+MERgPUEV1hmYgcrplv0EI0Sfrs
   nmy/1ntPWEZObCy6qd0o3jAVFYO37/90SOX+Tbbp/MyCDKYc5las5ceLS
   /h19XnejKagNuf5YJehCq4FXZk0L7RZOS3LxNNM899Y75yYOUO+XBfHmw
   A==;
X-CSE-ConnectionGUID: 58WddrJhR8+lRd3BXW/Shg==
X-CSE-MsgGUID: rf4lZmH0STiXjkXRcgp0QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39575182"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="39575182"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 17:13:42 -0800
X-CSE-ConnectionGUID: enkUg1f+SUGU47QDEBs55g==
X-CSE-MsgGUID: BklhlydLS5ShgQeqQP7G7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="113580628"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Feb 2025 17:13:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj6kU-001ANT-0D;
	Sat, 15 Feb 2025 01:13:38 +0000
Date: Sat, 15 Feb 2025 09:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kim Seer Paller <kimseer.paller@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kim Seer Paller <kimseer.paller@analog.com>
Subject: Re: [PATCH v2 2/2] gpio: gpio-adg1414: New driver
Message-ID: <202502150933.vtaQAJRw-lkp@intel.com>
References: <20250213-for_upstream-v2-2-ec4eff3b3cd5@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-for_upstream-v2-2-ec4eff3b3cd5@analog.com>

Hi Kim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4dc1d1bec89864d8076e5ab314f86f46442bfb02]

url:    https://github.com/intel-lab-lkp/linux/commits/Kim-Seer-Paller/dt-bindings-gpio-add-adg1414/20250213-211900
base:   4dc1d1bec89864d8076e5ab314f86f46442bfb02
patch link:    https://lore.kernel.org/r/20250213-for_upstream-v2-2-ec4eff3b3cd5%40analog.com
patch subject: [PATCH v2 2/2] gpio: gpio-adg1414: New driver
config: alpha-randconfig-r132-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150933.vtaQAJRw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250215/202502150933.vtaQAJRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150933.vtaQAJRw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-adg1414.c:68:31: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpio/gpio-adg1414.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +68 drivers/gpio/gpio-adg1414.c

    54	
    55	static void adg1414_set(struct gpio_chip *chip, unsigned int offset, int value)
    56	{
    57		struct adg1414_state *st = gpiochip_get_data(chip);
    58	
    59		guard(mutex)(&st->lock);
    60	
    61		if (value)
    62			st->buf |= BIT(offset);
    63		else
    64			st->buf &= ~BIT(offset);
    65	
    66		st->tx = cpu_to_be32(st->buf << (32 - st->chip.ngpio));
    67	
  > 68		adg1414_spi_write(st, 0, st->chip.ngpio / 8);
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

