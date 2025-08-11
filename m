Return-Path: <linux-gpio+bounces-24220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3788BB2179A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 23:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 349FA7A5031
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 21:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48BD2E36EA;
	Mon, 11 Aug 2025 21:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8ROvVv3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A61628505F;
	Mon, 11 Aug 2025 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754948636; cv=none; b=Lyxg1dd22X7zNFfq9lglpGoeDqaUh+NVGpbDLtuRzS8ea1n1D1vYuxHoeFGEAsg5jaB78Zx01g9a4zUyb1mGVD8xyI9saMTWJa/7DJokIAq9VTVFpoXTZyLJRd6a7UZZakpBb57gDx+AXHnWzgdcSEoB/TbouZiBgv31xFuMVEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754948636; c=relaxed/simple;
	bh=7OGQk8bopsot7CutcJAcqxqmBdgPuJE0EaLcO0LDgxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqTEHVk8TP08+bMO3i+8xewnFnBUSMIeSclaNa0APl1FVQGrJq+A+aFs7WoK0UtLuwgp433ky0o1ST2/NQy3WmDP2P9LIYKXsEw5ppQHo4SHZed8kJOKDFB95V5LM/RydOsXIVcBtUSavaB1pf0BeO9VSK3F8LTXBgphwK0jP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8ROvVv3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-31f255eb191so5003819a91.0;
        Mon, 11 Aug 2025 14:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754948634; x=1755553434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V6rK+nf0PE/yzZMOCn9QAPItrRWLBQkSNHhJvIS5DoM=;
        b=M8ROvVv3V1ge8lyv4/8erKw1qjhL1eHf/cjCsnMmA8kdS/z8tjhxLVC4cIXjOOpVCH
         yBwm4F/pAN5+9FSG2SsmfzVuIn/T4pafUM5jgfl/Ob+Rs0anh7GJZ5p1+qrar5LgWNgp
         kBlyuLr5wyntsLIvQiH7P5LxU2sUPFzA+lj8FplAVw3lieDnRAFPuJHByzvZ9l97y1OL
         QDydYwlttIb7e1xQHjw7H2Wf40ZxZH4ut3UVbFzZTIQqmvobWImd5XNk3D3r1QU5UPFj
         85JljJ96gnCogY6Q4Np5FtNFBTcQkpIgP27Cdb53v67m7ucAGdQTiWPN3glVcbOVO+T3
         rzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754948634; x=1755553434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6rK+nf0PE/yzZMOCn9QAPItrRWLBQkSNHhJvIS5DoM=;
        b=j/BbkjfZlzyQXgbWcdFhTGdXmRleupS6ogkX0ajkZRSPdp3fXgRd8J09v/RyEfdXUT
         AS+h81clun85MhwbUMpr6KCpIW6iQC/9FYuWU+Y3/gECPrWVDYjQK3Yr81qao62jujKv
         7qB3PLfpd8rfYZDXDtzpM+YanO4Sh9xE88ktnSswbDwJqkbFLGhWJdw80dZuyL9Smh65
         hxjDc0QWLZaPBlffMP2mErIiIl/riJhU2oXymRWpDAzLgUmXtWdeLS356sITEyRY9yf0
         KdUDG6jrHplXVRLRZ1tST0k1+L0fPVUUG1yNOEswSnYQ6ti2x6ROFoV2osOf43Hiz6Us
         dcDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrqEiU0HfXMFlmQMM67awwpK6Acu3MPKLTTFu10b6tpQhdwQtzA+5cjzQvs/JwCIX6xIKYhqwsSS24@vger.kernel.org, AJvYcCVSs839xSisPcVVnA7HUDR5xnUh2S3+vPjzS0PA0wNU2Up9u4YyaShPI2Wp1Ng+Tnyn1V5x/5UEEmxhEdkH@vger.kernel.org, AJvYcCVyDXTvy37zVcxsdcmvEof2nKpefJMasONY16O7IKEsrfbDSvqHXXgYzCsfGeW8m/aLncns+CGr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9m1W7PoT6OoLU6QAufEP2nRi8I4GP4s7rUjZZo3FQvcrJakmD
	CiMraSaUUTK3hMCNLp2AebEt0Eo5SqmfoXRSzi7aRBWpJH3ggkJFQyAl
X-Gm-Gg: ASbGncuyrmYPjmnzSa5Z2qraWG2TmZqCtl4tfNKe3/NkNayDqK43ygJzxbLLvT6l1DQ
	ws4iROro6h2ys5uQz4QSHVuCXm+wGvCsQxU75kaFWKuA+w8yxnLYzyCSnBoPGXmBqohJtoFsUiy
	4gJ5PZn2s3aA1lE6KmM0qXvMX58IyT7hRl2EINbYb8a12tKN7wuFIvwCotOjRl7uuyBVqHd6xWL
	6weecq7AeT4MkVpD454+3r3+9sYRonyxMwAH3kgcrBsrepgSN8MkedliE4aWVZR/O28swdkMN3r
	eWhUxLGIFqy91kowbvcOj/BYohhytHbaeILcSZ8nH73xe/LxUbFDFGzsvTzBry+/h+tE++HdyIP
	FVFRd1ivfz0AIQuebP0bQXCg8yD+MK1B7eQ==
X-Google-Smtp-Source: AGHT+IFsi78NN+fBY0LS4y+P8YMijCEFQnCo74evdIk8ObOIJFSgyoxfkygQTtZGUK1jp2bVcfARVQ==
X-Received: by 2002:a17:90b:3842:b0:311:9c1f:8522 with SMTP id 98e67ed59e1d1-321c09fc527mr1556132a91.10.1754948634369;
        Mon, 11 Aug 2025 14:43:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:69d7:30de:b05e:915b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3218c3c2d58sm8359383a91.16.2025.08.11.14.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 14:43:54 -0700 (PDT)
Date: Mon, 11 Aug 2025 14:43:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/21] nfc: marvell: convert to gpio descriptors
Message-ID: <yf5coptfembueds4ozpsphdv7vggyzfezdxv66uuqzjv3gpw62@x4s6iylxahrv>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-18-arnd@kernel.org>
 <aJcea90siAod5Apw@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJcea90siAod5Apw@smile.fi.intel.com>

On Sat, Aug 09, 2025 at 01:09:47PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 08, 2025 at 05:18:01PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The only reason this driver seems to still use the legacy gpio
> > numbers is for the module parameter that lets users pass a different
> > reset gpio.
> > 
> > Since the fixed numbers are on their way out, and none of the platforms
> > this driver is used on would have them any more, remove the module
> > parameter and instead just use the reset information from firmware.
> 
> This patch is my love in the series, thanks for doing it!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> But note some comments below.
> 
> ...
> 
> > -	if (gpio_is_valid(priv->config.reset_n_io)) {
> > -		rc = gpio_request_one(priv->config.reset_n_io,
> > -				      GPIOF_OUT_INIT_LOW,
> > -				      "nfcmrvl_reset_n");
> > -		if (rc < 0) {
> > -			priv->config.reset_n_io = -EINVAL;
> > -			nfc_err(dev, "failed to request reset_n io\n");
> > -		}
> > +	priv->reset_n_io = gpiod_get_optional(dev, "reset-n-io", GPIOD_OUT_LOW);

No, this should be "reset". gpiolib-of.c has a quirk to resolve to naked
"reset-n-io", otherwise this will resolve to "reset-n-io-gpios" in the
bowels of gpiolib.

> > +	if (IS_ERR(priv->reset_n_io)) {
> > +		nfc_err(dev, "failed to get reset_n gpio\n");
> > +		return ERR_CAST(priv->reset_n_io);
> >  	}
> 
> This also needs a call to gpiod_set_consumer_name(), IIRC the API name.

It does not have to... I am not sure who pays attention to names.

> 
> ...
> 
> > -	if (gpio_is_valid(priv->config.reset_n_io)) {
> > -		nfc_info(priv->dev, "reset the chip\n");
> > -		gpio_set_value(priv->config.reset_n_io, 0);
> > -		usleep_range(5000, 10000);
> > -		gpio_set_value(priv->config.reset_n_io, 1);
> > -	} else
> > -		nfc_info(priv->dev, "no reset available on this interface\n");
> > +	nfc_info(priv->dev, "reset the chip\n");
> > +	gpiod_set_value(priv->reset_n_io, 0);
> > +	usleep_range(5000, 10000);
> 
> Side note, this would be nice to use fsleep(), but I see that's just a
> copy'n'paste of the original piece.
> 
> > +	gpiod_set_value(priv->reset_n_io, 1);

Nope, this is not going to work. See
Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml, this GPIO is
active low. We do not have any "live" DTS examples so I am not sure what
polarity is used in the wild. So either use logical level (my
preference) or switch to "_raw()" variant.

> 
> ...
> 
> >  void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
> >  {
> > -	if (gpio_is_valid(priv->config.reset_n_io))
> > -		gpio_set_value(priv->config.reset_n_io, 0);
> > +	if (priv->reset_n_io)
> 
> Not sure why we need this dup check.

I personally feel very uneasy when dealing with optional GPIO and not
checking if it exists or not, even though gpiod_set_value() handles
this. I think check makes logic clearer.

> 
> > +		gpiod_set_value(priv->reset_n_io, 0);
> >  }
> 

Thanks.

-- 
Dmitry

