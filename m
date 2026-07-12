Return-Path: <linux-gpio+bounces-39939-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6k7aA8wSVGrNhgMAu9opvQ
	(envelope-from <linux-gpio+bounces-39939-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 00:18:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50890746204
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 00:18:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="SYvd8/f1";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39939-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39939-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7AE03010518
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 22:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEBE37D131;
	Sun, 12 Jul 2026 22:18:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA140374183
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 22:18:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894721; cv=none; b=nGhPvly7d9xGPdymG7Vofq1C5zD3UNKApAEyXTcFUx8sV0KQ0rMpBDJGDu1tfIrR+tsSugRXoot0RdiFgMH6ut6wgrizJzjAXKTlx8JlorPRdxtQ2qVbO7IRaYXiP5m4pU8zaZqdSDdbBtt922vFX6Z6KPN9GFmLkFZ1lL9OQXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894721; c=relaxed/simple;
	bh=vLcKFNBxhpodb//qeCLhZsR5WtnnqPoCncdUW5K7HZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ex26F4Imgld2Ffx+ZxDfdOG2zKGNCBow2b37YtX9rl1i5JkqyzDxRn54yjfPT//D0AugpKt4jVUFHXWiwXJCMyRDcK4dCrGTQUZuL+Wad4ET6D+XhwleUdMrLPi1i0aLc5N3jS2+H/03vQbHoZr9SGaF5g2jDQrUrXWTOeh8vSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SYvd8/f1; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so19357735e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894718; x=1784499518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLcKFNBxhpodb//qeCLhZsR5WtnnqPoCncdUW5K7HZc=;
        b=SYvd8/f1GkVo26uN1sDNj8YcR1200dKfJpMlviB1fiJuMY1GpWZ4D60uSKg6pSeWqH
         W1KshbyfXQkd+QLm9Tkjvfu21BM3JT9+9grhvK4nuDXBsP/4sxfxYuUs3hwMl+6X6o/V
         Q5QdzI4rgBQdRphFYe644lOZW9cnYP4DuqdP1Nxn5V13TukEkPoPmX6dQbl+XqtG0bj4
         V7LoAzZa8bujGhkcnMD3Os/yWn5SGwUgNwRQwjUuWsEY0tY9hLn41VVk/7khzj+JvwoZ
         4xiDDaGcDejkG4bhgNEG0CTBjMZ7ZEmObFUQYuBVsLiaB1OaJ0CvARUPLNIa0XNGhjRB
         /wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894718; x=1784499518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLcKFNBxhpodb//qeCLhZsR5WtnnqPoCncdUW5K7HZc=;
        b=XCJG3Pvu5lyGgRz7Y1gyIaAEzwMqLBnQ6/dPKQiM1qKdofrepgtKyBD1gT4FBO7YWB
         6iIXAp6C6lBQ3yi3eXdbBJZGf/vHX8WvsP0wLec11MWFfShKaOQFsIWMA7BpCZwxQ1Ch
         0Nk1O2STu82uACIeElNmEV72pvbTiVJaqzC4Ar6o54Ns0G/vl1EyFgc9JG0Ia5yMEhxZ
         mE543ond0pwXXUT/W3fdvFqfiT6f5E6V5Lfgts7sY4EXEn6Ci5RjuChuS/YkoUZV5Tch
         2kN24RCbdfcFRSvMQUlcgAEmim7v03fZZjqyFJ8m3gQu2WU95JsKVsFQA4JooQ/iZ6GK
         YqnA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9WS1/GhWEWmcxBBFQ/TDkQPpxrf+dCpL3tTwpaZrtkXmqDBii3ruGgvK9WZOOkRYU7/7acL4l6Gha@vger.kernel.org
X-Gm-Message-State: AOJu0YxSE+egrvdFW+lLZX8TRdWATtby4xhmnDZ9r7aJhlmAQfuiSYVE
	KsHk7g1K4HnXRsQIsaDnAL6FEB3m0a9CifsSdhV6fNt/ZJRc206LlLkKtgtfO2x2eCI=
X-Gm-Gg: AfdE7cmNhHk+En4VFuMQmOU4o4kVIOls30FngQ+9TBtl49ZCqlhDBSDdzA36kUimPhs
	uR0V9eyp7QS4/tcA7MbvpN4tC8QlBvFxUVsP9XXZGI3A4OPrMVSecN1JFakqcyXNCjrpulCTdI+
	YB6wE0U078X/LqhKs97w3UAQw80eseTDSADFeZ42z7/hy6hD3kjvGcfykeba8To1ZwxfpKkG5zS
	WsAozoclvwfIVIWaXGSPQ/4N4EXo+cgr603m4Cv7tvpIYyYOGrOnxMrdvRbqFDc2987Wc9S7Kb0
	ziQPKjiTtiMPHnNGQ3jWapRuhgKiLipnfPT2CmWy7Z2OPKtJ+2CHNAo62LH9hKWFfaPfDgpGgOF
	eT4fxu2/loEXCjaj0OGxDpUna6Q0alVqMq7lhVXZdgIu/tJKtbt2rqTsu8FO3VXXLDbU3K43MEO
	PHtWSjgk2F5N8vonO8Ow==
X-Received: by 2002:a05:600c:821a:b0:493:bba7:e9f4 with SMTP id 5b1f17b1804b1-493f881ddfbmr69533515e9.18.1783894718245;
        Sun, 12 Jul 2026 15:18:38 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f3a60404sm208209235e9.1.2026.07.12.15.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:18:37 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:18:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 6/6] mux: add NXP MC33978/MC34978 AMUX driver
Message-ID: <alQSpYuvWBhcmXiw@monoceros>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-7-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xa75kozsviiaqnx"
Content-Disposition: inline
In-Reply-To: <20260710101358.2606941-7-o.rempel@pengutronix.de>
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
	TAGGED_FROM(0.00)[bounces-39939-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,baylibre.com:dkim,vger.kernel.org:from_smtp,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50890746204


--6xa75kozsviiaqnx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v15 6/6] mux: add NXP MC33978/MC34978 AMUX driver
MIME-Version: 1.0

Hallo Oleksij,

On Fri, Jul 10, 2026 at 12:13:55PM +0200, Oleksij Rempel wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--6xa75kozsviiaqnx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUErkACgkQj4D7WH0S
/k4Zfwf/Uli+EGozhERxEMM+aMPVxN/YajmFKISNWVqGjXen5K8mBam+vK82Q+Z4
J23Wi+RSCD0BEE5UP2FbdJXBWMFgtoyakf/d2jHC/sK5x+t7chMUAVHu5/+HrD+I
PNzEQvxtGX7hvoQxgTBgL3cG78xuKe9X39nJgC9anxUHwbtTijw7vlJ9mFD/MIzW
qlOFEEfvo7C2Vgn+balq78iKqt68Uz5HZ6zPIhUZxFWFGan9J9AubQ+OnJZbp/pT
JE9DLX0Cu7RQgp4WO3QW0//0fVSH73uWhfNCZsqzi+tVMi2j+tYDJ12j8X/fwMSb
EnajiIR26AGLlkjj/xZ8gHubZoG0BA==
=dbVe
-----END PGP SIGNATURE-----

--6xa75kozsviiaqnx--

