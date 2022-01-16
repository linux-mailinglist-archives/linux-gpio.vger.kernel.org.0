Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1F7848F9D4
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 01:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbiAPABG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 19:01:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbiAPABG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 19:01:06 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F587C06161C
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:01:06 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id s127so18007068oig.2
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kADQFhR2AfzvIpqsJVy4t8n1qBnT7lu/EvJZU+85jgQ=;
        b=LLg16acyV9ssxzPynuDwH/S0CSc9tMRmrCIGdfwdrK7w85YRVu4Npgj+M//L/tDr1j
         +PEhJUymrMgWTts01augIl92yJZf1aVBfKdzBN9nHzipXIpTkLbTuWuUO9Uaf3zjE32h
         TbZXMS7sGGEK/1YkGFWy3HamgZZrEUuWJst5u7mTLybjcK/qWzghX8gcX2xy4yr1WtuH
         zjcFNZc24bkMehhg9rtL3RhaxpLOxleTi9rtFlTtXdLzs5UGZ1ewf1hRQ7kfSme0TB85
         mwuZXvIwGlvIKbSgTXEMEFRziLFU8E2p6X4JtqhoNSQACmTiaVnaWfw1qzfwemqMO32X
         v6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kADQFhR2AfzvIpqsJVy4t8n1qBnT7lu/EvJZU+85jgQ=;
        b=72DRtEoRkgIG+f+wKwWPIYuhWnieihJHOnbDnAB7cvCGA3aixN8gNhRuZht48Vf+5f
         1ji/Cw08VH1mhDzcRUxOqbahD0rn+u6iIIV+wg0/OVifxaadVucYeFz1RFt2CaIJAJHr
         zGV2tGR6iVFzP2uNwl90Ibva85gbGOt/VuChyhlFX64e2CowHu5QzyStdLMRF6Sl2zcD
         +mP9087/0qDNu3npkCHwvqHLPfLRZu8aaEIIjChXY1Z6imooBoFGyllVoeL3cv0D5opQ
         HCqgsRZQ88bvEWiDrnLP4nNGfUJbhpnKue/JF1PKAfpeRd4dE9cte/R2q8Tg5sxlbj5J
         Pk6w==
X-Gm-Message-State: AOAM531j4G5Km9IR7HdBR0+yApBe9oZzmOiRQF454OPGpeT81laEZaPW
        4qdDijK8A5GbmeNRm1PeAzsE1xJqvbQhphTiuCRvyQ==
X-Google-Smtp-Source: ABdhPJytr9O5BgJJKKvmhJe6nwvjD4EG7WvnlzXNK+Ha+gaYYY8i+iU7YPfleFA4yPpF/1UCw+73EDGmS+2gySZs2Gs=
X-Received: by 2002:a05:6808:2097:: with SMTP id s23mr8244855oiw.132.1642291264587;
 Sat, 15 Jan 2022 16:01:04 -0800 (PST)
MIME-Version: 1.0
References: <20220104140913.29699-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220104140913.29699-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:00:53 +0100
Message-ID: <CACRpkdaPVQ4jph5mWca9-ubAZjV6tpSpUfjJrsK+0+Si6yqtwQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: at91-pio4: Use platform_get_irq() to get the interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 4, 2022 at 3:10 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
>
> While at it, replace the dev_err() with dev_dbg() as platform_get_irq()
> prints an error message upon error.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * Switched using platform_get_irq()
> * Replaced dev_err() with dev_dbg()

Looks good to me but I'd like some ACK from a Microchip person
before I merge this (for v5.18).

Yours,
Linus Walleij
