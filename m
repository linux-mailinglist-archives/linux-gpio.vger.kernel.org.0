Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310AB32D0F1
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238805AbhCDKhT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbhCDKhM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:37:12 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A819C061756;
        Thu,  4 Mar 2021 02:36:32 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id n22so7563441wmc.2;
        Thu, 04 Mar 2021 02:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:content-transfer-encoding:mime-version:subject:date:references
         :to:in-reply-to:message-id;
        bh=xY18sDReiJtJFeAF/26+YfWwB3kOz8MfHZwLEcrETmU=;
        b=iBU/cfrN1GjLaZriPhe4xvSPWdmX1yc8eW2V3cP+i9DL/OLOYae31oePt5ssezOLld
         wpy5vFTU7QuqxghjvGmvZFX2tOvj7vYqO9j8macUEUxXpmhv5PIWlKE4Po/gz3zOGNhe
         RmUPrsZrlMHZni2In3Wof1gjXY2UHWSKNVrTvaso3sGKpFTEvb7u8Y657+lQgVRjDVq2
         64iPm/CsyIbg1nlTq0AhtwGInybLhm2GRH0P9qLGGwk9V0s0oB8WUhEJzAjkpZ62ofHD
         0H+z6PbxhjujtXYuOLK17UMTdo48dAHOlk6aoacdzZXoqsqP4mRWAXtOObmGXxeme1Nd
         ygpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:date:references:to:in-reply-to:message-id;
        bh=xY18sDReiJtJFeAF/26+YfWwB3kOz8MfHZwLEcrETmU=;
        b=mOI3AUfFpvy5bwNK3ia31l3bhmz15YsY7bIZmiQV8CCRndXvE9ir2Qj7dXVmE/wvxl
         GKykvzcl91RrPNbmanP0KXjznCAytbbDX8ra47IiEPz1+AajgUwIJOnCdhBY8Lwd4w+R
         1L2kw1OrsxO0qQFsrvPSyVnEBxAGnPfgsNzGpoJO0nsiRjYBtmmbtbtUobKxoM3GtMqJ
         aW85ZuZKKcXEVKpOi/BMsFzb2hmIdGXRgKOfIsH3bxhYilHHaGYq0c4B5TGBqtR7DPfB
         XDqzzudLI/nqJ2AcAC1U7MNWQlO2KhdXtT6sVzRnG+4AK3FbQklp+nxTy/PbbTIYr4NL
         UBPw==
X-Gm-Message-State: AOAM533S6Q9GzT/x/WwRkVsxmEm6rMIJ0VqdlFcZmFMaysOIe4yyONmA
        2och/gfa6RpH1jZQvtaiwh8=
X-Google-Smtp-Source: ABdhPJwrPyjdzcsvLiOFNJ80oRzMv3mI7Jxa5ILFUJSSxT3uVBVIFm2DlaAZzwp8bQQw+Wau/7ltZA==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr3280813wmj.147.1614854190989;
        Thu, 04 Mar 2021 02:36:30 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id i26sm1848858wmb.18.2021.03.04.02.36.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 02:36:30 -0800 (PST)
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 01/15] gpio: guard gpiochip_irqchip_add_domain() with
 GPIOLIB_IRQCHIP
Date:   Thu, 4 Mar 2021 11:36:30 +0100
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-2-noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20210304085710.7128-2-noltari@gmail.com>
Message-Id: <BAC3CA00-A3E5-4FCE-9A15-F8BF1DAA1E9C@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add missing tag:

Suggested-by: Michael Walle <michael@walle.cc>

> El 4 mar 2021, a las 9:56, =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> escribi=C3=B3:
>=20
> The current code doesn't check if GPIOLIB_IRQCHIP is enabled, which =
results in
> a compilation error when trying to build gpio-regmap if =
CONFIG_GPIOLIB_IRQCHIP
> isn't enabled.
>=20
> Fixes: 6a45b0e2589f ("gpiolib: Introduce =
gpiochip_irqchip_add_domain()")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
> v4: add patch (fix include instead of gpio-regmap.c)
>=20
> include/linux/gpio/driver.h | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 286de0520574..ecf0032a0995 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -624,8 +624,17 @@ void gpiochip_irq_domain_deactivate(struct =
irq_domain *domain,
> bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
> 				unsigned int offset);
>=20
> +#ifdef CONFIG_GPIOLIB_IRQCHIP
> int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
> 				struct irq_domain *domain);
> +#else
> +static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
> +					      struct irq_domain *domain)
> +{
> +	WARN_ON(1);
> +	return -EINVAL;
> +}
> +#endif
>=20
> int gpiochip_generic_request(struct gpio_chip *gc, unsigned int =
offset);
> void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
> --=20
> 2.20.1
>=20

