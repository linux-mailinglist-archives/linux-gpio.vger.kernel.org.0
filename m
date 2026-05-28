Return-Path: <linux-gpio+bounces-37633-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJvIHDgVGGprcwgAu9opvQ
	(envelope-from <linux-gpio+bounces-37633-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 12:13:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 328F15F053D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 12:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4679B30D3C89
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA06F3B27FA;
	Thu, 28 May 2026 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TWmiC7Kk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EB93ABD8E
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962999; cv=none; b=sqZjmIIqo1pPFbIWPWAi97sX3fpVNqdZF9g2bF6Hf8ENrfGI9frFTFzJs4FUHkwaxms/vs4YR5GuCjvBpjQOK9Aju5I2Gx5Jze70nUgIiXLv/FZlaSxngG31x6VpRpfixUG95IKJ+edFPknmj/7OAdWEBBE6bldq50MYvpXyZu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962999; c=relaxed/simple;
	bh=jDJJEw1aEW13FPk5Ox8KXXR1xi9c6g3zuF8G653rRWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuZMupAyHndrnWGwuKYQA5QSJdDv/OWXMN3zYm/XG6WJUpNJbvvRbxUvVJQ7cMvTZ7SnsAqsZj/Gh4MyWV/1Tv5gSZ7QkG30qvd+8Yqsm5ldytIp6B8PvMDOcUuOS+IBFybelIB9KIL9dQ/a671ieGgT4tNsziY9N5mONJNzOoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TWmiC7Kk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490686877a1so29747355e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779962995; x=1780567795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3dEoQrHmxD3QAsur3ni9bkWOs/bYRX+l4pg8imj6MVM=;
        b=TWmiC7KkHeNsMtwCTWIN3VCe/GwirsFCe2zvSi5w5+JZLcN4NkccRBluKiJ3pSsXu/
         TsPCVdzjvl1lMGBhcHQgbfJ5qN/JeSeWeZLqr7dDylCHDRTDEErHP9f6bW1Xa/BDshmk
         ndXUc2OOinGLn5tAQLROEgInaOhznbotS39yrSjkHndcyno7DF2VmPna/s+GLKTlQnzh
         mYEHQtVnHgc8ZIyDZDb5lTZIkdCIq3UKKUsfIxom/ZAuMRMKP/iTTiFAvNPZfRgv4n0M
         j/M8AEIjshWiM3pCyapa5jzoc3fx85DV9V157lQWM6xIioCR5ghd7mOe5nqYP8tv4Q1a
         wMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962995; x=1780567795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dEoQrHmxD3QAsur3ni9bkWOs/bYRX+l4pg8imj6MVM=;
        b=ooetwNbtpoGcwMCmCPQgiKK+wIYBxeAIktwqE9xN8cDJgN6zB7ddoQJ528u8E3HIOE
         jfjpqZgD91OtMN5qr2Jnvpr6hztQmsuFrKZ+4dwKYudsEOsou3OseebUINZBd0BNiFbi
         57I8KH5kdb617idF3IotzY3bAZRrBE2/Py+gJapLkbedpDMI0KVWd3xLvsTDYNw4ErAD
         Q2Q/L8oQFYPrHAI2DGh2l35bKc2IgnkHmRDI1pV90kVDvxi/70YL3TA0LV8TA9vLebz/
         AHq71tv7M5e48K3Obe04MJq5+v+JbosUjwq/ZGRLH2arHI9W9rKhfLf6cVe0NCM3eJD4
         vJuA==
X-Forwarded-Encrypted: i=1; AFNElJ8HPkQHq6+qPScZPXzm+zus0JlWolOtKgakFQw18UGTXTlIw6wIomKKASvAfzEFpOx74WKAJt6GJrVv@vger.kernel.org
X-Gm-Message-State: AOJu0YwMnNDF43ein/lpg0S2ugunJeyj8Qrkc/GfQOovvmfnFoxcHBgl
	mz4CcG7GpJn/zThzB/7h8Y3NqCLdc6KhjNQ9kbzWQh1rBsHS6yLZZ47gQPBO+vrbLBE=
X-Gm-Gg: Acq92OHFonSDEYsZF3YbXeI+5Vp841kXjfyiCgagtN2begy2UjTp1e/8eb9/VYBteWJ
	mCzphWBXkPdLmCfyfvYKLHHqz8c4amcBZOtfD9pk9TkhWu7cpdjh02kR2/Tg+McMh3qGLmmIB3U
	GhJu5PCkmIDPBZXXMJ/jnHZiXdaNsJqjqUEeUjKege1WxmQ9F7pBquUH1VJQQxQ4gtKAiKBcH0X
	XbMwEqgZiiPO27ePgQDgOsh9onn1wwHIfBlnzAqeGxJpCguEe1EMHbqHRWUvk/L8acSCGjm0Uoa
	L429Sm94r1yPCTora4jRxgWpnJlO1ipDUjPZddDA8j71/8WflyJo/F8sMRbDgBmID/hQzoMFVLq
	QzkVQUH6l8KWPJ8nNr9G7TNEpltCGvQaHDCpdDEiccx7KYiqpBsQDV019mbUO/3N8CsBQRJvc2W
	IPsq09yAFqSOv6xwOVaT5/fQDhgZMUPPt5NY0a2rbT4AxjIRw5gaXuk68uQ2G4uboczGUDzdFE2
	IZkGEfEgE+nbrget3be/Qtlyw==
X-Received: by 2002:a05:600c:528c:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-490947a4918mr14900895e9.7.1779962994786;
        Thu, 28 May 2026 03:09:54 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49092654e10sm28651945e9.7.2026.05.28.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:09:53 -0700 (PDT)
Date: Thu, 28 May 2026 12:09:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v1 0/3] gpio: Use named initializers for
 platform_device_id arrays
Message-ID: <ahgUGOsIxlFrf9mD@monoceros>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
 <177995803708.5037.5318741720946502441.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2z3wzt7537jwqmcu"
Content-Disposition: inline
In-Reply-To: <177995803708.5037.5318741720946502441.b4-ty@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-37633-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,chromium.org,vger.kernel.org,lists.linux.dev,ideasonboard.com,gmail.com,linaro.org,free.fr,iki.fi,kemnade.info,baylibre.com,atomide.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 328F15F053D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--2z3wzt7537jwqmcu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/3] gpio: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

Hello Bartosz,

On Thu, May 28, 2026 at 10:47:55AM +0200, Bartosz Golaszewski wrote:
> On Wed, 27 May 2026 16:57:26 +0200, Uwe Kleine-K=F6nig (The Capable Hub) =
wrote:
> > this series targets to use named initializers for platform_device_id
> > arrays. In general these are better readable for humans and more robust
> > to changes in the respective struct definition.
> >=20
> > This robustness is needed as I want to do
> >=20
> > 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devic=
etable.h
> > 	--- a/include/linux/mod_devicetable.h
> > 	+++ b/include/linux/mod_devicetable.h
> > 	@@ -610,4 +610,7 @@ struct dmi_system_id {
> > 	 struct platform_device_id {
> > 		char name[PLATFORM_NAME_SIZE];
> > 	-	kernel_ulong_t driver_data;
> > 	+	union {
> > 	+		kernel_ulong_t driver_data;
> > 	+		const void *driver_data_ptr;
> > 	+	};
> > 	 };
> >=20
> > [...]
>=20
> I fixed your SoB as requested and fixed up patch 2/3 as one of the driver=
s it
> touched no longer exists in my tree.

Right, I noticed that conflict when rebasing my stack to next-20260527
and assumed you'd cope for that.

Thanks!
Uwe

--2z3wzt7537jwqmcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoYFG4ACgkQj4D7WH0S
/k5FBQf+Ibzmukpa6UhZfcZUhGe0XaS6TZpmFiyy9QMJVqt3bKHdEafowQgl32yf
5w0pLkWFfORjHv+FEfH+wollsB7//hBHnEOT2nlVo2tI9s4lxfmJlJBAQYUSOPIs
vKiKxxRT5p4uRCRhV1JWg2TBVimsUw9GG2tTXHK9jOMI2SU3iYsKoSbmQLN9Rctw
k7N3zinvmqjGvYrYWYSdwN8ocBYa0b4JZGH2N3QabvS92i9doS2RMU46QIoCixGR
OLNW6wEonHxnaNjpK36WFWNH/6tXbxKMuWBDM9R3xtDtWoaLDHnMOQNCSsGVMqOI
9uMi39yy5eMdBL5EINcaVkZvXFD54A==
=ul7F
-----END PGP SIGNATURE-----

--2z3wzt7537jwqmcu--

