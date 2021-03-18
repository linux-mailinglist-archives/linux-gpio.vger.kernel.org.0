Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D39E340545
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 13:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhCRMQ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 08:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbhCRMQH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Mar 2021 08:16:07 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70864C06174A;
        Thu, 18 Mar 2021 05:16:07 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id gb6so2842259pjb.0;
        Thu, 18 Mar 2021 05:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q4sV6DKYtTchSAlvek9WgOLwv2yXCQyX4WUNYJQUt6U=;
        b=q6K0Ehmnucne2FlF77MU7fLBc/Qp2dly7iOe/u96Fred+R8fok8UMsvdiZl5GL7yg4
         qrRu3rkGLXfMlQORs8eSFqrqBSO6JmhgbpNFQNkoWeNFSx5ioE7SOuaS2ZP5yNBAdidl
         lMdMn8ndxPp20Ss9Xw3/txZzumU3tr/Q3YKjypyPyDAjtQU+QnRxON7iqNDMMAbMImeW
         VhI3vkMVkvO8xDd7FblS0VMdib0BjMc5YDG6rFRCRoIy1Hp5As4e2YS78HquzdGivcNZ
         mIGF3W5TO8MYuc6824GiuAagJ3J35GKDM5F/SxzA26cFRV85fXZxn47TPHDNxIp3ohol
         x81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q4sV6DKYtTchSAlvek9WgOLwv2yXCQyX4WUNYJQUt6U=;
        b=k9sgM40HbzwxEEg+W7tkq4O+Xm0K0cwpmJ3gA5UglQT6sIrfjrcw5c5SX+4fQ195Kg
         LdGGgOU6a0Tp3phU5EMSDjZ4fSgF584qQuYYygWADsKUMt2duRirW//V168CDz54RlT/
         Hn2dJx94rERqFfHSvCqJf7699NoEzWt0eMT4rJ3LFN2wVkhhxzOadplkXbULOggm90mX
         1XnHTQfWFwBy6HHPiEL+jfHNFS+fg+UFZsxAraZRPUxqgH1MwZKit6+2anPeKzOoCun0
         CIquNfgyjsNQDRWPA21OAX1toj3k8eLe3PuZEiCqNFSXyl+enS2isUHu2gVlCGAIRZQ0
         WzZQ==
X-Gm-Message-State: AOAM533tLaX8IyKSflyGziS5d5HxsPu71wduqh4F4VM3lcFnsD7HZdzk
        5+7jah67Ya5bzckTUucdu8yRMu9zBImy7ZSff/0=
X-Google-Smtp-Source: ABdhPJx9CynEv9MyWrBPlTnnvHMW/9FuiSkz+dtjqaQE7YaaLdDEg2W+F3kf5WbbNCHQsX6lLMLuXgn4KHN6t8saUNQ=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr4194138pjr.228.1616069766877;
 Thu, 18 Mar 2021 05:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210317214149.20833-1-hhhawa@amazon.com> <20210317214149.20833-4-hhhawa@amazon.com>
In-Reply-To: <20210317214149.20833-4-hhhawa@amazon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Mar 2021 14:15:50 +0200
Message-ID: <CAHp75VdYeVOHu5T37EBEjL5xfgjevzb-ErZb2QMy7defXDS5fg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] pinctrl: pinctrl-single: fix pcs_pin_dbg_show()
 when bits_per_mux is not zero
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Woodhouse <dwmw@amazon.co.uk>, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, tgershi@amazon.com,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 11:42 PM Hanna Hawa <hhhawa@amazon.com> wrote:
>

> An SError was detected when trying to print the supported pins in a

What is SError? Yes, I have read a discussion, but here is the hint:
if a person sees this as a first text due to, for example, bisecting
an issue, what she/he can get from this cryptic name?

> pinctrl device which supports multiple pins per register. This change
> fixes the pcs_pin_dbg_show() in pinctrl-single driver when bits_per_mux
> is not zero. In addition move offset calculation and pin offset in
> register to common function.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: 4e7e8017a80e ("pinctrl: pinctrl-single: enhance to configure multiple pins of different modules")
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> ---
>  drivers/pinctrl/pinctrl-single.c | 57 +++++++++++++++++++++-----------
>  1 file changed, 37 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index f3394517cb2e..4595acf6545e 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -270,20 +270,46 @@ static void __maybe_unused pcs_writel(unsigned val, void __iomem *reg)
>         writel(val, reg);
>  }
>
> +static unsigned int pcs_pin_reg_offset_get(struct pcs_device *pcs,
> +                                          unsigned int pin)
> +{

> +       unsigned int mux_bytes;
> +
> +       mux_bytes = pcs->width / BITS_PER_BYTE;

Can be folded to one line.

> +       if (pcs->bits_per_mux) {
> +               unsigned int pin_offset_bytes;
> +
> +               pin_offset_bytes = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
> +               return (pin_offset_bytes / mux_bytes) * mux_bytes;

Side note for the further improvements (in a separate change, because
I see that you just copied an original code, and after all this is
just a fix patch): this can be replaced by round down APIs (one which
works for arbitrary divisors).

> +       }
> +
> +       return pin * mux_bytes;
> +}
> +
> +static unsigned int pcs_pin_shift_reg_get(struct pcs_device *pcs,
> +                                         unsigned int pin)
> +{
> +       return (pin % (pcs->width / pcs->bits_per_pin)) * pcs->bits_per_pin;

Also a side note: I'm wondering if this can be optimized to have less divisions.

> +}
> +
>  static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
>                                         struct seq_file *s,
>                                         unsigned pin)
>  {
>         struct pcs_device *pcs;
> -       unsigned val, mux_bytes;
> +       unsigned int val;
>         unsigned long offset;
>         size_t pa;
>
>         pcs = pinctrl_dev_get_drvdata(pctldev);
>
> -       mux_bytes = pcs->width / BITS_PER_BYTE;
> -       offset = pin * mux_bytes;
> +       offset = pcs_pin_reg_offset_get(pcs, pin);
>         val = pcs->read(pcs->base + offset);
> +
> +       if (pcs->bits_per_mux)
> +               val &= pcs->fmask << pcs_pin_shift_reg_get(pcs, pin);
> +
>         pa = pcs->res->start + offset;
>
>         seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);
> @@ -384,7 +410,6 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
>         struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
>         struct pcs_gpiofunc_range *frange = NULL;
>         struct list_head *pos, *tmp;
> -       int mux_bytes = 0;
>         unsigned data;
>
>         /* If function mask is null, return directly. */
> @@ -392,29 +417,27 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
>                 return -ENOTSUPP;
>
>         list_for_each_safe(pos, tmp, &pcs->gpiofuncs) {
> +               u32 offset;
> +
>                 frange = list_entry(pos, struct pcs_gpiofunc_range, node);
>                 if (pin >= frange->offset + frange->npins
>                         || pin < frange->offset)
>                         continue;
> -               mux_bytes = pcs->width / BITS_PER_BYTE;
>
> -               if (pcs->bits_per_mux) {
> -                       int byte_num, offset, pin_shift;
> +               offset = pcs_pin_reg_offset_get(pcs, pin);
>
> -                       byte_num = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
> -                       offset = (byte_num / mux_bytes) * mux_bytes;
> -                       pin_shift = pin % (pcs->width / pcs->bits_per_pin) *
> -                                   pcs->bits_per_pin;
> +               if (pcs->bits_per_mux) {
> +                       int pin_shift = pcs_pin_shift_reg_get(pcs, pin);
>
>                         data = pcs->read(pcs->base + offset);
>                         data &= ~(pcs->fmask << pin_shift);
>                         data |= frange->gpiofunc << pin_shift;
>                         pcs->write(data, pcs->base + offset);
>                 } else {
> -                       data = pcs->read(pcs->base + pin * mux_bytes);
> +                       data = pcs->read(pcs->base + offset);
>                         data &= ~pcs->fmask;
>                         data |= frange->gpiofunc;
> -                       pcs->write(data, pcs->base + pin * mux_bytes);
> +                       pcs->write(data, pcs->base + offset);
>                 }
>                 break;
>         }
> @@ -724,14 +747,8 @@ static int pcs_allocate_pin_table(struct pcs_device *pcs)
>         for (i = 0; i < pcs->desc.npins; i++) {
>                 unsigned offset;
>                 int res;
> -               int byte_num;
>
> -               if (pcs->bits_per_mux) {
> -                       byte_num = (pcs->bits_per_pin * i) / BITS_PER_BYTE;
> -                       offset = (byte_num / mux_bytes) * mux_bytes;
> -               } else {
> -                       offset = i * mux_bytes;
> -               }
> +               offset = pcs_pin_reg_offset_get(pcs, i);
>                 res = pcs_add_pin(pcs, offset);
>                 if (res < 0) {
>                         dev_err(pcs->dev, "error adding pins: %i\n", res);
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
