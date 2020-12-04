Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3312CEFAB
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 15:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgLDOYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 09:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgLDOYw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 09:24:52 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D39C061A51
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 06:24:12 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id l1so5480683wrb.9
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 06:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=jUrLTNYFEiHdTQnh4b2KYj9Mt2pIKbyV0FmvqdxpeB8=;
        b=Z6DkyOnE9k1kWZpvptHeGrpAXBwSapeSB8w1YdvYbnb3eftmlK2wjdSjdpN7qCOj2+
         nn+uYpuGAK4xmpf1bBewVR90Ik16AG7aoY0iQEv6cw7rLmLB8GXJK4KKVyk5XMUXcfk0
         EDMMpV3uJc4m6t/gnwI3sy2t4d250gGHLxpLlwGXbaZhswUraVRt94C2BMMcjp3HX10m
         zEQCPyhxIq0cXuBLHXrkZwPXLwpT4yin9SfAh1QeSDSJL9XPv//Px0NZy4CjDLc+UxI5
         FQ+q0ZObcEIkv6JwodNHpm4IsjoWTxyMo1vL+Sg/7A6qI2A95DQjYkyf/sWjUp3flODt
         PKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=jUrLTNYFEiHdTQnh4b2KYj9Mt2pIKbyV0FmvqdxpeB8=;
        b=J+HUOSyGLMypmMMA5xlyC82/6CvGBBZmLsZ/1wly3DoNukzeuP37wGIo3zj95vgQ3z
         M+KqJPXWIeq1HwNv8GT5KLnLGxR/5+YJNXX19J3pR1wg6oz3ldqa1pxsFMt6a+eXJp8Z
         drqXqU2VFyWE/biucyIw2968fSAXx4b5sPfjwlV61cr+Sl9TraBcu2qT+t+ogCcCp/Lr
         C8L4dMXUZTDIAz9ZzP2Bs/WnyIMF0MxyscpFopnsQABgdBxohiB7zDebw5SeCfUWXor1
         jFSEloOF7e/L/r25BJf+m1b1z9XI9m8uVp63YUuPZ0nsOTwAh/SOSEyWpEpZkU66axs+
         vMhg==
X-Gm-Message-State: AOAM5321aGtWpaWoKe6o3GCPflLfwzyHpRGSLJ7ACt2HpTYhua6SkOmy
        MXeXtwCNhRYrG5GgKZRe6rF8jg==
X-Google-Smtp-Source: ABdhPJwoBA9wqffJQYc31bYbuyvOWnHNUoeQXULAdRVuAJOkUsOmNY8LZXa33e0UvMqyOWL8CHF4zQ==
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr5285264wrx.412.1607091850901;
        Fri, 04 Dec 2020 06:24:10 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id j8sm3868701wrx.11.2020.12.04.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 06:24:10 -0800 (PST)
References: <tencent_220963AF059847E1171B4AB9@qq.com>
 <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        =?utf-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>
Cc:     khilman <khilman@baylibre.com>,
        narmstrong <narmstrong@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: 0001-add-amlogic-gpio-to-irq
In-reply-to: <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
Message-ID: <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
Date:   Fri, 04 Dec 2020 15:24:09 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:

> Hi Lisheng,
>
> this patch got a bit mangled but I get where you're going.
>
> I think Meson needs to be augmented to use hierarchical gpiolib irqchip
> because this seems to be what the system is doing.
>
> So start with drivers/pinctrl/meson/Kconfig and add:
>
> select GPIOLIB_IRQCHIP
> select IRQ_DOMAIN_HIEARARCHY
>
> Then use the generic hierarchical gpiolib irqchip as described
> in Documentation/driver-api/gpio/driver.rst
> Type
> git grep child_to_parent_hwirq
> for several examples of how to do this.

One reason the irqchip has not been linked to the gpio controller so far
is IRQ_EDGE_BOTH which the irqchip does not support (expect for the
latest sm1 family)

This is a problem we discussed a couple of years ago.

This HW only has 8 irqs that can each be mapped to a pin. No direct
translation can be made, we have to allocate an irq to monitor the line.
So when gpio_to_irq() was called, we had to do that allocation dynamically
to return a valid irq number. Since there was no counter part to
gpio_to_irq(), those allocation cannot be freed during the lifetime of
the device.

When drivers relying IRQ_EDGE_BOTH first try the `gpio_to_irq()`,
allocating the irq works but setting the type does not. We are then left
with unused allocated irqs (and we don't have much)

Frameworks using gpio_to_irq() are often capable() of parsing interrupt
properties directly too. So far, it was enough to work around the problem.

I admit, I have not been following gpiolib closely since then, maybe
some progress have been made

>
> Yours,
> Linus Walleij

