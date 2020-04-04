Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4FE19E76A
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2020 21:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgDDTfg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Apr 2020 15:35:36 -0400
Received: from mout.web.de ([212.227.17.12]:56787 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgDDTfg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 4 Apr 2020 15:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586028926;
        bh=Fqu0GnCxUAj/kwvd+H7kXoW8uDipWf8I1QG3WwKzqYk=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=mdJc26xHz8/tvX1f/ijEi794H1Tne6TRmA8KxCwGd3zdtlBQfn11euRQVOKiW5tVR
         lQ3xrER74Tc5YRiF3nodRIUg6bRR3FdJ/gxFsSI4Oaudq/FBk+kWDAR+l9mT1P3Uom
         K/a4MEngSwbJtwicLp0gPyNwiCN/RPTN6C3Fm8GA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.132.181.229]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MS290-1jjTDr3TKs-00TDot; Sat, 04
 Apr 2020 21:35:25 +0200
To:     linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] gpio: msic: Delete an error message in
 platform_msic_gpio_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <bb60007c-585f-052d-2f86-5598ff7619cd@web.de>
Date:   Sat, 4 Apr 2020 21:35:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4yPAqaDZbHw3KMZr+wtSDyC6rKWHz/W243akICqewMHlrs+rpgk
 PtpSQvtD92UTEq5zv1TsTSaLoTxvCI1embyg2es3iM/ySSVdliq0R4miesBXmohTEAj2XEP
 tMJpUWwAui/clQP1FzN5ZNb4+tci3s49y0SN3i43rFb75hRuNhPF7jSaHDwMtYrnAPUg2BC
 LoZOQ/ZH1Z+r91VgcGHUg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3j0IsG37LYc=:R7tFoXejYc0+ADQFsANNHX
 FYfiJtw3oqxu+hKRi4i9R5bX6P3LCB7EMZHALSgJY53zEdRh9SrNKxmb++dnvBmoW4fgLkci4
 kBLQYka7tOrN3t1onke3JH8DpJ3yR7rC3tGPqKLJz9ynlGMpCs4sdNQw7VT54990xctm4Q32y
 5Ms/UPaG1Qqud1xp17AbbTk08q3DDYkpFlsWJGsRbLY8k0cs0+AvxwxplPiDIm00BiHR6vA64
 /YLy8vvetd6uEjRUCDGtlCSTTJQ/k2zspwZ7M5mtpBrUGoZOz/HvgzjhPobYvcf+gkgyVgCjF
 6rypiP6aAEqb4R2t9YWLPqD9D9b1ALs6FgPY0joW8NzhgG8T/xzzfBhsx2ri4lD4jtRxIUurV
 CXjYZLYQMlRV/urtmN5QXIt5hpGoCBa4bdMw9Nms1jOofyMj8HhwVZ6woptT6WuIBz9E3Upjy
 HthL4kKs+PTACN0GB2Vw20AzhisBgcW7h8qIOmk1KszZshZeFfL6QhUNPjOcJtwj4PEJjqyZx
 bf8WrpJp6k/sbRomNWW1JoyHF4t9RVyZmcHCX5Wlh1Dc1mOobOPi0NS9B/NHu6H8odbRGMsPg
 Y9riFbkcdNz6KKzBxasbyy+JwoLxSy/BXl1dnBIw7cm5UDFZIif4VGiqtlQiRpIH2xOJG9Pxk
 ggz0GpooGryw+J3Ww5BNYcVm+xRttktX1fKj6DbaZzOxLIdxIZq2TSQ2SouXiKdJetWcusdNh
 HSkUCiN06NdN9BZA7gsBon7h8Kf9DYJxQcovoR4crmnAKX8vF5NlGdAunURkaxXDoz84yhyZR
 MSMHNKqHzIMwMOsSoIGCTafNASL4F73lBDX8ygQ35rgg94JTeB+MK8wsuWwkqJfloUP+zk8Sx
 mwcZ+4G3zBNpuT5TNi1nByW5yVlHqPNtFFrAUG5GpyrgXleAQJ01qS2kaVh5dwYnqMWCVq+/G
 POq379qMLFMfMdjSAj/SD3292TUDzgb8yIIKfSdofaaalTBBuzMkKSa1q+AZIZFLOiIfoIT+c
 XrBXHD7gSAE+15kYghnUhdi6TSIwZyWJifx0BYZYJy3bDJxocCkix1XlLcB3KL1Av8SNnD3J6
 fNYW3u62uhmzXBC+LkBJxAXmKlJWlvFNqdRzrPVkIJCUICqdrwlptB9PW2Uus1al+QzOADRA0
 4Y+JLfuXSqc4Pln35JFM6C8iXVDW5JZDd19glgVWU7cLZPT26io3RSgAhD+hRZ3D6ei2kycOm
 e615q+50hAue9yxT6
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Apr 2020 21:30:12 +0200

The function =E2=80=9Cplatform_get_irq=E2=80=9D can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpio/gpio-msic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 7e3c96e4ab2c..5548b7be36b3 100644
=2D-- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -248,10 +248,8 @@ static int platform_msic_gpio_probe(struct platform_d=
evice *pdev)
 	int retval;
 	int i;

-	if (irq < 0) {
-		dev_err(dev, "no IRQ line: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}

 	if (!pdata || !pdata->gpio_base) {
 		dev_err(dev, "incorrect or missing platform data\n");
=2D-
2.26.0

