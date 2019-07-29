Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D874C782BD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 02:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfG2ALx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 20:11:53 -0400
Received: from onstation.org ([52.200.56.107]:33482 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbfG2ALx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 28 Jul 2019 20:11:53 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id A37F13E911;
        Mon, 29 Jul 2019 00:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1564359112;
        bh=fTbFvKTimvfSnY3qv6EFPf24BLGT92XXZetGoC+8T30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gH3oCbmkasua7ZqHWoXpzrYFMS2XYEalSeBlrnKp80q7IsWlxwJrL36R6Ld5jg50s
         daYNl/qq7EX0BKrVYHFY+/Fp/R1gvE9ZpmVo81puHzOrl+XC2k/Wzn1eWn0whVZ5fL
         yGCBXhyTfKb0Ov+hKYhXZmgd07Y43Mnf47CVRW6w=
Date:   Sun, 28 Jul 2019 20:11:51 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpio: allow customizing hierarchical IRQ chips
Message-ID: <20190729001151.GA17127@onstation.org>
References: <20190708110138.24657-1-masneyb@onstation.org>
 <20190708110138.24657-3-masneyb@onstation.org>
 <CACRpkdZn-czbOOTrRs5ZgR7qTtf2A4i_L4J8_vk+kJiBuAnikg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZn-czbOOTrRs5ZgR7qTtf2A4i_L4J8_vk+kJiBuAnikg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 29, 2019 at 12:49:55AM +0200, Linus Walleij wrote:
> On Mon, Jul 8, 2019 at 1:01 PM Brian Masney <masneyb@onstation.org> wrote:
> > +static void gpiochip_add_default_irq_domain_ops(struct irq_domain_ops *ops)
> > +{
> > +       if (!ops->activate)
> > +               ops->activate = gpiochip_irq_domain_activate;
> > +
> > +       if (!ops->deactivate)
> > +               ops->deactivate = gpiochip_irq_domain_deactivate;
> > +
> > +       if (!ops->translate)
> > +               ops->translate = gpiochip_hierarchy_irq_domain_translate;
> > +
> > +       if (!ops->alloc)
> > +               ops->alloc = gpiochip_hierarchy_irq_domain_alloc;
> > +
> > +       if (!ops->free)
> > +               ops->free = irq_domain_free_irqs_common;
> > +}
> 
> I'm fine with translate(), this seems to be what Lina needs too.
> 
> But do we really need to make them all optional? activate() and
> deactivate() will require the driver to lock the irq etc which is hairy.

I can't think of a reason right now that we'd need to override the
others. Since the structure was there, I made all of them optional to
try to future proof this a little bit.

It probably would be better to only make translate optional at this
point. If needed, someone can submit a patch for one or more of the
others with their use case.

Brian
