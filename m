Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8484A31B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 15:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbfFRN7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 09:59:01 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36940 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729253AbfFRN7A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 09:59:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id 131so13261981ljf.4
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2019 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X671JgdyLl76VG/wPtsNRxBwL9HcuB7R+9MrgrBq9Ws=;
        b=dSWs2KALS1NSLhc30LVQ22tp4/bkp8dBi2AjwHTPnJdSt6mbQ3OhIwXprLCk2a64FV
         Fs/9XO/posPxg18MRXh/BR79wVv4lEa2Eu2SvCs4GlDJvzJLonhJfAyS5IClyhEWS1I3
         AnCYrON0sFTCSNA5gvO3BsWTCPZ1l/XDxFphXLY6Cc+yPVbRO37uR6h3bohaoth44g7n
         7mDX5B1hM3qTVtXHd8piQf+WoM1wewZcmmeSuScy0kDupPpqONw/MrwzXKpUXAVsFw0B
         jG+3z112WsEWa1BoiueKU8K5sHRhg/j/1bsR54IKpj9RYxMLLvMS7kBnQrylkCMz2mDH
         PNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X671JgdyLl76VG/wPtsNRxBwL9HcuB7R+9MrgrBq9Ws=;
        b=t9RrGqpxzQQnJHZfI5U24DzGOiMPb7nogZ6+Ly3uaNNEhL0QIvQhZRthyCjNy8KvaA
         yqLW/h0/9asEgKbNXhZRdAEM25xS3WkmL+LSEOjjdVY70c2HmaPzu5jsdx7HCTDtRH5A
         dHOA3Y6lIOh8y+BaDtKKNrnBblvkUfk+b5ik6bkZbzxM6HAtffKiufc4FDjiXGSPe1B+
         Y1JXfT0sexkWV6opYqmOsiMLvp57HpFJXKQXLLxpn73ZKfuPEWaJ1s63esjRrxtc2Zev
         GBCNjUrydicasgifNnpu68webNfqGGhTIAD+n7hb/6rtQPCQcG4J81XwPhhb+IOg3beD
         NYKQ==
X-Gm-Message-State: APjAAAXSa/IP3/6h9jUwRu8rqC8dihO5+UBaBZAD4AMAQKDZ3yZyaYYf
        3uFu1Zm7ZgyWhgdS2ei0zv5l1B4noEn1mmWFl5Mm9fKu/CQ=
X-Google-Smtp-Source: APXvYqxsRLtfOl+1NSzAXmxwEWuh6Gjm6SRSSaE72JKrJcp1GOXyzno9yvsHIUIrz/3GOJHQuQT56Sw3UpleieU3sik=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr22952429ljb.28.1560866338833;
 Tue, 18 Jun 2019 06:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <1560784425-20227-1-git-send-email-harish_kandiga@mentor.com> <1560784425-20227-2-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1560784425-20227-2-git-send-email-harish_kandiga@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Jun 2019 15:58:47 +0200
Message-ID: <CACRpkdZke9yGFai6ri1ThFC-HUj2UxdBzVFC+V=n8-Jt9E32PA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] gpio: inverter: Add Inverter controller for gpio configuration
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

On Mon, Jun 17, 2019 at 5:14 PM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:

> +static int gpio_inverter_get(struct gpio_chip *chip,
> +                            unsigned int offset)
> +{
> +       struct gpio_inverter *inv = gpiochip_get_data(chip);
> +
> +       return gpiod_get_value(inv->gpios[offset]);
> +}
> +
> +static void gpio_inverter_set(struct gpio_chip *chip,
> +                             unsigned int offset, int value)
> +{
> +       struct gpio_inverter *inv = gpiochip_get_data(chip);
> +
> +       return gpiod_set_value(inv->gpios[offset], value);
> +}

The only reason this works is because you added GPIO_ACTIVE_LOW
to all the lines in the device tree. But those are consumer flags, not
producer flags.

These should be removed, use GPIO_ACTIVE_HIGH and rewrite the
code so that it actually does the inversion here:

return !gpiod_get_value(inv->gpios[offset]);

and

return gpiod_set_value(inv->gpios[offset], !value);

respectively (notice ! inversions)

Yours,
Linus Walleij
