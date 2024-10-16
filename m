Return-Path: <linux-gpio+bounces-11469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4169A12CA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 21:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C54C8286803
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 19:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD9F2144C5;
	Wed, 16 Oct 2024 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4iLvASZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC27F1885BB;
	Wed, 16 Oct 2024 19:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107777; cv=none; b=boMAqebTJtni7RoMfiFaSEls1UZ/fmtW68SDpBkabNgGdqFCRML9sGdQrwBuLC61UCSABM2Ay5wD7yzJ1roRUHhTiyFTS1fwUMdGU6mPI/fx49r12Vth0NkIZVegtLUuVjzib5UxqHuX9ihPPNNWONEJwXsTksqcD3Rx3aHHviI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107777; c=relaxed/simple;
	bh=mZzMcn9MbCczzX11J8+TKZRX7Uh7hjxyr0xf7rLHKQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVWkqe/rZHsIkdaFM4dndtgyI8uaskqHIQerA8Bcdb0GzeKTHESOSKx+tk8nskm9IKeJ2o79Y6BFr1eT7UbR7jdNaN/iWTvoiosoEOrRxF/ItDSj+YTH8pxCEUrErJvj2dBxZv3tWHRC0y3Hc0NW3i4NWgiO6AVAiUsuWhOgnm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4iLvASZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91584C4CEC5;
	Wed, 16 Oct 2024 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729107776;
	bh=mZzMcn9MbCczzX11J8+TKZRX7Uh7hjxyr0xf7rLHKQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4iLvASZXoBveFjv8+9epyZ3FYoC2LL6NapNNmpAOzXB1KJ3kRDc54jMETDXw5YHS
	 cmetoNHDqC83Ujklx02sR7d6YPdtEsJX5sMGdATx+U3+cDPwfgAc1gvl+PuSAe9njh
	 ELlGAyeUVVU/xGLXeFmsssQFPdtGat14Jmru1f4Orr/1vhi/vSCXXIo6Zr8SS2d000
	 Mva4ajJUqiYHsHTXMc1ZpThEAbr50ZKVBF+yNXLzB7rlofSfQFnRQf6CGVPcw7AKWK
	 NKj+a23iHPnKFXmQU5SZoI1K1zw+scRrPeY6seTsFfRxCbuLA35vvQJe6Q1R7Ma1ls
	 gen+M4eGWLaaQ==
Date: Wed, 16 Oct 2024 20:42:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20241016-cobbler-connector-9b17ec158e3a@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20241016-shallot-nerd-51eeba039ba0@spud>
 <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
 <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A7dnOTkzHLL/fEWQ"
Content-Disposition: inline
In-Reply-To: <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>


--A7dnOTkzHLL/fEWQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 09:26:13PM +0200, Linus Walleij wrote:
> On Wed, Oct 16, 2024 at 12:29=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
>=20
> > What does bring a nice simplification though, IMO, is regmap. I am
> > pretty sure that using it was one of the suggestions made last time
> > Lewis submitted this - so I think I'm going to do that instead.
>=20
> If you have the time. Using GPIO_REGMAP for MMIO is not that
> common and I think the driver is pretty neat as it stands.

As with using the common MMIO stuff, I don't think GPIO_REGMAP provides
that much value as I cannot use the direction stuff from it. I was
thinking of using regmap directly, like:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dgpio-no-irq&id=3Dc8933e1e3600e3fa29efe28fbb2e343e133f9d67
which I think reduces how ugly the two direction functions look.

--A7dnOTkzHLL/fEWQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxAXOwAKCRB4tDGHoIJi
0nzLAP97X5rdMU9SMZrBe1Wh3xgBP+5nGo+g7+4bYyVhUFNghQD9HYvVX4AGihOk
4WFF1ruWtm4KhgoJOTAXVyYdsz6M4Ak=
=uvpR
-----END PGP SIGNATURE-----

--A7dnOTkzHLL/fEWQ--

