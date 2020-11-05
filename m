Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4812A7CA7
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 12:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729916AbgKELMW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 06:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgKELMV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 06:12:21 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A3AC0613CF;
        Thu,  5 Nov 2020 03:12:19 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id c20so1226440pfr.8;
        Thu, 05 Nov 2020 03:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iUjAoEg9iu+vP2+zZMk5CXPigZo8ZpjB6LQlpjXIY5I=;
        b=sMoaiLkwhmYoft6uQTfT2jODEzM75U9zMoId/2BZUYMxZu2PMiRp5J1vBrGxsKJQZ7
         Fk7Fal0QYwLNLJ1xprNRg0KZ5As+19fF0c0i36JVwRSwdbGcQ5pdUu4PP8Wb6H43WFpT
         o6SbUCvg+qoGC4JKyDsSQS+Scr8uQaEfHx3XrkL1xA5JLo/bH21GljEmGFwV6B0Bab7D
         fhLFS+5aRMbqZljkz2e6MvURqeOTxNotQLz58K+zKMDxGVuLpj8dsuozzzKLKfFUZSU9
         rug/tsPcJcnhmidy4FTTjQ13Wj4UrGUIHJJlOi8MZbPqRHbKd3SeoKiokKO086jlxhQd
         7Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iUjAoEg9iu+vP2+zZMk5CXPigZo8ZpjB6LQlpjXIY5I=;
        b=rju8pGYDsWboDpuSa+tRNwuvjjvWWZP0zDeNncB9wIsRaAxDOvxRVBao/dbYN+Ikbk
         XkcGdGJbf92QpZvn+qdjiHllkhnWiCZOyJwRVJ6G7OJURH9E9LvJWAJXeHx9sgp26pgN
         4oEWAiT+ZMWh4tzxQX9fdqDVl1dMs5/fGnSDS4vIbIO/WBu5gXiabVUIKrU9+HMFOAqQ
         +olmeZWFmecjtnt/bGMqpbBoJrDYaTv7ikQiOuM3pnyRtc0mhyC4yUwdajTcNHlVs0HW
         Ci+6Rz8qlcg2j5TrFkYSv2jz9pH27jr7IDYXhcbCjj6+J0Ac5WAb3s/SO/oXCzs7jeee
         HGIA==
X-Gm-Message-State: AOAM532LiyqddrD/lDFqQLLgXF5pnX0UHQWq8NUauHJf+rKcmleXHzax
        BQ3ynajEkCmwymCP4CuoM2uC2UlKb5dyjSmul5Ytvi4vZSo=
X-Google-Smtp-Source: ABdhPJx4w1l/kEti7iOKJ/mHOzonSScVh/NvYc49Rps0qP4gRt9WmPN3xWJM2w1rv9H16VII1JvAUnRl0JOQ1OSe6vc=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr1875620pfd.7.1604574739473; Thu, 05 Nov
 2020 03:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20201104230703.21466-1-coiby.xu@gmail.com> <20201104230703.21466-3-coiby.xu@gmail.com>
In-Reply-To: <20201104230703.21466-3-coiby.xu@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 13:13:07 +0200
Message-ID: <CAHp75Vf=78VdQPGERb-x1ucsT=SAbt2UV9ANB=vU0S7H+BLQRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: amd: use higher precision for 512 RtcClk
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 1:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> RTC is 32.768kHz thus 512 RtcClk equals 15625 usec.

I could add that the documentation likely has dropped precision and
that's why the driver mistakenly took the slightly deviated value.

Anyway.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Link: https://lore.kernel.org/linux-gpio/2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com/
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index d6b2b4bd337c..4aea3e05e8c6 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -156,7 +156,7 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
>                         pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
>                         pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
>                 } else if (debounce < 250000) {
> -                       time = debounce / 15600;
> +                       time = debounce / 15625;
>                         pin_reg |= time & DB_TMR_OUT_MASK;
>                         pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
>                         pin_reg |= BIT(DB_TMR_LARGE_OFF);
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
