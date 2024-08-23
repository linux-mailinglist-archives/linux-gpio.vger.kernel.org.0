Return-Path: <linux-gpio+bounces-9084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3CA95D2F5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 18:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2636289043
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEA018BBB8;
	Fri, 23 Aug 2024 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUT5Cev+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE7218BBB5;
	Fri, 23 Aug 2024 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429676; cv=none; b=Z0f+vYlAt+AMHrCwbcHPGppjGElfVZqX6CCA++WdokOZjZbq2mxg75DAyFlWO0pFDq6YcR1doMpb2GJJQTkOBcDm2Mg6x8h72xgCc2iAvdTAokNEozxpj1DUeClOXvH8CsHW+mqT+toocu2Lglp2AWYXf+Du4fHJDFQmyRK4w7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429676; c=relaxed/simple;
	bh=+NPDHG3m4+AVu1KBw0bB5y/vOo09Al9JNdt3OSSrp3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9kmBcj3qW4nfQ8pk/aQvoxSqKDBrwQeSgc4v3w+JVANcoYBfSLiZ+Pi6RHksSHtDkRFP3wcEnOz27nXyJyaaMY9RwURMEr3rrx8NS2tfYJGdzOyKMC/pbA0GKUFoOCxy4OoV67OZzXb0yidn/6yZunF+ezIvu4TPKsK3QEeD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUT5Cev+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF945C32786;
	Fri, 23 Aug 2024 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724429675;
	bh=+NPDHG3m4+AVu1KBw0bB5y/vOo09Al9JNdt3OSSrp3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUT5Cev+71UA8itbQWCqA+02XUn7kfTK/aH6tyAkpXFEqA+FKPmJgfeTdGbk6QoKt
	 25tK71D66Q6p9hx4bysQbjB0O8bZCTW3ajlXFtXUufEp7tQ3Z8QjJYDBnqoj+B0jll
	 fLeo5m4aJOJ8vHOmbF3CuOPbZr+nJ/xi/aAgV//HebaRpATml1aoZsEge3FT0KcQg0
	 tS4cjW8KaCpgJB78gCsQb/qpbQQBiKOZrd/8PIWrVoTTo0nU4JV5VvbK0qRwGXn/GC
	 gUrZCfIIzszEjzSiHzrcO1/N5GYMQClKtr8NtOTcglqf10YXHDOPUuHpI/Lu+M2Mf1
	 jdYx9UamcDLqQ==
Date: Fri, 23 Aug 2024 17:14:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, ansuelsmth@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <20240823-darkened-cartload-d2621f33eab8@spud>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G0rf1eYjjAWuMMFU"
Content-Disposition: inline
In-Reply-To: <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>


--G0rf1eYjjAWuMMFU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> On 22/08/2024 18:06, Conor Dooley wrote:
>=20
>=20
> Hi.
>=20
> > before looking at v1:
> > I would really like to see an explanation for why this is a correct
> > model of the hardware as part of the commit message. To me this screams
> > syscon/MFD and instead of describing this as a child of a syscon and
> > using regmap to access it you're doing whatever this is...
>=20
> Can you post a link to a good example dts that uses syscon/MFD ?
>=20
> It is not only pinctrl, pwm and gpio that are entangled in each other. A
> good example would help with developing a proper implementation.

Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
example. I would suggest to start by looking at drivers within gpio or
pinctrl that use syscon_to_regmap() where the argument is sourced from
either of_node->parent or dev.parent->of_node (which you use depends on
whether or not you have a child node or not).

I recently had some questions myself for Rob about child nodes for mfd
devices and when they were suitable to use:
https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/

Following Rob's line of thought, I'd kinda expect an mfd driver to create
the devices for gpio and pwm using devm_mfd_add_devices() and the
pinctrl to have a child node.

--G0rf1eYjjAWuMMFU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsi1ZgAKCRB4tDGHoIJi
0iA4AQC6wzm9QmxRgTNQzwzzkpYkzocP0r/W4CO1B2CMCIfV5gEAjPb/AwA8Dmi+
droBgJwkvUX5eDP8JBmPYCbc5/KtkQo=
=W4P9
-----END PGP SIGNATURE-----

--G0rf1eYjjAWuMMFU--

