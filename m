Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC6ED46003
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2019 16:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbfFNOGO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jun 2019 10:06:14 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36622 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbfFNOGO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jun 2019 10:06:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id i21so2554331ljj.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2019 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FUloY8r0Jl0I0jNqXj9Sne18VPLBZgF39Ola5GLE1mI=;
        b=joiCjssB2S+5qMCvwbhug6D0xg4d6w0SchHM8j0k5tF4NOH3+y3DRs/3YCl6puXFSc
         wSL1IK4zUXSRwkuWwenq6AXJ2bCRx/veILkKs1vu6ToSlcD1Ff6m9A8MdfIcJsyojLyU
         MR11PQBHGF31Q2op5x6ofBoRXTvp/dMg73mTa6fzNk/XCXxEwBmLS9zt7fNcCMUT8axS
         V38MU/GhMIM0U94HOrEwetyS0/SZHH+6zUYAlYfsgjMdwaUyEralsG70DD5EmnWoLURj
         WslnixjWkjVFc3BrDR0oxrYEHkChvPnAT/Wcd9CY0Pw0Kjnu6ZqqQwAIg1Ph71MF8ntj
         RADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FUloY8r0Jl0I0jNqXj9Sne18VPLBZgF39Ola5GLE1mI=;
        b=S4u8635eybADXI2LDRJXgBhjCJ/+YSqwcFA2Sgh1LdeGuRCYFLQjoQcUlir/TTpy8Q
         zUEn68Xd572Rlceu6IUyij2XWjbhamZZ3ygIOMxhQje/GioaIKTm8RgUs0t3H7R4u9QP
         ixyXK6bFUQxn7gZxqEBQsRT9HttyoHoVfVIZt9d9eFyH5W88X8cGccl90tzuMCEzB2n1
         lXAiOH9Gb/1/GrhE7CvviWPgl/7/pKh5czG46YQ4kpK0gU0VyVQwVf5ShX3nSvlxa+c6
         B28k0wAaW+GTHMr55WXdKbYRMMXjdPcquC17lHdJFr01QMm61N2ZodU2ozOTeWssA/Zz
         D5tg==
X-Gm-Message-State: APjAAAVMGBei1abkSvElzBJj069I+i79XpOr1lC3qAgmKef4nAc4LBny
        HCKzzCUL+k7wZADT/xAk4Oj8xYvizFbhc0Z5oNnJLw==
X-Google-Smtp-Source: APXvYqzLHCt06cPv944JlF0SQPPc9AAr0d3BHfcR5jk8f/eqW5dDF361PLhzAOFyK2DbDX4KJwjEsUSa9psNWTnWsZs=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr18245569ljm.69.1560521172686;
 Fri, 14 Jun 2019 07:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <1560399023-12638-1-git-send-email-preid@electromag.com.au>
In-Reply-To: <1560399023-12638-1-git-send-email-preid@electromag.com.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Jun 2019 16:06:01 +0200
Message-ID: <CACRpkdYwc6F-CxmvRb5f+8Y8UZ-na15woJM9enwb=+YzbYV1-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] pinctlr: mcp23s08: Fix add_data and
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

On Thu, Jun 13, 2019 at 6:10 AM Phil Reid <preid@electromag.com.au> wrote:

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
> Fixes: 02e389e63 ("pinctrl: mcp23s08: fix irq setup order")
> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied!

Yours,
Linus Walleij
