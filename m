Return-Path: <linux-gpio+bounces-20625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E640AC63B3
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 10:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4CB1BA2756
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 08:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9031F63F9;
	Wed, 28 May 2025 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VICjx/ML"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B720A5EC;
	Wed, 28 May 2025 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419661; cv=none; b=VkSbozliwwtD1GKZvPTFRpVChbxCdFlnyjyxkGCG4CksS5Uw6oEVZ5X4b+So5pMl/uvwzhAUtwgHL2Lm595RYX+lk0dKhZ39F96yF3WiME+3VMTmZy22yTDgRx/WQPPt8Gkfq5WJwthpd5SZPNIA+iowV0qKfykutVoaWn2kmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419661; c=relaxed/simple;
	bh=1pBhCd+qGZi/SHwoxBvC4XgzfEU7qen+VlOLfBKDrIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RovghCcQX7weQuyUVUP5qiJtiBYfrbqZH9vDYzVDKeBBchICWHmQuNRnbcQCw9CR0V62Js/dNeD4KMNWtmTMcF5wvVE8vifz6vWD1WbYB2eIEjvrH0e15q2rOpIQNikT7+cBMmWtdWf1sboCcuof6s5ns+LpWlY1twhXdoz7OIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VICjx/ML; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68098C4CEE7;
	Wed, 28 May 2025 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419659;
	bh=1pBhCd+qGZi/SHwoxBvC4XgzfEU7qen+VlOLfBKDrIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VICjx/ML3GXxtr9cSwNwHdLHtS9jEPLnVCmSuYBCrkwGr4riClvxcJaOsj4M7QiUJ
	 pcGXkF+mtijzoRiSaDydxH7p4KkjQ12vSY6eaBi/AC4aGVAiFtOIE28pUedplnu7+B
	 uUwJXqY8QglH+olTCjbB8gMLq94U0zBBKfohkxnr/rQNnqxX7bqeqBkli3hKT/qJgL
	 Qf5X9pTS4iRPcU1gcDQgLchh6XQRdHbmExrgot83SitLC4IK7G1piVLthUNX+Har6P
	 XxKkUnjYKaqjjUypR41oHPNHuIKAc3SDOApXnMD7XeIFpaxpTH77CPFwTk0OAsO0md
	 6frSafGJtGK+w==
Date: Wed, 28 May 2025 10:07:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] pinctrl: mediatek: airoha: generalize
 pins/group/function/confs handling
Message-ID: <aDbESUHdO4DgOtsm@lore-desk>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nqxKMu4BAXZxRr1I"
Content-Disposition: inline
In-Reply-To: <20250527222040.32000-3-ansuelsmth@gmail.com>


--nqxKMu4BAXZxRr1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In preparation for support of Airoha AN7583, generalize
> pins/group/function/confs handling and move them in match_data.
> Inner function will base the values on the pinctrl priv struct instead of
> relying on hardcoded struct.
>=20
> This permits to use different PIN data while keeping the same logic.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Hi Christian,

I think the approach is fine, just some comments inline.

Regards,
Lorenzo

> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 569 ++++++++++++----------
>  1 file changed, 319 insertions(+), 250 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index 8ef7f88477aa..8af9109db992 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -30,20 +30,20 @@
>  #include "../pinconf.h"
>  #include "../pinmux.h"
> =20
> -#define PINCTRL_PIN_GROUP(id)						\
> -	PINCTRL_PINGROUP(#id, id##_pins, ARRAY_SIZE(id##_pins))
> +#define PINCTRL_PIN_GROUP(id, table)					\

since this is now just used for the name pointer, I guess you can rename it=
 in
"name".

> +	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
> =20
> -#define PINCTRL_FUNC_DESC(id)						\
> +#define PINCTRL_FUNC_DESC(id, table)					\
>  	{								\
>  		.desc =3D {						\
>  			.func =3D {					\
> -				.name =3D #id,				\
> -				.groups =3D id##_groups,			\
> -				.ngroups =3D ARRAY_SIZE(id##_groups),	\
> +				.name =3D id,				\
> +				.groups =3D table##_groups,		\
> +				.ngroups =3D ARRAY_SIZE(table##_groups),	\
>  			}						\
>  		},							\
> -		.groups =3D id##_func_group,				\
> -		.group_size =3D ARRAY_SIZE(id##_func_group),		\
> +		.groups =3D table##_func_group,				\
> +		.group_size =3D ARRAY_SIZE(table##_func_group),		\
>  	}
> =20
>  #define PINCTRL_CONF_DESC(p, offset, mask)				\
> @@ -359,16 +359,46 @@ struct airoha_pinctrl_gpiochip {
>  	u32 irq_type[AIROHA_NUM_PINS];
>  };
> =20
> +struct airoha_pinctrl_confs_info {
> +	const struct airoha_pinctrl_conf *confs;
> +	unsigned int num_confs;
> +};
> +
> +enum airoha_pinctrl_confs_type {
> +	AIROHA_PINCTRL_CONFS_PULLUP,
> +	AIROHA_PINCTRL_CONFS_PULLDOWN,
> +	AIROHA_PINCTRL_CONFS_DRIVE_E2,
> +	AIROHA_PINCTRL_CONFS_DRIVE_E4,
> +	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
> +
> +	AIROHA_PINCTRL_CONFS_MAX,

I guess with the approach suggested below we can get rid of AIROHA_PINCTRL_=
CONFS_MAX

> +};
> +
>  struct airoha_pinctrl {
>  	struct pinctrl_dev *ctrl;
> =20
> +	struct pinctrl_desc desc;
> +	const struct pingroup *grps;
> +	const struct airoha_pinctrl_func *funcs;
> +	const struct airoha_pinctrl_confs_info *confs_info;
> +
>  	struct regmap *chip_scu;
>  	struct regmap *regmap;
> =20
>  	struct airoha_pinctrl_gpiochip gpiochip;
>  };
> =20
> -static struct pinctrl_pin_desc airoha_pinctrl_pins[] =3D {
> +struct airoha_pinctrl_match_data {
> +	const struct pinctrl_pin_desc *pins;
> +	const unsigned int num_pins;
> +	const struct pingroup *grps;
> +	const unsigned int num_grps;
> +	const struct airoha_pinctrl_func *funcs;
> +	const unsigned int num_funcs;
> +	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_=
MAX];

In order to generalize the approach, I guess we can use a
airoha_pinctrl_confs_info pointer here, something like:

	const struct airoha_pinctrl_confs_info *confs_info;
	const unsigned int num_confs;

> +};
> +
> +static struct pinctrl_pin_desc en7581_pinctrl_pins[] =3D {
>  	PINCTRL_PIN(0, "uart1_txd"),
>  	PINCTRL_PIN(1, "uart1_rxd"),
>  	PINCTRL_PIN(2, "i2c_scl"),
> @@ -429,172 +459,172 @@ static struct pinctrl_pin_desc airoha_pinctrl_pin=
s[] =3D {
>  	PINCTRL_PIN(63, "pcie_reset2"),
>  };
> =20
> -static const int pon_pins[] =3D { 49, 50, 51, 52, 53, 54 };
> -static const int pon_tod_1pps_pins[] =3D { 46 };
> -static const int gsw_tod_1pps_pins[] =3D { 46 };
> -static const int sipo_pins[] =3D { 16, 17 };
> -static const int sipo_rclk_pins[] =3D { 16, 17, 43 };
> -static const int mdio_pins[] =3D { 14, 15 };
> -static const int uart2_pins[] =3D { 48, 55 };
> -static const int uart2_cts_rts_pins[] =3D { 46, 47 };
> -static const int hsuart_pins[] =3D { 28, 29 };
> -static const int hsuart_cts_rts_pins[] =3D { 26, 27 };
> -static const int uart4_pins[] =3D { 38, 39 };
> -static const int uart5_pins[] =3D { 18, 19 };
> -static const int i2c0_pins[] =3D { 2, 3 };
> -static const int i2c1_pins[] =3D { 14, 15 };
> -static const int jtag_udi_pins[] =3D { 16, 17, 18, 19, 20 };
> -static const int jtag_dfd_pins[] =3D { 16, 17, 18, 19, 20 };
> -static const int i2s_pins[] =3D { 26, 27, 28, 29 };
> -static const int pcm1_pins[] =3D { 22, 23, 24, 25 };
> -static const int pcm2_pins[] =3D { 18, 19, 20, 21 };
> -static const int spi_quad_pins[] =3D { 32, 33 };
> -static const int spi_pins[] =3D { 4, 5, 6, 7 };
> -static const int spi_cs1_pins[] =3D { 34 };
> -static const int pcm_spi_pins[] =3D { 18, 19, 20, 21, 22, 23, 24, 25 };
> -static const int pcm_spi_int_pins[] =3D { 14 };
> -static const int pcm_spi_rst_pins[] =3D { 15 };
> -static const int pcm_spi_cs1_pins[] =3D { 43 };
> -static const int pcm_spi_cs2_pins[] =3D { 40 };
> -static const int pcm_spi_cs2_p128_pins[] =3D { 40 };
> -static const int pcm_spi_cs2_p156_pins[] =3D { 40 };
> -static const int pcm_spi_cs3_pins[] =3D { 41 };
> -static const int pcm_spi_cs4_pins[] =3D { 42 };
> -static const int emmc_pins[] =3D { 4, 5, 6, 30, 31, 32, 33, 34, 35, 36, =
37 };
> -static const int pnand_pins[] =3D { 4, 5, 6, 7, 30, 31, 32, 33, 34, 35, =
36, 37, 38, 39, 40, 41, 42 };
> -static const int gpio0_pins[] =3D { 13 };
> -static const int gpio1_pins[] =3D { 14 };
> -static const int gpio2_pins[] =3D { 15 };
> -static const int gpio3_pins[] =3D { 16 };
> -static const int gpio4_pins[] =3D { 17 };
> -static const int gpio5_pins[] =3D { 18 };
> -static const int gpio6_pins[] =3D { 19 };
> -static const int gpio7_pins[] =3D { 20 };
> -static const int gpio8_pins[] =3D { 21 };
> -static const int gpio9_pins[] =3D { 22 };
> -static const int gpio10_pins[] =3D { 23 };
> -static const int gpio11_pins[] =3D { 24 };
> -static const int gpio12_pins[] =3D { 25 };
> -static const int gpio13_pins[] =3D { 26 };
> -static const int gpio14_pins[] =3D { 27 };
> -static const int gpio15_pins[] =3D { 28 };
> -static const int gpio16_pins[] =3D { 29 };
> -static const int gpio17_pins[] =3D { 30 };
> -static const int gpio18_pins[] =3D { 31 };
> -static const int gpio19_pins[] =3D { 32 };
> -static const int gpio20_pins[] =3D { 33 };
> -static const int gpio21_pins[] =3D { 34 };
> -static const int gpio22_pins[] =3D { 35 };
> -static const int gpio23_pins[] =3D { 36 };
> -static const int gpio24_pins[] =3D { 37 };
> -static const int gpio25_pins[] =3D { 38 };
> -static const int gpio26_pins[] =3D { 39 };
> -static const int gpio27_pins[] =3D { 40 };
> -static const int gpio28_pins[] =3D { 41 };
> -static const int gpio29_pins[] =3D { 42 };
> -static const int gpio30_pins[] =3D { 43 };
> -static const int gpio31_pins[] =3D { 44 };
> -static const int gpio33_pins[] =3D { 46 };
> -static const int gpio34_pins[] =3D { 47 };
> -static const int gpio35_pins[] =3D { 48 };
> -static const int gpio36_pins[] =3D { 49 };
> -static const int gpio37_pins[] =3D { 50 };
> -static const int gpio38_pins[] =3D { 51 };
> -static const int gpio39_pins[] =3D { 52 };
> -static const int gpio40_pins[] =3D { 53 };
> -static const int gpio41_pins[] =3D { 54 };
> -static const int gpio42_pins[] =3D { 55 };
> -static const int gpio43_pins[] =3D { 56 };
> -static const int gpio44_pins[] =3D { 57 };
> -static const int gpio45_pins[] =3D { 58 };
> -static const int gpio46_pins[] =3D { 59 };
> -static const int pcie_reset0_pins[] =3D { 61 };
> -static const int pcie_reset1_pins[] =3D { 62 };
> -static const int pcie_reset2_pins[] =3D { 63 };
> -
> -static const struct pingroup airoha_pinctrl_groups[] =3D {
> -	PINCTRL_PIN_GROUP(pon),
> -	PINCTRL_PIN_GROUP(pon_tod_1pps),
> -	PINCTRL_PIN_GROUP(gsw_tod_1pps),
> -	PINCTRL_PIN_GROUP(sipo),
> -	PINCTRL_PIN_GROUP(sipo_rclk),
> -	PINCTRL_PIN_GROUP(mdio),
> -	PINCTRL_PIN_GROUP(uart2),
> -	PINCTRL_PIN_GROUP(uart2_cts_rts),
> -	PINCTRL_PIN_GROUP(hsuart),
> -	PINCTRL_PIN_GROUP(hsuart_cts_rts),
> -	PINCTRL_PIN_GROUP(uart4),
> -	PINCTRL_PIN_GROUP(uart5),
> -	PINCTRL_PIN_GROUP(i2c0),
> -	PINCTRL_PIN_GROUP(i2c1),
> -	PINCTRL_PIN_GROUP(jtag_udi),
> -	PINCTRL_PIN_GROUP(jtag_dfd),
> -	PINCTRL_PIN_GROUP(i2s),
> -	PINCTRL_PIN_GROUP(pcm1),
> -	PINCTRL_PIN_GROUP(pcm2),
> -	PINCTRL_PIN_GROUP(spi),
> -	PINCTRL_PIN_GROUP(spi_quad),
> -	PINCTRL_PIN_GROUP(spi_cs1),
> -	PINCTRL_PIN_GROUP(pcm_spi),
> -	PINCTRL_PIN_GROUP(pcm_spi_int),
> -	PINCTRL_PIN_GROUP(pcm_spi_rst),
> -	PINCTRL_PIN_GROUP(pcm_spi_cs1),
> -	PINCTRL_PIN_GROUP(pcm_spi_cs2_p128),
> -	PINCTRL_PIN_GROUP(pcm_spi_cs2_p156),
> -	PINCTRL_PIN_GROUP(pcm_spi_cs2),
> -	PINCTRL_PIN_GROUP(pcm_spi_cs3),
> -	PINCTRL_PIN_GROUP(pcm_spi_cs4),
> -	PINCTRL_PIN_GROUP(emmc),
> -	PINCTRL_PIN_GROUP(pnand),
> -	PINCTRL_PIN_GROUP(gpio0),
> -	PINCTRL_PIN_GROUP(gpio1),
> -	PINCTRL_PIN_GROUP(gpio2),
> -	PINCTRL_PIN_GROUP(gpio3),
> -	PINCTRL_PIN_GROUP(gpio4),
> -	PINCTRL_PIN_GROUP(gpio5),
> -	PINCTRL_PIN_GROUP(gpio6),
> -	PINCTRL_PIN_GROUP(gpio7),
> -	PINCTRL_PIN_GROUP(gpio8),
> -	PINCTRL_PIN_GROUP(gpio9),
> -	PINCTRL_PIN_GROUP(gpio10),
> -	PINCTRL_PIN_GROUP(gpio11),
> -	PINCTRL_PIN_GROUP(gpio12),
> -	PINCTRL_PIN_GROUP(gpio13),
> -	PINCTRL_PIN_GROUP(gpio14),
> -	PINCTRL_PIN_GROUP(gpio15),
> -	PINCTRL_PIN_GROUP(gpio16),
> -	PINCTRL_PIN_GROUP(gpio17),
> -	PINCTRL_PIN_GROUP(gpio18),
> -	PINCTRL_PIN_GROUP(gpio19),
> -	PINCTRL_PIN_GROUP(gpio20),
> -	PINCTRL_PIN_GROUP(gpio21),
> -	PINCTRL_PIN_GROUP(gpio22),
> -	PINCTRL_PIN_GROUP(gpio23),
> -	PINCTRL_PIN_GROUP(gpio24),
> -	PINCTRL_PIN_GROUP(gpio25),
> -	PINCTRL_PIN_GROUP(gpio26),
> -	PINCTRL_PIN_GROUP(gpio27),
> -	PINCTRL_PIN_GROUP(gpio28),
> -	PINCTRL_PIN_GROUP(gpio29),
> -	PINCTRL_PIN_GROUP(gpio30),
> -	PINCTRL_PIN_GROUP(gpio31),
> -	PINCTRL_PIN_GROUP(gpio33),
> -	PINCTRL_PIN_GROUP(gpio34),
> -	PINCTRL_PIN_GROUP(gpio35),
> -	PINCTRL_PIN_GROUP(gpio36),
> -	PINCTRL_PIN_GROUP(gpio37),
> -	PINCTRL_PIN_GROUP(gpio38),
> -	PINCTRL_PIN_GROUP(gpio39),
> -	PINCTRL_PIN_GROUP(gpio40),
> -	PINCTRL_PIN_GROUP(gpio41),
> -	PINCTRL_PIN_GROUP(gpio42),
> -	PINCTRL_PIN_GROUP(gpio43),
> -	PINCTRL_PIN_GROUP(gpio44),
> -	PINCTRL_PIN_GROUP(gpio45),
> -	PINCTRL_PIN_GROUP(gpio46),
> -	PINCTRL_PIN_GROUP(pcie_reset0),
> -	PINCTRL_PIN_GROUP(pcie_reset1),
> -	PINCTRL_PIN_GROUP(pcie_reset2),
> +static const int en7581_pon_pins[] =3D { 49, 50, 51, 52, 53, 54 };
> +static const int en7581_pon_tod_1pps_pins[] =3D { 46 };
> +static const int en7581_gsw_tod_1pps_pins[] =3D { 46 };
> +static const int en7581_sipo_pins[] =3D { 16, 17 };
> +static const int en7581_sipo_rclk_pins[] =3D { 16, 17, 43 };
> +static const int en7581_mdio_pins[] =3D { 14, 15 };
> +static const int en7581_uart2_pins[] =3D { 48, 55 };
> +static const int en7581_uart2_cts_rts_pins[] =3D { 46, 47 };
> +static const int en7581_hsuart_pins[] =3D { 28, 29 };
> +static const int en7581_hsuart_cts_rts_pins[] =3D { 26, 27 };
> +static const int en7581_uart4_pins[] =3D { 38, 39 };
> +static const int en7581_uart5_pins[] =3D { 18, 19 };
> +static const int en7581_i2c0_pins[] =3D { 2, 3 };
> +static const int en7581_i2c1_pins[] =3D { 14, 15 };
> +static const int en7581_jtag_udi_pins[] =3D { 16, 17, 18, 19, 20 };
> +static const int en7581_jtag_dfd_pins[] =3D { 16, 17, 18, 19, 20 };
> +static const int en7581_i2s_pins[] =3D { 26, 27, 28, 29 };
> +static const int en7581_pcm1_pins[] =3D { 22, 23, 24, 25 };
> +static const int en7581_pcm2_pins[] =3D { 18, 19, 20, 21 };
> +static const int en7581_spi_quad_pins[] =3D { 32, 33 };
> +static const int en7581_spi_pins[] =3D { 4, 5, 6, 7 };
> +static const int en7581_spi_cs1_pins[] =3D { 34 };
> +static const int en7581_pcm_spi_pins[] =3D { 18, 19, 20, 21, 22, 23, 24,=
 25 };
> +static const int en7581_pcm_spi_int_pins[] =3D { 14 };
> +static const int en7581_pcm_spi_rst_pins[] =3D { 15 };
> +static const int en7581_pcm_spi_cs1_pins[] =3D { 43 };
> +static const int en7581_pcm_spi_cs2_pins[] =3D { 40 };
> +static const int en7581_pcm_spi_cs2_p128_pins[] =3D { 40 };
> +static const int en7581_pcm_spi_cs2_p156_pins[] =3D { 40 };
> +static const int en7581_pcm_spi_cs3_pins[] =3D { 41 };
> +static const int en7581_pcm_spi_cs4_pins[] =3D { 42 };
> +static const int en7581_emmc_pins[] =3D { 4, 5, 6, 30, 31, 32, 33, 34, 3=
5, 36, 37 };
> +static const int en7581_pnand_pins[] =3D { 4, 5, 6, 7, 30, 31, 32, 33, 3=
4, 35, 36, 37, 38, 39, 40, 41, 42 };
> +static const int en7581_gpio0_pins[] =3D { 13 };
> +static const int en7581_gpio1_pins[] =3D { 14 };
> +static const int en7581_gpio2_pins[] =3D { 15 };
> +static const int en7581_gpio3_pins[] =3D { 16 };
> +static const int en7581_gpio4_pins[] =3D { 17 };
> +static const int en7581_gpio5_pins[] =3D { 18 };
> +static const int en7581_gpio6_pins[] =3D { 19 };
> +static const int en7581_gpio7_pins[] =3D { 20 };
> +static const int en7581_gpio8_pins[] =3D { 21 };
> +static const int en7581_gpio9_pins[] =3D { 22 };
> +static const int en7581_gpio10_pins[] =3D { 23 };
> +static const int en7581_gpio11_pins[] =3D { 24 };
> +static const int en7581_gpio12_pins[] =3D { 25 };
> +static const int en7581_gpio13_pins[] =3D { 26 };
> +static const int en7581_gpio14_pins[] =3D { 27 };
> +static const int en7581_gpio15_pins[] =3D { 28 };
> +static const int en7581_gpio16_pins[] =3D { 29 };
> +static const int en7581_gpio17_pins[] =3D { 30 };
> +static const int en7581_gpio18_pins[] =3D { 31 };
> +static const int en7581_gpio19_pins[] =3D { 32 };
> +static const int en7581_gpio20_pins[] =3D { 33 };
> +static const int en7581_gpio21_pins[] =3D { 34 };
> +static const int en7581_gpio22_pins[] =3D { 35 };
> +static const int en7581_gpio23_pins[] =3D { 36 };
> +static const int en7581_gpio24_pins[] =3D { 37 };
> +static const int en7581_gpio25_pins[] =3D { 38 };
> +static const int en7581_gpio26_pins[] =3D { 39 };
> +static const int en7581_gpio27_pins[] =3D { 40 };
> +static const int en7581_gpio28_pins[] =3D { 41 };
> +static const int en7581_gpio29_pins[] =3D { 42 };
> +static const int en7581_gpio30_pins[] =3D { 43 };
> +static const int en7581_gpio31_pins[] =3D { 44 };
> +static const int en7581_gpio33_pins[] =3D { 46 };
> +static const int en7581_gpio34_pins[] =3D { 47 };
> +static const int en7581_gpio35_pins[] =3D { 48 };
> +static const int en7581_gpio36_pins[] =3D { 49 };
> +static const int en7581_gpio37_pins[] =3D { 50 };
> +static const int en7581_gpio38_pins[] =3D { 51 };
> +static const int en7581_gpio39_pins[] =3D { 52 };
> +static const int en7581_gpio40_pins[] =3D { 53 };
> +static const int en7581_gpio41_pins[] =3D { 54 };
> +static const int en7581_gpio42_pins[] =3D { 55 };
> +static const int en7581_gpio43_pins[] =3D { 56 };
> +static const int en7581_gpio44_pins[] =3D { 57 };
> +static const int en7581_gpio45_pins[] =3D { 58 };
> +static const int en7581_gpio46_pins[] =3D { 59 };
> +static const int en7581_pcie_reset0_pins[] =3D { 61 };
> +static const int en7581_pcie_reset1_pins[] =3D { 62 };
> +static const int en7581_pcie_reset2_pins[] =3D { 63 };
> +
> +static const struct pingroup en7581_pinctrl_groups[] =3D {
> +	PINCTRL_PIN_GROUP("pon", en7581_pon),
> +	PINCTRL_PIN_GROUP("pon_tod_1pps", en7581_pon_tod_1pps),
> +	PINCTRL_PIN_GROUP("gsw_tod_1pps", en7581_gsw_tod_1pps),
> +	PINCTRL_PIN_GROUP("sipo", en7581_sipo),
> +	PINCTRL_PIN_GROUP("sipo_rclk", en7581_sipo_rclk),
> +	PINCTRL_PIN_GROUP("mdio", en7581_mdio),
> +	PINCTRL_PIN_GROUP("uart2", en7581_uart2),
> +	PINCTRL_PIN_GROUP("uart2_cts_rts", en7581_uart2_cts_rts),
> +	PINCTRL_PIN_GROUP("hsuart", en7581_hsuart),
> +	PINCTRL_PIN_GROUP("hsuart_cts_rts", en7581_hsuart_cts_rts),
> +	PINCTRL_PIN_GROUP("uart4", en7581_uart4),
> +	PINCTRL_PIN_GROUP("uart5", en7581_uart5),
> +	PINCTRL_PIN_GROUP("i2c0", en7581_i2c0),
> +	PINCTRL_PIN_GROUP("i2c1", en7581_i2c1),
> +	PINCTRL_PIN_GROUP("jtag_udi", en7581_jtag_udi),
> +	PINCTRL_PIN_GROUP("jtag_dfd", en7581_jtag_dfd),
> +	PINCTRL_PIN_GROUP("i2s", en7581_i2s),
> +	PINCTRL_PIN_GROUP("pcm1", en7581_pcm1),
> +	PINCTRL_PIN_GROUP("pcm2", en7581_pcm2),
> +	PINCTRL_PIN_GROUP("spi", en7581_spi),
> +	PINCTRL_PIN_GROUP("spi_quad", en7581_spi_quad),
> +	PINCTRL_PIN_GROUP("spi_cs1", en7581_spi_cs1),
> +	PINCTRL_PIN_GROUP("pcm_spi", en7581_pcm_spi),
> +	PINCTRL_PIN_GROUP("pcm_spi_int", en7581_pcm_spi_int),
> +	PINCTRL_PIN_GROUP("pcm_spi_rst", en7581_pcm_spi_rst),
> +	PINCTRL_PIN_GROUP("pcm_spi_cs1", en7581_pcm_spi_cs1),
> +	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", en7581_pcm_spi_cs2_p128),
> +	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", en7581_pcm_spi_cs2_p156),
> +	PINCTRL_PIN_GROUP("pcm_spi_cs2", en7581_pcm_spi_cs2),
> +	PINCTRL_PIN_GROUP("pcm_spi_cs3", en7581_pcm_spi_cs3),
> +	PINCTRL_PIN_GROUP("pcm_spi_cs4", en7581_pcm_spi_cs4),
> +	PINCTRL_PIN_GROUP("emmc", en7581_emmc),
> +	PINCTRL_PIN_GROUP("pnand", en7581_pnand),
> +	PINCTRL_PIN_GROUP("gpio0", en7581_gpio0),
> +	PINCTRL_PIN_GROUP("gpio1", en7581_gpio1),
> +	PINCTRL_PIN_GROUP("gpio2", en7581_gpio2),
> +	PINCTRL_PIN_GROUP("gpio3", en7581_gpio3),
> +	PINCTRL_PIN_GROUP("gpio4", en7581_gpio4),
> +	PINCTRL_PIN_GROUP("gpio5", en7581_gpio5),
> +	PINCTRL_PIN_GROUP("gpio6", en7581_gpio6),
> +	PINCTRL_PIN_GROUP("gpio7", en7581_gpio7),
> +	PINCTRL_PIN_GROUP("gpio8", en7581_gpio8),
> +	PINCTRL_PIN_GROUP("gpio9", en7581_gpio9),
> +	PINCTRL_PIN_GROUP("gpio10", en7581_gpio10),
> +	PINCTRL_PIN_GROUP("gpio11", en7581_gpio11),
> +	PINCTRL_PIN_GROUP("gpio12", en7581_gpio12),
> +	PINCTRL_PIN_GROUP("gpio13", en7581_gpio13),
> +	PINCTRL_PIN_GROUP("gpio14", en7581_gpio14),
> +	PINCTRL_PIN_GROUP("gpio15", en7581_gpio15),
> +	PINCTRL_PIN_GROUP("gpio16", en7581_gpio16),
> +	PINCTRL_PIN_GROUP("gpio17", en7581_gpio17),
> +	PINCTRL_PIN_GROUP("gpio18", en7581_gpio18),
> +	PINCTRL_PIN_GROUP("gpio19", en7581_gpio19),
> +	PINCTRL_PIN_GROUP("gpio20", en7581_gpio20),
> +	PINCTRL_PIN_GROUP("gpio21", en7581_gpio21),
> +	PINCTRL_PIN_GROUP("gpio22", en7581_gpio22),
> +	PINCTRL_PIN_GROUP("gpio23", en7581_gpio23),
> +	PINCTRL_PIN_GROUP("gpio24", en7581_gpio24),
> +	PINCTRL_PIN_GROUP("gpio25", en7581_gpio25),
> +	PINCTRL_PIN_GROUP("gpio26", en7581_gpio26),
> +	PINCTRL_PIN_GROUP("gpio27", en7581_gpio27),
> +	PINCTRL_PIN_GROUP("gpio28", en7581_gpio28),
> +	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
> +	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
> +	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
> +	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
> +	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
> +	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
> +	PINCTRL_PIN_GROUP("gpio36", en7581_gpio36),
> +	PINCTRL_PIN_GROUP("gpio37", en7581_gpio37),
> +	PINCTRL_PIN_GROUP("gpio38", en7581_gpio38),
> +	PINCTRL_PIN_GROUP("gpio39", en7581_gpio39),
> +	PINCTRL_PIN_GROUP("gpio40", en7581_gpio40),
> +	PINCTRL_PIN_GROUP("gpio41", en7581_gpio41),
> +	PINCTRL_PIN_GROUP("gpio42", en7581_gpio42),
> +	PINCTRL_PIN_GROUP("gpio43", en7581_gpio43),
> +	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
> +	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
> +	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
> +	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
> +	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
> +	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
>  };
> =20
>  static const char *const pon_groups[] =3D { "pon" };
> @@ -1957,33 +1987,33 @@ static const struct airoha_pinctrl_func_group phy=
4_led1_func_group[] =3D {
>  	},
>  };
> =20
> -static const struct airoha_pinctrl_func airoha_pinctrl_funcs[] =3D {
> -	PINCTRL_FUNC_DESC(pon),
> -	PINCTRL_FUNC_DESC(tod_1pps),
> -	PINCTRL_FUNC_DESC(sipo),
> -	PINCTRL_FUNC_DESC(mdio),
> -	PINCTRL_FUNC_DESC(uart),
> -	PINCTRL_FUNC_DESC(i2c),
> -	PINCTRL_FUNC_DESC(jtag),
> -	PINCTRL_FUNC_DESC(pcm),
> -	PINCTRL_FUNC_DESC(spi),
> -	PINCTRL_FUNC_DESC(pcm_spi),
> -	PINCTRL_FUNC_DESC(i2s),
> -	PINCTRL_FUNC_DESC(emmc),
> -	PINCTRL_FUNC_DESC(pnand),
> -	PINCTRL_FUNC_DESC(pcie_reset),
> -	PINCTRL_FUNC_DESC(pwm),
> -	PINCTRL_FUNC_DESC(phy1_led0),
> -	PINCTRL_FUNC_DESC(phy2_led0),
> -	PINCTRL_FUNC_DESC(phy3_led0),
> -	PINCTRL_FUNC_DESC(phy4_led0),
> -	PINCTRL_FUNC_DESC(phy1_led1),
> -	PINCTRL_FUNC_DESC(phy2_led1),
> -	PINCTRL_FUNC_DESC(phy3_led1),
> -	PINCTRL_FUNC_DESC(phy4_led1),
> +static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] =3D {
> +	PINCTRL_FUNC_DESC("pon", pon),
> +	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
> +	PINCTRL_FUNC_DESC("sipo", sipo),
> +	PINCTRL_FUNC_DESC("mdio", mdio),
> +	PINCTRL_FUNC_DESC("uart", uart),
> +	PINCTRL_FUNC_DESC("i2c", i2c),
> +	PINCTRL_FUNC_DESC("jtag", jtag),
> +	PINCTRL_FUNC_DESC("pcm", pcm),
> +	PINCTRL_FUNC_DESC("spi", spi),
> +	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
> +	PINCTRL_FUNC_DESC("i2s", i2s),
> +	PINCTRL_FUNC_DESC("emmc", emmc),
> +	PINCTRL_FUNC_DESC("pnand", pnand),
> +	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
> +	PINCTRL_FUNC_DESC("pwm", pwm),
> +	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
> +	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
> +	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
> +	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
> +	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
> +	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
> +	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
> +	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
>  };
> =20
> -static const struct airoha_pinctrl_conf airoha_pinctrl_pullup_conf[] =3D=
 {
> +static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] =3D=
 {
>  	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
>  	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
>  	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
> @@ -2044,7 +2074,7 @@ static const struct airoha_pinctrl_conf airoha_pinc=
trl_pullup_conf[] =3D {
>  	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
>  };
> =20
> -static const struct airoha_pinctrl_conf airoha_pinctrl_pulldown_conf[] =
=3D {
> +static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] =
=3D {
>  	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
>  	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
>  	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
> @@ -2105,7 +2135,7 @@ static const struct airoha_pinctrl_conf airoha_pinc=
trl_pulldown_conf[] =3D {
>  	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
>  };
> =20
> -static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e2_conf[] =
=3D {
> +static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] =
=3D {
>  	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
>  	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
>  	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
> @@ -2166,7 +2196,7 @@ static const struct airoha_pinctrl_conf airoha_pinc=
trl_drive_e2_conf[] =3D {
>  	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
>  };
> =20
> -static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e4_conf[] =
=3D {
> +static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] =
=3D {
>  	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
>  	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
>  	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
> @@ -2227,7 +2257,7 @@ static const struct airoha_pinctrl_conf airoha_pinc=
trl_drive_e4_conf[] =3D {
>  	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
>  };
> =20
> -static const struct airoha_pinctrl_conf airoha_pinctrl_pcie_rst_od_conf[=
] =3D {
> +static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[=
] =3D {
>  	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
>  	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
>  	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
> @@ -2548,12 +2578,17 @@ airoha_pinctrl_get_conf_reg(const struct airoha_p=
inctrl_conf *conf,
>  }
> =20
>  static int airoha_pinctrl_get_conf(struct airoha_pinctrl *pinctrl,
> -				   const struct airoha_pinctrl_conf *conf,
> -				   int conf_size, int pin, u32 *val)
> +				   enum airoha_pinctrl_confs_type conf_type,
> +				   int pin, u32 *val)
>  {
> +	const struct airoha_pinctrl_confs_info *confs_info;
>  	const struct airoha_pinctrl_reg *reg;
> =20
> -	reg =3D airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
> +	confs_info =3D &pinctrl->confs_info[conf_type];
> +
> +	reg =3D airoha_pinctrl_get_conf_reg(confs_info->confs,
> +					  confs_info->num_confs,
> +					  pin);
>  	if (!reg)
>  		return -EINVAL;
> =20
> @@ -2566,12 +2601,17 @@ static int airoha_pinctrl_get_conf(struct airoha_=
pinctrl *pinctrl,
>  }
> =20
>  static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
> -				   const struct airoha_pinctrl_conf *conf,
> -				   int conf_size, int pin, u32 val)
> +				   enum airoha_pinctrl_confs_type conf_type,
> +				   int pin, u32 val)
>  {
> +	const struct airoha_pinctrl_confs_info *confs_info;
>  	const struct airoha_pinctrl_reg *reg =3D NULL;
> =20
> -	reg =3D airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
> +	confs_info =3D &pinctrl->confs_info[conf_type];
> +
> +	reg =3D airoha_pinctrl_get_conf_reg(confs_info->confs,
> +					  confs_info->num_confs,
> +					  pin);
>  	if (!reg)
>  		return -EINVAL;
> =20
> @@ -2584,44 +2624,34 @@ static int airoha_pinctrl_set_conf(struct airoha_=
pinctrl *pinctrl,
>  }
> =20
>  #define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pullup_conf,		\
> -				ARRAY_SIZE(airoha_pinctrl_pullup_conf),		\
> +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
>  				(pin), (val))
>  #define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pulldown_conf,	\
> -				ARRAY_SIZE(airoha_pinctrl_pulldown_conf),	\
> +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
>  				(pin), (val))
>  #define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_drive_e2_conf,	\
> -				ARRAY_SIZE(airoha_pinctrl_drive_e2_conf),	\
> +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
>  				(pin), (val))
>  #define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_drive_e4_conf,	\
> -				ARRAY_SIZE(airoha_pinctrl_drive_e4_conf),	\
> +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
>  				(pin), (val))
>  #define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pcie_rst_od_conf,	\
> -				ARRAY_SIZE(airoha_pinctrl_pcie_rst_od_conf),	\
> +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
>  				(pin), (val))
>  #define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pullup_conf,		\
> -				ARRAY_SIZE(airoha_pinctrl_pullup_conf),		\
> +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
>  				(pin), (val))
>  #define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pulldown_conf,	\
> -				ARRAY_SIZE(airoha_pinctrl_pulldown_conf),	\
> +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
>  				(pin), (val))
>  #define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_drive_e2_conf,	\
> -				ARRAY_SIZE(airoha_pinctrl_drive_e2_conf),	\
> +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
>  				(pin), (val))
>  #define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_drive_e4_conf,	\
> -				ARRAY_SIZE(airoha_pinctrl_drive_e4_conf),	\
> +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
>  				(pin), (val))
>  #define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
> -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pcie_rst_od_conf,	\
> -				ARRAY_SIZE(airoha_pinctrl_pcie_rst_od_conf),	\
> +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
>  				(pin), (val))
> =20
>  static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u=
32 p)
> @@ -2798,12 +2828,13 @@ static int airoha_pinconf_set(struct pinctrl_dev =
*pctrl_dev,
>  static int airoha_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
>  				    unsigned int group, unsigned long *config)
>  {
> +	struct airoha_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctrl_dev);
>  	u32 cur_config =3D 0;
>  	int i;
> =20
> -	for (i =3D 0; i < airoha_pinctrl_groups[group].npins; i++) {
> +	for (i =3D 0; i < pinctrl->grps[group].npins; i++) {
>  		if (airoha_pinconf_get(pctrl_dev,
> -				       airoha_pinctrl_groups[group].pins[i],
> +				       pinctrl->grps[group].pins[i],
>  				       config))
>  			return -EOPNOTSUPP;
> =20
> @@ -2820,13 +2851,14 @@ static int airoha_pinconf_group_set(struct pinctr=
l_dev *pctrl_dev,
>  				    unsigned int group, unsigned long *configs,
>  				    unsigned int num_configs)
>  {
> +	struct airoha_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctrl_dev);
>  	int i;
> =20
> -	for (i =3D 0; i < airoha_pinctrl_groups[group].npins; i++) {
> +	for (i =3D 0; i < pinctrl->grps[group].npins; i++) {
>  		int err;
> =20
>  		err =3D airoha_pinconf_set(pctrl_dev,
> -					 airoha_pinctrl_groups[group].pins[i],
> +					 pinctrl->grps[group].pins[i],
>  					 configs, num_configs);
>  		if (err)
>  			return err;
> @@ -2852,23 +2884,16 @@ static const struct pinctrl_ops airoha_pctlops =
=3D {
>  	.dt_free_map =3D pinconf_generic_dt_free_map,
>  };
> =20
> -static struct pinctrl_desc airoha_pinctrl_desc =3D {
> -	.name =3D KBUILD_MODNAME,
> -	.owner =3D THIS_MODULE,
> -	.pctlops =3D &airoha_pctlops,
> -	.pmxops =3D &airoha_pmxops,
> -	.confops =3D &airoha_confops,
> -	.pins =3D airoha_pinctrl_pins,
> -	.npins =3D ARRAY_SIZE(airoha_pinctrl_pins),
> -};
> -
>  static int airoha_pinctrl_probe(struct platform_device *pdev)
>  {
> +	const struct airoha_pinctrl_match_data *data;
>  	struct device *dev =3D &pdev->dev;
>  	struct airoha_pinctrl *pinctrl;
>  	struct regmap *map;
>  	int err, i;
> =20
> +	data =3D device_get_match_data(dev);
> +
>  	pinctrl =3D devm_kzalloc(dev, sizeof(*pinctrl), GFP_KERNEL);
>  	if (!pinctrl)
>  		return -ENOMEM;
> @@ -2883,14 +2908,23 @@ static int airoha_pinctrl_probe(struct platform_d=
evice *pdev)
> =20
>  	pinctrl->chip_scu =3D map;
> =20
> -	err =3D devm_pinctrl_register_and_init(dev, &airoha_pinctrl_desc,
> +	/* Init pinctrl desc struct */
> +	pinctrl->desc.name =3D KBUILD_MODNAME;
> +	pinctrl->desc.owner =3D THIS_MODULE,
> +	pinctrl->desc.pctlops =3D &airoha_pctlops,
> +	pinctrl->desc.pmxops =3D &airoha_pmxops,
> +	pinctrl->desc.confops =3D &airoha_confops,
> +	pinctrl->desc.pins =3D data->pins,
> +	pinctrl->desc.npins =3D data->num_pins,
> +
> +	err =3D devm_pinctrl_register_and_init(dev, &pinctrl->desc,
>  					     pinctrl, &pinctrl->ctrl);
>  	if (err)
>  		return err;
> =20
>  	/* build pin groups */
> -	for (i =3D 0; i < ARRAY_SIZE(airoha_pinctrl_groups); i++) {
> -		const struct pingroup *grp =3D &airoha_pinctrl_groups[i];
> +	for (i =3D 0; i < data->num_grps; i++) {
> +		const struct pingroup *grp =3D &data->grps[i];
> =20
>  		err =3D pinctrl_generic_add_group(pinctrl->ctrl, grp->name,
>  						grp->pins, grp->npins,
> @@ -2903,10 +2937,10 @@ static int airoha_pinctrl_probe(struct platform_d=
evice *pdev)
>  	}
> =20
>  	/* build functions */
> -	for (i =3D 0; i < ARRAY_SIZE(airoha_pinctrl_funcs); i++) {
> +	for (i =3D 0; i < data->num_funcs; i++) {
>  		const struct airoha_pinctrl_func *func;
> =20
> -		func =3D &airoha_pinctrl_funcs[i];
> +		func =3D &data->funcs[i];
>  		err =3D pinmux_generic_add_function(pinctrl->ctrl,
>  						  func->desc.func.name,
>  						  func->desc.func.groups,
> @@ -2919,6 +2953,10 @@ static int airoha_pinctrl_probe(struct platform_de=
vice *pdev)
>  		}
>  	}
> =20
> +	pinctrl->grps =3D data->grps;
> +	pinctrl->funcs =3D data->funcs;
> +	pinctrl->confs_info =3D data->confs_info;

I guess we can just use a airoha_pinctrl_match_data pointer here.

> +
>  	err =3D pinctrl_enable(pinctrl->ctrl);
>  	if (err)
>  		return err;
> @@ -2927,8 +2965,39 @@ static int airoha_pinctrl_probe(struct platform_de=
vice *pdev)
>  	return airoha_pinctrl_add_gpiochip(pinctrl, pdev);
>  }
> =20
> +static const struct airoha_pinctrl_match_data en7581_pinctrl_match_data =
=3D {
> +	.pins =3D en7581_pinctrl_pins,
> +	.num_pins =3D ARRAY_SIZE(en7581_pinctrl_pins),
> +	.grps =3D en7581_pinctrl_groups,
> +	.num_grps =3D ARRAY_SIZE(en7581_pinctrl_groups),
> +	.funcs =3D en7581_pinctrl_funcs,
> +	.num_funcs =3D ARRAY_SIZE(en7581_pinctrl_funcs),
> +	.confs_info =3D {
> +		[AIROHA_PINCTRL_CONFS_PULLUP] =3D {
> +			.confs =3D en7581_pinctrl_pullup_conf,
> +			.num_confs =3D ARRAY_SIZE(en7581_pinctrl_pullup_conf),
> +		},
> +		[AIROHA_PINCTRL_CONFS_PULLDOWN] =3D {
> +			.confs =3D en7581_pinctrl_pulldown_conf,
> +			.num_confs =3D ARRAY_SIZE(en7581_pinctrl_pulldown_conf),
> +		},
> +		[AIROHA_PINCTRL_CONFS_DRIVE_E2] =3D {
> +			.confs =3D en7581_pinctrl_drive_e2_conf,
> +			.num_confs =3D ARRAY_SIZE(en7581_pinctrl_drive_e2_conf),
> +		},
> +		[AIROHA_PINCTRL_CONFS_DRIVE_E4] =3D {
> +			.confs =3D en7581_pinctrl_drive_e4_conf,
> +			.num_confs =3D ARRAY_SIZE(en7581_pinctrl_drive_e4_conf),
> +		},
> +		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] =3D {
> +			.confs =3D en7581_pinctrl_pcie_rst_od_conf,
> +			.num_confs =3D ARRAY_SIZE(en7581_pinctrl_pcie_rst_od_conf),
> +		},
> +	},
> +};
> +
>  static const struct of_device_id airoha_pinctrl_of_match[] =3D {
> -	{ .compatible =3D "airoha,en7581-pinctrl" },
> +	{ .compatible =3D "airoha,en7581-pinctrl", .data =3D &en7581_pinctrl_ma=
tch_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
> --=20
> 2.48.1
>=20

--nqxKMu4BAXZxRr1I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaDbESQAKCRA6cBh0uS2t
rJLuAQCM0gHbHgsLE4uvFU6Yb6k7NCF1SNNA3JBIQFGbSBV1hwD+PZ+WCpsBVIA1
2b37ld3MQuGvCK3dOQShg69YU3PuvAM=
=KPIf
-----END PGP SIGNATURE-----

--nqxKMu4BAXZxRr1I--

