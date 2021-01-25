Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116B13020D3
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 04:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbhAYDZJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jan 2021 22:25:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbhAYDZI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jan 2021 22:25:08 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF611C061573
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 19:24:27 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id 43so3969506uag.12
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 19:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mCmh2kWpn9Xf7nqnBfNwjaSrOMJ8Dlsin1zC2EYEHJM=;
        b=DxgVfbgSgEU3qgjORZIqffrN0lR2zv6uJlzsMyt1HdJ74Zta1SnL83jfWhNjn/ka8V
         TeU18fLLS7MzAQMqTJQkUKs9gNo1UIWDxHy31rUO1XBhmxpi9c8NUkO3LqH124Y291qe
         /pAoAw1tjynLxxN3eNPD/F8GUhnNuYTmh8ZKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mCmh2kWpn9Xf7nqnBfNwjaSrOMJ8Dlsin1zC2EYEHJM=;
        b=XH5IoSRpM12j+t/ToAQ8IT53hWxC07pLyy6rsWuOTGuLKOQ7RE4JDi/70etBcaiJW8
         eAepcfvXv8496qvN7qqaXID/M90zjApD4rCjFflgg3FYb4QwN8yYEOdNKEf1yrzomw7g
         XdR622EV0RH8Pv03z6J/UtI91ZcsJOPvUP07APRT1pqodfxWrlDIxLNtqcI7T1H/ejHE
         39Bb26Te/k/PYlquY9nK1/cu83mqpy6oGZbANzWMYOE78aE0MC/2FmYxo+RZRiXAkVEC
         jYNi9DTPsq5ON8SmGbDP6dI5+qXHd6/RIq42jIWCeGYJsh+WjGs7LuEFjZRLH1mNKU++
         ewcg==
X-Gm-Message-State: AOAM5330JnX7Yex4Ih0WKv2Y+9c1WaAAyLqjFkguM9Y25cJgAQbnBoaI
        /ReGNbuEu6Qx7+fGY7pnI0j637v7ffUwLV6tNGP0kw==
X-Google-Smtp-Source: ABdhPJyYWCvHa9SZ4CbA+9JK6kGYitKJP5aZI/nt5+g9QIrUsiAgnlrD05UCiXdDd4g7lvPf5Y9Qa6n2R/zQn+Vy8zQ=
X-Received: by 2002:ab0:3043:: with SMTP id x3mr105842ual.88.1611545066853;
 Sun, 24 Jan 2021 19:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20210125031513.1741-1-hailong.fan@mediatek.com>
In-Reply-To: <20210125031513.1741-1-hailong.fan@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 25 Jan 2021 11:24:16 +0800
Message-ID: <CANMq1KCfBy9dRELP-hMjY5FraachcRGHEC9mmaMjJCLQzdu+ZA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix trigger type setting follow for
 unexpected interrupt
To:     Hailong Fan <hailong.fan@mediatek.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>, youlin.pei@mediatek.com,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Chen-Tsung Hsieh <chentsung@chromium.org>,
        gtk_pangao@mediatek.com, Hanks Chen <hanks.chen@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 11:15 AM Hailong Fan <hailong.fan@mediatek.com> wrote:
>
> When flipping the polarity will be generated interrupt under certain
> circumstances, but GPIO external signal has not changed.
> Then, mask the interrupt before polarity setting, and clear the
> unexpected interrupt after trigger type setting completed.

I'd add a short note about why you remove mtk_eint_flip_edge, that is,
because mtk_eint_unmask already calls it.

>
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> ---
> [V2]
> ---
>  drivers/pinctrl/mediatek/mtk-eint.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 22736f60c16c..0042f32c7e7e 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -157,6 +157,7 @@ static void mtk_eint_ack(struct irq_data *d)
>  static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
>  {
>         struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
> +       bool unmasked;

Well, this is true if the interrupt has been masked (or, equivalently,
if we need to unmask it later).

So I think either "masked" or "unmask" are better as variable names.

>         u32 mask = BIT(d->hwirq & 0x1f);
>         void __iomem *reg;
>
> @@ -173,6 +174,13 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
>         else
>                 eint->dual_edge[d->hwirq] = 0;
>
> +       if (!mtk_eint_get_mask(eint, d->hwirq)) {
> +               mtk_eint_mask(d);
> +               unmasked = true;
> +       } else {
> +               unmasked = false;
> +       }
> +
>         if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)) {
>                 reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->pol_clr);
>                 writel(mask, reg);
> @@ -189,8 +197,9 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
>                 writel(mask, reg);
>         }
>
> -       if (eint->dual_edge[d->hwirq])
> -               mtk_eint_flip_edge(eint, d->hwirq);
> +       mtk_eint_ack(d);
> +       if (unmasked)
> +               mtk_eint_unmask(d);
>
>         return 0;
>  }
> --
> 2.18.0
