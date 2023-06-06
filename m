Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 686CA7246F1
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 16:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238422AbjFFOzi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 10:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238611AbjFFOz2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 10:55:28 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4994BE6C
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 07:55:25 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-76d846a4b85so1826784241.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686063324; x=1688655324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ws86mjN6O54EDU7t1GkNhUYlC38l988WAEd1DMCAbhI=;
        b=eO+W7Mq0zK5D2+S3M0PZFEFoEZvyWCmPbEtyT8JKBRxejnZL7d3sJk2emMqgdHr5qz
         zm16bKaEcFcmwZ65ngVKCniQQ3SyNtMc+MrVOm1Huv2cnNvJUUHDaGqGVr3FevPsWv8h
         9P6Rkshoktt/NMmHcwONV+9+6dvVXhp1OYlP9fB15jYnp8ap7vmiW7dvpCChmrZsW/jU
         JN2KaJ40YKPgT9Ml3PkHOVl8AApt6iePlZaDqJbUf9huhMoXN1jS7tbO5Dr36bbacW5o
         l1DKZ/iX9bXePZAfE/2cLaTtmQqgiSDZSH0WRt2rggrgfZ5ThKekR6tm50jugTA+QLm1
         rHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686063324; x=1688655324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ws86mjN6O54EDU7t1GkNhUYlC38l988WAEd1DMCAbhI=;
        b=QnEPukYfkTX8Fm/DAj6OuFqJCR6CQMV20WSOQybud96kOZCb6uKgGF+/CChgkBu9Sy
         6BZcauDWZUi4oGmoIVdlZwnKUs+lfofsh69d6k84A/kJjErmc9LOWvGO+J0x2Eh9UBTQ
         YYcIDtN8CHvGLtTkOd9IwUoCBm5S0Oq6uD5Gncu8Crwg5bB01XEAPUkQtIXucFFKWDh7
         /PcWsqCt1YTBqkjbcXNlprlB6tNvEM8AHjvDA8hyuAOyWjkj3njGxYi2Pj15qW+jU4HC
         J22vWw4ZWisElvsako3LIvcvy24MkZlP+xir65EXK8UqQoe6gw4cUwZiGTmV+GuPhBOc
         d3jA==
X-Gm-Message-State: AC+VfDwFMFu9Rt3b+BmFVU/WAbk3CHDgfZrDtjRrk4t2CBmO7UDxM/FX
        gJ89O++e+w5+puB1iWGCkspRcJuVm9lqw7CuUM+YRgMZ0RcmfYzD
X-Google-Smtp-Source: ACHHUZ5te+wuMxylkrnDN0f7XVtqk2LRg7Ket/I+JDU1fizxzRw5rrlY7i/lKIyIWQIHRVHdHwZKfDt8E9eP9wD4QsI=
X-Received: by 2002:a05:6102:284f:b0:43b:4872:f619 with SMTP id
 az15-20020a056102284f00b0043b4872f619mr3432vsb.2.1686063324436; Tue, 06 Jun
 2023 07:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230606120034.42904-1-warthog618@gmail.com>
In-Reply-To: <20230606120034.42904-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 6 Jun 2023 16:55:13 +0200
Message-ID: <CAMRc=MfoGFCztoQc5GL3pzWyJUnXz_eYjydQ4wvp2xg3zW8ArA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sim: fix memory corruption when adding named
 lines and unnamed hogs
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 6, 2023 at 2:01=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> When constructing the sim, gpio-sim constructs an array of named lines,
> sized based on the largest offset of any named line, and then initializes
> that array with the names of all lines, including unnamed hogs with highe=
r
> offsets.  In doing so it writes NULLs beyond the extent of the array.
>
> Add a check that only named lines are used to initialize the array.
>
> Fixes: cb8c474e79be ("gpio: sim: new testing module")
> Signed-off-by: Kent Gibson<warthog618@gmail.com>
> ---
>
> changes v1 -> v2:
>  - check offset as well to make the purpose of the check clearer
>
>  drivers/gpio/gpio-sim.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index e5dfd636c63c..09aa0b64859b 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -721,8 +721,10 @@ static char **gpio_sim_make_line_names(struct gpio_s=
im_bank *bank,
>         if (!line_names)
>                 return ERR_PTR(-ENOMEM);
>
> -       list_for_each_entry(line, &bank->line_list, siblings)
> -               line_names[line->offset] =3D line->name;
> +       list_for_each_entry(line, &bank->line_list, siblings) {
> +               if (line->name && (line->offset <=3D max_offset))
> +                       line_names[line->offset] =3D line->name;
> +       }
>
>         return line_names;
>  }
> --
> 2.40.1
>

Thanks for figuring that out, queued for fixes.

Bart
