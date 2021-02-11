Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6EB331933F
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 20:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhBKTkK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 14:40:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:33840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231264AbhBKTkG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Feb 2021 14:40:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A65664E42;
        Thu, 11 Feb 2021 19:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613072366;
        bh=LguSyM2AivDGUxr0ZbABm+fz9iY7GOwz9PKFxyl5pRQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QE/owqm/xyrvnuTwZvUsN/dOzbkXdXJop6JG7B1kItBAZBbwHEgkv463F9FTErir4
         WbnUMU5HUqa2jLkJqAlv3HjeLPt2rhIdJp+CB3zkM2x0/IzTxfq5GMMSN/dwQNgwU/
         tEllBvPsqdCbG06UhlSHt1Oup/vu+aTVHGebf74X7VaADrPq/yC6FjUceOD8M04iUi
         VyujGjWFlSh7DfZxpt1YLelUsdxi7u/XoRYzGmPq1aQPqgQaiAaSCRM3iXSRai5uBb
         +Y4aKQubp3NhMFC7zAi1DFEN8o3ITsALPaACnYz6Mt1DiI1Yk0H4rRyM5zx/ERlVVq
         faOrvpgZ+2+7g==
Received: by mail-ot1-f46.google.com with SMTP id a5so5101298otq.4;
        Thu, 11 Feb 2021 11:39:26 -0800 (PST)
X-Gm-Message-State: AOAM532s6uPOy0ndp0QN6v+YhHCIdjgWo6xBe1rCrtXLpS0A6VQs6agW
        PWOvlnfdmJ6yZscwy6u57fsOOv02/ZnjDG7S3ck=
X-Google-Smtp-Source: ABdhPJwlJLC08Hs32j3VQ4tuDEm96M3xWArw+pyHZ6NV9IYI5yNNiZ9bgO7gNQllaYhS6Eko401GzFWT6VkVterMw/U=
X-Received: by 2002:a05:6830:18e6:: with SMTP id d6mr7022758otf.251.1613072365543;
 Thu, 11 Feb 2021 11:39:25 -0800 (PST)
MIME-Version: 1.0
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com> <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
In-Reply-To: <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 11 Feb 2021 20:39:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
Message-ID: <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
Subject: Re: [PATCH for next v1 1/2] gpio: omap: Replace raw_spin_lock_irqsave
 with raw_spin_lock in omap_gpio_irq_handler()
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Luo Jiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linuxarm@openeuler.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 11, 2021 at 7:25 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 08/02/2021 10:56, Luo Jiaxing wrote:
> > There is no need to use API with _irqsave in omap_gpio_irq_handler(),
> > because it already be in a irq-disabled context.
>
> NACK.
> Who said that this is always hard IRQ handler?
> What about RT-kernel or boot with "threadirqs"?

In those cases, the interrupt handler is just a normal thread, so the
preempt_disable() that is implied by raw_spin_lock() is sufficient.

Disabling interrupts inside of an interrupt handler is always incorrect,
the patch looks like a useful cleanup to me, if only for readability.

       Arnd
