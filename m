Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFC2128B2D
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Dec 2019 20:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfLUTiD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Dec 2019 14:38:03 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44320 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbfLUTiC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Dec 2019 14:38:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A25F51C24A9; Sat, 21 Dec 2019 20:37:59 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:37:58 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v7 11/12] leds: Add common LED binding parsing support to
 LED class/core
Message-ID: <20191221193758.GJ32732@amd>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
 <c7abf8d15ea54fee504fbec5666d013c26d3b62a.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vkEkAx9hr54EJ73W"
Content-Disposition: inline
In-Reply-To: <c7abf8d15ea54fee504fbec5666d013c26d3b62a.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--vkEkAx9hr54EJ73W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Qucik grep for 'for_each' or 'linux,default-trigger' or

quick.

> If init_data is goven but no starting point for node lookup - then

is given.

> (parent) device's own DT node is used. If no led-compatible is given,
> then of_match is searched for. If neither led-compatible not of_match

nor of_match.

> is given then device's own node or passed starting point are used as
> such.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>=20
> No changes since v6
>=20
>  drivers/leds/led-class.c |  99 +++++++++++++--
>  drivers/leds/led-core.c  | 258 ++++++++++++++++++++++++++++++++-------
>  include/linux/leds.h     |  94 ++++++++++++--
>  3 files changed, 385 insertions(+), 66 deletions(-)

Quite a lot of code added here. Can I trust you that we we'll delete
320 lines by converting driver or two?

> +static void led_add_props(struct led_classdev *ld, struct led_properties=
 *props)
> +{
> +	if (props->default_trigger)
> +		ld->default_trigger =3D props->default_trigger;
> +	/*
> +	 * According to binding docs the LED is by-default turned OFF unless
> +	 * default_state is used to indicate it should be ON or that state
> +	 * should be kept as is
> +	 */
> +	if (props->default_state) {
> +		ld->brightness =3D LED_OFF;
> +		if (!strcmp(props->default_state, "on"))
> +			ld->brightness =3D LED_FULL;

Max brightness is not always =3D=3D LED_FULL these days.

> @@ -322,6 +398,10 @@ int led_classdev_register_ext(struct device *parent,
>  			led_cdev->name);
> =20
>  	return 0;
> +err_out:
> +	if (led_cdev->fwnode_owned)
> +		fwnode_handle_put(fw);
> +	return ret;
>  }

led_cdev->fwnode_owned =3D false here?


> +/**
> + * led_find_fwnode - find fwnode for led
> + * @parent	LED controller device
> + * @init_data	led init data with match information
> + *
> + * Scans the firmware nodes and returns node matching the given init_dat=
a.
> + * NOTE: Function increases refcount for found node. Caller must decrease
> + * refcount using fwnode_handle_put when finished with node.
> + */
> +struct fwnode_handle *led_find_fwnode(struct device *parent,
> +				      struct led_init_data *init_data)
> +{
> +	struct fwnode_handle *fw;
> +
> +	/*
> +	 * This should never be called W/O init data. We could always return

without

> +	 * For now we do only do node look-up for drivers which populate
> +	 * the new match properties. We could and perhaps should do
> +	 * fw =3D dev_fwnode(parent); if given fwnode is NULL. But in order to
> +	 * not break existing setups we keep the old behaviour and just directly

not to break.

> +	/*
> +	 * Simple things are pretty. I think simplest is to use DT node-name
> +	 * for matching the node with LED - same way regulators use the node
> +	 * name to match with desc.
> +	 *
> +	 * This may not work with existing LED DT entries if the node name has
> +	 * been freely selectible. In order to this to work the binding doc

selectable?

> +	/**
> +	 * Please note, logic changed - if invalid property is found we bail
> +	 * early out without parsing the rest of the properties. Originally
> +	 * this was the case only for 'label' property. I don't know the
> +	 * rationale behind original logic allowing invalid properties to be
> +	 * given. If there is a reason then we should reconsider this.
> +	 * Intuitively it feels correct to just yell and quit if we hit value we
> +	 * don't understand - but intuition may be wrong at times :)
> +	 */

Is this supposed to be linuxdoc?

> +/**
> + * led_find_fwnode - find fwnode matching given LED init data
> + * @parent: LED controller device this LED is driven by
> + * @init_data: the LED class device initialization data
> + *
> + * Find the fw node matching given LED init data.
> + * NOTE: Function increases refcount for found node. Caller must decrease
> + * refcount using fwnode_handle_put when finished with node.
> + *
> + * Returns: node handle or NULL if matching fw node was not found
> + */
> +struct fwnode_handle *led_find_fwnode(struct device *parent,
> +				      struct led_init_data *init_data);
> +

If function _gets_ the node and increments its usage count, is it
normally called "get"?

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vkEkAx9hr54EJ73W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+dJYACgkQMOfwapXb+vI5hwCguJGtDjUqt+k608fpEwPgCOSC
u/0An3uL0Mm/3r+rCblBrcKUTFUHSXNC
=t+A/
-----END PGP SIGNATURE-----

--vkEkAx9hr54EJ73W--
