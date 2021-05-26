Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C29E391045
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 08:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbhEZGEb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 02:04:31 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:38778 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbhEZGEa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 02:04:30 -0400
Received: by mail-lj1-f171.google.com with SMTP id a4so111289ljd.5;
        Tue, 25 May 2021 23:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=bLwEdy+rrLsCVQ5NTrNvxDpvweYe5d2q0y9UoLoVLJY=;
        b=dx7LmWQ/qW+AfC3y6TsONYNC6BO5fji7u4DP5bbBVVsKBh6NeR4hRi3ZtiycqTzCT0
         h0ifux81a/ep23GMrbcGuut1Fd+3jlbWjyi97wbQpEhpXin+nEgI2L4Exa9v0U95sDBE
         1K2vuhcFEMG9CWhFxuGDF8xQC/pOcDQEnPnem+Tt7eABwUbSKCTPGxPY3sgDJC55E5s3
         C6BEySAHL+QrujU4yoeRkjnPZiQX5YyvbetennMp14VL0r8XM7AQVXMcARUiyAlxWaml
         S7qJiAQCLi6d5ifncH7tyO1CcyNA4sLu/XJJeVlVl084hH4p7xaVqx/C6UCGNs8xcKhl
         hK2Q==
X-Gm-Message-State: AOAM532H4Paac/OGeKfrFUl+3DH0dkBY9m+qfNhVg06cpez+MnS2wD+j
        9M2gEELse+H63qusFwNgdx0=
X-Google-Smtp-Source: ABdhPJwFVTLG8GWu+T8Y0QAPo8nQNpl2RVxETxVByejUnpBYVrrZfLHW6rGLDfeWqKi0f36ruM8h4Q==
X-Received: by 2002:a2e:9dc5:: with SMTP id x5mr957592ljj.147.1622008977509;
        Tue, 25 May 2021 23:02:57 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id j1sm1922622lfg.166.2021.05.25.23.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 23:02:56 -0700 (PDT)
Date:   Wed, 26 May 2021 09:02:50 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com,
        linux-arm-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
Message-ID: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support providing some IC specific operations at gpio_regmap registration.

Implementation of few GPIO related functionalities are likely to be
very IC specific. For example the pin-configuration registers and the
pin validity checks. Allow IC driver to provide IC specific functions
which gpio-regmap can utilize for these IC specific configurations.
This should help broaden the gpio-regmap IC coverage without the need
of exposing the registered gpio_chip or struct gpio_regmap to IC drivers.

The set_config and init_valid_mask are used by ROHM BD71815 GPIO driver.
Convert the BD71815 GPIO driver to use gpio-regmap and get rid of some
code. Rest of the ROHM GPIO drivers are to be reworked after the
mechanism of adding IC specific functions is settled.

Some preliminary discussion can be seen here:
https://lore.kernel.org/linux-gpio/c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974=
=2Ecamel@fi.rohmeurope.com/

I did also prepare change where the getters for drvdata and regmap
are used. It can also work - but it does not scale quite as well
if (when) IC drivers need some register information to do custom
operations. Interested people can see the:
https://github.com/M-Vaittinen/linux/commits/gpio-regmap-getters
for comparison.

Changelog v4:
 - Convert also the existing users.

Changelog v3:
 - divide gpio_regmap into private part and part which contains
   user-visible configurations. This should allow keeping the internal
   data internal to gpio_regmap - while allowing the IC driver to re-use
   configurations it has provided to gpio-regmap without a need of
   storing them to private-data. Furthermore avoid implementing dummy
   'getter-functions' for regmap, driver-data, register details,
   firmware node etc.
 - change devm_add_action() to devm_add_action_or_reset()
 - the bd71815 GPIO driver, completely drop private-data.

Changelog v2:
 - Add cover-letter
 - Drop unnecessary checks for callback function validity
 - drop driver_data setting function as it is likely to be a
   race-condition-by-design

---

Matti Vaittinen (3):
  gpio: regmap: Support few IC specific operations
  gpio: gpio-regmap: Use devm_add_action_or_reset()
  gpio: bd71815: Use gpio-regmap

 drivers/gpio/Kconfig                  |   1 +
 drivers/gpio/gpio-bd71815.c           | 121 ++++-----------
 drivers/gpio/gpio-regmap.c            | 212 +++++++++++++++-----------
 drivers/gpio/gpio-sl28cpld.c          |   3 +-
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c |   8 +-
 include/linux/gpio/regmap.h           |  51 +++++--
 6 files changed, 194 insertions(+), 202 deletions(-)


base-commit: c4681547bcce777daf576925a966ffa824edd09d
--=20
2.25.4


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCt5H0ACgkQeFA3/03a
ocVG2gf/cGL1Rx2rIC520y0EBzFBbSHvHu56eUlaER8PFO3IVaiNswgOzZNpneiy
EP2WNzcpxctz1nx3lp7bX6GLtnu4wD9xte/uHi1u6tFB/PuSub5KynPO0V6r3bky
VhOywIILQr9MvhUH7S01WCosGjDMCggUTNDGecrEXGVIV1J9MNwS7RHTUSehn3Bc
gW7D0n3QWbC8W8R+GG7w7Wk7aceT1BImD3jzSFRd+q3aNrri8B7g7tg1JofEAMwi
7vZgQXX4JYwhPLz3Q8baiM0mox+og4oQyAsJUkP3TnEXsX0SlTQ1a1eEr7YOwN+G
4x9aiveKMqkcsf3tP83oCzYupnQTXw==
=hOoY
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
