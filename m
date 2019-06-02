Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6FC53236B
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jun 2019 15:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfFBNqN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jun 2019 09:46:13 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45588 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfFBNqN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jun 2019 09:46:13 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so4467314lfm.12
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jun 2019 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/HXePg+U9wYisFggCp2Pzqg3Rwj+xqMpwFPX/mLExcw=;
        b=kmTIPegkoSpcJ8hqye1lqSBQSA7MkeiqNch0W+2HBj7RSol1Jvtjj5QrIzwitU+hIz
         akckmxjuwIQxq3CoddMUkYVUqOsjhEbSterRG+2EC4tTyQYt8H/bvNP1aGKC+dk3FBfT
         8TCZkeexa5fDIsp599kOGla3jttCqBINBPmBrQlTpBsiNSlMbb00/fPdJffvjz8ajOYK
         iVwNJT5Ay/bdeUz64mIMnz31e0pXEQ79gMjuYSMlZwFKh72N+UDjLCVPQQ42LnlMZ+XA
         8J2/dJaI806P5fVy7F0wT32fW/RGcjS4b1Fv+/oRdSFGssK5AG7MnV5OUlsMZKpVYIfA
         cp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/HXePg+U9wYisFggCp2Pzqg3Rwj+xqMpwFPX/mLExcw=;
        b=MeVPT8SvAmlyz5GDrH2btWxtLq04W4UYAoykHRvU1TNSFYOUfCM6v2OhHjX9zODohv
         31LpOMHI10GrwUM4jweZcPagTL6h5g2mDxiYVvHnwtLyxpu/Olqd3ni7VdHaI+ZfpOGn
         25Fyz5NY6zG60nfm+6CLmurqFREdmsjOe/qvsAjOc20SwlTDzSmN18wEU54zDXe8bXw7
         AdKdGDXXi8vtJ1ADKeBkv9OHVxmJqgd8Obs07uV7SCarJVGFHJuNY8awq3+9LBmpgW8/
         XBqRgPIe3HZVjF+1ehBo2V5tfH0ksrN0q8bPydUNrl1xOfwhIXA3OXZnCaoEl0ijhpac
         DuJQ==
X-Gm-Message-State: APjAAAUub/VHZFGKWDcm0WZU8gg6sTkX83AZelUNiOXbAdYqlvVcYskl
        rTGN+ft6Q/A8sN2NowxaD3998ikmZnBlbAJwWRL8TQ==
X-Google-Smtp-Source: APXvYqz6WY5pxflKsXHSMYl4mX+ysp3I0qjeB0QZKykytlcSBEDK9daj1SeTNDVgSkwE6Ex68afJYUMfuStOy42vDGM=
X-Received: by 2002:a19:ae09:: with SMTP id f9mr11059917lfc.60.1559483171545;
 Sun, 02 Jun 2019 06:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145322.20630-1-thierry.reding@gmail.com> <20190529145322.20630-2-thierry.reding@gmail.com>
In-Reply-To: <20190529145322.20630-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jun 2019 15:46:00 +0200
Message-ID: <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 29, 2019 at 4:53 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Hierarchical IRQ domains can be used to stack different IRQ controllers
> on top of each other. One specific use-case where this can be useful is
> if a power management controller has top-level controls for wakeup
> interrupts. In such cases, the power management controller can be a
> parent to other interrupt controllers and program additional registers
> when an IRQ has its wake capability enabled or disabled.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
> - add missing kerneldoc for new parent_domain field
> - keep IRQ_DOMAIN dependency for clarity
>
> Changes in v2:
> - select IRQ_DOMAIN_HIERARCHY to avoid build failure
> - move more code into the gpiolib core

This is looking really good!

>  config GPIOLIB_IRQCHIP
>         select IRQ_DOMAIN
> +       select IRQ_DOMAIN_HIERARCHY
>         bool

Hm OK I guess. It would be ugly to ifdef all hierarchy
code in gpiolib.

>  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
> +       struct irq_domain *domain = chip->irq.domain;
> +
>         if (!gpiochip_irqchip_irq_valid(chip, offset))
>                 return -ENXIO;
>
> +       if (irq_domain_is_hierarchy(domain)) {
> +               struct irq_fwspec spec;
> +
> +               spec.fwnode = domain->fwnode;
> +               spec.param_count = 2;
> +               spec.param[0] = offset;
> +               spec.param[1] = IRQ_TYPE_NONE;
> +
> +               return irq_create_fwspec_mapping(&spec);
> +       }
> +
>         return irq_create_mapping(chip->irq.domain, offset);

This is looking really good!

> +       /*
> +        * Allow GPIO chips to override the ->to_irq() if they really need to.
> +        * This should only be very rarely needed, the majority should be fine
> +        * with gpiochip_to_irq().
> +        */
> +       if (!gpiochip->to_irq)
> +               gpiochip->to_irq = gpiochip_to_irq;

Please drop this. The default .to_irq() should be good for everyone.
Also patch 2/2 now contains a identical copy of the gpiolib
.to_irq() which I suspect you indended to drop, actually.

Other than that I'm ready to merge the v3 of this!

Yours,
Linus Walleij
