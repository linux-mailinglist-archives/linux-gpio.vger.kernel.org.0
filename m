Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5783516C6A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 10:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383842AbiEBIvW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 04:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383969AbiEBIu7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 04:50:59 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707FD5995A
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 01:47:17 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id k27so15833016edk.4
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2022 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYpQHYL5SUkj/kk4MRQrQhCiJiLDX2y0vsLoj8vEwOY=;
        b=g/xkLdQSS4fstIinvit+TJp/68RBb26pUrxi69oxmD+T1l9JE2sRE8wUtzeOAUTu88
         dTct3m+p+Gt0yNk0wEK7nIrV0NV5K6+HGhHv0P+VgDhWuHgff4fJMKSR4UUQFtRok3DI
         oTHKWVKPN7fWtd5EEnalUv+3FMg2BjOMpRG0hB33qWKbumqOgGnrN3FZOXCM0K+QqQWf
         7nFWXUpcE3w0qGJ/ibsL5IPp80VPE/GhCbKs7S41NfgQUfnOOIeGs+90PeMoyUUdHRv5
         jIjP9RHWJt/MMkF9i0S2OS8CXe3mbduGzbROcKCFjxlF3ZWPTZr1wYV6VP+ZSMwxou7P
         d1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYpQHYL5SUkj/kk4MRQrQhCiJiLDX2y0vsLoj8vEwOY=;
        b=0McACfWQCihQb9rdiGfsQuoZk2Cdm/gWhBQM8fSMZAG7UPOhBuGNMU2IQVQi7Q8yTP
         uQYbsEHgw0x/v9761RLtQOKhDQA2Cnj47zPzrhLP+59b7JLCVbNGKb/iZPWemUnmanwf
         tUv2CmJ63HpmfX9xXG5C9PBxtObX/zEkYRKom1Xj/hszwiJeWIFWRrvJbFUbizKnh6cH
         /dRDe2rUVIikSYv0yGsHaP1GpMh7cFaDyplooKjonomVsZPY02Z0fajTe0WdLpy2SZCs
         h+qp2nw5jIAHXHmYISawX6wg/UgMJ+GbZnF17RgNByUj+mwkoWoDBJ9UYJP8hhh+Nptk
         6WAA==
X-Gm-Message-State: AOAM533CiiICqHuw/0Peyf3OgDSurducYaPhPP54WIF8qQfzVl3x/CCp
        9WeEYlTdYrqQoyrOV5tboT2XrPl+PhKAClpwqPXD9A==
X-Google-Smtp-Source: ABdhPJyeedvZw9SdaKGCKhS6IM3vLiDAkyLNkFyLGWoEwL/WWPn+zH0IKqxba8VILB+qr/75D2Kq4b6C0mgta4XBUxQ=
X-Received: by 2002:a05:6402:1a34:b0:425:ca01:58ec with SMTP id
 be20-20020a0564021a3400b00425ca0158ecmr12405487edb.373.1651481235999; Mon, 02
 May 2022 01:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <145383feecbe43f3bbd3e128143f7890f0314b3b.1649658220.git.baruch@tkos.co.il>
In-Reply-To: <145383feecbe43f3bbd3e128143f7890f0314b3b.1649658220.git.baruch@tkos.co.il>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 May 2022 10:47:05 +0200
Message-ID: <CAMRc=Mei_ZWPzSMHpC1Ao8nU487_SUq7qQGEDkxwdRb0jmx7cQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: drop pwm base assignment
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 11, 2022 at 8:25 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> pwmchip_add() unconditionally assigns the base ID dynamically. Commit
> f9a8ee8c8bcd1 ("pwm: Always allocate PWM chip base ID dynamically")
> dropped all base assignment from drivers under drivers/pwm/. It missed
> this driver. Fix that.
>
> Fixes: f9a8ee8c8bcd1 ("pwm: Always allocate PWM chip base ID dynamically")
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/gpio/gpio-mvebu.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 4c1f9e1091b7..a2c8dd329b31 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -871,13 +871,6 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
>         mvpwm->chip.dev = dev;
>         mvpwm->chip.ops = &mvebu_pwm_ops;
>         mvpwm->chip.npwm = mvchip->chip.ngpio;
> -       /*
> -        * There may already be some PWM allocated, so we can't force
> -        * mvpwm->chip.base to a fixed point like mvchip->chip.base.
> -        * So, we let pwmchip_add() do the numbering and take the next free
> -        * region.
> -        */
> -       mvpwm->chip.base = -1;
>
>         spin_lock_init(&mvpwm->lock);
>
> --
> 2.35.1
>

Queued for fixes, thanks!

Bart
