Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3678C39012D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 14:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbhEYMpR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 08:45:17 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:40907 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbhEYMpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 08:45:17 -0400
Received: by mail-lf1-f50.google.com with SMTP id w33so37918410lfu.7;
        Tue, 25 May 2021 05:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7Q+UExfa0BSPVkLH1erCFRG3VOI+JhLI3Bcdlf7hGQ0=;
        b=HnHKpEfoq/mqdtg2dKch10OgqA1YIf10AZRyp5YlyZMFUl5+T2QEsKWUlLaaC/zglU
         Nf2nugn7+3MiNuzB2u8JoVHGIBvX/bdfVHiaBCpUF1gBldHGD/GVvw+NLFGHkso8LMNK
         Qy65n5njC05pSPI//qPbcwCmL9Rq8DP6ryX+MB9azjR+EopS7VYqyjznFBBA+fUKjneU
         HVVouV6+onZhu+Ibx1lbsSzawYXtNkupw6Rnu0DHdJbBNIKovRx9PaT0X8D5y4jjJRCz
         KKpe1Swn4KMCn79x/Yfb9NHqzmGNQxXXSfu0z72qDgIMMUgcITYtkhH4K8M4vygNwPLJ
         sPOg==
X-Gm-Message-State: AOAM532l4rthnc0N9c/OXTwwpVCvl4spha0O6ZKgaE4AFzRoyMD+BTdj
        C1osY9rJU4VQyspmDzAYOnnVI24DGV0=
X-Google-Smtp-Source: ABdhPJw4SA9UdbzuC0vPlwOORtUtjAk3fMSNenq38CYsKI2XuqALp0KNrbaPVJvnRGk5TJRGNGDmTw==
X-Received: by 2002:ac2:4246:: with SMTP id m6mr14107795lfl.611.1621946625405;
        Tue, 25 May 2021 05:43:45 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id m5sm2091782ljg.118.2021.05.25.05.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 05:43:44 -0700 (PDT)
Date:   Tue, 25 May 2021 15:43:37 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH v3 0/3] gpio: gpio-regmap: Support few custom operations
Message-ID: <cover.1621863253.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--huq684BweRXVnRxX
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

 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-bd71815.c | 121 ++++++--------------
 drivers/gpio/gpio-regmap.c  | 212 ++++++++++++++++++++----------------
 include/linux/gpio/regmap.h |  51 ++++++---
 4 files changed, 187 insertions(+), 198 deletions(-)


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

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCs8PkACgkQeFA3/03a
ocWONwf6AgPjOWaF86mTQqjG/M5ueA9FVKHi7CjvONMk7mVjZoO+0FP70F+k8Cpf
7t+kucWP8VDU0ho+f/v/+wn4Kf0VX31rAogepdA6LQkL9N4LcxVpCNGYhjGFiV1I
CvgmhiiJBwdVPku2PLnKLEqTaLR2jv9+FaSxIT527aIEDGQUs1IF5Mi1KuxTPPcO
MSNDuMLAsXy6913Ce9b31wqCM8vqZlgu/HrI9j6aEge8a1rsiz6q+G/XPv8qzlY1
TbpL7dm3HkIrRNJRUUfw/SFImuurtEvGfmFhVC6lOLSfSgRjBogOuIhWHHJQ/teb
+Q0QLKCcJKCKaVXP0zq2OjMrMjzSiw==
=Q42K
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
