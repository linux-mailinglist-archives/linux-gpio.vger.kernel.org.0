Return-Path: <linux-gpio+bounces-37635-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEh0HTwmGGqZeQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37635-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:25:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FFD5F13EF
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0615E30115AC
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648863E0C47;
	Thu, 28 May 2026 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c+yVdGFA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB6B33B6ED
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779967310; cv=none; b=pYdNsv8G9h+f+9FdpbuhKgnS8rCHNjJqldKEk3LdeR33clXYMDxCaVu+t3DWGSLUeHzNH+qeIRnTpaYtMJLBYSu2bQb/6p+egPwH1zXZhsuwFZD/n5ZIqFQP2npir7nvZeCdk2f1Jn0bUQmYls1hVejsttg045etImlP1xHCXTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779967310; c=relaxed/simple;
	bh=s1GmZm5g4BdhWCf1hwDPuK4Zr11N1yzUL/N479kJohU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRsPxDkA9AK++AqJN30dYanxNhfIG9sB9vjjUdWyFIBmrZmiem/atqyC7SRTjs4OTTDwsTls2q3356qkN+pCS4DsQrMvD0YvIczqofXRaejJac5En7W1GhHVRS2ixKjcYAirUC2Dz+vQ2t7Nron4OmVdcK6GDJAbPBzUQfQQE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c+yVdGFA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=s1Gm
	Zm5g4BdhWCf1hwDPuK4Zr11N1yzUL/N479kJohU=; b=c+yVdGFAjFX2KPg8D50z
	wPL4DTj84OreKbGY/qXQi1SV5qsGoBYzvnlw+42CWTUZWQu6+Rj7fW5IL2ZZGwtQ
	+9iAzjF0DAUaml+dOnVQCIuTp3cxGr48VJJECauX2OwnTZPX6hN3Y4VRwioOZW9R
	0KgSaIYHhxDCTt9/RtnHYHVEQzn22v6LAY7axTahwLTm+cQkhcByWI6ORzVtMsl7
	3USowEAtnYr9u/NB9RTU59cTYhHZL7SEs478LWg9+t6ccXCK+G6c8bqMTPo7o5ff
	FOujZwipmI79xdNtbl5ZqW897Do9iBs6lmI+jAWceQihOLfiSibFnz5kJuNhPyH6
	Mw==
Received: (qmail 1009909 invoked from network); 28 May 2026 13:21:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 13:21:46 +0200
X-UD-Smtp-Session: l3s3148p1@ppr57t5SmtFtKLEa
Date: Thu, 28 May 2026 13:21:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 3/7] pinctrl: renesas: rzg2l: Keep member
 documentation aligned
Message-ID: <ahglSZbOA7hgnuCK@shikoro>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-4-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n9pDofZDCfNvdWxQ"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-4-claudiu.beznea@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37635-lists,linux-gpio=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,glider.be:email,sang-engineering.com:email,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 13FFD5F13EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--n9pDofZDCfNvdWxQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:35AM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Keep the documentation for struct rzg2l_pinctrl_reg_cache members aligned
> with the struct member order.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--n9pDofZDCfNvdWxQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYJUkACgkQFA3kzBSg
Kbb++hAAkdEyQNamKLwRwJSNYF5yxTgYjq+oNSGyIakRnWZAmkw8VUp+glG8vpjH
XTW1xidjiwsAphkSo0pEv+3rHkLql29wA6176cbJBcz/5IzJxhCOguOzWXVl13OZ
PGXT2gtEbtrgCfeHeyvhQN3eGcuJo2/Ohvqgb07ROLk+CX0VOLacwM3mXsYlH5Sx
ckKB5kWwF1Dvabt2aVGDCYFI3HX2I9toCjWxUvLAa/hijspaPbd6ph3O78UEQJYo
CSN3IKPFh5yRwCoCMDkejPxgUYCZs3jwgs3FaFEk6oAvbHak+jLxjq4kJBIQZ34X
KRCr1CWa7uGvAvBRYICUu9Vy/7BZcIms8HEfeEbGNtukh5yKhEUt2jefKZiguIPL
Hvc7ATOuTNMphG0gY/xX5QWY3BJJCQBNRitbSD3e4vPDDF64gWIQ1fYZNrm9Gzs9
T2sQz+Af8/gJLQrFUIkSCV35F+AqWXBuhLBDaxX6/cKALXhIx4RNQRWavpBdpNAh
o6INLKyWrPKOcUDJbLLlC110LLfvQ+dE5o1X5+6WQc5+I+ly5xzwTmmHzrzpwGva
5Qh2N7zBUExuVwfQ+jrzkLliOO9V15UXNa4eiZT6JtAGX2tHgRzc+yHmw6S+mHT5
rmQeidePK+xoQ5PBOeNkNNMD+XmyAJeDD0RHdJU01wGmJAqZ9i4=
=X7ux
-----END PGP SIGNATURE-----

--n9pDofZDCfNvdWxQ--

