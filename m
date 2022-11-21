Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0E2632D42
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 20:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiKUTtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 14:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbiKUTtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 14:49:22 -0500
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E4E92B78
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 11:49:19 -0800 (PST)
Received: by mail-pg1-f176.google.com with SMTP id f3so12112153pgc.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 11:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5aKme5DcX/lL77tpRcjuWguTpjP2I1TIyYdducXwKY=;
        b=jqWeHUSu6kMTN4/mI4s5If1jGWQgSMHcVCNamNkgMOmooJk20XPHMvHIU/Pa9cW0+o
         xjH/kwOMyR9RLuVHPvPpOo0+P86ykOz5jekkdd8bNSm4Eb1oLReUVV1bJ+Xv/KXW6kVW
         aLFseKJTxl+cuXDNrOk3YQfr0VoLdrJndeskOOjhhBIoQP+4QnlChvLpj3pG2k46Mn5j
         M9W+A4l1qcqNVGsJgUuUKnfhJjvz6iYbXW+TWbyJHx3FxhmuWvx38ISbKcDsvsdX9x72
         kBEXYBhE7gk3Rz31BbgV0A+uyt0ELJ3NSfu8hMc9IM6xFRi4I4A6rIQBDxki+oipZaWf
         lFQg==
X-Gm-Message-State: ANoB5pkSkXc2mG4u/DIoZanDHu90++njklkHeoKL+h9I1AzDXREze0kC
        bgmg7pv1JA3fQ2G9HKB+NtnVJAxJnzyZ/UnWwz9lQodR
X-Google-Smtp-Source: AA0mqf4mhB02gtrm2tW5g3f5xRGg8TbIMOEkTNHrkIwaaycbzpFVNOibyfumWTT26ASRwqDzue6jbWyXp6UHBKhx2yc=
X-Received: by 2002:a63:530f:0:b0:476:bfca:38ad with SMTP id
 h15-20020a63530f000000b00476bfca38admr942516pgb.576.1669060158635; Mon, 21
 Nov 2022 11:49:18 -0800 (PST)
MIME-Version: 1.0
References: <3b6b8597792a393d0f21b8489dd933663dfd2b90.1669045778.git.geert+renesas@glider.be>
In-Reply-To: <3b6b8597792a393d0f21b8489dd933663dfd2b90.1669045778.git.geert+renesas@glider.be>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Mon, 21 Nov 2022 20:49:07 +0100
Message-ID: <CANBLGczF=ytUUUf=FbwRuHr-RpJ+K_mUQEj7FXCTOLTpodJ_vQ@mail.gmail.com>
Subject: Re: [PATCH resend] pinctrl: starfive: Use existing variable gpio
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 21 Nov 2022 at 16:51, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the existing variable "gpio", instead of obtaining the hwirq number
> again.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index bdf61cfd143a5120..6fe5e1e9baa9b20a 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -1086,7 +1086,7 @@ static void starfive_irq_mask(struct irq_data *d)
>         writel_relaxed(value, ie);
>         raw_spin_unlock_irqrestore(&sfp->lock, flags);
>
> -       gpiochip_disable_irq(&sfp->gc, d->hwirq);
> +       gpiochip_disable_irq(&sfp->gc, gpio);
>  }
>
>  static void starfive_irq_mask_ack(struct irq_data *d)
> @@ -1115,7 +1115,7 @@ static void starfive_irq_unmask(struct irq_data *d)
>         unsigned long flags;
>         u32 value;
>
> -       gpiochip_enable_irq(&sfp->gc, d->hwirq);
> +       gpiochip_enable_irq(&sfp->gc, gpio);
>
>         raw_spin_lock_irqsave(&sfp->lock, flags);
>         value = readl_relaxed(ie) | mask;
> --
> 2.25.1
>
