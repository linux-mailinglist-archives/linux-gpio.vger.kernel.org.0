Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DB33D3853
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 12:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhGWJ12 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 05:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhGWJ11 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 05:27:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4549EC061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 03:08:01 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id r26so1205882lfp.5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 03:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q4BU+5tZU5TQrCBXLyqih1hQuK9H2h5ckUqvAJtP9CA=;
        b=ivr+2Uit26tqgc4oSFnrYZbDZ+9/0aaAi8x4QOnA6h2Slje1dHYQTDdjwpZxt71dqZ
         aEqcHflA/2r0jRJOS5O5pHQwyPslqXCfDWPewO6Ze1pUiiiIhLSvGH0A7XZV3Ea/gMT2
         5kkaWM5Jevk6L9xjyoEKKxujLLZysU9Fb5SssxCSLyjg116d2Ubx0+qK4vrZ8mQK3URr
         koCG975hR2Pv3/QTIy3qFvHZivrZZh9pZ/HBZbPGKMhMLOPKosLwg7ZmrEgwAWt2rABZ
         VupYFLtPHkm1wsvZ2TwVno5jp+ePXM6eOasX9VxZ3MekgX8utUAVzL5gV6bOGNGvb7Sw
         fe2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q4BU+5tZU5TQrCBXLyqih1hQuK9H2h5ckUqvAJtP9CA=;
        b=EiqWTXK6jf1g1+EjRnTjTmoWGr38HN8oS2TVdrRXWrSv367+cEMW4oeNkO8o8biKmE
         6iju5CE2OQUHKQAu4v7IUmlX9JEi+2atZHerGw9QBSIZvYJgbalyaHIkS/vMPt/lv9Yn
         HZBRDe04uRDnZuLlZhbzIPTe/NCWt94s60BVL50+WYTDb52WyEIn3uSNVCTiDnnj7Qsw
         jCRqGh190a153OceQ9CqsQPue/A5S3Ajnr36IIZTXtJFnk9Klh7FJQl8go3oLo0EmgEe
         I7hV0tYkMoSrU7BsAOhOVVr/Xt+eknottT3fx4gtp5X62L1VvRgSbUypSIjWESIj7KM3
         8zuw==
X-Gm-Message-State: AOAM530GLx51tnMTay5kq4qblUtAGoBbSQ8DAPY0kdnLQUzqHAvDrb1j
        u4DGjTNcjrP22KfWk1Z3UG9tsIieDRwCa+Zd/uPfBA==
X-Google-Smtp-Source: ABdhPJxjnhIpgDdVp1H8m7VgEBTEDRh+H64JfXuc0U5TeQgKP8c2x8Ymes2lzQ2i3+MLX3pglOdA6mdXSp9A5y45Qz4=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr2458517lfr.465.1627034877891;
 Fri, 23 Jul 2021 03:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210618062449.1067106-1-jay.xu@rock-chips.com>
In-Reply-To: <20210618062449.1067106-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 12:07:46 +0200
Message-ID: <CACRpkdYGyy+tE4_xddJWxWUQpPea0bc5CUTBfp2RtnJfQ-2t_w@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] gpio-rockchip driver
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 18, 2021 at 8:24 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Separate gpio driver from pinctrl driver, and support gpio v2 controller.
>
> Jianqun Xu (8):
>   pinctrl/rockchip: always enable clock for gpio controller
>   pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
>   pinctrl/rockchip: add pinctrl device to gpio bank struct
>   gpio/rockchip: add driver for rockchip gpio
>   gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
>   gpio/rockchip: support next version gpio controller
>   gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
>   pinctrl/rockchip: drop the gpio related codes
>
> Liang Chen (1):
>   dt-bindings: gpio: change items restriction of clock for
>     rockchip,gpio-bank

I have applied the series to an immutable branch in the pinctrl tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-rockchip-split
Then I pulled that into devel.

Bartosz: if you want you can pull this into the GPIO tree as well
(makes it possible to continue work on drivers/gpio/gpio-rockchip.c
and avoids clashes in Kconfig and Makefile)

Yours,
Linus Walleij
