Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F30482FA3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 10:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbiACJuv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 04:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiACJuu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 04:50:50 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77934C061761
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 01:50:50 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id m21so134998172edc.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 01:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=glHDbRAfQ2rWjG1rklFOPeGp0Df2FguJaQkq2LO7OfI=;
        b=5t+34L7U7Tu1JBDFrp9LGR1M9FHGtjeKJgpZDTUpolYJPyPbaBv9n2ysUAcIlV3yh0
         aMbKyGfS834ruFVZpL70mVwtCHPDJZOTSiggGd428KfMPQMdL8f5SyhMfWf+beAgE6Ci
         2cp6PKjtLxhJbIUbMPumjDF2ytaD/r6BoD3VRzTB5g/Gs2jjcMCj1/2oj88DflyIWzlf
         7n6ezIHCxDWxaZSLbWmpkrr3062Qv1P9HVPI/EfxF05zZeGVAIAIJrH7B4Fe6Rb/3hMP
         Kp8cENGNPF0A+i2ouMiJKcIQ8aRSfvQCqOAa08TgxzRcnX4kNbGDKqcbYzwuo8NSjlV7
         FA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=glHDbRAfQ2rWjG1rklFOPeGp0Df2FguJaQkq2LO7OfI=;
        b=Y0yuQ0OBTFkSVM/7qEw5Xtl21+QIrXFiz1SnNptvCQHDmxYTKNrdfbXyDJPhNzA3fi
         9LnEtra4YWcdMB0L8NmprVs0V1UNuBmS7vqb5KfE02YFWnLdcP+yow4ojmc8Xwi0KaCk
         6lOH5XW0ozhCiSxm7aKhvB7fjgCZktLhoXWf6hrrMv2Bcj9j+Q34qJksCM0x85Nn7Gjc
         kfEtTsi5fPOEq5V7lfAYiIFnpAwcAqOahupJfGaLiEleHL26wIyt1BpDBYOwz7taf8dZ
         lQzx8P093tkb5QkJkeHrbmdf6Nf4vFPBlVQSb7nj38E5+rHtdsOL+EZuz6NMX0P7CBdf
         LaaA==
X-Gm-Message-State: AOAM530eKaa8hU01dN8n4hHYAF+xQCwQZud0GKRXcPi2n3kLPaZ7kTyX
        qiiR5R5d/9M6pV8CAhMKE9QK60nW3N0UWyxqx7le/w==
X-Google-Smtp-Source: ABdhPJwGxzpdSFJDk/tcI94f8WJ6YG2uYjdkrRAo9XjIF9wkF8LCVv6c2K+zndyohDFv96C6YiCL5WIwP+3d+8dsSKc=
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr34869918ejj.636.1641203449046;
 Mon, 03 Jan 2022 01:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20211214040239.8977-1-steven_lee@aspeedtech.com>
 <20211214040239.8977-2-steven_lee@aspeedtech.com> <CAMRc=MdAgK7zKuJ=7cA2T-mSTJD3tWSW2aEB6G=0Tz4X+iHcZQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdAgK7zKuJ=7cA2T-mSTJD3tWSW2aEB6G=0Tz4X+iHcZQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Jan 2022 10:50:38 +0100
Message-ID: <CAMRc=McjZZTMjR+riwjj6SLEh=fYq0yjBQYNgzGXHok6=OTz_w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: gpio-aspeed-sgpio: Fix wrong hwirq base in
 irq handler
To:     Steven Lee <steven_lee@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>, ryan_chen@aspeedtech.com,
        billy_tsai@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 22, 2021 at 10:18 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Dec 14, 2021 at 5:03 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> >
> > Each aspeed sgpio bank has 64 gpio pins(32 input pins and 32 output pins).
> > The hwirq base for each sgpio bank should be multiples of 64 rather than
> > multiples of 32.
> >
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> > index 3d6ef37a7702..b3a9b8488f11 100644
> > --- a/drivers/gpio/gpio-aspeed-sgpio.c
> > +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> > @@ -395,7 +395,7 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
> >                 reg = ioread32(bank_reg(data, bank, reg_irq_status));
> >
> >                 for_each_set_bit(p, &reg, 32)
> > -                       generic_handle_domain_irq(gc->irq.domain, i * 32 + p * 2);
> > +                       generic_handle_domain_irq(gc->irq.domain, (i * 32 + p) * 2);
> >         }
> >
> >         chained_irq_exit(ic, desc);
> > --
> > 2.17.1
> >
>
> Joel, Andrew: any comments on this? I'd like to send it upstream tomorrow.
>
> Bart

I don't want to delay it anymore, it looks good so I queued it for fixes.

Bart
