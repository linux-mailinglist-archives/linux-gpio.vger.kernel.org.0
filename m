Return-Path: <linux-gpio+bounces-39922-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zJwPNBBcU2p8aAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39922-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 11:19:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF617443D3
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 11:19:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=UkjLJ7O5;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39922-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39922-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E9933010C35
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2026 09:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665E438E106;
	Sun, 12 Jul 2026 09:19:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C63770B
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 09:19:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783847947; cv=none; b=l0bAIAuoKh463wLH/UNj9wGJ6sdx38bHvM8Tb3sSVKbQV1Z1nfqKfxJBreTAr9q2Njd2tP3r/1Cg6R0ZdNlH7I1KmW2t5jnnl5YJcFdxOXSG/k8IxlTQAgYREkQfLGiRfRckDTTMDAdyvyf20WGseH751qXcaj/UooDa6ig0C/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783847947; c=relaxed/simple;
	bh=3QIfR6Z3GbNWSOHpHl2+zhw/ErTRo6P3Retr6+R+0j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifQllzZIW+2XIj9fiGrTo7F6WGesNzFHSMN9AuY4QY2lk41i9ieNeZJkcOav21zjPzn+sa6oLT8ftZaytHTyMuYC66BSwh8/0+sKYA4qxdhO/JK0jnBXTh4wbzI6PhZNs2foh9+W9MAeeXg1qK5GQP6Sq5bNIUbMLCk01o1yOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UkjLJ7O5; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3QIf
	R6Z3GbNWSOHpHl2+zhw/ErTRo6P3Retr6+R+0j0=; b=UkjLJ7O5HT6JogjfW2nr
	q3GfAjM1z/Dp9D6xurV4Vhm6ewYrPqIpBG0OW9S2NDvKrmWNnFyh4YenT9R6g+xj
	VePkKZJsoeUq3A9GQLdfuBEXslWbaAMihtZaAd4iO5t3pORHa9eUxlIUZJj3YWeR
	CBFsz80k4EJq53YgxdfBZmN7mviMJXI9t5XezmESZ5tz+Lin28+EzAwwWnCtjCIm
	Ek5tNPEWB0J2yBjpTGSq0fvahsZxBNXOmvI56szLgZj+3ynnhaLRQNOaNOrEc5a3
	0gFNV8Z8KsJWKIISHj55FemoFUN4JHZgFFx3JspaS+MjlkMT5dwtHVOfDoChEP5p
	Dw==
Received: (qmail 2175920 invoked from network); 12 Jul 2026 11:19:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2026 11:19:00 +0200
X-UD-Smtp-Session: l3s3148p1@n9LIdmZW3uQujnun
Date: Sun, 12 Jul 2026 11:18:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 0/5] pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
Message-ID: <alNcAytiUKstopnM@ninjato>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9iJjO0Yi0a+jdzfx"
Content-Disposition: inline
In-Reply-To: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea+renesas@tuxon.dev,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39922-lists,linux-gpio=lfdr.de,renesas];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:from_mime,sang-engineering.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CF617443D3


--9iJjO0Yi0a+jdzfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Changes in v4:
> - dropped patch 1 from v3 as it was already applied

All still works on top of linux-next as of today. Thanks!


--9iJjO0Yi0a+jdzfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpTW/8ACgkQFA3kzBSg
KbY1iRAAiWHXU2s8MoxYlkS9Qu4lFBL6KrA0Vw9cYiWx3/x0Ig1arxZJ8tWYwy4T
LgG5CFnlbic5gJraW1pcTWnjwAfGJrG9T6nneEHyzOnrGRCw1cZ8sjBWivM+ve/B
fCsryLqOrgOZqHE9NKDMZXqJlKQyYc8EzL+TfJUwuRe5/vxRvYGY/DxPWf00jyH8
zTL38z8yE/G5+glsJy+Xr5Ml5tAHa8MrBHzP93YmozdS1lg8Iw/JlDlJeYgj+WTT
3q6z46qS6hM2wSFMhdtHxGGmmrXqH8HYgN27ZQuliY2iKLaj6UlO5zzgV1bZEaon
artFC9PhofZS+nDuzg+tpisHWrjYunPXR7H/ICsbuSxA4bH0dIppTUekQA7A0UBT
8H/DI292V/eD3m+WzIyIDjXdLRNhDFam1qGLcaAEkseZy20vkh6Rklzvds6oNdQ2
ZRV5/S+Df7vBhXf/Q/D21pS/V7ogwpWuC7gfn5RkWs4BgNL2c/GIlMO4D1r4CPVU
Of/MNyUxk89g8pVyqjBErU3J2Og3UWFhcCb97T4u53+nhhOlkHn+rFDNOj/Nork0
vYvsCuXjUDUCAYwaJs3oFEDrta1oXr9HoqBNFwwKcOMO3NLhw4ntK5C6VZDkaU2u
HQHfiPsqxHLCkcLU+tlMH+ktLSgnHQEMsM1nfZUkiMqWrQ6wpDc=
=TKwm
-----END PGP SIGNATURE-----

--9iJjO0Yi0a+jdzfx--

