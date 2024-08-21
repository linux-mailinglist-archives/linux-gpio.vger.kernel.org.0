Return-Path: <linux-gpio+bounces-8961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913095A628
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 22:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B6A91F22DC1
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 20:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7071F17557E;
	Wed, 21 Aug 2024 20:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gExxcCdC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E9F171066;
	Wed, 21 Aug 2024 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724273527; cv=none; b=gK42gFN48DFEdUzxp+oshKEyLWJf/GgckZre5hwqxDLxeNvuYHm7rM6ClpcmxIULJpyG/X/9cay1CZw4owb/3Flzr0ReDt0Q1tQcS4Pgz/l0ARdupk7w/GOPIRkYnys5SU2Mj9LXF4iOSDOCMUk+kowVXPrsRr+ebueD1/XFVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724273527; c=relaxed/simple;
	bh=6e2c5JLkwBMMGTKbRXK3+M8VerZRofzI60m1UqV9C/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myfVzBOXYYRIYX7l1jqY3wv2EMbK3H0kBVQm1A7FLRX+qnbGsXnGsGuNHjnXeGSA76jFHIX1zcqpC4htjHxhrVzQYy2QgECImvcYkRsnV62Yz3t8vAlbAipOgoEOdWB7daTDHZDbKlwMX8Ev7A6Bf/1fZfokI/uRX6Wgo6y+RVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gExxcCdC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724273526; x=1755809526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6e2c5JLkwBMMGTKbRXK3+M8VerZRofzI60m1UqV9C/Q=;
  b=gExxcCdCKp1FWRSRbgcilmA9IKdukfn2FHCOoZHyZn9T9x893xF7q/BE
   El4Q+wdSxUVBN9TPt5s5QSOx4QVwLf7FYL08kzeG+5sQaHgM/pyiRhgeG
   XWz5UlESd6Xfik05YwaZtX4mhjDax73TA0zzGCGDP2yinyjb3mbftx7JQ
   vZfLo5hMeLAXcKWxA79/safI8PLbK5mm0BtYfaae3AOgrYmzichDFLpxm
   LuzMXQtnGPHzPRN02avbRpEHHDfuHnwv86Y3pJKH+o7+9ELZMykcOYqXG
   tZyvpAmRHMT5+PGmL50cGpApBkEnakRXHR9k2Jxz+C3+hEAa3ivllQXpa
   Q==;
X-CSE-ConnectionGUID: /kvwVei4SL+h/aXHr05pUw==
X-CSE-MsgGUID: /Gt4Xgy5QNy+rRbp98KUnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22793062"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="22793062"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 13:52:05 -0700
X-CSE-ConnectionGUID: do6MGcCmRxGW2lZUIvdzow==
X-CSE-MsgGUID: RItIqPNqQ7+QPHo7Qo5A6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="61235486"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Aug 2024 13:51:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgsJA-000Bwt-1j;
	Wed, 21 Aug 2024 20:51:56 +0000
Date: Thu, 22 Aug 2024 04:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <202408220406.czlwSpkP-lkp@intel.com>
References: <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20240821-023901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/eb39a5f3cefff2a1240a18a255dac090af16f223.1724159867.git.andrea.porta%40suse.com
patch subject: [PATCH 07/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
config: powerpc64-randconfig-r123-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220406.czlwSpkP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408220406.czlwSpkP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220406.czlwSpkP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-rp1.c:191:30: sparse: sparse: symbol 'rp1_iobanks' was not declared. Should it be static?

vim +/rp1_iobanks +191 drivers/pinctrl/pinctrl-rp1.c

   190	
 > 191	const struct rp1_iobank_desc rp1_iobanks[RP1_NUM_BANKS] = {
   192		/*         gpio   inte    ints     rio    pads */
   193		{  0, 28, 0x0000, 0x011c, 0x0124, 0x0000, 0x0004 },
   194		{ 28,  6, 0x4000, 0x411c, 0x4124, 0x4000, 0x4004 },
   195		{ 34, 20, 0x8000, 0x811c, 0x8124, 0x8000, 0x8004 },
   196	};
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

