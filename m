Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA2539C356
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 00:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhFDWNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 18:13:21 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:42917 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbhFDWNQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 18:13:16 -0400
Received: by mail-lf1-f47.google.com with SMTP id a2so16212694lfc.9
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jun 2021 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YMx9d/KwaGXDIgZMt2DPtgDzNG9hC9FHDEasqs2eylw=;
        b=RnWNqREAbgLaek095trmxYAB2A32y6JnXwwCOEqCb69fAeTbDadtF8FlgfjScSVIAl
         VeeTs+PRgOCjPxTkkncXbvDpFdnykroIPzWS3ZkrcA5V09EUCUjR2N8eDmWGi1aSTldj
         sWGtkpZHNt+L8zQ1rec0frnXufrW6BYnmCPrTRRO9+m7pZcPtC+Qyxnn28G7ujhDYXAE
         byQy4rVnCqQe1KCfjRh86UTCzrbOPPbCEQHJjzcVwYU80D4Pmn7eHSaFdFucq0thDew9
         mwIt+3FVhKJjw3+1RBYgxxjHifqmUr8neCsMcwOWZH12A84wexGKmonNSgDqwYVy2GKf
         ERww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMx9d/KwaGXDIgZMt2DPtgDzNG9hC9FHDEasqs2eylw=;
        b=WS1VUjqDfYBvp6i9+f5DkDQF29LhrNkQEgTfwgTrtClUS1RJeGG1nt6v+CVeEl17GL
         GkBPcCwfXhyjp/bKcEkAdM2zTLbZAZ4aBugcTFKjxmrFMzlg+NalMprDPoFEWbZtiLEx
         rxMU4TZLPwW/hmVoqtPa2xJHCRIFfRaZaRIbAZwk9i9lqcdxfFoXvpknE91LD3220Q96
         Xmr6DcmWahGZdQoExM8iB8hrauqMklmaN5PEIAEJrJ3IQaI2i7ck4gAO11RRuW//7UQL
         YX2v3jVmnm1FQpllDaB/tiMObhXqwlvQM4sO3iLmlmZ2VkKw84Twh70vUXhztnPpQrRg
         b7bg==
X-Gm-Message-State: AOAM533kywUkYU3ILG/jEXL3xUoUB6wnRvqX9O/JVtcFNQXi25r5Smlq
        8kLEnjw8ixM6+DwkgPTBsAUKOjNg5OWuNZpeoW0ngnJTmQY=
X-Google-Smtp-Source: ABdhPJx69CXrOaH6IjDUNE/NOqbho2qNWe/t0l5SmoR6GFbzHw8h1llh1Vq5RtbcLkcaqfSzMyNyoSf5YZK3GJZYikI=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr4065245lfn.465.1622844614933;
 Fri, 04 Jun 2021 15:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622713678.git.sander@svanheule.net> <5d184778a6562e24abfa6e5dd2f7dbde4fede3fe.1622713678.git.sander@svanheule.net>
In-Reply-To: <5d184778a6562e24abfa6e5dd2f7dbde4fede3fe.1622713678.git.sander@svanheule.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 00:10:03 +0200
Message-ID: <CACRpkdYzhC=Lt5CKpbZNK81z=0CRp2CknMqp=zk8cHVfo0wm0g@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: Add RTL8231 pin control and GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Lunn <andrew@lunn.ch>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 3, 2021 at 12:01 PM Sander Vanheule <sander@svanheule.net> wrote:

> This driver implements the GPIO and pin muxing features provided by the
> RTL8231. The device should be instantiated as an MFD child, where the
> parent device has already configured the regmap used for register
> access.
>
> Debouncing is only available for the six highest GPIOs, and must be
> emulated when other pins are used for (button) inputs. Although
> described in the bindings, drive strength selection is currently not
> implemented.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

Wow this looks really good. Thanks for going the extra mile
and fix this. Special thanks to Andy for the thorough review.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
