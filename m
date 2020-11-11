Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A392B2AF5D8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 17:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgKKQKQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 11:10:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgKKQKP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 11:10:15 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF06C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 08:10:15 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id x11so1429738vsx.12
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DRY6wscalWlfAwtOkmgsX3II8ZIYotcHkm4m7nc9FkI=;
        b=O8J0xfVpMlvjjaXvgxM+BwL1TecH5uBPa/pX/dNJFLUV23dmQ8lmsU1himQoNB7de3
         T0JODIENIA7SBkCHXmEjvR4jUUOgI7hjE7Nf8O6PB3EeOenxZWxeqOFHP0aBFjMI4iBR
         Alki7AZiCSDRi0Rgcsk7j1v5x6+5J9f37lpT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DRY6wscalWlfAwtOkmgsX3II8ZIYotcHkm4m7nc9FkI=;
        b=rGKaOVkc/ZCIpDFiNdRfPbPUSL8fXg9F6dll6kSreruOoJsbrQOLwk7hoUNgmO05++
         AI3G96X6OZ+4PnSRzszO2A17Uy0aaPy/Q0Jlbx4Eq36Dqorr0zMXwAQOJ9cwrYJHS+bt
         vwtQiB0ga+fWYa/s3/DeXWYABmUPLnSh5FIvP6DHqxDnVv78GRvx4XBnK6DIUH5nq+NO
         GjPNqotgaE4rRbnmtIzmJVRqB4SpSZ8ljdrx26kUdR1EMrm4OIZ6PBk06eiiop7SikzB
         HblbmzM+kDISYuSfRrXvjDyXStXLedbMtYoybClbctfqYz77tYVAgPYTnNgECjNOa+ww
         2WJw==
X-Gm-Message-State: AOAM533z/Vq1F80oGv9l/fV7b/2i7o/JEEf0Q+RfLLQfjHeesjROe9Zx
        iGghl0WKJ/37UOvMkU1oKQsefadzqcdkZg==
X-Google-Smtp-Source: ABdhPJxQcvzHLGSBh58hXhW2fsmdyjCABOv23uon9RPUqK3sYOD9F0V+YybkIG63EL9F/c6ATjdkQA==
X-Received: by 2002:a67:403:: with SMTP id 3mr14305202vse.54.1605111014514;
        Wed, 11 Nov 2020 08:10:14 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id b62sm282065vsb.7.2020.11.11.08.10.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:10:14 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id u24so1436785vsl.9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 08:10:13 -0800 (PST)
X-Received: by 2002:a05:6102:309a:: with SMTP id l26mr15977310vsb.4.1605111010929;
 Wed, 11 Nov 2020 08:10:10 -0800 (PST)
MIME-Version: 1.0
References: <1604561884-10166-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1604561884-10166-1-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Nov 2020 08:09:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WhNksmK0j=30ZohfgDND2JJDqP=EZGP5M-=bCjS=VFjA@mail.gmail.com>
Message-ID: <CAD=FV=WhNksmK0j=30ZohfgDND2JJDqP=EZGP5M-=bCjS=VFjA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Move clearing pending IRQ to
 .irq_request_resources callback
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Wed, Nov 4, 2020 at 11:38 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> When GPIOs that are routed to PDC are used as output they can still latch
> the IRQ pending at GIC. As a result the spurious IRQ was handled when the
> client driver change the direction to input to starts using it as IRQ.
>
> Currently such erroneous latched IRQ are cleared with .irq_enable callback
> however if the driver continue to use GPIO as interrupt and invokes
> disable_irq() followed by enable_irq() then everytime during enable_irq()
> previously latched interrupt gets cleared.
>
> This can make edge IRQs not seen after enable_irq() if they had arrived
> after the driver has invoked disable_irq() and were pending at GIC.
>
> Move clearing erroneous IRQ to .irq_request_resources callback as this is
> the place where GPIO direction is changed as input and its locked as IRQ.
>
> While at this add a missing check to invoke msm_gpio_irq_clear_unmask()
> from .irq_enable callback only when GPIO is not routed to PDC.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index c4bcda9..77a25bd 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -815,21 +815,14 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>
>  static void msm_gpio_irq_enable(struct irq_data *d)
>  {
> -       /*
> -        * Clear the interrupt that may be pending before we enable
> -        * the line.
> -        * This is especially a problem with the GPIOs routed to the
> -        * PDC. These GPIOs are direct-connect interrupts to the GIC.
> -        * Disabling the interrupt line at the PDC does not prevent
> -        * the interrupt from being latched at the GIC. The state at
> -        * GIC needs to be cleared before enabling.
> -        */
> -       if (d->parent_data) {
> -               irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +
> +       if (d->parent_data)
>                 irq_chip_enable_parent(d);
> -       }
>
> -       msm_gpio_irq_clear_unmask(d, true);
> +       if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
> +               msm_gpio_irq_clear_unmask(d, true);

I'm happy that this patch landed and it seems a definite improvement.
However, it seems like we're still clearing important edges in the
case where the PDC isn't used.  Can't we just unconditionally move the
clearing to msm_gpio_irq_reqres()?

-Doug
