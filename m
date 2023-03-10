Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D586B4BD5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 17:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234543AbjCJQAg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 11:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjCJP7r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 10:59:47 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F6B10DE61
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 07:54:56 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id d12so3805452uak.10
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 07:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678463696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9lGiLB1lEwMSjkrCTWHQZ/8zcOfwInRl7UwDtArVSU=;
        b=C46AmGmDmfwAdLj2SgY1PW7ZWR+LC+Gmr/dZv1uSFCIid1PZM4MLTZy90LvLGDOG6T
         XHe5nQGK5R7JfzvqbVFO6VMtsOmyCNOQESsV0hwJtjuoCY4LbcvPRAJDqGnQUKS0aJT1
         TsUDSHrWhC958ugTLQHBZCrnILOQbOJeKzuIpUSu8fnGdIFVtGU1kbS8m/7/zx5AGJEl
         WTEZDX/6QyQZ/P2jTUHx5VlJxogVIXOHP8CbZWyskt8oak8iIEs6S42KMrgeNop7mcop
         jQojiHdw25lIL5d5kGOpe2G4Mf68JjB5PnFKOcdT3RAAEfcrZ1Vg1UlkrH9fsMDJWQLD
         gYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678463696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9lGiLB1lEwMSjkrCTWHQZ/8zcOfwInRl7UwDtArVSU=;
        b=0PbIAbZm/TDjbRX2x1+wtupBc1/yGgYi4gzQKlUb+86rxc5AsSc5ohK/Z1RH4JRHFO
         jUgegwt+h9PjhdHk5KM2Al70/dPdbTdPPmWtuvczVQ/lCxnmUV6DwEefzJ7i5WxWTJv0
         nk5u0S8A9bZ7RaxINbuf5cbTKHk4vRsSahO1XTik7xotN+fBjD1AgIwBBSDMoVI/ZM2E
         yx/AzzQIs1acbbGhJ2TO5jyDcnClvR+mhSn6yMkyqDkLU0LHOtX8hmnAIVOvZEaRCnuj
         sjS+Weok3qB3WVDW4I3IfC+Jm50KAgiTepfR6ISKrDcyYXKmQQUO8KRxCnAkA7noaidI
         AiWg==
X-Gm-Message-State: AO0yUKX8kTbjnvCZHlVK/yBVikplN6xmou23/rtNh6v1MK/PQf3fezZL
        ukUwiReZBOyGZlaar9J3E4TXIEmCEjXLi04o4rkzMo4RkF/WUyBu
X-Google-Smtp-Source: AK7set/uLrctXAmLmCXI3O92TwFhdhy57q28oF6cfBKTGPlwcWFkmvc8sDNaWExJPn+GdXgRaEw1O7wKjSCRbjG2fyM=
X-Received: by 2002:ab0:4a12:0:b0:68e:2dce:3162 with SMTP id
 q18-20020ab04a12000000b0068e2dce3162mr16916689uae.2.1678463695960; Fri, 10
 Mar 2023 07:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20230309184636.84124-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230309184636.84124-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Mar 2023 16:54:44 +0100
Message-ID: <CAMRc=MdAQ27K_tm2+pzQULo7NtV4wUBPM3fX-9a+snXWTQUh0A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: sim: Deactivate device in reversed order
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 7:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Run the steps to deactivate device in the reserved order to what
> it has been done in gpio_sim_device_activate_unlocked().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-sim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index e5dfd636c63c..a1c8702f362c 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -953,9 +953,9 @@ static void gpio_sim_device_deactivate_unlocked(struc=
t gpio_sim_device *dev)
>
>         swnode =3D dev_fwnode(&dev->pdev->dev);
>         platform_device_unregister(dev->pdev);
> +       gpio_sim_remove_hogs(dev);
>         gpio_sim_remove_swnode_recursive(swnode);
>         dev->pdev =3D NULL;
> -       gpio_sim_remove_hogs(dev);
>  }
>
>  static ssize_t
> --
> 2.39.1
>

Meh, doesn't really fix any problem but applied anyway for consistency.

Thanks,
Bart
