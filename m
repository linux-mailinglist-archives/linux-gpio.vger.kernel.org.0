Return-Path: <linux-gpio+bounces-31985-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDUZBNb3mGlyOgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31985-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 01:09:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DD16B825
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 01:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89C9D301FD55
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 00:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABD93C0C;
	Sat, 21 Feb 2026 00:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIAK9CjN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A38460
	for <linux-gpio@vger.kernel.org>; Sat, 21 Feb 2026 00:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771632592; cv=none; b=hCmracNzqD9Nj4rRgqpywOOyq30W3Rc1tdwmFj5NRN8kUWdPN87fmHRnIOd03gngnmnYlmKilsA36GkbY/sEZLmuKEcTQXtfR3EDPg/ZdZ1mtmddRkFXR5y60uWRCnixRs8WfW6/YxiwRrX/6gRPWKAYy6KIFqOTvLfT9FgL5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771632592; c=relaxed/simple;
	bh=8JNOX9dWuFwDz+EmMsHW8yfFbSy5aoeUIhaCQe4LJiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezuNL/03+hA/Ksnsx8RAxrcySwOrRIVC/4mdcKW0A+e37S35ACyQlBOKOF4CHwGX1Xm9wIkpfsmzRb3RsS4EaQ98Iv6KsXrHCYlPi+EBwnb/DpX5RbvMBch2qUhBIslZP9Ty4gsPpXjMIyllyYpFGPD3AcPvOf92TzSngOmg01U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIAK9CjN; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2baa6ec5638so1230921eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 16:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771632590; x=1772237390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3SZ9VJ/eluyKCRvTt3Ztw07OUgb5OwU6SNdkdl2r0CY=;
        b=RIAK9CjN+n058lN37QCxcczi465WJgp9jMXPBDZawoIJ90S+2qP/a6CjpfF8X1f+AP
         JW2DVpdUzw44+zESbA/kDrMUAfbDUv0ytNfDGoY0bxmmo7Xlb36jFwOyfIXq0qEQnO2e
         XxfRaUpfVET+3xLdC/oB4EHvBMKh+tnWwtvRB/GJIzam/YeaFDJbfGeEd7gyX0dFyoLw
         +oG6YJ+AD3o4WuihuwpeHuKXCp3fJwZJIwlHssmtgu70wUwjEal7J4Y4CS24ldrW1tCG
         cb6ltDF1voGiTYWfw73Vv6pfHisC3mzZ6QpJQ9n+pORbNblHO55J9uArvjEsCLIpzojG
         LoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771632590; x=1772237390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SZ9VJ/eluyKCRvTt3Ztw07OUgb5OwU6SNdkdl2r0CY=;
        b=qKi67NwXd0k+PnM0+N+14/67k8bIMvuAPtMv0MGbncEeoLY+heH8EMPBrhYOTSwc6U
         HBIhISVU54EZkJ0ZoJ0362SITBzBnnHhxoFpBpM/TFErN6+pUfx4Jwy3eDJDzRYa2kmG
         8HBzXzj7/UJoHnudqoVitFiLVMkLM2qUWN0pjDvfi2wPqnvaej5VPus7kOX3iMuzIuzz
         WY4ztEVOTqadRnBBMgNlddPteLncJhqTosELxdbLL3fvtJdazYuQj8FbwjaMHOlLCt8b
         uFla0TiaIbLEXpWiE3tSzR4dOJWxMD6MhEcKCbFNWTtTcbq7f1Gl7ZlrkCiUo77d8O9D
         jS1A==
X-Forwarded-Encrypted: i=1; AJvYcCVjeede2VjvTEHqf4GimlPwi1GKbj1+KyNjbER9mFCkTmrk9cx/g6CAZoQgIRGSSdZeVLz6NIrVAiUd@vger.kernel.org
X-Gm-Message-State: AOJu0YyrZEeMR20S0523stSVJy5JhW7mAJcm2JaQoJmDhJHDjDpsh5TZ
	f78kxOsdxYC0ShwTHEaNhP7njJ1FgFQwAVi5bkuzHiITbQrpqoUaCQwT
X-Gm-Gg: AZuq6aJQmazFJDT09FNq9XcHIJBRCVXfBWtlb9iMOAvvxsBi8IHISRc4zXDdcKsAbAT
	oOOI3RwYaaIHLIHmZHaQx9qarP1WonzBUZj0PguVsh0fRZsOjboZzQIKPwD4maqKSXRMusMizU8
	Hmc8GHiZtJeTX3FM10FC66Voo/OkPnD+L00XOf/AtokIRa+gSFTYRGY6rvpZw94VUfJKdes8iZ4
	dn/qHBSKnSqVVUr+5lKXcbcej9AHz/b7Tz7kB/H8yEtd6dPAfzLj1Z/dHWVlR1u4ydlEKzRuAJb
	oq2ED3sLSdH+oamqlF1zGwmiBHzQiFcNBFd2V6XTn0+Xam7rF0kDJpJWMsdzDTRQ25Y4JnbcHTh
	VQPmPwqkXhbYjFjG7Mc1K1LYxS8yTqXAdd6iCN64qlvduSyxCFTm7RS0OjzA5LFR5c7npM9A7vR
	KMBBzhA0r7kkgiEeEERxOhfQUgUnRP7QQRZO7nPFP6vRljj0l15j7Ymgj0RhF6NPVw
X-Received: by 2002:a05:693c:3009:b0:2ba:7b2a:6a5f with SMTP id 5a478bee46e88-2bd6076dbb8mr2561244eec.8.1771632590304;
        Fri, 20 Feb 2026 16:09:50 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:30e0:64af:2b48:14be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc35362sm408486eec.30.2026.02.20.16.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 16:09:49 -0800 (PST)
Date: Fri, 20 Feb 2026 16:09:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: adc: ti-ads7950: complete conversion to
 using managed resources
Message-ID: <aZj3deh1Em1rz3au@google.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-5-dmitry.torokhov@gmail.com>
 <aZbC51ezuaT5Nwq7@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZbC51ezuaT5Nwq7@smile.fi.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31985-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 625DD16B825
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 09:59:35AM +0200, Andy Shevchenko wrote:
> On Wed, Feb 18, 2026 at 06:29:28PM -0800, Dmitry Torokhov wrote:
> > All resources that the driver needs have managed API now. Switch to
> > using them to make code clearer and drop ti_ads7950_remove().
> 
> ...
> 
> >  static int ti_ads7950_probe(struct spi_device *spi)
> >  {
> >  	struct ti_ads7950_state *st;
> >  	struct iio_dev *indio_dev;
> >  	const struct ti_ads7950_chip_info *info;
> > -	int ret;
> > +	int error;
> 
> Unrelated change.
> 
> ...
> 
> >  	spi->bits_per_word = 16;
> >  	spi->mode |= SPI_CS_WORD;
> > -	ret = spi_setup(spi);
> > -	if (ret < 0) {
> > +	error = spi_setup(spi);
> > +	if (error) {
> >  		dev_err(&spi->dev, "Error in spi setup\n");
> > -		return ret;
> > +		return error;
> >  	}
> 
> Ditto.
> 
> And since there is already dev_err_probe() in use, I would expect this
> also be converted.

But that would be unrelated change ;)

> 
> Would be also nice to use
> 
> 	struct device *dev = &spi->dev;
> 
> to make less LoCs and/or make them shorter.

I actually dislike introducing such temporaries in majority of the
cases. It makes it hard to follow what device we are dealing with and
does not make the code significantly shorter.

Thanks.

-- 
Dmitry

