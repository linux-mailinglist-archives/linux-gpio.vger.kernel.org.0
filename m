Return-Path: <linux-gpio+bounces-9673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D011D96A335
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF78B1C23DC4
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C376F13F43E;
	Tue,  3 Sep 2024 15:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="L48TaurI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79362189530
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378443; cv=none; b=BHlqCPqkVW0pQuc0zoryGYBY0yctDsXyVXM7IOO1Xu2jau9e+kaB36dh2PxR+8QgUeiQ4CG1Kp08DGXy2q7/0trVCp0zXHm/FSSXc5siyFYRihdBd3ZR/rns4kKHmXIiSselSjhUmgdwA7q2/pnWcHYuO0aWmBNmI3oKQOSW1Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378443; c=relaxed/simple;
	bh=LvBXEbIisKwGT6qOIk72h1Fr9uy96Bh5J6Eqpru+ceY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdUa72dTjgu1XQKgHo2By9dt9BK3nZMlw8UD3PEcKHJW28rSRWdBwWvBGpSrottyeBwJ+2ID33TU218j7mzkIUlk9bxTiIFE/PaRqBJ3arptrjRyN9rHbE6BbUTOO5vQrvscJ8QJ5FYxAw63wqd5CDzse6fIKZiVM1nxaC+insQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=L48TaurI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so2987614f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2024 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725378440; x=1725983240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4J1hWIhMeEBX4XcRwGAiYhtZhrFDDZNJhYxSDwEqNxg=;
        b=L48TaurIne0KuKBhM5SsgvkUF52TSzvf8eK8g5FrPFOljkzNJQsMUnEaEon1+Cegv6
         EMID8NiSM5BYlylUVwhuh2aFs7At3aVsvYTEM3FKIiYHskCVgxaGzqTw+ELaoKM7Lx87
         yMiTd3XDPlaXP4JPafD7+/JtkF7DykYV7jpP2tEAg+wrKwqm9mYzbBgL+JUCcMqdHO/5
         DY3pp3EuwNgGOEnzbj1upJqqHzLfWFfFN1dW7KE1OgdT70mHH0j6ReTF9O6kz6tZ23PF
         8mdoONPEcP6lIWawscTKRvlYQ4gyb5OGz+qI+7b7SDvFStkRaP6wO/9oWsDUAOZIDoSi
         lJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378440; x=1725983240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J1hWIhMeEBX4XcRwGAiYhtZhrFDDZNJhYxSDwEqNxg=;
        b=p7+1w0fQGkXfkTV56BkDFY9ZAomhCpYUXdbb+EXmkSbp/0f/riIhgaxW4w6uSPezEO
         /tbAO0hNvpONDRlpiNfdw3AgYzfvlz3wZGJTplrn0pMM0d/O/xUzeZMNc23MRUTdFYv6
         Ovrzpu5lV8OuxIuTHfc+EChRCb0PUuMAtxYXx6Pf2nzMtV73k+jUIeUZHVrikAQPH2t7
         T5d9vQPLYjvtGtlA728yNxVFy17u8nkGkmeyknu6/h3kOsSQx7ltIS1VlFFRjURwiVRH
         b+1HDf/GfCG/ixzi6MRANieEtIayGFeM4AAvIbOweCNCUs+m4O1NRFcFl0c3vUZEU1KX
         khOg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ5Y8sZvpLdo0SJMP1MkI/ZyCt0uC4rejAD/rDbgY54ry1yzi7JKPs9jhcxdYEq4ruhEWXxlvm+pWy@vger.kernel.org
X-Gm-Message-State: AOJu0YzS9SIrRaCNhn0ugFsMfvP17AhKsI3RNvipxoV0YpS20zAy+1km
	RSMCvcN9Y3CHajqXvwjlzGNzHMSEOZr00yOdCzsLwIWJI0++cHP99JHcX7tdcUM=
X-Google-Smtp-Source: AGHT+IGjH/wqwzifWC85mnNCghQMRNaevAc3MRc1SI1ZJsOicR9cri3LYdbd5RxgvIaDuVDdAGoZiw==
X-Received: by 2002:a05:6000:4014:b0:374:d07a:c136 with SMTP id ffacd0b85a97d-374d07ac2f2mr5572813f8f.36.1725378439436;
        Tue, 03 Sep 2024 08:47:19 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb592sm708368466b.13.2024.09.03.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:47:18 -0700 (PDT)
Date: Tue, 3 Sep 2024 17:47:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 5/5] pwm: airoha: Add support for EN7581 SoC
Message-ID: <t2f5kockuvfi66qqumda6jxf5a4c4zf35ld5ainsnksavkchyj@kdueaqlhjoar>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-5-98eebfb4da66@kernel.org>
 <yfqmlca6cnhrghpo5s6tml36tngmekcfbyjakxs7or7wtap3ka@7qlrxjowo4ou>
 <d9298199-fe10-4b28-8e28-dc252bd6832c@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ohdzxy7xz4ztpby7"
Content-Disposition: inline
In-Reply-To: <d9298199-fe10-4b28-8e28-dc252bd6832c@genexis.eu>


--ohdzxy7xz4ztpby7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Benjamin,

On Tue, Sep 03, 2024 at 01:58:30PM +0200, Benjamin Larsson wrote:
> On 2024-09-03 12:46, Uwe Kleine-K=F6nig wrote:
> > Would you please add a "Limitations" paragraph here covering the
> > following questions:
> >=20
> >   - How does the hardware behave on changes of configuration (does it
> >     complete the currently running period? Are there any glitches?)
> >   - How does the hardware behave on disabling?
> >=20
> > Please stick to the format used in several other drivers such that
> >=20
> > 	sed -rn '/Limitations:/,/\*\/?$/p' drivers/pwm/*.c
> >=20
> > emits the informations.
>=20
> The answer to your questions are currently unknown. Is this information
> needed for a merge of the driver ?

It would be very welcome and typically isn't that hard to work out if
you have an LED connected to the output or a similar means to observe
the output. An oscilloscope makes it still easier.

For example to check if the current period is completed configure the
PWM with period =3D 1s and duty_cycle =3D 0 disabling the LED. (I leave it
as an exercise for the reader what to do if duty_cycle =3D 0 enables the
LED :-) Then do:

	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
		.period =3D NSEC_PER_SEC,
		.duty_cycle =3D NSEC_PER_SEC,
		.enabled =3D true,
	});
	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
		.period =3D NSEC_PER_SEC,
		.duty_cycle =3D 0,
		.enabled =3D true,
	});

Iff that enables the LED for a second, the period is completed. The
question about glitches is a bit harder to answer, but with a tool like
memtool should be possible to answer. Alternatively add delays and
printk output to .apply() in the critical places.

> > > +#define airoha_pwm_sgpio_clear(pc, offset, mask)				\
> > > +	airoha_pwm_sgpio_rmw((pc), (offset), (mask), 0)
> > > +#define airoha_pwm_flash_set(pc, offset, val)					\
> > > +	airoha_pwm_flash_rmw((pc), (offset), 0, (val))
> > > +#define airoha_pwm_flash_clear(pc, offset, mask)				\
> > > +	airoha_pwm_flash_rmw((pc), (offset), (mask), 0)
> > > +
> > > +static int airoha_pwm_get_waveform(struct airoha_pwm *pc, u64 duty_n=
s,
> > > +				   u64 period_ns)
> > Given that "waveform" will gain some specific semantic soon, but this
> > usage is different, I'd like to see this function renamed.
>=20
> I suggest pwm_generator. Is that acceptable ?

This function determines the register values to write for a given
duty_ns + period_ns combination, right? airoha_pwm_calc_bucket_config()?
=20
> > If you limit the number of requested pwm devices to 8, the code gets a
> > tad simpler (because you can map a fixed bucket to each pwm device and
> > don't need to search during .apply()) and each consumer has maximal
> > freedom to configure its device.
>=20
> The main use for this solution is for led-dimming which uses the same tim=
ing
> among groups of leds. Most (of our) products have more then 8 leds in tot=
al,
> with a limit of only 8 pwm devices it would not be possible to use the
> mainline driver with our hardware. I suggest that the current logic is ke=
pt
> but properly documented in the limitations section.

Fine for me.

Best regards
Uwe

--ohdzxy7xz4ztpby7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbXL4IACgkQj4D7WH0S
/k7Qxgf9HKjh6qEXybuTmQsw9gXqCLG6sQDJ3eltrqYR5ftvRUSX2bTTaElsodvb
9ybgn2+uGwILAgr9v1bJO5q2fdzbz2zkNQFni+drU/p5HdGMKMk+YFDUnNLfIn4n
UzjD9kIPDy3Vzud/yHLRipP6Wx3EsqGhC6pLD6fJkHI9m1OdSYzVXhMUkKDhZuNT
awjxQL2cojXnkT5P1LggRuod+rFEZvlVDtrA76PkQlfUz4Thq+BHQcU1sjc+6Wh+
wgMaaGdl4W50Je77nYiZds7n5+KNgheNggsf3Z+BHUYEnjOAtYihydQw5U0pXeWM
Gccw6+nVraP9M4BPw5I2un855jsxIg==
=tWuu
-----END PGP SIGNATURE-----

--ohdzxy7xz4ztpby7--

