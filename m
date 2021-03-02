Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D5032BAEB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbhCCMHi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379137AbhCBWkC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 17:40:02 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C059C06178A
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 14:39:22 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id u4so33916709lfs.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 14:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3Nrqj6kb9Z2QHezcr0m3iuedQ5qVAoBvg4Binpr+01U=;
        b=lIeUHVCOe3jgTgM3KXOxLoR8pvgx/P5vnZQlcH7Az0xthmmx4xUAMEwoxqn5l9jIbm
         Fy/n07bOcE9TGZVwB87uCc4zW6lufilrfdHYdtsfRjrVsGx7kqhkCZoXLKUqC0flClsa
         y2P7Kq+x8Z8V01f/Nvd7WqIl/cGyCvOLJoqGdlUqorjngU1GteUOHAw4PgJP7I3QUU59
         73KRyMyx/JQI3+RN4dwRF4DBi4AKzlRibvY0af6JNyB/I6IR24Lm8OYLRAxbZj3Z80qG
         Cxj2frUAbCw9cvhCARCGjnhAoLNoOQWXavR438bafpETmc5atSrPb3Mod4Vc++XkrY86
         96Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3Nrqj6kb9Z2QHezcr0m3iuedQ5qVAoBvg4Binpr+01U=;
        b=AQy5jRN0Xrg77p73A01YixCaowwDg/dMH49SNicMxItIV+8+vYyQELvZ7gkaTxa1ju
         NyOim78o7G6TwnYtm/elVG905+K9mnHlEwmzK4zmonK1w7jR719yiELw4gF0NpIyHfyY
         hvbOSu+tPhuPSi+b00TsbRoXTKR2Az4eSCRR78fTzE0N04HuJeTa99YOqWe1F0swao9h
         msDaynYz6ZZN1crBgDYQwkIC4h9y+V4neVXrVEK23V0uU7G8ZSPQoQj/X/zKWpEPfKDk
         zPdJVNoBypMOpQflKkQzjowxLa62+YbJKrtewwsEnOEAE/Po6EgPxcl/4Tj8uki9Yrhr
         ju4g==
X-Gm-Message-State: AOAM532g+yCN/L7Wc0M5V9ERihfqtlJVKgDtu/8we3FSjZAVX0lnlTpX
        940c4BF4iUMI3fZm+1c0/fxySfUdRatAADdSQ4GYsQ==
X-Google-Smtp-Source: ABdhPJz+ibiVyy0BEqJW8vekeQ3tIxYpuN/bTHg2ACNjPud1wTTfSuHoVn/aVPdzGUpOGtrxrn3TLk2Z53YMNKc/4dE=
X-Received: by 2002:a05:6512:547:: with SMTP id h7mr13821445lfl.529.1614724760474;
 Tue, 02 Mar 2021 14:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20210302180601.12082-1-noltari@gmail.com> <b4a344af55ad238a554c56e31b1b87ed@walle.cc>
 <4af4b519-84eb-3cb4-bb0e-9c5ac6204348@gmail.com>
In-Reply-To: <4af4b519-84eb-3cb4-bb0e-9c5ac6204348@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 23:39:09 +0100
Message-ID: <CACRpkdbHV+HCfTw__2u_EF1SbmG_0Ce-6VMs7wbAe+HtJXYM_A@mail.gmail.com>
Subject: Re: [PATCH] gpio: regmap: move struct gpio_regmap definition
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 7:14 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:

> I'm trying to add support for bcm63xx pin controllers, and Linus
> suggested that I could use gpio regmap instead of adding duplicated code.
> However, I need to access gpio_chip inside gpio_regmap to call
> pinctrl_add_gpio_range() with gpio_chip.base.

Can't you just put the ranges in the device tree using the standard
property gpio-ranges?

These will be added automatically after the chip is added.

It is documented in
Documentation/devicetree/bindings/gpio/gpio.txt
a bit down the file.

The code is in of_gpiochip_add_pin_range() in gpiolib-of.c
called from of_gpiochip_add() which is always called
when gpiochip_add_data_with_key(), the main gpiochip
registering function is called.

This would just do the work for you with no effort in the driver.

It is a bit counterintuitive that this can be done in the device
tree but the hierarchical IRQs cannot do the same clever
manouver to map IRQs, sorry.

Yours,
Linus Walleij
