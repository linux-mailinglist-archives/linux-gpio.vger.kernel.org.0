Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0427884EFB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 16:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729714AbfHGOnf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 10:43:35 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46105 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbfHGOnf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 10:43:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id z15so59967556lfh.13
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FpNH+fwRD9UslARAv0P6x4oixyqcPMIUztxNUrsHsKk=;
        b=nSwAw8D4dtu+pqJupnBaAovTJFtHiEvwlFnXNTAzDPnfRzlbbito6zePcWXsUekbxm
         kUjUT4kTtVfc/0vDGxRPqhcMx99FgC7sSSt+EbfFWcffcoSaNGI73OT1/+He9uvEzPt/
         83WDuFhUsvFYCbTHSAC+68bnMrcNDA3D4wpnEsEz3NsFrkseeZTwbckhTR9C4PE+YPev
         D8zwc8lgLuwspakO6SI+c2UYNE3+HnGky3kryoVrVyTrPlaCh+ndrXIgrLzaU7dczquu
         0pBBqHgEwup+gKf2agMwLnZMgf1lnvHTScbN4cgbskNywOOuq0ZQ2sy43GGslDhyJHa/
         lYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FpNH+fwRD9UslARAv0P6x4oixyqcPMIUztxNUrsHsKk=;
        b=bPU/ei2qI1ijBqT4Fg2PMwY2FQr8fd6s63KpW9KlWYe/p5KR1vzwQ8QgqOUXOkILJB
         Q8d9RjYoIxviqyOW50wFlJhYzE4KX09dNF0NTDB4XHBR2+eQRvAs/KxdFAv6D0nLnt9J
         i4X0gwYix8S1RL95Fn3bNpMsnNocY/50Q+YvRKs1vFpXDFuMHks+Laim+353CDdD91Ll
         81KW106dt3wyA8BIDFsxuA8nMWEljCDuE23zyAD1UY4e4WQ6meoGhw66sOtP/YwbPLUC
         Kmf3qx5AdAiLpjKejwF1FHoXe2Tc7fVxHz+e8N1M5jvtdD8YznSOAkRV6thyFXJ3HkkN
         LX7w==
X-Gm-Message-State: APjAAAVzmsS5r5i7L4McXG3StWUorzKvjyzDXtJgr38F+mAf+ynhGbSx
        xv6rFYWapTfD+9yyDON9x5r65EzvyzkaycWGLQdmJg==
X-Google-Smtp-Source: APXvYqyOTTzh6O8lPGxN8pJ1Lz67M/1gFvwVNQ5VY/dqkrnmktc2tJNFhaktLFn/LmfFpfcS2Bz/L5GTRQJS57p5lwo=
X-Received: by 2002:ac2:5dd6:: with SMTP id x22mr6013591lfq.92.1565189013641;
 Wed, 07 Aug 2019 07:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org> <CAK7LNASX2c6=X7P_qn31MgsgSdiYL7m+fD2wmk5_tn6o+1YJSw@mail.gmail.com>
In-Reply-To: <CAK7LNASX2c6=X7P_qn31MgsgSdiYL7m+fD2wmk5_tn6o+1YJSw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Aug 2019 16:43:21 +0200
Message-ID: <CACRpkdYbTjQR6dDsy3WJ1w89Yyo=qfSgTheaYX8MHW5uE321sA@mail.gmail.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Brian Masney <masneyb@onstation.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Masahiro,

On Thu, Jul 18, 2019 at 1:12 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Mon, Jun 24, 2019 at 10:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > +static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
> > +                                              unsigned int irq,
> > +                                              unsigned int nr_irqs,
> > +                                              void *data)
> > +{
> > +       struct gpio_chip *gc = d->host_data;
> > +       irq_hw_number_t hwirq;
> > +       unsigned int type = IRQ_TYPE_NONE;
> > +       struct irq_fwspec *fwspec = data;
> > +       int ret;
> > +       int i;
>
> We always expect nr_irqs is 1.
>
> As gpio-uniphier.c, you can error out with WARN_ON
> if nr_irqs != 1

Hm, yes I am pretty sure it is always 1.

But I'd like to defer changing this until/if Marc changes
the signature of the function to not pass nr_irqs anymore.
I try to design for the current prototype because I don't
know how e.g. ACPI works with respect to this.

> I see so many chip_info().
> I think they should be chip_dbg() or removed entirely.

I am keeping that right now as we're testing on several
different systems, so some extra debug prints should be
OK in a transitional period. We might change it into dbg
with a separate patch before the merge window.

The rest of your comments are addressed!

Yours,
Linus Walleij
