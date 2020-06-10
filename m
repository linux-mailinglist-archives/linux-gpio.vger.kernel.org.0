Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F8C1F4FE1
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 10:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgFJIDh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 04:03:37 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14911 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJIDg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 04:03:36 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee093ab0000>; Wed, 10 Jun 2020 01:02:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 10 Jun 2020 01:03:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 10 Jun 2020 01:03:36 -0700
Received: from localhost (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun 2020 08:03:36
 +0000
Date:   Wed, 10 Jun 2020 10:03:27 +0200
From:   Thierry Reding <treding@nvidia.com>
To:     Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
CC:     <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: Re: GPIO regression on mvebu and/or max310x since 2ab73c6d8323
Message-ID: <20200610080327.GA1805015@ulmo>
References: <8cffce08-ed84-4242-8dcd-72de693f0f71@cesnet.cz>
MIME-Version: 1.0
In-Reply-To: <8cffce08-ed84-4242-8dcd-72de693f0f71@cesnet.cz>
X-NVConfidentiality: public
User-Agent: Mutt/1.13.1 (2019-12-14)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591776171; bh=Qg/AullrEHw/2I43Yznr+DrnueWV7AxaDuxcos3iIxw=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:In-Reply-To:X-NVConfidentiality:User-Agent:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Disposition;
        b=glA/DahkRhUWtnXo9YXSHkHodeiiG9WNT/sXQxaMcqq3PvjVO5ToLI4sjhHNGi3+n
         YsBfMg/UV1+c6LL2vwSAbimkoWFxg3PWdIBCHYxrgWX107M1GFQctooV7kJfoAqeo7
         TV4CXzsjqaOyZ6eWWTIKSEzL0TdEVYYYSJT3/MWa16dVTxF9lO4OPDZOhUE1J7GTzO
         dQ52BqH7khHhe2DXGY/ipATfMu7KNLFNLe5OYVDTVV2sLSt1BzvmzgCKJeWMjteNuW
         IgQe2jwe4VGu5s3eIoXFz9FZYEiwjRTMSpgMEZBBVnTkebxhTSpWIWi4CqyE2/v123
         nwU7yivCcHhFw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 02:39:22AM +0200, Jan Kundr=C3=A1t wrote:
> Hi,
> after upgrading from v5.6.7 to v5.7.1, my bit-banged I2C bus no longer
> works. I've run a bisection and it led me to commit 2ab73c6d8323 (gpio:
> Support GPIO controllers without pin-ranges). If I make
> gpiochip_generic_request() call pinctrl_gpio_request() unconditionally
> again, stuff gets back to working.
>=20
> My HW setup is "unusual" as there's also an analog switch in the path of =
the
> bit-banged bus, and that one is controlled by another GPIO from MAX14830
> (drivers/tty/serial/max310x.c). The I2C bit-banging is driven by a Solidr=
un
> ClearFog Base (mvebu, Armada AM385) pins MPP24 and MPP25 which are
> configured as GPIOs. In terms of a DTS snippet, here's how it looks like:
>=20
>        /* Bit-banged I2C instead of the default UART function from the SoC
> */
>        &uart1_pins {
>                status =3D "disabled";
>        };
>        &uart1 {
>                status =3D "disabled";
>        };
>        gpio_i2c {
>                compatible =3D "i2c-gpio";
>                sda-gpios =3D <&gpio0 25 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRA=
IN)>;
>                scl-gpios =3D <&gpio0 24 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRA=
IN)>;
>                i2c-gpio.delay-us =3D <1>;
>                #address-cells =3D <1>;
>                #size-cells =3D <0>;
>        };
>                /* Analog switch control via a GPIO hog. This drives that
> analog switch
>           so that the signals from the SoC actually reach the I2C slaves =
*/
>        max14830@2 {
>                // ...
>                i2c_bitbang_enable {
>                        gpio-hog;
>                        gpios =3D <7 GPIO_ACTIVE_HIGH>;
>                        output-high;
>                        line-name =3D "I2C bitbang bus";
>                };
>        };
>=20
> This means that for my bit-banged I2C to work, I need both the mvebu's
> gpio+pinctrl and the MAX14830 GPIOs. I hope that the max310x.c path is OK
> (max310x_gpio_direction_output() and friends are being called when kernel
> sets up GPIO hogs). According to some dev_dbg()s in i2c/busses/i2c-gpio.c
> and i2c/algos/i2c-algo-bit.c, the I2C slaves never respond with an ACK. T=
he
> machine is remote so I have not had a chance to attach a logical analyzer
> yet -- but I *think* that the root cause is somewhere in pinconf. When st=
uff
> doesn't work, I get this:
>=20
> # grep -e mpp24 -e mpp25
> /sys/kernel/debug/pinctrl/f1018000.pinctrl/pinconf-groups
> 24 (mpp24): current: ua1(rxd), available =3D [ gpio(io) spi0(miso) ua0(ct=
s)
> sd0(d4) dev(ready) ]
> 25 (mpp25): current: ua1(txd), available =3D [ gpio(io) spi0(cs0) ua0(rts)
> sd0(d5) dev(cs0) ]
>=20
> ...whereas on the old kernel, it looks like this:
>=20
> # grep -e mpp24 -e mpp25
> /sys/kernel/debug/pinctrl/f1018000.pinctrl/pinconf-groups 24 (mpp24):
> current: gpio(io), available =3D [ spi0(miso) ua0(cts) ua1(rxd) sd0(d4)
> dev(ready) ]
> 25 (mpp25): current: gpio(io), available =3D [ spi0(cs0) ua0(rts) ua1(txd)
> sd0(d5) dev(cs0) ]
>=20
> There's also some difference in
> /sys/kernel/debug/pinctrl/f1018000.pinctrl/pinmux-pins says, for example:
>=20
> pin 19 (PIN19): f1072004.mdio (GPIO UNCLAIMED) function gpio group mpp19
>=20
> ...whereas in the old kernel it is:
>=20
> pin 19 (PIN19): f1072004.mdio mvebu-gpio:19 function gpio group mpp19
>=20
> ...and the same for 22, 24, 29, 44, 54, all of these are supposed to be
> GPIOs I think. At this time I'm deep in the bowels of pinconf/pinmux that=
 I
> do not understand.
>=20
> TL;DR: 2ab73c6d8323 breaks GPIOs on mvebu on my system. I'll be happy to
> test patches which fix this in some better way than just a revert.

All of the above seems to indicate that there are no GPIO ranges
associated with the pinmux controller, because that's the only reason
why gpiochip_generic_request() wouldn't call into pinctrl to request
the pin for GPIO.

However, the reason why I sent that patch was because the absence of
GPIO ranges would actually cause pinctrl_gpio_request() to crash, so in
order to be able to use gpiochip_generic_request() on chips that don't
have GPIO ranges we have to call pinctrl_gpio_request() conditionally.

So I don't understand how this could've worked for you before. Unless
perhaps if there's some other difference between v5.6.7 and v5.7.1 that
introduces the crash that I was seeing.

I think a good first step would be to try that reverting the change
would actually fix the issue for you. Something like the below should do
the trick. Also, can you point out which exact DTS file it is that you
see this problem with?

--- >8 ---
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c14f0784274a..2befc4dba7f3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2783,11 +2783,6 @@ static inline void gpiochip_irqchip_free_valid_mask(=
struct gpio_chip *gc)
  */
 int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset)
 {
-#ifdef CONFIG_PINCTRL
- if (list_empty(&gc->gpiodev->pin_ranges))
-  return 0;
-#endif
-
  return pinctrl_gpio_request(gc->gpiodev->base + offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_request);
--- >8 ---

Thierry

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7gk8wACgkQ3SOs138+
s6EGfBAAl85T2rsOQKIGUrBMcZayBnsF7vj1u0c89TC1/MmoDUew3KUQpytQI1YB
lOkBs0HueukhrCjOSBU3fODhpDnPv+e5HxeRcOGB5Oeq06Pe57OYWbQU0GlsCCTM
V7198yXsAokiBTarwD5NYsEH9DFaE69R6Jrfyr/uCbZOHJUb/22sQUeCiwmAVgbr
sNuT80HThpznnuC0Qd3L0d0DQMCLHwWY4/UIpLd85NvC13ANoqQRxHW4sC0nxlCS
VcPp8yaQHqvNzhS5lIB5e2+Ev/WiMzKOU8N8Ukw+M3+D9p05ZaEEdd8mig6yDn+z
TDS3xMMNH3mi4eMvoByn4n4vPSDo4t9nrMuGhKJrFH2XZPMf+E+16l1pv8uUZInH
PPphqvxtFD0YNkaqbJqMYxxxpqMBIcGo5OyBP+Ya2Gw08oFcxyHPE2B46FUC9Cr9
EQa9jC+/4tkTwwX5eTFOeLiJ8ARxmX7A1kF1/Rr4FU15DfWlrC+5YBDoe/Cvvm0b
D9wFpjAlSbubcbJyp2rUk4gBv7nzrm3yKdlfpR33wUJsMFMb3/z6uoOaDno0m5w0
ThNLDgm7CzObUUGpkNWwSQLCjDkEFfneBq52P2UjhTAlIBqOh4M2/SLdIdj5VYhG
Y+1nN1JU0wG9SrqFoZ2jSZdrOzttnREUJqzbsek55D8n3Qv4R8A=
=2b1X
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
