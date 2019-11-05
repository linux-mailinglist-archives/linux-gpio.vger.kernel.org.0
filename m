Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB26AEFA43
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 10:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbfKEJ6R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 04:58:17 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35248 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbfKEJ6R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 04:58:17 -0500
Received: by mail-lf1-f68.google.com with SMTP id y6so14636125lfj.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 01:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xfv3rqWrlWf5UFQQBJ1k9wZswD1YcP5UXfQc274fzwc=;
        b=Dm/LBYaNKCC80fiSISuS3+46W1tYr96C4MW/M3Zd8TWW/ZTZ7+DbRCEcr4bUSn0wZX
         DaubUf6Ww3Vj6sL1TVgUvp7j61hDc6biINEtPWBCLfUk6miygczsFggKBOIVsY5RIpIJ
         x8Gj6SfhQ/yV+iMcIFz2wYs6ELGsZImOI/TeL9oZwWrCYKONa+/+hUzkXUZthexFuiGK
         jjX2o7BRSGSMKXVpWWIn96snSUaXwUAbmNsVj1EBrPvYnfUIKcEjHFOrGdNj3DyXUgIR
         YcZsnqm1ArwMgYMMBFUiL+IQZ6ASNX7I2YCL93BEmC1xR/IEjyuv0Tyr5EJ/MCbDDm88
         K6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xfv3rqWrlWf5UFQQBJ1k9wZswD1YcP5UXfQc274fzwc=;
        b=EbITaCrMyu7pmFGRAU2F3lovkB9H0/yM2Angz2mcA4wuYh53RhLELTLQnEdQJMFt8M
         a0jvOFAH/sf4Qi/FkqYIGD4mFX08feo8kEx3ATXX4z/PwtFc2kWoUTqU3hMxUzHcR8KE
         ho7wOHuEPk0wOvl/CTyxMuDZxTYew59qAfqtkjZNUvsLqnQ04ANQugTN/OhWnTI//DLH
         GBOQKidJQ+m9Hy9J/cSySL9bhAjo6q8TFn3/Bgy+4t1mx8TLqGX4AP9wOxPUTHA1Bqj4
         Tu3SvLhnxc5azoUuKMhARNFtufKlf3a8ypI8oHX8g2LoO1mqy2e/o5EMWWwfgE3XnQ2I
         FPMg==
X-Gm-Message-State: APjAAAWZCFdhc+uy7BDX5ng6085A89Q22V0lY+3VCpEjX2Ol4PtiWja2
        7xYEcFTf3kW69+99tGvjeGncvM/Mn8lswxaMK2+twA==
X-Google-Smtp-Source: APXvYqwYns8R5LfOjsV6lFnr68ZUkWZUoQdLj2KD8Drrga7JlPOGBdSLdSCdkjQCzKc3gaD6i4cTs1T7zHigAf54ymw=
X-Received: by 2002:ac2:51dd:: with SMTP id u29mr20191666lfm.135.1572947894944;
 Tue, 05 Nov 2019 01:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20191030120440.3699-1-peter.ujfalusi@ti.com> <CAL_JsqK-eqoyU7RWiVXMpPZ8BfT8a0WB47756s8AUtyOqbkPXA@mail.gmail.com>
 <5bca4eb6-6379-394f-c95e-5bbbba5308f1@ti.com> <20191030141736.GN4568@sirena.org.uk>
 <f9c181d1-5e0c-5e82-a740-f4e97822604f@ti.com> <CAL_JsqJ4WdaRvmZcjQG-jVyOOeKZX9fn1WcQZGWfUPqwunQCFw@mail.gmail.com>
 <1258a5bf-a829-d47a-902f-bf2c3db07513@ti.com> <CAL_Jsq+V0oAdVCaW+S12CUa4grCJhZD8OGDeu=0ohcGgxOkPVg@mail.gmail.com>
 <5669a4c1-2bc1-423b-1407-073317f7df7e@ti.com> <CAL_JsqJbhG+-zVs9bjHg8asGuM1+FNnGJ0xx7qcPBwuRX35ijw@mail.gmail.com>
In-Reply-To: <CAL_JsqJbhG+-zVs9bjHg8asGuM1+FNnGJ0xx7qcPBwuRX35ijw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 10:58:03 +0100
Message-ID: <CACRpkdbiG5mt3WGEeHWsu-L3dzQJUQjxjGwQXK0cLgZNZ74yWg@mail.gmail.com>
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 4, 2019 at 8:11 PM Rob Herring <robh+dt@kernel.org> wrote:
> [Peter]
> > The device needs the RST line to be high, otherwise it is not
> > accessible. If it does not have reset control how can we make sure that
> > the GPIO line is in correct state?
>
> Just like the reset code, drivers register their use of the reset and
> the core tracks users and prevents resetting when not safe. Maybe the
> reset subsystem needs to learn about GPIO resets. (...)

I agree. Certainly the reset subsystem can do what the regulator
subsystem is already doing: request the GPIO line nonexclusive
and handle any reference counting and/or quirks that are needed
in a hypothetical drivers/reset/reset-gpio.c driver.

There is no such driver today, just a "reset" driver in
drivers/power/reset that resets the whole system.

But I see no problem in creating a proper reset driver in drivers/reset
to handle a few peripherals with a shared GPIO reset line.

Yours,
Linus Walleij
