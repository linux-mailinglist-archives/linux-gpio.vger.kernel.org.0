Return-Path: <linux-gpio+bounces-10331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A797DF2B
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2024 23:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05C9B1C20B31
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2024 21:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41E91547C6;
	Sat, 21 Sep 2024 21:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0DmlYqV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD67282FB;
	Sat, 21 Sep 2024 21:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726955932; cv=none; b=rArW4a111US58e7NZVbVV+Fk2Odg9lS7wW5ZXYb+s3IWDGNomaz+XnuZmJfM3pwa23gNBWRi0C2pPOH88MExe4883fou0KlkZsJYLMtBw/jV4cEBKknEssag59Rh45i/WBNnD0OJtrWNZu2EMw6UrkPglC8HTQzWsy3fHhGbWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726955932; c=relaxed/simple;
	bh=wQnkUU12VSm06ILvfTBbRbxP36O7/91g/m/IgntMonE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKgjQdsudup022nKnMzc4oFO3RO7GVQIn56V9EakqIG+ccdD3dvaKEzqrNtEcA/IzElhsVEyfy3nS36SzFcfzdS6L8pqiwUsDVhgHlgsVQFbApM5pwFLD5kcvGiQxMJCq36Qc2NXjYFwqXNMFeiSuEC7EZXMSZ///3Nf/6jGIDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0DmlYqV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A72C4CEC2;
	Sat, 21 Sep 2024 21:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726955932;
	bh=wQnkUU12VSm06ILvfTBbRbxP36O7/91g/m/IgntMonE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0DmlYqV45oJD/4eVPdrJQvxuV1xW5b/Hu1MyF5a0NeuxMK4qYUYFG349e98Oo2RP
	 UK8nMImJfQ0Xv6TwsVmcAjKdtKsdTzqD1Yv0qolaVPbPvrnXoGMHr6fTyx0CtvcCxU
	 XHWN0YaFM7qqzpd1ZMtHfy0kX2QqxTst27FQhC4E79ACBXSOlSmRG1FsMG+/yzsBgE
	 oW5DjI3+CzNQKXd6boNLJVTzKmQhPc9N6pQ58Dbv4GDpMdYY0UAj1JTldb0vlmnNoL
	 cbeex78SK/H/480bAMzFuOTKiUyciqhgpwhVriGkjZleb3V/l7d3M5OKVtbCjfPQ6F
	 +Cf3dW+T6z+cQ==
Date: Sat, 21 Sep 2024 22:58:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs
Message-ID: <20240921-party-glass-bfb7099c7ded@spud>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
 <20240920-reapply-amusement-a37cf13fd910@squawk>
 <16950e81-e0ef-4e7c-b0ef-4f56415dceed@oss.nxp.com>
 <bd5a2d24-164c-4707-a5fd-6584e444ee0b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zg46WeEvFbsnfi1R"
Content-Disposition: inline
In-Reply-To: <bd5a2d24-164c-4707-a5fd-6584e444ee0b@kernel.org>


--zg46WeEvFbsnfi1R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 03:40:31PM +0200, Krzysztof Kozlowski wrote:
> On 20/09/2024 15:33, Andrei Stefanescu wrote:
> > Hi Conor,
> >=20
> > Thank you for your review!
> >=20
> > On 20/09/2024 15:46, Conor Dooley wrote:
> >> On Thu, Sep 19, 2024 at 04:47:22PM +0300, Andrei Stefanescu wrote:
> >>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
> >>>
> >>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> >>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> >>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> >>> ---
> >>>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 107 ++++++++++++++++=
++
> >>>  1 file changed, 107 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-=
siul2-gpio.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-g=
pio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> >>> new file mode 100644
> >>> index 000000000000..0548028e6745
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> >>> @@ -0,0 +1,107 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> >>> +# Copyright 2024 NXP
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/gpio/nxp,s32g2-siul2-gpio.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: NXP S32G2 SIUL2 GPIO controller
> >>> +
> >>> +maintainers:
> >>> +  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> >>> +  - Larisa Grigore <larisa.grigore@nxp.com>
> >>> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> >>> +
> >>> +description:
> >>> +  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
> >>> +  chips. It includes an IRQ controller for all pins which have
> >>> +  an EIRQ associated.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - const: nxp,s32g2-siul2-gpio
> >>
> >> Commit message and binding description say s32g2 and s32g3, but there's
> >> only a compatible here for g2.
> >=20
> > Yes, the SIUL2 GPIO hardware is the same for both S32G2 and S32G3 SoCs.=
 I plan
> > to reuse the same compatible when I add the SIUL2 GPIO device tree node=
 for
> > the S32G3 boards. Would that be ok?
>=20
> There are only few exceptions where re-using compatible is allowed. Was
> S32G on them? Please consult existing practice/maintainers and past revie=
ws.

Pretty sure I had a similar conversation about another peripheral on
these devices, and it was established that these are not different fusings
etc, but rather are independent SoCs that reuse an IP core. Given that,
I'd expect to see a fallback compatible used here, as is the norm.

Cheers,
Conor.

--zg46WeEvFbsnfi1R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZu9BlgAKCRB4tDGHoIJi
0jMrAP4gLeh/hHMeDpP27U1k8GIh6qhdRTMNkNBrqOuA7sMD7wD+IV4ia9MJzyQi
YC4CgFsrVpAEIJomN1x8TVn0Dvo1AAQ=
=2rsY
-----END PGP SIGNATURE-----

--zg46WeEvFbsnfi1R--

