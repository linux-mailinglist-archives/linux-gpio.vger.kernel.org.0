Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE402FE5A9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 09:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbhAUI4s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 03:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728264AbhAUI4Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 03:56:25 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A3AC0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 00:55:37 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id j138so307705vsd.8
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 00:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ePsu1N7aD3BdUwzr3RcjhQbXEG8+bIemaO7C4xKDs2A=;
        b=Dmmxrw/ElDqEXAM9Qtq+V/hu48fzs4rvxkyHyBHsg45ozoS55ZMz39ndyE2rKMYvAP
         N07ZymUbewZ7oqS+k4b1OKgosrOcBt5tUvJmz3bGXcij1HIswjtnsx4oy9gj5F+oG+uf
         45qKAXJvn/b6l6sI7xXAItrPqGrSYDURu7VYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ePsu1N7aD3BdUwzr3RcjhQbXEG8+bIemaO7C4xKDs2A=;
        b=Yu+JCP6k6V+v2DobvqtZZ1SQN9hGWQkfVpb1W103RKTvwZCjdu4GhBuQc9cv7CdV5a
         JoQsEd9Ru007mJUbuUbjK/U+1mAqRh45Up2IA6ogKHPXceC/5nkKBZ/KTrT9/BnQVMeX
         KTlzZu7kj5jS4ttJ3E3BMGjK5rjQfdQMOCg0QcSrmMLckeM0nBH4jkagLqvjqylIvV1z
         78Dk/tofbjdwUPN8A453Q+wRvD4FeFXUv0xM6fXTij5rBUtCA6BhiBht4Ytce749FvxH
         OJqVDiA7iOejFVvc24casWtGc6BODwI7U+qXGJHbMijVlJ4eNAS0iQ7gzxKGkcoTdURP
         DsLQ==
X-Gm-Message-State: AOAM533/cO/DkT+KdXGWGVjkBQWbKQ1inRjF7P6+E/0Ig/g0N4c92tBb
        RxNTSICL5usO9MHmcDD3agZNdV+pNYmgabGEEjKFEg==
X-Google-Smtp-Source: ABdhPJwxrDWSJlmr6JsdKTRj7/1M3Ec382ozhg9FjxGukN5mtPevGUwKoeEIFrQhHTvT1P4bO5GUAfKiwlkreLAWmv4=
X-Received: by 2002:a05:6102:34f:: with SMTP id e15mr9659982vsa.21.1611219336958;
 Thu, 21 Jan 2021 00:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20210121075149.1310-1-hailong.fan@mediatek.com>
In-Reply-To: <20210121075149.1310-1-hailong.fan@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 21 Jan 2021 16:55:25 +0800
Message-ID: <CANMq1KBqKUofLaM+OEaTq6PSeYomNSLvn65c+Wyi1cKsLDNboQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: mediatek: Fix trigger type setting follow
 for unexpected interrupt
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

On Thu, Jan 21, 2021 at 3:52 PM Hailong Fan <hailong.fan@mediatek.com> wrote:
>
> When flipping the polarity will be generated interrupt under certain
> circumstances, but GPIO external signal has not changed.
> Then, mask the interrupt before polarity setting, and clear the
> unexpected interrupt after trigger type setting completed.
>
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> ---
> Resend since some server reject.
> ---
>  drivers/pinctrl/mediatek/mtk-eint.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 22736f60c16c..3acda6bb401e 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -157,6 +157,7 @@ static void mtk_eint_ack(struct irq_data *d)
>  static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
>  {
>         struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
> +       unsigned int unmask;

bool?

>         u32 mask = BIT(d->hwirq & 0x1f);
>         void __iomem *reg;
>
> @@ -173,6 +174,13 @@ static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
>         else
>                 eint->dual_edge[d->hwirq] = 0;
>
> +       if (!mtk_eint_get_mask(eint, d->hwirq)) {
> +               mtk_eint_mask(d);
> +               unmask = 1;
> +       } else {
> +               unmask = 0;
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

Why are you dropping this? Aren't we at risk to miss the first edge
after mtk_eint_set_type is called?

> +       mtk_eint_ack(d);
> +       if (unmask == 1)

Just `if (unmask)`

> +               mtk_eint_unmask(d);
>
>         return 0;
>  }
> --
> 2.18.0
