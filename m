Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B35E38C6B4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 14:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhEUMny (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 08:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhEUMnv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 08:43:51 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BADC061574
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 05:42:27 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id g38so27243314ybi.12
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 05:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/Oecpa/9B6poHryXo2Ss657/x8VcGaDiINXjZStR3M=;
        b=p2Xeg/ick8nPMzaDEjBiN7SZ9HRJosstDsZqnMbRdTciey3uuzrocdoX0UbSDNKRQA
         YASWhp3l7LHkuGXff4QKovu20I8CdYFZLXFTpC9dj1oHQaQKX/oaBnwAlnaA/U4aDF35
         XAqCbxiTAY79mUF3nQG4TD3tlGVgsAltZSVhbUNxJU83BrjcG1glP6VUdrQ1gRo91L/r
         FP4H0qUvKZ7+3XLuGAdgzMB3LZJdj1WdcwyXf9bC86Iyrg3U+2pL3PYQyB4FugAM/Zi6
         5JtUdrHiGjTFN7xTY8xd/JhzCAt5B4RqN0kWjP1TNbiYlCrqFBu5DTxrMsscVLzfG5tu
         eYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/Oecpa/9B6poHryXo2Ss657/x8VcGaDiINXjZStR3M=;
        b=HnB3/r6wAG0TIDKxHkIiRqrAbzLrehps84umIhidVX5eZAb1dT+C3JxFEr0mUGbN/2
         sdVReajjNqeB+4wZqCFcwCsV2hc9mc/6vQGKiVMlAGtyBSnIwFfDNOV1A3W8OxVTsw0R
         7n7b76EBekSVg6i4uGmGRBX56GhORDozrpK6WVTos+Y/iBgqiiJjd1nlYfyAKaJbf6DE
         N9dYvVkT1N6eVfKL+KI4Tx27cp5oQ3HXUKKvBeVyLcsM/VEkz/W4LgohWme22zEBN4Yt
         6fEgXuHUVnWcUDOqP6Sit0tvElLARyFH/I0bIenidO1CsClMePfOni0v6dEMO268YInz
         fe8A==
X-Gm-Message-State: AOAM533Z8K/8bAiW2dODls7P5PpBKZ6rcsdovvck40wltfFrrGN98NE1
        +NddPrn6xgD+1aaM7EhEBW718bucth4aFfzXIDxqWg==
X-Google-Smtp-Source: ABdhPJw8NSAh8QNT84J6otnyIWfXxOPOsTCOyvaPX/caUJfnFQc3Pj0sluJsHos7SGDAJfOig2tB9KwO7ObuEreAodo=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr14285722ybp.366.1621600946680;
 Fri, 21 May 2021 05:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210516061425.8757-1-aardelean@deviqon.com>
In-Reply-To: <20210516061425.8757-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 21 May 2021 14:42:15 +0200
Message-ID: <CAMpxmJVeZ2zASLN-TqasWHDvLbWN1K=4ZFTzw36_KTs6N7S-5g@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-stmpe: fully use convert probe to device-managed
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        alexandre.torgue@foss.st.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 16, 2021 at 8:14 AM Alexandru Ardelean
<aardelean@deviqon.com> wrote:
>
> The driver doesn't look like it can be built as a kmod, so leaks cannot
> happen via a rmmod mechanism.
> The remove hook was removed via commit 3b52bb960ec6 ("gpio: stmpe: make
> it explicitly non-modular").
>
> The IRQ is registered via devm_request_threaded_irq(), making the driver
> only partially device-managed.
>
> In any case all resources should be made device-managed, mostly as a good
> practice. That way at least the unwinding on error is happening in reverse
> order (as the probe).
>
> This change also removes platform_set_drvdata() since the information is
> never retrieved to be used in the driver.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>

I applied the patch and tweaked the commit message because as Andy
pointed out - this driver can be unbound over sysfs.

Bart
