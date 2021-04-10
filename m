Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE42135B06E
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 22:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbhDJUmJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 16:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhDJUmI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 16:42:08 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1560EC06138B
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 13:41:53 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id n2so13931903ejy.7
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nc2WoEZ867pFS9UBGyvCGcCs3GLb9Qat+6rGtgO/EJs=;
        b=zXf0XwuYw4JA8dGZTe41IfmDLX5LEHUSm1PIdQQ6i/x5umWjt/r0m3PTArTwRC9mjr
         wGd2yUPECVqpsEC96V13e8W67a6Ba7O2U5BWeKz/8V1AD2mWu/slYbXiGQi9jXQPld1p
         QIRdvTd2INxGTkVapWEfnm+rYRwciuOCxmvPWcTCURByQTdVCdlIsGbXnWyb9xv3mYzF
         ht+obgXg+/JGvAiCFZKyTIeh/h2JHk8etLWsa7EgRgZQ9TD0TpUgt2tnsckzbm5IcyFC
         egz5bd9gOS3KV/2A7frYiKV2g+aF3vaHsbY4WF9exLFERFzWUJJkXfqEJp0M6b/ct/Lr
         s9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nc2WoEZ867pFS9UBGyvCGcCs3GLb9Qat+6rGtgO/EJs=;
        b=Q6w8pR7cB5DtYgjhb9xB/+bEgt9Dr9YuIIRBW2LVH8Vr0wawtO7QZCObw54O+zRCGW
         8/sDK3VH0wFIynKofQeLUKpP9zOqI1ZugSlO83yfZPN7an8sRzXQA1ZIZ5DYpcTTx9+A
         OQrSCsI0tj6A0Yi/VG+ZzWZEJrGiXfnzS/BqBqsNT4RxWjxeINOVqWsZzwPEEbsNbfDi
         zGbtVSDYfofP5busLL3D+tlxsF0d+/Kq9LbfFAaJE8j1B4lKBZS/gFH8jK45ln8sPxa8
         0oh7nj4gTYd2m29zFP1yGo1VwKodkBl1Cb6UgykwzuZK093OZw1ElM9VNMj15YlOXot6
         u3Tw==
X-Gm-Message-State: AOAM530Vo2I5zc2zGt6J8KPIAaA5KmT4zQfHWhR2/7/5VCZ58ZG8KtlK
        iOvCaHj5OH8uiL59Z9iqq7BSzUsxEh9uF7izsNNyOg==
X-Google-Smtp-Source: ABdhPJyknr0S6NEQzzdgkSlFe2R7QvSEKJJKLgNPoAg+FwK/qjYc8eJoyhVs2NojJc8XsUxhhyvaAQSwNMhSptsuQ5E=
X-Received: by 2002:a17:906:c099:: with SMTP id f25mr21533781ejz.141.1618087311707;
 Sat, 10 Apr 2021 13:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210324064541.949630-1-jay.xu@rock-chips.com>
In-Reply-To: <20210324064541.949630-1-jay.xu@rock-chips.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 10 Apr 2021 17:41:40 -0300
Message-ID: <CAAEAJfA9jXnUv_Y1NC29RABNJ=V2y6rCaYEF1SO1v5gWvow8eQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/7] gpio-rockchip driver
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     huangtao@rock-chips.com, kever.yang@rock-chips.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

I tried applying this on top of "pinctrl: rockchip: add support for rk3568",
but I got some conflicts. If you could add some information about
how patches should be applied to the cover letter, that'd be really helpful :-)

Also, I've noticed several of these GPIOs patches, is this the most up to date?
You can add some information about superseeding patches
in the cover letter as well.

Thanks,
Ezequiel


On Wed, 24 Mar 2021 at 03:46, Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> Separate gpio driver from pinctrl driver, and support v2 controller.
>
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
>  drivers/pinctrl/pinctrl-rockchip.c | 909 +----------------------------
>  drivers/pinctrl/pinctrl-rockchip.h | 286 +++++++++
>  5 files changed, 1072 insertions(+), 890 deletions(-)
>  create mode 100644 drivers/gpio/gpio-rockchip.c
>  create mode 100644 drivers/pinctrl/pinctrl-rockchip.h
>
> --
> 2.25.1
>
>
>
