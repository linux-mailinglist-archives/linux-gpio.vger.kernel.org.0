Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 275EB4A2E0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 15:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbfFRN4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 09:56:19 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41108 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFRN4T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 09:56:19 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so9348825lfa.8
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2019 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lq9LPuQu0JCHqlqThBkJgUhddne6XRTQLUaOe9cMp+Q=;
        b=VfYjmaKla/XdXIdMpWyrl2YvK52KW37zHTZiNv0dYqjUbZ1KJeaoTQLP0PK4jykvLq
         w3aqXYse2ni6yP+DL9RNJsfXhKV2YXhcCqDvBg0141m5K3VtYLINtzYgEbulaqducPHs
         8UqATHjdHOngiZfA3+GoszQOcI2ICLVc1wbRFizANAM4F+8NBdsAnGsDFpvP6cN0tEHD
         YTd/fva37gfjXB4btgp0C2rpahRqoE1zYtaw/T229vB+eE+N9a3bvVYi4UT9/jOTSbg6
         CXcMWWwiQFsqiIH4saj0u2JIdqglo3tjsChO6phrtlnW+fm3pSPnWU0pS1mZCjhrqucV
         YKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lq9LPuQu0JCHqlqThBkJgUhddne6XRTQLUaOe9cMp+Q=;
        b=mapiyoQ6NqAlqoBUFT0ZN7FZ95mvRl96FNniKM+x7GIVVBexC0lCvV7zRW7YOtz+AU
         ITg/Vguugl+F33gGylpD801cA7cWtZcVpx4UABa9ghIngBzmDhnio68W/dFt77WRl+jG
         xaOUHh+kgHF+nYnvBZbjPsj7/bKzUtx8X3AcPCXn8Clx+2B5HBZ2CPI2TyrtdqfKzSeC
         ok0SSsuzBFntdz/bH06KCVAmtH6T3UV0c1QEAyMcSXV8GZUXRLvwEJAZQdt/syvhkLvI
         h9gm1deTobVyXhriz9j1+0tuKrgRQ2eYMrkyUb3JpCa/s6bSwGVy6wsdpr8ccXO6+WTR
         4QIQ==
X-Gm-Message-State: APjAAAVq8Ujsuh9UHfG7v7bTtvY/4FUyxOwQI8Bdm5OE2Qf8Pv27+rJR
        b/W+415LZr1eI98jhFgCK88uNVP0NsHlaNYsm30/Yg==
X-Google-Smtp-Source: APXvYqzWufyjsuScKjR9jNvYqNQiie+r76USruS1RmAqiEZV1KB609VKQJiJ+5n7fU+aPjVHo0lOupUB02FJ9a9fMeQ=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr3928129lfm.61.1560866177396;
 Tue, 18 Jun 2019 06:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <1560784425-20227-1-git-send-email-harish_kandiga@mentor.com> <1560784425-20227-3-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1560784425-20227-3-git-send-email-harish_kandiga@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Jun 2019 15:56:05 +0200
Message-ID: <CACRpkdYgTrmt859D-3QUYsk=C2NWX9bXU8MGk2hsQVds=jyQCw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] gpio: inverter: document the inverter bindings
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Harish!

This is interesting development. I have some comments:

On Mon, Jun 17, 2019 at 5:14 PM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:

> Document the device tree binding for the inverter gpio
> controller to configure the polarity of the gpio pins
> used by the consumers.
>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>

(...)

> +Required properties:
> +- compatible : "gpio-inverter".
> +- gpio-controller: Marks the port as GPIO controller.
> +- #gpio-cells: Two. The first cell is the pin number and
> +   the second cell is used to specify the gpio polarity as defined in
> +   defined in <dt-bindings/gpio/gpio.h>:
> +      0 = GPIO_ACTIVE_HIGH
> +      1 = GPIO_ACTIVE_LOW

Since this is an inverter I do not see the point of supporting anything
else than 0 (GPIO_ACTIVE_HIGH) here.

This is  consumer flag and as a *consumer* the inverter definately
does not require anything active low, it *produces* the inverse
semantic.

> +- mapped-gpios: Array of GPIO pins required from consumers, whose polarity has
> +  to be configured in the driver.

Why "mapped-"?

Just call them "gpios".

> +- gpio-line-names: This is an array of strings defining the names for the
> +  mapped-gpios correspondingly. Name should be defined for each gpio pin.

Just reference the generic gpio documentation here.

> +gpio_inv: gpio-inv {
> +       compatible = "gpio-inverter";
> +       gpio-controller;
> +       #gpio-cell = <2>;
> +       mapped-gpios = <&gpio5 24 1>, <&gpio7 0 1>, <&gpio7 1 1>;

Use predefined GPIO_ACTIVE_HIGH on all three.

I think this is using GPIO_ACTIVE_LOW just to get free inversion inside
GPIOLIB. That's not OK really, this is a hardware description problem and
totally different from the implementation problem inside the driver.

Yours,
Linus Walleij
