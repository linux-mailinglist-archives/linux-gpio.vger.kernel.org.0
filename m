Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76304015D7
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 06:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238647AbhIFEwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 00:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbhIFEwc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Sep 2021 00:52:32 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3245EC061575;
        Sun,  5 Sep 2021 21:51:28 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id d6so7160287wrc.11;
        Sun, 05 Sep 2021 21:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cVvzNcsIHpG3BOFWAwf7gExPJDKfhhUO6KEjTb93PNE=;
        b=LcvsYCLH7Pvse1pXD43LpPFw5d9+U645B7AZc+YcBhsIrbU/cIcdawQuJv6waRkII5
         EXrkxiYxtt24wRpIyVa0E3XCUe6Z6ct8/wuqAKaJpjN/PU4CkY4n7sT8B8nad1ebdnf5
         hxYzwCD5ZtwdUIc76pBCB8lw2DUd+mbe1SCPA58iPbnFeS/WWEgrvOci8xJt/WMoK+Ep
         maDF58WyV7+eumnRqKI45jAHqIyd+sveS61brtQB92IcOPqd9QtOHvgNDhJcvt/7gwkN
         Av6LSJqxDvOI5DIY/cSoKC8Yofz+FHmSVYleBMZBn6xKnf/O33M2pRDYeNASPhv8Bwhq
         ZUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cVvzNcsIHpG3BOFWAwf7gExPJDKfhhUO6KEjTb93PNE=;
        b=r/UpKI1QYhPGHXgPIEhYsJLtvz6MpLsxm3bAO0FWXALBTjsWRdT5KzUbMajH0woGcu
         vNff/L3CZJ1ii9r4VmVh9k7Xy17QYdsbvrfhVmakLvuwxKwiB0Bxc3FAj11EoxIcIskz
         vWToEGdMPRfH9WQOZfA0RlUUYjQPd7qd3HSd7Czz9bKTPHOG4UFlaHe67rCqKn+Zyvzg
         L+ETxBoZc5GAwwiVMHiO5i3pqSAsWZrWLHVcAHb93M30UFVlxb6jYpc9w6v4YGOykPdG
         EgYpU4TeGERbcVDt4OL6UScUjy6Zh2C1XNILUT4s/UFaLjnrA6j8olHVdIotz5bZoz9A
         G8EA==
X-Gm-Message-State: AOAM530g99Hm3ELtYrkBbmbr6V8osrxi9XLSR60PhtBRqC/oUsaaeGVz
        UqwU3uaClEF0ocy2fBzratk=
X-Google-Smtp-Source: ABdhPJyDQ5D8k+RXlXIRqbcNCF4aKR6u2dHVlJlNCzE0ObqsyiKqWh31yT2ByDhvx0pXIAn4D/O3Cw==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr11245465wrv.221.1630903886393;
        Sun, 05 Sep 2021 21:51:26 -0700 (PDT)
Received: from localhost (p2e5be084.dip0.t-ipconnect.de. [46.91.224.132])
        by smtp.gmail.com with ESMTPSA id e3sm5826398wrc.11.2021.09.05.21.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 21:51:25 -0700 (PDT)
Date:   Mon, 6 Sep 2021 06:51:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com
Subject: Re: [PATCH v2 1/2] gpio: tegra: add multiple interrupt support
Message-ID: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
References: <20210903101512.32430-1-pshete@nvidia.com>
 <20210903101512.32430-2-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Mx6489dLDk8B8jMw"
Content-Disposition: inline
In-Reply-To: <20210903101512.32430-2-pshete@nvidia.com>
User-Agent: Mutt/2.1.2 (9a92dba0) (2021-08-24)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Mx6489dLDk8B8jMw
Content-Type: multipart/mixed; boundary="6HeAd1eQ79YZqA9f"
Content-Disposition: inline


--6HeAd1eQ79YZqA9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 03:45:11PM +0530, Prathamesh Shete wrote:
> From: pshete <pshete@nvidia.com>
>=20
> T19x GPIO controller's support multiple interrupts. The GPIO
> controller is capable to route 8 interrupts per controller in
> case of NON-AON GPIO's and 4 interrupts per controller in AON GPIO.
> This is new feature starting T194
> The interrupt route map determines which interrupt line is to be used.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index d38980b9923a..36bd8de6d401 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2016-2017 NVIDIA Corporation
> + * Copyright (c) 2016-2021 NVIDIA Corporation
>   *
>   * Author: Thierry Reding <treding@nvidia.com>
>   */
> @@ -68,6 +68,7 @@ struct tegra_gpio_soc {
>  	unsigned int num_ports;
>  	const char *name;
>  	unsigned int instance;
> +	bool multi_ints;

Do we really have to add this? Can we not simply derive it from the
number of interrupts actually read from device tree? Doing so would also
make it easier to keep the code backwards-compatible. Remember that this
code must not fail if fed with an old device tree where not 8 interrupts
have been specified per controller.

> =20
>  	const struct tegra186_pin_range *pin_ranges;
>  	unsigned int num_pin_ranges;
> @@ -451,6 +452,7 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
>  	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>  	unsigned int parent =3D irq_desc_get_irq(desc);
>  	unsigned int i, offset =3D 0;
> +	int j, flag;

j can be unsigned in, so you can put it after i in the line above. Also,
maybe name the flag variable to something more specific to make it clear
what it's used for.

> =20
>  	chained_irq_enter(chip, desc);
> =20
> @@ -462,9 +464,20 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
> =20
>  		base =3D gpio->base + port->bank * 0x1000 + port->port * 0x200;
> =20
> -		/* skip ports that are not associated with this bank */
> -		if (parent !=3D gpio->irq[port->bank])
> -			goto skip;
> +		if (!gpio->soc->multi_ints) {
> +			/* skip ports that are not associated with this bank */
> +			if (parent !=3D gpio->irq[port->bank])
> +				goto skip;
> +
> +		} else {
> +			flag =3D 0;
> +			for (j =3D 0; j < 8; j++) {
> +				if (parent !=3D gpio->irq[(port->bank * 8) + j])
> +					flag++;
> +			}
> +			if (!(flag & 0xF))
> +				goto skip;
> +		}
> =20
>  		value =3D readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
> =20
> @@ -772,6 +785,7 @@ static const struct tegra_gpio_soc tegra186_main_soc =
=3D {
>  	.ports =3D tegra186_main_ports,
>  	.name =3D "tegra186-gpio",
>  	.instance =3D 0,
> +	.multi_ints =3D false,
>  };
> =20
>  #define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
> @@ -798,6 +812,7 @@ static const struct tegra_gpio_soc tegra186_aon_soc =
=3D {
>  	.ports =3D tegra186_aon_ports,
>  	.name =3D "tegra186-gpio-aon",
>  	.instance =3D 1,
> +	.multi_ints =3D false,
>  };
> =20
>  #define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> @@ -852,6 +867,7 @@ static const struct tegra_gpio_soc tegra194_main_soc =
=3D {
>  	.num_pin_ranges =3D ARRAY_SIZE(tegra194_main_pin_ranges),
>  	.pin_ranges =3D tegra194_main_pin_ranges,
>  	.pinmux =3D "nvidia,tegra194-pinmux",
> +	.multi_ints =3D true,
>  };
> =20
>  #define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
> @@ -875,6 +891,7 @@ static const struct tegra_gpio_soc tegra194_aon_soc =
=3D {
>  	.ports =3D tegra194_aon_ports,
>  	.name =3D "tegra194-gpio-aon",
>  	.instance =3D 1,
> +	.multi_ints =3D true,
>  };
> =20
>  static const struct of_device_id tegra186_gpio_of_match[] =3D {

Going over this patch reminded me that I had written a similar patch a
while ago, which does things a bit differently. I've attached both
patches below. Please take a look. It's slightly bigger that your
version above, but it addresses the backwards-compatibility issue. It
also has a couple of comments that describe why the interrupt routing is
done the way it is.

For completeness I should say that I'm not sure if I've ever tested the
second patch because I had it marked "WIP", which I usually do if there
is work I know remains to be done and since there's no TODO comments or
anything in the code, I assume that I never tested it completely.
Looking at the history of the branch where I have that patch, I don't
see changes to the device tree files, so I probably never got around to
adding the multiple interrupts per bank and hence couldn't test it
properly. I can do that based on your second patch, but it'd be great if
you could go over the attached patches and let me know what you think.

Thierry

--6HeAd1eQ79YZqA9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0001-gpio-tegra186-Force-one-interrupt-per-bank.patch"
Content-Transfer-Encoding: quoted-printable

=46rom f205c14353aa1c3bf05c79710abd1d7a6d4105de Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Mon, 18 May 2020 14:49:25 +0200
Subject: [PATCH 1/2] gpio: tegra186: Force one interrupt per bank

Newer chips support up to 8 interrupts per bank, which can be useful to
balance the load and decrease latency. However, it also required a very
complicated interrupt routing to be set up. To keep things simple for
now, ensure that a single interrupt per bank is enforced, even if all
possible interrupts are described in device tree.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 68 ++++++++++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index c99858f40a27..7cb0222ecee8 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -81,6 +81,8 @@ struct tegra_gpio {
 	unsigned int *irq;
=20
 	const struct tegra_gpio_soc *soc;
+	unsigned int num_irqs_per_bank;
+	unsigned int num_banks;
=20
 	void __iomem *secure;
 	void __iomem *base;
@@ -594,6 +596,28 @@ static void tegra186_gpio_init_route_mapping(struct te=
gra_gpio *gpio)
 	}
 }
=20
+static unsigned int tegra186_gpio_irqs_per_bank(struct tegra_gpio *gpio)
+{
+	struct device *dev =3D gpio->gpio.parent;
+
+	if (gpio->num_irq > gpio->num_banks) {
+		if (gpio->num_irq % gpio->num_banks !=3D 0)
+			goto error;
+	}
+
+	if (gpio->num_irq < gpio->num_banks)
+		goto error;
+
+	gpio->num_irqs_per_bank =3D gpio->num_irq / gpio->num_banks;
+
+	return 0;
+
+error:
+	dev_err(dev, "invalid number of interrupts (%u) for %u banks\n",
+		gpio->num_irq, gpio->num_banks);
+	return -EINVAL;
+}
+
 static int tegra186_gpio_probe(struct platform_device *pdev)
 {
 	unsigned int i, j, offset;
@@ -608,7 +632,17 @@ static int tegra186_gpio_probe(struct platform_device =
*pdev)
 		return -ENOMEM;
=20
 	gpio->soc =3D device_get_match_data(&pdev->dev);
+	gpio->gpio.label =3D gpio->soc->name;
+	gpio->gpio.parent =3D &pdev->dev;
+
+	/* count the number of banks in the controller */
+	for (i =3D 0; i < gpio->soc->num_ports; i++)
+		if (gpio->soc->ports[i].bank > gpio->num_banks)
+			gpio->num_banks =3D gpio->soc->ports[i].bank;
+
+	gpio->num_banks++;
=20
+	/* get register apertures */
 	gpio->secure =3D devm_platform_ioremap_resource_byname(pdev, "security");
 	if (IS_ERR(gpio->secure)) {
 		gpio->secure =3D devm_platform_ioremap_resource(pdev, 0);
@@ -629,6 +663,10 @@ static int tegra186_gpio_probe(struct platform_device =
*pdev)
=20
 	gpio->num_irq =3D err;
=20
+	err =3D tegra186_gpio_irqs_per_bank(gpio);
+	if (err < 0)
+		return err;
+
 	gpio->irq =3D devm_kcalloc(&pdev->dev, gpio->num_irq, sizeof(*gpio->irq),
 				 GFP_KERNEL);
 	if (!gpio->irq)
@@ -642,9 +680,6 @@ static int tegra186_gpio_probe(struct platform_device *=
pdev)
 		gpio->irq[i] =3D err;
 	}
=20
-	gpio->gpio.label =3D gpio->soc->name;
-	gpio->gpio.parent =3D &pdev->dev;
-
 	gpio->gpio.request =3D gpiochip_generic_request;
 	gpio->gpio.free =3D gpiochip_generic_free;
 	gpio->gpio.get_direction =3D tegra186_gpio_get_direction;
@@ -708,7 +743,30 @@ static int tegra186_gpio_probe(struct platform_device =
*pdev)
 	irq->parent_handler =3D tegra186_gpio_irq;
 	irq->parent_handler_data =3D gpio;
 	irq->num_parents =3D gpio->num_irq;
-	irq->parents =3D gpio->irq;
+
+	/*
+	 * To simplify things, use a single interrupt per bank for now. Some
+	 * chips support up to 8 interrupts per bank, which can be useful to
+	 * distribute the load and decrease the processing latency for GPIOs
+	 * but it also requires a more complicated interrupt routing than we
+	 * currently program.
+	 */
+	if (gpio->num_irqs_per_bank > 1) {
+		irq->parents =3D devm_kcalloc(&pdev->dev, gpio->num_banks,
+					    sizeof(*irq->parents), GFP_KERNEL);
+		if (!irq->parents)
+			return -ENOMEM;
+
+		for (i =3D 0; i < gpio->num_irq; i++)
+			irq->parents[i] =3D gpio->irq[i * gpio->num_irqs_per_bank];
+
+		irq->num_parents =3D gpio->num_banks;
+	} else {
+		irq->num_parents =3D gpio->num_irq;
+		irq->parents =3D gpio->irq;
+	}
+
+	tegra186_gpio_init_route_mapping(gpio);
=20
 	np =3D of_find_matching_node(NULL, tegra186_pmc_of_match);
 	if (np) {
@@ -719,8 +777,6 @@ static int tegra186_gpio_probe(struct platform_device *=
pdev)
 			return -EPROBE_DEFER;
 	}
=20
-	tegra186_gpio_init_route_mapping(gpio);
-
 	irq->map =3D devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
 				sizeof(*irq->map), GFP_KERNEL);
 	if (!irq->map)
--=20
2.33.0


--6HeAd1eQ79YZqA9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0002-WIP-gpio-tegra186-Support-multiple-interrupts-per-ba.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 3853f19ad79006aa8856fded30491cc13f98ecf1 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Mon, 6 Sep 2021 06:39:41 +0200
Subject: [PATCH 2/2] WIP: gpio: tegra186: Support multiple interrupts per b=
ank

Tegra194 and later support more than a single interrupt per bank. This
is primarily useful for virtualization but can also be helpful for more
fine-grained CPU affinity control. To keep things simple for now, route
all pins to the first interrupt.

For backwards-compatibility, support old device trees that specify only
one interrupt per bank by counting the interrupts at probe time.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 48 ++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 7cb0222ecee8..266c33df0343 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -69,6 +69,8 @@ struct tegra_gpio_soc {
 	const char *name;
 	unsigned int instance;
=20
+	unsigned int num_irqs_per_bank;
+
 	const struct tegra186_pin_range *pin_ranges;
 	unsigned int num_pin_ranges;
 	const char *pinmux;
@@ -452,7 +454,7 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 	struct irq_domain *domain =3D gpio->gpio.irq.domain;
 	struct irq_chip *chip =3D irq_desc_get_chip(desc);
 	unsigned int parent =3D irq_desc_get_irq(desc);
-	unsigned int i, offset =3D 0;
+	unsigned int i, j, offset =3D 0;
=20
 	chained_irq_enter(chip, desc);
=20
@@ -465,7 +467,12 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 		base =3D gpio->base + port->bank * 0x1000 + port->port * 0x200;
=20
 		/* skip ports that are not associated with this bank */
-		if (parent !=3D gpio->irq[port->bank])
+		for (j =3D 0; j < gpio->num_irqs_per_bank; j++) {
+			if (parent !=3D gpio->irq[port->bank * gpio->num_irqs_per_bank + j])
+				break;
+		}
+
+		if (j =3D=3D gpio->num_irqs_per_bank)
 			goto skip;
=20
 		value =3D readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
@@ -567,6 +574,7 @@ static const struct of_device_id tegra186_pmc_of_match[=
] =3D {
=20
 static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio)
 {
+	struct device *dev =3D gpio->gpio.parent;
 	unsigned int i, j;
 	u32 value;
=20
@@ -585,12 +593,30 @@ static void tegra186_gpio_init_route_mapping(struct t=
egra_gpio *gpio)
 		 */
 		if ((value & TEGRA186_GPIO_CTL_SCR_SEC_REN) =3D=3D 0 &&
 		    (value & TEGRA186_GPIO_CTL_SCR_SEC_WEN) =3D=3D 0) {
-			for (j =3D 0; j < 8; j++) {
+			/*
+			 * On Tegra194 and later, each pin can be routed to one or more
+			 * interrupts.
+			 */
+			for (j =3D 0; j < gpio->num_irqs_per_bank; j++) {
+				dev_dbg(dev, "programming default interrupt routing for port %s\n",
+					port->name);
+
 				offset =3D TEGRA186_GPIO_INT_ROUTE_MAPPING(p, j);
=20
-				value =3D readl(base + offset);
-				value =3D BIT(port->pins) - 1;
-				writel(value, base + offset);
+				/*
+				 * By default we only want to route GPIO pins to IRQ 0. This works
+				 * only under the assumption that we're running as the host kernel
+				 * and hence all GPIO pins are owned by Linux.
+				 *
+				 * For cases where Linux is the guest OS, the hypervisor will have
+				 * to configure the interrupt routing and pass only the valid
+				 * interrupts via device tree.
+				 */
+				if (j =3D=3D 0) {
+					value =3D readl(base + offset);
+					value =3D BIT(port->pins) - 1;
+					writel(value, base + offset);
+				}
 			}
 		}
 	}
@@ -610,6 +636,9 @@ static unsigned int tegra186_gpio_irqs_per_bank(struct =
tegra_gpio *gpio)
=20
 	gpio->num_irqs_per_bank =3D gpio->num_irq / gpio->num_banks;
=20
+	if (gpio->num_irqs_per_bank > gpio->soc->num_irqs_per_bank)
+		goto error;
+
 	return 0;
=20
 error:
@@ -766,7 +795,8 @@ static int tegra186_gpio_probe(struct platform_device *=
pdev)
 		irq->parents =3D gpio->irq;
 	}
=20
-	tegra186_gpio_init_route_mapping(gpio);
+	if (gpio->soc->num_irqs_per_bank > 1)
+		tegra186_gpio_init_route_mapping(gpio);
=20
 	np =3D of_find_matching_node(NULL, tegra186_pmc_of_match);
 	if (np) {
@@ -833,6 +863,7 @@ static const struct tegra_gpio_soc tegra186_main_soc =
=3D {
 	.ports =3D tegra186_main_ports,
 	.name =3D "tegra186-gpio",
 	.instance =3D 0,
+	.num_irqs_per_bank =3D 1,
 };
=20
 #define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -859,6 +890,7 @@ static const struct tegra_gpio_soc tegra186_aon_soc =3D=
 {
 	.ports =3D tegra186_aon_ports,
 	.name =3D "tegra186-gpio-aon",
 	.instance =3D 1,
+	.num_irqs_per_bank =3D 1,
 };
=20
 #define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -910,6 +942,7 @@ static const struct tegra_gpio_soc tegra194_main_soc =
=3D {
 	.ports =3D tegra194_main_ports,
 	.name =3D "tegra194-gpio",
 	.instance =3D 0,
+	.num_irqs_per_bank =3D 8,
 	.num_pin_ranges =3D ARRAY_SIZE(tegra194_main_pin_ranges),
 	.pin_ranges =3D tegra194_main_pin_ranges,
 	.pinmux =3D "nvidia,tegra194-pinmux",
@@ -936,6 +969,7 @@ static const struct tegra_gpio_soc tegra194_aon_soc =3D=
 {
 	.ports =3D tegra194_aon_ports,
 	.name =3D "tegra194-gpio-aon",
 	.instance =3D 1,
+	.num_irqs_per_bank =3D 8,
 };
=20
 static const struct of_device_id tegra186_gpio_of_match[] =3D {
--=20
2.33.0


--6HeAd1eQ79YZqA9f--

--Mx6489dLDk8B8jMw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmE1nkUACgkQ3SOs138+
s6EqRg/9HAZt00Ts+R7HkghAwIbgOaoeEL2ZXXKw3FCA056ZxDbhgaYTgJNFvg89
6LMeT5yDdHevYkv0JsoAdYLfwHqTqkoIGyJRVW4DoZDfhpVMii0p4fFGpTiQFe2K
wo5mwYpgyTzQ5jbEOnT7PRhznoooFpGJ55D2fB1YCDROJZzM93UUR0siY/Bj857w
d6PXR8MfoSRhHe+FCf3wI3Uu1LJ9FcCpbEtQSSX+QZoxiFFSDKGx7HvzABLWOZvQ
cNDdNCZqkDbAJt2lg0lXgtHdpveirwhhZQF6d/aXjgQSzqaYR6cp9CGFJ96pO1tV
PMbDWv1D01Lo3qFU9zFayFAv5ZQE+3Kbt+cyj70+WRLOtN8HPn1hIVvt+uLhfnxp
nxhYlWQiKuPW/B2XX7C60wSGFHq0X5DA8p12zgQH2RZSd4HiXCzApUVUPoVhOW5p
yG+p8EqZLGv57u0UGZRcG9NmckMA/Fe5cE90SCcJOuncHoeiIMSYo0BnZrDn6lOP
SsNFxCST1KPaPSY62L88ZdwGFW19lt3QMBhdnr+nzkppC6zesSJSuuWBcmKujc4t
xOeudsjlptMcHfDjk0LLeKcrlfmlJJK9jWQxeafFWgs/BN9sr+A36Jg2LrY1CIpP
qSJHw8023IIwWJN3TLQtr14hkBnPHn2OTutYbImDCL/XalJadVo=
=+U1d
-----END PGP SIGNATURE-----

--Mx6489dLDk8B8jMw--
