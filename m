Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B30544AC97
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242782AbhKIL3W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242267AbhKIL3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:29:20 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44469C061766
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:26:35 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id o26-20020a4abe9a000000b002b74bffdef0so6851041oop.12
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gCm3nSR397zk7aSEEkQCw98vZ58y73OpbN0H7g0wwJM=;
        b=hS/rr3fGh5laNnuUENCdGVA75ssygWbqppxs2QMMUMhAB3kaGI9LQa+dlNsNsutGjS
         q+56DQRYlQsibzvJuJnQ5w/SDbeU/j/DuklCJWYQhBYfyP82IJRcUdcycrJ+dNgtg3Dz
         mAL3uKtBf9iM2NUmdhCC58DqFlbKBghnalIOXfNr5aObky1aQ6/O6QvIjO8DZCoP/7VK
         7a3BjiYmqznA7f5d1mATCZU/hJ3HEZ7xFv0/0+K/f0FSXrgDIexQUxJo62EzKT9FPyTD
         bYMylpOD4soTbGyONk6HtVc+zbvcVUjAHnTZn1C5tC+WN5rKWcfbvk6MaLakpKaiWZSV
         IGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gCm3nSR397zk7aSEEkQCw98vZ58y73OpbN0H7g0wwJM=;
        b=VKyaKCKRbXdR88nGasKQgS9fXRTxq5M1NCw/UMy1fQR3KlJu2zH5pXMsVUi2XwRjj0
         FAB8rBZcNc3EuSxbmxLLfXqEfgSaZh7emRIJSM1QdcGidyJAbb52V/jAvqebKPm/djrd
         CU+SvYTLo8RltHDJNWeSYZbp6HSL6zmK3LPSlnvkklBKd6PI/7ngQc+FT6VlFlrqmAwu
         tlsXu9h3l9Vn30M5RVqYYt97rKJzZ1rhEPA9FhhV4bX3YzhlQMuVxnmrc9ScvVnkfpyU
         7HRnH2prJ1SsNt4ePrnqLBQsERyG9FSVzvZmE80Lg4e/PqxyMjt6kgnzlhjX06RISPH2
         BuYA==
X-Gm-Message-State: AOAM530t5LYSbK62qcgkC1YzfPphps5lJu+kYOa/UHABoWIPWo13IC5q
        a0sfomm1Vxr8SzSbh0duat//wz/Mo8+E9zmjmjcT/A==
X-Google-Smtp-Source: ABdhPJwkWMItcy6dYAzsdz0Ss+mlymO7DJvCLhisfx81i7Po0UJcwJpYb3dKmZpYVOf8lEFZGtR62J76EpX/RLqjp68=
X-Received: by 2002:a4a:5b85:: with SMTP id g127mr3353848oob.86.1636457194390;
 Tue, 09 Nov 2021 03:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20211104154135.2119-1-rdunlap@infradead.org>
In-Reply-To: <20211104154135.2119-1-rdunlap@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:26:21 +0100
Message-ID: <CACRpkdY8Otp8GVXWTCh5r9gs4e7fc9UuVMvW_zxU7ADbMmSpwg@mail.gmail.com>
Subject: Re: [PATCH] gpio/rockchip: fix Kconfig to prevent build errors
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 4, 2021 at 4:41 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> GPIO_ROCKCHIP needs to enable GENERIC_IRQ_CHIP to prevent build errors.
>
> Eliminates these build errors:
> ld: drivers/gpio/gpio-rockchip.o: in function `rockchip_irq_disable':
> gpio-rockchip.c:(.text+0x6c9): undefined reference to `irq_gc_mask_set_bit'
> ld: drivers/gpio/gpio-rockchip.o: in function `rockchip_irq_enable':
> gpio-rockchip.c:(.text+0x709): undefined reference to `irq_gc_mask_clr_bit'
> ld: drivers/gpio/gpio-rockchip.o: in function `rockchip_gpio_probe':
> gpio-rockchip.c:(.text+0xe25): undefined reference to `irq_generic_chip_ops'
> ld: gpio-rockchip.c:(.text+0xe7e): undefined reference to `__irq_alloc_domain_generic_chips'
> ld: gpio-rockchip.c:(.text+0xeb9): undefined reference to `irq_get_domain_generic_chip'
> ld: gpio-rockchip.c:(.text+0xf04): undefined reference to `irq_gc_ack_set_bit'
> ld: gpio-rockchip.c:(.text+0xf0e): undefined reference to `irq_gc_mask_set_bit'
> ld: gpio-rockchip.c:(.text+0xf18): undefined reference to `irq_gc_mask_clr_bit'
> ld: gpio-rockchip.c:(.text+0xf36): undefined reference to `irq_gc_set_wake'
>
> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jianqun Xu <jay.xu@rock-chips.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
