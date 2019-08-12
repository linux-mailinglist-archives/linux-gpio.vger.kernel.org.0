Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1CF089C79
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 13:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbfHLLR6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 07:17:58 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35318 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbfHLLR6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 07:17:58 -0400
Received: by mail-ot1-f67.google.com with SMTP id g17so6356698otl.2;
        Mon, 12 Aug 2019 04:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T98EYVXZVYsv6oIQenn9IjYx/y91OWwX/ZZNufzUEaQ=;
        b=U/ukrcHUZbDXp6krKJmXEg7Faak/9sO5m4CshXdv3AnAmQlIKQd6EBV7pLHdupZp0s
         CvRRmnDJwyHMept5fzsdPqlgxDIe63JJ0Jq2a/0acbszBHXNFOJpkS+Wclp+PmOlQ35x
         qiJSKfMeMd8uQw8x/2yniKOhA0bMaiiCCR0bsIrnHGD+Ac0rXfE4ujawWKOuunhTWN/s
         17KiUzZoVRcdJX90c4MuNXTpdYA152Qz5MIwspggMrEzxXuCKkf4gff+Ln2u5whmFvfe
         uMBe+/4Bw8MQ+EeENP7m9ErRNEy/fJmp+IG+7uU5ZfB2QnGHvR+ZN118WJnTk/rWT6Vl
         j3OA==
X-Gm-Message-State: APjAAAUzFugaM8HvOXY0jQ6FmhSXiL27AwjcQdgMgZ72F+4Efd/MkJq5
        PunWVzITnOdN9LqDay2oJvC1lC72TKxLjjuHN/p+rF57
X-Google-Smtp-Source: APXvYqywrLlTNCi7rWgLUTPrwd7Kyr0xMBgwRDItBqJgUbRJaCxpQqgUxztpPiUsBIUKcI8W1MXjZGy8DCJGbvUeJ6g=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr12842065oif.148.1565608676826;
 Mon, 12 Aug 2019 04:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190808132543.26274-1-sr@denx.de> <20190808132543.26274-2-sr@denx.de>
In-Reply-To: <20190808132543.26274-2-sr@denx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Aug 2019 13:17:45 +0200
Message-ID: <CAMuHMdUzry6f_AqcjevgSRgJ2Q8Nqr_kEyYz+1QEVft6BTrC2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
To:     Stefan Roese <sr@denx.de>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stefan,

On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:
> This patch fixes a backward compatibility issue, when boards use the
> old style GPIO suffix "-gpio" instead of the new "-gpios". This
> potential problem has been introduced by commit d99482673f95 ("serial:
> mctrl_gpio: Check if GPIO property exisits before requesting it").
>
> This patch now fixes this issue by iterating over all supported GPIO
> suffixes by using the newly introduced for_each_gpio_suffix() helper.
>
> Also, the string buffer is now allocated on the stack to avoid the
> problem of allocation in a loop and its potential failure.
>
> Signed-off-by: Stefan Roese <sr@denx.de>

Do we really need to spread this *-gpio" legacy support all over the kernel?

Seeing the only in-kernel users of legacy "rts-gpio" are

    arch/arm/boot/dts/am335x-nano.dts:      rts-gpio = <&gpio0 13
GPIO_ACTIVE_HIGH>;
    arch/arm/boot/dts/am335x-nano.dts:      rts-gpio = <&gpio2 15
GPIO_ACTIVE_HIGH>;
    arch/arm/boot/dts/am335x-pdu001.dts:    rts-gpio = <&gpio1 9
GPIO_ACTIVE_HIGH>;

and this is handled by omap-serial.c, predating mctrl_gpio, I'd like to
reconsider.

Documentation/devicetree/bindings/serial/serial.txt always described
the "*-gpios"
variants, so there should be no users of the legacy "*-gpio" variants.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
