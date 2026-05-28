Return-Path: <linux-gpio+bounces-37634-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKzkFpUlGGrkeAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37634-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:23:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A0A5F1373
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 439693038537
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4B13E121F;
	Thu, 28 May 2026 11:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ys0VAzBZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F23CF02B
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779967263; cv=none; b=r2djuT3G1XnmfvMuiXDhLX1+RD95K4X3vhNtbi36maXFRZjdKYhHEWpMh4EENACePMqwBPI9mFUQk6FvwAFP0oFfhupe3znpb0a3N7gr+UZc6cEyZYJ0ICJ8ZI2jcwnf+5XMIndUXxgOuUcFDp5kIiPGkh14DtZCtfJRBCKsEdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779967263; c=relaxed/simple;
	bh=R9wm1vrTcP1SZg2rq0PIfzXxTOvb+iBbcNLM6hemEDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJ4X8z6reQujkTfTt1KMoBxbs58JVAv7iXurDkVo2Aqn96emQq8Ys3QksaxqmfDFizHW4UEmVuDNsQ1WXZimr+OLpoBc5MpIW2pDJsuI9BlOMEfO+wgwv6ClUOudoBqL5II32MI2QwSeiinNug/AHZZ7Uy+LZbtjaHPru73Hbxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ys0VAzBZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=R9wm
	1vrTcP1SZg2rq0PIfzXxTOvb+iBbcNLM6hemEDY=; b=Ys0VAzBZwuab20BPgXW8
	8aa2t8tT4u5YvSbtwBI4s0CwIS1mbb1iOF3RIsseD1cigjDL07XF59lgsU3d+sQ6
	R3Ec1KxDgVevV3tsY96lqYLUu/mVYzFh4rRjfjwBr47EQ0zBrbtW/NhhCFoufiD1
	zfCrsz+jya9pfVaRCLhLAgKViJpwngFRM80OHHUvSBF/sPClxKwXz7yOGAIE2gXN
	YQERy28QgXRgCelBVqZAUcSnjNbMh4EiXSQqpT3nL9a+8cBlKvQH2HttIeqhmGot
	+RSrMwh/h5MJyV9daG0tL9xMiiZwQCbyuvz/PGKKWsAuMWFKIgAF9T7lgpCu+KBL
	Lg==
Received: (qmail 1009500 invoked from network); 28 May 2026 13:20:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 13:20:51 +0200
X-UD-Smtp-Session: l3s3148p1@CNGu695SRMFtKLEa
Date: Thu, 28 May 2026 13:20:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 2/7] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
Message-ID: <ahglErzmYlUtVc9m@shikoro>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-3-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4WRD9ApdtsB84Zo1"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-3-claudiu.beznea@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-37634-lists,linux-gpio=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sang-engineering.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: C9A0A5F1373
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--4WRD9ApdtsB84Zo1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:34AM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--4WRD9ApdtsB84Zo1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYJRIACgkQFA3kzBSg
KbacDQ/+IBviGnFMI8BR5derxvWcmdygIQ/PQrhwqLg+H+bpODCQu/TZYVEmbxfE
wum/t3noLYMuUy4OWTLsFc7S/XhR43iEtMz310/Xw+/k75cM2UedT2/nQNEz0R6q
ScLrvxNFYS0/k/0B51mWE8UGcO2R1v40pP0mV37C3Uc0FE3bxaboe79pyJ7RN3zc
Z9CcigLeE7szD6FJlV5VJ4Ap+03JwFCgH/X/zly2rdFmXJuJ+vyOl2GUKD/toNq4
9YoSasOpIzE7CBpJTXxvFiSzMoYbiS99yCbi4640p8Nt8h4qzApDdaQpU/Ehs1eN
iRlEznB5hQp3KjcwfWMk1iAztx6PnhKEnK4AIkMMNaXnHmexvBagzLHKlmuy8wxF
EUPsSepw3Rol7nkdaP3c4e0owhYeU/W9IUVRt2NoDd6mBwHtGoWeE8gvH7a76EYN
N4iEb6+BRdYzBP5gHOFxqucmEd8n6X70yn6JpU6vsgvvHc5poNNe0gZUS0OfQGgy
wAhZ5R0Ip+xv3u9/ohz/HWn2HwBME6RITF8c/NyTChmKwUX4rEXldZF7eqdEr559
USmCD1HW1SIuutmUPVSqdcWlZkvcoEeoXlsKRzuRMSPHj5oHn8XMkF0d9H+mEyu7
bqZyqsdeXhB6HPcKwOBVo0eWvCPhqFgFaQCvdLKLfFAPBMY/lNU=
=1msF
-----END PGP SIGNATURE-----

--4WRD9ApdtsB84Zo1--

