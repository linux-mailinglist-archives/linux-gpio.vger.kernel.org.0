Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC548248ED3
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 21:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgHRTkV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 15:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgHRTkU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 15:40:20 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B50C061389
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 12:40:19 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id j10so10119578qvo.13
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gHjO7hnTpGJINthx/ykdD+LuGGw/JAWxBtHydodDWrI=;
        b=VUUP0dxKZkAor6AZPb0wLSi2bpgaKhw/l0eeVxcMEb+6ukVn6pmEfcDdGDe86YYmUw
         +gUnqm5QqFBOyM9ggLsM3PR8DDIa6/S4yl3fplXTB9rDY8USzf0Zoy7+B1NHeY2hHWyG
         2ivvC5xKmxQJw0c3d3zpE81VXM+uH2HsDU8Wn18Pu3ndZRSNwCLXJPuHp9LTYcwDy/j1
         kcXN58j5dhH7MPXIsIvFBm1O2zTRv+q9IC5Khfqax0HQoNgOpXx49OkeyGVd59yT/uYI
         aXFaFeWA8hGAUa+cKqMtOwtQV4qxKrSsGqm8cLr28fUJzH30d4T05NG8XH1OJqrWg4UO
         glMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gHjO7hnTpGJINthx/ykdD+LuGGw/JAWxBtHydodDWrI=;
        b=XcI+XUW+dvTV3OPaEQSWPKPhUaCm3kUeJEtYLc3V3aXOHp/63nw72N1laOcaECQiWD
         SOciKYq+Wl1m+gmuQ296UcvoqSLOiKIRhKqmBpoKVreXZSA7sAzIBAuMfHSAZ8ENFfyo
         hnUfnpTG5qbf+y1Bdc/B9tNaGKOxyqImAwHDGGgicoTPX6MMj/bMHTeYK3PW+MFjNC00
         xxQ1A2O/MmrsDRMLIEEW8IRvzEJ3iRmK8vt0Vq/mGtr1QwCFixRhvRT7ajS7ciMzCmgO
         wIakuslRSoug205JLDKFjP1FBA8Veco1RM/22qMkhabpj2PUu6ArvvA7aZSlCtQI0QMa
         G+CQ==
X-Gm-Message-State: AOAM530O5T49vnIxAu9v4RzQylkjgj6gUkHNGRdyC/Acd6WQlKP2fVbJ
        PrFcJoeL9SXQsebYsa7nOh3N1YgqTx0a5EDmiO7BAg==
X-Google-Smtp-Source: ABdhPJzDtypA0p8JkQF++zXEGj40njLSXFBMp9IAzG21zNQVZRcPCeH05FSL/L1xc0f2Ac1XYKq47Nyfahjl2ZAfPEs=
X-Received: by 2002:a0c:eed1:: with SMTP id h17mr19797386qvs.96.1597779618626;
 Tue, 18 Aug 2020 12:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200810114353.48761-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200810114353.48761-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 18 Aug 2020 21:40:07 +0200
Message-ID: <CAMpxmJUeNuSdC8ngBkpq_=JPQ5YszXeEkuEE3iQHUr9zuvNGEw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: aggregator: Refactor ->{get,set}_multiple() to
 make Sparse happy
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 10, 2020 at 1:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Sparse can't see locking scheme used in ->get_multiple() and
> ->set_multiple() callbacks.
>   CHECK   .../drivers/gpio/gpio-aggregator.c
>   .../spinlock.h:409:9: warning: context imbalance in 'gpio_fwd_get_multiple' - unexpected unlock
>   .../spinlock.h:409:9: warning: context imbalance in 'gpio_fwd_set_multiple' - unexpected unlock
>
> Refactor them to have better readability and make Sparse happy.
>
> Code size impact is +52 bytes with arm-linux-gnueabihf-gcc 7.5.0.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Queued for v5.10, thanks!

Bartosz
