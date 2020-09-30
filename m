Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D8127EA4C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 15:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbgI3Nv3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 09:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgI3Nv3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 09:51:29 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141B6C061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 06:51:29 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z17so2221773lfi.12
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 06:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=556brxVzuRGQkNsys98HWcjAeOl9jokCxzyRQ5PysmE=;
        b=NzKci5RlNkRjSwSYLrF+nxB0rFVtOdW42lwg28JJk/nZ8AqSaHJwS/qZr9SiAZ9NZr
         aqZX70x48NMAOljn1sKZCzmtRn4V0sCakvtO1zVy3Ep2IP9ERhL7dIOg+PMGxeP1N7/r
         Rx7bRkE3MRG+CR1KlOHUFUaQGa11RoyIZ/t5bBmvAcjCiAAswnyDn/tbeEsGAT+G20Oj
         2xm0bgM7n9GfcvoVRgl7KDZnghPfK5Ci+Ogh3XdX6g7Pcjed7vUKntPtCjkMwcRWvLF1
         klOmF160lu4pdAwLuR1ilb0jrKORazeRf4QCZMnfdJETrpXfmpOazrWTH5K65SAuFJgv
         pnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=556brxVzuRGQkNsys98HWcjAeOl9jokCxzyRQ5PysmE=;
        b=FNu/m8at8fBQ8YwBF2JwtgL4LqniwuytrveQJdkfStb+tWRSVk3PyqYnn9c6BlOlye
         HHha/NbRFVB55WvKd0tq8n8QXHy/RGUShezQFfmLQHfst5rXuXoTzqoB+HhUpbbwKrvE
         67IoIuB69ZmtL/2+BIcwTrvykz5F2dn49MWhkOKFDd/8bvd1SRZZXBylkDRG0gNmHZrZ
         vFQQ2tbLYpCNui2DhekJLhtp6EpaDbMeoJEfn5kALHQvmOb4IaKsa1TNzK1MHyPwe7Fs
         P11BoAziGFN4lPsmBI8DURwTLo1+1+06zs0kZ00EkwP5ohzf+saC/sM+UicPe4FFSVkn
         TfXw==
X-Gm-Message-State: AOAM530YrFg6fRtJKsV/AxfCyx7eL7ydtoDN/8xgEGu1MJ+wVE7kKsB0
        AHZltl9opomlLqgcXn7YirNlH4CC18ApMfiyez9i/Q==
X-Google-Smtp-Source: ABdhPJx/h4yZTw3h+c0VcGGcxDpEqYmdnDS/3HPYPOm4SsIaSShPBb8KruvqkbkTxK9QCUfi8ZymF6wfxaNg6BAy2dU=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr855650lfb.585.1601473887461;
 Wed, 30 Sep 2020 06:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200717144040.63253-1-linus.walleij@linaro.org> <20200930104729.ajufkrklfhf25d55@NiksLab>
In-Reply-To: <20200930104729.ajufkrklfhf25d55@NiksLab>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 15:51:15 +0200
Message-ID: <CACRpkdaOAdcO4P-3MphdV7bq1-CfMr0KR96+iPvJrsEX1nZeNQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Use irqchip template
To:     Nikhil Devshatwar <nikhil.nd@ti.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Adam Ford <aford173@gmail.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 12:47 PM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:

> I am getting a kernel crash on K3 j721e common processor board
> when HDMI is plugged in. Following is the full log with crash
> for NULL pointer derefence
>
> https://pastebin.ubuntu.com/p/wBPS2ymmqR/
>
> Upon inspection, I found that the "irq_find_mapping" call
> in the "pca953x_irq_handler" returns 0 and the same is passed
> to "handle_nested_irq"

This would typically happen if the driver using an IRQ
from the PCA953x does not properly request it.

Is this caused by this IRQ 504 from your /proc/interrupts:

504:          0          0    4-0021  10 Edge      HPD

This seems to be requested directly by the HDMI bridge
and not by the TI display controller.

I look in the k3-am654-base-board.dts in the upstream
kernel and I find this:

&main_i2c0 {
        pinctrl-names = "default";
        pinctrl-0 = <&main_i2c0_pins_default>;
        clock-frequency = <400000>;

        pca9555: gpio@21 {
                compatible = "nxp,pca9555";
                reg = <0x21>;
                gpio-controller;
                #gpio-cells = <2>;
        };
};

This is the GPIO controller used here, right?

I notice the following:
- There are no HDMI bridges using this GPIO controller in
  the upstream kernel.
- The PCA9555 here lacks necessary attributes such as
  parent IRQ (another GPIO) and the "interrupt-controller"
  and "#interrupt-cells".

So this can not be the device tree you are using.

Can you point us to:
- The actual device tree you are booting from?
- The actual bridge that is requesting the HPD IRQ?
- The upstream code for this bridge?

Yours,
Linus Walleij
