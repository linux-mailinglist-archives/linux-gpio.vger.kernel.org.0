Return-Path: <linux-gpio+bounces-27113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F0BDA2B5
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6FAC5418F1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279A12FF64A;
	Tue, 14 Oct 2025 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jm3OqX7U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09371D8E1A;
	Tue, 14 Oct 2025 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453623; cv=none; b=siPvQmZ5sUwrrIQb8OlZyZpEFVpzyseY7mRiLZixt/Qexuh+QMCiLO+1NDn5uiwTNq5EFumb1Kforxnw/LYk6+ymlmreokNufoFgWEhfbzyhv8uLtXIhRYzNYB7pM4Tj815taeK2qP47Vc7b7bHgpJ0EUrbR45LVJHR5qpUhe6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453623; c=relaxed/simple;
	bh=xZGoceGmRGm/vUIa8AC2yAd6DePbxAMzPAjKBeTIdqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWg+TASGcDrs/tmpQlWuveC+gLdvCAnuk5G3bNS1UdpeRhlJQmkb/SGYn9GYPmvbdJJ69nTIyudMn2vgielwxsfMSsajdWyDG5EXQgqNVSoq2TJ5BXu2KaYHdq5gLspSTCz0dBGZdgUjo9oEDC1kqBMDDDe4n86JlbKJfPAEkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jm3OqX7U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24A9C4CEE7;
	Tue, 14 Oct 2025 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760453623;
	bh=xZGoceGmRGm/vUIa8AC2yAd6DePbxAMzPAjKBeTIdqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jm3OqX7UwRzMUOGLzUynu1g1YSvd2sEDRAskDWornCMoQyuXQObRi/7Y5iX3v+Iis
	 u0EtB4A9H89mYaiU1Xw+usZdL7nqQ72hCyzXBX+91n+WEWFptzFW4UTROYHxIAsl48
	 11bx2qQ647LPYYqyQSvp/AbVsysVHL2sADBt7+FD+NGMn0j1mNG4WcBNpqOiXQfaK7
	 Y2fErmsTV4Ipcx3SHNBxn/EDoo4MsAAQ2Kkrz3TJZd9djMG4DCJKtTUsmdZD16i3xy
	 uCEpBVbYtgFYUwR+2TQPH4NkLHvlzqUJgC6xRk/Spf5qQ5dS1cbxEwtDzOUyCURPJS
	 wvBFJwIibG3Zw==
Date: Tue, 14 Oct 2025 15:53:39 +0100
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v2 4/5] pinctrl: add polarfire soc iomux0 pinmux driver
Message-ID: <20251014-fascism-deface-d32bd741cd2f@spud>
References: <20251014-retype-limit-e6cbe901aa07@spud>
 <20251014-evaluator-enunciate-e30b0707d1ca@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L4BeR/aT/Wa4eQTZ"
Content-Disposition: inline
In-Reply-To: <20251014-evaluator-enunciate-e30b0707d1ca@spud>


--L4BeR/aT/Wa4eQTZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

So, w.r.t. the correct wording, and whether "pin" etc are appropriate to
use...

On Tue, Oct 14, 2025 at 03:35:37PM +0100, Conor Dooley wrote:
> +struct mpfs_iomux0_pinctrl {
> +	struct pinctrl_dev *pctrl;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct pinctrl_desc desc;
> +};
> +
> +struct mpfs_iomux0_pin_group {
> +	const char *name;
> +	const unsigned int *pins;
> +	u32 mask;
> +	u32 setting;
> +};

"pin group" here could be "peripheral routing", similarly "pin" could be
replaced by "peripheral", that's the wording that's most commonly used
our docs and I just don't have many ideas about good alternative to
function!

> +
> +struct mpfs_iomux0_function {
> +	const char *name;
> +	const char * const *groups;

groups would then be routing

> +};
> +
> +static const struct pinctrl_pin_desc mpfs_iomux0_pins[] =3D {

static const struct pinctrl_pin_desc mpfs_iomux_peripherals

> +	PINCTRL_PIN(0, "spi0"),

then this would be MPFS_PERIPHERAL or something, but the same actual
macro contents in order to ideally retain use of pinctrl_pin_desc.

> +	PINCTRL_PIN(1, "spi1"),
> +	PINCTRL_PIN(2, "i2c0"),
> +	PINCTRL_PIN(3, "i2c1"),
> +	PINCTRL_PIN(4, "can0"),
> +	PINCTRL_PIN(5, "can1"),
> +	PINCTRL_PIN(6, "qspi"),
> +	PINCTRL_PIN(7, "uart0"),
> +	PINCTRL_PIN(8, "uart1"),
> +	PINCTRL_PIN(9, "uart2"),
> +	PINCTRL_PIN(10, "uart3"),
> +	PINCTRL_PIN(11, "uart4"),
> +	PINCTRL_PIN(12, "mdio0"),
> +	PINCTRL_PIN(13, "mdio1"),
> +};
> +
> +static const unsigned int mpfs_iomux0_spi0_pins[] =3D { 0 };

s/_pins// maybe.

> +static const unsigned int mpfs_iomux0_spi1_pins[] =3D { 1 };
> +static const unsigned int mpfs_iomux0_i2c0_pins[] =3D { 2 };
> +static const unsigned int mpfs_iomux0_i2c1_pins[] =3D { 3 };
> +static const unsigned int mpfs_iomux0_can0_pins[] =3D { 4 };
> +static const unsigned int mpfs_iomux0_can1_pins[] =3D { 5 };
> +static const unsigned int mpfs_iomux0_qspi_pins[] =3D { 6 };
> +static const unsigned int mpfs_iomux0_uart0_pins[] =3D { 7 };
> +static const unsigned int mpfs_iomux0_uart1_pins[] =3D { 8 };
> +static const unsigned int mpfs_iomux0_uart2_pins[] =3D { 9 };
> +static const unsigned int mpfs_iomux0_uart3_pins[] =3D { 10 };
> +static const unsigned int mpfs_iomux0_uart4_pins[] =3D { 11 };
> +static const unsigned int mpfs_iomux0_mdio0_pins[] =3D { 12 };
> +static const unsigned int mpfs_iomux0_mdio1_pins[] =3D { 13 };
> +
> +#define MPFS_IOMUX0_GROUP(_name) { \

s/GROUPS/ROUTINGS/

> +	.name =3D #_name "_mssio",	\
> +	.pins =3D mpfs_iomux0_##_name##_pins,	\
> +	.mask =3D BIT(mpfs_iomux0_##_name##_pins[0]),	\
> +	.setting =3D 0x0,	\
> +}, { \
> +	.name =3D #_name "_fabric",	\
> +	.pins =3D mpfs_iomux0_##_name##_pins,	\
> +	.mask =3D BIT(mpfs_iomux0_##_name##_pins[0]),	\
> +	.setting =3D BIT(mpfs_iomux0_##_name##_pins[0]),	\

idk what you think of these macros, but I feel like they reduced my
changes of making a mistake..

> +}
> +
> +static const struct mpfs_iomux0_pin_group mpfs_iomux0_pin_groups[] =3D {

s/pin_group/peripheral_routing/

> +	MPFS_IOMUX0_GROUP(spi0),
> +	MPFS_IOMUX0_GROUP(spi1),
> +	MPFS_IOMUX0_GROUP(i2c0),
> +	MPFS_IOMUX0_GROUP(i2c1),
> +	MPFS_IOMUX0_GROUP(can0),
> +	MPFS_IOMUX0_GROUP(can1),
> +	MPFS_IOMUX0_GROUP(qspi),
> +	MPFS_IOMUX0_GROUP(uart0),
> +	MPFS_IOMUX0_GROUP(uart1),
> +	MPFS_IOMUX0_GROUP(uart2),
> +	MPFS_IOMUX0_GROUP(uart3),
> +	MPFS_IOMUX0_GROUP(uart4),
> +	MPFS_IOMUX0_GROUP(mdio0),
> +	MPFS_IOMUX0_GROUP(mdio1),
> +};
> +
> +static const char * const mpfs_iomux0_spi0_groups[] =3D { "spi0_mssio", =
"spi0_fabric" };

s/groups/routings/

> +static const char * const mpfs_iomux0_spi1_groups[] =3D { "spi1_mssio", =
"spi1_fabric" };
> +static const char * const mpfs_iomux0_i2c0_groups[] =3D { "i2c0_mssio", =
"i2c0_fabric" };
> +static const char * const mpfs_iomux0_i2c1_groups[] =3D { "i2c1_mssio", =
"i2c1_fabric" };
> +static const char * const mpfs_iomux0_can0_groups[] =3D { "can0_mssio", =
"can0_fabric" };
> +static const char * const mpfs_iomux0_can1_groups[] =3D { "can1_mssio", =
"can1_fabric" };
> +static const char * const mpfs_iomux0_qspi_groups[] =3D { "qspi_mssio", =
"qspi_fabric" };
> +static const char * const mpfs_iomux0_uart0_groups[] =3D { "uart0_mssio"=
, "uart0_fabric" };
> +static const char * const mpfs_iomux0_uart1_groups[] =3D { "uart1_mssio"=
, "uart1_fabric" };
> +static const char * const mpfs_iomux0_uart2_groups[] =3D { "uart2_mssio"=
, "uart2_fabric" };
> +static const char * const mpfs_iomux0_uart3_groups[] =3D { "uart3_mssio"=
, "uart3_fabric" };
> +static const char * const mpfs_iomux0_uart4_groups[] =3D { "uart4_mssio"=
, "uart4_fabric" };
> +static const char * const mpfs_iomux0_mdio0_groups[] =3D { "mdio0_mssio"=
, "mdio0_fabric" };
> +static const char * const mpfs_iomux0_mdio1_groups[] =3D { "mdio1_mssio"=
, "mdio1_fabric" };
> +
> +#define MPFS_IOMUX0_FUNCTION(_name) { \
> +	.name =3D #_name,	\
> +	.groups =3D mpfs_iomux0_##_name##_groups,	\
> +}
> +
> +static const struct mpfs_iomux0_function mpfs_iomux0_functions[] =3D {
> +	MPFS_IOMUX0_FUNCTION(spi0),
> +	MPFS_IOMUX0_FUNCTION(spi1),
> +	MPFS_IOMUX0_FUNCTION(i2c0),
> +	MPFS_IOMUX0_FUNCTION(i2c1),
> +	MPFS_IOMUX0_FUNCTION(can0),
> +	MPFS_IOMUX0_FUNCTION(can1),
> +	MPFS_IOMUX0_FUNCTION(qspi),
> +	MPFS_IOMUX0_FUNCTION(uart0),
> +	MPFS_IOMUX0_FUNCTION(uart1),
> +	MPFS_IOMUX0_FUNCTION(uart2),
> +	MPFS_IOMUX0_FUNCTION(uart3),
> +	MPFS_IOMUX0_FUNCTION(uart4),
> +	MPFS_IOMUX0_FUNCTION(mdio0),
> +	MPFS_IOMUX0_FUNCTION(mdio1),
> +};
> +
> +static void mpfs_iomux0_pin_dbg_show(struct pinctrl_dev *pctrl_dev, stru=
ct seq_file *seq,
> +				     unsigned int pin)

for this function, pin -> peripheral

> +{
> +	struct mpfs_iomux0_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrl_dev=
);
> +	u32 val;
> +
> +	seq_printf(seq, "reg: %x, pin: %u ", MPFS_IOMUX0_REG, pin);
> +
> +	regmap_read(pctrl->regmap, MPFS_IOMUX0_REG, &val);
> +	val =3D (val & BIT(pin)) >> pin;
> +
> +	seq_printf(seq, "val: %x\n", val);
> +}
> +
> +static int mpfs_iomux0_groups_count(struct pinctrl_dev *pctldev)

group -> routing

> +{
> +	return ARRAY_SIZE(mpfs_iomux0_pin_groups);
> +}
> +
> +static const char *mpfs_iomux0_group_name(struct pinctrl_dev *pctldev, u=
nsigned int selector)
> +{
> +	return mpfs_iomux0_pin_groups[selector].name;
> +}
> +
> +static int mpfs_iomux0_group_pins(struct pinctrl_dev *pctldev, unsigned =
int selector,
> +				  const unsigned int **pins, unsigned int *num_pins)
> +{
> +	*pins =3D mpfs_iomux0_pin_groups[selector].pins;
> +	*num_pins =3D 1;
> +
> +	return 0;
> +}
> +
> +static const struct pinctrl_ops mpfs_iomux0_pinctrl_ops =3D {
> +	.get_groups_count =3D mpfs_iomux0_groups_count,
> +	.get_group_name =3D mpfs_iomux0_group_name,
> +	.get_group_pins =3D mpfs_iomux0_group_pins,

obviously here, the left hand side wouldn't be changeable if the common
pinctrl stuff is to be used.

> +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_all,
> +	.dt_free_map =3D pinctrl_utils_free_map,
> +	.pin_dbg_show =3D mpfs_iomux0_pin_dbg_show,
> +};
> +
> +static int mpfs_iomux0_pinmux_set_mux(struct pinctrl_dev *pctrl_dev, uns=
igned int fsel,
> +				      unsigned int gsel)

maybe this is s/pinmux_//
> +{
> +	struct mpfs_iomux0_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrl_dev=
);
> +	struct device *dev =3D pctrl->dev;
> +	const struct mpfs_iomux0_pin_group *group;
> +	const struct mpfs_iomux0_function *function;
> +
> +	group =3D &mpfs_iomux0_pin_groups[gsel];
> +	function =3D &mpfs_iomux0_functions[fsel];
> +
> +	dev_dbg(dev, "Setting func %s mask %x setting %x\n",
> +		function->name, group->mask, group->setting);
> +	regmap_assign_bits(pctrl->regmap, MPFS_IOMUX0_REG, group->mask, group->=
setting);
> +
> +	return 0;
> +}
> +
> +static int mpfs_iomux0_pinmux_get_funcs_count(struct pinctrl_dev *pctlde=
v)
> +{
> +	return ARRAY_SIZE(mpfs_iomux0_functions);
> +}
> +
> +static const char *mpfs_iomux0_pinmux_get_func_name(struct pinctrl_dev *=
pctldev,
> +						    unsigned int selector)
> +{
> +	return mpfs_iomux0_functions[selector].name;
> +}
> +
> +static int mpfs_iomux0_pinmux_get_groups(struct pinctrl_dev *pctldev, un=
signed int selector,
> +					 const char * const **groups,
> +					 unsigned int * const num_groups)

groups references here would become routings, as above.

> +{
> +	*groups =3D mpfs_iomux0_functions[selector].groups;
> +	*num_groups =3D 2;
> +
> +	return 0;
> +}
> +
> +static const struct pinmux_ops mpfs_iomux0_pinmux_ops =3D {
> +	.get_functions_count =3D mpfs_iomux0_pinmux_get_funcs_count,
> +	.get_function_name =3D mpfs_iomux0_pinmux_get_func_name,
> +	.get_function_groups =3D mpfs_iomux0_pinmux_get_groups,
> +	.set_mux =3D mpfs_iomux0_pinmux_set_mux,
> +};
> +
> +static int mpfs_iomux0_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct mpfs_iomux0_pinctrl *pctrl;
> +
> +	pctrl =3D devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
> +	if (!pctrl)
> +		return -ENOMEM;
> +
> +	pctrl->regmap =3D device_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(pctrl->regmap))
> +		dev_err_probe(dev, PTR_ERR(pctrl->regmap), "Failed to find syscon regm=
ap\n");
> +
> +	pctrl->desc.name =3D dev_name(dev);
> +	pctrl->desc.pins =3D mpfs_iomux0_pins;
> +	pctrl->desc.npins =3D ARRAY_SIZE(mpfs_iomux0_pins);

similar here, can't really change the names what's in desc if I want to use
the pinctrl core features, right? Well, I suppose I /could/ but it'd
have to be the same struct layout and get cast, and I really don't like
that idea very much! Or something funny with macros to obfuscate, but I
don't think that is ultimately very beneficial either.

> +	pctrl->desc.pctlops =3D &mpfs_iomux0_pinctrl_ops;
> +	pctrl->desc.pmxops =3D &mpfs_iomux0_pinmux_ops;
> +	pctrl->desc.owner =3D THIS_MODULE;
> +
> +	pctrl->dev =3D dev;
> +
> +	platform_set_drvdata(pdev, pctrl);
> +
> +	pctrl->pctrl =3D devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
> +	if (IS_ERR(pctrl->pctrl))
> +		return PTR_ERR(pctrl->pctrl);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mpfs_iomux0_of_match[] =3D {
> +	{ .compatible =3D "microchip,mpfs-pinctrl-iomux0" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_iomux0_of_match);
> +
> +static struct platform_driver mpfs_iomux0_driver =3D {
> +	.driver =3D {
> +		.name =3D "mpfs-pinctrl-iomux0",
> +		.of_match_table =3D mpfs_iomux0_of_match,
> +	},
> +	.probe =3D mpfs_iomux0_probe,
> +};
> +module_platform_driver(mpfs_iomux0_driver);
> +
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("Polarfire SoC iomux0 pinctrl driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.51.0
>=20

--L4BeR/aT/Wa4eQTZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO5j8wAKCRB4tDGHoIJi
0tzZAP4ogWcskJA9GQyOiK94MlvWuljH0X7x3qsy1RLEZUQVXwD/RkA6csKg6xms
PHt3Fc/VBV3+5m/iGRz8zIyAA4FWiA0=
=L5iA
-----END PGP SIGNATURE-----

--L4BeR/aT/Wa4eQTZ--

