Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C8A399E44
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 12:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhFCKCM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 06:02:12 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:33577 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhFCKCM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 06:02:12 -0400
Received: by mail-lf1-f46.google.com with SMTP id t7so803403lff.0;
        Thu, 03 Jun 2021 03:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TRbcTChcfkbQw4wqZMWbz/6Kdy4VvqYAnpfbOiOSptQ=;
        b=dN5ldU6qj80YD0vsJSXWzlngvlYZf7fGOx7/esxidU2YnsypVsiGR+WpmKYsoFq/5a
         PFPZq+8vHFnFyH+QLdgB710d16WHuM9G7jhul/srUB1CMAsVzfDct9vVSLS26XuXmj2f
         M6fRyZpKxnB+voIwsI0TEqCh/V5eqDBDh975szs/gi12rocTCzCZb+BBgK/yGT9goFJI
         SQi7GZcKuH6o91NTrpaK0i+dc8Tkl+kcKSPkxCGGsQmMjWwEDgFL9AQnTBx3VQUXSRRn
         UZ69zosRmIkeV3zjQ07jTQU2nw/Sv4dI6ihwXSe4RrIC51Kzh7SzKIf0lnkp1ycy8l9y
         PYhQ==
X-Gm-Message-State: AOAM532daTPrrCKl7KvbaXMhTFDlBbzVoIF5dIKy5RmdotP/Dfw5/DF4
        KpyF5c8h84xmdVDEcmsbF6o=
X-Google-Smtp-Source: ABdhPJzFtsTeq1E+bv/fTUEFuA99L+zXukpk5I4VUVz1CO258k5OntRzitZPinm2ciozxRShW5GXiA==
X-Received: by 2002:a19:4803:: with SMTP id v3mr11616510lfa.115.1622714426972;
        Thu, 03 Jun 2021 03:00:26 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id c33sm305826ljr.85.2021.06.03.03.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 03:00:26 -0700 (PDT)
Date:   Thu, 3 Jun 2021 13:00:21 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: gpio-regmap: Use devm_add_action_or_reset()
Message-ID: <b0a7e849dbf7e92d2e32d8c751d87382b06f6547.1622714114.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Slightly simplify the devm_gpio_regmap_register() by using the
devm_add_action_or_reset().

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
This patch was originally part of the series here:
https://lore.kernel.org/lkml/cover.1622008846.git.matti.vaittinen@fi.rohmeu=
rope.com/

Other patches from the series were dropped.

 drivers/gpio/gpio-regmap.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 134cedf151a7..1ead1290eb3f 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -311,9 +311,9 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
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
@@ -330,20 +330,17 @@ static void devm_gpio_regmap_unregister(struct device=
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
+	int ret;
=20
 	gpio =3D gpio_regmap_register(config);
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

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmC4qDQACgkQeFA3/03a
ocWx0Qf+LgOMy78zsv5t6d5l75NJTJoE+zglco1yXWZoJWAeUAMlb+DXAuEUozlS
GYVQHtUa30rvO4rKallRLnKZ+PIZ2yLHTYF49Zir8TGUTNz2GnATpu9yZ2kdGEez
DYPehcLFHQImAb/j0a4J5rDizZM+pYw21fjZ/EiwhMcLNrfcXQbR6yeaoxTS/ZNl
D1Mb0GYO0IvCGRzLgzBu3Y1Q8gs5Kl/sOAGeOOYYFVtOhg/CAIQ9FjH71r283qMU
PHgkErEo94VJwyCeDhNtPspA2dI3a+etADsXmmVQLhDMdVPHTr1YcGzdi9LZ3IGq
5sUd243emG9QE8aweD6MoJJwGxoHNA==
=U4IZ
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
