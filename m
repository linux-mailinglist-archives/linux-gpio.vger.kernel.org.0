Return-Path: <linux-gpio+bounces-40093-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tgGdCmwsV2qwGwEAu9opvQ
	(envelope-from <linux-gpio+bounces-40093-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:45:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952075B302
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:44:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=REgrKqT3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40093-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40093-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3166C3015621
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 06:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11C731E841;
	Wed, 15 Jul 2026 06:44:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5FA314D13
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 06:44:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097864; cv=none; b=NuIxtjFHJLooIQp2lyH9OmyzBPXhMy2iUEwCWrm3EwwNjoWJJ6jlUAHjyu3+S0RZIO4jmsMvpOzxxqL4MOgmrEmGhtueu4wdo1kUjchBGQCCrfXaplV7lgddV9SlysdSPs743g1Hmu6VTkpwVocBKu/SjlTcRCNpPGt5sUabod4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097864; c=relaxed/simple;
	bh=+kA3nSbFa4Ogf8r6NabcYWGWd/VBqw46prALTJkh8HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTwnC+LCnrf8J4mIFlwifiapeGduM+NC7JreAZpSDNXNg9vKyAKIhu3sqTiLyWZ2u9zzp+iU9U2pYywXLttKZ4ZK+88uwtiiewN/7437yKFOI6GJpc55/5mJTKZdzTDFCqj+GZ7Lb9iaLw3sQoN+iULFcTVZf9Dkbo4ouho7M5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=REgrKqT3; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZrIA
	Wq8VBWe52Wl6jWZTX0KnBkNBTujcfVrsIxB+/58=; b=REgrKqT3IVsfimxiw7K6
	Ote4bgqu/kAVhFB5ezsULdY4QNNuYJ8wBdsTZmiK6f1enHlRX5gdPgnYlN3zrJFg
	K/UISDdxergHiaICIS63SgjPUa4lI2m+kzPmwStBVwiHIHIU25cIlU48dAGVT+lB
	fKGa5MkMuPBfuHZt5j23VA4OACk2PcFPAY0G9SJdg9IB5wAFem2Lu+er96ET1FAj
	xArWiCdg/S8RfzXeaU7YbFv408w6ikOe/t5IAhgP5kNUzSLQtpWxOOkZ1ahAWODw
	OtsT0IWnAjWKnN5wGpTGJ782X2ZBd3I9zjkm/pqJJzXSx2wXv8Sc9JhjEFbAa1gm
	6A==
Received: (qmail 568275 invoked from network); 15 Jul 2026 08:44:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2026 08:44:18 +0200
X-UD-Smtp-Session: l3s3148p1@ksERp6BWctsujntW
Date: Wed, 15 Jul 2026 08:44:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: brgl@kernel.org, linusw@kernel.org, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: AW: [PATCH v7 0/2] i2c: i2c-gpio: Enhance driver for buses with
 shared SCL
Message-ID: <alcsQH4Qi741r8s9@ninjato>
References: <20260714162915.3018703-1-markus.stockhausen@gmx.de>
 <008301dd1422$da3ce390$8eb6aab0$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IxTJi4DGjgDksVCR"
Content-Disposition: inline
In-Reply-To: <008301dd1422$da3ce390$8eb6aab0$@gmx.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:markus.stockhausen@gmx.de,m:brgl@kernel.org,m:linusw@kernel.org,m:andi.shyti@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40093-lists,linux-gpio=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:from_mime,sang-engineering.com:dkim,ninjato:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1952075B302


--IxTJi4DGjgDksVCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Markus,

> Maybe you can have a final look if i2c_gpio_create_scl() is ok for you now.

I saw that Sashiko is happy now, good work! I want to test the updated
driver on some boards with simple i2c-gpio instances, just to double
check that there are no regressions. I ran into issue unrelated to your
patches, but I am positive I can resolve them today.

Happy hacking,

   Wolfram


--IxTJi4DGjgDksVCR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpXLDgACgkQFA3kzBSg
KbZb7g/9FK4ptKTl2CxP6p3R7sALmvT5r4WZGKHPU0ZKP0YF0Xx1V7xTI0Cfo93u
yvKms4jbKZb73I2i5xiqwj33Ez5FMN+y9E+jc9SLoff26zNM/0clqqA7m7CxVS6J
awTQzF3j8bfmcvqvUx+oo4G/xdieVpjgzuaLBEfXCjjP1+tEzV33WTlXbei699+7
g1EkcQnIfYth5094c65lfAM2rsExWtlTqsL5POXuqIqxDlBjsohtdCvLklmuQtX8
mJQM/ni4fDvioIyBecTSJDL4BGuJHq6evDK1GJrOqDxVy/zvl+qTtu+2i2lsBvWR
YlfCw0RZ0/l84zIAAAxLUMOty0v8BSQ1gwE6WJcOJboSdjzW63wP8mjZ6IT5xX+U
H6VxInYYFURZ3I99xX/O6NNT1Md2wzzX0FavtPLU3CLJUdJ9xlivyu7RIzHqrQbP
TyYY4Dpa1kn4oeQ3T5MSPjyua34Iaymvwox23WfNuPOdhD82bIn9kRFeWHBRroC4
HloEekhboqjQVWQsMA0pJ8Pz7CTFxLBVZvKxKM/HyxyXq4CcHctEINdAhcssNpNb
IR9qwKSiDUxslaHZ6FkPzOzhZbMa5ZVs/Hklqa79PpRp15CFnBFTl7FBBinhp2pG
HqpQDsbGRwPwBz7uZgyLKQmK6/fRnTC9RrAl1CqFMwuwsJc18cA=
=B3pF
-----END PGP SIGNATURE-----

--IxTJi4DGjgDksVCR--

