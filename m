Return-Path: <linux-gpio+bounces-39995-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hREdLCIDVWqFiwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39995-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:24:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF9574CFE6
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:24:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=XvdxBJZi;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39995-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39995-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9013C318C78F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051C637268D;
	Mon, 13 Jul 2026 15:13:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D533F368
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 15:13:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955620; cv=none; b=sJAUes+6f711MKT6R4Ucfw7CMqJ3GuIKysnKF8/oDsaALTckUSmUEIQYPxuv6N/0vbyuqqC7jZ8PSj5UjrHKQaK5PqiJMatzYwfLcMCPgZ0RvjCdzxqw5QhVlF77GCPhStZ77Yfxw4CrlXl5CfFQKLX/I8sqp5hDKcH7UUBIzsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955620; c=relaxed/simple;
	bh=NqBUMuN62l5N2Nf1UtzR+VlT4Ju3NnVcgiOFc6mKLQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQwUSkixtU3kSl6jc/1eU+bYlpKgcqHiNMebBxUpwomtywKpZzXRoD38CAfelsXTrCuw68VZeGsQmTNfFBS4jKcJ/C9vSTKEsh1QrhtCsY0h2nTiMBT13nGwQdEmG70If3k134wUnFoeF04LvORnfjwWbu3zpX2Ypy73xLLXdfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XvdxBJZi; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so294855e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783955617; x=1784560417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NqBUMuN62l5N2Nf1UtzR+VlT4Ju3NnVcgiOFc6mKLQ4=;
        b=XvdxBJZiGOn9DYNXobKCx2I1xUNkxnaPpPOJPhtY4NqsnJRHQ1TtSipMtIIkQlU4cD
         p3XjlgqHYDCEWs8aiAhMK+JuUsM1WjMnCuoysmDv/dbC+FmcwuarSChgOlOBxU60c4qL
         81TyXSGmXG/bk9SB3pgwyjlad7iS/ZYCnjseZyM+n265+vDedRHuv5erkE55uYYyib3e
         defNPDl2ho8eSknuLipDb4Je/LjWaGox0e3S8GqfypSw8SkPM5IgwYut7WontUfK1HZK
         R+Hc6q2fkNDkhRA6Ae7A18nOvSkGbmNOzhDkf2+j1/P7GMdxYwvn95jk0w+s+xCGTraw
         /Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955617; x=1784560417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqBUMuN62l5N2Nf1UtzR+VlT4Ju3NnVcgiOFc6mKLQ4=;
        b=L823QeZ02rRqRWHJNtpa6ojRpz7sI4fuqgvD/Cv78OydQQbqakviK33jKzoWHY9x7w
         ltzMv+Lk9/Ybehi1jFSUgIHjShGAKqT3UTQLfE6KA1695n8Lpt4gM7xKmkaHjZYY4aOX
         UUbtXHNDSumoqdKI6USpSpGvpKUzjvyOHlCbrPFH0AzxuLFA/xkBYwQSomQ65Dc6qk4S
         0MB+Qq3FXbmemOSULTEOKyRvJiC3qD154b10SmxK4AW+j07ZoFtRg5IE8O5b8/ez02PD
         coBNtmDPteFTwb2Cf1VHzWuOyNmPjgMuyFDJ3tkx3mS7jP/omBf4JWClL/Q67H4gCYmB
         YSmg==
X-Forwarded-Encrypted: i=1; AHgh+RrjdCr95t9ncRXtHcwVYGQfbzgrkakrBKEP1wdfvuSmEV+dwuWynVitWtz3k23R6FokmotW36gaK+yI@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ76N67OOWjfcN7/zhGAMNPlyWd3D4ztBVCSLWTe+k/WYPgoh3
	UOB20QGGbnbfRo5Exq0cC2AvVrG+kS2tewU0SdRzRQuGAfillEK225SNqmIvkVJC3Gg=
X-Gm-Gg: AfdE7clKRIUlk+wQLv9LygfXGM1DdjvId4/ZGKAKaoNFyZeUQwtWwgoDv8u71gj/2PS
	YwnddMpGC2BK+UgiepwbCx2IqGRIu9vp4eXaBjCOChXL/zVQ0OtexTT0O0I3DSpG9zXe6+Y+/xz
	EF0ItBK5V7nQVt+4WyY+Z+GZuAYKAShe2UJNxEIE+gJeKJUpDiur09+mH+4aE4RbG9+AxBn1NJm
	emro7gZXYZwuwvEAMGEr68lkestvG63C32BFPQ78yToCZfRcD2JEuQtNVVs6rpv4km4W9S9zUPT
	LQLKBqnQsoObF+ugx/kK1XgzNdT3qbvIcENpk8eS3HZCeqlDlG0gamv1TvLlzADkDaNJxl63YHV
	o5YKevV/U7FZW0XRQp0qRiSvEAWKD++va8SqEDYdROBieD2o0SgdZ3itBMvoQ/UxBGNVve5Ctqx
	IrUBw8uaHzsactK5iA5USkf4t9Q+AAqo2L5UYAygQR66ktJ1kLphN+7qFhO8iRInfbmQmsacZ6/
	gN6vQhwQz/MulI=
X-Received: by 2002:a05:600c:310f:b0:493:d115:d835 with SMTP id 5b1f17b1804b1-493f87d5800mr97585625e9.8.1783955617181;
        Mon, 13 Jul 2026 08:13:37 -0700 (PDT)
Received: from localhost (p200300f65f47db04916e789240f263e3.dip0.t-ipconnect.de. [2003:f6:5f47:db04:916e:7892:40f2:63e3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a32c65asm1588755e9.14.2026.07.13.08.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:13:36 -0700 (PDT)
Date: Mon, 13 Jul 2026 17:13:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
Message-ID: <alT_Scg-gKCvnx-M@monoceros>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-6-o.rempel@pengutronix.de>
 <alQS61NF-jIPf9c3@monoceros>
 <6fa34460-7753-42cc-b88c-4e5aa58a8e90@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fnnztlncnaaigsvj"
Content-Disposition: inline
In-Reply-To: <6fa34460-7753-42cc-b88c-4e5aa58a8e90@roeck-us.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:o.rempel@pengutronix.de,m:lee@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peda@axentia.se,m:kernel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:david@protonic.nl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39995-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AF9574CFE6


--fnnztlncnaaigsvj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
MIME-Version: 1.0

Hello Guenter,

On Mon, Jul 13, 2026 at 06:20:48AM -0700, Guenter Roeck wrote:
> On 7/12/26 15:20, Uwe Kleine-K=F6nig wrote:
> > Hallo again,
> >=20
> > On Fri, Jul 10, 2026 at 12:13:54PM +0200, Oleksij Rempel wrote:
> > > +#include <linux/mod_devicetable.h>
> >=20
> > As for patch 6/6: Please use the <linux/device-id/*.h> you actually need
> > only instead of this catch-all header that I want to get rid of.
> >=20
>=20
> This was only introduced in v7.2-rc2. Not all contributor branches
> (including my hwmon-next branch, which is based off v7.2-rc1)
> are synchronized to that release candidate.

In most cases device drivers don't need to #include
<linux/mod_devicetable.h> explicitly. In this case the driver uses
platform_device_id, and its definition is provided by
<linux/platform_device.h>, so the #include can just be dropped without
needing to be based on -rc2.

Best regards
Uwe

--fnnztlncnaaigsvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpVAJwACgkQj4D7WH0S
/k6XiwgAgXFXSkiO5tdspT8X0L+4tJrphihgjuzS1A2yZJ9tMyfIvhcg/eiXPZSL
DWoqAABbSTdxTvxvOW6IIptwPVfkVSRE6pw38mmzCOa6Uqa9ClQiPwM8kJl5A7GQ
aVxOaEKxIaq5SUS2mzzZ1G57e6DDCK3T9kEAydlf5d5D2gSjfm35CmyFElLfLwsH
SsvdxTDjsnmfHke5OKhgFXgyTUDJ756s7YmmOH/9RByitjtSPEgcZjoz9SrXqWfF
Wg1G9bzYGoY3SO38PsRu3hwGtkBSxrSkSuReMIHTdgm9cQiNHdq7VjBvKztmsz0u
o5cEjK8RfXLOMD4EaqpaVl5hJvDTXg==
=ac6S
-----END PGP SIGNATURE-----

--fnnztlncnaaigsvj--

