Return-Path: <linux-gpio+bounces-11932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0A9AE2A8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 12:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0553B1C21896
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 10:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62551CACD0;
	Thu, 24 Oct 2024 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sN4V/Yf/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7390F1BDAB9
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729765973; cv=none; b=Pe/mSmPyLuqG7v7xg5nmnWdmgwyrYhcqt9TNNCMLqBZ+4FHuHM1f0JC3+cZUhYETsZXTnm6Tu/6VApcSW/Rv+KaZIy51OkREfU6Y6Y12EVMNIlmZIUjPwH5iIQ3SlQjHDYVSo0Y75SI1fGYS9en0j/qAsamXUYa6b8HyyY0Pf5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729765973; c=relaxed/simple;
	bh=+U0wVasYHLTxUy7WLN6SingTBckus/YN+be466vb8Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plvMd9h4kCKxk0uuSRoyN0s5TauxmfD36GMCS+CbLlM08GmVj6+5PVaIb3xlL8eTT8ePkpBU6cCphwbKrwc39jNus+yoBrRAldkMD6GIo0mQbsQ6+hz8+YhzQh+Lpg6/HYLXvBmJLigKzSvLBSHnvX6Cg+8v+akrzlszONOCwlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sN4V/Yf/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BDAC4CECD;
	Thu, 24 Oct 2024 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729765973;
	bh=+U0wVasYHLTxUy7WLN6SingTBckus/YN+be466vb8Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sN4V/Yf/fuOn+rC+8tEBA+t6AcsToAxSAHxrmkmp52E6F0ZxkeqlnLRcEKDKyUxt8
	 E4f6LvJT+I34NrArTZKn+RPRw9rk0klbybR+q6tVfi2Yhh/BR1G39muIIpy6by6sOZ
	 RoW4NMsT6j8BpsvVwUtvspS7uRQ/++Omd9zBa/UeA7LXwr5E7Xj8BqzkEOsWpjZgaU
	 3JSqPjraOpali9P3jg+R/+YLnWWJjVcyJGbV64HFC0yBe+W11zEbEg/oYhhBqVGUjL
	 ox65FPHAk6gnfhm034SyeXcmofAZXBNmygt6SYrl38f/jy+hMNDTj/1J4gEZ1VqmMc
	 kMJe1T1IO+Vmw==
Date: Thu, 24 Oct 2024 11:32:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [PATCH v8 1/1] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20241024-scuba-figment-d5a40aa3beba@spud>
References: <20241024-tipping-browse-c0d582b16a47@spud>
 <20241024-dragster-research-0713e1733600@spud>
 <CAMRc=Md7sqoXbn2tSu23PqjLRat_3dUe80x0QpCHyppEZLacsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uAqqWRy5OMs59B0S"
Content-Disposition: inline
In-Reply-To: <CAMRc=Md7sqoXbn2tSu23PqjLRat_3dUe80x0QpCHyppEZLacsw@mail.gmail.com>


--uAqqWRy5OMs59B0S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 11:57:04AM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 24, 2024 at 11:21=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> > +       ret =3D gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
>=20
> Use devm_gpiochip_add_data() and remove remove()?

You know, I feel like an idiot. I grepped for this, with the goal of
dropping the remove, and must have typoed.

--uAqqWRy5OMs59B0S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxoiUQAKCRB4tDGHoIJi
0hSvAP4n4dclxyXjyXIx386iSHvoActSyLREOMrH9ZdVh4Ds0QD+LVNiVltqTRNT
f+RDs8tmIUyIZg+ROHY1WnUE0pJEZwg=
=sJgP
-----END PGP SIGNATURE-----

--uAqqWRy5OMs59B0S--

