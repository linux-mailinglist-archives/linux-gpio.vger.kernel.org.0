Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDFCE144AD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 08:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfEFG5a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 02:57:30 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:47086 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbfEFG53 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 02:57:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id k18so8298892lfj.13
        for <linux-gpio@vger.kernel.org>; Sun, 05 May 2019 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7LLD6ajA9NhCKXlByXZuXUXwmnFsBtq7/o6LG5Jh9KE=;
        b=kGui0bUx2qHhA2h5QY7Cu9Z4affxpDepY0lngaRjo6AhYd/y0YG+cbI5NQBqO+cFIE
         jCB/+Qpnok860H5fXM1BWQOP1o+ZQNicO7FuZR60TnxScK2wI/eY/eB2+Rrxo0buIcLd
         2vMNfm8QW5HmxfDpijhHaEVCroEDGDgBhv8jsDQK91WIt8W76fvynRm9E3jRb+UJFYfp
         p+8WPwzUJmYu94KJ4ScynSpmJQwkPhwj1Ez08hxzPUa3nCvmokRWS46Fnz3nVGdJDGjk
         bJSa8atvXjFjCm9uynnziZfo6qsRvTw8hzQiZFeKNQFUB0d65LJHl6opEpqkhtxXqLqU
         pIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7LLD6ajA9NhCKXlByXZuXUXwmnFsBtq7/o6LG5Jh9KE=;
        b=ColvfnlGOJ1xRlOYB16qb0PmYBita0oIpF48n74gAUct8ejgpZUaVekr1WmgBSrPRU
         JYbUpi+xzELzWwwJLllnbbJG11BYP1R75+EsG9T81ZN0bxo9LrxLUKUxDyrIYK38/l13
         oAGcl8FB2T9YU3twtzDfKoF1jok9LD/GGfNaj5qEkMJc1E4dt+Sws/47V9nLauoNVhoG
         D5Rem7aqAGhMu+fhVZ3Su7V2e6VEHcich9TB0CTYjeAnlyOBQKXMxM+H6IP5u3b+08RF
         itilhUP7IWtnfX8huN2bbjRE5+btyeKWP8wVE6QUuEIGmvpP1WUABmLK4FLyqzHgjU7E
         DmfQ==
X-Gm-Message-State: APjAAAVM0L5mvdv8pj390GFR0mcczypDm7Y8wzSt6pxZJJggRhUaC8lS
        RPFmQ9lmwa4f+FgF/QXqpufFT8rx4a5t3P60rPeeaRosiRM=
X-Google-Smtp-Source: APXvYqzfXNImBKYKHbUoZkYG0XfiQJ5PnkZeJCFlmUqT6bbblPTP4kUjgo/y9ctaWgmcLQKKa//jhEYnVetySWpbM08=
X-Received: by 2002:ac2:4a86:: with SMTP id l6mr11685476lfp.51.1557125848091;
 Sun, 05 May 2019 23:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com> <1557122501-5183-2-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1557122501-5183-2-git-send-email-harish_kandiga@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 May 2019 08:57:16 +0200
Message-ID: <CACRpkdZ84hkg_8J+OAYpZD0CFzENkUMeaSZoMyTK+hBdTCKGqA@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Harish,

thank you for your patch!

On Mon, May 6, 2019 at 8:02 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:

> Device could decide to have different convention about what "active" means.
> ( i.e Active-High (output signal "1" means "active", the default)
> and Active-Low (output signal "0" means "active")).
> Therefore it is possible to define a GPIO as being either active-high or
> active-low .
>
> Make it possible to add the information of active state of gpio pin
> as property into device tree configuration using a
> "active-state" property u8 array.
>
> This is useful for user space applications to identify
> active state of pins.
>
> This commit updates gpio_desc flag for active-state.
>
> Note: The active-state attribute is completely optional.
>
> example device tree line
> "active-state = /bits/ 8 <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0>;"
>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>

I see from the code that the intention of the code is to
encode on the producer side (the GPIO chip) whether to handle
a certain line with active high or active low semantics.
In effect setting FLAG_ACTIVE_LOW on some descriptors.

The usual convention is to refer to this as "polarity" so
you would probably want to name it "polarity" rather than
"active-state".

However:

This is problematic because the convention in the device
tree is to encode this on the consumer side and not on
the producer side, so e.g. a device node using a GPIO
line will use something like this:

                button@1 {
                        debounce-interval = <50>;
                        wakeup-source;
                        linux,code = <2>;
                        label = "userpb";
                        gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
                };

If the polarity differs between the consumer and the
producer, who is going to win? Defining polarity on both
sides is going to lead to ambiguities.

Even when using GPIOs from userspace (which I do not
recommend) the character device suppors a polarity flag
GPIOLINE_FLAG_ACTIVE_LOW so also userspace
consumers define polarity.

What kind of consumers do you have in mind for this
feature?

Yours,
Linus Walleij
