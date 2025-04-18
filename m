Return-Path: <linux-gpio+bounces-19066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55746A93F8D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 23:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D17118943B6
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 21:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE81F1DE8AB;
	Fri, 18 Apr 2025 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIyb2tme"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D3F1B6CE0;
	Fri, 18 Apr 2025 21:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745012783; cv=none; b=AO1BVAwFv2nAdyIwB3iB2o1tIo3q7WFpoISSdzHymR0PHv5PRXrJf1u3fzH2MIR4ET+7BjU9Ws8wjfIJVfMPKzXFTy/UameA+0lvbosoVY+kVlJHB2WK1senrB2Ys3ytvd7bSsmgrc59GmfPaTJvk0fxvx93ro9ZH03U3m8zKVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745012783; c=relaxed/simple;
	bh=fmCsXk7y5szHT5yJ0Lq50pQ9D6XaiVEY7elkb68QLWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HS9ZU7QOEWhO/vn2gXyYZMiCCXPSRxFIXk28fgCvs1a+kz3SDLt+yVcupiccSTg0LFImIzxkDBSS3qUN1tNdvMNS/QrHZrSjXCFf49E7eL00f9egmpr771KgazN34m+mjSHgWmOlpR/TG/OicsAg/PknYO8gTSK6LiXS0IyvdYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIyb2tme; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745012782; x=1776548782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fmCsXk7y5szHT5yJ0Lq50pQ9D6XaiVEY7elkb68QLWg=;
  b=dIyb2tmeUuwulNrF+GUiE9aNWlqa3rmMIb3nqdWs9aHUWhUYMvG8WGPZ
   wsD51XIAm5JWvCIjkJa+dyjXn2KU3x2T6Uk0Mm1/NHyA6sssy5i7HUJvJ
   CqmD0jPgwqOpS2wHbTB89MuXCJ11VrtBbWsQryYQkVSCy+fbYFpkOEmmB
   O+QuvhsDPCtzR/t0HsbhMIvjxJelu2qWJouvGMTlEqZiWK4vs8yA+R7oM
   fJMbji3tXHBqdePygrl2cqwEFyrsbI6Lci2L19QWlGmi1jq5+mlcdL7X4
   54dWvU3emQNJsNK4aAdUVqeDFXmGexUhv9JTqcV2hJCJNZa+Xl/Tk1B3C
   Q==;
X-CSE-ConnectionGUID: WR0ynxH1SeSbtuh5ma2eGg==
X-CSE-MsgGUID: 2ibZsJV7QSqT88ozQGlNQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50477564"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="50477564"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 14:46:21 -0700
X-CSE-ConnectionGUID: MU8ipCgFTsqKOVeJ4kZHmQ==
X-CSE-MsgGUID: vr2uNh9RTCmn0ig2BB4qfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="131162518"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Apr 2025 14:46:17 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5tXL-0003M9-0Y;
	Fri, 18 Apr 2025 21:46:15 +0000
Date: Sat, 19 Apr 2025 05:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw,
	Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v3 10/10] pinctrl: Add pin controller driver for AAEON UP
 boards
Message-ID: <202504190519.GwvdasH8-lkp@intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richard/gpiolib-add-support-to-register-sparse-pin-range/20250416-221852
base:   8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
patch link:    https://lore.kernel.org/r/20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee%40bootlin.com
patch subject: [PATCH v3 10/10] pinctrl: Add pin controller driver for AAEON UP boards
config: x86_64-kismet-CONFIG_GPIO_AGGREGATOR-CONFIG_PINCTRL_UPBOARD-0-0 (https://download.01.org/0day-ci/archive/20250419/202504190519.GwvdasH8-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250419/202504190519.GwvdasH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190519.GwvdasH8-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_AGGREGATOR when selected by PINCTRL_UPBOARD
   WARNING: unmet direct dependencies detected for GPIO_AGGREGATOR
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_UPBOARD [=y] && PINCTRL [=y] && MFD_UPBOARD_FPGA [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

