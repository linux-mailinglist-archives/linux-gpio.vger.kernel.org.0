Return-Path: <linux-gpio+bounces-16561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A3A440B0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8648816F93B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 13:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A227B2690D7;
	Tue, 25 Feb 2025 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMg69KTr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A2E20AF88;
	Tue, 25 Feb 2025 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489769; cv=none; b=dGEjr2+Xf58UIIa3LVnkmmfNXXvBq9q3Lf7vxvCX88ySnv5r/AG5sjD6U9HGZhVZ9ZoEcFaKm5yUWjSG1u6GbpOXqeiC3rKvoIVl43wwl/FSbPAdjn4Rjp5YvjOL1WS7Mg8Sej8wXnS7zEteDTFUbVSlc+QSYVkHHel8hGgmkJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489769; c=relaxed/simple;
	bh=UoiVOx1b8rnP0FvyFqGap/alvqgZOMeRzeWBcknZicc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js1nKhO2BI3G3/xuz1UDvN2TpOp+Wk6gOqxpkzQog0fo9IkQ/0u4Ed+8Z+X79ak39A0nGq/Xv6y/wabsGeB42cpGCMiAk2a+deQDzWjBQLo9hUe+E4Eksr44izg5YlcQvyAnRgtnSW2u7Djjuhen+9+sMnkNgSYyyrdtuqjwJZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMg69KTr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740489768; x=1772025768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UoiVOx1b8rnP0FvyFqGap/alvqgZOMeRzeWBcknZicc=;
  b=SMg69KTrPccyIODVtNZhXjc/MfKewDLOzINhH3Q37JqorMVvZpDghpcz
   5O6UXHD9I3gPcCCP5FHUaRWAOzvyFOqkfgcTHvzCfJ29FP/pwCj8ZaPFv
   G5DypU2pkcy6jxx1woVe4Uy8iUg2a/1+lPSNHrf7l1WwfnbVnWCH5PAHo
   jwkRP9+EkZLcOqmaw7o6Lr0eiehgrOSR/DLSZ+se3oVQxMCjtHfN/4QZF
   /ae53d4UpTxR18dD2C5hVYfasnLfNaJxGVPOqEaAzKT7kFGfnTcBNcVJP
   vubR488kId7EZ+auy2zxbXwvn+doo7R82ai4DDlPk1nSbFSIVoYblg/j3
   Q==;
X-CSE-ConnectionGUID: DfSR94mmTzOQcGiy2mFyGA==
X-CSE-MsgGUID: ob/bPNRjQGSpqhdOEWHTsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="28883383"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="28883383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 05:22:47 -0800
X-CSE-ConnectionGUID: ZZ2EaccyTaOse2uJWGd/uQ==
X-CSE-MsgGUID: AfHGsz9vRGS50a3C/2AJCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121637608"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 05:22:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmutW-0000000F0CC-1vsV;
	Tue, 25 Feb 2025 15:22:42 +0200
Date: Tue, 25 Feb 2025 15:22:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] gpiolib: don't use gpiochip_get_direction() when
 registering a chip
Message-ID: <Z73EIu0AqnfPU33k@smile.fi.intel.com>
References: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
 <20250225-retval-fixes-v1-1-078c4c98517a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-retval-fixes-v1-1-078c4c98517a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 12:56:23PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> During chip registration we should neither check the return value of
> gc->get_direction() nor hold the SRCU lock when calling it. The former
> is because pin controllers may have pins set to alternate functions and
> return errors from their get_direction() callbacks. That's alright - we
> should default to the safe INPUT state and not bail-out. The latter is
> not needed because we haven't registered the chip yet so there's nothing
> to protect against dynamic removal. In fact: we currently hit a lockdep
> splat. Revert to calling the gc->get_direction() callback directly not
> not checking its value.

...

I think the below code deserves a commit (as a summary of the above commit
message).

> +		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index))
> +			assign_bit(FLAG_IS_OUT, &desc->flags,
> +				   !gc->get_direction(gc, desc_index));
> +		else
>  			assign_bit(FLAG_IS_OUT,
>  				   &desc->flags, !gc->direction_input);

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



