Return-Path: <linux-gpio+bounces-38016-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FShpBAcdI2rzigEAu9opvQ
	(envelope-from <linux-gpio+bounces-38016-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 21:01:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35164ACD7
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 21:01:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=gc4GYF29;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38016-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38016-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BF74307A0D5
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 18:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E7E3EDAD7;
	Fri,  5 Jun 2026 18:44:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD643ED124;
	Fri,  5 Jun 2026 18:44:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685054; cv=none; b=b8ecDleDJ1weuDmHHlDRxfNGIAae8EVOiti/UfG/AjQJobXMhtF9s7ozqzGw7Qedr0LyFkZoTzIT5D/F4MQpTX1+UB4pjCfmByAlZqVgr7fGtR1TpPYwZU6xA4/m23UmTKcgGTbI5ubldb0drFSsH+FcIhfQTRzHy6JDOPSEU+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685054; c=relaxed/simple;
	bh=VkS+9PTi0bQprMQXirOvrqsFrc81uGcDDom9cGbtCYc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=syJybyI1OIqIs26LYyaTQ1tjPg0EAwkgVEQ/y6fe80VnK2ZMiH+4AI1pHtEB39MX7J/U+BdyIQcJO/whPXdMELudAWKs1gLQHCN/6+RMljGh43k9dFSHWlKkJUlnZvfUvnCRLdwvCvlZInqHEnfARCYjctTD3FaNODnsr36Maug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gc4GYF29; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7ED05C5847B;
	Fri,  5 Jun 2026 18:44:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F4885FED1;
	Fri,  5 Jun 2026 18:44:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A962106A25E4;
	Fri,  5 Jun 2026 20:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780685046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=VkS+9PTi0bQprMQXirOvrqsFrc81uGcDDom9cGbtCYc=;
	b=gc4GYF29BRUao23NMlI0LlyMYh33Db14Qxyye3dpp+chRGxjIbo8V04fYY5mSH2fVXC+NM
	jKWN3o57sxbYH0CImLh5FtHdZLSCcyr/2Jlb3AQHa91atGW73LU9UG7DjjEYAzxP5h+P4t
	hpPgF7AWeTOwfg9LlVtmHA+pqbUFa2WeyHlzLNef0fvmJXji4tZ6tFwF45MCzn1MeaVnOl
	rU2+0D9fScncvf3GlIK++n0wR/ZBU0emOSPmd/Sya7gz6X5EyI4kSduDdnj5x5LuI8LJFJ
	NS3PS/O8/GU5kG9q5KRIMxEDn9vQdgiH/ZUaL2HnmrC2KRzHnzO5+qpz237oCA==
Message-ID: <4c56014675089901aba5cf648f0e79caa66852c8.camel@bootlin.com>
Subject: Re: [PATCH v5 5/5] watchdog: aaeon: Add watchdog driver for
 SRG-IMX8P MCU
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij	 <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Shawn Guo	 <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 =?ISO-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones	 <lee@kernel.org>
Cc: "thomas.perrot@bootlin.com" <thomas.perrot@bootlin.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Date: Fri, 05 Jun 2026 20:42:50 +0200
In-Reply-To: <bcc88b28-fa45-4a75-8a09-98d25a9377c9@roeck-us.net>
References: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
			 <20260408-dev-b4-aaeon-mcu-driver-v5-5-ad98bd481668@bootlin.com>
			 <bcc88b28-fa45-4a75-8a09-98d25a9377c9@roeck-us.net>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-D+anXI9Ca6rCMw2yVrbP"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38016-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[roeck-us.net,kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jeremie.dautheribes@bootlin.com,m:wim@linux-watchdog.org,m:lee@kernel.org,m:thomas.perrot@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-watchdog@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:miquel.raynal@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.perrot@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,bootlin.com:from_mime,bootlin.com:url,roeck-us.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F35164ACD7


--=-D+anXI9Ca6rCMw2yVrbP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

On Fri, 2026-04-10 at 08:49 -0700, Guenter Roeck wrote:
> On 4/8/26 10:21, Thomas Perrot (Schneider Electric) wrote:
> > Add watchdog driver for the Aaeon SRG-IMX8P embedded controller.
> > This driver provides system monitoring and recovery capabilities
> > through the MCU's watchdog timer.
> >=20
> > The watchdog supports start, stop, and ping operations with a
> > maximum
> > hardware heartbeat of 25 seconds and a default timeout of 240
> > seconds.
> >=20
> > snip
> >=20
>=20
> Odd, unusual, unnecessary, I would argue that most people would
> consider a fixed
> timeout of 240s as anything but reasonable, and as the comment says
> arbitrary.
> Since I am sure that I pointed this out before, you still insist, and
> I am
> tired of arguing: Your funeral, so
>=20

I apologize for not addressing this in previous iterations.

This will be addressed in v6 to make the software timeout configurable.
The 240s value remains as the default fallback.

Kind regards,
Thomas

> Acked-by: Guenter Roeck <linux@roeck-us.net>
>=20
> Guenter
>=20
> >=20
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-D+anXI9Ca6rCMw2yVrbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmojGKoACgkQn8ALBXH+
Cu1ZQQwApYSqbfzLii5Qn294byLHYxr56RVOi+0rrMZsZzcmBNOHG6H+JE6QGpRb
/UJIX7OVQ/ACKJIEL/QKR3SvF2DLvY97BCX2wBslodNzcRyVuHvTMEppM/bmQVpL
5LFpUdHxXDVoT6dUmwqPCGOH+HGx0OX1L8EBo0UbEcNin7gyYspy5cI4V+0lsK7Y
64HdBFpCtJmsu0OfWl+W0RLhZpxEPSFB8NbUJg5V0TqAzZZi3p+uBsLWqX944ocT
la5kreLGE/fKZQ6ctWCN5+nT0neZ3lJe7LofrUYjJx8GapWavmD+cSPscqf537Sw
oxdfMxcmlmWUEFOPLo1MlUrASdoss8zNuNfEGt0MitxTbZizPqS/wxteZib1gb6O
x6Klhpl0Q+CCfP0ZIhSbVWMD9GY+ggelFfDEmn9HoDoH/Hz4Xbw1h3k4YWYp8d4f
0YUf1QZC51lDB3J2DXJLVDCAzuSxDW3Sw+8eJ2gcBtcRD53nk75t11uZOCNafXnL
Q3BgaQyl
=ns9k
-----END PGP SIGNATURE-----

--=-D+anXI9Ca6rCMw2yVrbP--

