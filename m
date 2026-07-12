Return-Path: <linux-gpio+bounces-39940-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UcJrEV0TVGr0hgMAu9opvQ
	(envelope-from <linux-gpio+bounces-39940-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 00:21:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9D2746242
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 00:21:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=lN8G7KxX;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39940-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39940-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0232300C91B
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 22:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7184537F8DF;
	Sun, 12 Jul 2026 22:20:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED337A855
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 22:20:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894826; cv=none; b=BRBltqX14A80DO1fd379B1riNh5TATcAbqHlQUG7mQiplDklpPpEu70tNIFcrQJLInpShLVBH4zK3Nqg+h+vOGwQJKQf0TJZ3VXTzkszl2OJAMwKRG7fJeG80CbHl1Ijd4z7jTb008fpNVXcCh3mNgjbulGYRrJIixtmno/Dsts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894826; c=relaxed/simple;
	bh=UaMv9jjDVMG8x3MdfIlU0zA7Ho7EYQX5iZFhg+NF948=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNwOS6kJOUUznuxg4FCPf6rK7abkN4ZA7lKhfrCjCewtW8rEF1joy7kN3jKLBK2umurfXLswT22ty+MvyAepwg01u5qsz3sCU0tUppP8wKIHj0f9LNxtyqqAuVMZpzzqz9h6KV/CqTAMNFFYFaW6TqxGK3KASG9PdwNDxVGp/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lN8G7KxX; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-475881b9a4bso2478910f8f.3
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 15:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894823; x=1784499623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UaMv9jjDVMG8x3MdfIlU0zA7Ho7EYQX5iZFhg+NF948=;
        b=lN8G7KxXSd8P7G3ZbIDh7eIE215G3TJnw5wbSyafF2wb/HoNhbLnWvE3f7+CSR7VdJ
         Zrvdm9DhsMGgVLDkBL9/I/NGtdQV2ySKuOiJg0RshKEinonuG42fSMUYo2hL856HI7w5
         xqTcPUrwXy3zeIwz6VSRPYOlBTY+BjnGiU2PkrB4vJE61xLP2w4TlWeAQfdieT5QI9yY
         fyLXGwixtV4lXE27vKr0oYOhhr2YkuoleNP5YQDwP2ovrD91jVQBV/Tz8SfTfx8N402p
         aKiHMrfTMYLXW/C4aLgpnXZncqFun15LgBcRttfIK1t2xSWqjwC6EpVjLscbp0TmjyxH
         UgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894823; x=1784499623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaMv9jjDVMG8x3MdfIlU0zA7Ho7EYQX5iZFhg+NF948=;
        b=bqYLTSsastWdeRrcbw4deJWW8EndPZXIGDp6Ue8wKXGpv3PVVKgNinhToHtZ8k38yl
         O/tPmmau3DVIPFCeXIufZQYAuCSTlrn80e83AlRryL7JmPCVeMCK+IMxd7jliG8zyLRH
         OrxGd6BNZV+8IrwHheKIgE2wgX8N6UjwnGmq4EWUuGeLuF5QSxyVdIF7GoRjVohG1Nev
         7JHm6ATm7JtMzVdOvx3/pgQ9djigZCy/jyQaVBO6492PJPtuF8IdwMJvRoRarw/tNmCi
         tCdl5Nq//Kdy8MkdgFqIoeB54veCr5scV0BoudYHNuBoCeMqNPoo1Mdnz9W0cnlCm2IA
         Byug==
X-Forwarded-Encrypted: i=1; AHgh+RryYXeJ2GX/uydD85Yriakjv2hNDRx9SI/mFQWS8MNPLMCiZpVcGCkcPkElPO+FHVU3ZL+Q7zZnml/W@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8GTOl5RJr9m9jGKI3W/3E8a5ptOPs+yK7+6guyCUVoLHt/tOE
	YwPMQ7Wa9Cgy4LUhUWoL8caTaiD9eVd9OreVI4EkRNMwzfLqqVLAhwKZAvo+zqGGYlw=
X-Gm-Gg: AfdE7clVmSdMmP54jo+7Z2LcTtQcF1zaI/Hp4KFaMfwQyjgCLUWHEaXt33FMsSKORbR
	lOjRHRSNMfoBXQ1SkwHJ1JVf/Z44OPig/nojFtagj8SjZ8Bg9bYivCz88wd1TnxZZNkQMM5HkRj
	WAmQtKejRMmLwSVzyAEPBtrWHs4zTqPW6dv5Xwf12p+WcLmHYCYK5vHbAsJi74qyzyMmi28jMjT
	AbHSz8erfAnLXtuBI0GSjhWh0rAQUCZ5yF3N26liy2EayVGOlHybE5lSHCbRS89zHVuFIyOhNED
	ZGbQrEvZcReE+/UzmqsY26c6Y4r8viBarQyNm5wLupZ0dqpZvHAKUyCzVIVYGCqsH0PHA31trw4
	anVG/MU3h78xuDpj4XDrWgEObc3FLGYybuiKdu6sPwh1j5YU1KzZ/7cTfzW/ldxpneR/LEPfW3F
	4kO+RCgG+1O6zb7vIVlg==
X-Received: by 2002:a5d:59c7:0:b0:461:a16c:a5f4 with SMTP id ffacd0b85a97d-47f2dd1f29emr7463754f8f.33.1783894823120;
        Sun, 12 Jul 2026 15:20:23 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47df6a31dd5sm36072226f8f.16.2026.07.12.15.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:20:22 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:20:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
Message-ID: <alQS61NF-jIPf9c3@monoceros>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-6-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eoelryauyxzr5o6p"
Content-Disposition: inline
In-Reply-To: <20260710101358.2606941-6-o.rempel@pengutronix.de>
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
	FORGED_RECIPIENTS(0.00)[m:o.rempel@pengutronix.de,m:linux@roeck-us.net,m:lee@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peda@axentia.se,m:kernel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:david@protonic.nl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39940-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[monoceros:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B9D2746242


--eoelryauyxzr5o6p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v15 5/6] hwmon: add NXP MC33978/MC34978 driver
MIME-Version: 1.0

Hallo again,

On Fri, Jul 10, 2026 at 12:13:54PM +0200, Oleksij Rempel wrote:
> +#include <linux/mod_devicetable.h>

As for patch 6/6: Please use the <linux/device-id/*.h> you actually need
only instead of this catch-all header that I want to get rid of.

Best regards
Uwe

--eoelryauyxzr5o6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUEyIACgkQj4D7WH0S
/k6v6Af8DonIBzgXRrAro1+NrzXfsyTcCvnpo5z61gfP7EYxqqQKmKb4nW1epVP5
C0qUafv1PYdk1SVNnLXcfezjA5hTzPObf6swpviDD1rKLmbL+IlC8LRDThYP75i2
6I2JbSV4MHpHV/CAeZPN8lJwEWWFKPZT6qMZSjL6i574MZkfBsAUvJbjktBJFMGL
19L4NPedixQWc4G2xw1/NUeAlhXt1Gqrwiff/nLqJj4wv0uf1VG4Oai9+wNNbzeS
u7Mxehx/iaIobftfGIEuo8Gh1zfkg8rG3Q/6HWZJwKDQtwSpcOPIJxCfGmcJQQi7
A1H/hqVhq/Ypnl6NzjF7vqu4eSFLRg==
=xsmz
-----END PGP SIGNATURE-----

--eoelryauyxzr5o6p--

