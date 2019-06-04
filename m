Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8EC734766
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 14:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfFDM6m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 08:58:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52356 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbfFDM6l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 08:58:41 -0400
Received: by mail-wm1-f66.google.com with SMTP id s3so7443953wms.2;
        Tue, 04 Jun 2019 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nWX2s8M4s4Dwsxd2pj4eP+Yg/ipuLmL3ti1dQ8WfCXs=;
        b=K9LqerwNAS45N/MIIUnVfsfbFXXBsOhVqZKw8/AMCOU1pUvfVFY7VH+OHAVinjI/Q9
         pM8DlY5v9lLMAGMCapjoUCDCDYJSi30LB0yJSj3PFaPlkKX8KF58IeV9LCxFGK92W8xX
         BmZ9YYOf1gCHq9rbqgR/dxaSWHPX6kCcLgukdBveg5Y7M8WVQ5rsyzIjJJZ8XiX8NDSI
         pdkYAnzb9WQVQOsV78k8vX+g6BUmEUfFsEAvYhLOFetGiBLuNWJ14EyR26bkBp1BEOps
         iHImW0jkUN2Cs3WAw8QHi2n6uhmjdQIoZ8iwgvLatcSzV4clI4nFZOKat3vAFVd65kkv
         f7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nWX2s8M4s4Dwsxd2pj4eP+Yg/ipuLmL3ti1dQ8WfCXs=;
        b=OvPmP12+GR1jIAdmxNapgRyD6h3KdLSR7vkKpkB3ahQENG579QetA0gZE+//wStDLD
         PUv2VS2TeXDNRklJhJuHCaNHa3xWfHXEDhs4leby6zwh5UXc/HYPs8rkFiTVof5+Xf33
         M+BNugYGDEjygWSNM0xgJhCprTvytVGt+iXgsfTZBtpPsWUx2SYcAGQTWrR6U+A9cPFw
         XxtwWRwhAZ8bi3co1pKGwmKUURIchLRhh3V9g0fnh1OfR50EFx0pg7ATAGrtEsi063gQ
         +NrbPeOZwauMnN552G1sz/DLwc3MixYZeFTG5i243lPym97CcacJIjWMt/0i5Acl54v+
         dP0w==
X-Gm-Message-State: APjAAAVENBHx40tzc8IkKL+f+uX6L4aMlamWEjJsKRvS/18NL61I53E9
        XfQ/lFrmfXU0VwO3/1c/adY=
X-Google-Smtp-Source: APXvYqwLnKNmhvUmCibLNO1ldCynB0KhQOMm2yXvvBd17XqOfB94Ck6944bpULI6tpwMQxpSO7lCow==
X-Received: by 2002:a1c:a544:: with SMTP id o65mr18085300wme.84.1559653116494;
        Tue, 04 Jun 2019 05:58:36 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id f24sm15348344wmb.16.2019.06.04.05.58.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 05:58:35 -0700 (PDT)
Date:   Tue, 4 Jun 2019 14:58:34 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/2] RFC: gpio: Add support for hierarchical IRQ domains
Message-ID: <20190604125834.GQ16519@ulmo>
References: <20190602205424.28674-1-linus.walleij@linaro.org>
 <20190603091045.GC27753@ulmo>
 <CACRpkda9AMOpLq=02qw_q9Kkr1osiLz3F=ikFATKCj5u84K2Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2D20dG0OqTzqkNh7"
Content-Disposition: inline
In-Reply-To: <CACRpkda9AMOpLq=02qw_q9Kkr1osiLz3F=ikFATKCj5u84K2Bw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--2D20dG0OqTzqkNh7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 07:06:04PM +0200, Linus Walleij wrote:
> On Mon, Jun 3, 2019 at 11:10 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> > On Sun, Jun 02, 2019 at 10:54:23PM +0200, Linus Walleij wrote:
>=20
> > > +     if (is_fwnode_irqchip(gpiochip->irq.fwnode)) {
> >
> > I wonder if this is really necessary. From the below it looks like you
> > bake in a bunch of assumptions just to make this sort of work, but do we
> > really need this for boardfile support? Or at least, perhaps let drivers
> > that require the legacy support carry that burden rather than have this
> > code in gpiolib?
>=20
> I think it is needed. Boardfiles have been predicted to disappear
> "soon" since 2011 or so, it's just not happening. The "irqchip" type
> of fwnode is there primarily for the ARM GIC which is used still
> in a number of boardfile systems, but this fwnode type is also
> necessary for migrating old boardfile systems over to device
> trees stepwise, as is shown by the IXP4xx example, and from
> a quick glance mach-iopX and mach-ks8695 also need
> hierarchical top level IRQ controllers and GPIO chips to be
> converted properly. And this is just for ARM. The situation for
> MIPS and all these x86 laptops seem even worse. (OK
> maybe I'm a bit overly pessimistic.)
>=20
> If footprint is the issue then we should really think twice before
> doing select IRQ_DOMAIN_HIERARCHY, because that is
> something that really brings in a big chunk of code, the
> few hundred lines that add irqchip fwnode support is nothing
> compared to that. Then we should #ifdef this stuff for
> hierarchical domains instead.
>=20
> > Again, this is baking in twocell as the only option. I'm not sure that
> > makes this code really that useful.
>=20
> It's been really useful so far, I don't really see a problem with that.
> It is what you need for Tegra too, right? The day someone makes
> a convincing case that the need something else than twocell
> we can alter the API simply. Onecell should be trivial to support.

Well, we use a modified twocell on Tegra. The problem is just that we
need to convert from a sparse number space in DT into a contiguous
number space as GPIO requires. Back when gpio-tegra186 was merged this
was done by compacting the number space in .of_xlate() and the IRQ
domain's .translate().

So I'm not arguing to get rid of twocell, I'm just saying that we could
make this completely flexible if we allowed the driver to specify one
additional callback. It's then easy to create a helper for the common
cases (such as regular twocell) but it also becomes a nobrainer to just
have drivers write their own conversion if they need to, without having
to make heavy changes to the gpiolib core everytime something different
is needed.

> > > +static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain=
 *d,
> > > +                                                struct irq_fwspec *f=
wspec,
> > > +                                                unsigned long *hwirq,
> > > +                                                unsigned int *type)
> > > +{
> > > +     /* We support standard DT translation */
> > > +     if (is_of_node(fwspec->fwnode) && fwspec->param_count =3D=3D 2)=
 {
> > > +             return irq_domain_translate_twocell(d, fwspec, hwirq, t=
ype);
> > > +     }
> > > +
> > > +     /* This is for board files and others not using DT */
> > > +     if (is_fwnode_irqchip(fwspec->fwnode)) {
> > > +             int ret;
> > > +
> > > +             ret =3D irq_domain_translate_twocell(d, fwspec, hwirq, =
type);
> > > +             if (ret)
> > > +                     return ret;
> > > +             WARN_ON(*type =3D=3D IRQ_TYPE_NONE);
> > > +             return 0;
> > > +     }
> > > +     return -EINVAL;
> > > +}
> >
> > This is also hard-coding the simple two-cell variant, which makes this
> > very inflexible and useful only to a subset (though, admittedly, a very
> > large subset) of drivers.
>=20
> Same comment. No big upfront design without users. I do not see
> how it would be hard to add support for more or less cells if need be.

The problem isn't with more or less cells. Specifically on Tegra we have
two cells, but they represent a sparse (i.e. non-contiguous) number
space. That's really the only difference.

> > > +     ret =3D gpiochip_hierarchy_irq_domain_translate(d, fwspec, &hwi=
rq, &type);
> > > +     if (ret)
> > > +             return ret;
> >
> > I think you technically need to translate each of nr_irqs interrupts to
> > make sure you deal properly with holes. irq_domain_translate() really
> > only operates on a single interrupt at a time, so it doesn't know that
> > the result will be used as the beginning of a linear range of
> > interrupts. I don't think that's generally safe to do.
>=20
> As long as we pass in the number of irqs to
> irq_domain_create_hierarchy() (and we do) we will get a
> linear irqdomain, so this is perfectly fine. Linear is ...
> well linear :D
>=20
> This is based on gicv2m_irq_domain_alloc() in
> drivers/irqchip/irq-gic-v2m.c and the same code appears in
> gic_irq_domain_alloc() in drivers/irqchip/irq-gic-v3.c
> so all the worlds contemporary ARM systems assume that
> irq_domain_translate() works this way, for the same reason:
> the domain is implicitly linear.

Okay. Yes, everything should be fine on that front, then.

> > > +     chip_info(chip, "allocate IRQ %d..%d, hwirq %lu..%lu\n",
> > > +               irq, irq + nr_irqs - 1,
> > > +               hwirq, hwirq + nr_irqs - 1);
> >
> > Eventually perhaps this should be chip_dbg()?
>=20
> Yeah I will kill most noisy prints once I can test this on
> real hardware the next week or so.
>=20
> > > +     for (i =3D 0; i < nr_irqs; i++) {
> > > +             struct irq_fwspec parent_fwspec;
> > > +             const struct gpiochip_hierarchy_map *map =3D NULL;
> > > +             int j;
> > > +
> > > +             /* Find the map, maybe not all lines support IRQs */
> > > +             for (j =3D 0; j < chip->irq.parent_n_irq_maps; j++) {
> > > +                     map =3D &chip->irq.parent_irq_map[j];
> > > +                     if (map->hwirq =3D=3D hwirq)
> > > +                             break;
> > > +             }
> > > +             if (j =3D=3D chip->irq.parent_n_irq_maps) {
> > > +                     chip_err(chip, "can't look up hwirq %lu\n", hwi=
rq);
> > > +                     return -EINVAL;
> > > +             }
> > > +             chip_dbg(chip, "found parent hwirq %u\n", map->parent_h=
wirq);
> >
> > I kind of dislike the type of map that we need to build here. For the
> > Tegra case specifically, we already need to create a "valid IRQ map" in
> > order to make it comply strictly with twocell unless we keep the
> > possibility to override various callbacks in the drivers. In this case
> > we would need to generate yet another mapping.
>=20
> Sorry about that, can we think of some nice way to unify them?
> Would it not be trivial to add a helper (possibly even static inline)
> to gpiolib that generates the irq.valid_mask from the
> struct gpiochip_hierarchy_map * that I'm suggesting?
>=20
> Possibly I should even make that the default behaviour when calling
> [devm_]gpiochip_add[_data]? That makes a bit of sense and
> pulls even more boilerplate into the core.

The point that I'm trying to argue is that rather than find a
complicated data structure that can represent all sorts of possible
mappings, it'd be much simpler to just write code that can map from
one to another.

Some things are just much easier to write in code than in data.

On Tegra for example, we use this code to compact the sparse DT number
space to the contiguous number space used by the GPIO chip:

	port =3D fwspec->param[0] / 8;
	pin =3D fwspec->param[0] % 8;

	for (i =3D 0; i < port; i++)
		offset +=3D gpio->soc->ports[i].pins;

	*hwirq =3D pin + offset;

This is an extract from the current Tegra186 GPIO driver, slightly
edited for readability. Now, to do the same thing in a data structure we
would have to represent pins individually so that they can be mapped to
their corresponding interrupts. Or you could add ranges, in which case
we need to still describe 23 ranges. And that's just for one instance of
the controller (though the second one is only about a third in size).

What makes this even more wasteful is that once we have the GPIO number
space (i.e. the contiguous one) after the above 5 lines of code, the
mapping between GPIOs and interrupts is actually 1:1.

> > I can see how this map would be advantageous if it is for a small number
> > of GPIOs and interrupts, or if the mapping is more or less arbitrary. In
> > case of Tegra it's trivial to do the mapping in code for both of the
> > above cases (we can actually use the exact same code for the two
> > mappings, but we could not easily use the same data for the different
> > purposes).
> >
> > But perhaps there's some compromise still. What if, for example, we
> > added a new callback to struct gpio_irq_chip that would allow us to do
> > basically the reverse of irq_domain_ops.translate? We could make the
> > code accept either the fixed mapping for cases where that's sensible, or
> > allow it to fall back to using irq_domain_ops.translate() and
> > gpio_irq_chip.translate() to map using code at runtime.
> >
> > I think that would also allow me to use this code without having to
> > override the gpiochip_to_irq() from gpiolib, because that's the only
> > other place (in addition to here) where I need to do that conversion.
>=20
> As noted on the other patch I am really sceptical to overriding
> .to_irq(). Something is wrong if you do that, all .to_irq() is supposed
> to do is let the irqdomain do its job of translating between the number
> spaces, calls should be pretty much the same no matter what.
>=20
> .to_irq() is just supposed to be a convenience function for getting
> the irq for a GPIO line, it must still be possible to just pick an IRQ
> directly from the irqchip, and that will go through the same
> irqdomain so ... it should work the same, without any intervention.

I've tested both ways, with just using plain gpiod_to_irq() or going via
the IRQ domain. Both times I tested with gpio-keys, so it all works as
expected.

However, the problem with gpiochip_to_irq() is that it basically needs
to emulate as if data was coming from a device tree. That's basically
what you do in the twocell code as well. The only difference on Tegra,
again, is that we now need to expand the number space to the sparse DT
number space by filling in the holes again. This is needed to make sure
that when the IRQ fwspec is passed to the IRQ domain's .translate()
callback, the values in the fwspec actually correspond to the ones
defined by the DT.

I looked a little at whether that's something that we could fix by just
allowing gpiochip_to_irq() to call some other helper that doesn't need
to emulate the fwspec. However, all code paths eventually end up calling
some API that takes the IRQ fwspec, so we need that anyway.

> > Basically for Tegra I imagine something like this:
> >
> >         if (chip->irq.translate)
> >                 chip->irq.translate(&chip->irq, &parent_fwspec, hwirq +=
 i, type);
>=20
> I would rather see that we create something translationwise that
> can be used universally. If using a list like this for every irq in need
> of translation doesn't work
>=20
> struct gpiochip_hierarchy_map {
>         int hwirq;
>         int parent_hwirq;
>         unsigned int parent_type;
> };
>=20
> Then I want to know what data structure we need.
>=20
> What would satisfy Tegra? I can think of trivial things like encoding a
> "range" (int n_hwirqs) in each entry if that makes things more
> convenient/faster when handling mapping of entire ranges.

Like I said, the above would work for Tegra. My only gripe with it is
that it's totally wasteful because we basically need 140 entries of the
above (that's roughly 1.5-2 KiB) to do what is essentially a 1:1
mapping.

> > Incidentally, parent_fwspec in the Tegra case would yield the same thing
> > as fwspec because that's how the bindings are defined. For other drivers
> > it might make sense for it to return something different.
>=20
> I don't quite follow this, sorry :/

I hope I clarified this above. That last sentence is wrong though, on
second thought. Basically what I'm trying to say is that we're going in
circles with all these translations.

One one hand we need to translate the GPIO/IRQ specifier into the linear
domain of the GPIO/IRQ controller. Then in gpiochip_to_irq() we need to
go back and translate to the GPIO/IRQ specifier in order to please the
IRQ domain API. At the same time I don't think there's really a way
around that. Ultimately both the gpiochip_to_irq() and regular IRQ
mapping code paths end up calling irq_domain_ops.alloc(), which in turn
requires the struct irq_fwspec.

> > Come to think of it, I think having that backwards-translate callback
> > would allow us to get rid of the issue with non-linear mappings, that I
> > mentioned above, as well. With one restriction, that is: the GPIO number
> > space has to be assumed to be linear.
>=20
> The GPIO number space is linear per gpiochip, so for a GPIO
> offset (hwirq or whatever it happens to be called) an expander or
> SoC gpio_chip has IRQs 0..N possibly with invalid holes made in it
> with .valid_mask, but the number space is still linear.
>=20
> > In that case the
> > irq_domain_ops.translate() would convert from whatever the external
> > representation is to the linear, no-holes, internal representation of
> > the GPIO chip (hence hwirq + i would do the right thing with regards to
> > multiple IRQs being allocated) and then gpio_irq_chip.translate() would
> > convert from that internally linear representation to the external one
> > again, taking care of any holes if necessary.
>=20
> Yeah ... but what about just using gpiolibs internal representation
> of the mapping instead if it is versatile enough? It's just going to
> be used for this anyway, right?

Not exactly. The problem, like I said above, is that when we call
irq_create_fwspec_mapping() we need to go to the external representation
again, because we effectively emulate what would happen if this was
called straight from the IRQ mapping code.

I would like to point out that twocell in your proposal does exactly the
same thing. The only difference is that the mapping is 1:1, so you don't
actually do any transformation on the number space.

Literally the *only* difference on Tegra is that we run a handful of
instructions and a loop on the number in each direction.

> > As a concrete example, on Tegra we could have the following situation:
> > GPIO A.00-A.06 and B.00-B.06 are numbered like this:
> >
> >     GPIO   DT  pin
> >     --------------
> >     A.00    0    0
> >     A.01    1    1
> >     A.02    2    2
> >     A.03    3    3
> >     A.04    4    4
> >     A.05    5    5
> >     A.06    6    6
> >
> >     B.00    8    7
> >     B.01    9    8
> >     B.02   10    9
> >     B.03   11   10
> >     B.04   12   11
> >     B.05   13   12
> >     B.06   14   13
> >
> > The DT binding is basically a historical "accident" because the GPIO
> > controller used to have 8 pins per port, so we use macros to describe
> > the second cell in the DT specifier and they simply multiply the port
> > index by 8 to get the GPIO base offset for a given port. But I think
> > you're familiar with that already from our earlier discussions on this.
>=20
> Yeah... I vaguely remember.
>=20
> I'm not entirely sure that it is a good idea for gpiolib or irqdomain
> to try to provide generic mechanisms to correct historical incidents
> in device tree bindings though.

You're making my point for me. I'm arguing that in order for the core
not to have to deal with any of this, why not just give drivers that
need it a simple tool to deal with this.

There's absolutely no deal to come up with a flexible data structure to
describe these cases if we can just look whether the driver implements a
callback in which case we can just call that and hand the responsibility
to the driver. The generic core can then restrict itself to dealing with
the more normal situations.

> The mission of the hierarchical irqdomain is to translate a hwirq
> offset on irqchip A to a hwirq on irqchip B, so it can walk up the
> ladder in the irq handler.
>=20
> > irq_domain_ops.translate() translates from the DT column above to the
> > pin column, which is the linear (no-holes) space that I was referring
> > to. gpio_irq_chip.translate() would go from the pin to the DT column.
> > That's got a nice symmetry to it.
>=20
> > So now for your RFC code this would not work if you get the following
> > fwspec and nr_irqs =3D 2:
> >
> >     fwspec.param[0] =3D 6;
> >
> > Because it will try to allocate conceptually for A.06 and A.07, when
> > there's actually no A.07.
>=20
> Correct me if I'm wrong, but now it starts to seem like the trickery I've
> seen in Tegra's .to_irq() is due to the fact that the irqdomain is not
> really linear.

I think I've made my point above, but I'll repeat this here until I've
made myself clear. The IRQ domain is linear. The IRQ domain is in fact a
1:1 mapping of the GPIO number space.

The difference is that the *DT specifier* is *not* linear and *not* a
1:1 mapping of the GPIO number space. That's the reason for doing the
back and forth conversion between the DT and GPIO number spaces.

> It seems your basic problem is that you want to use nonlinear
> irqdomains here, and that is indeed interesting, and I see how
> that will complicate things for you. I was thinking to hopefully
> do this in a two-stage rocket then: support linear hierarchical
> irqdomains for gpio irqchips, then think about how to support
> nonlinear irqdomains.
>=20
> Nonlinear irqdomains should have the hallmark of passing
> 0 in the third argument (size) to irq_domain_create_hierarchy()
> so that a tree is created. So this is what Tegra should be doing
> if its numberspace is not linear, and indeed that is something
> I don't handle in this patch set.
>=20
> So Tegra support, if it needs to deal with nonlinear numberspaces,
> should start with that: use a nonlinear irqdomain.
>=20
> But when I look at the current upstream gpio-tegra186.c code I
> get really confused. It doesn't seem to call irq_domain_create*
> or irq_domain_add* at all, instead it seems to just assign function point=
ers to
> a NULL irqdomain and rely on the core to call that.
>=20
> Where is the gpiochip.irq.domain coming from in the Tegra186
> case?

Erm... this is using just the plain gpio_irq_chip helpers.
gpiochip_add_irqchip() ends up creating the IRQ domain.

> Can you explain how this really works, because it looks a bit
> like abuse of the API but maybe I just don't get it.
>=20
> > Overall I think this should work for Tegra. Ideally, like I said, this
> > parent IRQ map would be optional and we would allow drivers to compute
> > the mapping at runtime where reasonable. Generating a lot of data
> > upfront would also work, but it seems rather redundant to have to
> > generate a large table with over 200 entries for what's essentially a
> > trivial mapping that can be expressed with just a handful of lines of
> > code.
>=20
> I think we need to establish what type of irqdomain you really
> want to be using here and what the current 186 driver is really
> doing. I am a bit lost, sorry...

To summarize: I think it's totally fine for Tegra to use linear domains.
In fact, part of the reason why we do the number space conversion in the
=2Eof_xlate() and .translate() callbacks is so that we can use the linear
number space for the GPIO controller and the linear IRQ domain.

A new .translate() callback (in gpio_irq_chip) would serve the purpose
of allowing the translation in the other direction to be implemented.
With that implemented, there's no longer a need for Tegra to override
the gpiochip_to_irq(). Instead the translation would transparently
happen within the standard gpiochip_to_irq().

Since a patch speaks a thousand words, here's what I'm proposing as a
patch on top of the two others that I sent out the other day. Perhaps a
better name for the callback would be .get_fwspec().

Thierry

--- >8 ---
=46rom 16336b0a1439ab99aedef115a5cb279f6ba54245 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Tue, 4 Jun 2019 13:34:53 +0200
Subject: [PATCH] WIP: gpio: Introduce gpio_irq_chip.translate()

Drivers can implemente this callback if the mapping of GPIO descriptor
to internal GPIO offset is not 1:1. For example, some device tree
bindings specify the bank (or port) of a GPIO as a separate field, and
this can lead to the number space in DT to be sparse, but the internal
GPIO offset being contiguous. Translating the DT number space to the
internal number space is already done in gpio_chip.of_xlate() and
gpio_irq_chip.domain_ops->translate(), respectively.

The new gpio_irq_chip.translate() callback does the opposite transform,
to get back the value in the DT number space from a given GPIO offset.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 41 ++++++++++++++++--------------------
 drivers/gpio/gpiolib.c       | 30 ++++++++++++++++----------
 include/linux/gpio/driver.h  | 14 ++++++++++++
 3 files changed, 51 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 2cc9fb4aeb50..8e411454d882 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -244,36 +244,31 @@ static int tegra186_gpio_of_xlate(struct gpio_chip *c=
hip,
 	return offset + pin;
 }
=20
-static int tegra186_gpio_to_irq(struct gpio_chip *chip, unsigned int offse=
t)
+static int tegra186_gpio_irq_translate(struct gpio_chip *chip,
+				       unsigned int offset, unsigned int type,
+				       struct irq_fwspec *spec)
 {
 	struct tegra_gpio *gpio =3D gpiochip_get_data(chip);
-	struct irq_domain *domain =3D chip->irq.domain;
-
-	if (!gpiochip_irqchip_irq_valid(chip, offset))
-		return -ENXIO;
-
-	if (irq_domain_is_hierarchy(domain)) {
-		struct irq_fwspec spec;
-		unsigned int i;
+	unsigned int i;
=20
-		for (i =3D 0; i < gpio->soc->num_ports; i++) {
-			if (offset < gpio->soc->ports[i].pins)
-				break;
+	dev_info(gpio->gpio.parent, "> %s(chip=3D%px, offset=3D%u, type=3D%u, spe=
c=3D%px)\n", __func__, chip, offset, type, spec);
=20
-			offset -=3D gpio->soc->ports[i].pins;
-		}
+	for (i =3D 0; i < gpio->soc->num_ports; i++) {
+		if (offset < gpio->soc->ports[i].pins)
+			break;
=20
-		offset +=3D i * 8;
+		offset -=3D gpio->soc->ports[i].pins;
+	}
=20
-		spec.fwnode =3D domain->fwnode;
-		spec.param_count =3D 2;
-		spec.param[0] =3D offset;
-		spec.param[1] =3D IRQ_TYPE_NONE;
+	offset +=3D i * 8;
=20
-		return irq_create_fwspec_mapping(&spec);
-	}
+	spec->fwnode =3D chip->irq.domain->fwnode;
+	spec->param_count =3D 2;
+	spec->param[0] =3D offset;
+	spec->param[1] =3D type;
=20
-	return irq_create_mapping(domain, offset);
+	dev_info(gpio->gpio.parent, "< %s()\n", __func__);
+	return 0;
 }
=20
 static void tegra186_irq_ack(struct irq_data *data)
@@ -573,7 +568,6 @@ static int tegra186_gpio_probe(struct platform_device *=
pdev)
 	gpio->gpio.of_node =3D pdev->dev.of_node;
 	gpio->gpio.of_gpio_n_cells =3D 2;
 	gpio->gpio.of_xlate =3D tegra186_gpio_of_xlate;
-	gpio->gpio.to_irq =3D tegra186_gpio_to_irq;
=20
 	gpio->intc.name =3D pdev->dev.of_node->name;
 	gpio->intc.irq_ack =3D tegra186_irq_ack;
@@ -591,6 +585,7 @@ static int tegra186_gpio_probe(struct platform_device *=
pdev)
 	irq->parent_handler_data =3D gpio;
 	irq->num_parents =3D gpio->num_irq;
 	irq->parents =3D gpio->irq;
+	irq->translate =3D tegra186_gpio_irq_translate;
=20
 	np =3D of_find_matching_node(NULL, tegra186_pmc_of_match);
 	if (np) {
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6b64bfa90089..213ee1c198d7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1823,9 +1823,21 @@ void gpiochip_irq_domain_deactivate(struct irq_domai=
n *domain,
 }
 EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
=20
+static int gpiochip_irq_translate(struct gpio_chip *chip, unsigned int off=
set,
+				  unsigned int type, struct irq_fwspec *spec)
+{
+	spec->fwnode =3D chip->irq.domain->fwnode;
+	spec->param_count =3D 2;
+	spec->param[0] =3D offset;
+	spec->param[1] =3D type;
+
+	return 0;
+}
+
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct irq_domain *domain =3D chip->irq.domain;
+	int err;
=20
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
 		return -ENXIO;
@@ -1833,10 +1845,9 @@ static int gpiochip_to_irq(struct gpio_chip *chip, u=
nsigned offset)
 	if (irq_domain_is_hierarchy(domain)) {
 		struct irq_fwspec spec;
=20
-		spec.fwnode =3D domain->fwnode;
-		spec.param_count =3D 2;
-		spec.param[0] =3D offset;
-		spec.param[1] =3D IRQ_TYPE_NONE;
+		err =3D chip->irq.translate(chip, offset, IRQ_TYPE_NONE, &spec);
+		if (err < 0)
+			return err;
=20
 		return irq_create_fwspec_mapping(&spec);
 	}
@@ -1949,13 +1960,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gp=
iochip,
 		type =3D IRQ_TYPE_NONE;
 	}
=20
-	/*
-	 * Allow GPIO chips to override the ->to_irq() if they really need to.
-	 * This should only be very rarely needed, the majority should be fine
-	 * with gpiochip_to_irq().
-	 */
-	if (!gpiochip->to_irq)
-		gpiochip->to_irq =3D gpiochip_to_irq;
+	gpiochip->to_irq =3D gpiochip_to_irq;
=20
 	gpiochip->irq.default_type =3D type;
 	gpiochip->irq.lock_key =3D lock_key;
@@ -1966,6 +1971,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpi=
ochip,
 	else
 		ops =3D &gpiochip_domain_ops;
=20
+	if (!gpiochip->irq.translate)
+		gpiochip->irq.translate =3D gpiochip_irq_translate;
+
 	if (gpiochip->irq.parent_domain)
 		gpiochip->irq.domain =3D irq_domain_add_hierarchy(gpiochip->irq.parent_d=
omain,
 								0, gpiochip->ngpio,
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 472f2c127bf6..fab111b00ef2 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -174,6 +174,20 @@ struct gpio_irq_chip {
 	 * Store old irq_chip irq_disable callback
 	 */
 	void		(*irq_disable)(struct irq_data *data);
+
+	/**
+	 * @translate:
+	 *
+	 * Construct the firmware IRQ specifier for the given GPIO. This is
+	 * used to create a hierarchical mapping for an interrupt. Creating
+	 * that mapping is going to convert the IRQ specifier back to the
+	 * offset that was passed into this function, so it's a little
+	 * redundant. But it is necessary in order for the IRQ domain code
+	 * to deal with this transparently.
+	 */
+	int		(*translate)(struct gpio_chip *chip,
+				     unsigned int offset, unsigned int type,
+				     struct irq_fwspec *fwspec);
 };
 #endif
=20
--=20
2.21.0


--2D20dG0OqTzqkNh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2avcACgkQ3SOs138+
s6EQ/Q//Zmf1Z4JNdNncVbsHhaQhcVpsW024ze20DT/kYm31HR+XF7zJx1MyK5Cw
taJ84GNe9yZl5nynMbj3s9iUg1vksPOxlW0JPp9KmBwqsImd5v9kpyIMURKSRrNX
TzJZIUXAqkMPuybCBxyqNEHuFZBrB0zrjjUsyznpC+9BxDqO69O8OK9agSFSZPaa
6vQj79bD23VbwWZabeZzurqkc/qPONfpRzkgPlACV//kNPhYdc0eHB4CzK8bMqey
qlHAyRLIfw1h2S5F64mvNF/UHBqP5CFPUIX9wGaV6GMVayz3nxsjbazZ2HzOEIEa
vg24q4RkiG+yF0XY9iYacanDqUdF65rsxuj4kaipNVmT3yXuYbaTKjTtwaWzy89l
XbWEO+EtDE4eraYFVDfI6SJiURC1cowz4MezlpeGiyVPQVfFOTBSBTHLZMLtaWkI
7fbZPxyM0Xo31Nx5jSKN0wnZJL5Bz3Z+FOTEw8IceYDdngz/T57+JjixZjAbqRlq
OcKyepZ+gVOxGrBlDGBQR47mhRyqVE/Nw2XMMB70MNRgyLHx2kBo1gmPBsTrsXmv
oeLiEO9OcZgq8jeUagy71gtTB9w3x+grqEc1feb+zxB0KuParl1EW9UBSmgORM1C
pPBfBZWTJNfACCrRACsQi187xKdP1/p3KXMD3SNCTM8TPA3MuE0=
=LAFL
-----END PGP SIGNATURE-----

--2D20dG0OqTzqkNh7--
