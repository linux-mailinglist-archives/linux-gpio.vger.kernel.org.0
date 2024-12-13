Return-Path: <linux-gpio+bounces-13847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AD89F01A9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 02:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1713F188D14F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 01:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246E81759F;
	Fri, 13 Dec 2024 01:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LY8IK4qs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1556F10F7;
	Fri, 13 Dec 2024 01:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734052312; cv=none; b=Ux2ucUvQTAOoTOjbyQWee1INh59Hc8Zf1qDOstOINvX3GHlDVw9yS0OK/9t7i7gVzXFrRvopMfUbXymTbUk2CeuF5uwiEQCRj+o+D33IwYj63pwjQ2mQhIaxAx8TW0Rl3IHFeu9qIlBU+H0rPUVrtxnTU4roa2lXROqCKepdRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734052312; c=relaxed/simple;
	bh=/dGfsLw2rd9kMpEZdA5vpP14meGb2rHjwbTFdqP/IvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUzEjupa2VgIoPLcpG0sqI2XKag9DdSeY8afLQP1JfWzlvFGzMOQo5cFQGH/tkLQH7Xhx+iy0ceYPSNIcvmRP75XRe6smEzdvIiEvMVqm1d33jB7DEpgBwGHHEZ1A7oYs4GsC4A4Pkvs89J2tcrCLSZgVnpNjGMGnvAIcP+t5KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LY8IK4qs; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so1842668a12.0;
        Thu, 12 Dec 2024 17:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734052309; x=1734657109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn1DysVTcUcd9ySgqRwXIoCNYLQUOLat4q21/VMPDys=;
        b=LY8IK4qsBhMu8vzrCw1zLCfjLNxgciDxJ7obEPPfxwFJ6kmK4KOcADxONnKNLQKV9U
         iejUY7CI6wtBOLSmKVYnDNSBw8dZHqEXumOYEqik0uKdUynaujKs1M4Nm/A9dO2ScB5S
         U+WstBIOmdwYxEi9UaGVCLsZ6wRQWzA3RBb/8V4+JTu8ANmQh6O1hSjPg+gH4K3+gP0H
         3h7eQ2wmN1u6FPard+GGA4u6EUcc9n6yBi4oqlPu5TqF5lRyua3eQ1jhe2P5dCIFoFDJ
         aJ0Ukx6m0ldxIy8/do2N1W3aSMoyHsuv1uo7vVwjlyrLrxQcegMLrIlGIBKJgOSSlUtO
         OGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734052309; x=1734657109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jn1DysVTcUcd9ySgqRwXIoCNYLQUOLat4q21/VMPDys=;
        b=M7MMoETmxaV8vepsvn2rx/SJ4xqIajzg+FPzVGJdN2N6hzowxPfhiIKCxnayKODpE7
         HMolf5tTYI0pqJIKyZ42sDc138gVEIa2VdkRFP2KowTM2+Fjpes0FOr7MoKZSlUr0zLe
         ZQ3OJAxeBKtRyW4MUXe0zj2lEWBMQv9KCqtzqx0d/6A7b2UEqGd//p80kwwVqyQWqfA7
         bhUwDCB3jd6axqxajXmNGSbOjxnolCJCOL1sQTqY+7H1QTAESFnNDmoLIuDAe9zE0U1+
         NtdyM7+ao4NxIA9OWpFEe5Ic8qtnR4iWOx42H+tnsAF2e/uU5PuHqVmMFJItNhJqVqKA
         SF4A==
X-Forwarded-Encrypted: i=1; AJvYcCVg6Ieo87Ga0g7it6fHhw8oxgviEmfZ/eS6AIGxX9aXbKoPLH6spyNW62bYYv3aQCerS3cyhHrF61f2@vger.kernel.org, AJvYcCXJWYmzUrh2PHdcKexgVFykirq2dM+/rO+3eO8Rd099nuFY0Zh4+CR6EXRTymfOYPolMqJzKUCiTwEKbbRq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzer2jb2PKnqcGJj3aeHrIp6w/+YDydHWPcOZtmPrYJIeEhBnUY
	SDvm55YOCTgwIo6hXF0MIFvSOcC7o0teiMy0rC0H+yAv2REtYi568V9HNz3pwGRcxDJiaMXPeNn
	ao0wO1qLcx7eyZzYHBNwrc8twSJE=
X-Gm-Gg: ASbGncsqCliYltsqsPbFIRGzv3GxcBUpZZT7Jcq8fOeTJ7TsFNKh2tVINeCgVg3a/zI
	p/tRwNTkr1C+/PKEN325zwe39XOI7kZrYjofRW6rt4Mf1COm1FJ0RFFnMWrgQ+3NXgJseaQ==
X-Google-Smtp-Source: AGHT+IFQ4XNOkc8sPX1M8qZSVacYSK9EidDYtS/NoHmzSlgwZHZDH0Ukd2SJ8UKW79iATKfg796ugAZZITmrQz+qNYA=
X-Received: by 2002:a05:6402:27cb:b0:5d0:8359:7a49 with SMTP id
 4fb4d7f45d1cf-5d63c1575f0mr474365a12.0.1734052309059; Thu, 12 Dec 2024
 17:11:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206214315.3385033-1-zmw12306@gmail.com> <21f4927382a3cf3bb433bc1f1d7d4ad9ea1a2a5e.camel@foss.st.com>
In-Reply-To: <21f4927382a3cf3bb433bc1f1d7d4ad9ea1a2a5e.camel@foss.st.com>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Thu, 12 Dec 2024 20:11:37 -0500
Message-ID: <CAN4iqtTcdZ8tqwPx=WeG6j6k17OHF3rj_YcXUgJAwseoTUKDeQ@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3] pinctrl: stm32: Add check for clk_enable()
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: marex@denx.de, peng.fan@nxp.com, make24@iscas.ac.cn, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>, 
	fabien.dessenne@foss.st.com, mcoquelin.stm32@gmail.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonio,

On Sat, Dec 7, 2024 at 9:25=E2=80=AFAM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:
>
> On Fri, 2024-12-06 at 16:43 -0500, Mingwei Zheng wrote:
> > Convert the driver to clk_bulk*() API.
> > Add check for the return value of clk_bulk_enable() to catch
> > the potential error.
> >
> > Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled =
when LEVEL IRQ requested")
> > Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> > Changelog:
> >
> > v2 -> v3:
> >
> > 1. Convert clk_disable_unprepare to clk_bulk_disable
> > and clk_bulk_unprepare.
> >
> > v1 -> v2:
> >
> > 1. Move int ret declaration into if block.
> > ---
> >  drivers/pinctrl/stm32/pinctrl-stm32.c | 28 +++++++++++++--------------
> >  1 file changed, 13 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/st=
m32/pinctrl-stm32.c
> > index 5b7fa77c1184..0ef912e82736 100644
> > --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> > +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> > @@ -86,7 +86,6 @@ struct stm32_pinctrl_group {
> >
> >  struct stm32_gpio_bank {
> >         void __iomem *base;
> > -       struct clk *clk;
> >         struct reset_control *rstc;
> >         spinlock_t lock;
> >         struct gpio_chip gpio_chip;
> > @@ -108,6 +107,7 @@ struct stm32_pinctrl {
> >         unsigned ngroups;
> >         const char **grp_names;
> >         struct stm32_gpio_bank *banks;
>
> Thanks for your patch!
> While it's growing wider than your initial scope, it looks as a nice impr=
ovement.
>
> > +       struct clk_bulk_data *clks;
>
> Maybe I've missed it but, where does this array get allocated?
> There exist clk_bulk_get_all() and devm_clk_bulk_get_all() that do the al=
location for you, but they require all the clocks to be listed in the same =
"clocks" property, while this driver has a clock in
> each DT subnode!
> Some suggestion below.
>
> >         unsigned nbanks;
> >         const struct stm32_pinctrl_match_data *match_data;
> >         struct irq_domain       *domain;
> > @@ -1308,7 +1308,7 @@ static int stm32_gpiolib_register_bank(struct stm=
32_pinctrl *pctl, struct fwnode
> >         if (IS_ERR(bank->base))
> >                 return PTR_ERR(bank->base);
> >
> > -       err =3D clk_prepare_enable(bank->clk);
> > +       err =3D clk_prepare_enable(pctl->clks[pctl->nbanks].clk);
> >         if (err) {
> >                 dev_err(dev, "failed to prepare_enable clk (%d)\n", err=
);
> >                 return err;
> > @@ -1397,7 +1397,7 @@ static int stm32_gpiolib_register_bank(struct stm=
32_pinctrl *pctl, struct fwnode
> >         return 0;
> >
> >  err_clk:
> > -       clk_disable_unprepare(bank->clk);
> > +       clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);
> >         return err;
> >  }
> >
> > @@ -1631,11 +1631,10 @@ int stm32_pctl_probe(struct platform_device *pd=
ev)
> >                         fwnode_handle_put(child);
> >                         return -EPROBE_DEFER;
> >                 }
> > -
> > -               bank->clk =3D of_clk_get_by_name(np, NULL);
> > -               if (IS_ERR(bank->clk)) {
> > +               pctl->clks[i].clk =3D of_clk_get_by_name(np, NULL);
>
> This is the first time the array is used, during stm32_pctl_probe(), so t=
he array should be already allocated before this line.
> The number of banks pctl->nbanks is computed few lines below, so it shoul=
d be anticipated, or being replaced by a simpler
>   pctl->nbanks =3D gpiochip_node_count(dev);
>
> then allocation could be done with
>   pctl->clks =3D devm_kmalloc_array(dev, pctl->nbanks, sizeof(*pctl->clks=
), GFP_KERNEL);
>
> Also, you never assign `pctl->clks[i].id` which is then used by the error=
 messages in, e.g., clk_bulk_enable().
> We don't mandate the property "clock-names" in the DT subnodes, so no way=
 to get a reasonable value from the DT.
> I presume it's fine to set it to NULL... to be tested.
>
> Regards,
> Antonio
>
>

Thanks for your suggestion. We used devm_kcalloc to allocate clk. We
set `pctl->clks[i].id` to "".

Best,
Mingwei

> > +               if (IS_ERR(pctl->clks[i].clk)) {
> >                         fwnode_handle_put(child);
> > -                       return dev_err_probe(dev, PTR_ERR(bank->clk),
> > +                       return dev_err_probe(dev, PTR_ERR(pctl->clks[i]=
.clk),
> >                                              "failed to get clk\n");
> >                 }
> >                 i++;
> > @@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev=
)
> >                 if (ret) {
> >                         fwnode_handle_put(child);
> >
> > -                       for (i =3D 0; i < pctl->nbanks; i++)
> > -                               clk_disable_unprepare(pctl->banks[i].cl=
k);
> > +                       clk_bulk_disable(pctl->nbanks, pctl->clks);
> > +                       clk_bulk_unprepare(pctl->nbanks, pctl->clks);
> >
> >                         return ret;
> >                 }
> > @@ -1726,10 +1725,8 @@ static int __maybe_unused stm32_pinctrl_restore_=
gpio_regs(
> >  int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
> >  {
> >         struct stm32_pinctrl *pctl =3D dev_get_drvdata(dev);
> > -       int i;
> >
> > -       for (i =3D 0; i < pctl->nbanks; i++)
> > -               clk_disable(pctl->banks[i].clk);
> > +       clk_bulk_disable(pctl->nbanks, pctl->clks);
> >
> >         return 0;
> >  }
> > @@ -1738,10 +1735,11 @@ int __maybe_unused stm32_pinctrl_resume(struct =
device *dev)
> >  {
> >         struct stm32_pinctrl *pctl =3D dev_get_drvdata(dev);
> >         struct stm32_pinctrl_group *g =3D pctl->groups;
> > -       int i;
> > +       int i, ret;
> >
> > -       for (i =3D 0; i < pctl->nbanks; i++)
> > -               clk_enable(pctl->banks[i].clk);
> > +       ret =3D clk_bulk_enable(pctl->nbanks, pctl->clks);
> > +       if (ret)
> > +               return ret;
> >
> >         for (i =3D 0; i < pctl->ngroups; i++, g++)
> >                 stm32_pinctrl_restore_gpio_regs(pctl, g->pin);

