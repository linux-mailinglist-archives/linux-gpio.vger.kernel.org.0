Return-Path: <linux-gpio+bounces-37970-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YaA+J3vdIWqJPwEAu9opvQ
	(envelope-from <linux-gpio+bounces-37970-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 22:18:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A076A64330F
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 22:18:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=XJAO3cPT;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37970-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37970-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 853433007B0A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 20:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4339B3B0AEF;
	Thu,  4 Jun 2026 20:17:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F13032ED21
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 20:17:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604276; cv=none; b=qRxIR/hTSIikffyrHNr4pQAq3tENbaCtd4W9B9/oCBqJvcAi1LPrlQeWRFQ41NCXHXdINTzWRFaadk9gxYACNtAKwfzdk+DOBlMk/fy3XdckjCJ7rerXgp/TgPrzCw8Tb6GlUXvUGXsYYM/Q6QScxLM45cHLajdbJs8or7+g0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604276; c=relaxed/simple;
	bh=5USPnixnroDY2Ii176W0lkmp5qUYAY3f8YiS24Bm3zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaVXD65+IRZoEH0Eq/AoqKnnbFg8LN9BaLUZpz0ZNNfmmHH0DB/x4TcT3898YmBZVhbq3ronTASi43U/6EN7K66mI7d1mSOhYIoCe/M/gtVYyXnhTGMV9kx77sMqLePw75OegwUOaSjglFJSlJowx5Jc98+xCNOT5feTbIfW6/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XJAO3cPT; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DqGT
	LZeMUHe7mZh6wHehvpuUwVazb5ezhmruKOpiiHY=; b=XJAO3cPTK5IeKDlxxO3u
	/+NCKM+BH+aIl115LTWq8jeE1E8t3P7eTKbitOBNMrdKcz/S6wCP/RHgsxMK+lVl
	Z2b+hZ8j/O6V0ANbtxmyk4c6fFnx800qxFqlv3y0JMkcAA3VUn8Uv9o0wVjyNSmL
	KigfcB2wsoiRCwSZcpCq539Zv4JNFuj52qLzSdsKt1ug7sMk8EszDrNVsB5fMdXH
	h51z819ReIxPeZJ+SikU/ucFGz7a6Fy/iycGtQbKYsZsqdTgn9Ujt/o9HT2v3C0b
	wmQraQ12JJN3muH9cFM/3FgF06YDvgVw6ZAuzrkrLJu1eya+y3E27buWs7hNYriy
	WA==
Received: (qmail 3752435 invoked from network); 4 Jun 2026 22:17:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2026 22:17:49 +0200
X-UD-Smtp-Session: l3s3148p1@pGDrPHNToLxtKDDL
Date: Thu, 4 Jun 2026 22:17:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Message-ID: <aiHdbC2wxXpdqBd9@shikoro>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
 <20260522102251.1723392-10-claudiu.beznea@kernel.org>
 <ahBMKWrKQDko3cG8@shikoro>
 <fb892151-33e5-4bb2-9a01-9abebe0f3b39@kernel.org>
 <ahXQnt4MTVoBB9bF@shikoro>
 <dc1c2c1c-73f1-43a9-a157-7cd362faf89f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qvGIMNYVtV8rCBXY"
Content-Disposition: inline
In-Reply-To: <dc1c2c1c-73f1-43a9-a157-7cd362faf89f@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37970-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A076A64330F


--qvGIMNYVtV8rCBXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Claudiu,

> Standby mode is not intended for power consumption control, but rather for
> placing the I2C interface into a standby (non-communicating) state.

As I suspected before, to hide from the bus. Linux doesn't support that,
so we can skip this bit IMHO.

Happy hacking,

   Wolfram


--qvGIMNYVtV8rCBXY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoh3WEACgkQFA3kzBSg
KbZD8g/6AsqOQ+LHt+PVp68Wk6LgkRF901h/EvOexy/tREHjWUtSAKQjaM4RUIzk
F80+yoBROP5T8gRFl7l9qsrGR12fwHRc4zX0YiCHisyhE1uTEYQLJfoJX8Roy2YS
Ou4XiKl0G5ytkYHIR9YDeyt5021P6eEvbASZs5P7/2hPNEax7KVXrKRVopjERWqe
hzgbWqC8flqQTOBCSsZPnyunG9Ed70x/iIWwEIFgNDlOcKSZXItLYJc2fz+xNhL9
F3l7kgE7jBKSHqbT/ayyO8FamPIISvnZ2Yl/i10HKpgjDEQW7Iqfefh10nTw7IOh
RnewP3edmULxOzy2DeeOHuteCeVqQmaWyVhXBxWoyBhLQY7mg1ZPFlt9xP5G9RGo
zS0nIcpD89ttlWqkjTY59j0eIrquKjVK+R2DuExv5I98GPi97G9WHLaaqHp7mAQ3
8M35UHwBjLV3qS8g/Z30r+NGRSNBTZyjzMH795B1MnPlnhFh1sAiAot+5ta9vwkS
ZMsWciBIQeD1qQSPfPHyfZLnPTG2dTESHx/vXYQt/1sAecC206Ns3OBzguZLn0e+
/d4QF060IG3Bp6szVGpO6DIjew+9tpKpxeBnDdOe9l8zZxQ/zjnbyL7zyvxJ23F4
gEePXhggiXCmRo9U/RrGqGVvSXmhYdqxMQP1bt58ZkMMRkLjQoE=
=9Shs
-----END PGP SIGNATURE-----

--qvGIMNYVtV8rCBXY--

