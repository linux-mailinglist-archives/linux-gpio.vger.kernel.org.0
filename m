Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F15E21658FC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 09:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgBTISF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 03:18:05 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45118 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgBTISE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 03:18:04 -0500
Received: by mail-lf1-f65.google.com with SMTP id z5so2319942lfd.12
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 00:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bfzGIR3YDiF6H+a6zuyFtqFo96c/AxsGVVSXFrBtaro=;
        b=MAROxxGOlLyeUqubF+UzqU7IGScwIIckR/engdSUpg/yhzEcnTd6TRsz4ccQypWssp
         LEfIOKYp5tifBf7tyUVNPtpff9QDzVaJ0aktej1Tsngo7E1JQ/6SIHabsh+XxwcwBIgY
         pAiUaTIwclmpgYtKpBd8zYoKwO22rmqOT/IA8pER8YiQEgs5rUJq8wtOrs9ufZJsnIrH
         1hMHsm4aWnFNhNQpyQ7jw9MBMK7ra8vVebDyUxCBQeigRtet9NwAI3FxNF2fIVwY8g5/
         Etn+ssi5+onBUy68zTSsWMb6ULREGRKn8CGU87a0how/RKua0mnOk0w+ApaAP5B7Of56
         O9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bfzGIR3YDiF6H+a6zuyFtqFo96c/AxsGVVSXFrBtaro=;
        b=tNVcN7yWQmAOoQej8UlMgmLyyIail9j9pNw2vSK1Y6YOnGlGLmJhfeY3sEE8h2gS6+
         obKRJMmDfxu77pzQkURRdLRwywY3ddJT40Szboutm8u58/yGOFY4K4EYzf2UW2fBdaO0
         WsFeOuSaS2ymsfC1ZsJufsFnz0+CVw8kEQuUJ1TckcGIDgmidH1mLvmWmy2OWXg3c1ZI
         XAcUEiKL2HvPyHxQuHO/MdzK951muGK8YadbSePdlGXqeJZ4jO/nc2jT28wBEyDy5YVK
         RljXvw1pWlbFjGLG8DYwG7vK49NJVRmvCrGdSythZqdLKnELAlsvgvu78h/fogHuqUFk
         B+rw==
X-Gm-Message-State: APjAAAU/VA1M9Y8SBTOs1xaIFOKF3Ra06+T1RBtxRqYIvfFXtiF21FJ4
        1L/Wor+yaOFPLegU4o/6svJMT2L895cSeNCx3wG4d6MTJEdcww==
X-Google-Smtp-Source: APXvYqxjTpOkXxHXkogdm1rBBTRQ/jNvpMrr9lmcSMi5VuYw9rJcTzPLj16dSa445cLIR6/04e9vqkvnuwR87v+M7Js=
X-Received: by 2002:ac2:44a5:: with SMTP id c5mr4263584lfm.4.1582186682486;
 Thu, 20 Feb 2020 00:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20200206173247.GX25745@shell.armlinux.org.uk>
In-Reply-To: <20200206173247.GX25745@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Feb 2020 09:17:51 +0100
Message-ID: <CACRpkdbzjBnaeXJg3XvZ6G2FdtQQa0u7MPy9bgN-uo-F1vSpbQ@mail.gmail.com>
Subject: Re: [REGRESSION] gpio hogging fails with pinctrl gpio drivers
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 6, 2020 at 6:33 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:

> It seems that sometime between 4.20 and 5.5, something has broken the
> ability to specify gpio-hogs in DT for GPIOs that are written around
> pinctrl drivers.
(explanation that makes perfect sense)
> Consequently, adding a gpio-hog to DT for this driver results in the
> driver endlessly returning -EPROBE_DEFER.

I suspect this is sx150x-specific and suspect these two commits:

1a1d39e1b8dd pinctrl: sx150x: Register pinctrl before adding the gpiochip
b930151e5b55 pinctrl: sx150x: Add a static gpio/pinctrl pin range mapping

I suppose people weren't using hogs very much with the sx150x and
it didn't turn up in testing so far.

I don't think for example pinctrl-stmfx.c has this problem, as it registers
the pin ranges from the device tree as part of the core code.
But other drivers calling gpiochip_add_pin_range() may be experiencing
this.

Peter/Andrey, do you have some idea? Have you tested this usecase (hogs)
with the sx150x?

Yours,
Linus Walleij
