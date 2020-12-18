Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFB32DE520
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Dec 2020 15:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgLROuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Dec 2020 09:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgLROuN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Dec 2020 09:50:13 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBD4C0617A7;
        Fri, 18 Dec 2020 06:49:33 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id x22so2569721wmc.5;
        Fri, 18 Dec 2020 06:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PmzrHQfkHavIG6UK0jDM+2iNXcI+gKwPZskGOnJdHYs=;
        b=sTguiP/l9Gj+Ub2sUHhjY/DXEEqzTv9ynTJH9uITvp69XM5G051KHN3uYTsrdyrX97
         6CtcyIJLJ6m6MuAC98WvM48YHufdOYrxU+CheMmuAOchenn9hiIYr39kZkWHaRrXIfrE
         uUPLMzFMfhYoYlJhpe5n4nNcxHqjDuLiHX6XJRUcVszjT7RFessUfcZlBy11odcCFZ3Z
         wu6Y5gMbVlM5tyOinuOrhen45MlfKvWjwtV/L0AMz5lni9ELk2fyiggBeUxFjpUQgIou
         RAiky/hxg8AIJjO5UEpgoQolEo3s1AskX6x8PJAvhR02PgBlmfYwDF3bmX8oCdLxHR4J
         mDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PmzrHQfkHavIG6UK0jDM+2iNXcI+gKwPZskGOnJdHYs=;
        b=Fr6CldZ0IEZmA8KdtxihGZVEH+DShxRdA2fWT4YI20PNocbL3YYT6LB5oo2YhWIqby
         xpu3AWgIQ2CBQ7d8FnP3taChgNpb/JrelxnCw20oCcyIyMQMwE0AGD8dDcUPSRWRTx2R
         yYszNWZHUOwveyuZLbkdJaHlNVuSKiXxvapFXS1Zb+6MsUcT1HMGadZWH0iH4HEoN0if
         xDqEnQR0gOLG8dlcMzQbsWyksOIF3ViLlbKC5xrIqTmIl56SgL8DfZbKxiSpdtlb/Bcg
         N3Qt5IL8UWm1hUl6Ewo/ISFtgOZ1Nzl84L0uXuiKTNpq1/eD+RLgu+o+kskIdVri28/h
         oMPg==
X-Gm-Message-State: AOAM533W+jH90HXVobKcnbWZ23DPA+cYVB44djR+J40Xqy417o9ighEu
        NJQUYQKfp73bQdmNS+x+eTs=
X-Google-Smtp-Source: ABdhPJynYTQmcGS3kXJhbNl6gsILgyr7bz81UteNZUHx99yqf+otgdOYaYI2Ix1eUxba/fJg2fWzmQ==
X-Received: by 2002:a1c:8d:: with SMTP id 135mr4550419wma.177.1608302971686;
        Fri, 18 Dec 2020 06:49:31 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k1sm14108456wrn.46.2020.12.18.06.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 06:49:29 -0800 (PST)
Date:   Fri, 18 Dec 2020 15:49:28 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpio: tegra: Convert to gpio_irq_chip
Message-ID: <X9zBeEDO8uTOCyxw@ulmo>
References: <20201127140852.123192-1-thierry.reding@gmail.com>
 <20201127140852.123192-3-thierry.reding@gmail.com>
 <CACRpkdZ3Krgsjyc3-NU0pmYkzFPue_-1VWqkdNvxoG2c6OF7aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1EIJsWtdjHqVqgn2"
Content-Disposition: inline
In-Reply-To: <CACRpkdZ3Krgsjyc3-NU0pmYkzFPue_-1VWqkdNvxoG2c6OF7aQ@mail.gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--1EIJsWtdjHqVqgn2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 05, 2020 at 10:33:24PM +0100, Linus Walleij wrote:
> On Fri, Nov 27, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Convert the Tegra GPIO driver to use the gpio_irq_chip infrastructure.
> > This allows a bit of boiler plate to be removed and while at it enables
> > support for hierarchical domains, which is useful to support PMC wake
> > events on Tegra210 and earlier.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> The patch didn't apply to my "devel" branch for some reason
> so have a look at that, seems gpio-tegra.c has some changes not
> in my tree.
>=20
> >  struct tegra_gpio_soc_config {
> > @@ -93,12 +91,12 @@ struct tegra_gpio_soc_config {
> >  struct tegra_gpio_info {
> >         struct device                           *dev;
> >         void __iomem                            *regs;
> > -       struct irq_domain                       *irq_domain;
> >         struct tegra_gpio_bank                  *bank_info;
> >         const struct tegra_gpio_soc_config      *soc;
> >         struct gpio_chip                        gc;
> >         struct irq_chip                         ic;
> >         u32                                     bank_count;
> > +       unsigned int                            *irqs;
>=20
> So this is hierarchical with several IRQs.
>=20
> >  static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int ty=
pe)
> >  {
> >         unsigned int gpio =3D d->hwirq, port =3D GPIO_PORT(gpio), lvl_t=
ype;
> > -       struct tegra_gpio_bank *bank =3D irq_data_get_irq_chip_data(d);
> > -       struct tegra_gpio_info *tgi =3D bank->tgi;
> > +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(d);
> > +       struct tegra_gpio_info *tgi =3D gpiochip_get_data(chip);
> > +       struct tegra_gpio_bank *bank;
> >         unsigned long flags;
> > -       u32 val;
> >         int ret;
> > +       u32 val;
> > +
> > +       bank =3D &tgi->bank_info[GPIO_BANK(d->hwirq)];
>=20
> So the general idea is to look up the bank from the IRQ offset.
>=20
> But...
>=20
> > -       return 0;
> > +       if (d->parent_data)
> > +               ret =3D irq_chip_set_type_parent(d, type);
> > +
> > +       return ret;
>=20
> I don't quite get this. This makes sense if there is one parent IRQ
> per interrupt, but if one of the users of a GPIO in a bank sets the
> IRQ type to edge and then another one comes in and set another
> of the lines to level and then the function comes here, what type
> gets set on the parent? Whichever comes last?
>=20
> Normally with banked GPIOs collecting several lines in a cascaded
> fashion, the GPIO out of the bank toward the GIC is level triggered.
>=20
> I don't understand how this GPIO controller can be hierarchical,
> it looks cascaded by the definition of the document
> Documentation/driver-api/gpio/driver.rst

This is basically the same implementation that we've used in the
gpio-tegra186 driver. The goal here is to support wake events, which are
a mechanism for the PMC (which, among other things control wakeup of the
CPU complex from sleep). Wake events are a somewhat non-trivial concept
and I keep second-guessing this myself everytime I look at it...

So basically with these wake events we have a selected number of GPIOs
that are routed to the PMC and which can wake the system from sleep. To
make this work, the PMC IRQ domain becomes the parent of the GPIO IRQ
domain, so what we're forwarding the ->set_type() and ->set_wake()
operations to here is the PMC parent, rather than the parent IRQs which
are, I suppose, somewhat unfortunately named for this particular use-
case.

I suppose given the definition in the documentation the GPIO controller
is both hierarchical (it's a child of the PMC IRQ domain) and cascaded
(sets of GPIOs routed to a number of "parent" interrupts).

What usually helps me in understanding this better is to look at GPIO
and IRQ functionality as separate things. The GPIO controller is
cascaded from the point of view of the GPIOs and how the Linux virtual
interrupts are mapped to physical interrupts. On the other hand the GPIO
controller is hierarchical from an IRQ domain point of view because some
of the GPIO interrupts also have a parent interrupt in the PMC.

I hope that clarifies things a little bit. More specifically the
irq_chip_set_type_parent() isn't actually going to cause the type to be
set on the cascaded interrupts that go to the GIC, but on the parent
interrupts within the PMC (i.e. the wake events) which have separate
registers to program the type and wake enables.

Note that because not all GPIOs may have a corresponding wake event
(i.e. no parent, hierarchically speaking) that's also why we first
check for data->parent_data. See this email thread for a bit more
background information from Marc, who added proper support for this
recently:

	https://lore.kernel.org/lkml/20201007124544.1397322-1-maz@kernel.org/

Thierry

--1EIJsWtdjHqVqgn2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/cwXUACgkQ3SOs138+
s6Hq8A//Yyhpg+NcH/AKw79Wsizkn/g7xvdIoDyxKmel9Xrykzubeu28joWlX8AT
tIWqJSKoJHSjKIkvdiXmU7U0RNGVApOf6MmtVH4WbiAZsLVKRemXRT50W5rZcSR6
NIhaMZjXhNM5hxwltKX04LitN0bD0oVt1OaLSWDGIUeKiDWFQBXVq0S+NkITnHrd
dJZdfWzafoDmDsm/fHC3kMIp2wHwgYl+RTbj6va2VgCPbcS921rIS9G71O8EHfyp
FdkdZgyVWjEjszA0T3ZeG3dg0rjhxlQGiOiqsTwS4Oz0H9lIaJ+TvZzquFamIaS8
2S3NOp7gt+uXncym0zVa/mmJolaVb0LN6ecYKUKw0PF6cxSeGJpPUNwlLdaoXRAM
PDgI4NB5rZcv+SWnIyo1gIi42rW92/jVgJc2YqJweCN4HquXfCiDPqbQ2A43dZVZ
dZIKK3ntXwBbI1TYKH/iEYDVO5Hk+Qy7DY2UdMiGVMDvQ0R7hNhmD/UEXie5iBRS
6yWqjTF+VcslVqWC3GsECH6cNmRigF+VUQxbo3ZVfj3LZQpIMZiZfArymA7xTTXZ
J698RemBv/tRTGrhHt1ENJOi4mwVmA9yz8rnD8eU5T7TUksemM2M2Qd1aFOUBr6g
5+p6hxhtfnEsdZucLnPDEr5MhoayHs3oP0ZZEWPJIa88J046cnA=
=ono0
-----END PGP SIGNATURE-----

--1EIJsWtdjHqVqgn2--
