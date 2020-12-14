Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BA42D9A6F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 15:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408263AbgLNO6b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 09:58:31 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:47335 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407990AbgLNO6W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 09:58:22 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id E6D0F580533;
        Mon, 14 Dec 2020 09:57:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 14 Dec 2020 09:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=0ZB+MYc697z9Gr7d2qx+FdVrJqV
        GCWKQWbOHMlewf74=; b=lWrDVSzB0h30zFeZmGTkGel6GifvyuHDyrQtNfAu53d
        jujuuIeaywRyeNfog1b08d4W8LNJ16/yTzSiTThhJA3XV5glhlkDMXQzBgY4byf7
        N1SDqhidokk4NXbc4h8D5BeGphFd0J/scYe1LUjpfMAm9Qi6yaHEIMR9nL+vPQ+t
        06V8gUj5XW3c9q4I+P2dqeITkej43Gzq9pldkJPPPfMBwLby9+oaVYX/mkjC2F2v
        yjS/BOuuO8M5w3HNZ/DEo7AXXrlBVhGN+7OIr/+PQ78os1q45hQsobuRsxFQ/m1g
        FPjuGekN0rfyHkOsB2OCHBFqjKiSzZUVeltHEQ8xUKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0ZB+MY
        c697z9Gr7d2qx+FdVrJqVGCWKQWbOHMlewf74=; b=i7Ch/3lnwWpfprI2UGf7Qr
        k5ska+E1Owv2uLG6o/R8rJS2VSBEj++PN/nBHNgmKF/3+N928FHqpEzUeZbiyA5T
        GXxT+tp59TaalVO23z0LS81KTyAIAcp/UsGntJp4SV+Ne5aYiEJSXSBATFebA2sD
        QTr84pe7HCDIFjXm7pF2qcQ71ao8n015H9BAt7YKHV/ho7fHBvKbBzLE3d5k8AVP
        zV8Xl3t3MQOLUcPVw0HLgj5bvWDTH2g2JnyyCCiCeUFhBX5DyfuxB2nJYYsRum7H
        xiXKxijMzF7Nhk21CrxtEa4kRfuV6+4f+R7fXutrRHKWzBV4MLuqNmd+fDJNI5gg
        ==
X-ME-Sender: <xms:W33XX5CNGI3_QqMc6_NHC_rVohVc0zHNW4vrsL2DFnAx0Z96id7TeQ>
    <xme:W33XX1GCp242Vq8yGO0xYz0B73ijw5RZfxvj3OcOo1VV672yXKec_ZGGodsYDI8ry
    0aVC0JvQHnYUxc6q8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:W33XX7CwwovZ3fHmiOwLGNnf7iw6gflRMk0fwrWQ49tsO0_203PjuA>
    <xmx:W33XX1UvmDYPTuJmok8rQRiEE8RnF7pb23JXXkt_7wcdpmFFMp6Izw>
    <xmx:W33XX_rk-6MhvreQQIu9cnIbBB6ieFmB-rTbResSUe137YVZm8J2Hw>
    <xmx:XX3XX35Q9cAKbbyaCqS1vvNFWtJOGiEt3D07EorfaVaPCKoqVFQ9Og>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7245C24005E;
        Mon, 14 Dec 2020 09:57:31 -0500 (EST)
Date:   Mon, 14 Dec 2020 15:57:30 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/4] clk: sunxi-ng: h6-r: Add R_APB2_RSB clock and reset
Message-ID: <20201214145730.iz3tc4nasqwq6tym@gilmour>
References: <20201213235506.25201-1-samuel@sholland.org>
 <20201213235506.25201-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ulu7semfirp4jzzp"
Content-Disposition: inline
In-Reply-To: <20201213235506.25201-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ulu7semfirp4jzzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Sun, Dec 13, 2020 at 05:55:03PM -0600, Samuel Holland wrote:
> While no information about the H6 RSB controller is included in the
> datasheet or manual, the vendor BSP and power management blob both
> reference the RSB clock parent and register address. These values were
> verified by experimentation.
>=20
> Since this clock/reset are added late, the specifier is added at the end
> to maintain the existing DT binding. The code is kept in register order.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c      | 5 +++++
>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h      | 2 +-
>  include/dt-bindings/clock/sun50i-h6-r-ccu.h | 1 +
>  include/dt-bindings/reset/sun50i-h6-r-ccu.h | 1 +
>  4 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h6-r.c
> index 50f8d1bc7046..56e351b513f3 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
> @@ -91,6 +91,8 @@ static SUNXI_CCU_GATE(r_apb2_uart_clk,	"r-apb2-uart",	"=
r-apb2",
>  		      0x18c, BIT(0), 0);
>  static SUNXI_CCU_GATE(r_apb2_i2c_clk,	"r-apb2-i2c",	"r-apb2",
>  		      0x19c, BIT(0), 0);
> +static SUNXI_CCU_GATE(r_apb2_rsb_clk,	"r-apb2-rsb",	"r-apb2",
> +		      0x1bc, BIT(0), 0);
>  static SUNXI_CCU_GATE(r_apb1_ir_clk,	"r-apb1-ir",	"r-apb1",
>  		      0x1cc, BIT(0), 0);
>  static SUNXI_CCU_GATE(r_apb1_w1_clk,	"r-apb1-w1",	"r-apb1",
> @@ -130,6 +132,7 @@ static struct ccu_common *sun50i_h6_r_ccu_clks[] =3D {
>  	&r_apb1_pwm_clk.common,
>  	&r_apb2_uart_clk.common,
>  	&r_apb2_i2c_clk.common,
> +	&r_apb2_rsb_clk.common,
>  	&r_apb1_ir_clk.common,
>  	&r_apb1_w1_clk.common,
>  	&ir_clk.common,
> @@ -147,6 +150,7 @@ static struct clk_hw_onecell_data sun50i_h6_r_hw_clks=
 =3D {
>  		[CLK_R_APB1_PWM]	=3D &r_apb1_pwm_clk.common.hw,
>  		[CLK_R_APB2_UART]	=3D &r_apb2_uart_clk.common.hw,
>  		[CLK_R_APB2_I2C]	=3D &r_apb2_i2c_clk.common.hw,
> +		[CLK_R_APB2_RSB]	=3D &r_apb2_rsb_clk.common.hw,
>  		[CLK_R_APB1_IR]		=3D &r_apb1_ir_clk.common.hw,
>  		[CLK_R_APB1_W1]		=3D &r_apb1_w1_clk.common.hw,
>  		[CLK_IR]		=3D &ir_clk.common.hw,
> @@ -161,6 +165,7 @@ static struct ccu_reset_map sun50i_h6_r_ccu_resets[] =
=3D {
>  	[RST_R_APB1_PWM]	=3D  { 0x13c, BIT(16) },
>  	[RST_R_APB2_UART]	=3D  { 0x18c, BIT(16) },
>  	[RST_R_APB2_I2C]	=3D  { 0x19c, BIT(16) },
> +	[RST_R_APB2_RSB]	=3D  { 0x1bc, BIT(16) },
>  	[RST_R_APB1_IR]		=3D  { 0x1cc, BIT(16) },
>  	[RST_R_APB1_W1]		=3D  { 0x1ec, BIT(16) },
>  };
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h b/drivers/clk/sunxi-n=
g/ccu-sun50i-h6-r.h
> index 782117dc0b28..7e290b840803 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
> @@ -14,6 +14,6 @@
> =20
>  #define CLK_R_APB2	3
> =20
> -#define CLK_NUMBER	(CLK_W1 + 1)
> +#define CLK_NUMBER	(CLK_R_APB2_RSB + 1)
> =20
>  #endif /* _CCU_SUN50I_H6_R_H */
> diff --git a/include/dt-bindings/clock/sun50i-h6-r-ccu.h b/include/dt-bin=
dings/clock/sun50i-h6-r-ccu.h
> index 76136132a13e..f46ec03848ca 100644
> --- a/include/dt-bindings/clock/sun50i-h6-r-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
> @@ -15,6 +15,7 @@
>  #define CLK_R_APB1_PWM		6
>  #define CLK_R_APB2_UART		7
>  #define CLK_R_APB2_I2C		8
> +#define CLK_R_APB2_RSB		13
>  #define CLK_R_APB1_IR		9
>  #define CLK_R_APB1_W1		10
> =20
> diff --git a/include/dt-bindings/reset/sun50i-h6-r-ccu.h b/include/dt-bin=
dings/reset/sun50i-h6-r-ccu.h
> index 01c84dba49a4..6fe199a7969d 100644
> --- a/include/dt-bindings/reset/sun50i-h6-r-ccu.h
> +++ b/include/dt-bindings/reset/sun50i-h6-r-ccu.h
> @@ -11,6 +11,7 @@
>  #define RST_R_APB1_PWM		2
>  #define RST_R_APB2_UART		3
>  #define RST_R_APB2_I2C		4
> +#define RST_R_APB2_RSB		7
>  #define RST_R_APB1_IR		5
>  #define RST_R_APB1_W1		6

I think for the clock and reset binding, we'll want to sort by number.
It's fairly easy to miss otherwise and if we end up adding another one
it wouldn't be far fetched to assume the same indices would be used

maxime

--ulu7semfirp4jzzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9d9WQAKCRDj7w1vZxhR
xWBKAQCp2jSd8gSwWD6coghwk+UL4rm8wKU377AUgkyubu0x2QEAlJEPrd2pAioW
ZhRDWi8lIIu5ssVx1ms7JOjgMeQKeg4=
=eX1s
-----END PGP SIGNATURE-----

--ulu7semfirp4jzzp--
