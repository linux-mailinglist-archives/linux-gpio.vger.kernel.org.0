Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DB32D82B7
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 00:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407145AbgLKX1x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 18:27:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406928AbgLKX1Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 18:27:24 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447BFC0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:26:44 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id m25so15556960lfc.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z6PhJZv6zHVP6qteVXw9cQb7pTkmh+2trbpC+4pCjps=;
        b=aNmmHGi/zWi5kpFJTnTMq1+watX4PO35pqD0r2jLcVqAVUP6UBt9Eb3uBxi4YFfh0i
         0zeJS7It7fqlxQAEftY4XGC0MGLMrkoi2B+sHmM1J8EbMMj7zzB0arkvtDwNY8Er7AAj
         iM/1vdqagg/2Bedamdmi1Akw6sAjAhLuBd0Ob15DaylDTsTLcUrT9qwmyAK8yVhr/lPu
         LGJ83SiaXoSKRRZDDt6jhmvJjJVxs0n+jJ7izz4NQxKyuSZ5bftepLvJf2LhmL+OsBTj
         bdO+FPuWldrl4Sv3GRPL6sF32lUx3fEV2dLkLFnduFYxi9igLNynAcN09lNld582nxwo
         EP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z6PhJZv6zHVP6qteVXw9cQb7pTkmh+2trbpC+4pCjps=;
        b=uHTWAxhaPMyWpbPxUvyoYLTgS4dO4xJ1t700p3O+q8ufWUNO4lNJvj19oPTErUYqBN
         kvby5iLkOOzdXj0PTRop9jhoWRRChNA3+hKUo0FTxuhfv2ge03sM4LgkOd60wwRhE3Jb
         S/Jxxif9oxIGmq9OiuCMb8R0fw+lV91w1KW40vvYfaSBgwiG/JVE5potUJzEQ6ToOX51
         WMkwr52bvPfGnG+ctPfdvQiUgPtsZJujYs+cbTpV4diTs7pXG79ZIsmpbVkP5BP9WRaq
         dbLi3/UEV52CbZg65LripInXazigth6QtgyGiHi/s6guhbHAIT+acxk27pJi/CKXwdHg
         wsTA==
X-Gm-Message-State: AOAM530l/otfPuCdDusfR5dslFNj63JtxN+z9MQsGrGkY1m1w5UG0z+y
        owhYlpG8qsj2X0cClIyrKE9ZoTQu9zamYb+RCN3x4g==
X-Google-Smtp-Source: ABdhPJw4tAM4PtQO1s/eAGmfEsWUJtb+ticJs8TiFvLhBoTMhtc4ZjM2UG8WjozcdEDVwDdvV1XB7C8e0QxZxuIqHRc=
X-Received: by 2002:a19:6557:: with SMTP id c23mr5077406lfj.157.1607729202738;
 Fri, 11 Dec 2020 15:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20201210070514.13238-1-nikita.shubin@maquefel.me>
In-Reply-To: <20201210070514.13238-1-nikita.shubin@maquefel.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 00:26:31 +0100
Message-ID: <CACRpkdaUdF_4RDWAw=8B_HL0e13KmwU34oYDGc-sFctD_5VAjQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: irq hooks: fix recursion in gpiochip_irq_unmask
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Maulik Shah <mkshah@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 8:06 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:

> irqchip shared with multiple gpiochips, leads to recursive call of
> gpiochip_irq_mask/gpiochip_irq_unmask which was assigned to
> rqchip->irq_mask/irqchip->irq_unmask, these happens becouse of
> only irqchip->irq_enable == gpiochip_irq_enable is checked.
>
> Let's add an additional check to make sure shared irqchip is detected
> even if irqchip->irq_enable wasn't defined.
>
> Fixes: a8173820f441 ("gpio: gpiolib: Allow GPIO IRQs to lazy disable")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Good catch!
Patch applied.

Yours,
Linus Walleij
