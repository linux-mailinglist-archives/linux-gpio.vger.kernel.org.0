Return-Path: <linux-gpio+bounces-37639-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPBZDUUmGGqZeQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37639-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:25:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18D5F13FC
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58AD9301070F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B42A3E315C;
	Thu, 28 May 2026 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q5LwtU0o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD6E3148D3
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779967540; cv=none; b=bm0cECljS4x7iygAGEnuYxgxCParFAnq/PEjl5nEt1OeaBC4SdYJPNcf+Qb7RaayY1fXCBv1xtk8Df3YrfmAxPcSbBrpm8C2CKaEhMTR1/PGfvof3mwu22w+jhqM+n/y66qgEGT5laMbV/AhfNwX3z9Ojw4N6lqB/B63/tI4azw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779967540; c=relaxed/simple;
	bh=DtXO2lOAxbaONjy1k/5GUx9ANgVGTHhxWIO8KGZDHOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWNiYZLDGzyIDdrWNj92ihbyRgBCC6EOtAlgdMI6UczQKQ/gqemjiFOb6nqIXlpsDZ/CWt68t7ytY7w6tVuciD+MBVsJeZmw0YHuNTs6q0pjCMftQ6b3LrR2my2u0NY9QSuJOhnL5uFoEK7dEUGOnMN1o2DdtROAKGYbLWKIo0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q5LwtU0o; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DtXO
	2lOAxbaONjy1k/5GUx9ANgVGTHhxWIO8KGZDHOE=; b=Q5LwtU0oK0Ok9m/yhveR
	zw9mhtYlvXxFuJ3+bNIUYiMb4LUn1hIEQBuetixI7BXVsiKzEZNTjcdMjxcTKDsX
	ZLz+711VgVpwUvzJOfCtDnUR5xbxr5f+hPUHC9/5S8nnWYQmT1fjOpIOh7WnrIUj
	sue4Wrf1YPRfxjyU+6K6mcmNGeMlrss1DYu7gkCy5WTsTjF2oYM1MC0fTleBlQXQ
	T+1AXImxtY06meMFSokoA4N29XXuyt+VClPrvW/huSbt5DbY48fyOTvBWQPxQ1Vk
	fhmJiWLNFkmfkgVUN5GODya9gOlDpQ6j1K1YnR2Rdfzcp3xSIfiELTKOPFHlnejO
	hQ==
Received: (qmail 1011734 invoked from network); 28 May 2026 13:25:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 13:25:36 +0200
X-UD-Smtp-Session: l3s3148p1@VXms/N5S4sdtKLEa
Date: Thu, 28 May 2026 13:25:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Message-ID: <ahgmL9IOonSXx1cl@shikoro>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-8-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vu9TEVT0a1+AoUUN"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-8-claudiu.beznea@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37639-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sang-engineering.com:email,sang-engineering.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2E18D5F13FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Vu9TEVT0a1+AoUUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:39AM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S SMARC SoM board has a connector for I3C interface.
> Enable I3C.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--Vu9TEVT0a1+AoUUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYJi8ACgkQFA3kzBSg
KbbkWw/8DBa1+aiRAZnIyVYJoUjEy85W8O25qzDEKmeWs7KeIT440OxTzzvENzcp
uI0v9E9NkLsiZVhxmrpA4FfIWl4c+e6e+z6+7zZGOEc7zdy7Monkgwb7xLR2l6mB
6X2UcceL3/dVi5deL0N+ynECRoo4QOFHL+2iKKn+Fip/ss7DlZk/QvfTF4/psHlV
6J+osZp4RhChcIX/Vz52F/orwU7xB9TZAurbVEtypWq0e6MKT/rwZq5ayAhFeT0c
kV+iUAaOFgHZtFKNcDqHlnLwugI8TMUqIjQtPFCo2unj4OlNazyGgWmOvceE14wl
8/7eLcuYUX2wESeP22XrzmfC3fRx1yxNIsgbMSqV6QuejK4cRqXL0ycOi2+QFK/J
IBpwXyNRrZBD+f4uj2pXAnhKIT2jS7eiG2M9rkFrlKPHWA1mmlnzcix8X9wEL/W0
5Y+qmijGYPCRT3eKNkF2HR0iSrz0OMs4yNbE9evhwFxkqlE4PKsviOPplrY6rrN9
mn6YiqdugzUKOAx8nlwiRHjvBVlPPwBZXV3sIhaXtL99MqgU2AVEbcuQqyMFS8ot
7AdnM+bu0mtTOJ0eK85yVUTFEz7Uy8jgb6G3JStDwpY4cvUfTmGoAyjU+KIMAFAq
7etSoRiHgIKfqqzA8FWM/yj8ByUY0bruM4/F1NN1sS58mxTgb74=
=T7uI
-----END PGP SIGNATURE-----

--Vu9TEVT0a1+AoUUN--

