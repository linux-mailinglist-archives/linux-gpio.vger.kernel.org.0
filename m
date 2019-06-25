Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA0054F16
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 14:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfFYMmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 08:42:05 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:33630 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbfFYMmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 08:42:05 -0400
Received: by mail-lf1-f49.google.com with SMTP id y17so12539930lfe.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rB6Tm78ZyDlaBUyUjgUXKM4p8D1Nnd0QbvlWGOzoLrY=;
        b=mvCm1Nmk+nxjvagq/anuwNpEzuUXlRYSaUf+wtKFM5ow9J0imTACEJdK9FLKyGz9Bg
         TvejTLkRQbpsX50ajHn0nLOsrYPoOc27SF/FhrJsP3PU5+s2XOtyLTpeAUlnOj5Z9V1R
         /BfxXSzU0YWvEZ8clijEOel4lePYYTqSPAnEF/gb8k8g17OgNP6V91uAokxhSqyObHav
         b6BTE1v5SQZHFuFpYKWASGLULtjMDDMpmYEJltTu+wOwitECmoCtvfM5sdIWcR0xqroT
         Xj/VWbcqi8EVfK63D6MYalBkVD7FXTjT95Y/mm4ZM0jxF0/DOLQ721n+JnEXou9K4aG6
         KySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rB6Tm78ZyDlaBUyUjgUXKM4p8D1Nnd0QbvlWGOzoLrY=;
        b=I2rCwsVVB7ebqfVaYN9eJrV8LhQtn0ybuuUpzLZ1n66BL4rcLNOvT4Lcj6O3kVl6cj
         EdUi/C9vvE+reCFVJ7RrO2QaRb3tXQBHsqkSOJOHoIA4ut6rgW5WYzYFEjlMaf5lAu6V
         lJQMQvwjReikbPLlsWRDqpGRbHtjbWIkc85HX42hb5Dur6qjNUUPkeNw5aB+geM8z5Hm
         MDTrb7cok/LAKY+YQ7Jf+e1LJECn273IakHlr97Q7K0xmmWzDxl0Wmvcr1wTCorcfpXY
         FgUoGx28uPPrO8EfsS803GgqUp//lcBWXs313Pqv/4oAr8rPz6rcCsxVJnK69rCg5+f2
         RbhQ==
X-Gm-Message-State: APjAAAUOVVJs6tOiXJT1c6Ss0sY1NrzfN33LjsZYlqB/4xuqepYnN2Vd
        NAtKZTylC5gnDY7knX3wn3SL0EfgSJU+skrA0pJh1hGhPnY=
X-Google-Smtp-Source: APXvYqyBGq8dbrhzLaL2XHvbnGkWSnUDIvLvR3/ibYNidMhqtEQTlDjfZ+H/zFA+29/84l1TW6VlYv0Q5OpCxs3AaVo=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr13991909lfu.141.1561466522953;
 Tue, 25 Jun 2019 05:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <9e977d86db99153e413dc9099f3a70f4@walle.cc>
In-Reply-To: <9e977d86db99153e413dc9099f3a70f4@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:41:51 +0200
Message-ID: <CACRpkdb1NAbZxhC43__MCqh8e4xUumgG-aj5qJVAt7i1x7UBHg@mail.gmail.com>
Subject: Re: generic gpio-syscon
To:     Michael Walle <michael@walle.cc>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 18, 2019 at 6:02 PM Michael Walle <michael@walle.cc> wrote:

> I'd like to disuss adding a generic gpio-syscon (eg. compatible =
> "gpio-syscon"). At the moment, if you have a board which could use the
> gpio-syscon out-of-the-box, you still have to submit a patch to add
> support to the gpio-syscon driver. Wouldn't it be easier to let the
> user/board manufacturer configure the parameters through the dtb?

I don't know about that. I have written a binding:
Documentation/devicetree/bindings/leds/register-bit-led.txt
which does something like this. So then I would say
be inspired by that.

It kind of depends on how complex the hardware really is.
If this is "just" a register in the syscon then I guess yes.
And then I mean ONE register. One register only, e.g.
an output-only thing.

If it is supposed to hide an actually more complex hardware
with separate input and output registers and direction setting
I'm not so happy with it.

Compare to drivers/gpio/gpio-mmio.c that rather takes
the idea of Linux supporting several simpler GPIO controllers
by using several compatible strings. For anything that is
a complex enough piece of hardware, that should have its
own compatible string.

>    gpio0 {
>        compatible = "gpio-syscon";
>       syscon = <&syscon>;
>        gpio-controller;
(...)
>        offsets = <0 0 1>;

I don't understand this...

>        io-width = <4>;

In bytes?

>       mask = <0x0000ffff>;

Isn't this synonymous to using the standard "ngpios" property,
indexed from 0?

Linus Walleij
