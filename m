Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C08D3ABF8
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 23:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729091AbfFIVRj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Jun 2019 17:17:39 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:35426 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729009AbfFIVRi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jun 2019 17:17:38 -0400
Received: by mail-lj1-f175.google.com with SMTP id x25so1519557ljh.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2019 14:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihP9CHBNii87NzZFvK45BfkIBAlThjiJWCB4oVnWpok=;
        b=M5iWwlQ+AZHZjR6Dfu1VFt1FA96KmLz7fqBEFA2kG4SlBUpY4QI50lWCFH8IVX1CQa
         rLhPrwkorA3ar51LnQFpx5yc/7A5O/piuvbpdvpE97/l1Bv/XfUU0CiEtVcRBzstR+G2
         YvO9NdOdTXHaEU8O3MsOv+UwOvjxcddeXHLm9AoYw94Aq+l6o5z6IocuAzZ+kkLy20IL
         IZNYvU/MDywIMJ/HPUdNCPWH2CoKjR4+UNnwLj3xjUU5EehCeZnRSfdx+1NLn00IyfeL
         yr18shSrswAV9mpRLVbBoHVLBNwJgdDaUv7mOymhpnMMFHypY3xAcu1p38mk3lxTkC74
         b7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihP9CHBNii87NzZFvK45BfkIBAlThjiJWCB4oVnWpok=;
        b=mfauUjDGnrfni13ditG4aPWfyCRGcnm13//2ZiQaC7k+JrzHkKo6qvnn/wKl/UqQXn
         wBHP0gFSqByLcriqGrQB642Ds210hqWAOCARNcd6pIBiZ8ryWm/5DmgWpojesIFju6Va
         AtYy3lxixUamN+IdjWEnlr9fzKaH2yR8bNexmBYnZkiSFUvXHSg5bzuN9uOWbW77XVxg
         +5Q4FNEt7T0gq7dWMpleG838s0Z+4oy0iZbU/1FgpqbLI1fXGbJRJ6r8SgRpfq3Vdl1B
         xkFEDMjOfqpCB+RwkW85QE6sTeFSJAmCaEm3g65BdNudp/PS26zi6Y2FrbaKEcrgK9hi
         ADKQ==
X-Gm-Message-State: APjAAAWg5p4yddFIYIgaA64umoh4LUAr+VZCm9n+s+qOiboOsRHjddFX
        p8GUNdtG5h3QDBoUcVtdiZibWewNJaXdCdR4eNDh+g==
X-Google-Smtp-Source: APXvYqxBdAYvm3y5LExjqCS6VzhCQ/tqa+wSJXaWXQI5XScPaVAonZ9AJt1bFgoEuS7UIm4/gbkSFm9EzpNSRJ7fCh8=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr10595654ljj.113.1560115056899;
 Sun, 09 Jun 2019 14:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com> <20190609180621.7607-6-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190609180621.7607-6-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 Jun 2019 23:17:30 +0200
Message-ID: <CACRpkdYzeiLB7Yuixv6NsnLJoa_FnGKRHHQm=t4gMH34NdFSYA@mail.gmail.com>
Subject: Re: [RFC next v1 5/5] arm64: dts: meson: g12a: x96-max: fix the
 Ethernet PHY reset line
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     netdev <netdev@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 9, 2019 at 8:06 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The PHY reset line and interrupt line are swapped on the X96 Max
> compared to the Odroid-N2 schematics. This means:
> - GPIOZ_14 is the interrupt line (on the Odroid-N2 it's the reset line)
> - GPIOZ_15 is the reset line (on the Odroid-N2 it's the interrupt line)
>
> Also the GPIOZ_14 and GPIOZ_15 pins are special. The datasheet describes
> that they are "3.3V input tolerant open drain (OD) output pins". This
> means the GPIO controller can drive the output LOW to reset the PHY. To
> release the reset it can only switch the pin to input mode. The output
> cannot be driven HIGH for these pins.
> This requires configuring the reset line as GPIO_OPEN_SOURCE because
> otherwise the PHY will be stuck in "reset" state (because driving the
> pin HIGH seeems to result in the same signal as driving it LOW).

This far it seems all right.

> Switch to GPIOZ_15 for the reset GPIO with the correct flags and drop
> the "snps,reset-active-low" property as this is now encoded in the
> GPIO_OPEN_SOURCE flag.

Open source doesn't imply active low.

We have this in stmmac_mdio_reset():

                gpio_direction_output(data->reset_gpio,
                                      data->active_low ? 1 : 0);
                if (data->delays[0])
                        msleep(DIV_ROUND_UP(data->delays[0], 1000));

                gpio_set_value(data->reset_gpio, data->active_low ? 0 : 1);
                if (data->delays[1])
                        msleep(DIV_ROUND_UP(data->delays[1], 1000));

                gpio_set_value(data->reset_gpio, data->active_low ? 1 : 0);
                if (data->delays[2])
                        msleep(DIV_ROUND_UP(data->delays[2], 1000));

If "snps,reset-active-low" was set it results in the sequence 1, 0, 1
if it is not set it results in the sequence 0, 1, 0.

The high (reset) is asserted by switching the pin into high-z open drain
mode, which happens by switching the line into input mode in some
cases.

I think the real reason it works now is that reset is actually active high.

It makes a lot of sense, since if it resets the device when set as input
(open drain) it holds all devices on that line in reset, which is likely
what you want as most GPIOs come up as inputs (open drain).
A pull-up resistor will ascertain that the devices are in reset.

After power on you need to actively de-assert the reset (to low) for
it to go out of reset.

> Fixes: 51d116557b2044 ("arm64: dts: meson-g12a-x96-max: Add Gigabit Ethernet Support")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Other than the commit message:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
