Return-Path: <linux-gpio+bounces-29266-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA972CA585F
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 22:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3C6D30E5438
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 21:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590BE32825F;
	Thu,  4 Dec 2025 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBK+xs3V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658182FBE1D
	for <linux-gpio@vger.kernel.org>; Thu,  4 Dec 2025 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764884277; cv=none; b=NAikC//5IF6jNWRA1U/pMKyI87AIFFKLSXqA93HDuFlHQHzMdrveDwNrW0sqb4DqpIhp8p4X1oLVhI0TczmpQxwcsHbfbm7vEQQsiXvIZYLtfwPRVjokp+rNBZpUwr0a0gufU+yIRrXtwvPkF3KXcXCR60Lgosus/Ikv9OpwLEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764884277; c=relaxed/simple;
	bh=uOBIZPbNnTK2TyMn+Qt+8ibmNo7q5NH/kRQ0c60vEYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRW7YpQVJdgQBkYMYs6eMgA4cwANOCTolfB/Sxc2eYA6R02CHGpz9Vrs+LhkjmeDmYOaJguxsWhj81nP7jnhCXgKtGcoYYmnky0re47XqM4izJ0xD/ouZ1qMmU3uXkJ26y9bizl4zCSN32I0ByMXX+igG2drK7VxRBgFGwU0oUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBK+xs3V; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47790b080e4so9157005e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Dec 2025 13:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764884274; x=1765489074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kX3mMRrFbAjohQBvgqezEuqHsK2rsOscWARuF1fpuN8=;
        b=ZBK+xs3VLMabz7rviNYa8FTGMNHdLXrVKPiZtZq9f2vyAnK4Ip8aLcBJRnWuakdUvw
         VcnFJ00mIMjcxqn59s5+XGQwBzGFouP5a//mWp4W7MbPEsuN3ZG9RoG8YlZ5aCwqgYu5
         j780tWEGy9wZF6dER7nT5i0n0CeQ4z1p2whJVdStCY9JC0fjKEaYiFQkRQGhBKODxdUs
         L+z62qUL1teSAOjORZftLp6img3ycKgAH+3jECsq2iMUmJ+2SK+noDjvDIfDko87xlzg
         DEPdkzxcpTj78ZC7tTTcOvlJgFAKHulb4z0hdYrQWDFEGbCa3WrqKVDfLOBIihn3uvaM
         GyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764884274; x=1765489074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX3mMRrFbAjohQBvgqezEuqHsK2rsOscWARuF1fpuN8=;
        b=wCIijHgbyzMNiZ6mRX82itURDvN06qnJP8RWVFAAR/NV1GuXHl+Z+Bd7CX/EfTW48b
         3l+bLehjNEyR+vm8+r2JP1TxajvPifmco4qCz88rGJ6djhJ2Qny1UljjWqVTCXDBGX2x
         c3F43lZedUr/FkqtLTbKL4JsCgi44ikPhQFEFJai3WFPEPcdpjk97XN9PQjCLSxXqPKk
         LZd6u1hqslynyxmQk0/pQRcJWZHYp+8mab+C45YruSUlh09rshWqsqJfbCiqMFZcGQy5
         wM+l7HxAzHJElTMppo6w93cQ7qle0TEG5a3RZZ0tsmcUPzMLrrfOGtASfVr2GyIzCmDe
         NbRg==
X-Forwarded-Encrypted: i=1; AJvYcCXuy9kOC8+0nKtsg+63zrJ4TZwOCC+2S1ptkepEjEiUzv4y8duHtv03yeFanpIeRD4DwaPc7MoGvITM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf8fV67/oJ6SbmUrDp1btf+TJksMnuAqPIPE8S3zkq1vlRgvve
	MSXySdq4aIezObsnzrjzXtOUJIkiGehSzCgS8qzTvCVXOuywxecRi/bI
X-Gm-Gg: ASbGnct3vfTOrwML7nLwGE4nfCoCXSxgLnOE/mvt26oRQw3viKG/8ycmBmzs+jZK/MF
	clnmNjMqnghoJEbmcb9byhOc8Hej/V0/uLb527EEOZPSIbRQYWs5MpDFq/phTN0xQvH0ah8JvDL
	DWL+rLGSpRuZ1ED8xGv0NoVAk66GWWzsLNpUeQyzokCyYf+YKVbj5Hc7LOhtqWlHzAPG4SyggaF
	55ToyOCsbobrnshGS1sp8NNZNW8aetMjpW7aSfLwqClympA4ToOR6guNrKwCGCnQdmDSG0J5KGq
	EFos3e3Tnq0i/ztii6kzhOiM8O/QDH0mP34MgxAMli5AF0D204eVVAu7bgEzopezhqTDczTJTRE
	EByIRRsnODpBWvmAeoO8/yfEfZU52L2K54O8iTM9BK1YF8Q/dRRJMARuNmgbk8fmgYNh2Y7rWKb
	+8wz52DifbqM0DX4HKyMS6d9qR+1x1fsCIAueUs4jOe1yR9gi8bZjpQMwRCHvDI2gMICE=
X-Google-Smtp-Source: AGHT+IG6rSVkcOEF9Z88tLeA/ieIWdt7NW773W5V4P2OAWZPaav6W4scZ603eKKUrTJNx4A98Gt2Jw==
X-Received: by 2002:a05:600c:548e:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-4792af34edemr67264275e9.27.1764884273546;
        Thu, 04 Dec 2025 13:37:53 -0800 (PST)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:123e:4501:9c51:c3b7:65d6:48d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeae9sm5317337f8f.13.2025.12.04.13.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 13:37:53 -0800 (PST)
Date: Thu, 4 Dec 2025 22:37:51 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 7/9] iio: adc: ad4062: Add IIO Events support
Message-ID: <rrhan2ae4ak47sxp4d5auxa547f6a5wehcjy5dwgedzof3jtea@n6en5lky5kow>
References: <20251124-staging-ad4062-v2-0-a375609afbb7@analog.com>
 <20251124-staging-ad4062-v2-7-a375609afbb7@analog.com>
 <aSQ0aM2u49qzIZDm@smile.fi.intel.com>
 <zzrtxpcxzqcjxhxmp5miov4f3kx5i3fpzmrt55azvktkgowejm@n6ofgzoaxoxb>
 <aSgWOBJip9DK2SF6@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSgWOBJip9DK2SF6@smile.fi.intel.com>

On Thu, Nov 27, 2025 at 11:13:28AM +0200, Andy Shevchenko wrote:
> On Wed, Nov 26, 2025 at 04:00:36PM +0100, Jorge Marques wrote:
> > On Mon, Nov 24, 2025 at 12:33:12PM +0200, Andy Shevchenko wrote:
> > > On Mon, Nov 24, 2025 at 10:18:06AM +0100, Jorge Marques wrote:
> 
> ...
> 
Hi Andy,
> > > > +static int __ad4062_write_event_info_value(struct ad4062_state *st,
> > > > +					   enum iio_event_direction dir, int val)
> > > > +{
> > > > +	u8 reg;
> > > > +
> > > > +	if (val > 2047 || val < -2048)
> > > > +		return -EINVAL;
> > > 
> > > There was already magic '11', perhaps define it and use there and here?
> > > 
> > > #define x11	11 // needs a good name
> > > 
> > > 	if (val > BIT(x11) || val < -BIT(x11))
> > > 	
> > Not magic number, but max and min signed 12-bit, maybe
> > 
> > 	if (val != sign_extend32(val, 11))
> 
> If you go this way, the 11 still needs a definition.
> 
Sure, I will go with AD4062_LIMIT_BITS, then usage 
	*val = sign_extend32(get_unaligned_be16(st->buf.bytes),
			     AD4062_LIMIT_BITS-1);
> > 		return -EINVAL;
> > to not look like magic numbers, or 
> >   	if (val < (-BIT(11)) || val > BIT(11) - 1)
> >   		return -EINVAL;
> > For Hysteresis I will change from
> > 
> > 	if (val >= BIT(7))
> > to 
> > 	if (val & ~GENMASK(6,0))
> 
> Not sure about this. If it's a HW-based limit, the
> 
> 	val > (BIT(x) - 1)
> 
> says that this is limited by x-bit size of the register (field).
> 
> So, I leave it to Jonathan (my personal preference here is BIT(x) - 1 approach).
> 
I don't have a preferance, will use BIT(7) - 1
> > I believe iio only passes positive to the hysteresis, but is a little clearer.
> > 
> > > > +	if (dir == IIO_EV_DIR_RISING)
> > > > +		reg = AD4062_REG_MAX_LIMIT;
> > > > +	else
> > > > +		reg = AD4062_REG_MIN_LIMIT;
> > > > +	put_unaligned_be16(val, st->buf.bytes);
> > > > +
> > > > +	return regmap_bulk_write(st->regmap, reg, &st->buf.be16,
> > > > +				 sizeof(st->buf.be16));
> > > > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
Best Regards,
Jorge

