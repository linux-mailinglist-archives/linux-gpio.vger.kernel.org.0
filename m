Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943366BF320
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Mar 2023 21:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjCQUxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Mar 2023 16:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjCQUxy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Mar 2023 16:53:54 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACA71B572
        for <linux-gpio@vger.kernel.org>; Fri, 17 Mar 2023 13:53:52 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id e65so7097542ybh.10
        for <linux-gpio@vger.kernel.org>; Fri, 17 Mar 2023 13:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679086432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81k/wsN5LJHSw7IMmKprz7MljTYWXfOO3qNXbhpMYDY=;
        b=GbicmX698aU6P3ndLa71hM7B5bhfNOjyuIQiA9eX8PBOUq1/RzNGBMXbQ0iECrEv5q
         Qs2X2vRlWaonAomu6hJyTwJyst53I6ZQ3AwexcFFxvypToqzgoHD0fkw2SQ2SPgYDhQR
         9YJ8jnhRejBiis4ni0UupkquEUOOR9t1B4kTsa+LnMK4mG+TfWQwbJZmH+Ig8uje91Dh
         9TageZMNT90SRCTnPZvM+X195DHkOewu9tGsi5ElbC+A16u6x8o1p0fGf+3NYX48p5Pm
         3EYTdu4fPQ8e7qhaNJFLLBWfW480I1Nua6D65Pmpkq/ezNlYQ+TljEyo4C433zu+IWft
         T1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679086432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81k/wsN5LJHSw7IMmKprz7MljTYWXfOO3qNXbhpMYDY=;
        b=mio2GpvQ7jbka6gGkMa64425prZAXVC6iOHvrTepIDLnqvI6UPBxdWlRMJeq918QI0
         1LsxQv2IbHr1+LFEloW8Gb7N8mV8ccltGGR7cCXLMVz3ReMyCzqsSNjaw8veOeFBCX5G
         9cYAY5NxDa1Ujz0HuSOIuX0DBsLajO2Bm8lSu4W38tsNSFYz9CVc9ZH0IDN5j/aOLSzq
         kauWudHUJKj4eB17x2vjC2bUKV2NPrTmstBE5eT5GUGgOBrLF9w+Ncub5YFF/pX84jEb
         YXj8gHXyOeUNwAABKvXWKxWJY1hsLdBFncBO5BexS6jaoW2RPCbp2YHxJcYnmd5FC7QX
         WOOQ==
X-Gm-Message-State: AO0yUKU+bQV4hZAFC5xq/ejQRdEtQB5Gi+Il0DcpxrUNVtbFxfeRRKet
        N+PxwHbHTom5IS+9IIi9u4PfCDF2pP12sC4ZjlSHMo5ZmFQgXNd+VIE=
X-Google-Smtp-Source: AK7set/xMcJB36hfzj7lWnW/tGG+jyb989JVS6ZTe5X+GsibjG7yhs/EkXgKMrPvyfaL3Ej3pxGpi4IcL7WRbw5L0/o=
X-Received: by 2002:a5b:611:0:b0:b67:f07:d180 with SMTP id d17-20020a5b0611000000b00b670f07d180mr357039ybq.5.1679086431900;
 Fri, 17 Mar 2023 13:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230317185230.46189-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230317185230.46189-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Mar 2023 21:53:40 +0100
Message-ID: <CACRpkdYXTk2pzXEM9MTjt=oT-CbhENABSLeb9dN7ZvEy8oqiag@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] backlight: hx8357: Convert to agnostic GPIO API
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 17, 2023 at 7:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for fixing this Andy!

> -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> +#if IS_ENABLED(CONFIG_LCD_HX8357)
>                 /*
>                  * Himax LCD controllers used incorrectly named
>                  * "gpios-reset" property and also specified wrong
> @@ -452,7 +452,7 @@ static struct gpio_desc *of_find_gpio_rename(struct d=
evice_node *np,
>                  */
>                 const char *compatible;
>         } gpios[] =3D {
> -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> +#if IS_ENABLED(CONFIG_LCD_HX8357)
>                 /* Himax LCD controllers used "gpios-reset" */
>                 { "reset",      "gpios-reset",  "himax,hx8357" },
>                 { "reset",      "gpios-reset",  "himax,hx8369" },

Eh what happened here .. it's even intuitively wrong.
I would add
Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines
with legacy bindings")

It wasn't used until now it seems so not a regression and no
need for a separate patch.

Other than that it looks correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
