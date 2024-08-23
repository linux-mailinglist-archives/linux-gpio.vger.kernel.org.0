Return-Path: <linux-gpio+bounces-9105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF495D863
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 23:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED435285A89
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 21:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D7C194C84;
	Fri, 23 Aug 2024 21:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LixhdjOa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54D980C02;
	Fri, 23 Aug 2024 21:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724447858; cv=none; b=UpkLCrFnLHdPiR2xExvpUTQ9P7Y4YHl/JEZjbkRGnS9dfoXtvZgW+/hKFYC9rVtt82GG4aCPlule/NYmY/5CDC6zXMKWhoON9RjOwv/Mjn676YtIUDyGJYqFD7hiAyxnJpHYbE1UGy/0ZJjZmPVGrSR3Et3PLUlhNr24ajATkBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724447858; c=relaxed/simple;
	bh=5vp3IopamqzyJfcMcKJMpVOvlvO8s/jVJqB3/inrE14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRYFay8/YZbCimztO+coVf4nbCcWXm76CeRowLhYmOV/hdahtTjeYcO9sdNYYDmct+Z+KxtW1fE0DQIlU3t3mh2jwCDmE1mXfHDLlPFSnR2lCWA4KHXXLwTQ8GExeN+rT00O+wfnoKNaRNcJNS5hIDsm+3tLfwCgym7GOcrSeV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LixhdjOa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA0DC32786;
	Fri, 23 Aug 2024 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724447858;
	bh=5vp3IopamqzyJfcMcKJMpVOvlvO8s/jVJqB3/inrE14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LixhdjOa+jatyNAkpqH2J44yHTLFT4cJcS86pPKY79wsQCnWjhNB8elz/Is1MFfrW
	 s0jAn6GXEMppILVvT4Fy/0J8bHr0jH0aeQzVi9u3yZYX9VdDA1F+aK0jFsR/o9ApIM
	 nwApemyIe+gVoG6obgLB/VoFyzRICBmyFT6a3d68nHXjG3JXcqg0VMDqt4w0fkox2P
	 UJKxhHMD/jcWIovJKht+UiyjZzhuJrc+3vWiaGXW7BBOIbkwS43n1VzsOlZltoDrjN
	 0cx4POjuqoe7c0Y1Ex9Bo5f6ezopTiyj6WZKFC9/JDwd1btGcHrhpIbphxoCso0WVV
	 sUPBV49rjFAPw==
Date: Fri, 23 Aug 2024 23:17:34 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Conor Dooley <conor@kernel.org>,
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
Message-ID: <Zsj8bmBJhfUdH6qT@lore-desk>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FjTXgr77T+PgRI1H"
Content-Disposition: inline
In-Reply-To: <66c8c50f.050a0220.d7871.f209@mx.google.com>


--FjTXgr77T+PgRI1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > > On 22/08/2024 18:06, Conor Dooley wrote:
> > >=20
> > >=20
> > > Hi.
> > >=20
> > > > before looking at v1:
> > > > I would really like to see an explanation for why this is a correct
> > > > model of the hardware as part of the commit message. To me this scr=
eams
> > > > syscon/MFD and instead of describing this as a child of a syscon and
> > > > using regmap to access it you're doing whatever this is...
> > >=20
> > > Can you post a link to a good example dts that uses syscon/MFD ?
> > >=20
> > > It is not only pinctrl, pwm and gpio that are entangled in each other=
=2E A
> > > good example would help with developing a proper implementation.
> >=20
> > Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
> > example. I would suggest to start by looking at drivers within gpio or
> > pinctrl that use syscon_to_regmap() where the argument is sourced from
> > either of_node->parent or dev.parent->of_node (which you use depends on
> > whether or not you have a child node or not).
> >=20
> > I recently had some questions myself for Rob about child nodes for mfd
> > devices and when they were suitable to use:
> > https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> >=20
> > Following Rob's line of thought, I'd kinda expect an mfd driver to crea=
te
> > the devices for gpio and pwm using devm_mfd_add_devices() and the
> > pinctrl to have a child node.
>=20
> Just to not get confused and staring to focus on the wrong kind of
> API/too complex solution, I would suggest to check the example from
> Lorenzo.
>=20
> The pinctrl/gpio is an entire separate block and is mapped separately.
> What is problematic is that chip SCU is a mix and address are not in
> order and is required by many devices. (clock, pinctrl, gpio...)
>=20
> IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
> single big region and in our case we need to map 2 different one (gpio
> AND chip SCU) (or for clock SCU and chip SCU)
>=20
> Similar problem is present in many other place and syscon is just for
> the task.
>=20
> Simple proposed solution is:
> - chip SCU entirely mapped and we use syscon
> - pinctrl mapped and reference chip SCU by phandle
> - pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs
>=20
> Hope this can clear any confusion.
>=20
> --=20
> 	Ansuel

To clarify the hw architecture we are discussing about 3 memory regions:
- chip_scu: <0x1fa20000 0x384>
- scu: <0x1fb00020 0x94c>
- gpio: <0x1fbf0200 0xbc>

The memory regions above are used by the following IC blocks:
- clock: chip_scu and scu
- pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
- pwm: gpio

clock and pinctrl devices share the chip_scu memory region but they need to
access even other separated memory areas (scu and gpio respectively).
pwm needs to just read/write few gpio registers.
As pointed out in my previous email, we can define the chip_scu block as
syscon node that can be accessed via phandle by clock and pinctrl drivers.
clock driver will map scu area while pinctrl one will map gpio memory block.
pwm can be just a child of pinctrl node.
What do you think about this approach? Can we address the requirements above
via classic mfd driver?

Regards,
Lorenzo



--FjTXgr77T+PgRI1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZsj8bgAKCRA6cBh0uS2t
rBjaAP4/vfGhFiS/vj9sssUIoNRlFJhijxXzvU5sMMqyl/kc1gEA62j6BqYh+DWk
hSTa7/6R9VZ5ok2v7Tl/oNzGhIOadQM=
=C0OQ
-----END PGP SIGNATURE-----

--FjTXgr77T+PgRI1H--

