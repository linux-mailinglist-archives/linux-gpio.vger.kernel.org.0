Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C578455124
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 16:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfFYOKb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 10:10:31 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:58235 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727251AbfFYOKb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 10:10:31 -0400
X-Originating-IP: 90.88.16.156
Received: from localhost (aaubervilliers-681-1-41-156.w90-88.abo.wanadoo.fr [90.88.16.156])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6653940003;
        Tue, 25 Jun 2019 14:10:26 +0000 (UTC)
Date:   Tue, 25 Jun 2019 16:10:25 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH v3 1/9] pinctrl: sunxi: v3s: introduce support for V3
Message-ID: <20190625141025.uvewl7arnsz5grr3@flea>
References: <20190623043801.14040-1-icenowy@aosc.io>
 <20190623043801.14040-2-icenowy@aosc.io>
 <20190624124019.o6acnnkjikekshl5@flea>
 <CACRpkdaQSg4qWWF1XurWA8wnW+ezGtTympVT9DvkF87VKEQVzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uh3numobk6gzuc5u"
Content-Disposition: inline
In-Reply-To: <CACRpkdaQSg4qWWF1XurWA8wnW+ezGtTympVT9DvkF87VKEQVzw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--uh3numobk6gzuc5u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 25, 2019 at 03:57:15PM +0200, Linus Walleij wrote:
> On Mon, Jun 24, 2019 at 2:40 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > On Sun, Jun 23, 2019 at 12:37:53PM +0800, Icenowy Zheng wrote:
> > > Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> > > V3s pinctrl driver.
> > >
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > ---
> > > Changes in v3:
> > > - Fixed code alignment.
> > > - Fixed LVDS function number.
>
> > > -               SUNXI_FUNCTION(0x2, "uart2"),         /* TX */
> > > -               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),  /* PB_EINT0 */
> > > +               SUNXI_FUNCTION(0x2, "uart2"),                 /* TX */
> > > +               SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),          /* PB_EINT0 */
> >
> > I'm not sure why all that churn is needed.
> >
> > Looks good otherwise.
>
> Should I apply the patch or wait for a new version without the
> whitespace fixes?

I'd rather not have the indentation changes in that patch.

And we've sent the changes for 5.3 already, so it's going to be 5.4
material anyway.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--uh3numobk6gzuc5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRIrUQAKCRDj7w1vZxhR
xUx/APwJxRclTo/OlevMmcYPGQ1p1ck7FN1SUXrdShcLFeCyjwD/Y20Bm5HFxJ74
8AikfrRhA+M905RT/a5BkSxvJYhOeg0=
=yyVJ
-----END PGP SIGNATURE-----

--uh3numobk6gzuc5u--
