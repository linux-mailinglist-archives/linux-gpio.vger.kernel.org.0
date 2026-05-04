Return-Path: <linux-gpio+bounces-36051-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM8DK7eN+GkVwgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36051-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:14:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D3D4BCCAC
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 14:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CE0E300E3B3
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 12:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689FB3CEB9E;
	Mon,  4 May 2026 12:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="h/qyICzb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5853CEB8D
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777896883; cv=none; b=L/unxacMhljQwVTSfHAdPORhm/GSAqF/PLyqea2csnfZvc0GqgmOGlXV79CCXBrmD8Qp1mU332k9erIb+u1sdaVHBdQAlsbf6Gj0Que7Onqv4EC+lYSOCsfuF2kVDWMcqyYIj71OY6uiksP7O/qjc+mqcU4AvBTF7z197DqhhDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777896883; c=relaxed/simple;
	bh=V43NDWQJfNhkba06oW7pz5YbD7jCUWGuzgCwLqDeyDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/wG8HjnFNw30jPGDKycCeASilVyddW/aVGaW0VFZc8v0EtaFMP2JCJEzzxAh4WuyoBzn1PvVMNyTh6DDkMKiFGC+87YXZrC/l6VP6H0RKRND47y3I+W+0QjmpX8TA/QxZte0Qc3071K2gwz7RZhlBUitcMXMUK76ve0zhZyt7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=h/qyICzb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cExE
	XsEPVndDKl7vKpaLCbJmZNKx9WX5GaDjz0mY23M=; b=h/qyICzbURpq85SvPEAa
	Gx71fJYXSLGD1nZv3YKrTXX+hVo2waDWAryLnU1jh9dUn6UKsAEoBd2Tv7CFC25N
	8OMjqE3XpjWKxOOmG0ZIZCuP1dQ8LS3ubdv9+pyQvMZqrrj5PBNhDDa/v4Pj2hvT
	QjC4Et88XdJhIdwlh7izLJSnpSnWCAO8/CfFvD147bZWfcaWzftm/myfkqPx2EWR
	5zUnKPxwQiU7gIB764F7ezpcR4K4jEok5HebOoPPuMCgFjXI3JwqWZOU7I8fI8xN
	U7P+rrejxgBlhVNm2rfRhxom6AohLggX8e1/IAXyPDWRJxD51uSsXJYNRFa2I+cq
	/A==
Received: (qmail 2193008 invoked from network); 4 May 2026 14:14:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2026 14:14:39 +0200
X-UD-Smtp-Session: l3s3148p1@ePnx3/xQctoujnvR
Date: Mon, 4 May 2026 14:14:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jie Li <lj29312931@gmail.com>
Cc: wsa@kernel.org, linusw@kernel.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: Re: [PATCH v3 2/2] i2c: core: support recovery for single-ended GPIOs
Message-ID: <afiNrr4Llm0LWw-5@ninjato>
References: <CAD++jLnk_5KG_q1aCtpOrTCbhtK-FxXH6BhPFSwukyt2F4uxmQ@mail.gmail.com>
 <20260201111812.18945-1-jie.i.li@nokia.com>
 <20260201111812.18945-3-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gHtIaBqlpccL2SEm"
Content-Disposition: inline
In-Reply-To: <20260201111812.18945-3-jie.i.li@nokia.com>
X-Rspamd-Queue-Id: 16D3D4BCCAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36051-lists,linux-gpio=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nokia.com:email]


--gHtIaBqlpccL2SEm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, Feb 01, 2026 at 12:18:12PM +0100, Jie Li wrote:
> Currently, i2c_init_recovery() only assigns the set_sda/set_scl
> hooks if gpiod_get_direction() returns 0 (output).
>=20
> This logic fails on certain SoC controllers where open-drain lines
> in a high-impedance state are physically reported as inputs. This
> leads to a "deadlock" where the I2C core refuses to assign the
> recovery hooks because it incorrectly assumes the pins are
> input-only, even though they are fully capable of driving the bus
> low for recovery.
>=20
> Update the recovery initialization to use the new
> gpiod_is_single_ended() helper. If a GPIO is configured as
> open-drain or open-source in the firmware, it is safe to assume
> it can be used for bus recovery, even if the current hardware
> direction is reported as input.
>=20
> Signed-off-by: Jie Li <jie.i.li@nokia.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

I think this should go via the GPIO tree? If so:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This probably needs a respin, though, because I will push out a patch
today which will use the new GPIO_LINE_DIRECTION_OUT macro instead of 0.

Thanks and happy hacking,

   Wolfram

--gHtIaBqlpccL2SEm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmn4ja4ACgkQFA3kzBSg
KbbbMw/+PeEdw/KewCYEixRlnGmM6RT4sC8HuBLSUDlj4vb/vzh9ApMW679HjqW6
bBRTOnuc38v8nvMjp+z951GIp31hj6+okDKI2SJy5X14cN70mU3jSBqfbp6IxMJX
mffDPEe9OhRmpKOjsh4Q9YWTlEPofOod3eVmTUiHmzl24LF1+I1d6x4pfG0omjXo
KEE//MD+TlD4CcNifP4XMJ9PAbt9LWuJuDRsi2FDHXuRx8SjTwScDd6ti/amf2rZ
cELdBQwFDoROvWbEDxzcxwrNws2ymEyirwUVeTjLcEElEJKNG7QoMtk03aQLOvS2
l6sOMnS7cyN6GHwzqjJzpBCumjY5qzBebiU4y7hQmbTfg/17hL+HlQtuBsEdk22o
UeSG1Xh5dKHm2KnI/UVb8+tXLj00Tyc1oHfastmKbeIKB5UlxaRubuSXOTN259f/
+6RPxfFsXZImMK3fV7fd62jR71i8nkJaT7M+EnMkQHFOwsmZ9SyG5ohBxncpAE7M
J+LfIYDWjzigE6ouomD6Z1jtnDz2CTs9YZxn8o3cf78UKddjDLtyrQ5W2Wa6CA+W
U71sMrO8cMMt3WxuVMiw4Mb4R2q5YJZqf1ITzvhLNt5ggeVHwq2uFPxLUZef59UO
n5hJzf7TuSkFB7XVKR/5AfbkGh0q8voc1AcuY62TSY2STEiS99o=
=FS/3
-----END PGP SIGNATURE-----

--gHtIaBqlpccL2SEm--

