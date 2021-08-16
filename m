Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49003EDDB0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 21:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhHPTOm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 15:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbhHPTOl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 15:14:41 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716DFC061796
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 12:14:09 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id l144so9337423ybl.12
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ddKmBAaL4anw3kgNsyAbpqw4YAHAfR61Ukhu3CXAdpQ=;
        b=T9HdhiT0dXrGmgueqTIb6X9mPePJxHP+j6MIIHkpi0Ns3V30fcgze4d85bGN7i/Vuo
         +MPAKBqrK9UNlCJ88ifAQlz/TIT4mVkuq5CRHNfwiW3nV/JA4gUczTPuoGwMiA9HETvn
         UkJGXMZ3PRAE3NHetz2qssyTebmLD/XqOVG/1nN8DeudnElmNQO3KUiYQ4lX8pi0Zp5d
         tc3HZNUhZyuyxPt/NHWTtCVScOpAR8/0DaN7wD9X2h6uzUvAX25ad2gwed5WHBEO1erQ
         RQQTrrMv4dJy3GOmZX1IfgTFpjj/33GaoVNpso7HCf3Xamo/63CbJW0Kskj5ds2p4cNz
         9BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddKmBAaL4anw3kgNsyAbpqw4YAHAfR61Ukhu3CXAdpQ=;
        b=qM2yUsN9K6TaVIHGOP1XhXCjhMZUZtDG995VFXq9rq5R7vA9H3Kw45nvxXJFvpBLP+
         a947Zh2tSNgNsSDU+cwk0TccoEaq54S5sbnY8U1N5zycjL4bbVOXai067wzhs1LquKW9
         InpOLmIzmpoDdmFEbiklko2hbnxNWboksBK7Tzl9tFmaKo99bz7N/nhcS8XsnoDQcj30
         G2YDH4wywYAxE9RYVfF2yGKEau4vsCvbpwF8p+mMFOcLuLcKbjJv5KnZmQ6C4s23LtKx
         wbYNxf5bXFo6Ot1F5ifEU/sdQQGXHUFTS2cGVt4S7nFaaGDUBgIdNpgcuRjgUSqQsvUl
         EVoQ==
X-Gm-Message-State: AOAM533X9HcdpBM6d1bGFeWBDwpcIswi9EPdLL2y81fksN3nvoqpuUld
        k9STwZ8ljB/p7aEyZntsrA/nggIt4bPGUact/2WrAQ==
X-Google-Smtp-Source: ABdhPJysWBZVCKKJbr6bgcAHayPSYtRM07cY1fPHMS0wTcE5unx6TDl/t07LozWQCgzaBW6Dh5Iiw5yNJwUzKdtfivk=
X-Received: by 2002:a25:d0d4:: with SMTP id h203mr23601519ybg.0.1629141246719;
 Mon, 16 Aug 2021 12:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210816011948.1118959-1-jay.xu@rock-chips.com>
In-Reply-To: <20210816011948.1118959-1-jay.xu@rock-chips.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 16 Aug 2021 21:13:56 +0200
Message-ID: <CAMpxmJWQ1pDoPZHjg1vvZYhPrY+3BZi3Zuv2P7xKYRDW0dyw8Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] gpio-rockchip driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 16, 2021 at 3:19 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> Separate gpio driver from pinctrl driver, and support gpio v2 controller.
>
> Jianqun Xu (9):
>   pinctrl/rockchip: always enable clock for gpio controller
>   pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
>   pinctrl/rockchip: add pinctrl device to gpio bank struct
>   dt-bindings: gpio: change items restriction of clock for
>     rockchip,gpio-bank
>   gpio/rockchip: add driver for rockchip gpio
>   gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
>   gpio/rockchip: support next version gpio controller
>   gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
>   pinctrl/rockchip: drop the gpio related codes
>
>  .../bindings/gpio/rockchip,gpio-bank.yaml     |   5 +-
>  drivers/gpio/Kconfig                          |   8 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rockchip.c                  | 771 +++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.c            | 909 +-----------------
>  drivers/pinctrl/pinctrl-rockchip.h            | 287 ++++++
>  6 files changed, 1089 insertions(+), 892 deletions(-)
>  create mode 100644 drivers/gpio/gpio-rockchip.c
>  create mode 100644 drivers/pinctrl/pinctrl-rockchip.h
>
> --
> v8:
>  - fix rockchip,gpio-bank.yaml about clocks and clock-names
>  - fix commit author of rockchip,gpio-bank.yaml patch to me
>
> v7:
>  - include <linux/gpio/driver.h> instead of <linux/gpio.h>
>  - use gpio align id instead of gpio-name
>
> v6:
>  - new gpio-driver first and then drop gpio from pinctrl
>  - reorder patches
>  - cherry-pick gpio dt-binding from chenliang
>
> v5:
>  - change to devel branch
>
> 2.25.1
>
>
>

Linus,

are you going to take the entire series through the pinctrl tree or
should we split the patches?

Bart
