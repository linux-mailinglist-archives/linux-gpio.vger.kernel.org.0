Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0E525743E
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 09:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgHaHY0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 03:24:26 -0400
Received: from mo-csw1115.securemx.jp ([210.130.202.157]:39376 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgHaHYZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 03:24:25 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 07V7Nik5032133; Mon, 31 Aug 2020 16:23:44 +0900
X-Iguazu-Qid: 2wGqu78fjRd5hM4Wan
X-Iguazu-QSIG: v=2; s=0; t=1598858623; q=2wGqu78fjRd5hM4Wan; m=5/i1HO5KCK+RAMPX55FPKqg96uinqqHLZmftlCHQKAA=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1110) id 07V7Nf3K004863;
        Mon, 31 Aug 2020 16:23:42 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx2.toshiba.co.jp  with ESMTP id 07V7NfT4025310;
        Mon, 31 Aug 2020 16:23:41 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc03.toshiba.co.jp  with ESMTP id 07V7NeAq010613;
        Mon, 31 Aug 2020 16:23:41 +0900
Date:   Mon, 31 Aug 2020 16:23:39 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, punit1.agrawal@toshiba.co.jp,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>
Subject: Re: [PATCH v2 2/8] pinctrl: visconti: Add Toshiba Visconti SoCs
 pinctrl support
X-TSB-HOP: ON
Message-ID: <20200831072339.tkc7v2fyzzq5lhfn@toshiba.co.jp>
References: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200824122957.1392870-3-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CACRpkdarxKSQOvoA4yvjFUkXmZR1OzHYfQRKqLR+8TQoV+oCyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdarxKSQOvoA4yvjFUkXmZR1OzHYfQRKqLR+8TQoV+oCyw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for your review.

On Fri, Aug 28, 2020 at 02:41:05PM +0200, Linus Walleij wrote:
> Hi Nobuhiro!
> 
> Thanks for your patch. Some review comments below!
> 
> On Mon, Aug 24, 2020 at 2:30 PM Nobuhiro Iwamatsu
> <nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
> >
> > Add pinctrl support to Toshiba Visconti SoCs.
> >
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> 
> > +config PINCTRL_VISCONTI
> > +       bool
> > +       select PINMUX
> > +       select GENERIC_PINCONF
> > +       select GENERIC_PINCTRL_GROUPS
> > +       select GENERIC_PINMUX_FUNCTIONS
> 
> Thanks for using generic stuff!
> 
> > +#define SET_BIT(data, idx)     ((data) |= BIT(idx))
> > +#define CLR_BIT(data, idx)     ((data) &= ~BIT(idx))
> 
> Please do not reinvent things like this. Either open code
> it, and if you want optimizations (probably not relevant in
> this case) you would use:
> 
> #include <linux/bitmap.h>
> 
> set_bit() and clear_bit() if you want atomic bit ops
> __set_bit() and __clear_bit() for nonatomic
> 
> The upside to using these standard calls is that they will
> unfold into assembly optimizations for the architecture if
> possible.
> 
> If you roll your own locking use the latter primitives.
> 

I understood this.
Since this is a bit control for variables, clear_bit() and other are not
used. As you write in the comment below, I fix not using unnecessary macros.

> > +/* private data */
> > +struct visconti_pinctrl {
> > +       void __iomem *base;
> > +       struct device *dev;
> > +       struct pinctrl_dev *pctl;
> > +       struct pinctrl_desc pctl_desc;
> > +
> > +       const struct visconti_pinctrl_devdata  *devdata;
> > +
> > +       spinlock_t lock;
> 
> At least add a comment to this lock to say what it is locking.
> 

OK, I will add a commnent.

> > +                       /* update pudsel setting */
> > +                       val = readl(priv->base + pin->pudsel_offset);
> > +                       CLR_BIT(val, pin->pud_shift);
> > +                       val |= set_val << pin->pud_shift;
> 
> I would just inline the &= operation but it is up to you.
> 

OK, I will fix not using this macro.

> > +               case PIN_CONFIG_DRIVE_STRENGTH:
> > +                       arg = pinconf_to_config_argument(configs[i]);
> > +                       dev_dbg(priv->dev, "DRV_STR arg = %d\n", arg);
> > +                       switch (arg) {
> > +                       case 2:
> > +                       case 4:
> > +                       case 8:
> > +                       case 16:
> > +                       case 24:
> > +                       case 32:
> > +                               set_val = (arg / 2) - 1;
> 
> This looks like you want to use
> 
> set_val = DIV_ROUND_CLOSEST(arg, 2);
> 
> Also add a comment on WHY you do this.
> 

OK, I will fix using DIV_ROUND_CLOSEST and comment.

> > +                       /* update drive setting */
> > +                       val = readl(priv->base + pin->dsel_offset);
> > +                       val &= ~(GENMASK(3, 0) << pin->dsel_shift);
> 
> Could this GENMASK be a #define so we know what it is?
> 
> > +/* pinmnux */
> 
> Spelling

Thanks, I will this.

> 
> > +       /* update mux */
> > +       val = readl(priv->base + mux->offset);
> > +       val &= ~mux->mask;
> > +       val |= mux->val;
> 
> So here you do things explicitly and in the other case with custom
> macros. I think this is better because it is easy to read.

OK.

> 
> > +static int visconti_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                     struct pinctrl_gpio_range *range,
> > +                                     unsigned int pin)
> 
> Since you implement this, what GPIO driver are you using this with?
> 

Certainly this feature is not called and is not needed, because there
is no GPIO driver for this SoC now. I will remove these.


> Other than that it looks all right, also the plugin for SoC is nicely designed.
> 
> Thanks!
> Linus Walleij
>

Best regards,
  Nobuhiro
