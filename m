Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E6D116452
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 01:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfLIAU2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Dec 2019 19:20:28 -0500
Received: from mail-lf1-f45.google.com ([209.85.167.45]:38275 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfLIAU2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Dec 2019 19:20:28 -0500
Received: by mail-lf1-f45.google.com with SMTP id r14so9264888lfm.5
        for <linux-gpio@vger.kernel.org>; Sun, 08 Dec 2019 16:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MHPwh1y/n4h6B3Kr1hQ3vt143Cypr4Zc4bxHvs1bL1s=;
        b=YJ2Z9d1LLO3HiNP5Cj86Xn9PhRPnCP461HYAfLOpE33VYg4X/b5RdZMTd5G8RTuLEx
         QcL1QGR9H3CYUKzsTz39bvQHbhtIt1XpuDyXeGSlBu4Mhw3gsH1mUAmUbFoJX5jOxC7m
         4j2oYy6jJd7zrwoMAhPHfi20W3qlsFLgGZ2kLvaD+VU21KINczxmVb4OiITEOcWsPBZD
         bbdzjof/2gxGhZ/z0m6PXS0Fy7CLn/jNa0soMxwdUpbkfh4JMvOqyURODNZ16xDXqdhS
         FAk4OS0IEo8lvQLomW5Z4tV1tTGqQZKvOxFxlhpbQT9Of1ohFUmCpXXygdpESZeHVWz3
         782Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MHPwh1y/n4h6B3Kr1hQ3vt143Cypr4Zc4bxHvs1bL1s=;
        b=ZfbGp+ZBT6SP3HZE+m5c2pgBI5qvpYdv3FQSCSgfuF8/kWxDU/AjfN9q9x3hpwSrj4
         oqk5h7glW3uKtbSHYbsHepVn+Su2P+QJo8IEcHihFYfp+pTD2VPZ9xunFUA8c8epK0yW
         aOUpdadChEqMWWW+mop/XO+M4sT+cAEa0e+ZT2rY8MdnUft9cFICLY9LqXocmgNAwZd7
         eP80MUlOY5HprTnR1Ez4RYHoVvOXxcLR+/mJ54lNFCiEm0M+bONQFq/mnMC+0yB7S2Qe
         o3+pprwKJM6VRKisxfX2cGMi+kc/rU9krXb5GQLcGwC+tH/zX07GGCkeunUqm/RbVe0d
         vDpw==
X-Gm-Message-State: APjAAAXplEwxO7jmfbqvLTp+pRC21vUjSC3oFCTHGl3DY2YaM5253Piy
        oAE+NGDvSDWNa8PrnUKQ9PzIgUpCrxOrG19mSJEQIdxwe6F+8w==
X-Google-Smtp-Source: APXvYqz1ICQM0K1LHeR6QTf4gipjvIQPfKyB9dj3sza1iGU1uUKxJniITX2rtw2pCgEXg1z77JkTiIlU37yi9pqJWBA=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr13375016lfi.93.1575850826412;
 Sun, 08 Dec 2019 16:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20191206173343.GX25745@shell.armlinux.org.uk>
In-Reply-To: <20191206173343.GX25745@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Dec 2019 01:20:15 +0100
Message-ID: <CACRpkdZv2rzA8AbFZKq0XVBaXNJR8c5tsb+1KTZ7fNuWjm5cbQ@mail.gmail.com>
Subject: Re: pinctrl states vs pinmux vs gpio (i2c bus recovery)
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Russell,

very nice description of this dual-mode problem.

I wish I had a simple and elegant way we could make it
unambiguous and simple to use ... but it beats me right
now.

On Fri, Dec 6, 2019 at 6:33 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:

> One may expect:
>
>         pinctrl_select_state(i2c_imx->pinctrl, i2c_imx->pinctrl_pins_default);
>
> to change them back to the default state, but that would be incorrect.
> The first thing that pinctrl_select_state() does is check whether
>
>         p->state == state
>
> which it will do, as the pinctrl layer hasn't been informed of the
> change that has happened behind its back at the pinmux level.

Some pin controllers have the .strict property set
in their struct pinmux_ops:

* @strict: do not allow simultaneous use of the same pin for GPIO and another
*      function. Check both gpio_owner and mux_owner strictly before approving
*      the pin request.

The non-strict pin controllers are those that actually allow GPIO
and device functions to be used on the same physical line at the
same time. In this case there is not special GPIO mode for the
line in some muxing registers, they are just physically connected
somehow.

One usecase is sort of like how tcpdump work for
ethernet interfaces: a GPIO register can "snoop" on a pin while
in used by another device.

But it would notably also allow you to drive the line and interfere
with the device. Which is exactly what this I2C recovery mechanism
does, just that its pin controller is actually strict, will not allow
the same line to be used for GPIO and some other function at the
same time, so I suppose i.MX should probably explore the
strict mode.

Enabling that will sadly make the problem MORE complex
for this I2C recovery, requiring a cycle of
gpiod_put()/gpiod_get() to get it released from GPIO mode, i.e.
we would need to just get the GPIO when this is strictly needed.
Using devm_gpiod_get() and keeping a reference descriptor
around would not work all of a sudden.

I am thinking whether we can handle the non-strict controllers
in a more elegant way, or add some API to explicitly hand over
between device function and GPIO function. But I can't really
see some obvious solution.

Yours,
Linus Walleij
