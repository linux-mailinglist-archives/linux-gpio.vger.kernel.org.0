Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A2F33F056
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 13:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCQM2n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 08:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhCQM2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 08:28:18 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84356C06174A;
        Wed, 17 Mar 2021 05:28:18 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id z5so711680plg.3;
        Wed, 17 Mar 2021 05:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bvI9v1pKTWSB+Q5D+4FcitJi47hzIZ/zGTWvTz5RA5o=;
        b=NmLe9K+UAmrek3W+rU4Nzr/U4SN72r5In4gcb7wYCfg/Efxv2L4AvWqlxRBvIRlCZn
         g1soPaqS2Ow/tT+7FLaPtqhp39LUOI77S8ZB6+3KdSL1Dlk2JIHkTJ5A830D1GngTwgo
         VqkVlcqyHITcA7wI0VvDMY0jux8p32/sQg6Yl59n86w+StOHcsX7DSVhEUPDIkXkKaCW
         yEf+mzbfxq9G9HCZ3ayMoEPqyzLcmFzhRyNSnuP9NS1m9tpRkrdC5zXwNt7UOFoTAZYn
         y/LNU+DFB+mBfrgXDo5nn8680IaEtbuBNzsr4dmAmNvXf6NVGzFQ1rFPPhNqFfLayra/
         Pu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bvI9v1pKTWSB+Q5D+4FcitJi47hzIZ/zGTWvTz5RA5o=;
        b=Rkm5QLlLGLWtFI1iaaFDyNe0pKx3pJIjJGwbqKqMcZuBeIzkZ0UKeuBZtSkLD1rGsc
         UeI3t+HIin5jme2zi8NvDcD18Csk5rVKWZ6ci2K1TJIN/iE00Coamrs8YUDQPV54Yv+Z
         IeBFigv1yPr3hGCVqpZcwbRUzj6ErAQPZc2hKeaMGkfUIp8rxJURfuBqefFrlhTdwod7
         bok58fBGv5+qrHijvlfl+lLNt/dJoAISLQ6BIGSDeZPN+BrgJMVcN8iOi1hcsx3clUh4
         uWZjA8rbhnvp1zX0XTzo0qKUlYT5//rKoDmdB51F4ywjRGX4F7ZXhSvFT06u3baEFHi/
         dotg==
X-Gm-Message-State: AOAM530z/ZQSqpHaJPDTLC5I+UE4lmQzZfi9rMidkkIgSel2Ax2H8BDn
        XqCOocorqvvb55ujXrVyzAAv4+e1yysulSp3XRSNtTldVoSorg==
X-Google-Smtp-Source: ABdhPJytMHuglf4+K2gGDKo1Eqmm/u9dzCbrGssky5mSD+PT9vdbsLusidWo2LllMrSBdmIzl8K0EfqmNtXvE292eXw=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr4644470pjb.129.1615984097947;
 Wed, 17 Mar 2021 05:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210316202434.27555-1-hhhawa@amazon.com> <20210316202434.27555-4-hhhawa@amazon.com>
In-Reply-To: <20210316202434.27555-4-hhhawa@amazon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Mar 2021 14:27:53 +0200
Message-ID: <CAHp75VdVnFn+DuO54PsUVGk4ZWWCJpYKsSQVsaUkiDzZki2QRQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: pinctrl-single: fix pcs_pin_dbg_show()
 when bits_per_mux != 0
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

On Tue, Mar 16, 2021 at 11:24 PM Hanna Hawa <hhhawa@amazon.com> wrote:
>
> An SError was detected when trying to print the supported pins in a

What SError is?

> pinctrl device which supports multiple pins per register. This change
> fixes the pcs_pin_dbg_show() in pinctrl-single driver when
> bits_per_mux != 0. In addition move offset calculation and pin offset in

'!= 0' -> 'is not zero'

> register to common function.

Fixes tag?

> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> ---
>  drivers/pinctrl/pinctrl-single.c | 66 ++++++++++++++++++++++----------
>  1 file changed, 45 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index f3394517cb2e..434f90c8b1b3 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -270,20 +270,53 @@ static void __maybe_unused pcs_writel(unsigned val, void __iomem *reg)
>         writel(val, reg);
>  }
>
> +static unsigned int pcs_pin_reg_offset_get(struct pcs_device *pcs,
> +                                          unsigned int pin)
> +{
> +       unsigned int offset, mux_bytes;

Offset can be replaced by direct return statements.

> +       mux_bytes = pcs->width / BITS_PER_BYTE;
> +
> +       if (pcs->bits_per_mux) {
> +               unsigned int pin_offset_bytes;
> +
> +               pin_offset_bytes = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
> +               offset = (pin_offset_bytes / mux_bytes) * mux_bytes;
> +       } else {
> +               offset = pin * mux_bytes;
> +       }
> +
> +       return offset;
> +}
> +
> +static unsigned int pcs_pin_shift_reg_get(struct pcs_device *pcs,
> +                                         unsigned int pin)
> +{
> +       return ((pin % (pcs->width / pcs->bits_per_pin)) * pcs->bits_per_pin);

Too many parentheses.

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
> -       val = pcs->read(pcs->base + offset);
> +       offset = pcs_pin_reg_offset_get(pcs, pin);
> +
> +       if (pcs->bits_per_mux) {
> +               unsigned int pin_shift_in_reg = pcs_pin_shift_reg_get(pcs, pin);

> +               val = pcs->read(pcs->base + offset)
> +                       & (pcs->fmask << pin_shift_in_reg);

One line?
At least move & to the upper line.

> +       } else {
> +               val = pcs->read(pcs->base + offset);

It's the same as in above branch, why not

val = read();
if ()
 val &= fmask << _reg_get(...);

?

> +       }
> +
>         pa = pcs->res->start + offset;
>
>         seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);
> @@ -384,7 +417,6 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
>         struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
>         struct pcs_gpiofunc_range *frange = NULL;
>         struct list_head *pos, *tmp;
> -       int mux_bytes = 0;
>         unsigned data;
>
>         /* If function mask is null, return directly. */
> @@ -392,29 +424,27 @@ static int pcs_request_gpio(struct pinctrl_dev *pctldev,
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
> @@ -724,14 +754,8 @@ static int pcs_allocate_pin_table(struct pcs_device *pcs)
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
