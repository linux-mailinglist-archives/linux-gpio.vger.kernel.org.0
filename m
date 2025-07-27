Return-Path: <linux-gpio+bounces-23854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1663BB12F48
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 13:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4404D1897A14
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 11:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BA620E715;
	Sun, 27 Jul 2025 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Excewp4O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F52199924
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753614109; cv=none; b=ttlQZzX1xNNZ5nsE9lQGwY5eTYRqIjTxaRDKQQ7Ly3pautYZlGoKToLnsAQGZUpMziw85+5XVTZI0ZXumB4P7uNOAjVweRnw2/jlK1d3yRoENIKRdV8DPlXp4dB1ZsI10jc0SpRUKCtjsjkLULvUz4yHiaqB/E6p+CtKmI4XvuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753614109; c=relaxed/simple;
	bh=nN3Ms/yZrrzZVpF3SjzlSDqiMQmZVDjegD3fPcq3KYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLYHXMSawsjNYxeee8F1YUBFgwF/wl1r/pVUGLO2pXZGOVeaK/aXYcxswPb8Q/AGSR9gP92nQWAqvZ8OqZ/mNOypHiGsYuCvZrCayId8AJ+UzNrxTzvvCG58qXiPhkSmmZVOEqRs86MBHIBYRUVibg6/S9XLggZQ0uLvbjsdjgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Excewp4O; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Vkok
	I86eRR+xGqtAv01g2Nm9BOh6wncFGDFW/1fZLAY=; b=Excewp4ORMSxA3uPhgS7
	Ur+Nr9SeF9xCq+DMsEW1r/DtB+RPRx7cA2QqKu9Top6jZ8yxDIs3YqWtqY94pgTQ
	tNbS7q7U42axcWCr1X7LuXRgQvMG/HrdgW28GkVw6zr1brL3tfBVuoSh7ziCq0wW
	j6EttwBlfaFH8OtkYkKqfl+OtHReEmcUHKo8qx2Mci1tV9qDagSH1ACJkqg1lMdh
	v/Xbk06thE1V2zguCyX/U6rsc72T+5CfYcGFZ0SDBewKNXT0+rbsM3xRiELfYu4k
	nRO9/Ji+dtA3IBY0JjooLcNyv4uiinL7GH03rI5gngELCqyQ5Ca2Kl3VYL2vnTLY
	zQ==
Received: (qmail 3071984 invoked from network); 27 Jul 2025 13:01:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2025 13:01:35 +0200
X-UD-Smtp-Session: l3s3148p1@wik4Gec6Is0ujnuu
Date: Sun, 27 Jul 2025 13:01:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/6] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aIYHD5SEAqQNfDjD@ninjato>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tGZeYYr7bFhEpP7L"
Content-Disposition: inline
In-Reply-To: <20250725152618.32886-1-herve.codina@bootlin.com>


--tGZeYYr7bFhEpP7L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

> This series adds support for GPIO and GPIO IRQ mux available in the
> RZ/N1 SoCs.

Yes, way cool! Very happy to see this upstreaming effort!

> The first two patches of the series add support for GPIO (binding update
> and device-tree description).

So, I started simple and used the first two patches to enable LEDs on
pins 92 and 93 on my board. I added this on top of patch 1+2:

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm=
/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 3258b2e27434..4790ffad578f 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -185,6 +185,12 @@ fixed-link {
 	};
 };
=20
+&gpio1 {
+	pinctrl-0 =3D <&pins_gpio1>;
+	pinctrl-names =3D "default";
+	status =3D "okay";
+};
+
 &i2c2 {
 	pinctrl-0 =3D <&pins_i2c2>;
 	pinctrl-names =3D "default";
@@ -256,6 +262,11 @@ pins_cpld: pins-cpld {
 			 <RZN1_PINMUX(122, RZN1_FUNC_USB)>;
 	};
=20
+	pins_gpio1: pins-gpio1 {
+		pinmux =3D <RZN1_PINMUX(92, RZN1_FUNC_GPIO)>,	/* GPIO1B[23] */
+			 <RZN1_PINMUX(93, RZN1_FUNC_GPIO)>;	/* GPIO1B[24] */
+	};
+
 	pins_eth3: pins_eth3 {
 		pinmux =3D <RZN1_PINMUX(36, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(37, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>

to my board dts. The controller gets probed but I can't control the
LEDs. Neither with exported GPIOs (via sysfs) nor with a dedicated LED
node. Am I missing something obvious? The LEDs are attached to PL_GPIO92
and PL_GPIO93 which are mapped to GPIO1b[23] and GPIO1b[24]. That seems
to be in accordance with the datasheet. I hope I just overlooked
something simple. Some outputs, first /sys/kernel/debug/gpio:

	...
	gpiochip1: GPIOs 552-583, parent: platform/5000c000.gpio, 5000c000.gpio:

	gpiochip2: GPIOs 584-615, parent: platform/5000c000.gpio, 5000c000.gpio:
	 gpio-608 (                    |sysfs               ) out hi=20

And /sys/kernel/debug/pinctrl/40067000.pinctrl/pinmux-pins:

	Pinmux settings per pin
	Format: pin (name): mux_owner gpio_owner hog?
	...
	pin 92 (pl_gpio92): 5000c000.gpio (GPIO UNCLAIMED) function pins-gpio1 gro=
up pins-gpio1
	pin 93 (pl_gpio93): 5000c000.gpio (GPIO UNCLAIMED) function pins-gpio1 gro=
up pins-gpio1

I wonder about the "(GPIO UNCLAIMED)" a little? How do you use it on
your board?

Thanks and happy hacking,

   Wolfram


--tGZeYYr7bFhEpP7L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiGBwsACgkQFA3kzBSg
KbYYQxAAnIpAzuXq6T3edvRLb/lDuFNyMoX8x0pJ77l+3whT20PiVkesBpCx0lDA
ySWTo3lfb4E0TwyjtnLLShiHXHPDHfQL0EpZXA2mEQGmcLP+KIHJorg+laIVDyI3
ILPOSPk71aT/X242kbVw+hdZHTS/vHDqJiOlf6cZ1doPm8xqurTgTzVtMP6k+bXD
HFxTQtwAwC0RWC+ZIZlvfZ1+XSzIJIsjeM3eZGE2W47WrahaH2mqi/Lp91S6UVl/
GSVB4uGHqOIY6UOTPYaHbz3dKMSqI4W7MVcHmVoNNfkpb07vuiRKO6v4/ST1rtDE
bWIARiTFFMamfIiLvvqPy+flJKk/lZ6uMWVnJKbDYxTNnD4gYvjXBeFUzVJccW6x
qghGX5Pchg3Vf2T/bgN7qAY5/Jrm+fnRp0sVVm1e72cI1QmgS1Nn575J8OSoFfvx
TJdQ872i1xObZm6B9MR0DmBOjUYux+Xr6IUfISdZ4uaxGt03RDtMnRDb/3YjCgU7
486zW4Kt5bGeTwL8d/4jIS49LsIDUFCMcy3/3iwGqytt7HcwDwduwX10I74LekOe
azCxVmqS8afTRaUuwHIfaNEkG2eMSf1iq06ZnEXwaH+EfpTh0x8CFnbBF2U0JWVP
DRNmMmGhZSJuQctFwZRm3bZlSx4TpQc354OX/q2m3gbBJw1S8B0=
=7HK4
-----END PGP SIGNATURE-----

--tGZeYYr7bFhEpP7L--

