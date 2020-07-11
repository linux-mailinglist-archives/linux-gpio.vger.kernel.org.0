Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C6E21C654
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 23:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgGKVKC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 17:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgGKVKC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2020 17:10:02 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1454C08C5DE
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:10:01 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id o4so5161415lfi.7
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QOWgRRxR4UWenTLYws4CoXraeapBalWta2FCOM+uc9k=;
        b=sHHa8+6nIlJJQuvFQMaZWOUBweW42w+3iYH98jk4CNIe3q1h+bSrZhVqyAbwXh4v6K
         v/NcpV0QtlOQktytKw1wi8Fs2HtHByvIiHAwIFxHz5cQiG/HSL4cjZanmC9csp0QUTWX
         yIhN1baYwRytN3ha2eS8FZtwsVtrvYnO+112s9svp5ZkE9shCqN1k0MPn6/2eMZgtcS9
         2Jt0m4Xa680WGnXG5JL4xJk6W3MdpNVjb5IDwm8SgKHyQpVPxvoKGWud+l1kwKlVTvKr
         2I1hov+fTMzeNr8XLyEWHJIxNiTcuDwhzG5q2FJd3LCLFCN6rRyG8t0hThIlXYuCZ0cY
         3cAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOWgRRxR4UWenTLYws4CoXraeapBalWta2FCOM+uc9k=;
        b=F9m0FqOkutKQYbLX/fIutTytoqAHOvolXPn4R+XxHIwxJ1wOHfmyGei3pLgHAvUL9l
         Ds2Qwazy7OdRJ9CZuc5EGyt1uOYqffKe4BKiqJU2HbmywR3anJxgkxxelgUHH2JZKhiP
         Wv/j7mVbK1OAqo9wiqdQmmBQ5Vnaa3lC8J+H7RtaNeEebdOBG5GgyaRLOdNHziFxCdLD
         8hE3jl/Mz6knsn+xW0p/Ux56+47z4riFBZIDGfT0OtJ6bNwFLOERSD4EJ1PrZU7ZWjt7
         F7UUIs4YiaY7hQRpBHnclkqYJ+bzeVoyBLVnQSSskTwEV/M7IfLO8coCJvFT8NNgcfXf
         Xgag==
X-Gm-Message-State: AOAM5300CIud7nkJXY2on1UEU+OhQErMR0fV4bfZlRGMH5fVJ1564ERH
        7KhlBhMco7aZoqh9NXOWfo2gYOkpct5HfR0TxGmh4g==
X-Google-Smtp-Source: ABdhPJxArz9xVZdtoBR1nRK2V/Mwb4q0ExFsmBO6kekDQ2LETFFvaz78PtE0fDSpM7+xYZACgqAmHP1c4lDjcJAd+mc=
X-Received: by 2002:ac2:47ed:: with SMTP id b13mr47703923lfp.21.1594501800249;
 Sat, 11 Jul 2020 14:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200703011830.15655-1-mark.tomlinson@alliedtelesis.co.nz>
In-Reply-To: <20200703011830.15655-1-mark.tomlinson@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Jul 2020 23:09:49 +0200
Message-ID: <CACRpkdZ_YYhSn1FpxOGX5V9HrcMwQ553RWAbtDq56KPv8FCEzg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: nsp: Set irq handler based on trig type
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc:     Ray Jui <ray.jui@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 3, 2020 at 3:18 AM Mark Tomlinson
<mark.tomlinson@alliedtelesis.co.nz> wrote:

> Rather than always using handle_simple_irq() as the gpio_irq_chip
> handler, set a more appropriate handler based on the IRQ trigger type
> requested. This is important for level triggered interrupts which need
> to be masked during handling. Also, fix the interrupt acknowledge so
> that it clears only one interrupt instead of all interrupts which are
> currently active. Finally there is no need to clear the interrupt during
> the interrupt handler, since the edge-triggered handler will do that for
> us.
>
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - Don't perform unnecessary acks.

Patch applied.

Yours,
Linus Walleij
