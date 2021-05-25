Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40A7390132
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 14:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbhEYMp5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 08:45:57 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:41564 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbhEYMp4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 08:45:56 -0400
Received: by mail-lj1-f180.google.com with SMTP id p20so37938087ljj.8;
        Tue, 25 May 2021 05:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mCi+r6IwCoXZfzb6cVEAq1MYx2HiJhihCuCmYe0D4ac=;
        b=aAV4eH4ELLY8BWjHpKQY8tdEhmY5HBzJ6qvZDL7wmzAf2GE5OJMAGiultxPJwm+JJv
         nfCq/V7eaj2t2HiVNS4esn88N1zUDUR/hPuz3ncEJ5y0gWLqs+gAI8zZMt3yEd7jpei4
         IOt05axeH1YVo4zc7IbDF420Bg4LTL89xZy+u0X2Jj6HWmjwV5RHGvsl70C3ARbjDdea
         cjCXJJF1vLEQfmi6I4TVxo44UtdvA+SLWlCE1FzeeHn2Xd3Crr4T8IsBRGl//xDfuoAP
         rfOlctTPQLSz5/60dty4x8VgDR6fTDlZkcAgZxgphU//fKjdDhnAUtpmWa0rrjGP/RsY
         eCEA==
X-Gm-Message-State: AOAM530/LaJZ4ZLnZjPc4bR4DkQqHeGIB7xCmsVx8+QtYBdYVjz/NPd5
        8bd4u6h3pw/0lvT1Sj2RLnw=
X-Google-Smtp-Source: ABdhPJxY4QKY+vSDO7OyXM6oeVSH5x5CZZfxUhvZAFkvg/sSR1ElpLV3lryIsdXFHAAANB2P9oXV4A==
X-Received: by 2002:a2e:9dcf:: with SMTP id x15mr20736106ljj.257.1621946665494;
        Tue, 25 May 2021 05:44:25 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id y18sm2211720ljk.27.2021.05.25.05.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 05:44:24 -0700 (PDT)
Date:   Tue, 25 May 2021 15:44:19 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH v3 2/3] gpio: gpio-regmap: Use devm_add_action_or_reset()
Message-ID: <9e828f2ff52c08b91b1fdab548e9253ef2fb7766.1621863253.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621863253.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <cover.1621863253.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--RnlQjJ0d97Da+TV1
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

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCs8SMACgkQeFA3/03a
ocXLlwf/Y+g18mlm1g+iizU4sSFGtWw0eNqFYvmK8wnbOgD1ZhkmtGYpBIr8e/r9
6FIdQMYGKr0CGojxVq8qZbTUbE/iMARLEv9SiGZvJh2lC8rFv4C8a1YPQ9hxwknT
t8msNH3LbM6OqBl9KHiJtOEC3Iuz0M2e2ERAzZyLFggN/KAnRijVdwAlqb8tMERi
h3N4sgnLDlMcwc5110LuLrnhdlo/o+jZU9tC6lW+nBIlC1CbqqPBCzqxm4ibIg1u
QLRfF++xS0QkzmXxWlpIM2Q5F6sxdePYmrpX2Yd56Pjc8fuxzhfV0+6vGskd5iEg
S5xPJIG3e4/9Ugz8rV67PGRVmIKePQ==
=SYPK
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
