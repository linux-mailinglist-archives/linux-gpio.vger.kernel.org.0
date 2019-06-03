Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1117832BB3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 11:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfFCJKx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 05:10:53 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41868 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728208AbfFCJKw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 05:10:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so11175197wrm.8;
        Mon, 03 Jun 2019 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sSu/LI0eYrghSZNwIxUvOZf+OGOeFPKwnTQzfHCA0VE=;
        b=GY6EznX6itCHpJM/kR/DJywaRLRzpR8eWyaiZjdRknxwmo574UpiO0LRK5fEX4kig0
         Oq3k1jGpZKm6VtrouQJwkt+x5u1Gl3KQPBJq893nTvLZsvuhxIAkjrvmMwOxsiXIDxLf
         2MuviThITV71+d+f/1mYwS8xZf6XqRSziKWWLGnVRGTo5iaENaiE4/KZhO5IByXzBHfh
         UD9V2iU4TG6cJJsAFs/02yPDrnkiuiEbva5KGd1zVXCcypnKnyO6Cg/IIVt+kKt2xmXc
         eNRp/zyNPSKmtLab4QUlx3TzDZmf1UnB2+AEKp4P0Q0N9oMTuKBSeTzqf/TjwNwqgdYd
         rm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sSu/LI0eYrghSZNwIxUvOZf+OGOeFPKwnTQzfHCA0VE=;
        b=HTQ6zdLDk0/XOYE0KGP/5hCAZjAfRlFh4pbehFJ/EUz4Kr24tuptyFFpGfHDzLOm+A
         XGCOq4zSUdm2bfC2VvXGT7jX6dsqzzqCjn/C821odoaInshagtR7BjpW1cQWXF2RLKDo
         OIX9EljNkorZysKjrUzGwXLHYiPqwQ8wt/FmoDGwaqTFiCb6ml1/2ADDns+YUmokeUPy
         FyVk6TA1gzIw7x3GSZ5N5n4TMOS9Z3kaMnP23Llt446pMTNbcbHUDriPr51Hv9q3CNQv
         CngZM6Fvrkfov/FZM7D+4bYKMOWOcytMQKHcEF3biuG2vZGGpK8crcLxfqoBXBahu2kG
         A1Dw==
X-Gm-Message-State: APjAAAWWxuFoRR61PZzUWPqBttT1c9KMY0Am8dQnj4h6wwkmbanF0Ntg
        EjM1K75b5cSG3uw7+Fltznc=
X-Google-Smtp-Source: APXvYqyQCN6wJ3qD9DLKqBmJhbRzVS+sGMJCJoNXB0uF6DRcd+SNVnR/tEC7oB8VNpN/wV7K2mSamA==
X-Received: by 2002:a5d:624c:: with SMTP id m12mr1544176wrv.354.1559553048035;
        Mon, 03 Jun 2019 02:10:48 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id s13sm9861100wmh.31.2019.06.03.02.10.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 02:10:46 -0700 (PDT)
Date:   Mon, 3 Jun 2019 11:10:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/2] RFC: gpio: Add support for hierarchical IRQ domains
Message-ID: <20190603091045.GC27753@ulmo>
References: <20190602205424.28674-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline
In-Reply-To: <20190602205424.28674-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2019 at 10:54:23PM +0200, Linus Walleij wrote:
> Hierarchical IRQ domains can be used to stack different IRQ
> controllers on top of each other.
>=20
> Bring hierarchical IRQ domains into the GPIOLIB core with the
> following basic idea:
>=20
> Drivers that need their interrupts handled hierarchically
> specify a map of one element per interrupt where the hwirq
> on the GPIO chip is mapped to the hwirq on the parent irqchip
> along with type. Users have to pass the interrupt map, fwnode,
> and parent irqdomain before calling gpiochip_irqchip_add().
> The consumer will then call gpiochio_set_hierarchical_irqchip()
> analogous to the earlier functions for chained and nested
> irqchips.
>=20
> The code path for device tree is pretty straight-forward,
> while the code path for old boardfiles or anything else will
> be more convoluted requireing upfront allocation of the
> interrupts when adding the chip.
>=20
> One specific use-case where this can be useful is if a power
> management controller has top-level controls for wakeup
> interrupts. In such cases, the power management controller can be a
> parent to other interrupt controllers and program additional
> registers when an IRQ has its wake capability enabled or disabled.
>=20
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
> Cc: Bitan Biswas <bbiswas@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This is my idea for deeper integration of hierarchical irqs
> into the gpiolib core. Admittedly based on my own IXP4xx
> driver which is provided as an example conversion in
> patch 2/2, let me know what you think. Based on heavy patching
> on top of Thierry's patch, not mangled beyond recognition,
> sorry for that, I just wanted to convey my idea here.
> ---
>  drivers/gpio/Kconfig        |   1 +
>  drivers/gpio/gpiolib.c      | 218 ++++++++++++++++++++++++++++++++++--
>  include/linux/gpio/driver.h |  54 +++++++++
>  3 files changed, 266 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 3d17d40fa635..23a121c2e176 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -45,6 +45,7 @@ config GPIO_ACPI
> =20
>  config GPIOLIB_IRQCHIP
>  	select IRQ_DOMAIN
> +	select IRQ_DOMAIN_HIERARCHY
>  	bool
> =20
>  config DEBUG_GPIO
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e013d417a936..f976e95e54f5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1718,6 +1718,175 @@ void gpiochip_set_nested_irqchip(struct gpio_chip=
 *gpiochip,
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
> =20
> +/**
> + * gpiochip_set_hierarchical_irqchip() - connects a hierarchical irqchip
> + * to a gpiochip
> + * @gpiochip: the gpiochip to set the irqchip hierarchical handler to
> + * @irqchip: the irqchip to handle this level of the hierarchy, the inte=
rrupt
> + * will then percolate up to the parent
> + */
> +void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gpiochip,
> +				       struct irq_chip *irqchip)
> +{
> +	if (!gpiochip->irq.domain) {
> +		chip_err(gpiochip, "called %s before setting up irqchip\n",
> +			 __func__);
> +		return;
> +	}
> +	if (!gpiochip->irq.parent_domain) {
> +		chip_err(gpiochip, "tried to create a hierarchy on non-hierarchical GP=
IO irqchip\n");
> +		return;
> +	}
> +	/* DT will deal with mapping each IRQ as we go along */
> +	if (is_of_node(gpiochip->irq.fwnode))
> +		return;
> +
> +	/*
> +	 * This is for legacy and boardfile "irqchip" fwnodes: allocate
> +	 * irqs upfront instead of dynamically since we don't have the
> +	 * dynamic type of allocation that hardware description languages
> +	 * provide.
> +	 */
> +	if (is_fwnode_irqchip(gpiochip->irq.fwnode)) {

I wonder if this is really necessary. From the below it looks like you
bake in a bunch of assumptions just to make this sort of work, but do we
really need this for boardfile support? Or at least, perhaps let drivers
that require the legacy support carry that burden rather than have this
code in gpiolib?

> +		int i;
> +		int ret;
> +
> +		for (i =3D 0; i < gpiochip->irq.parent_n_irq_maps; i++) {
> +			const struct gpiochip_hierarchy_map *map =3D
> +				&gpiochip->irq.parent_irq_map[i];
> +			struct irq_fwspec fwspec;
> +
> +			fwspec.fwnode =3D gpiochip->irq.fwnode;
> +			/* This is the hwirq for the GPIO line side of things */
> +			fwspec.param[0] =3D map->hwirq;
> +			/* Just pick something */
> +			fwspec.param[1] =3D IRQ_TYPE_EDGE_RISING;
> +			fwspec.param_count =3D 2;

Again, this is baking in twocell as the only option. I'm not sure that
makes this code really that useful.

> +			ret =3D __irq_domain_alloc_irqs(gpiochip->irq.domain,
> +						      /* just pick something */
> +						      -1,
> +						      1,
> +						      NUMA_NO_NODE,
> +						      &fwspec,
> +						      false,
> +						      NULL);
> +			if (ret < 0) {
> +				chip_err(gpiochip,
> +					 "can not allocate irq for GPIO line %d parent hwirq %d in hierarch=
y domain: %d\n",
> +					 map->hwirq, map->parent_hwirq,
> +					 ret);
> +			}
> +		}
> +	}
> +
> +	chip_err(gpiochip, "%s unknown fwnode type proceed anyway\n", __func__);
> +
> +	return;
> +}
> +EXPORT_SYMBOL_GPL(gpiochip_set_hierarchical_irqchip);
> +
> +static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
> +						   struct irq_fwspec *fwspec,
> +						   unsigned long *hwirq,
> +						   unsigned int *type)
> +{
> +	/* We support standard DT translation */
> +	if (is_of_node(fwspec->fwnode) && fwspec->param_count =3D=3D 2) {
> +		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> +	}
> +
> +	/* This is for board files and others not using DT */
> +	if (is_fwnode_irqchip(fwspec->fwnode)) {
> +		int ret;
> +
> +		ret =3D irq_domain_translate_twocell(d, fwspec, hwirq, type);
> +		if (ret)
> +			return ret;
> +		WARN_ON(*type =3D=3D IRQ_TYPE_NONE);
> +		return 0;
> +	}
> +	return -EINVAL;
> +}

This is also hard-coding the simple two-cell variant, which makes this
very inflexible and useful only to a subset (though, admittedly, a very
large subset) of drivers.

> +
> +static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
> +					       unsigned int irq,
> +					       unsigned int nr_irqs,
> +					       void *data)
> +{
> +	struct gpio_chip *chip =3D d->host_data;
> +	irq_hw_number_t hwirq;
> +	unsigned int type =3D IRQ_TYPE_NONE;
> +	struct irq_fwspec *fwspec =3D data;
> +	int ret;
> +	int i;
> +
> +	ret =3D gpiochip_hierarchy_irq_domain_translate(d, fwspec, &hwirq, &typ=
e);
> +	if (ret)
> +		return ret;

I think you technically need to translate each of nr_irqs interrupts to
make sure you deal properly with holes. irq_domain_translate() really
only operates on a single interrupt at a time, so it doesn't know that
the result will be used as the beginning of a linear range of
interrupts. I don't think that's generally safe to do.

On the other hand, in order to allocate multiple interrupts in a single
call, you'd then have to somehow modify fwspec for each iteration, and
gpiolib just doesn't have the knowledge how to do so in order to get at
the next valid set of parameters in fwspec.

So perhaps the best way for now would be to restrict this to cases where
a single IRQ is allocated? I haven't come across a case where we need
more than one, so maybe that's good enough for now? Seems better to me
to fail in such cases so that we can properly fix them, rather than
potentially allocate multiple interrupts, some of which may not be at
all what the user expected.

> +
> +	chip_info(chip, "allocate IRQ %d..%d, hwirq %lu..%lu\n",
> +		  irq, irq + nr_irqs - 1,
> +		  hwirq, hwirq + nr_irqs - 1);

Eventually perhaps this should be chip_dbg()?

> +
> +	for (i =3D 0; i < nr_irqs; i++) {
> +		struct irq_fwspec parent_fwspec;
> +		const struct gpiochip_hierarchy_map *map =3D NULL;
> +		int j;
> +
> +		/* Find the map, maybe not all lines support IRQs */
> +		for (j =3D 0; j < chip->irq.parent_n_irq_maps; j++) {
> +			map =3D &chip->irq.parent_irq_map[j];
> +			if (map->hwirq =3D=3D hwirq)
> +				break;
> +		}
> +		if (j =3D=3D chip->irq.parent_n_irq_maps) {
> +			chip_err(chip, "can't look up hwirq %lu\n", hwirq);
> +			return -EINVAL;
> +		}
> +		chip_dbg(chip, "found parent hwirq %u\n", map->parent_hwirq);

I kind of dislike the type of map that we need to build here. For the
Tegra case specifically, we already need to create a "valid IRQ map" in
order to make it comply strictly with twocell unless we keep the
possibility to override various callbacks in the drivers. In this case
we would need to generate yet another mapping.

I can see how this map would be advantageous if it is for a small number
of GPIOs and interrupts, or if the mapping is more or less arbitrary. In
case of Tegra it's trivial to do the mapping in code for both of the
above cases (we can actually use the exact same code for the two
mappings, but we could not easily use the same data for the different
purposes).

But perhaps there's some compromise still. What if, for example, we
added a new callback to struct gpio_irq_chip that would allow us to do
basically the reverse of irq_domain_ops.translate? We could make the
code accept either the fixed mapping for cases where that's sensible, or
allow it to fall back to using irq_domain_ops.translate() and
gpio_irq_chip.translate() to map using code at runtime.

I think that would also allow me to use this code without having to
override the gpiochip_to_irq() from gpiolib, because that's the only
other place (in addition to here) where I need to do that conversion.

> +		/*
> +		 * We set handle_bad_irq because the .set_type() should
> +		 * always be invoked and set the right type of handler.
> +		 */
> +		irq_domain_set_info(d,
> +				    irq + i,
> +				    hwirq + i,
> +				    chip->irq.chip,
> +				    chip,
> +				    handle_bad_irq,
> +				    NULL, NULL);
> +		irq_set_probe(irq + i);
> +
> +		/*
> +		 * Create a IRQ fwspec to send up to the parent irqdomain:
> +		 * specify the hwirq we address on the parent and tie it
> +		 * all together up the chain.
> +		 */
> +		parent_fwspec.fwnode =3D d->parent->fwnode;
> +		parent_fwspec.param_count =3D 2;
> +		parent_fwspec.param[0] =3D map->parent_hwirq;
> +		/* This parent only handles asserted level IRQs */
> +		parent_fwspec.param[1] =3D map->parent_type;

Basically for Tegra I imagine something like this:

	if (chip->irq.translate)
		chip->irq.translate(&chip->irq, &parent_fwspec, hwirq + i, type);

Incidentally, parent_fwspec in the Tegra case would yield the same thing
as fwspec because that's how the bindings are defined. For other drivers
it might make sense for it to return something different.

Come to think of it, I think having that backwards-translate callback
would allow us to get rid of the issue with non-linear mappings, that I
mentioned above, as well. With one restriction, that is: the GPIO number
space has to be assumed to be linear. In that case the
irq_domain_ops.translate() would convert from whatever the external
representation is to the linear, no-holes, internal representation of
the GPIO chip (hence hwirq + i would do the right thing with regards to
multiple IRQs being allocated) and then gpio_irq_chip.translate() would
convert from that internally linear representation to the external one
again, taking care of any holes if necessary.

As a concrete example, on Tegra we could have the following situation:
GPIO A.00-A.06 and B.00-B.06 are numbered like this:

    GPIO   DT  pin
    --------------
    A.00    0    0
    A.01    1    1
    A.02    2    2
    A.03    3    3
    A.04    4    4
    A.05    5    5
    A.06    6    6

    B.00    8    7
    B.01    9    8
    B.02   10    9
    B.03   11   10
    B.04   12   11
    B.05   13   12
    B.06   14   13

The DT binding is basically a historical "accident" because the GPIO
controller used to have 8 pins per port, so we use macros to describe
the second cell in the DT specifier and they simply multiply the port
index by 8 to get the GPIO base offset for a given port. But I think
you're familiar with that already from our earlier discussions on this.

irq_domain_ops.translate() translates from the DT column above to the
pin column, which is the linear (no-holes) space that I was referring
to. gpio_irq_chip.translate() would go from the pin to the DT column.
That's got a nice symmetry to it.

So now for your RFC code this would not work if you get the following
fwspec and nr_irqs =3D 2:

    fwspec.param[0] =3D 6;

Because it will try to allocate conceptually for A.06 and A.07, when
there's actually no A.07. That works at least partially already because
the code assumes that the internal number space is linear and does not
have holes. But if you want to properly take care of holes by calling
irq_domain_translate() for each iteration of the loop, then it won't
work because it can't figure out what fwspec should be on subsequent
iterations. However, we could achieve that by modifying fwspec like this
at the end of the loop:

	if (chip->irq.translate)
		chip->irq.translate(&chip->irq, &fwspec, hwirq + 1, type);

and then call:

	ret =3D irq_domain_translate(d, fwspec, &hwirq, &type);

like you do, but instead within each iteration and it should always give
us the right hwirq and type for each iteration. That said, I think
that's the correct solution, though in practice it may be splitting
hairs and things may work the way you wrote them as well if use-cases
don't get too exotic.

> +		chip_dbg(chip, "alloc_irqs_parent for %d parent hwirq %d\n",
> +			 irq + i, map->parent_hwirq);
> +		ret =3D irq_domain_alloc_irqs_parent(d, irq + i, 1,
> +						   &parent_fwspec);
> +		if (ret)
> +			chip_err(chip,
> +				 "failed to allocate parent hwirq %d for hwirq %lu\n",
> +				 map->parent_hwirq, hwirq);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops gpiochip_hierarchy_domain_ops =3D {
> +	.translate =3D gpiochip_hierarchy_irq_domain_translate,
> +	.alloc =3D gpiochip_hierarchy_irq_domain_alloc,
> +	.free =3D irq_domain_free_irqs_common,
> +};
> +
>  /**
>   * gpiochip_irq_map() - maps an IRQ into a GPIO irqchip
>   * @d: the irqdomain used by this irqchip
> @@ -1825,10 +1994,23 @@ EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
> =20
>  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
> +	struct irq_domain *domain =3D chip->irq.domain;
> +
>  	if (!gpiochip_irqchip_irq_valid(chip, offset))
>  		return -ENXIO;
> =20
> -	return irq_create_mapping(chip->irq.domain, offset);
> +	if (irq_domain_is_hierarchy(domain)) {
> +		struct irq_fwspec spec;
> +
> +		spec.fwnode =3D domain->fwnode;
> +		spec.param_count =3D 2;
> +		spec.param[0] =3D offset;
> +		spec.param[1] =3D IRQ_TYPE_NONE;

This is that place where the gpio_irq_chip.translate() callback would be
useful. It would allow everyone to use the standard gpiochip_to_irq()
function and only use the callback to do the translation from external
to internal number representation.

	if (chip->irq.translate) {
		err =3D chip->irq.translate(domain, &spec, offset, IRQ_TYPE_NONE);
		if (err < 0)
			return err;
	} else {
		/* your default implementation */
	}

> +
> +		return irq_create_fwspec_mapping(&spec);
> +	}
> +
> +	return irq_create_mapping(domain, offset);
>  }
> =20
>  static int gpiochip_irq_reqres(struct irq_data *d)
> @@ -1905,7 +2087,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *g=
piochip,
>  				struct lock_class_key *request_key)
>  {
>  	struct irq_chip *irqchip =3D gpiochip->irq.chip;
> -	const struct irq_domain_ops *ops;
> +	const struct irq_domain_ops *ops =3D NULL;
>  	struct device_node *np;
>  	unsigned int type;
>  	unsigned int i;
> @@ -1941,14 +2123,36 @@ static int gpiochip_add_irqchip(struct gpio_chip =
*gpiochip,
>  	gpiochip->irq.lock_key =3D lock_key;
>  	gpiochip->irq.request_key =3D request_key;
> =20
> +	/* Some drivers provide custom irqdomain ops */
>  	if (gpiochip->irq.domain_ops)
>  		ops =3D gpiochip->irq.domain_ops;
> -	else
> -		ops =3D &gpiochip_domain_ops;
> =20
> -	gpiochip->irq.domain =3D irq_domain_add_simple(np, gpiochip->ngpio,
> -						     gpiochip->irq.first,
> -						     ops, gpiochip);
> +	/* If a parent irqdomain is provided, let's build a hierarchy */
> +	if (gpiochip->irq.parent_domain) {
> +		if (!ops)
> +			ops =3D &gpiochip_hierarchy_domain_ops;
> +		if (!gpiochip->irq.parent_domain ||
> +		    !gpiochip->irq.parent_irq_map ||
> +		    !gpiochip->irq.parent_n_irq_maps ||
> +		    !gpiochip->irq.fwnode) {
> +			chip_err(gpiochip, "missing irqdomain vital data\n");
> +			return -EINVAL;
> +		}
> +		gpiochip->irq.domain =3D irq_domain_create_hierarchy(
> +			gpiochip->irq.parent_domain,
> +			IRQ_DOMAIN_FLAG_HIERARCHY,
> +			gpiochip->irq.parent_n_irq_maps,
> +			gpiochip->irq.fwnode,
> +			ops,
> +			gpiochip);
> +	} else {
> +		if (!ops)
> +			ops =3D &gpiochip_domain_ops;
> +		gpiochip->irq.domain =3D irq_domain_add_simple(np,
> +			gpiochip->ngpio,
> +			gpiochip->irq.first,
> +			ops, gpiochip);
> +	}
>  	if (!gpiochip->irq.domain)
>  		return -EINVAL;
> =20
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index a1d273c96016..65193878a0e1 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -22,6 +22,21 @@ enum gpiod_flags;
>  #ifdef CONFIG_GPIOLIB
> =20
>  #ifdef CONFIG_GPIOLIB_IRQCHIP
> +
> +/**
> + * struct gpiochip_hierarchy_map - hierarchical IRQ GPIO to parent IRQ m=
ap
> + * @hwirq: offset of the GPIO line (irq line) locally on the gpio_chip
> + * @parent_hwirq: hwirq on the parent IRQ controller that this local har=
dware
> + * irq is mapped to
> + * @parent_type: what type of IRQ the parent uses for this line, such
> + * as most typical IRQ_TYPE_LEVEL_HIGH.
> + */
> +struct gpiochip_hierarchy_map {
> +	int hwirq;
> +	int parent_hwirq;

Hardware interrupt numbers are usually unsigned long.

> +	unsigned int parent_type;
> +};
> +
>  /**
>   * struct gpio_irq_chip - GPIO interrupt controller
>   */
> @@ -48,6 +63,42 @@ struct gpio_irq_chip {
>  	 */
>  	const struct irq_domain_ops *domain_ops;
> =20
> +	/**
> +	 * @fwnode:
> +	 *
> +	 * Firmware node corresponding to this gpiochip/irqchip, necessary
> +	 * for hierarchical irqdomain support.
> +	 */
> +	struct fwnode_handle *fwnode;
> +
> +	/**
> +	 * @parent_domain:
> +	 *
> +	 * If non-NULL, will be set as the parent of this GPIO interrupt
> +	 * controller's IRQ domain to establish a hierarchical interrupt
> +	 * domain. The presence of this will activate the hierarchical
> +	 * interrupt support.
> +	 */
> +	struct irq_domain *parent_domain;
> +
> +	/**
> +	 * @parent_irq_map:
> +	 *
> +	 * This should contain an array defining the maps between any hardware
> +	 * GPIO line on the gpio_chip and the corresponding hardware IRQ on the
> +	 * parent IRQ controller (irqchip) and the parent IRQ type for the
> +	 * line when using hierarchical interrupts.
> +	 */
> +	const struct gpiochip_hierarchy_map *parent_irq_map;
> +
> +	/**
> +	 * @parent_n_irq_maps:
> +	 *
> +	 * The number of parent irq map tuples in the array above, used for
> +	 * hierarchical interrupt support.
> +	 */
> +	int parent_n_irq_maps;
> +

Overall I think this should work for Tegra. Ideally, like I said, this
parent IRQ map would be optional and we would allow drivers to compute
the mapping at runtime where reasonable. Generating a lot of data
upfront would also work, but it seems rather redundant to have to
generate a large table with over 200 entries for what's essentially a
trivial mapping that can be expressed with just a handful of lines of
code.

Thierry

>  	/**
>  	 * @handler:
>  	 *
> @@ -489,6 +540,9 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gp=
iochip,
>  		struct irq_chip *irqchip,
>  		unsigned int parent_irq);
> =20
> +void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gpiochip,
> +				       struct irq_chip *irqchip);
> +
>  int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
>  			     struct irq_chip *irqchip,
>  			     unsigned int first_irq,
> --=20
> 2.20.1
>=20

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz05BMACgkQ3SOs138+
s6E94A//RzJKM5BKjF5geHNQ6P7/w3cprjBr8vs6UqpxiJ6nGOrtLnwQeXPmb/6/
lY4eIQFh5U5hQVbQTQHqztISVy1DYyhRk5W00liZxAb/qvcArYRUHnUYQbwv97gg
iO9e8Of2Aak6EoG8G8ai8c3SW2NIYMbj9m5iJ318xVA3Duqpv0scWixlWLfK5cja
Qx7+dPWzYVjIg1+rh4BLGnexwLHLbUQl7dbB46QFldAI5d+xB+KvlctO+Q8B6meT
M8TG8+JRHOOvTJEaJeIoQZ1jsExvOYplUQ6B+nbjUAlSLoQ6I5LwDhr3Mxj4iDNc
f46AWAEgW85amE/YqHyI3Z+n79CONCDGzPLgEiB+hvavpBkCPWdwCapkg0h1qHeF
jldd1+TUWY5MJ9bHQd5lNGEtXbDAuXk+uGsXUJXBeJmutrBkjdDGxIXJtZEuat8J
EM9dOfzus747rBkt6lCvFWW9O6yQCvyTCr4n21dPlPORwEDURuN57HwRKTGa4nfR
KJg9TDlXiVb9yplkLAxhAzv7eec2rPMP31gqzsRoCd4UPo4OZAFFeavgDCy0AK+8
ri5TpJDD4UI3FDAvLhwvVHqOQInOjvTf5ngO2ypIM69X9kSu+Q5O2C1AFG0C5sMf
DNTu7YbcEU0U2C6bwHSXoTaOojjzo9uk4V49UZTVG1Yobl+62M4=
=nmfB
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
