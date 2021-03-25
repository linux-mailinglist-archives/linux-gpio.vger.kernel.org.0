Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F11348B4C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 09:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhCYIOf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 04:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhCYIOE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 04:14:04 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EAFC06174A
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:14:03 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id o10so1197618lfb.9
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MiLTBuOYON0mmjwVXAuCho4Q8c3JY+XxyqaaZQopoXU=;
        b=q6I10zPF8jYgHSj89yolaw2lySm4+tAhYarqBWhZ/q1+cAh9X+5nIFfc5xeZR7+9/d
         v0I5OgWmXMIaTLmXBXo03CEKFwdbkixAgNaLpX7cNHzSDH9e+FxefAx8h9vg48UXFzJI
         coJc8zBPxlcmcdPZwCE3iyLkxMPPnSD2/WtrX/sOJ636ewvw7oVYIAdag5GaRhAb3ElY
         ETLrlFf4L1T1W9z1Ivz8t6YqBHicWj4JqKwM6bl08uYCmlld59diBcHrXxx7E8N3+8AW
         tjOvHe8Z5hFcZhvdQ8f7zq5SIMQ88J202lzQCi6HGbCDy7iHpcxEy5eZJUiCOh61Xnj6
         irXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MiLTBuOYON0mmjwVXAuCho4Q8c3JY+XxyqaaZQopoXU=;
        b=sb13hhYEWDo3+QJOCh9a7B8QxxEAK3/dd0oeXSkFE/qP3nKrdEgzU8X/scdgcFn7gZ
         kuhUlH9W8ZJa5obCaZn9UR8Cw+MQzBgFDxwc6xCmYhNA1Up5t/RbmetDesagBStMznYX
         Sz9ex02Pwrp1ajlm0UZPoyxEmL7xdufWKogoff0hHtVcgSAGNhqeBjo3RK1vZ8+WY1zW
         Jv4gWLTejf/YSH1Yx78Tmf+Ysmh7WwgkH03ggikHyDFVpn6PF8296UJa8nkxDhA4Ep6q
         pAw9KHXKog0hxbzlydqV5cC4plS7CtimxPWqO9gf3gNiOnidrID2Q2m7utcG5QEI4ez4
         maVQ==
X-Gm-Message-State: AOAM532cWfmWUGByh1Uy/q8SG+eaXbiRUueskiTYFKONxLFMw27+sKBe
        zoqi6xrUEkXkmPZ6PqZozkc0dMgrsG5di1iNZxs0tg==
X-Google-Smtp-Source: ABdhPJyZYg4I5cQP6CTtXyp/9MqAFeYPZVw5Y2tnnAEVdhSwOdGGnFgN/R1jBUmYq9S7/CfkJklFEW6hiGcKf3BWIFo=
X-Received: by 2002:a05:6512:c0b:: with SMTP id z11mr4413581lfu.586.1616660042259;
 Thu, 25 Mar 2021 01:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com> <20210317151928.41544-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210317151928.41544-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 09:13:51 +0100
Message-ID: <CACRpkdaZwAg4X9QT4QMR2GSH6Cekc7Xuk+-pqhCyON-Y3cnCrA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: sch: Add edge event support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jan Kiszka <jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 4:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> Add the required infrastructure to enable and report edge events
> of the pins to the GPIO core. The actual hook-up of the event interrupt
> will happen separately.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I can't believe it that nobody added irq support to this driver for 10
years given how widely deployed it is! (Good work.)

Don't you need to add

select GPIOLIB_IRQCHIP

to Kconfig? So the gpio_chip contains the .irq member you're using.

> +       sch->irqchip.name = "sch_gpio";
> +       sch->irqchip.irq_ack = sch_irq_ack;
> +       sch->irqchip.irq_mask = sch_irq_mask;
> +       sch->irqchip.irq_unmask = sch_irq_unmask;
> +       sch->irqchip.irq_set_type = sch_irq_type;
> +
> +       sch->chip.irq.chip = &sch->irqchip;
> +       sch->chip.irq.num_parents = 0;
> +       sch->chip.irq.parents = NULL;
> +       sch->chip.irq.parent_handler = NULL;
> +       sch->chip.irq.default_type = IRQ_TYPE_NONE;
> +       sch->chip.irq.handler = handle_bad_irq;

I always add a local variable like:

struct gpio_irq_chip *girq;

And assign with the arrow, so as to make it easier to read:

girq->parent_handler = NULL

etc.

+/- the above:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
