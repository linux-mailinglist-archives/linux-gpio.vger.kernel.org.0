Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5D32679A0
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 12:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgILKvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 06:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgILKux (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 06:50:53 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1380C0613ED
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 03:50:52 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so14552738ljj.12
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wg0fr0Xi3XkN+YWO9v5UT+RzHkdd/M+Kasz4B3DfYQg=;
        b=zR0tBZ2My4K92cIteSx5alzLJ32K3bYdevLiA8UGJqStIU+KJq9DJfMtO7LDzh/ZkT
         2GLXtXQ1lZb+XkYiG69fIvar6Zzkh0EvJfTth6FZ2xAlGtnkmuxQJ39TsWv6N6JHWKmi
         wMP7qd8M8G+OePycMmPeFZTk8FpMKH9hYkKkGwTIzh1YIH6o5u9fGNfwnpmF+vYbdZFM
         B6ZYHe9Qq594ZZoBNaokzOhVqvZGfMbR++p8BaJ1m5Jy49KRL+qoPVGgkvlSjaVgeqqW
         xNMqh3/2zGfmRTvbU+YZVtGYdWxlwaxJefH1x53q6B97BBUbtI9rzOcdichmwdlmrwuF
         2cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wg0fr0Xi3XkN+YWO9v5UT+RzHkdd/M+Kasz4B3DfYQg=;
        b=c8rnbvxnTPvxaMdtEtG0DfXl9Uos8eUSb3Av5EgeKOE+yd+2YMOxl8W2Q+moqWVTkm
         3cbDViqaKaUKZp97/5PKAxybXzbpfy6mOaSvnVi0KkJFGBbSIK/fJPFbKp7CeHjpSbee
         h/sHiF9z1U2gV3H1ONmhLNPfEeCarf3wg4DxGcNRki1DysLqABcvTVI9Nk/FVPQjnLc8
         YISMowygYgsUnwptJxKw3BElJkv6hvL4G7VxZ5MPLh9maM1behCSL24X4wrJf3JSzNlo
         1eE7t4CxY12B31OM0VAWdxluu/h+HbooIbzEmzY4Ea9s7p6NzRap4286F+dfnBYmIGKH
         RqDQ==
X-Gm-Message-State: AOAM533KDTWSa0LY774UPzmBqIdqAxpJKxi01QB5u6oJFn2pEr9gMQFj
        kehuWq6WOwha8hfZVucQZmH+L20djPRYTwQ8M97eSA==
X-Google-Smtp-Source: ABdhPJyrL0Q5hyLukWGBJStErc5rCrkaAA8Fumpbu7+P2HoQvwGOhXNmH16VkHLaE0zD8ERoYgCIrPuSvLxqYH7jV+I=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr2286938ljo.293.1599907851023;
 Sat, 12 Sep 2020 03:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200903133528.8595-1-lars.povlsen@microchip.com> <20200903133528.8595-2-lars.povlsen@microchip.com>
In-Reply-To: <20200903133528.8595-2-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 12:50:40 +0200
Message-ID: <CACRpkdZUQG1T_Bx5G275tSjDez0skDKGSc370B57FZ35NA6iEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add bindings for
 pinctrl-mchp-sgpio driver
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lars,

thanks for your patch!

On Thu, Sep 3, 2020 at 3:35 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This adds DT bindings for the Microsemi/Microchip SGPIO controller,

What I do not understand is why this GPIO controller is placed in the
bindings of the pin controllers? Do you plan to add pin control
properties to the bindings in the future?

> +description: |
> +  By using a serial interface, the SIO controller significantly extend
> +  the number of available GPIOs with a minimum number of additional
> +  pins on the device. The primary purpose of the SIO controllers is to
> +  connect control signals from SFP modules and to act as an LED
> +  controller.

This doesn't sound like it will ever be pin control?

> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: GPIO consumers must specify four arguments, first the
> +      port number, then the bit number, then a input/output flag and
> +      finally the GPIO flags (from include/dt-bindings/gpio/gpio.h).
> +      The dt-bindings/gpio/mchp-sgpio.h file define manifest constants
> +      PIN_INPUT and PIN_OUTPUT.
> +    const: 4

I do not follow this new third input/output flag at all.

- If it is a property of the hardware, it is something the driver should
  handle by determining which hardware it is from the compatible
  string.

- If it is a configuration it should be turned into something that is generic
  and useful for *all* GPIO controllers. If it is pin config it should use
  the pinconf bindings rather than shortcuts like this, but I think it is
  something the driver can do as an effect of the pin being requested
  as input or output in the operating system, depending on who the
  consumer is. Linux for example has GPIOD_OUT_LOW,
  GPIOD_OUT_HIGH, GPIOD_IN, GPIOD_ASIS...

- Is it not just a hog? We have bindings for those.

> +  microchip,sgpio-port-ranges:
> +    description: This is a sequence of tuples, defining intervals of
> +      enabled ports in the serial input stream. The enabled ports must
> +      match the hardware configuration in order for signals to be
> +      properly written/read to/from the controller holding
> +      registers. Being tuples, then number of arguments must be
> +      even. The tuples mast be ordered (low, high) and are
> +      inclusive. Arguments must be between 0 and 31.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 64

And you are *absolutely sure* that you can't just figure this out
from the compatible string? Or add a few compatible strings for
the existing variants?

> +  microchip,sgpio-frequency:
> +    description: The sgpio controller frequency (Hz). This dictates
> +      the serial bitstream speed, which again affects the latency in
> +      getting control signals back and forth between external shift
> +      registers. The speed must be no larger than half the system
> +      clock, and larger than zero.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    default: 12500000

I understand why you need this binding now, OK.

> +/* mchp-sgpio specific pin type defines */
> +#undef PIN_OUTPUT
> +#undef PIN_INPUT
> +#define PIN_OUTPUT     0
> +#define PIN_INPUT      1

I'm not a fan of this. It seems like something that should be set in
response to the gpiochip callbacks .direction_input and
.direction_output callbacks.

Yours,
Linus Walleij
