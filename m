Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB6C395609
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 09:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhEaH1D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 03:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhEaH1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 03:27:01 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23203C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 00:25:21 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id q21so11680484ybg.8
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7BHnZIGW8dlfXz29SYi4Txt2W/u/uTvUIzT8Fl03vi4=;
        b=qg7s9p4d8oAYIvK8vQlIe5pB3OADZbEcHuASyXCVSwoyOsOZXuYOhMbrAD/CpWl5dL
         ctl2bynl4Ns8RgSs9FU2OK61z+lOrI1rl55ZcwmZDg0pXhqU2jaCjGskZ1Yn2+60ctP4
         ULF+xM0ZzJuOYLjZJYoYba7igcY1FVaFpsPpd5Xel/+TILWj0UvT5uJT9aSEjSyE2BMg
         A2m/+oZVPPLtCBPWOWhIIfZIe7643jFe4i6oll+DnwVZ10uACOv03JNG2m3feYyk545F
         67f/MNR+fQDCQuR5m9QgWihJokEZ4HatboLAEy7cfu2mq19iLQxdO43wttertsVBFdYI
         KuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7BHnZIGW8dlfXz29SYi4Txt2W/u/uTvUIzT8Fl03vi4=;
        b=o+DUusXjw7ZnO3/KB630wIsRU/1DD1u200ugIizCHeMwMmHGFw4g7qiryDnbOeunw7
         J2HiR8BI4WLZB06/cj7N/F9+G+nTukGaR/XZqOKin9/dJI0Tb4T5RYe1pMWoYK9bDLig
         9IBVvA5K9A947g858fvEKSEJgCciKconXT1R5O7M70EhbI+BSD6R/gLXZ4n0ogT2cTj9
         g2jAXYOiX3mQo9NffjAuFkAaP793jjWD7o0uLqUrAykYzbteZruZSh/ijEj/fs2L4s09
         LCl7lUSFdCwWe71NJ1v8ZdABfrQObODCBxKj5sbcQr7nL4KG9QI5hNevYIsU5QbY1rWn
         Nvkg==
X-Gm-Message-State: AOAM531BlUWYrgAZLsHtXqrhtTPVlThLvmkcWtYTRZprPXSto1AjTt3L
        JIshSpKSI3N0gqmqftkU/bfonSrD+WvjQOnbeElIb9yNuQQ=
X-Google-Smtp-Source: ABdhPJwgpwJ30Eu6qeDlGXWgZ0BQupK700HoL7AwsmZ6px0iYtASUH8pCuuNNu8HM+R4kX2wy0xooczc3cbX8G+l2e0=
X-Received: by 2002:a05:6902:1026:: with SMTP id x6mr27757748ybt.23.1622445920359;
 Mon, 31 May 2021 00:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621809029.git.sander@svanheule.net> <be5ffefa007ee4ebd7d4cec88f5f2fb7cd5b689e.1621809029.git.sander@svanheule.net>
In-Reply-To: <be5ffefa007ee4ebd7d4cec88f5f2fb7cd5b689e.1621809029.git.sander@svanheule.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 31 May 2021 09:25:09 +0200
Message-ID: <CAMpxmJX8gw_A36YAg4hTx3bT4-7NGk_KCoEHrKfeVXnJ-01Vsw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] gpio: regmap: Add quirk for output data register
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 12:34 AM Sander Vanheule <sander@svanheule.net> wrote:
>
> GPIO chips may not support setting the output value when a pin is
> configured as an input, although the current implementation assumes this
> is always possible.
>
> Add support for setting pin direction before value. The order defaults
> to setting the value first, but this can be reversed by setting the
> GPIO_REGMAP_QUIRK_SET_DIRECTION_FIRST flag in regmap_config.quirks.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
