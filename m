Return-Path: <linux-gpio+bounces-37513-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELXcCGZvFWojVAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37513-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:01:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C5B5D3DB3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16805302B804
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3693DB64E;
	Tue, 26 May 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SGLXMpP6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C05B3DB651
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789618; cv=none; b=Vw/EPKAApnCaV8wcNCz+y7O8mpikYuyilfHdHwp7M+ZwjTmjqUielD1R1x8jYIrSZeCJuB6cbU1Fb2jcAutqosUCKgq8tnhR318HjBOLHdLpGG4CO0O+vu+XNm29++lBukQXp6shaTO+fFO8jDm8b2rsmYcvQpS5Av0nOOSFj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789618; c=relaxed/simple;
	bh=53oS0HoMXN71cfEfBWsGmGMf1p53/OTWbjv/KCX5QcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poG9ME9vnerwHIURXVi4LYE/spk0aHiJCDXHHfnVLJwHtSdNw0hIl2G3QECUDMeFqXPj8+IWbIYsBqDF3d85jke5QweS6m1ldR/wThjMWfMroq2an1YAqxvqq1Uu5Af/XVuQCusZm3QrYuZdSZlkh04ZWKr/K+dqiX7L/zqZ3pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SGLXMpP6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=53oS
	0HoMXN71cfEfBWsGmGMf1p53/OTWbjv/KCX5QcQ=; b=SGLXMpP67cpswj0Znz4R
	3n7p+lKq+Ly/+iIVPYZ7O8tQXObxJPkr2GRW9elaKR/TIaxYxsmXFiE+MjKI3BdD
	aEdb/hYccMuzuMwL9PJZiSnT62UYcpkDmYV+3cVNdVK2EfMwRO09WEGoaKnbG1Mi
	iKFAgljnP+gEhsQ0ATQqk3BJ+XatZKAEDjtwMRzSujYmUAphOG1lPZ4wS23lqpZi
	FzwaD7k8TK81Ml4a+X9KUrLXVKKbYwOB4paTQWD0/W59/itoYZ8t3jHUV0Fh6K4O
	vVLouNMFmhGvlqJUqep9uKm8W2GVcARJFLPWJdm/r+os6XezWPMWlk1W54BQSqFw
	xg==
Received: (qmail 223124 invoked from network); 26 May 2026 12:00:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 May 2026 12:00:07 +0200
X-UD-Smtp-Session: l3s3148p1@7otHj7VSDXVtKXCf
Date: Tue, 26 May 2026 12:00:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Message-ID: <ahVvJmsUuhINA58Y@shikoro>
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
	protocol="application/pgp-signature"; boundary="YB4F818Z5KMz1Xnb"
Content-Disposition: inline
In-Reply-To: <fb892151-33e5-4bb2-9a01-9abebe0f3b39@kernel.org>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37513-lists,linux-gpio=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 38C5B5D3DB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--YB4F818Z5KMz1Xnb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > The driver should
> > know what to do, or? Am I missing something?

I have it on my agenda. Travelling today. Hope I can squeeze it in.


--YB4F818Z5KMz1Xnb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoVbyIACgkQFA3kzBSg
KbY98A/9FKZ3Q0ih0Em1cDJ1nizb1S+3PfQYwRc8phE+m9uDW41njIjH/Ut9E+4d
V7fW2pgwNIu0RmQ3jECYUVXyYwLQSumGevAPTxalGx1sHh+ZzO4qo0Mv9XJmE2dl
YEmWRjPm1toI+/YTRd+ylGrUKKKdnA9NU66Mj9VL1FraVFxf7RMFyX/pwwJAUFW3
6T4olHIg8mSt0qnEnQmpcdEXwL1E4gLeb5/tVxW5ulEShoiDUF7xoBL600TaHLU8
ixnEtmMR/iKMc8SLcVwpZWsw3fn5NLYExtmtLmbkYbkF/t7hK3D9uPr8buSBdi9h
YglkafT37Iu60AgpfyQSuzVu3jWZkvAdjk/hcSKy4YachWnPpL1F2Km52NNFZ/L8
WkdbuwgjnUnACwZpmlOi3pPN6WAR2s6Jnw2lv2meU873+uuM0dEIOJS3xWM4urIS
6exkbXqkht6XOgH9DByHYXorFMjww2v6OnUVyE0ijz0CyL7lQvFB6btbxfBrIuGl
cZMYbGbZKOoOqz8KiIXu6yRaaqZp0jqLhb+lnUXR6BwYvicB52ScStR5+CSw8Dh1
YETuY7sAsAgU5j4GVIBpdqiIOR+O+bEdarfPb9FzoN6sn7wZqFY1h5WCJSZUIbra
5EEE9tgHU7a+gx5rTxnaDniu0C31bMLoG6iWEXty6J0LKeR9boM=
=7Vg5
-----END PGP SIGNATURE-----

--YB4F818Z5KMz1Xnb--

