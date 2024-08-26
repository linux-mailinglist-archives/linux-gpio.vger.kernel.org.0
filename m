Return-Path: <linux-gpio+bounces-9181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388CE95F76A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 19:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC91C284C03
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 17:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824AC19884B;
	Mon, 26 Aug 2024 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQCrZ5Nr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD0618D64D;
	Mon, 26 Aug 2024 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724692067; cv=none; b=LHHrmoCvZvLHE2QLe/qJLfqN770dz3LkEGMJllZ0YXWYpQ5YBpSiW6pe6skRC/rRheub9du5WCYgif2VQfXaatLF1OgscwnStnJu9s7E0nhIIZnzgOjXt9aOP4IDrMKTMIfkaP1L34A3vKXJIbvKxG+SvGvcyQEFNrDgqRxUwtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724692067; c=relaxed/simple;
	bh=VwQgJgxqTV5MDnUILDmu96OieGgqzcCluDvZCzORr8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zb14TURuUK8OEC3+Lo5/yHz1jtAgSwxVt2L28B3BATwYRtgPRA94m0RlR/y6j2usRiQhdjd2uFyohCMSRzZkxcZKO1yxal3Qwux5sVvMP2lVIYg8r5XpzMwnKnUsx/8nXAfV26zNzJDMta70Fn7Bp+o6VasjweXHkKkCrWaxC9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQCrZ5Nr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26A3C581BD;
	Mon, 26 Aug 2024 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724692065;
	bh=VwQgJgxqTV5MDnUILDmu96OieGgqzcCluDvZCzORr8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQCrZ5Nrgaxg+a9Eoi40JpCSG1xe56c6xzNlQIptqEGVGMr5iKZVDvwXiy/g8WoXi
	 7jFefA+g0CwNgKG0++OtpMTIb1fCO2az6yC14i7/z1m8pGIrPAa4g6AEjx2QREt2ue
	 6dCX5jQ52b/C1iQs57l4FdtyuFhbL+30xtCtJ+hcl4GEj8X90ya75aeGBzKeM2bGkx
	 eIRf3ncNbtLASkKB/sOd5I3AkblrkXjWFuNTQBZdB8uExPPjfqP8dckP5KdEX7A60D
	 FZJucDfOpL9BJMI9luAe+sikT6j4g9xVstvqQEqT/IqNgKAPuFVygDtZa95iTckHFz
	 HrBbrJ1bax4fw==
Date: Mon, 26 Aug 2024 18:07:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <20240826-kinsman-crunching-e3b75297088c@spud>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com>
 <Zsj8bmBJhfUdH6qT@lore-desk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1nEfWonu5rwLGlXL"
Content-Disposition: inline
In-Reply-To: <Zsj8bmBJhfUdH6qT@lore-desk>


--1nEfWonu5rwLGlXL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 11:17:34PM +0200, Lorenzo Bianconi wrote:
> > On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > > > On 22/08/2024 18:06, Conor Dooley wrote:
> > > >=20
> > > >=20
> > > > Hi.
> > > >=20
> > > > > before looking at v1:
> > > > > I would really like to see an explanation for why this is a corre=
ct
> > > > > model of the hardware as part of the commit message. To me this s=
creams
> > > > > syscon/MFD and instead of describing this as a child of a syscon =
and
> > > > > using regmap to access it you're doing whatever this is...
> > > >=20
> > > > Can you post a link to a good example dts that uses syscon/MFD ?
> > > >=20
> > > > It is not only pinctrl, pwm and gpio that are entangled in each oth=
er. A
> > > > good example would help with developing a proper implementation.
> > >=20
> > > Off the top of my head, no unfortunately. Maybe Rob or Krzk have a go=
od
> > > example. I would suggest to start by looking at drivers within gpio or
> > > pinctrl that use syscon_to_regmap() where the argument is sourced from
> > > either of_node->parent or dev.parent->of_node (which you use depends =
on
> > > whether or not you have a child node or not).
> > >=20
> > > I recently had some questions myself for Rob about child nodes for mfd
> > > devices and when they were suitable to use:
> > > https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> > >=20
> > > Following Rob's line of thought, I'd kinda expect an mfd driver to cr=
eate
> > > the devices for gpio and pwm using devm_mfd_add_devices() and the
> > > pinctrl to have a child node.
> >=20
> > Just to not get confused and staring to focus on the wrong kind of
> > API/too complex solution, I would suggest to check the example from
> > Lorenzo.
> >=20
> > The pinctrl/gpio is an entire separate block and is mapped separately.
> > What is problematic is that chip SCU is a mix and address are not in
> > order and is required by many devices. (clock, pinctrl, gpio...)
> >=20
> > IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
> > single big region and in our case we need to map 2 different one (gpio
> > AND chip SCU) (or for clock SCU and chip SCU)
> >=20
> > Similar problem is present in many other place and syscon is just for
> > the task.
> >=20
> > Simple proposed solution is:
> > - chip SCU entirely mapped and we use syscon

That seems reasonable.

> > - pinctrl mapped and reference chip SCU by phandle

ref by phandle shouldn't be needed here, looking up by compatible should
suffice, no?

> > - pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs

The pwm is not a child of the pinctrl though, they're both subfunctions of
the register region they happen to both be in. I don't agree with that
appraisal, sounds like an MFD to me.

> > Hope this can clear any confusion.
>=20
> To clarify the hw architecture we are discussing about 3 memory regions:
> - chip_scu: <0x1fa20000 0x384>
> - scu: <0x1fb00020 0x94c>
                  ^
I'm highly suspicious of a register region that begins at 0x20. What is
at 0x1fb00000?

> - gpio: <0x1fbf0200 0xbc>

Do you have a link to the register map documentation for this hardware?

> The memory regions above are used by the following IC blocks:
> - clock: chip_scu and scu

What is the differentiation between these two different regions? Do they
provide different clocks? Are registers from both of them required in
order to provide particular clocks?

> - pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio

Ditto here. Are these actually two different sets of iomuxes, or are
registers from both required to mux a particular pin?

> - pwm: gpio
>=20
> clock and pinctrl devices share the chip_scu memory region but they need =
to
> access even other separated memory areas (scu and gpio respectively).
> pwm needs to just read/write few gpio registers.
> As pointed out in my previous email, we can define the chip_scu block as
> syscon node that can be accessed via phandle by clock and pinctrl drivers.
> clock driver will map scu area while pinctrl one will map gpio memory blo=
ck.
> pwm can be just a child of pinctrl node.

As I mentioned above, the last statement here I disagree with. As
someone that's currently in the process of fixing making a mess of this
exact kind of thing, I'm going to strongly advocate not taking shortcuts
like this.

IMO, all three of these regions need to be described as syscons in some
form, how exactly it's hard to say without a better understanding of the
breakdown between regions.

If, for example, the chip_scu only provides a few "helper" bits, I'd
expect something like

syscon@1fa20000 {
	compatible =3D "chip-scu", "syscon";
	reg =3D <0x1fa2000 0x384>;
};

syscon@1fb00000 {
	compatible =3D "scu", "syscon", "simple-mfd";
	#clock-cells =3D 1;
};

syscon@1fbf0200 {
	compatible =3D "gpio-scu", "syscon", "simple-mfd";
	#pwm-cells =3D 1;

	pinctrl@x {
		compatible =3D "pinctrl";
		reg =3D x;
		#pinctrl-cells =3D 1;
		#gpio-cells =3D 1;
	};
};

And you could look up the chip-scu by its compatible from the clock or
pinctrl drivers. Perhaps the "helper" bits assumption is incorrect
however, and both the scu and chip scu provide independent clocks?

> What do you think about this approach? Can we address the requirements ab=
ove
> via classic mfd driver?



--1nEfWonu5rwLGlXL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsy2XAAKCRB4tDGHoIJi
0vEBAP9VeZxftChOpdKzYog+Vq3UkbSA7Yk1lSGYkUQZvVKoSAD7Bgn2umf+nGMQ
S3TSunjM3PrwndSmaRkt1goXBwoCdw4=
=BMYD
-----END PGP SIGNATURE-----

--1nEfWonu5rwLGlXL--

