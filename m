Return-Path: <linux-gpio+bounces-28106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2F0C356FA
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 12:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C15485672FB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 11:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E373128D6;
	Wed,  5 Nov 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dy0D/IrY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FC83128B6;
	Wed,  5 Nov 2025 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762342815; cv=none; b=J0L4ElKHrGOBc+6BRGDIy0eW3MhvawO809EMGQMjg/ykGGhCMSicmD6CkSwbOuy1k27yHwiMSKJsOs3xGVh4JVu3XTN51ypE3X68jZWGnVFV3QKrKjnQ9s2uRtynqZKmN597RBRXnLyUky44R7OXVIFxF/fPSYamSdEN9leKWLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762342815; c=relaxed/simple;
	bh=J5jd0puVUAfWLqGEvwc7EkjWTKA9EkmzPRe/Umh4DwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXbuM7itszKNwRwEppkXD2KMmQN1Xd6lB1z9JxGZMGcVsQxgJgsTmXpFNWs82EI8cTVX2rlZ9lgP2jB/H/2YKNl8ytJgoTFh+wh31uW5LTq3UcR7PxNopXGel+kF8MGVI06M3GTv6oWd5h2l3bfS+siR6e+CinKYF5nDCy57ZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dy0D/IrY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762342814; x=1793878814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J5jd0puVUAfWLqGEvwc7EkjWTKA9EkmzPRe/Umh4DwE=;
  b=Dy0D/IrYxGCsGIKUtdCBshyKAJe661qabiTfdXYYvfbXBLYafCeOSdNo
   b4nVjgKLQ7kILoyYIDivsCYgNNHpmhCTYfxEmktg+dCHaURQa4NLI1o2+
   VzJctedcWLkt+8cQtUdnFovJoqOmcDrCzIWKBVqhZ84VzuZpXZXQvXde1
   yjpqvvm/agOwDm12pq4CUufToI0aiAuNC8Mrn/U7bIGOYip5YoI3WfyTU
   uDUGWeLjFEcm4pK5l5fTCTIctqb9CqzbonkFnUkCoyaUTVMaB/mUVvKil
   4KkBOCcr6vNkkZt8BLLbR+wER0J318G13+7aLQS5hQjFQH/z+vTJ5WYSp
   Q==;
X-CSE-ConnectionGUID: 7WPpBFQOR0qMfcIBwAfoMg==
X-CSE-MsgGUID: i3yeASUmRdmOBYVhbxisbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64554357"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64554357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 03:40:13 -0800
X-CSE-ConnectionGUID: ydchh+yDQ3KvfX8IWvuW9Q==
X-CSE-MsgGUID: aeqTmRixSzGhT2bUgChG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187593748"
Received: from ldmartin-desk2.corp.intel.com (HELO ashevche-desk.local) ([10.124.221.135])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 03:40:11 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vGbrz-00000005lHg-1qLE;
	Wed, 05 Nov 2025 13:40:07 +0200
Date: Wed, 5 Nov 2025 13:40:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 02/10] pinctrl: alderlake: Switch to INTEL_GPP() macro
Message-ID: <aQs3ls1rKgMOufOn@smile.fi.intel.com>
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
 <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>
 <20251105103122.GL2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105103122.GL2912318@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 05, 2025 at 11:31:22AM +0100, Mika Westerberg wrote:
> On Tue, Nov 04, 2025 at 03:56:36PM +0100, Andy Shevchenko wrote:
> > Replace custom macro with the recently defined INTEL_GPP().

...

> > -#define ADL_GPP(r, s, e, g)				\
> > -	{						\
> > -		.reg_num = (r),				\
> > -		.base = (s),				\
> > -		.size = ((e) - (s) + 1),		\
> > -		.gpio_base = (g),			\
> > -	}
> 
> I wonder if simply doing this:
> 
> #define ADL_GPP(r, s, e, g)	INTEL_GPP(r, s, e, g)

We can, but it will give a couple of lines in each driver still be left.
Do you think it's better?

> is better? Then the amount of changes are smaller.

-- 
With Best Regards,
Andy Shevchenko



