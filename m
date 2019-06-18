Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091E249F41
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729606AbfFRLd4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:33:56 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46230 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbfFRLd4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:33:56 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so12718384ljg.13
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2019 04:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NgwmAF6mrHWJK26CxYyzxfMg7p1+vWwDu5ZwFo+Ddx8=;
        b=DMnqQW0W6VIhnxi4lOLzQSZNcNXlBsOY8hKqVhJTr0wKrAwQqKT3FQm+xX4h9TQDrX
         6PzRHzNsD9E4ERrYhOLxAckSGI/pqBEN0p91HfKNy6wsHYjLbniKcSdTHBPr/X6JzhqO
         6aU3ehXAU7bDKmrYsCXDFhnZPMvt1Oes38MGt5m6dWELKXKA3vP9InA7S60vAFuNxWOq
         zs7Kw/ALTeH8v+E7+ImQgjbxoTJkU+5ZI6Gj32bH6rrrdMsqbksRPGD2aRF3rtPOF8EN
         QMmAjgi/dfj4OJsYXo3R3NP4JZx0pDTTlJpgplpP6+54nyU9tSaITT6o/azPVgHenEml
         drGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgwmAF6mrHWJK26CxYyzxfMg7p1+vWwDu5ZwFo+Ddx8=;
        b=VpIV9g2WqlgLcY+ccYyJEf0kiijiZhyFgvgCLgJn5APvsv2prZub7ElUD10u5voSsD
         EPHzzUr4R8iU8jdJBZfZeFpR3Mi5StGgkwQz+7o+/8ZpcZ0egJf0a8NhqGIi3DiMxNSw
         7/Ubog67hsS2diruOFYX0uF7x+PxLGQN5WJssSCgDtSMk9gQvK43drCziyJNG7D9g++H
         E+lI8HRvDAvwrGLNmLC0jkFREZBFR3U2mkDVO+XekF2gCndfqb4sOdSl3Iqo73NPxnI8
         d+B53BzPDGy30qDJrY6g0wNY3Fg2kPQYshvd81CRRBr+4MFrxyyjXlSyxUDld8UNFTgZ
         Pfcw==
X-Gm-Message-State: APjAAAXRwj387QktrWmQBrs6yeaXiNRFwnvCfnN5cQ14pMUfhm8e/EEO
        E02HJmzGvYJgNrCDocfSzj+5AmdyoZERIcEFE8yTNA==
X-Google-Smtp-Source: APXvYqxjTdTO9t6HxVRByJR2EnBJTy8bFfa+WzTCL2WTjHeyl1c6ARy5xzwz7tcWTInpubuaqrQ0lnbgUPWjNRIpiw4=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr30304653ljm.69.1560857634447;
 Tue, 18 Jun 2019 04:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <1560306258-54654-1-git-send-email-preid@electromag.com.au>
In-Reply-To: <1560306258-54654-1-git-send-email-preid@electromag.com.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Jun 2019 13:33:43 +0200
Message-ID: <CACRpkdb3B8PmSkkz+avEBjVFA-MuLL2qKQVM39=pCrcYqSTP7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctlr: mcp23s08: Fix add_data and
 irqchip_add_nested call order
To:     Phil Reid <preid@electromag.com.au>
Cc:     Jason Kridner <jkridner@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Lars Poeschel <poeschel@lemonage.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 12, 2019 at 4:24 AM Phil Reid <preid@electromag.com.au> wrote:

> Currently probing of the mcp23s08 results in an error message
> "detected irqchip that is shared with multiple gpiochips:
> please fix the driver"
>
> This is due to the following:
>
> Call to mcp23s08_irqchip_setup() with call hierarchy:
> mcp23s08_irqchip_setup()
>   gpiochip_irqchip_add_nested()
>     gpiochip_irqchip_add_key()
>       gpiochip_set_irq_hooks()
>
> Call to devm_gpiochip_add_data() with call hierarchy:
> devm_gpiochip_add_data()
>   gpiochip_add_data_with_key()
>     gpiochip_add_irqchip()
>       gpiochip_set_irq_hooks()
>
> The gpiochip_add_irqchip() returns immediately if there isn't a irqchip
> but we added a irqchip due to the previous mcp23s08_irqchip_setup()
> call. So it calls gpiochip_set_irq_hooks() a second time.
>
> Fix this by moving the call to devm_gpiochip_add_data before
> the call to mcp23s08_irqchip_setup
>
> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>
> Notes:
>     v2:
>     - remove unrelated whitespace changes

I applied this for fixes some days back, seems my mail about
it didn't make it out.

Yours,
Linus Walleij
