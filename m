Return-Path: <linux-gpio+bounces-32391-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPzcByh0pWkNBgYAu9opvQ
	(envelope-from <linux-gpio+bounces-32391-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 12:27:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AC41D7777
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 12:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B13A83038AE9
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 11:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86B1361DDB;
	Mon,  2 Mar 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CR72+dyb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9468361DA8;
	Mon,  2 Mar 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450572; cv=none; b=jZKeYDup/Bdp/t5xQm/4iZ8CUweBDwpe3Jypv6G3BRdMQrsEybeOdFdhWtEMFYCS5e43sFIo+mSs+apJ1hFFHSbBA/wCMQCztsGVhP36Eijcbzy9XotTVP96zsewDAq6FAIIp6sK51xSoHSAaaMUKSv2Anb5gEWR0u3B5/02S+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450572; c=relaxed/simple;
	bh=F0RpYt/xYTOulkmg02m2V9erbUhS84/fAQaXNHW+3g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPRk0cVrGGg1YK+FsfBghBt3l24FaHyFQfvIM2saya7YmL96lakRNZ91/0Wl+JqrmrcTS4ScNrxwJ8PIIxsKWGRX472WFc1MFbIqtIqZXy56DQ2mOU/5+bJ0jVeHisHZCLvVzG2YVv59mOFGPABYo7czx9J6Lv8WnWszrw3Yv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CR72+dyb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41594C19423;
	Mon,  2 Mar 2026 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772450572;
	bh=F0RpYt/xYTOulkmg02m2V9erbUhS84/fAQaXNHW+3g8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CR72+dybgJuzcXVs9t6MsaU3kgYio0aW4iyiq+8DDBa4Hp0xPahs91KnZzNlJi+39
	 q+1F19YAAddZapkFrbdppsoi/fWeqctM2ZSRDpbPyoAEkvbFCVdWlhLMpPceTE9RyT
	 p4PRJzG2AuS98u3GcUGem0WxKdf1DPdf6lij4dIlPizzG+bBiEWWwhoaEIc4eQiz6p
	 +WbdF3pEke1x6IZS53RH4XiiR86KAi2PiShsMHesUgX1WW3n92NHjwHwHFeFdU3KcQ
	 rXhs7Mb+oePBHvBR5NiUCVb2hb3SZrF41baleICzesAHEBzRyoKuEszi/e/b7tZPvT
	 H+1N1uDeoatBg==
Date: Mon, 2 Mar 2026 11:22:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC v11 3/4] soc: microchip: add mpfs gpio interrupt mux driver
Message-ID: <20260302-spoiling-bullring-9b7fcdd805ee@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
 <20260227-flashing-overcast-85ff59b2e82c@spud>
 <20260302105824.21b5c7d6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jaZPhkjkO4quy2lU"
Content-Disposition: inline
In-Reply-To: <20260302105824.21b5c7d6@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32391-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 70AC41D7777
X-Rspamd-Action: no action


--jaZPhkjkO4quy2lU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2026 at 10:58:24AM +0100, Herve Codina wrote:
> Hi Conor,
>=20
> On Fri, 27 Feb 2026 14:52:29 +0000
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > On PolarFire SoC there are more GPIO interrupts than there are interrupt
> > lines available on the PLIC, and a runtime configurable mux is used to
> > decide which interrupts are assigned direct connections to the PLIC &
> > which are relegated to sharing a line.
> >=20
> > Add a driver so that Linux can set the mux based on the interrupt
> > mapping in the devicetree.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> ...
>=20
> > --- a/drivers/soc/microchip/Kconfig
> > +++ b/drivers/soc/microchip/Kconfig
> > @@ -1,3 +1,14 @@
> > +config POLARFIRE_SOC_IRQ_MUX
> > +	bool "Microchip PolarFire SoC's GPIO IRQ Mux"
> > +	depends on ARCH_MICROCHIP
> > +	select REGMAP
> > +	select REGMAP_MMIO
> > +	default y
> > +	help
> > +	  Support for the interrupt mux on Polarfire SoC. It sits between
> > +	  the GPIO controllers and the PLIC, as only 35 interrupts are shared
> > +	  between 3 GPIO controllers with 32 interrupts each.
>=20
> 35 interrupts ?

I copy-pasted this from Kconfig text for the other mux implementation
that's been floating around since 6.10. I should have double checked
it. I think the 35 came from 32 + 3, not realising that there are 6
lines on GPIO controller 1 that are always in "direct" mode. When I
wrote that description I must have thought those 6 were always in
"non-direct" mode.

> Previously (other patches) you mentionned 41 (38 + 3).
>=20
> Also 32 interrutps on each (3 * 32 =3D 96) but you talked about 70 on pre=
vious
> patches.
>=20
> Can you double check or clarify those numbers ?

Yeah, this whole description is not good, 70 and 38 + 3 are correct.
The controllers have 14, 24 and 32 lines.

> ...
> > +++ b/drivers/soc/microchip/mpfs-irqmux.c
> > @@ -0,0 +1,167 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Largely copied from rzn1_irqmux.c
> > + */
> > +
> > +#include <linux/bitmap.h>
> > +#include <linux/bitops.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#define MPFS_IRQMUX_CR		0x54
> > +#define MPFS_IRQMUX_NUM_OUTPUTS	70
>=20
> Is 70 really the outputs ?
>=20
> According to previous patches, I would say 41 (38+3).

I guess in my head the direction was PLIC -> MUX -> GPIO, cos that's the
way the software follows the chain, so the mux would have 41 inputs and
70 outputs.

> ...
> > +static int mpfs_irqmux_probe(struct platform_device *pdev)
> > +{
> > +	DECLARE_BITMAP(line_done, MPFS_IRQMUX_NUM_OUTPUTS) =3D {};
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *np =3D dev->of_node;
> > +	struct of_imap_parser imap_parser;
> > +	struct of_imap_item imap_item;
> > +	struct regmap *regmap;
> > +	int ret, direct_mode, line, controller, gpio;
>=20
> Reverse Xmas tree.
>=20
> > +	u32 tmp, val =3D 0, old;
>=20
> ...
> > +	for_each_of_imap_item(&imap_parser, &imap_item) {
> > +
> > +		direct_mode =3D mpfs_irqmux_is_direct_mode(dev, &imap_item.parent_ar=
gs);
> > +		if (direct_mode < 0) {
> > +			of_node_put(imap_item.parent_args.np);
> > +			return direct_mode;
> > +		}
> > +
> > +		line =3D imap_item.child_imap[0];
> > +		gpio =3D line % 32;
> > +		controller =3D line / 32;
> > +
> > +		if (controller > 2) {
> > +			of_node_put(imap_item.parent_args.np);
> > +			dev_err(dev, "child interrupt number too large: %d\n", line);
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (test_and_set_bit(line, line_done)) {
>=20
> Your bitmap size is MPFS_IRQMUX_NUM_OUTPUTS but you your line variable can
> have values from 0 to 95.

I think this is one of the things that kinda made sense when I started
copying your work, but by the time I was done I had diverged enough that
it didn't really make sense any more. Probably I should keep the check,
but increase the bitmap to 96, not as if packing is going to make a
worthwhile saving.

> Maybe some checks on imap_item.child_imap[0] or line could be added in
> order to be be sure that line value will fit in the bitmap.
>=20
>=20
> > +			of_node_put(imap_item.parent_args.np);
> > +			dev_err(dev, "Mux output line %d already defined in interrupt-map\n=
",
> > +				line);
>=20
> line is computed from imap_item.child_imap[0]. It is the input and not the
> output.

That's the starting point being the PLIC versus the GPIO controller. I
should probably swap that stuff around I guess?

>=20
> In rzn1-irqmux.c, the bitmap is used to avoid multiple input lines using =
the same
> output line. Bitmap bits represent outputs.

I considered checking the other side too, but excluding the 3 shared
interrupts. Do you think that is worthwhile here? Reuse of what you call
"output lines" is obviously something that I allow, I wanted to make
sure that, as I mandated 70 entries in the property, that they were all
unique.

> > +			return -EINVAL;
> > +		}
> > +
> > +		/*
> > +		 * There are 41 interrupts assigned to GPIOs, of which 38 are "direc=
t". Since the
> > +		 * mux has 32 bits only, 6 of these exclusive/"direct" interrupts re=
main. These
> > +		 * are used by GPIO controller 1's lines 18 to 23. Nothing needs to =
be done
> > +		 * for these interrupts.
> > +		 */
> > +		if (controller =3D=3D 1 && gpio >=3D 18)
> > +			continue;
> > +
> > +		/*
> > +		 * The mux has a single register, where bits 0 to 13 mux between GPI=
O controller
> > +		 * 1's 14 GPIOs and GPIO controller 2's first 14 GPIOs. The remainin=
g bits mux
> > +		 * between the first 18 GPIOs of controller 1 and the last 18 GPIOS =
of
> > +		 * controller 2. If a bit in the mux's control register is set, the
> > +		 * corresponding interrupt line for GPIO controller 0 or 1 will be p=
ut in
> > +		 * "non-direct" mode. If cleared, the "fabric" controller's will.
> > +		 *
> > +		 * Register layout:
> > +		 *    GPIO 1 interrupt line 17 | mux bit 31 | GPIO 2 interrupt line =
31
> > +		 *    ...                      | ...        | ...
> > +		 *    ...                      | ...        | ...
> > +		 *    GPIO 1 interrupt line  0 | mux bit 14 | GPIO 2 interrupt line =
14
> > +		 *    GPIO 0 interrupt line 13 | mux bit 13 | GPIO 2 interrupt line =
13
> > +		 *    ...                      | ...        | ...
> > +		 *    ...                      | ...        | ...
> > +		 *    GPIO 0 interrupt line  0 | mux bit  0 | GPIO 2 interrupt line =
 0
> > +		 *
> > +		 * As the binding mandates 70 items, one for each GPIO line, there's=
 no need to
> > +		 * handle anything for GPIO controller 2, since the bit will be set =
for the
> > +		 * corresponding line in GPIO controller 0 or 1.
>=20
> Hum, what happen if the interrupts property is set in the GPIO controller=
 2 and not
> GPIO controllers 0 or 1.
>=20
> Is it legit ?
>=20
> If so, should lines coming from GPIO controller 2 be took into account ?
>=20
> Maybe my comment is not relevant due to some misunderstanding in the not
> so obvious mapping.

My logic here was that what is done in the controller nodes doesn't
matter, because I will always mandate that if the map property is
provided in the mux node that it has 70 items. Even if controller 0 and
1 are not used, this driver will still be able to read the mappings for
them and set the mux correctly. Whether or not there's an interrupts
property in any of the controllers shouldn't matter here at all, when it
comes to writing the mux, right?

Thanks for taking a look at the series :+1:

Cheers,
Conor.

>=20
> > +		 */
> > +		if (controller =3D=3D 2)
> > +			continue;
> > +
> > +		/*
> > +		 * If in direct mode, the bit is cleared, nothing needs to be done a=
s val is zero
> > +		 * initialised and that's the direct mode setting for GPIO controlle=
r 0 and 1.
> > +		 */
> > +		if (direct_mode)
> > +			continue;
> > +
> > +		if (controller =3D=3D 0)
> > +			val |=3D 1U << gpio;
> > +		else
> > +			val |=3D 1U << (gpio + 14);
> > +	}
> > +
> > +	regmap_read(regmap, MPFS_IRQMUX_CR, &old);
> > +	regmap_write(regmap, MPFS_IRQMUX_CR, val);
> > +
> > +	if (val !=3D old)
> > +		dev_info(dev, "firmware mux setting of 0x%x overwritten to 0x%x\n", =
old, val);
> > +
> > +	return 0;
> > +}
> > +


--jaZPhkjkO4quy2lU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaVzBgAKCRB4tDGHoIJi
0guBAP4vIUOOxg9ScxoguhFsRG4Y9tA56aRMtey847+h1+MqmAEAjoxupnv3mR5g
9yUWvt9idB6qe/LPGkLbHgqN+rzfpAg=
=WPAE
-----END PGP SIGNATURE-----

--jaZPhkjkO4quy2lU--

