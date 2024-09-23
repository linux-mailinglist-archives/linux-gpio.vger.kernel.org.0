Return-Path: <linux-gpio+bounces-10367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9870E97E912
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 11:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 430791F21F78
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 09:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC13194AD8;
	Mon, 23 Sep 2024 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d07UV7Np"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217D8479;
	Mon, 23 Sep 2024 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085045; cv=none; b=qJuPX+O8RHYrDOtCVsd7XMcDN9OuxdwZSIEnftNKTl0PnaFUKenwGU+MkP0KcLge7FgPdiriomo9dSknAyzvNGNsdtMPP0j/nJ1BH4v1WoTuYQ5P7R8yO1AVt7w1mBASid0BDYWP+vTac/6Blriqc7vkXN4d5MdufMNEqK7/6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085045; c=relaxed/simple;
	bh=RVZepU3jl/AFxhzY6Kxw7RJAUKOyq5pDiMbVlpt9Rn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTbfcpMMiwiiPgZaTfrCJq9LfFeOn6KxC1CdY2fNB1ViGmdH50lmtxwmhnaaIgx3DT4ypd5jmiNqLbeBHv6x9+U6ScpePCPd/bodY1I9+rM6DofgUT4wUef0YUzdclmxNvF/iW8mNO+xPyyn26YDHn9skZuQJ0UbvoeQsgbKQgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d07UV7Np; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A69C4CEC4;
	Mon, 23 Sep 2024 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727085045;
	bh=RVZepU3jl/AFxhzY6Kxw7RJAUKOyq5pDiMbVlpt9Rn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d07UV7Np7CVkx5/TuNva0slRNOWAsvjgA066kTFy1Gg8ZcABcuLq0LW5gNQtkbmZ3
	 iOM7n6MpasyxmZd0bXstdqXAkLtLFL6RFpO8vmghZGumZi7fAwGDuLPCDgwZ9gH2Y6
	 1wOXho/IX1SJCK28mVkluCbycgUarNr3d970wrNcugtxEr35P3ffH9lWpa5nOX1/tZ
	 zktLOhR6795+PeF7Jd0uHyhCgCBOvmr2rq5ixkTUJhPmqBftY0BzZr+nxUiRe02NT+
	 wzhk/BcC3JWCbMIBQmQNY7CE0wJCghWmBPIk6EEUv858W58DSZcBQby9ik33cz4p5e
	 n3Ze+VEmtjCoQ==
Date: Mon, 23 Sep 2024 10:50:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Ze Huang <18771902331@163.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RESEND PATCH 3/3] riscv: dts: canaan: Add k230's pinctrl node
Message-ID: <20240923-gyration-enzyme-16cd3fc6d091@spud>
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064706.318793-2-18771902331@163.com>
 <1d57b766-0db1-4266-9aa5-11c131a636df@linaro.org>
 <33e64928-0939-434a-9e6c-5f1af57992b2@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CmBWEc4/3R/NwG79"
Content-Disposition: inline
In-Reply-To: <33e64928-0939-434a-9e6c-5f1af57992b2@163.com>


--CmBWEc4/3R/NwG79
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 04:39:29PM +0800, Ze Huang wrote:
> On 9/16/24 11:52 PM, Krzysztof Kozlowski wrote:
> > On 16/09/2024 08:47, Ze Huang wrote:
> > > Add pinctrl device, containing default config for uart, pwm, iis, iic=
 and
> > > mmc.
> > >=20
> > > Signed-off-by: Ze Huang <18771902331@163.com>
> > > ---
> > >   arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi | 316 ++++++++++++++++=
+++
> > >   arch/riscv/boot/dts/canaan/k230-pinctrl.h    |  18 ++
> > >   arch/riscv/boot/dts/canaan/k230.dtsi         |   2 +
> > >   3 files changed, 336 insertions(+)
> > >   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
> > >   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
> > >=20
> > > diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi b/arch/risc=
v/boot/dts/canaan/k230-pinctrl.dtsi
> > > new file mode 100644
> > > index 000000000000..0737f50d2868
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
> > > @@ -0,0 +1,316 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +/*
> > > + * Copyright (C) 2024 Ze Huang <18771902331@163.com>
> > > + */
> > > +#include "k230-pinctrl.h"
> > > +
> > > +/ {
> > > +	soc {
> > > +		pinctrl: pinctrl@91105000 {
> > That's odd style - defining SoC nodes outside of SoC DTSI. Are you sure
> > that's preferred coding style in RISC-V or Canaan?
>=20
> Pinctrl-related nodes were separated the for ease of maintenance, but the
> convention in Canaan is to place them in the board-level DTS file. Would =
it
> be better to stay consistent with their approach?

Yeah, please put them in the board-level file.

Thanks,
Conor.

--CmBWEc4/3R/NwG79
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvE58AAKCRB4tDGHoIJi
0rN7AP94xYnBjgnCL0HWYtJqG7QaraWE9l1znWbvWzh/ekL7WgD9GNQPMaJ/DEzZ
CCaqHrgIYx/vp7wm7IIp3pnEjwAcYA0=
=/Ald
-----END PGP SIGNATURE-----

--CmBWEc4/3R/NwG79--

