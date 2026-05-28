Return-Path: <linux-gpio+bounces-37638-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEp7M9EmGGqZeQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37638-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:28:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CA15F148E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F011F31A5081
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DEF3E315A;
	Thu, 28 May 2026 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lc56Ura7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3793E2AD5
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779967462; cv=none; b=Xn1D2wso+nKGjTCUHYy/ySQW6/X5NWyVC5RZdnUu850ie0HzNKaAMOhGthKt4ROXyTOabS5AXob5y9KFx+BmV3XllrIuKY20AzQUo55puQwpQTKOdRq6hBikcgyPX/ddSjhp6NHaSp4EHpEM9pyaZbK74B0q/PTfJKmYNETx9Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779967462; c=relaxed/simple;
	bh=PQBjn1Spk3PrhiMb8zlAkaBC/Ko28rohtLSazTz4QDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xu/tQpIx1QQEgvPp2ngt9EXJOqYDntJnJVxWVqHPtV+VfaXw69gmfAZzCOud+wbIqeZ59Q18ZV42M+s25wwa0HJriJtmznc+Bzv+byBaIJHFsVBoUVKPilOakksxiAVyqiFxPUAlJeoWlMz/0y5js2xtG0Zk+LaoQjgHovkEybM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lc56Ura7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PQBj
	n1Spk3PrhiMb8zlAkaBC/Ko28rohtLSazTz4QDE=; b=lc56Ura7Lr2hNunzaTjq
	eWfIcEuIEac0ImpGGWDW9X1rszIGknkWJX9eeEPj1D1/8rECR/8s4azBn84v7mA5
	XZe+GRLATF39I6D1nTSYGl5V9QRiTEMY8s3b3te8NMy/q8wfdWMvVeuvOa8c/mn0
	wWJ7Pl2vhPdgkIuDK/SmooX5XJ9HB/XNbsupjxW8fj2iP/9ru3cCyUwP0gWy26NN
	pxlBb9Z6oWkaDXRdubKkh46BM3HUzQpGoWkq+pDnXPGKZKNwZ8NTSXM2QQBdZqZp
	fgclp1a1e+NWoGEtaPM9JHV0xoWgSzxiKArib5UbeCzMcMuMQsYPeh3drJUzbxMo
	gw==
Received: (qmail 1011171 invoked from network); 28 May 2026 13:24:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 13:24:18 +0200
X-UD-Smtp-Session: l3s3148p1@KWMK+N5SGN9tKLEa
Date: Thu, 28 May 2026 13:24:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Message-ID: <ahgl4aH8xm2X5wwV@shikoro>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-7-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S3XmiTg052X9DyEU"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-7-claudiu.beznea@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-37638-lists,linux-gpio=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,sang-engineering.com:email,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 21CA15F148E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--S3XmiTg052X9DyEU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:38AM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

I am not a super-expert of this driver, but this implementation looks
reasonable to me.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--S3XmiTg052X9DyEU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYJeEACgkQFA3kzBSg
KbYkSg//f4Z0G3Fm4UgnsJt/ZCv98QFEpU+Z5m+F8DVw1S6KwFc7j/zmSU9mnheo
ff6qEbvbO3DyX36myJ//o2tpofgbyDI7xaxj59sVDQ6OJioWRoKATfoW9XqDyDLC
ZtnnZ2/+B0z+2Uby/4P2CDuPIaHjensRz5mr02c/+QlyFrmFHlBFSXCyEbclt2GJ
ZpQ7O5A8FWjA+Lr41qWATIDTSEaaE05rtY3L7DUoDpzbZE7tSa277WuBAuy6jZ/N
JeVsly1frhndRyTz2hVR1mtTRTOpjoe3WejePMAsHDuZ8HOHt6MANfHj1LnDbf2e
61m3W8sYvDxbwXL6455MjhzwHpYm3DjPvwnfc99N2ppctlILxXqTQtLkEXr1f5JM
bQ1V/WqpENkW1I/zXwEseid9XnJxvJOyy2QcJaHdbRQJnSKdy+J8zuZXx25Q4ywT
pEI4XyXC+wSSDGo5y+nfZ5d2uOAzGqnTHwaq5Zy19gwR8+t33mGic2XktGgSRxjy
VN2dxWSJ6XoL0JwDeYkKqU0aEl7J85KrTw/+eWSqLEGUVAWbXXlrQ8yytXz7kOCl
XJUdxMV7ELvns7DlZS7GDYLC/Cr7ZsGSj1oYkim5ibxij/zTNcZ1v4s47nL6Uy9R
7V9Qvu7le7Qch6B/xraAx6LMg/EKN+DHeLVGo4wexnxRGwWAEjo=
=lDyG
-----END PGP SIGNATURE-----

--S3XmiTg052X9DyEU--

