Return-Path: <linux-gpio+bounces-31845-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMVRBfTClmnjmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31845-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 08:59:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72615CE23
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 08:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CDB13012BFB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 07:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3395334C1B;
	Thu, 19 Feb 2026 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciFJDFis"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC48A3346B9;
	Thu, 19 Feb 2026 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487982; cv=none; b=o2RQEu4wNTZH2LdNKHokrm0caPSPz2OUkru+BrlO8f93OdcwZa/K2+PjCk56/FUYNKimqw1xV34HrJMfaJU0XhW4Lmlu97DvmEL5PfAWX0XwxNaeO/u6iIpxAzxfB9ja5OYOJ8G3+IiEMoMYnHv3pt+aHWwjApxOj1ZttagTDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487982; c=relaxed/simple;
	bh=mZm4VJcodKIIqeKeaFS7O0V2wECtqxpt0Yy41mVqZcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAV9NHujlPl+vPKQviSOeOEuSNJ0axJ168y8SP86Ejmd666k0Oi5mNKHLNiXf/ooCoK7p85gOPtwZBfx9hd4cfCWMgsIM9scrynj2FU2TocYoZUmyh7jPqeDhhdvswR78Au/TI5uqMDCDeMbmYIUV5iDhovYlCkSZftu6AbWiO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ciFJDFis; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771487981; x=1803023981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mZm4VJcodKIIqeKeaFS7O0V2wECtqxpt0Yy41mVqZcc=;
  b=ciFJDFishRXtfp/E/R1zpduzZlvdf9PJlGR3yczp7TLFlwoscFpSiPGn
   quMCCN+6sua+zP/gT9MJrtAmSWDj+3Ri3sN3pjiA6FISxrY6PJfaT/SFH
   fNWIhpVcoL8T2t8Ra/i3PYY77BCDEhjjByMePrJLNuXeBCeVG17kSLLUE
   gBbm8dO8VRS1afTayOMmkBdkskJsl7tQ0jD94r+TTydFsks2k7UX8ujn1
   cDIz4aKWLQJwuUxWh7UoUosiUNATYYQSALVtKZ7tYTabvNex6t8yAbwC7
   jpr6Ks7BhiwEK0MAzsFvLsJ+7bLYPNGbAsRR6Op6lVeqnP6N74ogbsBMP
   A==;
X-CSE-ConnectionGUID: Shk6SiXrSfqg82rpvJP91A==
X-CSE-MsgGUID: TDIcpi5US2enzzXSUn1wwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76430835"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="76430835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:59:40 -0800
X-CSE-ConnectionGUID: hUfoHs/HQSS7t1M2NiWQ2w==
X-CSE-MsgGUID: jE0yNs6zRrCFNw/M8fmxuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212418427"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:59:38 -0800
Date: Thu, 19 Feb 2026 09:59:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: adc: ti-ads7950: complete conversion to
 using managed resources
Message-ID: <aZbC51ezuaT5Nwq7@smile.fi.intel.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-5-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219022929.3558081-5-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31845-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 7D72615CE23
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:29:28PM -0800, Dmitry Torokhov wrote:
> All resources that the driver needs have managed API now. Switch to
> using them to make code clearer and drop ti_ads7950_remove().

...

>  static int ti_ads7950_probe(struct spi_device *spi)
>  {
>  	struct ti_ads7950_state *st;
>  	struct iio_dev *indio_dev;
>  	const struct ti_ads7950_chip_info *info;
> -	int ret;
> +	int error;

Unrelated change.

...

>  	spi->bits_per_word = 16;
>  	spi->mode |= SPI_CS_WORD;
> -	ret = spi_setup(spi);
> -	if (ret < 0) {
> +	error = spi_setup(spi);
> +	if (error) {
>  		dev_err(&spi->dev, "Error in spi setup\n");
> -		return ret;
> +		return error;
>  	}

Ditto.

And since there is already dev_err_probe() in use, I would expect this
also be converted.

Would be also nice to use

	struct device *dev = &spi->dev;

to make less LoCs and/or make them shorter.

-- 
With Best Regards,
Andy Shevchenko



