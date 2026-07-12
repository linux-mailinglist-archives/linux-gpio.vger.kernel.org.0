Return-Path: <linux-gpio+bounces-39938-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j89WBjcHVGo4hAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39938-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 23:29:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53343745F93
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 23:29:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=Imxhq+WR;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39938-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39938-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A9F300D6A2
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 21:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32211376497;
	Sun, 12 Jul 2026 21:29:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97690353A76
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 21:29:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783891762; cv=none; b=jT/QYJjcbXcivNwMB/9J381nO2MdJJ9/ExXyqxJZbZhUT945ZsdDoIHDgToN3ue8US0TP/tMZ3iFWhapAxS/AsylroZg7vHuf5PA7C0ORbq48NYv9xaRLKcKN2e518q5tpn07fBxhIQf4Z8LddfJHXbtbTSUxmWEs2owycnSxkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783891762; c=relaxed/simple;
	bh=RC8PHkGtjBF7VWxD6pT/WmNtIjKtqslpwPCPjVf57d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJwylbK9KrTXWSNr+qeLDpbqLQF19ZVzKLtCUwONLY6WKAmVj+b21Cw/AEOvDlgTTPV1ak4lby2Pf+Djy8psxFOBUPdrEKSagmOz60OiFeVOJunh1a+Vi7kl4NmRQmR0VQ8WIj0ChnrCanCvGdfn4uraJ6XDfpQ/xCQour4HogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Imxhq+WR; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OseJ
	XyQrkZlpiyc8nsYvB9RbJuPeZUuveNBh4yWKybU=; b=Imxhq+WR2LF0/umYpFlI
	UiKi1R2b19ETqhbwy0ovXi2i1oJjzbEaSAYHntgyEqBL6EkFP2QjuGf7plDa5sd4
	DluzbowPBfaVgZ5cjXz/fBfaAsBfc+RgRlwsVVndteD1gMEt9NVu2iTw48piIaOP
	v8uSR/DjeEtjXOfdaBi0l/6EpFe1ZxGom/RQTrJCW+9TIVmWyZszqVjk1kAGVioW
	BgYc10eVgXNnCvwkzuLlKTkAJveJ++IUPHv57hvC3pFMG00OLg8uXWEbOJUQweVu
	vgTWhkpWrRwipgv+3O4C4Aw6wXvnBdMkWJ7lzUIjy6dhmenFFARVcUCjwLZ9Wm47
	Ow==
Received: (qmail 2346512 invoked from network); 12 Jul 2026 23:29:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2026 23:29:08 +0200
X-UD-Smtp-Session: l3s3148p1@9qX9qXBWCsgujnun
Date: Sun, 12 Jul 2026 23:29:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: andi.shyti@kernel.org, linusw@kernel.org, brgl@kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4] i2c: i2c-gpio: Enhance driver for buses with shared
 SCL
Message-ID: <alQHJFSIBq7QZren@shikoro>
References: <20260709062534.2864521-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OOfdtW65YoVhcYew"
Content-Disposition: inline
In-Reply-To: <20260709062534.2864521-1-markus.stockhausen@gmx.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.stockhausen@gmx.de,m:andi.shyti@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sander@svanheule.net,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39938-lists,linux-gpio=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gmx.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53343745F93


--OOfdtW65YoVhcYew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 08:25:33AM +0200, Markus Stockhausen wrote:
> Some lower end hardware (especially Realtek based switches) are
> designed with multiple I2C buses that share a single clock line.
> E.g. the D-Link DGS-1250-28X realizes 4 I2C SFP busses with 5 gpios.
>=20
> Enhance the i2c-gpio driver so it can handle such hardware designs.
>=20
> - Detect GPIOs that are used by multiple I2C buses in the dts by
>   using a unique identifier for each managed SCL.
>=20
> - The first probing instance allocates and requests the shared SCL
>   GPIO plus an associated rt_mutex. Subsequent instances detect the
>   existing entry via the identifier and increment a reference count
>   to reuse the descriptor.
>=20
> - All data transfers are serialized via custom lock_ops that handle
>   both the standard adapter bus lock and the shared SCL mutex. This
>   ensures mutual exclusion across adapters sharing the clock line.
>=20
> This patch was successfully tested on Linksys LGS310C that has two
> SFP slots with two GPIO based I2C buses that share a sinlge SCL.
> Test environment: OpenWrt snapshot ported to kernel 6.19.14
> including CONFIG_GPIO_SHARED=3Dy and CONFIG_GPIO_SHARED_PROXY=3Dy.
>=20
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> Tested-by: Sander Vanheule <sander@svanheule.net>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Well, what I saw looks good to me. I have to admit that I don't have the
time to dive into the corner cases of its complexity. So, I wonder if
this patch should be resend with lkml in CC, so Sashiko can have a look
at it, too? This is optional, though, if Bartosz is also happy, we can
surely try it as is.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Oh, there is a checkpatch warning:

WARNING: please, no spaces at the start of a line
#225: FILE: drivers/i2c/busses/i2c-gpio.c:440:
+    return a->fw_node =3D=3D b->fw_node && a->fw_pin =3D=3D b->fw_pin && a=
->fw_flags =3D=3D b->fw_flags;$


--OOfdtW65YoVhcYew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpUByAACgkQFA3kzBSg
KbYeXw//fYqFfMEJEHDfe0DYFVEVYXYhC+M1iubKFidw/NJ4OTAL/ZL5mOAk5Peh
i7xxpy9xhbrg752qU+CQg6nll429ZzrO+xWT+yfDhmceficv+2D6UtsYAJcuesZ8
piW+Bdgi2EUVpmN3zIqT0a9PSKVFoYR5nRiMF52+t3RCYXu4CbJXSV8xhqlF0+Ly
eC9wbJbxcbvHeUMJ7o7QA7c8xF6TNKl9l+A+G+jkNOAeUdNaY/aWMM2CNvekDPQM
TDPluTXnChMu1scUCyMlgRsHybcGu33v5Rq25IH18dBp71sgg3vqdpTdJHABkyrd
KXhnEAGU4enWRe2vq54rS6ebAiwum4ust6+vVUnv/5mEuIafD3/KA380lwl50Mev
aVhYkD+PLytbDz26/8CHRyJnGKVpc2gf2A+se3KES77AAqyFKbdJ9jIXnIvzwv8a
ZS/s2X3lT6zxIsSFlpZOWVqjurEZl5TNHOkCfCIbbCDsXHu79o6Hq6NIGTmTTSfk
xpIJPAia7Jys+lLLX/8W7Rxrnz8lmhbzDu0VZGg/Dukq6hr+E6aiaOIYUh6vktnb
cEC1yI9afcmbZ1grKy6vYpDCIPsKlWmNTisZtJxTywx0itH7/Wss9FZfwUJJsenL
zR3MSfcJorj5uaR/GyWUWUb+XtkttqJoeNE5yRddwWzo9pCg/8Y=
=yLYN
-----END PGP SIGNATURE-----

--OOfdtW65YoVhcYew--

