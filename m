Return-Path: <linux-gpio+bounces-8373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E793B298
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 16:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28D772855ED
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 14:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3958D158DA7;
	Wed, 24 Jul 2024 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0//d6Tm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44FF156677;
	Wed, 24 Jul 2024 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721830925; cv=none; b=EzfgsRteB8DLIibadn7dfwmNrvqX57/IIfx6EvwHiRmukUmEsn7iGQntPwTbb+I30itIDe2PwztBpTH6jyZhWkGyoL36blki8sIlOvwuMEd59iXJMgz0efYohRngAxgn7Rzq+byYpps/li8JSfBsdf35Yi5KtD57GEDANZrVtoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721830925; c=relaxed/simple;
	bh=AUsCJZjVUYxs9p33RAVsq2J5Rd1jdLxKU8buKkg/hjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxNqhQGwRQxPPpOmlKx/CvhLsAcRQ7YZMLcOV7e/+a6MmWKmrn9wN1HT6KLL9cbuDoiRbp4jRqj3G/FaQ0QZFAl098vpBjh0FQYZ/c9NkwMH1hrJV/rnwQvfBMPGCB5DjWcEGmuzjCDVaP5TzGvsDeux64V7zMCcd7e8ig8H7tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0//d6Tm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC0AC32782;
	Wed, 24 Jul 2024 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721830924;
	bh=AUsCJZjVUYxs9p33RAVsq2J5Rd1jdLxKU8buKkg/hjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0//d6Tmxg1Qi1cnGHE8rrNgHpi0C8MVyaKTQs3X11aT8r/i6btuRH9J+PXfl37Wd
	 gJwk/X5QtjKGvf7XvCEzJLliXXhJSdXKVqxS1RGspj4R9xhGXd/MaXRkwi+DlHE9PJ
	 1FRbKewQqK0qqOEyz0BAwVDFMJzM0EMofrsKIuzlvpY+eGBpeScaZ657rg3lnh0NF7
	 Nf3KpqKrwzK2+uaF7eUDkXs0l3/2iYJDl+9M8zNcp0WaApd+jDUahqIghMwYMEuNC3
	 VUKYsshBaWz+jA+v+PrYG7ZLq5IZEpputEEsXc7nX9M5tX9naItMd1IjIDzTOadDIL
	 afOEoOHdp5/LQ==
Date: Wed, 24 Jul 2024 15:21:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC v7 2/6] dt-bindings: interrupt-controller: document
 PolarFire SoC's gpio interrupt mux
Message-ID: <20240724-playable-chomp-48e45cef1f2e@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-uncouple-enforcer-7c48e4a4fefe@wendy>
 <3f732acc-6ed0-45f0-a2d6-ed8506b0fd6f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aeYLJ8sZIu+qAi+O"
Content-Disposition: inline
In-Reply-To: <3f732acc-6ed0-45f0-a2d6-ed8506b0fd6f@kernel.org>


--aeYLJ8sZIu+qAi+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 03:27:21PM +0200, Krzysztof Kozlowski wrote:

> > +examples:
> > +  - |
> > +    irqmux: interrupt-controller@20002054 {
> > +        compatible =3D "microchip,mpfs-gpio-irq-mux";
> > +        reg =3D <0x20002054 0x4>;
> > +        interrupt-parent =3D <&plic>;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <1>;
> > +        status =3D "okay";
>=20
> Drop status

And the label too.

--aeYLJ8sZIu+qAi+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqEOBwAKCRB4tDGHoIJi
0jrkAQCIt+vRgxHnXwPt1M24O8vETAkSyxg1s4KtuFkdeaWcbwEA/lIbod0QoU3l
ny4OGR9vM076yhwZlwPmOt7BQsSH3gc=
=+jN8
-----END PGP SIGNATURE-----

--aeYLJ8sZIu+qAi+O--

