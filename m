Return-Path: <linux-gpio+bounces-17738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD8A67563
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 14:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D5433A7B9B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 13:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6842420D4EF;
	Tue, 18 Mar 2025 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYjgZU31"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555020B21A;
	Tue, 18 Mar 2025 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742305352; cv=none; b=eePKmM2WR6kz8sRDNIp0rnyZ4QVBRs/eH0j2l0ShiVIpwIoxaCYTs+RdV/xuhgrLVMSM18n2Tve8LFvx/kJAOI3/bUMH88QltI62qai5IIv8kj91ULtN7jII/TbI9yYjzU/4HQeVoB/cadRV8oU8DmsJGYAfhs3zoGf4A1+oH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742305352; c=relaxed/simple;
	bh=y3YYBQxE6Pi8b1Gs2Cz7fhOvcqgaZix7CEOA616y3t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1KtlmkvtoHf/OK3c2lPndnVCsQYHTviLLY7oDe2ke5PMeTNPD0BlqGq0DT5VyxvAUOWP/EBCGigbxA1zhf3xb3RTOCm8n+G+5OrHVetwlz4o37MwQO27MCC+xaBabIOieHcKVARID3fu20KeK/kzSMfSmoZBHBtiIk3vTrSgjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYjgZU31; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742305350; x=1773841350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y3YYBQxE6Pi8b1Gs2Cz7fhOvcqgaZix7CEOA616y3t4=;
  b=WYjgZU31gvMUrrJfTkRefc694uQEJSq2jN5g0IVXk5zYrbYPQJjV40Ql
   +UZrkUhYknotEXS0U/DKHIkCkCzS5b+T6tnZkFpBHT0AdCncjMjAtd4Z0
   LhAS2eX2qNxmL/aGUyTHPWrHHn2mh74C00G3bxX03Fro6HRDKrh/6A6ZB
   4obIW/IevTGfhl/Ws7HEAAjq1YHPwPeBbYsVbsvQul2fow5IcqSxoJsEi
   PaN7XRI0OrDdxA70F6SqzfvpomLVLUw20T14j4VKnLNFyHj0CXAqJ70g6
   T9CA60mZwh8ZFGtyeknt4y1d/VRWZU8idB5SakiET4Yt86ZM/WmDhWqwD
   Q==;
X-CSE-ConnectionGUID: Rzm2rj51QBSx9mD/dai94w==
X-CSE-MsgGUID: 4h8Jz5UtRpKsDRFQajVOCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43583214"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="43583214"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 06:42:30 -0700
X-CSE-ConnectionGUID: 3HJ57cDLSzeglBHIN89uNw==
X-CSE-MsgGUID: M7wA4lfnTFS8UnrypWJmdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="126934731"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 06:42:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tuXD6-00000003dNM-3I7m;
	Tue, 18 Mar 2025 15:42:24 +0200
Date: Tue, 18 Mar 2025 15:42:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"brgl@bgdev.pl" <brgl@bgdev.pl>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
Message-ID: <Z9l4QBJQkOaMxw73@smile.fi.intel.com>
References: <20250318052709.1731747-1-peng.fan@oss.nxp.com>
 <Z9lJETLh2y27934q@black.fi.intel.com>
 <PAXPR04MB8459A44864B9213E8265137188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459A44864B9213E8265137188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 18, 2025 at 12:38:15PM +0000, Peng Fan wrote:

...

> > Also the commit message doesn't tell anything about the existing DTS
> > files.
> > Do we have this device described in any in the kernel? Do we have any
> > googled examples? Why I'm asking because often the issue is the
> > incorrect setting of the polarity, which needs to be carefully checked,
> > esp. for the voltage regulators case.
> 
> Under arch/arm/boot/dts/samsung/, a few dtsi files have the property 
> with results from output of
> `grep "s5m8767" ./arch/arm/boot/dts/samsung/ -rn | grep gpios`

Side note: `git grep -n s5m8767` is a better command. You can just look for the
exact GPIOs, usually not so bit amount of them, or do it recursively with

`git grep -n 'gpios' -- $(git grep -lw s5m8767 -- Documentation/devicetree/bindings)`

> Exynos5250-spring.dts uses GPIO_ACTIVE_LOW.
> Others use GPIO_ACTIVE_HIGH.

So, one of this needs to be fixed.

> The current changing to using GPIO descriptors should be ok per
> my understanding.
> 
> Not able to find any public datasheet for this pmic (:

-- 
With Best Regards,
Andy Shevchenko



