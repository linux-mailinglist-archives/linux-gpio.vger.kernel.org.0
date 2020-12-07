Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6622D0EA8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 12:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgLGLI0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 06:08:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgLGLI0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 06:08:26 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCD4C0613D1
        for <linux-gpio@vger.kernel.org>; Mon,  7 Dec 2020 03:07:39 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id a12so5539951wrv.8
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 03:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=fXKwSDv16AOh+KVLgtrXO8MP7h/qcJpU35hR/cYiidI=;
        b=jjnXwZBExlA+jNskPXLyHx7XlGVcvXHpeqhzK23So8UPP9i4SLl+29SBBR1OC3jx2Y
         Mdkyc1ZYxIu4Et9sLTH6EZXbgx9uArDCx8jEIof72bFGkK0fhZYPozBlYBgV/lUTimlH
         I83tCvHVqEDYW8bgeVw3ypLeVgjiMqXQmcKPbiy0kavnPaYpVq2jIS+0X7e61k6Pa6Io
         qELk+CxcR3vLs5iFwAC2C2eGWvRKVXH+g6wpyZICUKpeeenQ3369Rpo9dilWdThI3sbB
         uOK1lNPy9BSvx8m3Rj4mlj3axQwZIWQQwIU3Tj0W+iudvHQcndDWsjsr46o3X1fi5Mol
         5vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=fXKwSDv16AOh+KVLgtrXO8MP7h/qcJpU35hR/cYiidI=;
        b=d7YsKqMBaAKgpjizTB/mOcwcO3Zv1xWA3GjAFC6oA9qRGYmgiz0aDqMYOuaWwiGIGz
         v0tU8bmbu1vaUA7Oe97+hEsuoJQDI7H9fR2lJu8YYnDsLL2HcoBIteIYmQgKDvfliXN3
         3V9KiB8Vq0dt4zFkKEVV47k4nozo19o2Rhh+3Ji1aCKT2ENEUHr682ek3KSAyHG3ohMl
         q3/4rv8XENTbErd508iOdzmTwYz8ytop7gbgsmXuLk6pnOEfqRB9pMBSkb3vZfDi54XZ
         sJXYj2D2hyzYc9bWTVGPbru4LoYk9dw4HOI8wTrzrkw5ykGH+cdrU4CZYfhkyMO7snbx
         ML8g==
X-Gm-Message-State: AOAM530TdwrNajDI6LCBadZ6arI2jqHZxwR8OSgV+FkXfmBI4zVCAQcr
        tOT0P0FNL+Jt7ib5medK4XYwFQ==
X-Google-Smtp-Source: ABdhPJwE5n6HwO553Bm7gWNTT5QYa/KtHJFapNmhnaLnMoSS1kVbdYU3iWE4x2cOCWZAYF0xz/NpCg==
X-Received: by 2002:adf:8503:: with SMTP id 3mr2072019wrh.56.1607339258533;
        Mon, 07 Dec 2020 03:07:38 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id m2sm13399888wml.34.2020.12.07.03.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 03:07:37 -0800 (PST)
References: <tencent_220963AF059847E1171B4AB9@qq.com>
 <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
 <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?utf-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>,
        khilman <khilman@baylibre.com>,
        narmstrong <narmstrong@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: 0001-add-amlogic-gpio-to-irq
In-reply-to: <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
Message-ID: <1jtusxkh6v.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 07 Dec 2020 12:07:37 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Mon 07 Dec 2020 at 11:18, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Dec 4, 2020 at 4:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> This HW only has 8 irqs that can each be mapped to a pin. No direct
>> translation can be made, we have to allocate an irq to monitor the line.
>> So when gpio_to_irq() was called, we had to do that allocation dynamically
>> to return a valid irq number. Since there was no counter part to
>> gpio_to_irq(), those allocation cannot be freed during the lifetime of
>> the device.
>
> I'm not sure why we are talking about legacy API which should not be
> used.

I would have been happy to forget about it, but it seems to be the topic
of the thread :)

> Besides that I didn't get what you meant under counterpart API (IRQ
> descriptor has a mapping to the IRQ chip which keeps the mapping to
> whatever hardware wants).

 * This HW has to create the mapping between GPIO and irq number
   dynamically. The number of irqs available is very limited.
 * We only get to know a mapping is required when gpio_to_irq() is called
 * There is no way to know when it is safe to dispose of the created
   mapping
 * Some drivers require a trigger type we don't support. These will create
   mappings and not use it because of the failure when .set_type() is
   called

To answer your question, there an API which lets us know a mapping is
needed, but none to inform that it is not required anymore. The GPIO API
was not meant to used like this. Not saying it is good or bad, this is
just how it is.

If there was a way to know it is safe to dispose of the mapping, then
letting users of gpio_to_irq() try and fail would be OK, but we don't
have that AFAIK.

This is why gpio_to_irq() or gpiolib irqchip had not been added so far
on this HW. I don't think it is worth fixing, especially if the API is
considered to be legacy.

On this HW, getting an interupt from a pin is done by going directly
after the interrupt controller, like here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts#n173

AFAICT, making pps-gpio parse an "interrupt" property should be doable
too.
