Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDCE83D2F6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 18:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390450AbfFKQud (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 12:50:33 -0400
Received: from mout.gmx.net ([212.227.15.15]:37327 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389757AbfFKQud (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 12:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1560271830;
        bh=vATTGD1y9Ncoql/qbSPI9NqU27vt/F9rVJoYYvQVRsI=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=NVLPVYI0qKvFMz5IQHVtS3IA2Y16cF2swducZgK+Q32KARksIT2ChIhFYYbwfZ0Y5
         mtnnlmxbtt23Wu8C558P6S0nW8iAjTAaPsJOCtOsEv2Vq90wPemRrGmr6N74luOcGC
         9PwHcFv0TJGQ3qEB4ZqBCweIbUUUczcRvE9O3tFg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MWSwU-1h388d3UCo-00XZtp; Tue, 11
 Jun 2019 18:50:29 +0200
Date:   Tue, 11 Jun 2019 18:50:23 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: How to write "modern" pinctrl DT node
Message-ID: <20190611165023.GA1761@latitude>
References: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:49GkmFcBVljwuu8XOZz3/fRS6FWWNo3R271wiaAEOrvk5o3kp1B
 snaCXNSvPkujOZK3SQnPhMaIBFG1K9CN6qO9k67lY7dT4flBA/LPpd+F3vQN4hj3NSNLE9l
 Isbejqx0mV8DS9Igwq371i5va2mW5D3qM/ShjhboLKaNZqfTHuW7Voe2YpDOGYI/Kdwq8/p
 3w9K3+v0gPI4HTGG4U+uA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uGSGjGMOYmo=:RNYOqxd4qVQYkLK0kuCKY5
 hzbcLEP7wJurCpNtIQF4sPfwViWBEF6pWz+0edmvpAq6/3UUcIDwWBaWpXlwFESnWM8XAInvp
 HZewa7LTloAGjJRzOl6+5XdAIq4udna672FYLpBa4b0woACgjzdSut5wH6oKywPqcAg/O+egL
 NhEunatxPgOJp9WBHntKnDYTJntJ93/gKAHKKngf978EVj5MTKsWhjgBDjzvhDoJHJP0STTTP
 KmXw7uDZII6dd7V5eNBbGjaOMBYtemoX1Q2FdItGQsl0d0ElkpdMy7zDwj6F0aAs5U3bVh21D
 1iDL8P+P8sqfOcQaxG09LfEQO0Ii9lDVhkE5jm3vtHqgHJIxxOlMfPMy8igFGfHwmL/Gg1bKQ
 GJEBFtTBLP79NOfzoNccWfie1hHGqc88MnGXuvBHSS5NoNi+TAQbVvyg/z6fUYGgWCu8VTH4v
 VhWr6ChZFrOTMVLpofspvmTfWD/KjN+RdWNNCdIb94rhELi3uLt3XfwHVJXjNjSXZw9OG6IDW
 /todmUuFVUNW8ioeEbrLK0ybzo32adLxbfPge88yAxU9JbbOv6jkgDd3mV75NCfdu9SNvs0Mc
 +Hce0DznatX2SN4TgtuMx65AQlV0XFCRoRLpjhhmbHK94korTv+lbCWQXJY6nsvChpQoWLeOT
 wd03f8KWSQ98nCikYFF8WzKKOEtPUVD0FiXtqMjcw21BCCdUQRybCOpDqTZs0VpVks6fFb96R
 nZSKJ13LAeCIrfKl0TIgRg/OlNHMqAgdJTlBpGknX0UN74rZ3BjUhcUwK3qpugsOj8mk44pB9
 KENg4cNPB99f0PXFecF5T+5Wsfrj84Bj6qLFNWTPz7ipnbbyVKhsBh92BJzGvhY9z882hOiDu
 Hs0ACr+gaOkS6wZEaMf/cFdHadvp3zWkUCkeLYwsH0CZy0sDduswmdCesGozfO48U9gTQ+E0j
 2nWv0WqMeZB8e49CO/xop/A44PHwKcdTv4FE/tO3DbJ3xB0OwvuY/CrB7LiD1jgSpRH5gitY8
 uw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 11, 2019 at 06:12:30PM +0200, Marc Gonzalez wrote:
> Hello,
>=20
> I'm working with a device (TSIF0) which apparently drives 4 pins:
> (Or maybe 5... it seems gpio40 might be associated with TSIF0 as well.)
>=20
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/d=
ts/qcom/msm8998-pinctrl.dtsi?h=3DLE.UM.1.3.r3.25#n2258
>=20
> I'll copy the downstream DT nodes here for discussion:
>=20
> 		tsif0_signals_active: tsif0_signals_active {
> 			tsif1_clk {
> 				pins =3D "gpio89"; /* TSIF0 CLK */
> 				function =3D "tsif1_clk";
> 			};
> 			tsif1_en {
> 				pins =3D "gpio90"; /* TSIF0 Enable */
> 				function =3D "tsif1_en";
> 			};
> 			tsif1_data {
> 				pins =3D "gpio91"; /* TSIF0 DATA */
> 				function =3D "tsif1_data";
> 			};
> 			signals_cfg {
> 				pins =3D "gpio89", "gpio90", "gpio91";
> 				drive_strength =3D <2>;	/* 2 mA */
> 				bias-pull-down;		/* pull down */
> 			};
> 		};
>=20
> 		/* sync signal is only used if configured to mode-2 */
> 		tsif0_sync_active: tsif0_sync_active {
> 			tsif1_sync {
> 				pins =3D "gpio9";	/* TSIF0 SYNC */
> 				function =3D "tsif1_sync";
> 				drive_strength =3D <2>;	/* 2 mA */
> 				bias-pull-down;		/* pull down */
> 			};
> 		};

Looking at the upstream binding[1], I think you can almost use the above
snippet as-is, except for the drive_strength property which is spelled
drive-strength.

> Can I rewrite the first node as:
>=20
> 	tsif0_default {
> 		pins =3D "gpio89", "gpio90", "gpio91"; /* clk, enable, data */
> 		function =3D "is_this_just_a_label?"; /* Can I just leave it out? */
> 		drive-strength =3D <2>;
> 		bias-pull-down;
> 	}

The function property is not just an arbitrary label, it needs to be one
of the values defined in the binding. (... which makes because the
driver needs to know *which* hardware function to mux to a given pin.)

> Is this enough information to configure the 3 pins? Probably not...

No, I think you need the separate nodes in order to define the separate
functions of the different pins. There isn't just one function called
"tsif1" that you could apply to all pins.

> Can I merge pin 9 in the above node, since it has the same
> "hardware properties" (drive_strength and bias_direction) ?

Merge what? &tsif0_signals_active/signals_cfg with
&tsif0_sync_active/tsif1_sync?

That depends on how &tsif0_signals_active and &tsif0_sync_active are
used. Are they always used at the same time? Then I think so.
Or are they different states of the TSIF interface that are configured
at different times?


Greetings,
Jonathan Neusch=C3=A4fer


[1]: Documentation/devicetree/bindings/pinctrl/qcom%2Cmsm8998-pinctrl.txt

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAlz/26wACgkQCDBEmo7z
X9u+ehAAtDB8p9UJe36Bk7XnOw7NDjqwPLQVzKXHfO7WpcRh64MbIx3cyWDIH/IC
hK4BUBX9xgXbJ9IWl9103CX06ry5icpcC9kZnB7ugRW2rjXE4YOEyFrxa/G3xA0R
02d5jYwsaimZk5YuO5RbzRHwlHFE5g1pYg2AmGDzQ1gNDMR5hHbkYtPCOs4BGBzR
IE8glMrmy3oMNXtbLuhg7hrlYO32cySOfOMgcBoUieoPCqimC0lUOxrSCRfjl10f
Mtbh3IwpVl69dy3Fxn0NJ2X9gZYRMCs5khubXEx10kVBI8m0EMRezp/m8+XtvrLM
737LxWCCF5TTv1NHciqwGSaPIqttd2m8S8IiEn9TndMh3FNID8///0gcx0BSwbWs
u7cqyNA53kCmFdPxMz0eIOLwgN4SPuZFq76FsSwYfkdl0QO1sLDkTB1FMMUVq11F
Vyc/QpF4/rhI2ZwSZr3/Sl7lCCHuV6WeSgoufPsut41gSG+4LXcyu70HtY3azmT1
h52wnz/BM+/DpGpi4THueODZjqgzDcbj+Qe5NN6Iu7eZ4fWfeyLZmeJ4sXnkHn76
qpyMygtanh565jlF47iodiHXr0nUAd5rOWdI2EsxeVkVuzY/i6LHr7RgS8RfPG0z
kCF/G2HwbckqL/VRJyzaCEoeIvbjq3AMNh3UO4xI7f32MsJHPyc=
=/k9r
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
