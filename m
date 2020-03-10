Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCA618094F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2020 21:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgCJUlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Mar 2020 16:41:08 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44605 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgCJUlI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Mar 2020 16:41:08 -0400
Received: by mail-oi1-f193.google.com with SMTP id d62so15324189oia.11
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2020 13:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o4jG9FgYERjshwJKDvb4igBteXFyMN8vceGJFigN9yY=;
        b=aBScozVeOmel5KcowsGkoBFGm7EJZr+0mA5q4ExvEZEocbW7UPRc21UmtbmG/23rOz
         0MoHVyyXb1ii4b7dVUFxFAz+7QEyGO2iy54kVlRU7qjDAQq3WSos092Kb+kstyfEcle4
         Onbp2oOT5pc08yaVGtkjqTK8+wq9kcfJnozVwdHReIhUrCe+4vGKSkVRelr0sNA30kY8
         jTO6RZZgZ1/WHzdFsyZdbRsJIANKJldLv2DN4tsJ2EV8Zskr7DJ9k8XYqV2DPabyIBmQ
         5oq7joq64eAZnOIRcXU1Wz+A7R5p8ZSF7z5XdZkntcb651Py5QOe1I+Uwuzl7f0AjXiE
         VZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o4jG9FgYERjshwJKDvb4igBteXFyMN8vceGJFigN9yY=;
        b=j6vFU80EW0dZFjWIxNkanA0xaYBB70Wrjyuwve4QG/O+oZAUwQOtlRUstoS2S3pqwP
         t6iIQmWq/5N1cp3uZzCes/tXtuKJQKNrxJw2flfrMEy8Yv6pE12zaTbyTArU4tNCDO2M
         tqYD9ibmuWiA70s5o8ymFQvQEDyMnVF4h8Q8OuyU0X+WdWvUctXzwwjUEEPR5lF1GFOd
         8Crq59x9WSWWGk7EJCZGeJYkFFkpAmfVRnHntn1YoNLqa6Ft2ty39oXSnUHbtryjrxh9
         50O2aDLDQRXyFFlaFonzTE762q/RDLotJ2MqTCN8qO3L2/p5uC4U4AHgPmEl6LETqHiO
         hhKQ==
X-Gm-Message-State: ANhLgQ3S2x6VitqM0Zt5JkfvufczMUd5rGFFFnifT8K2LZxcYj/eZ0Nk
        iJcgA89y1G26rJUMqop1rZ9pQtZtyxO6BC0gK5CBcw==
X-Google-Smtp-Source: ADFU+vtyKYgVBFoVNtSnh69eUf+8ydT3qkb9jum7u95LT8jvpyS+rZxuEkHco7PkJcEMhFZwiHAxIR1e1yunDyQv+1k=
X-Received: by 2002:aca:474e:: with SMTP id u75mr2469786oia.52.1583872867595;
 Tue, 10 Mar 2020 13:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200114082821.14015-1-haokexin@gmail.com> <CACRpkda7LmJPkMG7hXq9MxHL2tYM5uTCEotdSbtaKxhtBQPW4g@mail.gmail.com>
In-Reply-To: <CACRpkda7LmJPkMG7hXq9MxHL2tYM5uTCEotdSbtaKxhtBQPW4g@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 10 Mar 2020 13:40:56 -0700
Message-ID: <CAJ+vNU0QCQP7Roud7AGVNOreDwAbZ4HBmpXp4P9DEJPDB5eOag@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix the regression for the thunderx gpio
To:     Linus Walleij <linus.walleij@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kevin Hao <haokexin@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 15, 2020 at 2:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jan 14, 2020 at 9:39 AM Kevin Hao <haokexin@gmail.com> wrote:
>
> > Since the commit a7fc89f9d5fc ("gpio: thunderx: Switch to
> > GPIOLIB_IRQCHIP"), the thunderx gpio doesn't work anymore. I noticed
> > that you have submitted a patch [1] to fix the " irq_domain_push_irq: -22"
> > error, but the kernel would panic after applying that fix because the hwirq
> > passed to the msi irqdomain is still not correct. It seems that we need
> > more codes to make the thunderx gpio work with the GPIOLIB_IRQCHIP. So I
> > would prefer to revert the commit a7fc89f9d5fc first to make the thunderx
> > gpio to work on the 5.4.x and 5.5 at least. We can then do more test for
> > GPIOLIB_IRQCHIP switching (which the patch 2 ~ 4 do) before merging
> > them.
>
> Thanks a LOT Kevin, and I'm sorry for open coding and breaking this
> driver so much :/
>
> I have applied all four patches for fixes.
>

I'm running into an issue with thunderx-gpio when using a gpio as an
interrupt with an mfd driver I'm working on[1]. The breakage appeared
with 0d04d0c146786da42c6e68c7d2f09c956c5b5bd3 'gpio: thunderx: Use the
default parent apis for {request,release}_resources'[2] and occurs
when irq_chip_request_resources_parent() fails with -ENOSYS. Any ideas
what happened here... It seems perhaps parent_data got lost?

1. https://patchwork.kernel.org/patch/11401555/
2. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpio/gpio-thunderx.c?id=0d04d0c146786da42c6e68c7d2f09c956c5b5bd3

Best regards,

Tim
