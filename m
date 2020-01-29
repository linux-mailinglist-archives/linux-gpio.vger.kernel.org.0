Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC5114CBDD
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 14:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgA2NxP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 08:53:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:39322 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbgA2NxP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jan 2020 08:53:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 85AC3AD3A;
        Wed, 29 Jan 2020 13:53:13 +0000 (UTC)
Message-ID: <e4c0ba6eb4b3282c5b2c08f9bd11b1bf109b646b.camel@suse.de>
Subject: Re: [RFC PATCH 4/4] ARM: dts: bcm2711-rpi-4-b: Add SoC GPIO labels
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
Date:   Wed, 29 Jan 2020 14:53:12 +0100
In-Reply-To: <1580148908-4863-5-git-send-email-stefan.wahren@i2se.com>
References: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
         <1580148908-4863-5-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-W7Z0xkNoSi4WzK5KufDN"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-W7Z0xkNoSi4WzK5KufDN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-01-27 at 19:15 +0100, Stefan Wahren wrote:
> This adds the labels for all the SoC GPIOs on the Raspberry Pi 4.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 74
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> index 1b5a835..6607e2e 100644
> --- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
> @@ -71,6 +71,80 @@
>  	};
>  };
> =20
> +&gpio {
> +	/*
> +	 * Parts taken from rpi_SCH_4b_4p0_reduced.pdf and
> +	 * the official GPU firmware DT blob.
> +	 *
> +	 * Legend:
> +	 * "NC" =3D not connected (no rail from the SoC)

May be drop this from the legend, as it's not used.

> +	 * "FOO" =3D GPIO line named "FOO" on the schematic
> +	 * "FOO_N" =3D GPIO line named "FOO" on schematic, active low
> +	 */
> +	gpio-line-names =3D "ID_SDA",
> +			  "ID_SCL",
> +			  "SDA1",
> +			  "SCL1",
> +			  "GPIO_GCLK",
> +			  "GPIO5",
> +			  "GPIO6",
> +			  "SPI_CE1_N",
> +			  "SPI_CE0_N",
> +			  "SPI_MISO",
> +			  "SPI_MOSI",
> +			  "SPI_SCLK",
> +			  "GPIO12",
> +			  "GPIO13",
> +			  /* Serial port */
> +			  "TXD1",
> +			  "RXD1",
> +			  "GPIO16",
> +			  "GPIO17",
> +			  "GPIO18",
> +			  "GPIO19",
> +			  "GPIO20",
> +			  "GPIO21",
> +			  "GPIO22",
> +			  "GPIO23",
> +			  "GPIO24",
> +			  "GPIO25",
> +			  "GPIO26",
> +			  "GPIO27",
> +			  "RGMII_MDIO",
> +			  "RGMIO_MDC",
> +			  /* Used by BT module */
> +			  "CTS0",
> +			  "RTS0",
> +			  "TXD0",
> +			  "RXD0",
> +			  /* Used by Wifi */
> +			  "SD1_CLK",
> +			  "SD1_CMD",
> +			  "SD1_DATA0",
> +			  "SD1_DATA1",
> +			  "SD1_DATA2",
> +			  "SD1_DATA3",
> +			  /* Shared with SPI flash */
> +			  "PWM0_MISO",
> +			  "PWM1_MOSI",
> +			  "STATUS_LED_G_CLK",
> +			  "SPIFLASH_CE_N",
> +			  "SDA0",
> +			  "SCL0",
> +			  "RGMII_RXCLK",
> +			  "RGMII_RXCTL",
> +			  "RGMII_RXD0",
> +			  "RGMII_RXD1",
> +			  "RGMII_RXD2",
> +			  "RGMII_RXD3",
> +			  "RGMII_TXCLK",
> +			  "RGMII_TXCTL",
> +			  "RGMII_TXD0",
> +			  "RGMII_TXD1",
> +			  "RGMII_TXD2",
> +			  "RGMII_TXD3";
> +};
> +
>  &pwm1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pwm1_0_gpio40 &pwm1_1_gpio41>;


--=-W7Z0xkNoSi4WzK5KufDN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl4xjkgACgkQlfZmHno8
x/4RxAf+Po8dJxuJatdJG3Apbg1cwwn5IV+bD4rK9TBFtotXR+sCSId44VQV5SqA
G/8uB2Qu8U7HgAE/60TOUBBIRlyHFoLPthhrgC4Y9KWj7F3rWPbUfg878XHhk8Fg
64XJ9WD2UZ3d9lqfmPmnzjm0+Fj+Frk8bPZHTwUKrmIe6l0wD+DfCtBeN3yToSnh
4/g1FfzwueRY92Rtz2vDWl+jHxU0IiRC5LUbOOS1EdKS7XefAyjpetc0Yf19Qmsv
VbNRa0Kqh60aqWjZ5KLSkxf/nRDDddexhmDzmtfmjUhZ7pnzbR4uBcCteOWuUrpm
2DoNaiKIiNNRgmNbzwAC9dqg8tfe4Q==
=9DtJ
-----END PGP SIGNATURE-----

--=-W7Z0xkNoSi4WzK5KufDN--

