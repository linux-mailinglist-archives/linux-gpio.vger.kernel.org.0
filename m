Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A9C35007B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235534AbhCaMhz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235454AbhCaMhn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:37:43 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA5CC061574;
        Wed, 31 Mar 2021 05:37:43 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id l123so14439851pfl.8;
        Wed, 31 Mar 2021 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GShH3kQrnRMf0b2uqJ73S0gCwVnnyAi3nGPppvV8rRc=;
        b=L8KCTZ21CX1o/NJul1TS7q9AjCMHp9H5b/LEkF1FN+PlSOfsrRja7YCVfjZGD4tK8j
         wBAFfzIgdf5+CcWSbxeCuaw7sVAVtEOQJQY0Ooicg9gGSSijo7LC681W4s+PeitV7nLu
         /RTXd5LwEXbAzSL0TDukvHiIFyq/EbajNIaerdqj4ajl55oYBd6A59Kg3mcCpmbr5rU6
         V/LtlCv4ie8Ir1gvOoIcx5T15wu+QywxAR+EG+QFohcODJ1+CpGWfVIc9pP2tgYeUL2W
         hMO28U9cJQa2LdYIxEWWBLNKDTonHopHRHl0OQg47pUDn5B4EF6NlkWcYB/4yRhm6I1f
         RdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GShH3kQrnRMf0b2uqJ73S0gCwVnnyAi3nGPppvV8rRc=;
        b=alMil0yaqCaHoM1DGcBK1fVHCwXbeck0z7hew+Y1gHdGU0A15hLm1GMOVM2OkHUqG9
         08qXy3IKGFYuS1uUOoEd8Pt4OU1u9+D5iVxAlG7CS9IUtmKXsABHv8cnZvZBgbLdB8Cf
         bjZ/vyHBkCr5tpkYcKngxrUtgcRdlHDjIDJAbWy98otpGapVPAbCRS/AQxm92Rc2qlqW
         miRjQ3SkBepvnooALcyNQXZRW1yhEuOByAFwMyjrdPB03WjzbTeOHU7GplDkh2MoEyqJ
         J7/8Rdta9zBCY2FIpr46wSgBTTru9YZZtOTr+aGvO1xm8aNsdKirPfGH2yMQd180/V8L
         49Ew==
X-Gm-Message-State: AOAM530MiS+d49xwUWU2UxyGwL2w6YWwY3FNTVv3KfX0HPo6h41sZT5q
        ADji0TIKijHgLF7k59lYNmGMedQxRMUiyJL1CCo=
X-Google-Smtp-Source: ABdhPJxCac/ehMc6eK8HGYgViF7DcnJIOPloIfTVQi7jSyOiQ7Q+gFKJVnxp3k1bMcusI72RhpQxhPc16OMmfwA3yu4=
X-Received: by 2002:a63:c48:: with SMTP id 8mr3071744pgm.74.1617194263310;
 Wed, 31 Mar 2021 05:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com> <3c19d714645f788913956223097adc360ceb6203.1617189926.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <3c19d714645f788913956223097adc360ceb6203.1617189926.git.matthias.schiffer@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 15:37:27 +0300
Message-ID: <CAHp75Vdk4rxiD_nm8Cb53oTYNvMqkAOM4U5zEn5tchtptQZEBw@mail.gmail.com>
Subject: Re: [PATCH 3/3] mfd: tqmx86: add support for TQMxE40M
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 2:38 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> All future TQMx86 SoMs will use a 24MHz LPC clock, so we can use that as
> a default instead of listing each new module individually.

...

>         case TQMX86_REG_BOARD_ID_90UC:
>                 return "TQMx90UC";
> +       case TQMX86_REG_BOARD_ID_E40M:
> +               return "TQMxE40M";
>         default:
>                 return "Unknown";
>         }
> @@ -138,12 +141,6 @@ static const char *tqmx86_board_id_to_name(u8 board_id)
>  static int tqmx86_board_id_to_clk_rate(u8 board_id)
>  {
>         switch (board_id) {
> -       case TQMX86_REG_BOARD_ID_50UC:
> -       case TQMX86_REG_BOARD_ID_60EB:
> -       case TQMX86_REG_BOARD_ID_70EB:
> -       case TQMX86_REG_BOARD_ID_80UC:
> -       case TQMX86_REG_BOARD_ID_90UC:
> -               return 24000;
>         case TQMX86_REG_BOARD_ID_E39M:
>         case TQMX86_REG_BOARD_ID_E39C:
>         case TQMX86_REG_BOARD_ID_E39x:
> @@ -152,7 +149,7 @@ static int tqmx86_board_id_to_clk_rate(u8 board_id)
>         case TQMX86_REG_BOARD_ID_E38C:
>                 return 33000;
>         default:
> -               return 0;
> +               return 24000;

AFAICS it will return 24 MHz for "Unknown" board. Is it okay to be so brave?

-- 
With Best Regards,
Andy Shevchenko
