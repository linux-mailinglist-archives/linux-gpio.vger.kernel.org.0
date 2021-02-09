Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22166314EFC
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 13:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhBIMgt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 07:36:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhBIMgs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 07:36:48 -0500
Received: from forward103o.mail.yandex.net (forward103o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::606])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C98C061786;
        Tue,  9 Feb 2021 04:36:08 -0800 (PST)
Received: from sas1-43b74f7725b7.qloud-c.yandex.net (sas1-43b74f7725b7.qloud-c.yandex.net [IPv6:2a02:6b8:c14:391a:0:640:43b7:4f77])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id 4F7BF5F80186;
        Tue,  9 Feb 2021 15:35:59 +0300 (MSK)
Received: from sas1-e20a8b944cac.qloud-c.yandex.net (sas1-e20a8b944cac.qloud-c.yandex.net [2a02:6b8:c14:6696:0:640:e20a:8b94])
        by sas1-43b74f7725b7.qloud-c.yandex.net (mxback/Yandex) with ESMTP id GelvmXSRRD-ZxH0gjER;
        Tue, 09 Feb 2021 15:35:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612874159;
        bh=Wc4fzS9kWMCQeIC8ECmYVoAUo+upjBZ8ebEELfikIaY=;
        h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
        b=cLGYZVdsPsW+zKYxVhhcAzXcupsL1vjKMbUfXE0aG99LmYHNe4xIOc64QsLk6NoPr
         f/PTHI5LqVRP+wVbBBI3s4rbbcJ5bpvakE3q5ECKEin6K4wYI8QJJvPMBdFR06lnOa
         QrZQXIF7dNpK7kSUleGOcwERlE3YQVUTgSJHD9fA=
Authentication-Results: sas1-43b74f7725b7.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-e20a8b944cac.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id S7EuFwtpNv-ZwneF2GY;
        Tue, 09 Feb 2021 15:35:58 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
Date:   Tue, 09 Feb 2021 15:33:56 +0300
Message-ID: <5450294.DvuYhMxLoT@redslave>
In-Reply-To: <CAHp75VdV72fkpYgGqgebHfnN+VcVv04YvPxazpu1ZYsjMFP6Ow@mail.gmail.com>
References: <20210208085954.30050-1-nikita.shubin@maquefel.me> <20210208085954.30050-3-nikita.shubin@maquefel.me> <CAHp75VdV72fkpYgGqgebHfnN+VcVv04YvPxazpu1ZYsjMFP6Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy.

On Monday, 8 February 2021 16:20:17 MSK Andy Shevchenko wrote:
>On Mon, Feb 8, 2021 at 11:00 AM Nikita Shubin 
<nikita.shubin@maquefel.me> wrote:
>> Fixes the following warnings which results in interrupts disabled on
>> port B/F:
>> 
>> gpio gpiochip1: (B): detected irqchip that is shared with multiple
>> gpiochips: please fix the driver. gpio gpiochip5: (F): detected
>> irqchip that is shared with multiple gpiochips: please fix the
>> driver.
>> 
>> - added separate irqchip for each interrupt capable gpiochip
>> - provided unique names for each irqchip
>
>...
>
>> +static void ep93xx_init_irq_chip(struct device *dev, struct irq_chip
>> *ic, const char *label) +{
>> 
>> +       ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s",
>> label);
>Is the label being NULL okay?

The label is taken from ep93xx_gpio_banks[], so unless we explicitly 
pass zero to ep93xx_init_irq_chip(), we are ok.

>
>> +       ic->irq_ack = ep93xx_gpio_irq_ack;
>> +       ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
>> +       ic->irq_mask = ep93xx_gpio_irq_mask;
>> +       ic->irq_unmask = ep93xx_gpio_irq_unmask;
>> +       ic->irq_set_type = ep93xx_gpio_irq_type;
>> +}
>
>...
>
>> -               girq->chip = &ep93xx_gpio_irq_chip;
>
>I don't see where you remove that static structure.

Good catch - thank you very much, also i noticed that i forgot to switch 
IRQ chip in irq_set_chip_and_handler() for port F.



