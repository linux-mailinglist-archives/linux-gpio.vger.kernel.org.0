Return-Path: <linux-gpio+bounces-37637-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP4FJsklGGqZeQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37637-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:23:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF65F1397
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40F023008D1D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FA03E0C4A;
	Thu, 28 May 2026 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cASBx9b8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2143A6B9A
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779967426; cv=none; b=PEzJi74nxjTafMbuOd/VC6TsXd/kYBdBkb+4mA/tNGEZ7E/4f8VAqRnMkiRgEfe5kDptTf9xPWDjWcjpZCMbKcT7YACpzQq5lfJgcLH1dWWpNad0y75ylEJNVF2+kl6Ls8YfOcOxEmx+a6deaFkeDCBFQLWcosigMPNwCVU/h4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779967426; c=relaxed/simple;
	bh=Y2IhhQbvDYhs5lDB/hA0gaAV4opFFXDE/Y2XoiZaaUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Akf3VZzp1d+Ki08+eTBrRp1iyf5w+rel8Pk7N8NYZmJYxK2nYUXZ1MmAVRUFWKcrIGoSWelxK/eIIUnPtr31Sr82d3ZU5Jr/dL/OMljvpxSQPxfvXcZ5WYCGmZTQAvULM+CEOqm106ikyjsjYm6RZ6jcxHBPXQoL2417aDqeOwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cASBx9b8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Y2Ih
	hQbvDYhs5lDB/hA0gaAV4opFFXDE/Y2XoiZaaUg=; b=cASBx9b8QTLLWnXg1goU
	llU+60V5fkpjloKR5ppKDZMItoC4+qFRTX9if9G97IDmiNeWZKPOoJE+h4uo0LDc
	CHpRAIfckPMq4kjRUcL1Jv3AQaYlELbIwlo4RJV1nHNckICgOqACr95eoewfHS05
	0+g1opr+dTgjnuIuyUIC4sb7DN/gAK++K0KoIptbQO4V/M7XK6wXj19ve70g/Vt3
	4jT//ELRR/EoZ0gzxrDNDm1tXnYYqultsN4rlTXNNcIv4vPMmx+/ibABKOYkqGOJ
	0pyy65DE188rSG2uOTr1h9qN5+SmxPYZkC3OYvXCVMvNC8i/+InMZJRHuqG9HUf3
	GA==
Received: (qmail 1010870 invoked from network); 28 May 2026 13:23:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 13:23:43 +0200
X-UD-Smtp-Session: l3s3148p1@aJ7t9d5SgrVtKLEa
Date: Thu, 28 May 2026 13:23:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the missing I3C power source option
Message-ID: <ahglvskSvZjPO0aS@shikoro>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-6-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wBT9HpnkSlYVD6tp"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-6-claudiu.beznea@kernel.org>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37637-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org,microchip.com];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sang-engineering.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 97FF65F1397
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--wBT9HpnkSlYVD6tp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:37AM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
> 1.8V. Document the missing 1.2V power source option.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--wBT9HpnkSlYVD6tp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYJb4ACgkQFA3kzBSg
KbZEww/+OtbSM5d5woQYEwuCnB9dUwB3qkuADbGB4G8borJnMMK728DELVF4rPTh
ejghK3xqcFRe5t+hAtTgEkB5fAjcAPrZZb1nPoh7SD3Qt8Ba773cyP3PSAYU5x5T
/qE77Dtka0GCusI/s4vKC8Y+NU9OCOx4aaOBzDmmAEHPy9h5a5wa3iwXHbBzawn3
Ze6Eh3MD61xVutdNLx/6xYN0nv6tcoa+MZDj8kQDEIv4reCAIEXYfdoqj3GRg2dp
SL2orQSt8+qOV+ZAw65+beWxDjMAnM8o/4iYgYDMsiWEbCSQ9oenjs4p0+GwPtZs
APPed/25zh8RcVd8H8HW6VWLUNy3FPyO0XeOwntQgaDrrlt262EnefrGf5GyXSd8
p9yO+0yAGQgSFZBEfE3Ea7fsQpBkwXFpJusPq1qfc9wjEtBpEoq8fzdXYz09B1zC
M2LZA32WGpWBhciHdz65k7iZ6kksQLtaYnqLQdHV3o0saOXgt4WGpySov4ybuHN3
1xnQuJXjAGWtK3KFpOQ9n9mbN4RhJ2imkeHAG9DEBuECSHIDxcQiYv46m0Qbwf+o
hdCkTHOUppl4nr6+vLaFkyIhVHSlkCidlrhLLKi8AlNhYFjyzpk5JMmdhSvLaoaf
UmIqQzjTDUOHkPPa/XRxUfRccGUuggbo4S+DrZ1OfPNIk7RQFDI=
=ovAn
-----END PGP SIGNATURE-----

--wBT9HpnkSlYVD6tp--

