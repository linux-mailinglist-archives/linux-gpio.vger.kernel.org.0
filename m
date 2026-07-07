Return-Path: <linux-gpio+bounces-39557-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UCLjNwGpTGoXnwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39557-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:21:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6308F71866A
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:21:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="YNRpGF5/";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39557-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39557-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00AA6307135E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 07:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665023D1CCA;
	Tue,  7 Jul 2026 07:13:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4610B3B14A9
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 07:13:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408398; cv=none; b=Y6Q0Tv/TmCZQEmIgxEiVAQrt5w88DmGEsKz7uykF9VbDv4Q8uUFzKLwZr6LJj97qziA0uk/0lIcwgX01tVM/73obuOQYx/6YEZoHhQkO8/xefrpy3OImAa0XAmnibZE2ECHVVgPqoc3UHnL0bMtgN1HMQ0iZvWfdZh1yFjXmLTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408398; c=relaxed/simple;
	bh=o2oLniKM13hnZyuUn7cvH6Cnp9Sck61RTCQgMFrG0SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoNUEJRG+qxoarmlRyFKwUF5CcWfLgLXNbFLgM6+WP5bqAnmqwHO+99vNVkYkUFY0xHMp7uD9KaRGURK6QKyTyO72VskwgvEH2ewK67wgL9E0UzEYs0eHfpsVBoxmTS+TK7aCaaad4F6mMbn9t/8HmxZdeG3oUtuyIU6f6d73bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YNRpGF5/; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1951234f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 00:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783408393; x=1784013193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2oLniKM13hnZyuUn7cvH6Cnp9Sck61RTCQgMFrG0SU=;
        b=YNRpGF5/4a3GmJ+cT0Tm+T+TDzVjFj7199W9ElRLVc07r+SaeoFCnE57BbYiyHdTh8
         /X3tUqtY5w+JK9/mOX76z0dogzcnieNUV/aNVzuomkBp89rnGMC08IIcvTmVmHVNVH9e
         covAAcdCoWrHc3zTNRVGcVzQS6ZUkuygCpezBcHsHC5zMUm1+U7USp2I96NmZMWjnqpK
         7lwBm6T2J+E83PyJaiIF7jK2O0pE3x/iNcgj91SeiKz0Y8HFVATfs5um/ZQu+zvixl62
         VqQb5D8yDnei4tL7TsFaMKncirx9usC9Ra4rl+pX6vJk+KetM74AJNXuqpvMQlPXgbL4
         Nl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408393; x=1784013193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2oLniKM13hnZyuUn7cvH6Cnp9Sck61RTCQgMFrG0SU=;
        b=DxQQ+8opXLAzT0UaNk1qVwgLoGGkEWufaLp+4nYzmUAFVKcnL03/f0Gg54kbrlBafS
         +NscG04cLPrXYDGwQDaIlWLz2jaNh09SMoO0kqCiYBlSCXhgOxC1A9PDVNu+ok2ZFOYA
         uEoFY7QFpJJoBzAarKBD781ZDHgcyPh3cXd1yrp/+vCBTEnBLNe/JP2zPAPvluAW/bcd
         avTNVh7wfUnFsSd2uhsRRUGCIYYIIioUdlf5pqaozkb6VNq54hv5YBsovnXVjPHf4xqs
         BNaxjLU3gSUckxr8mKz/1Jn4Mx05gG/9v8upiv0inO7kJVNIP8kG0Z+bFuYkuwa3y/ki
         /SMw==
X-Gm-Message-State: AOJu0YwMYJwuMMA7/zakTrSse0ljMKRtldJgLJIcH395NNvxCCWStyG0
	nm5QDYe8DHnvssL9CmEfiqoS+slK+tREbc8/QJvNle4iyyvym9Z1Q5291uD1BSI1y5k=
X-Gm-Gg: AfdE7ckn61dIhO85+mGeyk3Zp+CSfxlRYiBqzcuUn5+y5dWCR3MCQxuJ96sd2FdjNu3
	E9DMxMf5456Sqggmf/MmqiJ35zfmO6JK4XC8bcI+Aw15MWdZdGZpfMyETkAI0gSwXZs5dm3UQCD
	ttN4Hguie8Cpp68x864mUJ4DYYshh365ohjpmgdRdiMlJazxyzojO3hjPFD6X4TPzkCa2YP2oRz
	nSmd+YITyPnaNby+19zPXffCvY8+KRHlSDlZzSEphsI2z7g644zqOcK7ZXHUc7MNmB3SevOmPmx
	o+s4IK3mS27lh9n5eoHIKXGf3w6TJn4zbteCaxVGVWxfAVoQQWkLZO+r9+n0x+X0bIP7Ujwiwft
	Mgbl6YQjAgOrL9NVLqtjizBMnBR47G18+ysynpdsTqmO8xs016TjjaRhYtjZCgPenKf3Kfw03+6
	OHLXMPAj3AXtimglWyTa4XyUC1BaKnjCl32Tc1O3WVtRUo6Xhz8C6ZqV+JnrhEwpEU7+ZS74RNt
	DP5VY0qHjv7BUE=
X-Received: by 2002:a05:600c:5288:b0:490:b2c9:e284 with SMTP id 5b1f17b1804b1-493df09608emr41577735e9.30.1783408392868;
        Tue, 07 Jul 2026 00:13:12 -0700 (PDT)
Received: from localhost (p200300f65f47db0437b4d928ee3eb6f8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:37b4:d928:ee3e:b6f8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f41014sm30858915e9.6.2026.07.07.00.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:13:10 -0700 (PDT)
Date: Tue, 7 Jul 2026 09:13:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] gpio: mvebu: fix devres LIFO ordering between GPIO
 chip and IRQ domain
Message-ID: <akykuME0Y3eLOA2q@monoceros>
References: <20260706232223.774895-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hr5mygvtcaxfa33e"
Content-Disposition: inline
In-Reply-To: <20260706232223.774895-1-rosenp@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:andy.shevchenko@gmail.com,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39557-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6308F71866A


--hr5mygvtcaxfa33e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCHv2] gpio: mvebu: fix devres LIFO ordering between GPIO
 chip and IRQ domain
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 04:22:23PM -0700, Rosen Penev wrote:
> During driver removal, devres cleans up in LIFO order. The IRQ domain
> was created and its devm cleanup action registered after
> devm_gpiochip_add_data(), so the domain was destroyed before the GPIO
> chip was deregistered. If gpiod_to_irq() is called on a pin during
> this window, mvebu_gpio_to_irq() passes the freed mvchip->domain to
> irq_create_mapping().

Without having looked at your patch, I would expect that there is a
similar window during probe where calling gpiod_to_irq() between
devm_gpiochip_add_data() and IRQ domain creation results in an invalid
mvchip->domain being passed to irq_create_mapping(), right?

> Fix by moving the IRQ domain creation, devm cleanup action registration,
> generic chip allocation, and chip type setup before
> devm_gpiochip_add_data(). This ensures the GPIO chip is torn down
> first (preventing new IRQ mappings), then the IRQ domain is removed,
> and finally mvchip is freed.
>=20
> Fixes: 644ee70267a9 ("gpio: mvebu: fix irq domain leak")

If the above is right, the referenced commit only creates the issue at
driver detach. The issue at probe time exists since=20
fefe7b092345 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
which has `gpiochip_add(&mvchip->chip);` before coping for irqs.

Best regards
Uwe

--hr5mygvtcaxfa33e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpMpwMACgkQj4D7WH0S
/k6PkQf/cjApnE5nXUCQ8GAQc8ZrWWggNhmY6A0+vciz1er1sQwxQrcXOEn2jNl4
XVW+M0TE8l8VoYsFQZxLgZm/6FUuyCGcwejFvKD6yFlyebtO6WIp8yS0H//6Gj24
F6nwP1fQ9CCLvGKpv3A829p+wP1+VVnqkWbCFc3aueAov5oLlBaa4Fxe8eAHWFng
TNdZ+qlRjfypuRFwp9xV6qFrWnw5O9ghuqFDu+BOy4qlxdLYC4WNizu5N8GwvDgp
yp+YYtDCOWZ/UNVxGtCXdzWJHY/r+mW7cidAXNDswkmq7VAu7YCs6G6Qkx0ZLiTj
b4TFO5TAuWvLJyBK13Mj3/A/lsx5Lg==
=vBwG
-----END PGP SIGNATURE-----

--hr5mygvtcaxfa33e--

