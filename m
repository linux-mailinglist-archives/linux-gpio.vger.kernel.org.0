Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D625B3799DE
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 00:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbhEJWR5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 18:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbhEJWRy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 18:17:54 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D99C061760
        for <linux-gpio@vger.kernel.org>; Mon, 10 May 2021 15:16:48 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id y26so20524061eds.4
        for <linux-gpio@vger.kernel.org>; Mon, 10 May 2021 15:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FT7OOp2mNRaZwmV8uqw34o87uK18modrlSvUxsdB2g=;
        b=jqGgixAXgAqIPbBvpRxTE0B2SlH4qGvYnHvbeYPN/kRHlQqGSBBfX9yn9bUGfWN+56
         S/LHcpb/NV3RIWvKptaEXETeRju5nZ+JbogaZSpdLtuTeB1MBBVRpS9h3vCTJTa6nmRh
         nvc6HG6kyCWF/iy3yLWMKDlj4YApgcfb3J9G57lERFSZmnVc47Fe4ryl0jdviATmnZyA
         n2i9hZT6RAdVI4AdBTL78dHKc1keFH1nlmmi+1VI8twSvVclUKLG2sulUIekeiHB4B3M
         kJFVwHydwel10Ggy4sWK7qAvmnKtgh5wQgEJwnnANm4dOzPoUw6QHoWlJqHzyoobIZ4n
         nwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FT7OOp2mNRaZwmV8uqw34o87uK18modrlSvUxsdB2g=;
        b=gbwcUqqw5A7DWgl8sxF3PJg7IxsnHwAfjXLAAUg9ZuuIc2PG6stS1P4xwIblZgWIIo
         2wQc49wNJA7V2hJNlTGOWn6uzFiALn1FWLVbNPSJBW43zbw755ENgZajLhOZhf8Aze9S
         gkdl9HIFmPue26CxmT7P39Q+Y6xyRLeVv1WMC1UixRKqGCmsI8uQGMMNbYcA0RwrDTBk
         6msrOBMYSwEYKrJ31bvvjXg738744F0hsMzZKWmlZPR/EkWbiF5mFWaIfEFflrZD3K2j
         tpr/sGu3U3CW2yYcM7TU7/4TNxx8EHitqE4Cx481oFfmVTKCf4d45om+E+EwaJ346oJ5
         2UPg==
X-Gm-Message-State: AOAM530KgXJJ07IMP/TlqZoam7gXAGiEdX++/Z0lWBaiG5VMxNXwUKj7
        giWK6cjgcdklIrrng2Unt67Yo4Miolc7xw7pQPNBqQ==
X-Google-Smtp-Source: ABdhPJwPdqIKi2LpjqLfCEP5A3HFu4dYZ0gssJOP1M+PS8nuRTfDoMDWXLhxTA28S0a/8WBh01bU0OskwUCj7+oV06k=
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr32256185edt.17.1620685007258;
 Mon, 10 May 2021 15:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210510063602.505829-1-jay.xu@rock-chips.com>
In-Reply-To: <20210510063602.505829-1-jay.xu@rock-chips.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 10 May 2021 19:16:36 -0300
Message-ID: <CAAEAJfALROYg5awL88Uux0yXyMxBthbFjRgJCyhvu4hWioSO2w@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] gpio-rockchip driver
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

Thanks a lot for the patch, and for pushing this work forward.

On Mon, 10 May 2021 at 03:36, Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> Separate gpio driver from pinctrl driver, and support v2 controller.
>

Usually, we expect to see a changelog here, with some information
about the changes from in v2, v3, etc. Also, note that only the cover
letter says "v4", and the individual patches are missing that. You can
use git-format-patch --subject-prefix="PATCH v4", and then all the patches
will get the same prefix.

However, the last patchset I can find in lore.kernel.org (or my
mailbox) is a v2:

https://lore.kernel.org/linux-gpio/20210411133030.1663936-1-pgwipeout@gmail.com/

.. which was sent by Peter Geis (so you should have Cced him).

These are just some friendly tips on the submission process,
for you to keep in mind,  you don't really need to resend the
series or do anything else.

Also, I added Bartosz the GPIO maintainer in Cc.

Thanks!
Ezequiel

> Jianqun Xu (7):
>   pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
>   pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
>   gpio: separate gpio driver from pinctrl-rockchip driver
>   gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
>   gpio/rockchip: support next version gpio controller
>   gpio/rockchip: always enable clock for gpio controller
>   gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
>
>  drivers/gpio/Kconfig               |   8 +
>  drivers/gpio/Makefile              |   1 +
>  drivers/gpio/gpio-rockchip.c       | 758 ++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.c | 910 +----------------------------
>  drivers/pinctrl/pinctrl-rockchip.h | 287 +++++++++
>  5 files changed, 1073 insertions(+), 891 deletions(-)
>  create mode 100644 drivers/gpio/gpio-rockchip.c
>  create mode 100644 drivers/pinctrl/pinctrl-rockchip.h
>
> --
> v5:
>  - change to devel branch
>
> 2.25.1
>
>
>
