Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4331D4188FD
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Sep 2021 15:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbhIZNMY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Sep 2021 09:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbhIZNMY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Sep 2021 09:12:24 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7F1C061570
        for <linux-gpio@vger.kernel.org>; Sun, 26 Sep 2021 06:10:47 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y26so24252410lfa.11
        for <linux-gpio@vger.kernel.org>; Sun, 26 Sep 2021 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YCFc53tN6jriGvcOUFbRABthFZXdGp2NMn/8Ve1laqQ=;
        b=ecvcn2htqBqztqNWnpFYgYc6ETDLn+ocw4Eh0jh1Q/cvy3fjp8KNsCYLH9uApxXHm9
         uo6+nbnmelrAoE7FmMHN28PCS8fv5W2RbEPbkk1CgWOkSmifrkGKHo4hrVbDAuvC0pWh
         bXxqIfYv4HlKyaOycfiadiJHnOxzt1K/bS++7KDSgOlAL7ifGhAwsUZovpCuNpxArhyD
         19yiITS4jt3LEvg15Bm9pRrwgQLnZIFH3dW4QANVRwDABDgXUoU8IuinJftCcySEUhaG
         f0WoFydspHeZu45TJgD9dDvV3BDK++PGKg3rFq9UoLMbeFm0kRDGfP+D6DQkduDx1PIR
         /bBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YCFc53tN6jriGvcOUFbRABthFZXdGp2NMn/8Ve1laqQ=;
        b=rK8VgnuzrZlyNGwkgPCHDUrn7P+V8zVRkWKtK09PcfA8GFQ0wdqv/Vf04U/nYUpo4G
         Vl7OYRo2hEVi+0decYJOYjwi7s4CQupQG1D8gmLjm1PZo7SVZ6wP+9oCifjriC6RVPXl
         6i/wSbhjCTBWbPjpZ89SLJm0mtlH4t2G+LUqRwnuOxcVC0NiwbtWesJhkNPkfjQMkiVg
         0o6WshiARA3rGcrXTuXrZEkUKWFYVrpZfvCsszkpfWyHZ9uLFnj8YEhRQ4mEfi4hrLjV
         di0Nmbw0wzaJUPG24+4laiVMZEk6lYK0xaWmLqzQV/Dr9P1qmORHlfkCtYPumgoYKOu/
         Yb3w==
X-Gm-Message-State: AOAM533qi8ksA8kG4rhUQbRYnQd2w6IHnbPWGo8PleadQ2UTu0QKB4EX
        yf7Oh1wbiYLsd3cM1prYS2RUsm4ZG8A9zkyF3iWCpw==
X-Google-Smtp-Source: ABdhPJyZgbNI4AzGjah5iDJdgrLNpkuvovD7J8SCNujSaEUv5jlcAWtTNye2pRZQHU85+LLOm2arnImEu9QZqjnPDIM=
X-Received: by 2002:a2e:8011:: with SMTP id j17mr7178975ljg.145.1632661846188;
 Sun, 26 Sep 2021 06:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com> <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com> <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com>
In-Reply-To: <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Sep 2021 15:10:34 +0200
Message-ID: <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        nd <nd@arm.com>, Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 26, 2021 at 2:56 PM Sven Peter <sven@svenpeter.dev> wrote:
> On Sun, Sep 26, 2021, at 14:48, Linus Walleij wrote:

> > I think npins should be known from the compatible (we know that
> > this version of the SoC has so and so many pins) and the base
> > should always be 0? It's not like we have several pin controllers
> > of this type in the SoC is it?
>
> I've just checked: Looks like there are four different pin controllers of
> this type with a different number of pins each in Apple's device tree for
> the M1.

So we need to understand this hardware: is this something like
south/north/east/west, so the pins are oriented around the chip?

I would suspect they should then be compatibles:
apple,t8103-pinctrl-north, apple,t8103-pinctrl
apple,t8103-pinctrl-south, apple,t8103-pinctrl
apple,t8103-pinctrl-west, apple,t8103-pinctrl
apple,t8103-pinctrl-east, apple,t8103-pinctrl

going from specific to general signifying that we know which one
we are dealing with and then we know the npins etc.

This also gives a normal grouping of functions associated with
pins and the portion of the SoC, see for
example drivers/pinctrl/intel/pinctrl-broxton.c.

This shows that it might have been a bad idea to define the
pins as opaque, because now that is hiding the fact that
these pins are grouped in four distinct sets.
APPLE_PINMUX(pin, func)

Should rather have been APPLE_PINMUX(cardinal, pin, func)
where cardinal would be 0..3 for north, south, west, east.

This is a bit of guessing actually, but we should definitely
try to make the driver reflect the reality and not over-generalize.
If these four blocks in the SoC are different, they should have
different compatible strings, because they are not, by
definition, compatible.

Yours,
Linus Walleij
