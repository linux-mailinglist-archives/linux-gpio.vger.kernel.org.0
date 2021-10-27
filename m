Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28DA543BEA5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 02:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235978AbhJ0A4a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 20:56:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:47760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232410AbhJ0A4a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 20:56:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 560CA60F0F;
        Wed, 27 Oct 2021 00:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635296045;
        bh=3wmPlMfs7SR783XTmRV7cR81LzMiYBMO+8TaAiydWkM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W+ESkAeCUUskZxyaPVVNJSQLz8HBAG1zufvbuDBBq9aLfbxvCgVHNRyEwDhpCaD0u
         oHHGrJIuVMsKaMJN660eES9zVI6ZuTGSw+QtEXO/3kNu3VZXMRhFWVZUkOOWNHimJi
         zwKtwSFHkDdtmvJke91XPGHWmVbRSdg9eDy3e7anPX0kaH9xI3vYQEjDhTb1at4OTz
         xu10tcE+mm6SIX4xTkKFgEdkljbuOldIgZu8uNAgyjBJvV4HzMV/nHGOmgwlG26lFQ
         f/aBZYM0FGmjzdEFKrU813jTsN8gcKRjB95RH2fdQDNMon7HF1UI4ATU4wQRmWG34j
         k9u9vXzRpknvA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com>
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-7-kernel@esmil.dk> <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com> <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 26 Oct 2021 17:54:03 -0700
Message-ID: <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Emil Renner Berthing (2021-10-26 15:35:36)
> On Tue, 26 Oct 2021 at 22:20, Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Emil Renner Berthing (2021-10-21 10:42:13)
> > > +};
> > > +
> > > +struct clk_starfive_jh7100_priv {
> > > +       /* protect registers against overlapping read-modify-write */
> > > +       spinlock_t rmw_lock;
> >
> > Does overlapping mean concurrent?
>=20
> Yes, sorry.
>=20
> > Do different clks share the same registers?
>=20
> No, each clock has their own register, but they use that register both
> to gate the clock and other configuration. The Locking chapter of
> Documentation/driver-api/clk.rst talks about the prepare lock and the
> enable lock and then says:
> "However, access to resources that are shared between operations of
> the two groups needs to be protected by the drivers. An example of
> such a resource would be a register that controls both the clock rate
> and the clock enable/disable state."

Alright got it. Maybe say "protect clk enable and set rate from
happening at the same time".

>=20
> > > +               return ERR_PTR(-EINVAL);
> > > +       }
> > > +
> > > +       if (idx >=3D JH7100_CLK_PLL0_OUT)
> > > +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> > > +
> > > +       return &priv->reg[idx].hw;
> > > +}
> > > +
> > > +static int __init clk_starfive_jh7100_probe(struct platform_device *=
pdev)
> >
> > Drop __init as this can be called after kernel init is over.
>=20
> Oh interesting, I'd like to know when that can happen. The comment for
> the builtin_platform_driver macro says it's just a wrapper for

I thought this was using module_platform_driver() macro?

> device_initcall.
>=20
> Won't we then need to remove all the __initconst tags too since the
> probe function walks through jh7100_clk_data which eventually
> references all __initconst data?

Yes. If it's builtin_platform_driver() it can't be a module/tristate
Kconfig, in which case all the init markings can stay.

>=20
> > > +
> > > +               clk->hw.init =3D &init;
> > > +               clk->idx =3D idx;
> > > +               clk->max =3D jh7100_clk_data[idx].max;
> > > +
> > > +               ret =3D clk_hw_register(priv->dev, &clk->hw);
> >
> > Why not use devm_clk_hw_register()?
>=20
> I probably could. Just for my understanding that's just to avoid the
> loop on error below, because as a builtin driver the device won't
> otherwise go away, right?

Yes

>=20
> > > +               if (ret)
> > > +                       goto err;
> > > +       }
> > > +
> > > +       ret =3D devm_of_clk_add_hw_provider(priv->dev, clk_starfive_j=
h7100_get, priv);
> > > +       if (ret)
> > > +               goto err;
> > > +
> > > +       return 0;
> > > +err:
> > > +       while (idx)
> > > +               clk_hw_unregister(&priv->reg[--idx].hw);
> > > +       return ret;
> > > +}
> > > +
> > > +static const struct of_device_id clk_starfive_jh7100_match[] =3D {
> > > +       { .compatible =3D "starfive,jh7100-clkgen" },
> > > +       { /* sentinel */ }
> > > +};
> >
> > Please add MODULE_DEVICE_TABLE()
>=20
> Will do!

If it's never going to be a module then don't add any module_* things.
