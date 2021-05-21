Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DCD38BF52
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 08:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbhEUG34 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 02:29:56 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:41816 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbhEUG3z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 02:29:55 -0400
Received: by mail-lf1-f46.google.com with SMTP id v8so23063630lft.8;
        Thu, 20 May 2021 23:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pmTPWr5fMBo4WgL4zfW5s/Wvx7/1kUB+7nmY/TggVzs=;
        b=bN5OVjgsVIECQW27XFjMJX6A5Jn8Qc2SW2ue+A0vfPjAEyRR+VVE7QgtCFiEpj8S/a
         dktFdZHB/7X0wU0DKBsKEGzP8i6bJS7ftICJ4E/a0R7LRnUWXljgzbZ6gYcgZ+WKynAk
         LqhQPSW1wR2PGeBs3vuLqVTzVlYFL7z/giTTuo7Id80V7yCXlhDPiGcgEPXY716X8M2v
         qa3c3QlKgNdRsPxqJTgQOHqGnpidogPCQfdo3ssm3SMUr9jVak7jlZZFZaBf4SEr6S6q
         uG8HKDMskw+vT8o7KT9T8UauTcRCkn7Xyko3cmhTUDHsbXzrRP8h1d3CXMc5iBjYUvl4
         fOyQ==
X-Gm-Message-State: AOAM531zcSjgLrAx6QZqltpsn4s/kkCPBb6WrUW3AFPpLDmmzg/WoxtQ
        WjIcQ/6JkLISBCQxQr5iRHU=
X-Google-Smtp-Source: ABdhPJyrjmZog9nLnu8M4XWOmOvaKPdsA9IV7Sh7OGuK3B96/rU4+Mp/WaYrPMlddDdwyjpTgLHfaw==
X-Received: by 2002:a19:f01a:: with SMTP id p26mr1082233lfc.132.1621578510592;
        Thu, 20 May 2021 23:28:30 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::3])
        by smtp.gmail.com with ESMTPSA id u13sm518225lju.106.2021.05.20.23.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 23:28:30 -0700 (PDT)
Date:   Fri, 21 May 2021 09:28:24 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH v2 2/3] gpio: gpio-regmap: Use devm_add_action()
Message-ID: <e3d3e704804668d1403f3630c181010b34409c8f.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Slightly simplify the devm_gpio_regmap_register() by using the
devm_add_action().

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changelog:
  - New patch at v2

 drivers/gpio/gpio-regmap.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index c05370e984b9..4555e59f916e 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -341,9 +341,9 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
=20
-static void devm_gpio_regmap_unregister(struct device *dev, void *res)
+static void devm_gpio_regmap_unregister(void *res)
 {
-	gpio_regmap_unregister(*(struct gpio_regmap **)res);
+	gpio_regmap_unregister(res);
 }
=20
 /**
@@ -360,20 +360,12 @@ static void devm_gpio_regmap_unregister(struct device=
 *dev, void *res)
 struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
 					      const struct gpio_regmap_config *config)
 {
-	struct gpio_regmap **ptr, *gpio;
-
-	ptr =3D devres_alloc(devm_gpio_regmap_unregister, sizeof(*ptr),
-			   GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+	struct gpio_regmap *gpio;
=20
 	gpio =3D gpio_regmap_register(config);
-	if (!IS_ERR(gpio)) {
-		*ptr =3D gpio;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+
+	if (!IS_ERR(gpio))
+		devm_add_action(dev, devm_gpio_regmap_unregister, gpio);
=20
 	return gpio;
 }
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

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCnUwgACgkQeFA3/03a
ocVBigf+LV5ewhM79oVne5HFTijYvcBYFvNleUWvLpl8Pt+OcNY0bXJ4Ry+yNtze
Fv7ZsqCDbG8gn7kKFW+jvK9efAPwVif5AErAiCfMAircJGZKzLd9Ftd+31DwKHoa
lf/EemdRl1odn0SpNQ/1THoDv/dbpWtsyrQJMUelA4/b/Cjx/2NDrA5ySTw0M+pH
1a+Zsj9z22G5y14nobvf4OYfbnqMTscopwzLImsO20VqtqLOpRtWiBEJ20tcB6sc
DJc/0tLRrJkTRhZjxibk+gzqpVV7ixgqRRcgHF+AlhJLfjzEf6e4FC0uHme9FqD1
tbhuWsVqjtIzqIbAxWIOwe0a926d2A==
=Tu20
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
