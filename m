Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC02F388353
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 01:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbhERXwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 19:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhERXwK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 19:52:10 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BEEBC061760
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 16:50:51 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z13so16329846lft.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 16:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Or2R4Rgp1bMsUJI5I59/6T+1pBzEGWKIXn0WeYpuT0M=;
        b=IGtBmndmCZfB4uX/YyPwXljP4djbXMsu0NxAogv7ai7K9ZHTkAW4pcHaN2Uw2RDcfP
         svXenHwGWnTf7zcrNk0dqZroLnO/bOW9vzubw5Xb1kDwWmxiqLZJQxEmuX/toYHF+X2n
         Ycnua+2Jt5PeaCP6XC32zNyKYEetxQ6K8QxEyZ+6wZsZcs1PZAPfhkcQ7xzp5WxlOVLe
         b91pu1s36ZAtwk2pistrQM9PnfY0Hlxc8JMkzrmNavxn/U0aER5DgnmgVHwt0300zp8y
         Q2I6lyWo/k248pgBHwv71GBdfHuXpoif5Ym4IqZaI2C2VzbG8wtFZF2GJTq7E40a9/sx
         SZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Or2R4Rgp1bMsUJI5I59/6T+1pBzEGWKIXn0WeYpuT0M=;
        b=LfED50Zpd39A2gv7+utsF8nP5IirIoVKYE3h2wXIMAbrUvNMwnxJhEa2HTBHzraGUu
         jrHgvbN4QsRztxZ9PKNwOyRB5FB1r7xVvwx2F/cls5GZB1td93GpPa6MhpwiX1V1+1hF
         4E+kWmgctPGLx782fqa+l0uNI6bKh+YFw/LoukUKzHdBhQy7Pbmj+7KLsbzguGbccRwr
         cr9/INv8PIWgDi/FVoWMHjCYVEBldWFSv8gOwGc/S4J16sdDGTmXQSZGJAtLfiiBYVJ3
         mV+FlBJC6wg/hHHaGS++gfKfv/TLm/TsDFTyr43O36DCJAOEljpneQM3Cl99nmCF+zZm
         foHQ==
X-Gm-Message-State: AOAM530Bc/Wiev+ZLjSLRR2+Q5fyJb0JAbtt/R4KZHgEbjXf31NsRXUJ
        zFGjDcvVkib8xAxDe16eopZV+A9iWIovApg2FNPirA==
X-Google-Smtp-Source: ABdhPJzmiFR7Y8glCvCrYZeMmfzFV7Wqr+nA7KGRL/dsYpUpI2qFsGj6xuY9vsGG6ua8zEMbHkW63HEJbWQmBmFoIA8=
X-Received: by 2002:a19:a418:: with SMTP id q24mr5701463lfc.649.1621381849628;
 Tue, 18 May 2021 16:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210514123309.134048-1-tsbogend@alpha.franken.de>
In-Reply-To: <20210514123309.134048-1-tsbogend@alpha.franken.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 May 2021 01:50:39 +0200
Message-ID: <CACRpkdYTor-c2qvE=6YD4A+NmvpLgS3LsOfNpBZ5EdTrDkGgkg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Thomas,

thanks for your patch!

I can see this is starting to look really good.

There is one thing that confuses me:

On Fri, May 14, 2021 at 2:33 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:

> IDT 79RC3243x SoCs integrated a gpio controller, which handles up
> to 32 gpios. All gpios could be used as an interrupt source.
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v5:
(...)

> +static int idt_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
> +{
(...)
> +       /* hardware only supports level triggered */
> +       if (sense == IRQ_TYPE_NONE || (sense & IRQ_TYPE_EDGE_BOTH))
> +               return -EINVAL;
(...)
> +       irq_set_handler_locked(d, handle_level_irq);

But:

> +static void idt_gpio_ack(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
> +
> +       writel(~BIT(d->hwirq), ctrl->gpio + IDT_GPIO_ISTAT);
> +}
(...)
> +       .irq_ack = idt_gpio_ack,

Correct me if I'm wrong but I thing .irq_ack() is only called
from handle_edge_irq ... so never in this case.

Can this ACK just be deleted?

The code in the ACK callback also looks really weird:
write all bits except for the current IRQ into the status
register? It's usually the other way around with these
things. That really makes me suspect it is unused.

Yours,
Linus Walleij
