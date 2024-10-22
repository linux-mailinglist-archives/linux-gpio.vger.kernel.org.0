Return-Path: <linux-gpio+bounces-11774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D989AB3FC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC522B242A9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870EA1BBBCD;
	Tue, 22 Oct 2024 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXUcFdDC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5521A76D1;
	Tue, 22 Oct 2024 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729614532; cv=none; b=PpEC8HwbhJFQVy8H6mARkWvrr7xP4bzsnLCNykax1kv7738XksdUOCR0WaDcY9ddUYfXPYV9nehFrw8RaScFLdmhtNPGzdNWTIrwWpRZBjUWn1rjwnwBoZde9q+xk9uzpu8SFVfC0eSoyRjObTpA8ffTSUpTrU6ZK3KM/eS1Qu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729614532; c=relaxed/simple;
	bh=87Hj2MBEy325Y9mIUYVzyJy2Kc9E81HbJvfmCb01J3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWOt8sRsIR+a3FdEzuXhopt+/ZJHgPxOPesiiz+nJfJXR27KqDS8cOC6BqwTGNuwA1/0ywtNCCzuU20M1rDbLvu3RIvzosHQuYMa9hjYiknQIxUb48QqrUbd+50gpV7VU3Xpd1vmBQUTn2FWsyWwt4fPG7A2AXcNDleo+3hziSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXUcFdDC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1BCC4CEC3;
	Tue, 22 Oct 2024 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729614531;
	bh=87Hj2MBEy325Y9mIUYVzyJy2Kc9E81HbJvfmCb01J3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXUcFdDCWRNAtSwfiPxg5zWvZ0VgQbqC2DFAe0C/GgDrCK2r7S9u+EquuutSYnQ0Q
	 iLvxcE7UMNGDQtVC20qrTOyEXcSU3szt24wGU1Uogjw4LeE1GEMk9pEmV/EHJgcHra
	 qGFWV2ihpiwGKh5FMywbfLZNC8v8tfjUPvdqKVr0iMmC7ff1J614mqK+OQMVfEKuuX
	 H0falu0ulNL6lhupAbtUWTmtfbxcy7pH0VVPXlQtqWg4uJPq+wtCTcLLI9aly7AIkI
	 HarMVffNwg8mln4P55rbWA+Px5vascrVBIod/19XmYvh8QsuD3wccEFP1oPWCPpvPW
	 H6qydWoxdB4IA==
Date: Tue, 22 Oct 2024 17:28:46 +0100
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
Message-ID: <20241022-unrushed-dragonish-2949ee887824@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20241016-shallot-nerd-51eeba039ba0@spud>
 <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
 <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>
 <20241016-cobbler-connector-9b17ec158e3a@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GJngKmvlq7nwNriG"
Content-Disposition: inline
In-Reply-To: <20241016-cobbler-connector-9b17ec158e3a@spud>


--GJngKmvlq7nwNriG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 08:42:51PM +0100, Conor Dooley wrote:
> On Wed, Oct 16, 2024 at 09:26:13PM +0200, Linus Walleij wrote:
> > On Wed, Oct 16, 2024 at 12:29=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> >=20
> > > What does bring a nice simplification though, IMO, is regmap. I am
> > > pretty sure that using it was one of the suggestions made last time
> > > Lewis submitted this - so I think I'm going to do that instead.
> >=20
> > If you have the time. Using GPIO_REGMAP for MMIO is not that
> > common and I think the driver is pretty neat as it stands.
>=20
> As with using the common MMIO stuff, I don't think GPIO_REGMAP provides
> that much value as I cannot use the direction stuff from it. I was
> thinking of using regmap directly, like:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dgpio-no-irq&id=3Dc8933e1e3600e3fa29efe28fbb2e343e133f9d67
> which I think reduces how ugly the two direction functions look.

Sorry to bother you Linus, but I was hoping to see some sort of comment
here before I squash this stuff and submit a new version. Is something
like what I linked above acceptable?

--GJngKmvlq7nwNriG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfSvgAKCRB4tDGHoIJi
0h5kAQDKBegFI2rak7HFJbK0iwWK2tdka7YhCjyxJnQhb4X1fAEAi0xxQnIUfefJ
1ngWUp4/1xqVFHaH+QaFPgi2aW7X3QI=
=uuEI
-----END PGP SIGNATURE-----

--GJngKmvlq7nwNriG--

