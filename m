Return-Path: <linux-gpio+bounces-37811-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xOhFEe7CHmo6UwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37811-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 13:47:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B97BD62DB05
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 13:47:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=AwxgrlLm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37811-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37811-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84B8930FFB63
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 11:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5F53DD536;
	Tue,  2 Jun 2026 11:35:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013330F815
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 11:35:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400136; cv=none; b=bi51eJ8PZ2Ydoc9bKBpwMwiqxS/MGj/u2CtOFyvu89JWWjbd4RwgDoUwkVMGDdXltfc2J4AnDf6sWDzP2H8s89/X5per/1zHyb+WFKXaMn0HHsxPT5DhhAHTy+EnlfwGbZpSJLc5wJ0Zv/LRab9CDm+PPUDtbVW+i5BWrkyiv9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400136; c=relaxed/simple;
	bh=uOdOyMhlg/4ykCMFkIgB5lwtIu2oTbxNUE3TfrLThMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPD70ljcjd6FwjLFfsNNQpEyBAPi25dQ/54xjGpG8E/BPs9m3cF12MVjFSifjc6xkaVTejN+2Br+mvfXte+xrJ4/bUQ+Fl4/C7eGq2QdAqaXvOjenLekSUf8Ml8uoZUqPaLW8K698zh0ZvZjxWFdGAtgFool21lvtOyERKTV7Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AwxgrlLm; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uOdO
	yMhlg/4ykCMFkIgB5lwtIu2oTbxNUE3TfrLThMY=; b=AwxgrlLmHrIS8S4p9Kc+
	/oEr7YS9Tlpm2YEc3jKVAg8GgqmE6hVboRKuwKphSImcLQKfv2t2fVdFz9HhMsZi
	d144HwCyM1hcfLUZXrp3GvrFb5kQWEkTJIDmIerLhOcwWw67m/DbHn/FzkGOhfNw
	d6Z+VvDP5rT6T06/TApfxwXjD639FnGaXn/oMH+nd+uUilnR937oBggjM/F3RUuA
	q2KJLlswFG6AWwJ9q21EoqVhXnVevzfKaiww80e7FKU2HJUlBzSptQiPHVXMhEMV
	8tRvIEwi6s5Nh43W4M/nkWWS2Mnybk4RpeYNfpMbaoy5YvQ/dbfCK1ExnAgyp6fO
	Sw==
Received: (qmail 2867990 invoked from network); 2 Jun 2026 13:35:30 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 13:35:30 +0200
X-UD-Smtp-Session: l3s3148p1@DSxWtUNTzK4ujnv7
Date: Tue, 2 Jun 2026 13:35:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 0/7] pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
Message-ID: <ah7AAgK0plmNfL5C@ninjato>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rsfaeCIwtI8MyDA2"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-1-claudiu.beznea@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37811-lists,linux-gpio=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ninjato:mid,vger.kernel.org:from_smtp,sang-engineering.com:from_mime,sang-engineering.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B97BD62DB05


--rsfaeCIwtI8MyDA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
> clean I3C support, cleanup patches for the pinctrl driver were also
> included.

I am ready to test but this series doesn't apply on neither master nor
-next of today. Could you kindly push a branch to pull from somewhere?
That would be great. Thank you!


--rsfaeCIwtI8MyDA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoev/4ACgkQFA3kzBSg
Kbbliw//RSqgU2ZakkJblEOhzJXnCpeLCL8GlK+fDNm548nuABjDL/ujlZQKWCdr
+3BZrVwp690+PXOYhqeL8HU5aQqXKNLsijj973wc+ybCuuvZWoAM6QcWxUDCrD1D
LsF5dLBByVQalpDDcGD1E4KNTWhr3J8WD+MvAGdhBXEd0qUgbNekH4zDLteID1cv
m08qO6K5IZ4H/O69pK+nAn2vpe19+0H9cLyqVDxPZmcl7aNtxH7ZJWRhDczG4qry
RWI3UhPa0EjGlY1kU9wfV1vGxPg6/rcu4E4U8GmfKijt8W+MFt6Mx8nRrk9TqNwz
o3/mrYINCNXjHO0cf9+vri5VvjPUJY5FBxq3S0IBhF+M1otSO3BFmY4XEXYIzdzf
UwmbMxqbyYR0668vfxzISzgHCwqkLcf47m9cnHKtbyNg1CcGCsnDzM/2HEbQJ5TF
IrSeL74lxHNAdrc0kHyoJCIH5v6+UDppzLjv4ItNqeJdYWKaFo/18C+fa+qJdGZv
LSbl9L+4OgclqNL7CIN99hlj09VGEJIkMC/BDoE5aYjiz5OuFR8MkpNkTQue9A4M
bC+naTZdZ6xz3EHYZttBhA5FIiN77fFmxo6VQljIivslrH+u/+ANT7/C20n3YKL+
peALgijaD3xQ3PmH7IMeI77Q4wXR4BsOh2DI5Hl9a8f90SUVllw=
=5DZw
-----END PGP SIGNATURE-----

--rsfaeCIwtI8MyDA2--

