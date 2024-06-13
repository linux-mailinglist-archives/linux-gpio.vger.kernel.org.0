Return-Path: <linux-gpio+bounces-7425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77F906C15
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 13:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D934B2489A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 11:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2101448EB;
	Thu, 13 Jun 2024 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M9oMaEfe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782C3143870
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718279157; cv=none; b=YENuqz22HFwNhQvaJxD/6zbE4F6jbnyVmHfP4girlPfzrP0GO8z7oiOBX/+OGkuXgHcJEJls1oujGmm/dAAO5U2yIAWDidM70GWzRNbDVGEPxQ3X16qhQnT9F22ti542WfOBuQdI4eJP/rpbTn52ggnkrWxsrB8UAvI9YcRVJJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718279157; c=relaxed/simple;
	bh=Qa+5tsjQ/bWxNqR4apitZPhLGQVDWmyu06aJiU9YzWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oevltXt3oqmDjG5ZNu+0iq7mxJkYN84RlXeZETogBeIb3B8l7Jp7PBpHHGFyYexqdJBP8KGaH+mmgz8Oq1HcK3lK1WCHQ4cs/qygB2rZ8+QgaNhLn6NsmJI8dM3J9BrYt3KQHrLy1Fyue10VBPRvjZ6NPhPbyyT5ld4952dctSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M9oMaEfe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Qa+5
	tsjQ/bWxNqR4apitZPhLGQVDWmyu06aJiU9YzWY=; b=M9oMaEfeYi7Jffs1G0dJ
	r/xKT0b+DkaPSGJpbJ3AxwH2q0skr5XCb5y7hyc5awQ6z1qDrpgmSdr9UKhulc41
	gk4B7qEoN4EUedxN9gSB5d4onvcDsZYWNk3vRT9L9Ll1/Yg6faxLWP4owfJa2NSS
	VzwIB3fnnNCGUvFuUToibVmUVB2PgnyrD/8lKZThNC+BpPJmmBIITS841ENV2f0m
	/kj/i7a9W7PRa4eO9z5Bo6UMI6QaoMYXEWjweD5EBLDhlIrm+UhMfWb1P0vHhRZA
	mgOW5brG9aSrV5+zQ4BG7oWQEcvQQgkUf+KmDRGrOSs0rw/cghSP3QaS59juQ5m4
	9w==
Received: (qmail 1158433 invoked from network); 13 Jun 2024 13:45:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2024 13:45:44 +0200
X-UD-Smtp-Session: l3s3148p1@YygLCsQa7s8gAwDPXzjQABqqX1QYyOSW
Date: Thu, 13 Jun 2024 13:45:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <dke5qpn2opfd32jjsla3iwveg7rq3vzo6fxo4axxxkssl5umyd@hbbjtaosxbbs>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CACRpkdYYy_0QnzO-qPusYPFK2qFs=NG-t-X=GRjLg5DHX_k82w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="almjs3lru6qbslqr"
Content-Disposition: inline
In-Reply-To: <CACRpkdYYy_0QnzO-qPusYPFK2qFs=NG-t-X=GRjLg5DHX_k82w@mail.gmail.com>


--almjs3lru6qbslqr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It says what it is, not really sloppy but really low-fi.

I think it is sloppy because it cannot guarantee equi-distant sample
points.


--almjs3lru6qbslqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZq2+QACgkQFA3kzBSg
KbYkwBAAs/f9/Phxgen69SUCMHYk1w26Fee0FREXM7V3tJ47fypaFbQyVhJ7evAb
AlWtL018wsazFdzU3RYAhkmNqfceiDUisxQzZoAS65gYb27EIfjYfUVJw3f2eGxx
QBj/AAZK101lcWxB78Fvj1kGL+ROU5JSyG3zKbgzweOWM3jyJV59lSYwrj/4JM9b
ACn9/t+CJkqbIh2FAIYF9biBjH8+j209+UKtIaeSAJWbJWORXJvRhBS1HRuuStO+
eT2qOtwuRLHacR4kR215ybVm48yXSuHa30yMY5p+ZsiyyIdSlkhxljXaFht+jO4H
SPEFZMgScx7iveVihG152V2OSztxsBbMoC5xTjcVQ9D0eHFYezzALmDRji1rIS8Y
qAvfhrEdOeRBCWIo7JdQ8AYjqf7U24jQ5Az07BPRNVFApyde+EACLZuIGOkoMQuX
gYl2vxfGjdgD6lVmhAtO3ijpOnK6OIPHn9BcMZoPcYjfvlKcHGyZrtKoSybpveMr
zytywxfiRyGXZWOfvXT3i/UQo9QRNhW4WAIL9VrfAmaCH5eFTGJnXHb3ldOneD0b
rAbTw0vsI5AAZvVJmruLrUYZcXdYK2CikAPVailFj/HD9wwAqn+rrqc76R2ARF5/
zbdVOe2CpwAd3Kdqbgmd6s6V7m5OiJoehhYGggq3wlXM6QbZjRU=
=JglD
-----END PGP SIGNATURE-----

--almjs3lru6qbslqr--

