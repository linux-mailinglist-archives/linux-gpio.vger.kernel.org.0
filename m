Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1421342C24
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Mar 2021 12:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhCTL2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Mar 2021 07:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhCTL2Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Mar 2021 07:28:24 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36C5C0613E7
        for <linux-gpio@vger.kernel.org>; Sat, 20 Mar 2021 04:28:23 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z25so15073983lja.3
        for <linux-gpio@vger.kernel.org>; Sat, 20 Mar 2021 04:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0w09L7XhqnFc+8seajXonOz7xvdKa2+DDWi/c1I9HBI=;
        b=xLCpH+NfGlYkQhSeyN9OzqVZQ3+5dHm93UrfxQgQPJnfZHk0bA6yJ8NlhKiMGzXA4D
         Mx44DvkvPj4SWQ7Mkx46xc38AdrD8/NL3+WPOCYdEzIBf1MBKkHtG1Lr49KHh3DLXBs6
         KdXO/hLFqi6ebmG6e7aYnH5nX3SSC5LImhV9seAI386bKeVEGCeac5uVrfvwkOYrcOtp
         gtDAsfzegEHlwwVXwUR7bj+H/kkVnYn/RgwYlAey0WBJWkklxlVTfd1dzbGIuvg+M1QP
         IPiOmbsCgbFHz3XOMn2E7iaHFHFF94JvQcJaVYxYtEhPRRb+CAO1S+r2pkgxWGGPht1O
         NkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0w09L7XhqnFc+8seajXonOz7xvdKa2+DDWi/c1I9HBI=;
        b=HnEuuVkKqV+n4I4yyEIyCJ/1ERGFKoJUKNCS14cyzJ5fVoIdh3yso268/GnHZs8gR8
         crTa4I/V2xlQvUNKxns6nyNQZ9kTjON/26LmuYCWeba48533ibgLowObveHUPS1zvB21
         IUHAUwg8iTxmqGRJFW5366/kcADPHm3wbMzuvctzjfv0h/gCQPFsc61WQvLIuL4p0MtX
         0DSpDfq6dyMo2890UYrAqt7Qz5/kwAOSyuX6yo3TGw9XXz6OYdki2na0CBI6H6zfaDVy
         DGoTfep3mVexbFcUy71FpX26/BWZagfrDOFc0r7exBxZRot87Rft7333G8hn1Em14KAx
         7F7g==
X-Gm-Message-State: AOAM53059wP39g8r0Dji53mNyYaFjyADJ3WLj2o70DimeetOvrI+bjs2
        EVHTQOHDkJkhwn5DsX4enkbbINIHFJ515fRTfk2t+w==
X-Google-Smtp-Source: ABdhPJxID5BOvMyKcUTdzzzoBdce6W7LXQZyHrQfqkjba2Pelo4aCYr9rIuCu1OJyTWjU++zhbAmS1u+sE0JlNcoNuE=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr3384218ljj.467.1616239702444;
 Sat, 20 Mar 2021 04:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com> <20210317155919.41450-2-alexander.sverdlin@nokia.com>
In-Reply-To: <20210317155919.41450-2-alexander.sverdlin@nokia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Mar 2021 12:28:11 +0100
Message-ID: <CACRpkdbnc2UHM8w85DjsoMKoim-pSX7-7c2YOUnUDdthNc9Vpw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Support implementations without GPIOINTR line
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Alexander,

I think I answered some stuff around this patch in my previous
mail but just reiterating so it's clear:

On Wed, Mar 17, 2021 at 4:59 PM Alexander A Sverdlin
<alexander.sverdlin@nokia.com> wrote:

> @@ -426,6 +426,7 @@ config GPIO_PL061
>         depends on ARM_AMBA
>         select IRQ_DOMAIN
>         select GPIOLIB_IRQCHIP
> +       select IRQ_DOMAIN_HIERARCHY

I think this needs to be optional otherwise you activate hierarchical
IRQs on a lot of systems that don't have it.

select IRQ_DOMAIN_HIERARCHY if ARCH_OMAP_...

This leads to having to use some if IS_ENABLED and
maybe even ifdef to make it compile without hierarchies.

> +       if (!adev->irq[PL061_GPIO_NR - 1]) {
> +               WARN_ON(adev->irq[1]);
> +
> +               girq->parent_handler = pl061_irq_handler;
> +               girq->num_parents = 1;
> +               girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
> +                                            GFP_KERNEL);
> +               if (!girq->parents)
> +                       return -ENOMEM;
> +               girq->parents[0] = irq;
> +       } else {
> +               girq->fwnode = dev->fwnode;
> +               girq->parent_domain =
> +                       irq_get_irq_data(adev->irq[PL061_GPIO_NR - 1])->domain;
> +               girq->child_to_parent_hwirq = pl061_child_to_parent_hwirq;
> +       }

This is starting to look right :)

But use the top-level board DT compatible to determine that
hiearchy is needed, and implement a per-soc child_to_parent_hwirq()
and do not attempt to get the IRQs from the device tree.

Yours,
Linus Walleij
