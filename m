Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF9D391066
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 08:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhEZGMH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 02:12:07 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:43718 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbhEZGMF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 02:12:05 -0400
Received: by mail-lj1-f182.google.com with SMTP id w15so108097ljo.10;
        Tue, 25 May 2021 23:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/52t2gRhW9uzV6QfWt9pJg3Wnm3JFbOqeAJZ2k4RlFU=;
        b=fyRkFf4PrW4woyq7CfOVE2UEmIjexRuu6amnDtr9Zj4tBh+XENLOVb6COqAfdVqcSX
         KlfR03yXpLYF7UXbxUuMq2DOPy2h0RnconfU6Hnrk8dVpO60ufIp+Ngqi128Qt7zjHBs
         qMJDBpHKGSoxbTDmp7zxQK3HwYiOpD1GYjFTd9FlMSz6vvQT+zgNoTisPUw/x/B6jDD5
         8AFguZhOeJiug+Vn0FtH3LF5n/2VXmIppyeM6IZgQs4VfYp7rHTjhzBLewQHtAz4onKm
         EEEH+TsXdKaB7361MO5E+J/iagz9bd60CS1pb7wHGnXU8z94EfsKWFpnRo56Gu4NNPKa
         5/WQ==
X-Gm-Message-State: AOAM530cCJdaMWesywyrJEbZ8cz8InT+S9w2r/+WXcEI/X9T1BSiy6S1
        1sSgN6onsV6fRnHD4k7JcNI=
X-Google-Smtp-Source: ABdhPJx209K6PEaaWkfSPVYea7B2lR8PTN7rHrCkUSSG2K5hpD/OAINI9/52pFf6kiYcAtMhXpItvw==
X-Received: by 2002:a2e:8e26:: with SMTP id r6mr1012954ljk.472.1622009431450;
        Tue, 25 May 2021 23:10:31 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id o20sm1929505lfu.283.2021.05.25.23.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 23:10:30 -0700 (PDT)
Date:   Wed, 26 May 2021 09:10:24 +0300
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
Subject: [PATCH v4 2/3] gpio: gpio-regmap: Use devm_add_action_or_reset()
Message-ID: <cf34b0268bf298314392b0ed8831a4d9cd14efca.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Slightly simplify the devm_gpio_regmap_register() by using the
devm_add_action_or_reset().

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

---
Changelog v3:
 - gpio-regmap: Use the devm_add_action_or_reset() instead of the
   devm_add_action()
---
 drivers/gpio/gpio-regmap.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 4f0903d1acd5..ce5bc9e0d684 100644
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
@@ -361,20 +361,17 @@ struct gpio_regmap *devm_gpio_regmap_register(struct =
device *dev,
 					      const struct gpio_regmap_config *config,
 					      const struct gpio_regmap_ops *ops)
 {
-	struct gpio_regmap **ptr, *gpio;
-
-	ptr =3D devres_alloc(devm_gpio_regmap_unregister, sizeof(*ptr),
-			   GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+	struct gpio_regmap *gpio;
+	int ret;
=20
 	gpio =3D gpio_regmap_register(config, ops);
-	if (!IS_ERR(gpio)) {
-		*ptr =3D gpio;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+
+	if (IS_ERR(gpio))
+		return gpio;
+
+	ret =3D devm_add_action_or_reset(dev, devm_gpio_regmap_unregister, gpio);
+	if (ret)
+		return ERR_PTR(ret);
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

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCt5lAACgkQeFA3/03a
ocVAAAf9Hd+5MX2z5ocgegY4FAjPIOTOmYNoc/d/Zmd/kczKdaaOfmjXbH0maFyZ
uqYX8ImTi4I3EyzCdsKwXLhIwsgD/qm2gQCb3qFCooHHIAAwMInPTu3dCKOM2ce2
JuqwnbgO73Bgn+BXUZ9zeIBCItf1JL/PI9n6GPZdPawizbpQ3+VSA1JS29h2NAMO
QnhZW8RYglQJPnJdpWnopu/zqfBJKgGeKmw1nLPytlIYzxl3avu5jIhuUSkXfzl9
9yW6T45ufoUH/qorKNhRwYDmidromvdrZrpa8J+qrWx/EJ5+ouTK8kPqQ7KJVQVI
SdbyT3BlF4R3LN4BEkeqUqpvPWltAQ==
=W8bB
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
