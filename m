Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A16314F70
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 13:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhBIMsw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 07:48:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhBIMrQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 07:47:16 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322BFC061786;
        Tue,  9 Feb 2021 04:46:36 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id z21so12403034pgj.4;
        Tue, 09 Feb 2021 04:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dDnisQF2+WlHWQgJi5E0P4BUZN0Xweu+8ke/gRajKx8=;
        b=Cv/+28RrMUJrDQolppWkMZ/3cbXhruKtFi5HgOg3VzbC2EJXg77mHV+EnY7E0+XmT2
         DhqpFTy27ed0O67+Y9isk5TFZurNFbhP3J/v26WAno0+acETNAFAB/Uf0Xq4OLzDXNdE
         Nrtid7ZWg+CIaTfBKoLxZrLwXKFWr038Z1r/ABU47QV9x/o1B77Bqq6NCKxaa/4L8uR1
         jfDJZXyjSLVv6WYPx5WnecSlxcenbLW5DEju/rRBHwfvNPg88S1HauXcytggcnWrzySy
         Mu5Ri41iF7migX8zItXiohijP75gcH/GoBVXKRmVFPPM9iKV+dGdOs5/R/1Y1ZNUCEwS
         8j1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDnisQF2+WlHWQgJi5E0P4BUZN0Xweu+8ke/gRajKx8=;
        b=PR0Kk6cjlIzoIjLZ5NWEt1PquLRKhS46GnKRP0xECpvjCDZWjUp5hbID+TsTd7DhTF
         7Cp0XLdTvS/6mupYo8JC5vdWzTQA0BJLyXxoO7HOenIfSgfWaPsrNy5+oa1dZnZeaONE
         pnvmbSA1NqFdn1UX/WXKuMaptRw4/t7O+a+Y2dEdlkmdVXBpnDbGkJtkvCGSQnVJxbDQ
         i+uSN/W0Qw96+7O9XEmW6fiwpX6UQEOp8yMXA7xwGcoqP7GvR/695KOYsZOuZ+Wkkqco
         QMNXz+gvzjpsT4I24ROo8BZjOsoZ5TJn1sdtIHHrrcvfx8mtWdAEPd/sSmCJwbPAjhnb
         auNQ==
X-Gm-Message-State: AOAM532Gep3iDklXFOZ+2uGmLXI7gh4v6anSiYkbIlAWtEzMgm8ZXBqx
        UapOtNgdc8uiauC0JIl7120jcCKKHuuA3ZbU1OQ=
X-Google-Smtp-Source: ABdhPJwuMPbJi5vizUB1xD/+TDl5gYbQSfBW/blEbPQUDQlbYNWN1qn0FJUvP7Pb/kSFl8MdjjIcA0R7kQsz5bRYUpY=
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr8299277pgt.74.1612874795517;
 Tue, 09 Feb 2021 04:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20210208085954.30050-1-nikita.shubin@maquefel.me>
 <20210208085954.30050-3-nikita.shubin@maquefel.me> <CAHp75VdV72fkpYgGqgebHfnN+VcVv04YvPxazpu1ZYsjMFP6Ow@mail.gmail.com>
 <5450294.DvuYhMxLoT@redslave>
In-Reply-To: <5450294.DvuYhMxLoT@redslave>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Feb 2021 14:46:19 +0200
Message-ID: <CAHp75VeW6EWrGPbzBrSPry9Lb8GDvA-C-mkCvmJMTVPeeVxjKg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 9, 2021 at 2:35 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> On Monday, 8 February 2021 16:20:17 MSK Andy Shevchenko wrote:
> >On Mon, Feb 8, 2021 at 11:00 AM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:

...

> >> +static void ep93xx_init_irq_chip(struct device *dev, struct irq_chip
> >> *ic, const char *label) +{
> >>
> >> +       ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s",
> >> label);
> >Is the label being NULL okay?
>
> The label is taken from ep93xx_gpio_banks[], so unless we explicitly
> pass zero to ep93xx_init_irq_chip(), we are ok.

Maybe I was unclear, let me rephrase: Is the *resulting* label being NULL okay?

> >> +       ic->irq_ack = ep93xx_gpio_irq_ack;
> >> +       ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
> >> +       ic->irq_mask = ep93xx_gpio_irq_mask;
> >> +       ic->irq_unmask = ep93xx_gpio_irq_unmask;
> >> +       ic->irq_set_type = ep93xx_gpio_irq_type;
> >> +}

-- 
With Best Regards,
Andy Shevchenko
