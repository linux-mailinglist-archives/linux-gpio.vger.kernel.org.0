Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6C338BF46
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 08:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhEUG2n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 02:28:43 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:35429 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhEUG2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 02:28:43 -0400
Received: by mail-lf1-f48.google.com with SMTP id x19so28081981lfa.2;
        Thu, 20 May 2021 23:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TEd7BwEnb381M+LjsahkUGlrL6ZQJ9SCtukWES/e0HQ=;
        b=CfUTW+xuK41HviXsjsVjigisOMQFiSM3dm4qgUWXKh2Plo3VvhaXS4xHZR+geuPjA7
         pq8MJQHW12Sk1UROkAgtcFx9Wznaxq3rzCdK8hWT27C1xA8HaDD4WrX/7fVFKfnVhIGZ
         oSAtkKQWrahrLCoyIH63zWjXfe35W4C/ZSY1863XaR3/6bcDfLwjtENRVu4i6Yzn06kT
         H3RR+aYEYHp565sL3955SGevVFAYFvPfc0Qicit/RR1r9hNdygKn2tib7TW+gq8VT8rC
         eIYI4O1DYGGWnz+Lzp2lvL5j+sgQJNVJ36qPvmQ/Bi9+NjkqYyAfvT4VSUIq4emkPVrT
         mapQ==
X-Gm-Message-State: AOAM532ITlj2tEuijcBuNxaT502da+aEu1S0Vf4+WzAwozZSwEfq/SzH
        77++YDLaMK9UWI7HmT+g0oozRXIY+lhgug==
X-Google-Smtp-Source: ABdhPJyePaIi0s7wx0tYT/mBO+4Hp2S33bjhg1sN/VST5UA6ngixt5Cg38E1XSGlt53XQ0eQeKn3bg==
X-Received: by 2002:a05:6512:139e:: with SMTP id p30mr1112476lfa.489.1621578439576;
        Thu, 20 May 2021 23:27:19 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::3])
        by smtp.gmail.com with ESMTPSA id f4sm519482lfu.133.2021.05.20.23.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 23:27:18 -0700 (PDT)
Date:   Fri, 21 May 2021 09:27:11 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH v2 0/3] gpio: gpio-regmap: Support few custom operations
Message-ID: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--OXfL5xGRrasGEqWY
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

Changelog v2:
 - Add cover-letter
 - Drop unnecessary checks for callback function validity
 - drop driver_data setting function as it is likely to be a
   race-condition-by-design

---

Matti Vaittinen (3):
  gpio: regmap: Support few IC specific operations
  gpio: gpio-regmap: Use devm_add_action()
  gpio: bd71815: Use gpio-regmap

 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-bd71815.c | 106 ++++++++++--------------------------
 drivers/gpio/gpio-regmap.c  |  62 ++++++++++++++-------
 include/linux/gpio/regmap.h |  14 ++++-
 4 files changed, 84 insertions(+), 99 deletions(-)


base-commit: d07f6ca923ea0927a1024dfccafc5b53b61cfecc
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

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCnUrIACgkQeFA3/03a
ocXsTwf/UzPwJDsIi6gh0GTpTuRSG6VRiPtYs8kZkB9kx1wEd1GCW1r3NU8soVzq
LQeqK3iSFhB6LYV7sloiF9XgxcvBxV3OY6hVIIWs2rDJncJ6lzpKPrLmQS3wpVU1
8s/qoNYj7AR3+frciPYf5GWz3M3QOUNRJ3asghXtWbuqP/cCA6nwJaay/SgjY0NK
KAFOOFsJRkpzCEHJhLDZJjrOoBSDDT3Yi5bAZciaNm6G1ir2jpeHBSi90ppRpenn
TYL6M4Yb9E/2vPfRM1ZYRetCecGDmQ0/xWgTQDB5hg2DY+kgX0NfwaYrYAl2qgDa
1KYEANAil2dNWWI+rdEuTMXWuTe1Tw==
=G63J
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
