Return-Path: <linux-gpio+bounces-11622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E49A3DCA
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 14:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84A191F239EC
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 12:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC63F18028;
	Fri, 18 Oct 2024 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBl1NMlM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF4AD530;
	Fri, 18 Oct 2024 12:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253070; cv=none; b=I0snNK1Vspz7/+dwohuTbbgj66SQTIgo2WczAJiFssqdyJI/MG8A3yByWlpnk+6tC7bHV2yjMQ69hmY42obcOj+QDt+EDSjiYoHw68bpE4maKTXrZPAxbBVJtHVKYegGpJsLJZnOPP5W0kwxXDEMkWO0t18JINgbFcpn1KhO3Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253070; c=relaxed/simple;
	bh=YuKXHmMGBImdocY/xOUW7vNAe3C7UoDbaPaKfKneCUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neAHYY52ZzNBZDytYMNM0Hy/NS0h5O2Qocr4EOavg7mH99ipVzzKl4mWIBEnAR8OyvmQ0XihF+B0qNCwGzZWxsXsSb2Yq8ISAY5z4i1cMyGSEeGasoOOAvHRY3YbOCQU9+6spZib6RjcUCaxod0XaOiA9wVx6K2TPFCPCjbqRFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBl1NMlM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729253070; x=1760789070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YuKXHmMGBImdocY/xOUW7vNAe3C7UoDbaPaKfKneCUU=;
  b=QBl1NMlMekytWGlO+Y003cDxQOb54A/3jUbaTRzCErQ18pIDsJFeHgEG
   GtffRHzNC2iC22U3UxoXmK4IN8/vR+myhB8qPIC14ESqS+UCOtmiEaIrC
   czUM5awli3J/iT8oKbsfxaV+GoE123pNcKvjkLnY1FrHWGOIZvYKhRgFd
   EgZNJmG2NykR3V1zG6PoFQwo+S8LZ7EL8WhUY6bi3htEBZJlIABQ3xJ4i
   wvLgWO2Rx/sKejQpMHrAlQGye4876EonffZ1e/cxKK3T0kGgJ2yZ3ausB
   RThl6g62MrRn4j7fs7e9cOlFjlC4oLTSHnn8N9v8hBUiuYKydCfM0x5yW
   g==;
X-CSE-ConnectionGUID: qF+1wRYaTgunO2gutObipA==
X-CSE-MsgGUID: U/TzBEGjS2OdbT7m+iClgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28886715"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28886715"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 05:04:29 -0700
X-CSE-ConnectionGUID: SOkCtnF7SjOn8XMkKguWwA==
X-CSE-MsgGUID: jUf2WeY6QryxKZXZHoDB5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78455159"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2024 05:04:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 569E8256; Fri, 18 Oct 2024 15:04:25 +0300 (EEST)
Date: Fri, 18 Oct 2024 15:04:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: mmio: Support ngpios property
Message-ID: <ZxJOyVV7nWaNkeyb@black.fi.intel.com>
References: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org>
 <ZxJGxXNl29i8d_fA@black.fi.intel.com>
 <CACRpkdafFs-p6ikk7cfSWc6=C=8J6Gh+oe4TagAJh0EypWg3Og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdafFs-p6ikk7cfSWc6=C=8J6Gh+oe4TagAJh0EypWg3Og@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 18, 2024 at 01:49:40PM +0200, Linus Walleij wrote:
> On Fri, Oct 18, 2024 at 1:30 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> 
> > First one is why? What the *practical* issue you have? Can you elaborate
> > on that?
> 
> Sure, there are these hardwares that probe directly from the
> gpio-mmio driver:
> Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> properties:
>   compatible:
>     enum:
>       - brcm,bcm6345-gpio
>       - ni,169445-nand-gpio
>       - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> 
> The practical issue is (similar to what was responded to Rob
> in patch 2/2) that non-existing GPIOs will get exposed to userspace.
> 
> For patch 1/2 (adding the DT binding) it would be that without
> ngpios we do not model the hardware properly.
> 
> The objection "it makes no harm to register GPIO lines
> for all bits in the register" can likewise be raised to the
> other 28 (if I count correctly) GPIO drivers that use this
> property (git grep ngpios drivers/gpio) and I think the train left the
> station long ago to object to the property in general, people
> don't want to expose non-existing GPIOs to the GPIO
> framework.

Sorry that I likely wasn't clear enough. My question was if you really
experienced any bugs in practice. The above is the theory part and
I completely agree with.

> > Second one, is there any other way to avoid duplication of the code so
> > we have one place of the property parsing?
> >
> > For the background I have to mention this commit:
> > 55b2395e4e92 ("gpio: mmio: handle "ngpios" properly in bgpio_init()")
> 
> Oh well spotted! I completely missed the fact that we already
> added ngpios parsing elsewhere in the driver.
> 
> Bartosz, can you please drop patch 2/2?

> Patch 1/2 is needed however: it is just documenting the behaviour
> that is already implemented.

I'm not agianst this, the first patch is the correct advertisement.
My questioning was related solely to the second patch in the series.

-- 
With Best Regards,
Andy Shevchenko



