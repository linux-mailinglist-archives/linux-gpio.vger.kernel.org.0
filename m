Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B5B45E3F4
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 02:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhKZBYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 20:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243805AbhKZBWJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 20:22:09 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF61C06175E
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 17:17:30 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id m6so15825604oim.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 17:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Od+ySjjFhxRYMYxmCjjF/atFp38NKQiXX3R9mG25u1U=;
        b=rlaNmopmdxpmRhI68bh9xfiePxM4NRw3sd2puoAGv1UUCg+x//QQ8mlRn0P0A97ELO
         iLW82dW1jC90Tmmc52xSGvLME0s+tzAMwyt03JEhV7UREahtYafqdEiJ4/1djK+3ZePH
         uWMa3sc+6hBmilVZjLOzJBl8VXh3yB36nwdq6nJPS0RHVqtWaX7KnYKmm/MhM8MYlFt/
         U3u0Ve9k5/XkJQiAgklfCrkW9Dytey2eth/ItjPVL02L2oGvdxrDkxcoL1o2fp07MGIs
         zBCfY3HNb7PiZEDIxSMSgU3zIKzQ8L6DcDq08NrKa7sakmt8i+vmUk7hqGhKQKu5vQCN
         tXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Od+ySjjFhxRYMYxmCjjF/atFp38NKQiXX3R9mG25u1U=;
        b=P1hBfWfv6tvbrIS6tPbQimgCllUcE939TEo8uZ0oNXN7mgI4S9FmVlb2m98E/fo1/i
         P4CeeXynIUj0oODK3suVEi5pREb4WZNY2zWfEh+vrKcnXdR1DXOnZxUX8phjFWJBDs6m
         tNpUVO370jmYDzBrU9lhxWoTMjbEUpquCAvyyR7QnxS45rRSTVjFt10+J/pIj4t8dF8r
         Sgc5pgqw7EXZp9G6xn/gpOSqfPVIBk9nT1Jd78AJVoT8Dz9LLTmKIsDeqxd38EO+UuiV
         C0ipqMkGraQwzlDC3ZeFOep7ekBIrAjAe5YKfkW7boaZoFSfThWuI2wvG+Z9KA7qNxdk
         zpCQ==
X-Gm-Message-State: AOAM531qf8mEj/rkwKmGMrWEXBRVQHdHR503v00HczbnyCCCRVA4TI3K
        tyBfjB08jHFH1sRcfAEZ5vHozVdZrI2O5korakj2cw==
X-Google-Smtp-Source: ABdhPJxN8xXtCL8trbzcImBq6BHkAMLjbBKtbeSeg2aMmb/JvoO7mh5sEnm3HadQxxajk60V9jJ8teZFmcZSZZ7yEEU=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr19809406oih.162.1637889449635;
 Thu, 25 Nov 2021 17:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20211108214148.9724-1-shreeya.patel@collabora.com>
 <YYp8JzxfLK2u0fU4@arch-x1c3> <87tugdxkj6.fsf@collabora.com> <d7d8bd97-3c12-bf04-a0ad-e0f391158d01@collabora.com>
In-Reply-To: <d7d8bd97-3c12-bf04-a0ad-e0f391158d01@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Nov 2021 02:17:17 +0100
Message-ID: <CACRpkdbPKW10YrzCPKPiJpPTAPPBSiV9CUiJgvasozOfjNbUKg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Initialize gc->irq.domain before setting gc->to_irq
To:     Shreeya Patel <shreeya.patel@collabora.com>
Cc:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        andy.shevchenko@gmail.com, sebastian.reichel@collabora.com,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 11:56 AM Shreeya Patel
<shreeya.patel@collabora.com> wrote:
> On 16/11/21 1:23 am, Gabriel Krisman Bertazi wrote:
> > Emil Velikov <emil.velikov@collabora.com> writes:

> >> Hi Shreeya, all,
> >>
> >> On 2021/11/09, Shreeya Patel wrote:
> >>> There is a race in registering of gc->irq.domain when
> >>> probing the I2C driver.
> >>> This sometimes leads to a Kernel NULL pointer dereference
> >>> in gpiochip_to_irq function which uses the domain variable.
> >>>
> >>> To avoid this issue, set gc->to_irq after domain is
> >>> initialized. This will make sure whenever gpiochip_to_irq
> >>> is called, it has domain already initialized.
> >>>
> >> What is stopping the next developer to moving the assignment to the
> >> incorrect place? Aka should we add an inline comment about this?
> > I agree with Emil.  The patch seems like a workaround that doesn't
> > really solve the underlying issue.  I'm not familiar with this code, but
> > it seems that gc is missing a lock during this initialization, to prevent
> > it from exposing a partially initialized gc->irq.
>
> I do not see any locking mechanism used for protecting the use of gc
> members before they are
> initialized. We faced a very similar problem with gc->to_irq as well
> where we had to return EPROBE_DEFER until it was initialized and ready
> to be used.
>
> Linus, do you have any suggestion on what would be the correct way to
> fix this issue of race in registration of gc members?

Not really, we just haven't faced the issue until now because it is only
now that people have actually added all these devlinks and deferred
probing and what not that actually starts to stress the system and
now that results in it being less stable, right?

How do other subsystems do it?

Yours,
Linus Walleij
