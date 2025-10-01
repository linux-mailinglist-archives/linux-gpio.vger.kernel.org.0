Return-Path: <linux-gpio+bounces-26729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492EBB12CB
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 17:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 032153BE205
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 15:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC18280CFC;
	Wed,  1 Oct 2025 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDt4IhDM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEFE27D780;
	Wed,  1 Oct 2025 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759333689; cv=none; b=eW1bzOxDC7MtOk9LbSmPVChoL822+xhIYRsNi8YZC4ZaGVKTMLxiqtJiIFPQ+YePSFhcSzYSylIsNQrvkVMGrPZA0V1+fWPa9MbGkPkWYXiRIiCUq2PS3Of+3xaIjjR9YXwtPHaz+PszS6KysyllZprlrgwXbgkJSTfMZmTtKpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759333689; c=relaxed/simple;
	bh=4rN4zDbfTu3APOEnvotikAvuk6B26WzlQzXobHuu1G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhG27sBVH0+qJ9KYNWc75eY8eNvXTt3Kiex7fRpHHsN0yC1fwG/9JhHnxhYmFgJlp/Fl/+09f7zXh5z4nmnOZhCyJ85d/ENnss7QLdwrRnWKG9c5MCUwsix4SpYAL8RkTcWkRsWL3v8w7Lh852Qbiv2YTSZP9HqkjT3u98QfXcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDt4IhDM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0E8C4CEF1;
	Wed,  1 Oct 2025 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759333688;
	bh=4rN4zDbfTu3APOEnvotikAvuk6B26WzlQzXobHuu1G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vDt4IhDMAups8/CZAu2bk+nChSSFfwTvOMqLBgtkzBvD2ZRGBrddpvxtJT9LRLPZ7
	 NULM8ZV/rWtmMj+enO9m6XK1CDT1/BwO4mE5l6nqUsyip3yMHEyLYOadJnQEK3jWdM
	 thPigw0W6cjWpRzIyUgrcgMDZn+LCqz4ipnQjzKpiHJT59K5HSccVkPFevFAhi3Yvl
	 Jc08HETAXr4Pbjvhh12eDr3catYMI1jS76cmHmQJw+5OM1rotZHgo5pG66wJ5jI/tM
	 mh7bFQbZPIB0lvwrWYjYrd1jK9aSg+PZQmzFr0dT9WVpE18OSrjGUpCGAEwom+7ClV
	 +Ededt8o+vWUw==
Date: Wed, 1 Oct 2025 16:48:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 2/5] dt-bindings: pinctrl: add pic64gx "gpio2" pinmux
Message-ID: <20251001-recount-exquisite-6b304e8813b9@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
 <20250926-gilled-muppet-6ac08937cea6@spud>
 <CACRpkdYoECsAGwUno0b_nz-iBB=iwO0Js_6k4O5k+xhig2NYkg@mail.gmail.com>
 <20251001-grunge-unroll-d7a48294570a@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LWSva7p0Mbm2nqTv"
Content-Disposition: inline
In-Reply-To: <20251001-grunge-unroll-d7a48294570a@spud>


--LWSva7p0Mbm2nqTv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 04:47:12PM +0100, Conor Dooley wrote:
> On Wed, Oct 01, 2025 at 01:32:37PM +0200, Linus Walleij wrote:
> > On Fri, Sep 26, 2025 at 4:33=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> >=20
> > > pin     role (1/0)
> > > ---     ----------
> > > E14     MAC_0_MDC/GPIO_2_0
> > > E15     MAC_0_MDIO/GPIO_2_1
> > > F16     MAC_1_MDC/GPIO_2_2
> > > F17     MAC_1_MDIO/GPIO_2_3
> >=20
> > So this is a group you can name "mac_grp" and a function
> > you can name "mac".
> >=20
> > > D19     SPI_0_CLK/GPIO_2_4
> > > B18     SPI_0_SS0/GPIO_2_5
> > (...)
> > > E19     SPI_0_DO/GPIO_2_10
> > > C7      SPI_0_DI/GPIO_2_11
> >=20
> > These pins would be "spi0_grp", function "spi0".
> >=20
> > etc. No need for "pinmux" properties just use classix
> > group and function strings.
>=20
> tbh, I found it hard to understand the "line" between using a pinmux
> property and where stuff should be described in groups or functions in a
> driver. What is that line?

You may have noticed that I never really review pinctrl bindings, and it
is the lack of experience with this kind of decision that's why I never
do it.

--LWSva7p0Mbm2nqTv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN1NNAAKCRB4tDGHoIJi
0uZxAP9sHSyxsH4y7M8PuEyDlNyXKIrOUDxhfT48F2Yoj4NT7QD/SyYHW0kZgMGi
5sybJva0hUxeYJQbq5MksSMyWu+8rgo=
=1VbB
-----END PGP SIGNATURE-----

--LWSva7p0Mbm2nqTv--

