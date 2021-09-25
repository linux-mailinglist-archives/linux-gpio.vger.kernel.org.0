Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A44417E68
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Sep 2021 01:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbhIXXtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 19:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbhIXXts (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 19:49:48 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B6EC06161E
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 16:48:13 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id u8so46042173lff.9
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 16:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ODWwcp9dc3Rx2L9zFdDyrTu7n5EdIV9thpMDCNrjnQ0=;
        b=a+DtypX7LrkejFRzAg1CkVLzp15SCgQJNOqziPoP8tVq2CTqkk7bCVXvLcPo89YS3E
         4FZMyA1FWlLMmSAzGSt580gj3EAr77Bxq4i8TpeoD7CMdXoVuDUMO/ZO7ua24pN1vEJa
         zohVlCQ+LEOctOZk6LVJw5BQzc5g587LDy+FHNAo3SQ65qpoROpLrqnTiQILUzeEuC1f
         8uwnODPDTVn53+78LeNNuHLDA+LXTuQtn99NlZoJjWMRZbocGTlXcqm51LC+9RTB8+xn
         kbHmsLTmGA64EHLkZuJF54m8lO3T6BMj28TsIt8HQa2TgOsHFZB9UyW5Q1SF+cbz+m2C
         2adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ODWwcp9dc3Rx2L9zFdDyrTu7n5EdIV9thpMDCNrjnQ0=;
        b=xkUFReOqA18SDC/68HcEo+aFMqrnhPPhanNhWzHamVknW4V98DFPQBBQyczMysSE5N
         7iTgmxWEQTDZp7XjnMDGqQvlz1ThZFOH5nOUJxn/aP9wrRYNdsZsWPiDm2G3KGzLsIwG
         FFmKnKoc/ZvU3URbtcAZetNs+/mediUkqNxRlkMeSV5oJsVoidgqZ7AUqMUvBBPxiCIX
         HKChv8KsLQ4iRc/ednKzvcn3KG90KHFwQemqNGSB+ilBapBvEMmPVNAAW8UeuApqDJ48
         9MKlZ1qv5rLXeuVwD0wxn5WASnhizV0IXChLKXjxsBRqyBqRItUsFU1uVA+tDozW3nO3
         WjUQ==
X-Gm-Message-State: AOAM533bqX2xkhxQFwuf9DhKXwll28RvFW2KSAL3NXOzP4CCYrRQVrNo
        gsDaVm87xdytZDGY/TH1nyc1sWTQbtgzg1n2FFrOuA==
X-Google-Smtp-Source: ABdhPJyC6RxI4N8ux7a3Vj2XCnFeUd3Eqf7IlxJwPR0NIU/3PHgxDNWtzeDF5wG316mbCSrF+m5PcZPWUKyPtvkt0Uo=
X-Received: by 2002:ac2:4651:: with SMTP id s17mr11792264lfo.584.1632527291369;
 Fri, 24 Sep 2021 16:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210923202216.16091-1-asmaa@nvidia.com> <20210923202216.16091-2-asmaa@nvidia.com>
 <YU26lIUayYXU/x9l@lunn.ch>
In-Reply-To: <YU26lIUayYXU/x9l@lunn.ch>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 25 Sep 2021 01:48:00 +0200
Message-ID: <CACRpkdbUJF6VUPk9kCMPBvjeL3frJAbHq+h0-z7P-a1pSU+fiw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: mlxbf2: Introduce IRQ support
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        David Thompson <davthompson@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 24, 2021 at 1:46 PM Andrew Lunn <andrew@lunn.ch> wrote:

> > +static int
> > +mlxbf2_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
> > +{
> > +     struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
> > +     struct mlxbf2_gpio_context *gs = gpiochip_get_data(gc);
> > +     int offset = irqd_to_hwirq(irqd);
> > +     unsigned long flags;
> > +     bool fall = false;
> > +     bool rise = false;
> > +     u32 val;
> > +
> > +     switch (type & IRQ_TYPE_SENSE_MASK) {
> > +     case IRQ_TYPE_EDGE_BOTH:
> > +     case IRQ_TYPE_LEVEL_MASK:
> > +             fall = true;
> > +             rise = true;
> > +             break;
> > +     case IRQ_TYPE_EDGE_RISING:
> > +     case IRQ_TYPE_LEVEL_HIGH:
> > +             rise = true;
> > +             break;
> > +     case IRQ_TYPE_EDGE_FALLING:
> > +     case IRQ_TYPE_LEVEL_LOW:
> > +             fall = true;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
>
> I'm still not convinced this is correct. Rising edge is different to
> high. Rising edge only ever interrupts once, level keeps interrupting
> until the source is cleared. You cannot store the four different
> options in two bits.
>
> Linus, have you seen anything like this before?

No, and I agree it looks weird.

There must be some explanation, what does the datasheet say?

Yours,
Linus Walleij
