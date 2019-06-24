Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C42A50D65
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 16:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfFXOKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 10:10:01 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:51848 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfFXOKA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 10:10:00 -0400
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 996DF3AB767;
        Mon, 24 Jun 2019 13:49:07 +0000 (UTC)
X-Originating-IP: 90.88.16.156
Received: from localhost (aaubervilliers-681-1-41-156.w90-88.abo.wanadoo.fr [90.88.16.156])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7056A20015;
        Mon, 24 Jun 2019 13:48:57 +0000 (UTC)
Date:   Mon, 24 Jun 2019 15:48:56 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 9/9] ARM: dts: sun8i: s3: add devicetree for Lichee
 zero plus w/ S3
Message-ID: <20190624134856.4cez7m3uc3tzkpuc@flea>
References: <20190623043801.14040-1-icenowy@aosc.io>
 <20190623043801.14040-10-icenowy@aosc.io>
 <20190624124301.chwhfalk5o53fm5x@flea>
 <1E6AB747-5A4C-4515-A0EB-F0E89F520CF7@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zxvkkmn55l32dkjm"
Content-Disposition: inline
In-Reply-To: <1E6AB747-5A4C-4515-A0EB-F0E89F520CF7@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--zxvkkmn55l32dkjm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2019 at 09:43:23PM +0800, Icenowy Zheng wrote:
> >> +&usb_otg {
> >> +	dr_mode = "otg";
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usbphy {
> >> +	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> >> +	status = "okay";
> >> +};
> >
> >How can it do OTG if there's no controllable VBUS regulator?
>
> All 5V's are connected together, like Orange Pi Zero.

So it's a "it can't"?

And the orange pi zero says that it can only do peripheral.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zxvkkmn55l32dkjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRDUyAAKCRDj7w1vZxhR
xf0zAQCi5yMphtVy7Fni1inyxiANdxNrQlQW3OVimG6brkVyVwEAo7h8m+NLImGt
4bQgRfzj3aMgbAemt9y56Z7FeLYepwg=
=+IOZ
-----END PGP SIGNATURE-----

--zxvkkmn55l32dkjm--
