Return-Path: <linux-gpio+bounces-26682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C755BAE1D3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 19:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47922324BF5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 17:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AAB30AACE;
	Tue, 30 Sep 2025 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDOOVdKu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8EA26A1CF
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759251680; cv=none; b=NRC5qOPRQZ2d/1xZNULHYz0khTMU+1m7m/cTdxUTOh1S8ugHrcXgjHTKiMW9gB8ckZydWZmoImURvha10zv4Zu7Z5PlWQKxiG7hg7aaNFt+f4oovBr+A4fCQVW4PNUycLCy0mPOF48C2zxPpws7GC2wkHiMPP31/XITBzHZoJlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759251680; c=relaxed/simple;
	bh=AmHuuzpem5111casgiRIX7q6S2eHy1ZsEGaomvXBWBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJKA188Xs1x+mdYgWUM78eF9gfMdA5kWcWFb9J0rdbh7lAjTluQjIGkxEgYfd1skAhBFPI0ZEcQNOhdhX4eTEie0YGxrqgHBzs03D3JhEtHNlxuYtWVKw8Bw8kCyKKxq6GebOF6Pa1oJQ7oaxYn6HDZqg5GM9CSDQHEwwhLSiIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDOOVdKu; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso3832395a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 10:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759251677; x=1759856477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Qn5VqRWJrpHDhx/xNpBlaLWgEArGVytxgRrr8Ys9no=;
        b=bDOOVdKukdiUsInRLL7W1Mr6ucwZPG0GVJ9putQ/fM8dB38/e4znvgFd8TqWdPOWv7
         BkASLLEnQeFq+XOOQdBnVo9SiMm3cq4HzJ76ZdqA2O/vA32XeO03ELa0lNFJO53IQ/yX
         YZM2YnBIUmufFZ0YLh1lphgiEQtMMcMW3NJO50GhlAxvWXQ9O417oWxylwiivmiBQ+uM
         xm5QOfpmFwMsfD0hSlU9O4ytHgUQOFB/KIFUkhR7dNVoFFg5YfdZUiGx2MPuhozQWSjd
         sJk4b+/kPzLR+ZIW6iJwSdjI+5oBC6lhIFYZylIynEqutbXMFgtwNpLlh7P6e7WbVeaR
         Og/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759251677; x=1759856477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Qn5VqRWJrpHDhx/xNpBlaLWgEArGVytxgRrr8Ys9no=;
        b=P7De4nh4B+ig/BQd6Dgz7H3s0eClI7kOLdlAQz3yVFRhH/q/ERq2ch+yaNwNuhaNKG
         oiRKNweZX5tiJgvYcu9MTx3naTSEKhYwm90WWbtiQocBbPOQjn+Go2XLLDxMyy9PkXrN
         rZ6ibBRwnIyjLixpK2e2DnasdJhPWRX1w14RS5Djf6UwL/h0Hmap8gOf87lw5VZweBKu
         m4gnIweJvq8fE8UDdsDzUZTxkCCgPPNgLnQDjUz6vusMZIwdnyd4PL0demIDkZxcrDyl
         orrl6Fv24IsGtNIJ9ZOnjTiMrhlw+6yzRFxF+So/h3DaAcrgV2DXpfS79ZMK8bSezRNI
         kDhA==
X-Forwarded-Encrypted: i=1; AJvYcCUlgVPJfPJlUjzS6xnQ2jn7/YtE/OqQ8duWMUC/Tw6qQGNFE0oWpvHLjl9Iqz1HRN7Fwt+aAR6ivH1z@vger.kernel.org
X-Gm-Message-State: AOJu0YxHhO5KB5PBVePjybDaae2z/+x4kkN+FKT3ept6U0YVGWti/vhp
	i68pswD70p3FjZ3fRpnI6ta+BKQkOhfNuzQPGQ7mXPGleXKfJhm0AFOd
X-Gm-Gg: ASbGncsGCMztBlYVLlLt8nOacImuEVp05mhMqce1JAn9yfAZP7G6PKtyhkI+U+V2aGk
	gIQjGcoCc4FQMZHEmhGrcEYOYmDNIV3nDM19KHa6KI5Ep5+dJQjyeFUx4yRAUn3h7wNp9oBDavN
	JxQ/SwndlletEtpiRLeob0MS5KxqVn//4vDvPGYpnXL01uveYhMRkxcToGK9urUNKaZiHNZTeXh
	uusiiHtzcifEyTh+//tf4XWvekn9LS2NDwbWljutCuk28GZhRWxwrntmKhMCbZrQS0p7iT1tmp7
	qfAg8IDt/T14K3xgDv2aX5FvnZYcaRgBwsrPE9dHoMkRpKS8Bx+2doJLmIDXXHisTiNujeKRM01
	bfEDdL5D/PTf8IzuKTsfPtclBdsgXIZPellYuSaRnMXlA7ULKSIRyT7vBiKyLjZIvOQ==
X-Google-Smtp-Source: AGHT+IGy446EO1dFvrwF+hn4zw2/euRdjV/W41f6FxDTzzbhNgbS5i0TkYtI/qkAdJxguBsSMF5Bfg==
X-Received: by 2002:a17:90b:4ad1:b0:334:18f9:8008 with SMTP id 98e67ed59e1d1-339a6e28289mr264935a91.8.1759251677221;
        Tue, 30 Sep 2025 10:01:17 -0700 (PDT)
Received: from localhost ([2804:30c:b65:6a00:ceaa:2ed0:e81e:8f51])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3399ce47d7csm974066a91.10.2025.09.30.10.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 10:01:16 -0700 (PDT)
Date: Tue, 30 Sep 2025 14:02:08 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
	nuno.sa@analog.com, eblanc@baylibre.com, andy@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 7/8] dt-bindings: iio: adc: adi,ad4030: Add ADAQ4216
 and ADAQ4224
Message-ID: <aNwNEHHZ4RXyz92r@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1758916484.git.marcelo.schmitt@analog.com>
 <5dc08b622dac1db561f26034c93910ccff75e965.1758916484.git.marcelo.schmitt@analog.com>
 <20250928111955.175680cb@jic23-huawei>
 <20250929143132.GA4099970-robh@kernel.org>
 <CAMknhBHzXLjkbKAjkgRwEps=0YrOgUcdvRpuPRrcPkwfwWo88w@mail.gmail.com>
 <aNvtfPh2JLdLarE5@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNvtfPh2JLdLarE5@debian-BULLSEYE-live-builder-AMD64>

...
> > > > > ADAQ4216 and ADAQ4224 are similar to AD4030 except that ADAQ devices have a
> > > > > PGA (programmable gain amplifier) that scales the input signal prior to it
> > > > > reaching the ADC inputs. The PGA is controlled through a couple of pins (A0
> > > > > and A1) that set one of four possible signal gain configurations.
> > > > >
> > > > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > > > ---
> > > > > Change log v2 -> v3
> > > > > - PGA gain now described in decibels.
> > > > >
> > > > > The PGA gain is not going to fit well as a channel property because it may
> > > > > affect more than one channel as in AD7191.
> > > > > https://www.analog.com/media/en/technical-documentation/data-sheets/AD7191.pdf
> > > > >
> > > > > I consulted a very trustworthy source [1, 2] and learned that describing signal
> > > > > gains in decibels is a common practice. I now think it would be ideal to describe
> > > > > these PGA and PGA-like gains with properties in decibel units and this patch
> > > > > is an attempt of doing so. The only problem with this approach is that we end up
> > > > > with negative values when the gain is lower than 1 (the signal is attenuated)
> > > > > and device tree specification doesn't support signed integer types. As the
> > > > > docs being proposed fail dt_binding_check, I guess I have to nack the patch myself.
> > > > > Any chance of dt specification eventually support signed integers?
> > > > > Any suggestions appreciated.
> > > > >
> > > > > [1] https://en.wikipedia.org/wiki/Decibel
> > > > > [2] https://en.wikipedia.org/wiki/Gain_(electronics)
> > > >
...
> 
> Though, the above is still relying on GPIOs which is not a requirement from
> ADC peripheral perspective. Also, if GPIOs are available, one can just provide
> them through pga-gpios and have full control over the signal gain with the IIO
> driver. It boils down to just telling software what are the logical levels at
> two pins on the ADC chip when GPIOs are not provided.
> 
Though, as mentioned, the state of A0 and A1 pins defines a certain gain applied
to ADC input signal. Because signal gains seem to be usually described in decibels,
the proposed dt-binding allows to provide the gain value in decibels and then
software figures out what A0 and A1 logical levels are from the provided decibels.
The actual levels of A0 and A1 then have to be set according to the provided
decibel gain.

