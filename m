Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0DECD919A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 14:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391462AbfJPMxv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 08:53:51 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40122 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389800AbfJPMxv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 08:53:51 -0400
Received: by mail-qt1-f193.google.com with SMTP id m61so35874866qte.7
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/sRs2+kPjcvwd2trmOBWPVdM0AxawvVsZ+s8sAO7/4=;
        b=TsPMzUgWcdtdkasHhYq577HFiCkshIqaxslChEP+do1RFpTIxW2jQRhCLSPwbd5x8i
         U7niU6BZWK/agFFkyA+6MFgZbwkW60EosnfY+llAQGBocfTcp4KRF8J/zJn8tfy+Xn4R
         ND/tIJ4q5KZ7QKtwldwq2k59a5s7at2G3Hi8BXC6iZm33w3oVf21uxvJWvsoT6eTs4Vn
         WDL+yMSxQwFiUsYSJ7A7I+v43eHl0YHYHoIzhjWanzIpiZ7RpplDgnbKGyR9Qf/+l5dt
         /jBMTe3E/dc+CJIqaHslN4E+fQmzn4yXKprR+7pYhIDJP/ZUFpJZXfCOGoH5zVOCAejO
         Ui3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/sRs2+kPjcvwd2trmOBWPVdM0AxawvVsZ+s8sAO7/4=;
        b=pyN7/HU++I9hCiK4F3HMqLpWGt4PIMIRIwPQBqdQbNqcNt8pUWKouHxIuzjUHKPCDc
         dY4v5DB9ZWiIK9dO1xqKVo2KnBHB9JA+H1Txt6ZSbtvIEkp7gfUZSEsFoAHxOONekn09
         cZJ4eT+n5khUg5TBbsFqcrQzqnDWm0DI2QjvDoVGa/yhijXx8z+vUsyKVTe5Ef0Fye85
         sViySIqsUX5znuhdyfWs5vIOmsEBd7pK0rGEpIjXyX5hGbeeCEPdCo4efQhWPAedKmbm
         3ydEC8hNOQa7WzKNLJAiX3GmYuvKY2gxaSN5BleK0b+7nI6SsG4k5/YsvWhgv85EhLaN
         fO9g==
X-Gm-Message-State: APjAAAXGMkOhmNh6nO6BwnCvsJeLsi1fLQtcyOKV7TiVDfb2ZH6VxZan
        hAxUeUiXN32dJ7lD0073QbAJzXHVB8D0y6T+uFXRng==
X-Google-Smtp-Source: APXvYqxRmpmcyaCxmLmkEi0JWpxgYlv/RpJs/yNT3A1lP3hXCkiugyGea31zdLuV3cm9n/Bm5GfFph4HfEVVYNrBVag=
X-Received: by 2002:ac8:3ac6:: with SMTP id x64mr33736244qte.51.1571230430797;
 Wed, 16 Oct 2019 05:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
 <20191004012525.26647-3-chris.packham@alliedtelesis.co.nz>
 <CACRpkdYWLTjiSQo_VTeReL1CfEO3h_8ONbdCk=PD1x+oc2ggCg@mail.gmail.com> <628c495994a0648d956bc663ea8fdcfa6f439802.camel@alliedtelesis.co.nz>
In-Reply-To: <628c495994a0648d956bc663ea8fdcfa6f439802.camel@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:53:39 +0200
Message-ID: <CACRpkdb8o9UU0W1FJ4=KYiV3CUEUkXbR4CFY7XKdJG2O8sSJFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add xgs-iproc driver
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Richard Laing <Richard.Laing@alliedtelesis.co.nz>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 12:08 AM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
Me:

> > I think this should be a chained interrupt handler (see below how to
> > register it).
> >
> > See e.g. drivers/gpio/gpio-ftgpio010.c for an example:
> > change function prototype, no return value, use
> > chained_irq_enter/exit(irqchip, desc); etc.
> >
>
> I don't think a chained interrupt handler can work. The problem is that
> the parent irq on the SoC is shared between the gpio and uart0 (why
> it's this way with two IP blocks in the same SoC I'll never know). When
> a chained interrupt handler is registered I lose the serial interrupts.
> Please correct me if there is some way to make the chained handlers
> deal with sharing interrupts.

Aha I see. Look at:
drivers/gpio/gpio-mt7621.c

And how that driver sets the parent handler to NULL in order
to still exploit the core helpers.

I will refactor this to some more elegant API at some point when
I get there, for now follow the example of mt7621.

Yours,
Linus Walleij
