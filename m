Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B3C32C62
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 11:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbfFCJQz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 05:16:55 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40746 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728846AbfFCJQy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 05:16:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id u16so4965514wmc.5;
        Mon, 03 Jun 2019 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ehgs8Yv2R2uwtDIp6nJrCoO/nKmVENZbD7qcN1BuIG0=;
        b=N/D9NBkn7TnVG1YT7FoBk/uWCPK4JJ1eWcufMY2hrYxsaCHxgYX9VcLmbJZlAha0wG
         ATdj7ZXT65P6jKDKBewOJNjai9hlkg66ek16FAZ3MxOA2YyVFZ9XHM6j6TQNWm7sug8b
         1bslWW8NyQclcABTdX0LIaD8pPkzOO+pVgHt+41Di82BykgdnKxhJ62uq41WavwfqIX9
         7w1a5m8OjZ9VwQZ3zrGhuJvkhQcuPyJaoid9kzcgMb6PdQk9aU3Nc1yifj8u5cO78gzN
         /8NUDVHUBlO/IYxeLGMrRZdoXzRhr+f11sDtFRPE7QEPP7EjpkorMEZXLYa1j+dvgGtF
         GsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ehgs8Yv2R2uwtDIp6nJrCoO/nKmVENZbD7qcN1BuIG0=;
        b=DfUNUOgoVjFz5jmKUwCi0GeWd0Ax3FByjUVMJriWQ35FnAPWLiBN8a9HRlN4f72BOG
         tc9yJGTMy+uD9G2+qWCjc/14/7xV/8aExGGPwe+2fLvWlh5BejZKblfpH6oHcdEd8jtr
         6jP1ENg8Gty7REG7u/NE1dniSPgoxtP6OE/HYryvlS7Xd4V1NMcSxbzowjlsnoi5yAfo
         coJUy09iDBbag2ywNnJcTB5PNY4vokfSfoAfqNdxwk+DBiRZ0feG8l5O3BVav33/WTPp
         fy6lzU/v2SlUdQC5fhwObl9XsMuybU0QNhC2Gv/tRiye0BBv5OncRyv+RsJguQ0Z4Sat
         po7g==
X-Gm-Message-State: APjAAAUkXI45SLGoMWxOQKyKaCo6xuTMu8KaaTm+AEt/dXLn7Ld17/wh
        meAZ6YE63nCETMX6Oyx7oE5aKMG4
X-Google-Smtp-Source: APXvYqw+KE0oZdWtymAWnDBX22flAlITP5RyYOQrfjmbVuchYYt2tqHyKwbTLOO9G3aPhxC6OWSbdw==
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr12558210wme.86.1559553411228;
        Mon, 03 Jun 2019 02:16:51 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id o14sm13819823wrp.77.2019.06.03.02.16.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 02:16:50 -0700 (PDT)
Date:   Mon, 3 Jun 2019 11:16:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] RFC: gpio: ixp4xx: Convert to hieararchical
 GPIOLIB_IRQCHIP
Message-ID: <20190603091649.GD27753@ulmo>
References: <20190602205424.28674-1-linus.walleij@linaro.org>
 <20190602205424.28674-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rz+pwK2yUstbofK6"
Content-Disposition: inline
In-Reply-To: <20190602205424.28674-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2019 at 10:54:24PM +0200, Linus Walleij wrote:
> This modifies the IXP4xx driver to use the new helpers
> to handle the remapping of parent to child hardware irqs
> in the gpiolib core.
>=20
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
> Cc: Bitan Biswas <bbiswas@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Warning: not even compile tested as my IXP4xx setup is
> at home and I'm travelling. I just wanted to get this out
> there as an example of how I imagine this would work with
> existing drivers.
> ---
>  drivers/gpio/Kconfig       |   3 +-
>  drivers/gpio/gpio-ixp4xx.c | 211 +++++--------------------------------
>  2 files changed, 28 insertions(+), 186 deletions(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 23a121c2e176..3aef6327f994 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -289,8 +289,7 @@ config GPIO_IXP4XX
>  	depends on ARM # For <asm/mach-types.h>
>  	depends on ARCH_IXP4XX
>  	select GPIO_GENERIC
> -	select IRQ_DOMAIN
> -	select IRQ_DOMAIN_HIERARCHY
> +	select GPIOLIB_IRQCHIP
>  	help
>  	  Say yes here to support the GPIO functionality of a number of Intel
>  	  IXP4xx series of chips.
> diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
> index 670c2a85a35b..429d9d519ed4 100644
> --- a/drivers/gpio/gpio-ixp4xx.c
> +++ b/drivers/gpio/gpio-ixp4xx.c
> @@ -47,7 +47,6 @@
>   * @dev: containing device for this instance
>   * @fwnode: the fwnode for this GPIO chip
>   * @gc: gpiochip for this instance
> - * @domain: irqdomain for this chip instance
>   * @base: remapped I/O-memory base
>   * @irq_edge: Each bit represents an IRQ: 1: edge-triggered,
>   * 0: level triggered
> @@ -56,36 +55,25 @@ struct ixp4xx_gpio {
>  	struct device *dev;
>  	struct fwnode_handle *fwnode;
>  	struct gpio_chip gc;
> -	struct irq_domain *domain;
>  	void __iomem *base;
>  	unsigned long long irq_edge;
>  };
> =20
> -/**
> - * struct ixp4xx_gpio_map - IXP4 GPIO to parent IRQ map
> - * @gpio_offset: offset of the IXP4 GPIO line
> - * @parent_hwirq: hwirq on the parent IRQ controller
> - */
> -struct ixp4xx_gpio_map {
> -	int gpio_offset;
> -	int parent_hwirq;
> -};
> -
>  /* GPIO lines 0..12 have corresponding IRQs, GPIOs 13..15 have no IRQs */
> -const struct ixp4xx_gpio_map ixp4xx_gpiomap[] =3D {
> -	{ .gpio_offset =3D 0, .parent_hwirq =3D 6 },
> -	{ .gpio_offset =3D 1, .parent_hwirq =3D 7 },
> -	{ .gpio_offset =3D 2, .parent_hwirq =3D 19 },
> -	{ .gpio_offset =3D 3, .parent_hwirq =3D 20 },
> -	{ .gpio_offset =3D 4, .parent_hwirq =3D 21 },
> -	{ .gpio_offset =3D 5, .parent_hwirq =3D 22 },
> -	{ .gpio_offset =3D 6, .parent_hwirq =3D 23 },
> -	{ .gpio_offset =3D 7, .parent_hwirq =3D 24 },
> -	{ .gpio_offset =3D 8, .parent_hwirq =3D 25 },
> -	{ .gpio_offset =3D 9, .parent_hwirq =3D 26 },
> -	{ .gpio_offset =3D 10, .parent_hwirq =3D 27 },
> -	{ .gpio_offset =3D 11, .parent_hwirq =3D 28 },
> -	{ .gpio_offset =3D 12, .parent_hwirq =3D 29 },
> +const struct gpiochip_hierarchy_map ixp4xx_gpiomap[] =3D {
> +	{ .hwirq =3D 0, .parent_hwirq =3D 6, .parent_type =3D IRQ_TYPE_LEVEL_HI=
GH },
> +	{ .hwirq =3D 1, .parent_hwirq =3D 7, .parent_type =3D IRQ_TYPE_LEVEL_HI=
GH },
> +	{ .hwirq =3D 2, .parent_hwirq =3D 19, .parent_type =3D IRQ_TYPE_LEVEL_H=
IGH },
> +	{ .hwirq =3D 3, .parent_hwirq =3D 20, .parent_type =3D IRQ_TYPE_LEVEL_H=
IGH },
> +	{ .hwirq =3D 4, .parent_hwirq =3D 21, .parent_type =3D IRQ_TYPE_LEVEL_H=
IGH },
> +	{ .hwirq =3D 5, .parent_hwirq =3D 22, .parent_type =3D IRQ_TYPE_LEVEL_H=
IGH },
> +	{ .hwirq =3D 6, .parent_hwirq =3D 23, .parent_type =3D IRQ_TYPE_LEVEL_H=
IGH },
> +	{ .hwirq =3D 7, .parent_hwirq =3D 24, .parent_type =3D IRQ_TYPE_LEVEL_H=
IGH },
> +	{ .hwirq =3D 8, .parent_hwirq =3D 25, .parent_type =3D IRQ_TYPE_LEVEL_H=
IGH },
> +	{ .hwirq =3D 9, .parent_hwirq =3D 26, .parent_type =3D IRQ_TYPE_LEVEL_H=
IGH },
> +	{ .hwirq =3D 10, .parent_hwirq =3D 27, .parent_type =3D IRQ_TYPE_LEVEL_=
HIGH },
> +	{ .hwirq =3D 11, .parent_hwirq =3D 28, .parent_type =3D IRQ_TYPE_LEVEL_=
HIGH },
> +	{ .hwirq =3D 12, .parent_hwirq =3D 29, .parent_type =3D IRQ_TYPE_LEVEL_=
HIGH },

I think this is a good example of what I was referring to. There's no
easy way to represent this mapping in code, other than basically writing
up the table as a switch statement, or a couple of if/else clauses. But
if you have a large number of pins in the GPIO controller and they all
can be easily described by just a handful of lines of code, I think it'd
be nice to avoid all that extra data.

Thierry

>  };
> =20
>  static void ixp4xx_gpio_irq_ack(struct irq_data *d)
> @@ -187,122 +175,6 @@ static struct irq_chip ixp4xx_gpio_irqchip =3D {
>  	.irq_set_type =3D ixp4xx_gpio_irq_set_type,
>  };
> =20
> -static int ixp4xx_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
> -{
> -	struct ixp4xx_gpio *g =3D gpiochip_get_data(gc);
> -	struct irq_fwspec fwspec;
> -
> -	fwspec.fwnode =3D g->fwnode;
> -	fwspec.param_count =3D 2;
> -	fwspec.param[0] =3D offset;
> -	fwspec.param[1] =3D IRQ_TYPE_NONE;
> -
> -	return irq_create_fwspec_mapping(&fwspec);
> -}
> -
> -static int ixp4xx_gpio_irq_domain_translate(struct irq_domain *domain,
> -					    struct irq_fwspec *fwspec,
> -					    unsigned long *hwirq,
> -					    unsigned int *type)
> -{
> -	int ret;
> -
> -	/* We support standard DT translation */
> -	if (is_of_node(fwspec->fwnode) && fwspec->param_count =3D=3D 2) {
> -		return irq_domain_translate_twocell(domain, fwspec,
> -						    hwirq, type);
> -	}
> -
> -	/* This goes away when we transition to DT */
> -	if (is_fwnode_irqchip(fwspec->fwnode)) {
> -		ret =3D irq_domain_translate_twocell(domain, fwspec,
> -						   hwirq, type);
> -		if (ret)
> -			return ret;
> -		WARN_ON(*type =3D=3D IRQ_TYPE_NONE);
> -		return 0;
> -	}
> -	return -EINVAL;
> -}
> -
> -static int ixp4xx_gpio_irq_domain_alloc(struct irq_domain *d,
> -					unsigned int irq, unsigned int nr_irqs,
> -					void *data)
> -{
> -	struct ixp4xx_gpio *g =3D d->host_data;
> -	irq_hw_number_t hwirq;
> -	unsigned int type =3D IRQ_TYPE_NONE;
> -	struct irq_fwspec *fwspec =3D data;
> -	int ret;
> -	int i;
> -
> -	ret =3D ixp4xx_gpio_irq_domain_translate(d, fwspec, &hwirq, &type);
> -	if (ret)
> -		return ret;
> -
> -	dev_dbg(g->dev, "allocate IRQ %d..%d, hwirq %lu..%lu\n",
> -		irq, irq + nr_irqs - 1,
> -		hwirq, hwirq + nr_irqs - 1);
> -
> -	for (i =3D 0; i < nr_irqs; i++) {
> -		struct irq_fwspec parent_fwspec;
> -		const struct ixp4xx_gpio_map *map;
> -		int j;
> -
> -		/* Not all lines support IRQs */
> -		for (j =3D 0; j < ARRAY_SIZE(ixp4xx_gpiomap); j++) {
> -			map =3D &ixp4xx_gpiomap[j];
> -			if (map->gpio_offset =3D=3D hwirq)
> -				break;
> -		}
> -		if (j =3D=3D ARRAY_SIZE(ixp4xx_gpiomap)) {
> -			dev_err(g->dev, "can't look up hwirq %lu\n", hwirq);
> -			return -EINVAL;
> -		}
> -		dev_dbg(g->dev, "found parent hwirq %u\n", map->parent_hwirq);
> -
> -		/*
> -		 * We set handle_bad_irq because the .set_type() should
> -		 * always be invoked and set the right type of handler.
> -		 */
> -		irq_domain_set_info(d,
> -				    irq + i,
> -				    hwirq + i,
> -				    &ixp4xx_gpio_irqchip,
> -				    g,
> -				    handle_bad_irq,
> -				    NULL, NULL);
> -		irq_set_probe(irq + i);
> -
> -		/*
> -		 * Create a IRQ fwspec to send up to the parent irqdomain:
> -		 * specify the hwirq we address on the parent and tie it
> -		 * all together up the chain.
> -		 */
> -		parent_fwspec.fwnode =3D d->parent->fwnode;
> -		parent_fwspec.param_count =3D 2;
> -		parent_fwspec.param[0] =3D map->parent_hwirq;
> -		/* This parent only handles asserted level IRQs */
> -		parent_fwspec.param[1] =3D IRQ_TYPE_LEVEL_HIGH;
> -		dev_dbg(g->dev, "alloc_irqs_parent for %d parent hwirq %d\n",
> -			irq + i, map->parent_hwirq);
> -		ret =3D irq_domain_alloc_irqs_parent(d, irq + i, 1,
> -						   &parent_fwspec);
> -		if (ret)
> -			dev_err(g->dev,
> -				"failed to allocate parent hwirq %d for hwirq %lu\n",
> -				map->parent_hwirq, hwirq);
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct irq_domain_ops ixp4xx_gpio_irqdomain_ops =3D {
> -	.translate =3D ixp4xx_gpio_irq_domain_translate,
> -	.alloc =3D ixp4xx_gpio_irq_domain_alloc,
> -	.free =3D irq_domain_free_irqs_common,
> -};
> -
>  static int ixp4xx_gpio_probe(struct platform_device *pdev)
>  {
>  	unsigned long flags;
> @@ -406,49 +278,20 @@ static int ixp4xx_gpio_probe(struct platform_device=
 *pdev)
>  			return -ENODEV;
>  		}
>  	}
> -	g->domain =3D irq_domain_create_hierarchy(parent,
> -						IRQ_DOMAIN_FLAG_HIERARCHY,
> -						ARRAY_SIZE(ixp4xx_gpiomap),
> -						g->fwnode,
> -						&ixp4xx_gpio_irqdomain_ops,
> -						g);
> -	if (!g->domain) {
> -		irq_domain_free_fwnode(g->fwnode);
> -		dev_err(dev, "no hierarchical irq domain\n");
> -		return ret;
> -	}
> =20
> -	/*
> -	 * After adding OF support, this is no longer needed: irqs
> -	 * will be allocated for the respective fwnodes.
> -	 */
> -	if (!np) {
> -		for (i =3D 0; i < ARRAY_SIZE(ixp4xx_gpiomap); i++) {
> -			const struct ixp4xx_gpio_map *map =3D &ixp4xx_gpiomap[i];
> -			struct irq_fwspec fwspec;
> -
> -			fwspec.fwnode =3D g->fwnode;
> -			/* This is the hwirq for the GPIO line side of things */
> -			fwspec.param[0] =3D map->gpio_offset;
> -			fwspec.param[1] =3D IRQ_TYPE_EDGE_RISING;
> -			fwspec.param_count =3D 2;
> -			ret =3D __irq_domain_alloc_irqs(g->domain,
> -						      -1, /* just pick something */
> -						      1,
> -						      NUMA_NO_NODE,
> -						      &fwspec,
> -						      false,
> -						      NULL);
> -			if (ret < 0) {
> -				irq_domain_free_fwnode(g->fwnode);
> -				dev_err(dev,
> -					"can not allocate irq for GPIO line %d parent hwirq %d in hierarchy=
 domain: %d\n",
> -					map->gpio_offset, map->parent_hwirq,
> -					ret);
> -				return ret;
> -			}
> -		}
> -	}
> +	g->gc.irq.fwnode =3D g->fwnode;
> +	g->gc.irq.parent_domain =3D parent;
> +	g->gc.irq.parent_irq_map =3D &ixp4xx_gpiomap;
> +	g->gc.irq.parent_n_irq_maps =3D ARRAY_SIZE(ixp4xx_gpiomap);
> +	ret =3D gpiochip_irqchip_add(&g->gc, &ixp4xx_gpio_irqchip,
> +				   0, handle_bad_irq,
> +				   IRQ_TYPE_NONE);
> +        if (ret) {
> +		dev_info(dev, "could not add irqchip\n");
> +		irq_domain_free_fwnode(g->fwnode);
> +		return -ENODEV;
> +        }
> +	gpiochip_set_hierarchical_irqchip(&g->gc, &ixp4xx_gpio_irqchip);
> =20
>  	platform_set_drvdata(pdev, g);
>  	dev_info(dev, "IXP4 GPIO @%p registered\n", g->base);
> --=20
> 2.20.1
>=20

--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz05YEACgkQ3SOs138+
s6GcUxAAkLFyBCH18jg092WwEJCgNqKrfJ0ZbEFi6kpSCBglMtTHlibI3F5+u3ov
rzcF5fLA/1lweNou/7yLNp5ZSTRgwmaP7agW9p7FQFn9rdOh9bvobvULBMhOOAi7
hWg8OIzmhkT9xBqrarVsk1FIIOtLwnBmH7ylNp8yrPcgEhAhjw0TjYRKEIkQpxf0
ElP349yH+jeXZIVN1Qj5uwzJx3aKdf21+MfD77SrmvKmL3p6tjA0ws+i/KZ0P/OX
0iJiCMDPda9jL86NG6btfz4fw4YquXUkcJN7aUAmhiDljT5OSFQWMobYMsuPjsFm
Xa0WBvNob+YgoqesBwmZ+XthDCHRZhZMfagk7qnHGrLdwKJxDscrh4ghupBLzjYi
aLQLDRpr3MfKRkuHhZbmo4GWvIX6WzyybjJrSxmYfByaZkRVt4fnGwvSQ6ApLgO0
2xFSQhz1ODKrlV45o5CUZR/+bHeDsW+hfmZFEQ7TiJUCRHmM7zBtB39/LHNYbVWs
XhCS23H2H2ZkKKuosPv3jGC0Z3M6cuh/B0OEv1sawfBiJrekmggTFi5m+5QMs5nR
D1oLmYQbKGl9wdgvrQuFfUzFcy7TYd5+exJEZKjff5S220ys0snPmo1r4/Er2VKa
bMyHngmT8hNs+pK57CA1p9VSjNqRLLiB/89Jz35ARLokbJ2G3AQ=
=/JU+
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
