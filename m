Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 845604DFD1
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 06:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfFUErb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jun 2019 00:47:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:38510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbfFUEra (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 Jun 2019 00:47:30 -0400
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30A95208C3;
        Fri, 21 Jun 2019 04:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561092449;
        bh=2e8ga/L8SEdmf7Lt7noZ+sWu8LCAOrQ1GgcWN6Trw2Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qYxeNh9SgFH2otygFAopDpn5bSOOXzOOQZC4JsuMuf4GuzcJyQV0reiVbvvkiY5HI
         F4dd+WuPxJse1K8QLSqfnYlWqbMZlKcri2Ld9bg465c79KSydP0mhl2Mmd8k7REWC1
         Sr9oaTAuAAolnFN+SfpW3LxDZRzCpBFyt4tMe68o=
Received: by mail-wm1-f52.google.com with SMTP id c6so5160535wml.0;
        Thu, 20 Jun 2019 21:47:29 -0700 (PDT)
X-Gm-Message-State: APjAAAWTt1GloL18XJNHbPIylraSQGUm/+mxYlegcKy/AsLFFtsSAGQF
        o1tUVq4oT+6W6AP+pC6qWowHetdwEkNiaP1A1Cs=
X-Google-Smtp-Source: APXvYqzfssEVgigV9IyaopMmsOAvPClq7Yi3q82LMxYgtG/hvzSp2webHvdicOT4RPzD/wIoTvtKET482lzGX4xkvaI=
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr2131534wmb.152.1561092447753;
 Thu, 20 Jun 2019 21:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-2-drinkcat@chromium.org>
In-Reply-To: <20190429035515.73611-2-drinkcat@chromium.org>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Thu, 20 Jun 2019 21:47:16 -0700
X-Gmail-Original-Message-ID: <CAGp9LzouA3vKf6Hb=Jdy2FLG_Hkzartaksav-JpbRiVkxAACiQ@mail.gmail.com>
Message-ID: <CAGp9LzouA3vKf6Hb=Jdy2FLG_Hkzartaksav-JpbRiVkxAACiQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Ignore interrupts that are wake
 only during resume
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nicolas,

On Sun, Apr 28, 2019 at 8:55 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Before suspending, mtk-eint would set the interrupt mask to the
> one in wake_mask. However, some of these interrupts may not have a
> corresponding interrupt handler, or the interrupt may be disabled.
>
> On resume, the eint irq handler would trigger nevertheless,
> and irq/pm.c:irq_pm_check_wakeup would be called, which would
> try to call irq_disable. However, if the interrupt is not enabled
> (irqd_irq_disabled(&desc->irq_data) is true), the call does nothing,
> and the interrupt is left enabled in the eint driver.
>
> Especially for level-sensitive interrupts, this will lead to an
> interrupt storm on resume.
>
> If we detect that an interrupt is only in wake_mask, but not in
> cur_mask, we can just mask it out immediately (as mtk_eint_resume
> would do anyway at a later stage in the resume sequence, when
> restoring cur_mask).
>
> Fixes: bf22ff45bed ("genirq: Avoid unnecessary low level irq function calls")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/mtk-eint.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index f464f8cd274b75c..737385e86beb807 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -318,7 +318,7 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
>         struct irq_chip *chip = irq_desc_get_chip(desc);
>         struct mtk_eint *eint = irq_desc_get_handler_data(desc);
>         unsigned int status, eint_num;
> -       int offset, index, virq;
> +       int offset, mask_offset, index, virq;
>         void __iomem *reg =  mtk_eint_get_offset(eint, 0, eint->regs->stat);
>         int dual_edge, start_level, curr_level;
>
> @@ -328,10 +328,24 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
>                 status = readl(reg);
>                 while (status) {
>                         offset = __ffs(status);
> +                       mask_offset = eint_num >> 5;
>                         index = eint_num + offset;
>                         virq = irq_find_mapping(eint->domain, index);
>                         status &= ~BIT(offset);
>
> +                       /*
> +                        * If we get an interrupt on pin that was only required
> +                        * for wake (but no real interrupt requested), mask the
> +                        * interrupt (as would mtk_eint_resume do anyway later
> +                        * in the resume sequence).
> +                        */
> +                       if (eint->wake_mask[mask_offset] & BIT(offset) &&
> +                           !(eint->cur_mask[mask_offset] & BIT(offset))) {
> +                               writel_relaxed(BIT(offset), reg -
> +                                       eint->regs->stat +
> +                                       eint->regs->mask_set);
> +                       }
> +
>                         dual_edge = eint->dual_edge[index];
>                         if (dual_edge) {
>                                 /*
> --
> 2.21.0.593.g511ec345e18-goog
>
