Return-Path: <linux-gpio+bounces-10076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E859787B8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 20:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2CEE1C21FC7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 18:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E7A12CD88;
	Fri, 13 Sep 2024 18:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2L3trD9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE54BA2D;
	Fri, 13 Sep 2024 18:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726251768; cv=none; b=h7n7YrUEsb/Iy37S/44HoDhkuCRu34pfk69BB1DxHi7Rc6VkcXakDnHW+3OkXFSjcf6ZkNUD6WL0pXWVrNQMRv9z5y9D6Opd9HJ6R6y/nD2QkrULNoqYQGeMHgWxsj7SdmCo8vlycx2zxn3MxvQchTHizRmaI7WKjbk9QVyA3O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726251768; c=relaxed/simple;
	bh=jE+LkE/GlxxxXS2sFFMatGgGcsp8+WN8tBPvxibbjNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4mgVdqwt4XHJW4pDk3H4nL1E3t7irlwgrcaIuVmYE1dOSuDjfWFpPzNcJiq2Ljv/gEX+moWRZE9fzpBIbcfhp6FYDd+W6QnGmAs1qieWGos5E3HV0NGg0kYt0GB/uHMF1y1StfbRDiarkNDM3rouEu7JMn6Xq+fQVWIIwYjaNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2L3trD9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614D7C4CEC0;
	Fri, 13 Sep 2024 18:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726251768;
	bh=jE+LkE/GlxxxXS2sFFMatGgGcsp8+WN8tBPvxibbjNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2L3trD9OLdQuIgpQE3ohbntUQa/rm0t7Ual0AgT9rA85tRGnYbfnseRsuChBN3w/
	 yJo/5pF860m+j+0aVsqtW9Cf9bxOF0co6XaL4AcWzzahD/poPSp/cjATKAW8hcdmA5
	 yNVrxkdWcsNOvJEpW/eyeOc8GkextREBehBX8qYbOaWxNykH5CJ6RLWy0uYfrYrASP
	 msu12cR53WXFawLkKc73hkXCw05HVrRgurfOiIfRewiEZ33D+gMQyIjHvzLbrFIHW7
	 i5SyDhaiJTyvUMu/hkz9FB+dfl5uKlgncImR5GDkWztxWpJTcn17Tc0ByvxOT2ZtHD
	 wh8AOH1mV6WHA==
Date: Fri, 13 Sep 2024 19:22:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com
Subject: Re: [PATCH v3 1/6] dt-bindings: gpio: aspeed,ast2400-gpio: Support
 ast2700
Message-ID: <20240913-swipe-crummiest-0d449f2e3314@spud>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
 <20240913074325.239390-2-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yr6ZZcr6IEzTYaC7"
Content-Disposition: inline
In-Reply-To: <20240913074325.239390-2-billy_tsai@aspeedtech.com>


--yr6ZZcr6IEzTYaC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 03:43:20PM +0800, Billy Tsai wrote:
> The AST2700 is the 7th generation SoC from Aspeed, featuring two GPIO
> controllers: one with 12 GPIO pins and another with 216 GPIO pins.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--yr6ZZcr6IEzTYaC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuSC8wAKCRB4tDGHoIJi
0q3PAQC+/acGGSL2QPDUEaNfdNP0E6QO4gxyHGWHPni0w3cXZwEA90qz6xLtwZmg
8iPP+K7iuHz0tAtAnMP7TYFSWOkA4QU=
=2i7K
-----END PGP SIGNATURE-----

--yr6ZZcr6IEzTYaC7--

