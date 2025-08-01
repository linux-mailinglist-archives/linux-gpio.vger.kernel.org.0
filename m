Return-Path: <linux-gpio+bounces-23935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4D9B17FDC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8814B580050
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 10:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1059F21D3DF;
	Fri,  1 Aug 2025 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y3NQqgl8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5908A43169
	for <linux-gpio@vger.kernel.org>; Fri,  1 Aug 2025 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042605; cv=none; b=JKfYN53eGJG1X9ztQ7LijY4heZPVTATz38Bs7FP4j0aPmbydYLsrDARzX2Lv4WE8tmJa25SW6AC8GbTdH0weuuwqnHeesUwXfYy8xZDtIb5bSkreeA8aZlORfRQxkiPWLugxCJn3KxQAQwZSkYEr1GqXcBgt8VaTS3ECmbvRYrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042605; c=relaxed/simple;
	bh=eIrZnliW3QIEr5l1gdT1CBF75w/kF8GLk7GcVhln6e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIsFsP1HXcay97tMi52FZR4rSJcrjdKbihASNEjgelfIZeky93ABt+U18VQcgAVOPaBZIiHqr1mKJ+sPdU6XfqCRPlq61JITmVTHCPHfdU7dUjKJSasYjg/Lfnu009glPgN/mSlrx9w+uoGHwdft0YDc4ZiR9J8ICJq4X6VK45Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y3NQqgl8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4561607166aso13560805e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Aug 2025 03:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754042601; x=1754647401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIrZnliW3QIEr5l1gdT1CBF75w/kF8GLk7GcVhln6e8=;
        b=y3NQqgl8b/jmsEFZuhmysSFS5w9btgYT8U5MLX8GZnvHKA0BVflcrzXbluiJ6bAZKY
         GBaMipQSDIXqGVo1E/jOGWgzsQwNiV7YsQnOIsycsALP9YPZ4XHd0VMpKZ5KRfRQelJk
         4mod6dX1hYISzVy2r+4o8Vgl8ugOdV2hA9+2ELnNLq+s5TfekxtmVvv9aRrOKzO9CrXT
         vtBcSeUJAmP19HatJrlnahQawcqGAbT1YuTeE/sHx/foX7UhHcXJ+1QqIH/8KSEd7ZwU
         H8RY77WRq7CKX18Rbp2AHJqLj9YoB0Y3x1dBdoavNx3IDDq5KNqIoZ4o5FhF603p4LPD
         Nilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042601; x=1754647401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIrZnliW3QIEr5l1gdT1CBF75w/kF8GLk7GcVhln6e8=;
        b=Z6WuGj2JbG3QkJPSxBUYGxIBi0g1ZLv7rGkoyegh/emZm5XY22uTLX2qkhsvy0Dm3u
         hSfrxw6J03j582rfeCNLJUuh+gY3vNqbkBWZu4kKTeZKnAyTPpxuoAPQX08kaNfcAeRH
         yuCAghT+8FhHS9HTsARtnCEAgMtk1HdZf4UMNuUhugO8RVtY7DBHvSFl+v7wxKtNRm1M
         Y7rJoGKLxV9OINrgINMCchV7f5sRwl0r2RVXZddIbWMm0UCVqEGIeYhv+H4+cpu4IHNg
         Ru4RUreGF/WNU7MHtIoPMoAy16bT3NHhzSUkxCckp/mhTk+uDZJBl8MAIjH28NONOdyP
         hokg==
X-Forwarded-Encrypted: i=1; AJvYcCXuH899GD2OwoTMGe+zUUHn3sD7ET4kANy5ClUWRFTyK6ycQdNeIFAZ7umsANzafuDUyBHUS0vIN+1N@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4IhsoBPnkwCRyjkKfh6FIFnAIKbZmwpQtwaqD43BJrfuzkhd
	hBvu4VGSmwDBcAj/H6IAmIuQ/q/+1Z0qvFQJck55nS16HuOr2FIY3NNK8K2XpHdBF4k=
X-Gm-Gg: ASbGncsyoWqbgoSD3+/Ap3ULndLxwsHz65rhXOYe5nDGa9opY2OQxWz4JobByvclJSU
	EKrwKjmmMbXmn5gmcY52xdhjv6JvfS6Pqc684qeE3Vkrsg8Gz3cR+yqXRKxdayRcHmIRQZqVPFo
	q6wco1haqQ2LSQoImbagiDVqlfDJDHBxT9aZPCvvA6HpqmTbVArmqXJydHKq+bclQnceJy29l1C
	1TaIvct/Gio1rDRlje3D0ALtrKUM2cqNh/qUlKgDS4G0qK4ZazFQtBURbEhyEB1t0/gzSHOlrTp
	u8vlogIodLRNiRsndR+hUq4muhmGMe5eFIkRuy8GoLKOt3T2xgS6TA3GVFXum7hcnKy5PEHQdeo
	LT/fCni1uTkPcU/aBAp7pj1lvdJRGDQ67msr1b1sMUX8tEqhsoKipTX66J1U/Rx0C
X-Google-Smtp-Source: AGHT+IG67Ewh7sS5pb8O9k3sycQCIZLSNlxo1qxvgoWQaW8f/hn9314Q1eBJTyM2e04rkiXvi0jDLg==
X-Received: by 2002:a05:600c:1d25:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-4589a700e05mr91893355e9.14.1754042601496;
        Fri, 01 Aug 2025 03:03:21 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3c4d02sm5239526f8f.33.2025.08.01.03.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 03:03:21 -0700 (PDT)
Date: Fri, 1 Aug 2025 12:03:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Clemens Gruber <clemens.gruber@pqgruber.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pwm: Provide a gpio device for waveform drivers
Message-ID: <533s3ekqhn2lbk5j7xkwfoi473lkl4prpr6bc5qjd7vzawlmqq@tevygtxqobzv>
References: <20250717151117.1828585-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3gdvccb5c3frwtk"
Content-Disposition: inline
In-Reply-To: <20250717151117.1828585-2-u.kleine-koenig@baylibre.com>


--h3gdvccb5c3frwtk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: Provide a gpio device for waveform drivers
MIME-Version: 1.0

Hello,

On Thu, Jul 17, 2025 at 05:11:16PM +0200, Uwe Kleine-K=F6nig wrote:
> A PWM is a more general concept than an output-only GPIO. When using
> duty_length =3D period_length the PWM looks like an active GPIO, with
> duty_length =3D 0 like an inactive GPIO. With the waveform abstraction
> there is enough control over the configuration to ensure that PWMs that
> cannot generate a constant signal at both levels error out.
>=20
> The pwm-pca9685 driver already provides a gpio chip. When this driver is
> converted to the waveform callbacks, the gpio part can just be dropped.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
nexxt

as 6.18-rc1 material. (I just claimed the same for the v1 patch, that's
of course bogus and this v2 is on for-nexxt.)

Best regards
Uwe

--h3gdvccb5c3frwtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiMkOQACgkQj4D7WH0S
/k7eXQf9FCeXmZ03f/m0sClqsbYpAQ+XoPqo5A4dD/7XoXQSg1uS+XrbBYD7HiOS
UX81viHubCkLMWXZ5+pdGhyDujPzdgU1yitx81mOCYB/Fne0i+rjFw9AEJnvQI/I
Sdwky6KPoQsa5nXI5l7tAMRkC5AodzYcGw4E1OHHBp/hhNfjatsT8UCUU5q4S9BO
+r/TrOzNFqkgVPt2fRyouE9imzMy/MzKw4WdNYAEUSfLEen9VU1qV3ShF/RliPnl
kEQZY5DvzrhUfTaqAOFMehVJPugK9xIfwsMWfSrMFedDBaXTwgrtQ7WRwuYvOSbV
jxiEIOyUr3r1BRmQmlJ1YfyaoQy9Dw==
=O2A2
-----END PGP SIGNATURE-----

--h3gdvccb5c3frwtk--

