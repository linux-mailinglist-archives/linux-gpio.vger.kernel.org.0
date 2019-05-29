Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C15BF2DF17
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 16:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfE2OD3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 10:03:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40995 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbfE2OD2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 10:03:28 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so1872186wrm.8;
        Wed, 29 May 2019 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+ZRkbKYFuYvRjJ17mXNEVG3Ncs8Qs8qGjlL8idYIpgI=;
        b=lRCC9gxSSPOTWMBf0R0VmncHs+5+HN1G0VOTLxutZhHEpWc6RhEu9G1W3EELsqphk+
         aoPnCysq1iFMGs0ubU6ZY34uM7/6UAkw/VrXhQsfO4dXR8FES01nTUuryMn8WPXc5khL
         BdnxeaYDcg/4em8Golu0W2MUHuT7oj+OyXa7vrG+NqpOOaRh3N9Gzze8Oc5R3s2wuMzi
         NnjNMRxlZW9oItiGgt/v9gSDAjkL/N4Y7QtGZtL9LBdweINRscZ76QEB58GLEFr89VoW
         xPzpPghVZhwKiQm4wQcaPoVnwS4dh5UHNezQ1k8c10ePpaUPuZ1d6YeSDHvJALMKDDHr
         Tehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+ZRkbKYFuYvRjJ17mXNEVG3Ncs8Qs8qGjlL8idYIpgI=;
        b=ds2cvLuT/oWyUiVzXjUqBveBhAhXDGKapW4G6+5Wbq1PAXUW36dxIaB5Da2Pcs2JlP
         ZWoBemsqVEw9ksE+vx5mTvY45SE4bDKO7btVKJEnuwGK5buwkbbdsiDWnqtUsyS4zLj/
         ffgQaPqtxi32xymeqAFBAyF2TWCjxIvtS0qfGQRl3Pk1J3qW/eF/2ebPIq+jUER7gF/E
         LZJTb+NQGt/iszFd3uQVrMHRakFoY0wir5s660YWt5J2roHVI2LElvjijYv2TlBsV4iR
         Gc6BGuM7rPEOlWGBpqspCzJ2BgrcrEQcljX14Z6TrnQtle39BwhfMe8sp3IZ8jSoRLk3
         IDcQ==
X-Gm-Message-State: APjAAAWa3dMsy3bGY0csv7YzK46EwWzyOuZF0tpME/ggRLBtAARMB1XG
        DQepxv9Ttwm/p2AFCev/z3E=
X-Google-Smtp-Source: APXvYqxS14N4hE3lVRDRxf8ID9cvg/ReEt0oP5MQdD0GozbLJGmUMi32qNE6n+lS4fSY3Ys1KqWhDQ==
X-Received: by 2002:a5d:4145:: with SMTP id c5mr3730687wrq.298.1559138600799;
        Wed, 29 May 2019 07:03:20 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 9sm3262417wmn.8.2019.05.29.07.03.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 07:03:19 -0700 (PDT)
Date:   Wed, 29 May 2019 16:03:18 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 10/12] gpio: tegra: implement wake event support for
 Tegra210 and prior GPIO
Message-ID: <20190529140318.GB17679@ulmo>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-11-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <1559084936-4610-11-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 04:08:54PM -0700, Sowjanya Komatineni wrote:
> The GPIO controller doesn't have any controls to enable the system to
> wake up from low power states based on activity on GPIO pins. An extra
> hardware block that is part of the power management controller (PMC)
> contains these controls. In order for the GPIO controller to be able
> to cooperate with the PMC, obtain a reference to the PMC's IRQ domain
> and make it a parent to the GPIO controller's IRQ domain. This way the
> PMC gets an opportunity to program the additional registers required
> to enable wakeup sources on suspend.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra.c | 116 ++++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 110 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 6d9b6906b9d0..5190129668d3 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -32,6 +32,8 @@
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm.h>
> =20
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>  #define GPIO_BANK(x)		((x) >> 5)
>  #define GPIO_PORT(x)		(((x) >> 3) & 0x3)
>  #define GPIO_BIT(x)		((x) & 0x7)
> @@ -275,8 +277,22 @@ static int tegra_gpio_set_config(struct gpio_chip *c=
hip, unsigned int offset,
>  static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct tegra_gpio_info *tgi =3D gpiochip_get_data(chip);
> +	struct irq_domain *domain =3D tgi->irq_domain;
> +
> +	if (!gpiochip_irqchip_irq_valid(chip, offset))
> +		return -ENXIO;
> +
> +	if (irq_domain_is_hierarchy(domain)) {
> +		struct irq_fwspec spec;
> +
> +		spec.fwnode =3D domain->fwnode;
> +		spec.param_count =3D 2;
> +		spec.param[0] =3D offset;
> +		spec.param[1] =3D IRQ_TYPE_NONE;
> +		return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &spec);

This looks like it was copied from the equivalent Tegra186 patch. I have
since then changed the implementation, based on feedback by Linus, to
not call irq_domain_alloc_irqs() here and instead call
irq_create_fwspec_mapping(). This has the advantage of not requiring the
irq_domain_alloc_irqs() function to be exported. It ends up calling that
function internally, but as discussed with Linus it's also a nicer way
to create these mappings.

> +	}
> =20
> -	return irq_find_mapping(tgi->irq_domain, offset);
> +	return irq_find_mapping(domain, offset);
>  }
> =20
>  static void tegra_gpio_irq_ack(struct irq_data *d)
> @@ -365,7 +381,10 @@ static int tegra_gpio_irq_set_type(struct irq_data *=
d, unsigned int type)
>  	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
>  		irq_set_handler_locked(d, handle_edge_irq);
> =20
> -	return 0;
> +	if (d->parent_data)
> +		return irq_chip_set_type_parent(d, type);
> +	else
> +		return 0;

There's no need for this final else. Just make it a regular "return 0;"
at the end of the function, without the extra else branch.

>  }
> =20
>  static void tegra_gpio_irq_shutdown(struct irq_data *d)
> @@ -503,6 +522,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d=
, unsigned int enable)
>  	struct tegra_gpio_bank *bank =3D irq_data_get_irq_chip_data(d);
>  	unsigned int gpio =3D d->hwirq;
>  	u32 port, bit, mask;
> +	int ret;
> =20
>  	port =3D GPIO_PORT(gpio);
>  	bit =3D GPIO_BIT(gpio);
> @@ -513,7 +533,14 @@ static int tegra_gpio_irq_set_wake(struct irq_data *=
d, unsigned int enable)
>  	else
>  		bank->wake_enb[port] &=3D ~mask;
> =20
> -	return irq_set_irq_wake(bank->irq, enable);
> +	ret =3D irq_set_irq_wake(bank->irq, enable);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (d->parent_data)
> +		return irq_chip_set_wake_parent(d, enable);
> +	else
> +		return 0;

Same here.

Thierry

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzukSMACgkQ3SOs138+
s6F1LRAAkFFm/+adswK0FQQAsKi2ERmNbjizVldSDUw1gwSIIqIDyk28z39Hcq6o
HXPhvlEtQSAGjWo4iWzuuD6he+q6MOh7N4dDiGmJ9pC7zfg2rhiHES2Nz6a6D4cV
YKHhfYlNlSyLzHgadmlFOCJ2SJGLkEonHTG+40i73bw0jogFwSI2wz8Y8qFEEfL1
rS56rK7nnp2GENhkBVtUMkkK9S8asaKfIsyx1xeyz6HXBz8XokJM70w9cwpsMQ+z
SODN+0F1iVlXh4+t4D5UzmIDxGC3cc8FGMIU+s5gjzmsJCRkpI7+sY6OVH0GUJA6
L8jr1vIz6Cq/m+DLXhjBb9Ql3npVJXeIUMogm8Dpr4TETLe2tMxTwxP/eJUmtgtD
661OdpKEaIrb43aazxG9GcA8Z0pBQ2NuW8YSOW30LBivPmO+nK2yZ9uvCfyEkgW8
rmeJoXATr5rgf77Fd8TP+SZ2x66fDIJVWiFQONkkhMlF6ESMQf9K2BzihR8V9DPx
0iIXf3ZYtB0rojIhbFREvb2OxRapVkYMFSgg2chcM3cwERUgiXUrqH7fde2goSx9
+SywgmMeIxGMUEkQwj3eD3eERPkjrleyuTdTKCI9ExsH9W/5p2xpGZZSZpauzWA9
YoI3pZtGuhRZ7wgxVBEMbgpHjGrFY0RAOEmUK0Qn0kmnHe5KxhY=
=2EEm
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
