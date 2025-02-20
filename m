Return-Path: <linux-gpio+bounces-16326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1452AA3DF83
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 729487A9C07
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A1C200BA8;
	Thu, 20 Feb 2025 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0d33Cp7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CD81FF1B3;
	Thu, 20 Feb 2025 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066709; cv=none; b=Bqisw05aZBMQawkXA7DPBHwdm9fdlcH0uQFCIcwrL/bni/AKKkJlDPX3NqJINqAtm2VBVMwE6J23lI4uaAa2L08ftuik+quQR+j7xuT2BYHDifWPfm8vFYn1xXk7DtdA/zF3SU3jErOvhKsxoGINVOgZdznXY5//0Vvn4phpOfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066709; c=relaxed/simple;
	bh=feMzcpwBjTp17Xb4J1txFS9+ar+CDecWQnXd+IlpMyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH27u6jZuzA+Ec00mYG5xrZ1YiuxfBRhaGiCC9h+tgC2htG13mNssHkpmTzO+f655UQZfnbvAh/tL9zb8ISTCvF75+UdbMuuTwS681bGs+lxWU+mrFWMEgr/KjqIwee+ycYhbd7WxqIL8oD+3ft7x7X9szmMz2fRryt1g8UvkYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0d33Cp7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740066708; x=1771602708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=feMzcpwBjTp17Xb4J1txFS9+ar+CDecWQnXd+IlpMyM=;
  b=k0d33Cp7APpik2iMYwDKj3ZeGd/0rgoRZcvIXqX7V1HQCmfzhsaxjd2v
   veo1KraBRUCNdx8ap1Y8GvVoDaSDRVn9A+LcHqzQ3cH4tcMcpXFVV09aO
   r9FBM8YvXQZZJtPp5qKlCbvuSbKpW/hI4cKgBREbFIG2KHzUyDGtvGEFX
   sgqMRn+Oa7pgUzNDRtWIkMZeMVuGNUErZ++BtB+eRb1nEylpJq3LCJPnD
   UDSeVZooi64MAnxKwt1X12RjfOWDVKBvAQpz8IIotsczaktK2Wiv578Zu
   RvSPAbu9CetRaVxZclY838NdVt9DhmBwStBuQQ54NBvHEye5X+DvsXM8/
   Q==;
X-CSE-ConnectionGUID: I4qy+2u7SPeTsFwOVudziQ==
X-CSE-MsgGUID: jXzTDJo/SjS4WEzFkkNBzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40717904"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40717904"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:51:47 -0800
X-CSE-ConnectionGUID: POCzWv0eSkSgRGbmG19wdA==
X-CSE-MsgGUID: pNZ1xGTITdmYiJmYHq+mgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="114913486"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:51:46 -0800
Date: Thu, 20 Feb 2025 17:51:42 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 3/4] devres: Add devm_remove_action_optional() helper
Message-ID: <Z7dPjp4t0MrhulSt@black.fi.intel.com>
References: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
 <20250220141645.2694039-4-andriy.shevchenko@linux.intel.com>
 <Z7dKfwOrAuhuZvQt@black.fi.intel.com>
 <Z7dM6B-SFQ5Q77zy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7dM6B-SFQ5Q77zy@smile.fi.intel.com>

On Thu, Feb 20, 2025 at 05:40:24PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 05:30:07PM +0200, Raag Jadav wrote:
> > On Thu, Feb 20, 2025 at 03:44:59PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > > +/* Same as devm_remove_action(), but doesn't WARN() if action wasn't added before */
> > > +static inline
> > > +void devm_remove_action_optional(struct device *dev, void (*action)(void *), void *data)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = devm_remove_action_nowarn(dev, action, data);
> > > +	if (ret == -ENOENT)
> > > +		return;
> > > +
> > > +	WARN_ON(ret);
> > > +}
> > 
> > Trying to wrap my head around this one, can't the user simply do
> > 
> > 	if (devm_is_action_added())
> > 		devm_remove_action/_nowarn();
> 
> Hmm... Actually it sounds like a good point. I will check
> (and I like the idea of dropping this patch).

And perhaps

s/devm_is_action_added/devm_action_is_added

But whichever you think _is best_ ;)

Raag

