Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C853B298FFC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782174AbgJZOxX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:53:23 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:39656 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782171AbgJZOxX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:53:23 -0400
Received: by mail-ej1-f67.google.com with SMTP id qh17so13987686ejb.6
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=38JUOSBu4GFhBOvq+9SNCXQcv0KkWmqy9Hp4RPYwxR0=;
        b=1Sn3eS1rPkIUw4yZiZX8LDfpFMLxcQy2ZruTRUmGgiz+JxtDdBR02bS/uctUytpc46
         z9HKtqNOkFLB/Upy2/aXJgE8WL34vioY4yt2S8RoFyfewKlVA03zZc0Xlo5GGaPsAh24
         1zdq5HXwORHbeB+vgHEktCppgeIqhTKKqx4JWZiowRpevfeYmrnx06YzykdN4qVkDUnf
         rWuH8Wdhph/3Rt6CGHS0iN6sSOSnRTyCcBmnMSymJLpaP4Lf2XVDhwEqJ7K+iAb416PP
         lxOQg5ZWtRj6YCgojg0IRPv99BN/xWGUbHFrMbc+tOc96VcepJeR6i9u3SFCbY1dB7iI
         6njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=38JUOSBu4GFhBOvq+9SNCXQcv0KkWmqy9Hp4RPYwxR0=;
        b=apJ757MqM5KkM2C5KRJG1BehremniwrgIWSotPnhxQ79t412XuXSGJlYRMyWrxLkPp
         wmHr9Yj1IOLu6MmbKdHrjDp2LboUTYPOEERxR1K4gGUKdxRVcqnk5xXUQlbynhCBgG5k
         PwmOGEzcXn4eUVE/SRBfa8I81y4r+GogTenj4SOPziVbyYJduYiucBSBncg6qs/CMJtj
         KqLXOPckSTbpWgeKSxC1D1L/yKEcpvv2VAr8LFZQ9hRaFLPQQQ1+B7rasOTBgHVWBOfG
         GHbXk2LRZZYeEq1V07cQQBPVF9XoTvYlFfw895jz7ahixwb7hHKJ9B+/CC7E0O1RISOp
         xMhQ==
X-Gm-Message-State: AOAM533GG0arX/2X+ESumPYrx3yR/57+pvf9UwX1dLKX27sElBjtLy2X
        YAiT9CLgfRKb7JjE9G0hmeK2mSdwJtoMf9Al2nMml8Fmbh0=
X-Google-Smtp-Source: ABdhPJxmm7PP+RKNyuOdsuUjuGYXmXHXzRcdDH1ZWgN2nvf0gIXhlqZ5eyc1qgr7/me1aVyIp28B9EnRl+4aNr55jsI=
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr15346860eje.363.1603724001628;
 Mon, 26 Oct 2020 07:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 26 Oct 2020 15:53:09 +0100
Message-ID: <CAMpxmJXzku3+gfs3jnfpRzLxmQFx3QAJArXEJ0maRx=EKK4WTw@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, rentao.bupt@gmail.com,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 6:50 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> GPIO_T is mapped to the most significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_T is input only. All
> the other bits need to be 1 because GPIO_Q/R/S support both input and
> output modes.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d07bf2c3f136..f24754b3f6d1 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1114,6 +1114,7 @@ static const struct aspeed_gpio_config ast2500_config =
>
>  static const struct aspeed_bank_props ast2600_bank_props[] = {
>         /*     input      output   */
> +       {4, 0xffffffff,  0x00ffffff}, /* Q/R/S/T */
>         {5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
>         {6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
>         { },
> --
> 2.17.1
>

Applied to fixes with reviews collected and added the Fixes: tag.

Bartosz
