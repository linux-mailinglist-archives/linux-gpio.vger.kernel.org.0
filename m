Return-Path: <linux-gpio+bounces-13629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F6D9E8BEC
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 08:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43C281884F5D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 07:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B78F214A77;
	Mon,  9 Dec 2024 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Owti/1xW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162AB214A65
	for <linux-gpio@vger.kernel.org>; Mon,  9 Dec 2024 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733728410; cv=none; b=hfBrSuKMekw+iAuI43Rfj8Z3S4N9G1fWzlPOPAB37el+NEJMqV+wjqBLs4dH8Sw67ohKOzxpBN7Fp1i6fAlOPXnQlFh42vyM08o7eiGKgOOP5FiEuBnRNb2u3p80SuP2D8nXyuKn+HyGCFGfdYu55oEjEt07B61Mzqfp5Z1k0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733728410; c=relaxed/simple;
	bh=guW4JDCy97UMAbxJxHPUnSBMa/3ouXbjc5B28y/wNF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjnu6RIeFNZqeuGi5GQW8BXTHKg0+1VYqZ30USaonz9qc1Gr/IdXiM0PGN5IafIvcKRfLEPSE+jFhtrKrnReNoLO8sWk7Invq/kcd6cpMDd1M7ZN6VElnTvYu97wEfaPGwaujRvNPkxnXvBg4RJ+xQK+3Fh1KFDCL561Fq8TiV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Owti/1xW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF0FC4CED1;
	Mon,  9 Dec 2024 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733728409;
	bh=guW4JDCy97UMAbxJxHPUnSBMa/3ouXbjc5B28y/wNF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Owti/1xW9rGB1DXkzXiNLCwc1TI7INF6Mg+vqX4Z5JOG11xANH/af+SBNMvnNH19m
	 +3/Zk6NBbtm7Mo2pAH4jD5r0zq0rjLqJ2gPmp+c0sPYyOA0R/IHgq3CmnIz/87IrZV
	 xnOiA28l9lBD2PJugMk01FmyIOesbpgAk6nmLms5RcwYzSoBpGvr03ZeP0ygp4hNwF
	 K/RT4R0ZcuPRTQ14VmIsKVSnWXvMLfqFenwm37fy+l8s42XCz2AGq8reLiLTmeHkxE
	 qRyeF4h2D5Dz291kn5rYtlFCgi96erDBGUWCmYXs6bwvnQ8JYX1sqUIA4Va6zn/3Wd
	 5UiVcopfQtxUA==
Date: Mon, 9 Dec 2024 16:13:23 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: idio-16: Actually make use of the GPIO_IDIO_16
 symbol namespace
Message-ID: <Z1aYk49f-Z9CiX5X@ishi>
References: <20241203172631.1647792-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X4EBMo4KHa/altiO"
Content-Disposition: inline
In-Reply-To: <20241203172631.1647792-2-u.kleine-koenig@baylibre.com>


--X4EBMo4KHa/altiO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 06:26:30PM +0100, Uwe Kleine-K=F6nig wrote:
> DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> is included. So move the define above the include block.
>=20
> Fixes: b9b1fc1ae119 ("gpio: idio-16: Introduce the ACCES IDIO-16 GPIO lib=
rary module")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Acked-by: William Breathitt Gray <wbg@kernel.org>

--X4EBMo4KHa/altiO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ1aYkwAKCRC1SFbKvhIj
K12AAQCs2Y9g5dBilFXn8/7aoqikhdZeP1OeOxfC4qgAVmUSkwEAthPWXSczWych
Kqnj/ToLZKvfcF7nMx0uevNLwdbkEA0=
=Ew4W
-----END PGP SIGNATURE-----

--X4EBMo4KHa/altiO--

