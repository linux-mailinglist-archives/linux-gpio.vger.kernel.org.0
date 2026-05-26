Return-Path: <linux-gpio+bounces-37541-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCNCFTTSFWogcgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37541-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 19:02:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 465005DA4C7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 19:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66758303D252
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 16:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733463FF1C5;
	Tue, 26 May 2026 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Dd0BeatO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632333FDBFC
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814566; cv=none; b=Sn6RnGjwGo+2Jmk/LOHKInHUxSYaCEv6GAVvuNomDVkZ0EOBH3pmI1EcaukKAblauVuT5XSnlk4SNUYEZZ2xx1B9SQuCr7gffUkxuxaB4B7nnIuQbe30rnxkvRCri+3/RAjsvck6C3rvfZP+WehO1LAbrzqJTjo8ZsuQc2JckWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814566; c=relaxed/simple;
	bh=jcvxe0BxKUGlhCARFFb0VfNaSr35iqpLwDgjTvYbWbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czyXdsZXh7Hx32pqVCUlimskAyYjkHVZcZbpDuovnWy32eqN00pUaGJ98/fs/E05l/UNHgR1nsz/4zLmooyAdyot6AtjpLieyNg4LJae8gg8oxEgBjAwO9MJLJBZLfuryIbSFmC/6/vdTkdw0rrblmRLsXVavITokglQGL5wcHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Dd0BeatO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=iD4T
	UgyB93O/7A4XIuVqz7PsEYOPEYYUIwqRRLojrlg=; b=Dd0BeatOVZAj3xpfzQAh
	KnUoPIDJ8NWUejDSq4Nysb4amCCYSdyoPCTpXEKCPiGOdrCc84QmxVJBOmZJ43ZR
	lO7C5tlONbLsWpwhJ4ZKJpxZ9/5/Tg4XWjHketwWiyh0/m7RJ+BFFOkuupfg1uzG
	HVehMQhjHUUGuEagJdN07lUgRoRC+TKOLKBBQk/MhOozvMuc2yLKWhH+M7Lruz6e
	p4x2V3lviNnFd8x63urTwsQTDeR+XxdjTIbuOL7+VCc/KpmkhSKPv+I1d02JSiZO
	DeH+nnmadj8CWbVCvRc/MebKAnFT7n7QPEFN2FgEqlSr0A9HBPl07EipOuysLabA
	Gw==
Received: (qmail 346646 invoked from network); 26 May 2026 18:55:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 May 2026 18:55:59 +0200
X-UD-Smtp-Session: l3s3148p1@6/WMXrtS6HWSAB7I
Date: Tue, 26 May 2026 18:55:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Message-ID: <ahXQnt4MTVoBB9bF@shikoro>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
 <20260522102251.1723392-10-claudiu.beznea@kernel.org>
 <ahBMKWrKQDko3cG8@shikoro>
 <fb892151-33e5-4bb2-9a01-9abebe0f3b39@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qag9In8SilDNru8h"
Content-Disposition: inline
In-Reply-To: <fb892151-33e5-4bb2-9a01-9abebe0f3b39@kernel.org>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37541-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 465005DA4C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qag9In8SilDNru8h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

> Could you please let me know what do you consider we should do here? Do y=
ou
> think we could drop these pin controller setting and do some particular I=
3C
> controller settings instead?

My original thought was: If it was a boolean state which is active when
suspending and disabled when resuming, then we wouldn't need a customer
specific binding for it and just do this in the suspend/resume functions
of the pin-controller...

=2E.. BUT ...

reading more about this in the manual, just raises more questions for
me.

> The output is fixed at Hi-Z and no data is transmitted to the inside even=
 if
> data is input from outside. =E2=80=9CStandby mode=E2=80=9D is available w=
hen using I2C mode
> only. (Not available when using I3C mode).
>=20
> The current driver proposal don't take into account the IP mode when sett=
ing
> STBN though
> pinctrl_pm_select_sleep_state()/pinctrl_pm_select_default_state() to keep
> the code simpler, relying on the "Not available when using I3C mode" part=
 of
> the note, and considering setting it when the IP is in I3C mode is harmle=
ss.

This is one question I also had: What does "not available" actually
mean? Did you confirm with HW guys that it is really harmles?

I also wonder about the intended use-case of this mode. "no data is
transmitted to the inside even if data is input from outside" doesn't
really sound like a mode intended when the whole SoC goes to sleep. Why
or how would input be even transmitted to the inside if everything is in
a deep-sleep state? I could also imagine that this mode is rather used
to hide from the bus for a while for some corner-case reason.

And finally: does this really save energy? Could you measure a benefit?
Maybe there is nothing driven at all in the sleep state? Then, nothing
is gained? Not clear from the datasheet.

Because the datasheet is so sparse with information and because it
doesn't say how STBN is intended to be used, I would argue we should
skip it until we know what it is for and how it is used. If we know this
somewhen, we can still add this in a second step.

But for now, enabling I3C realiably is the first step, and for that we
surley need the POC bit to select the voltage. This is easily
understandable and straightforward to do. So, my suggestion is to pick
this low-hanging fruit now and reach for the other one once we have more
information about it.

Happy hacking,

   Wolfram


--qag9In8SilDNru8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoV0JoACgkQFA3kzBSg
KbalBw/+PYGp79tAsAoZgns4CGQEnSzrX3Mo9NVfIuKw8bfup2uQw2LOUcD9IOpZ
8Sr5nCdCvV+Le1pXslt4wLq5Iry3b95kQZsvJh99o6rNXrYUjnidAXnWabM/uNyc
weSvVlMCpxttD08lBFnlEuG1UktU1xs+hAFrphmYvuhw0slyWceBT3TFBbigBztU
mpbPzppKp0p6UqarAYu/ZjhtxkjBV+p752dPmjLvhpluGxpvzcjiLE8BExqMtflf
tniL3L6Oaszw2XwtbmK2+O4oYo1+gE9uFLLxY+84cQ64vffT5+I1Wztvw9OYXZMV
NCstKOwK5o7G7ulIw8YgkGAi8g6IfVSt8Qu8xne8/1CArOGoZCMH5BWOCfn2niJK
OdCWG36DAorKHhQ+o1Kw5wvcqb5oIl0+0LeFxt7aY0CB2WLCsWDSBjwSFN0jByvW
FOHktnPDQQydIuzFckuV5Kfobe98weAI0kqHBYBNrsohUFNzZY882RZY11Gplp+Y
o+J+Kc10BidYpqVZWSQGek+YiVxsrra2RZA6rohl+cS8KhJvVBvr+PAKMHhEdmF3
V/elSBH3RuV4wv2qMA+Bs4KiRlbUq0K54iDY+QH79/9TVwqtzoTKy6wj/oO/4Ogn
vs6onVlVXI75DPdZH8BADVz+utkkzPXKF7kukcNs3c7F6/E6yyA=
=C2e+
-----END PGP SIGNATURE-----

--qag9In8SilDNru8h--

