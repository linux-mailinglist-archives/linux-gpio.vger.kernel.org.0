Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333046B2656
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 15:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCIOKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 09:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbjCIOKH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 09:10:07 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A6F1E2AF
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 06:08:59 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5384ff97993so37464377b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Mar 2023 06:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678370939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNYpKD19CQMx//TQ6gRIcfYtZetkx8u9yXR+/GYE/OI=;
        b=BL6MZ9fFBbKkXJ7YOlcNpYgELX9UktkrC9y2EmF8YA0wNHtltEcFQdWuYyb38fzSzQ
         OP5jmXOaZQEa1/auJWmya8SCK3vVT4ZKiJ7zAJIc3IVy7pTMsWIEJQlMOu1/ZaUQI2zE
         INc+EdnVAgfpebx9B3pZ5bDCHcg5jjzF/sknKg3tMykWG9SeKoD1VySgTnHmyOkHxGx/
         cJrNt2v4ljifBdjs4v2YQsiSiIM810xDaFUDUNg0Mst+Oo5ueUeuQNAYUo/mfQfHxv7G
         mBdg4o8oueL9ALzIuOSrLixjRcTcqnzuVsWqg0rt4vP3oXLbH4/Hzg4cafpcCqOiZ2YM
         vudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNYpKD19CQMx//TQ6gRIcfYtZetkx8u9yXR+/GYE/OI=;
        b=yub+8CwQWIEDyuW2NmRzDhrYZqwGtM9XtdHF6cKg76tdPPWXbQjeEeKPkLWBkIOc26
         YSfT5O4kqVd42cxsLTMmvftRoVs6HhiSbquRIZToj2P5Qb+aMjxZMSjI7s6BEVBsAADS
         069kFzG/S1WlW9HgQPGfR9Z+Vou807VNcQ92zYmcSGDDvf7ILEMMzzENVAHHYSN2uNBO
         9OfQdqmit4UYApu4/ZzrXUu3L0hGMw9FtenP5+xZmsaYU+4TIfSPFrLQP+sV1CRFU21K
         pFBKZNrpbovboRmz1vQXc7xo+V4WW2eRq2rV6mAFNC6IKJgqtLNkD+yJgaxxXNbTK+dp
         w70g==
X-Gm-Message-State: AO0yUKUkog99NbNqld5esRtUXF9GxOmtlp2tKoegpfWutMf6ZSfjm3rX
        RBcPFtEat1ZU0lWroOFVb4MB3xMDDBx8Ld/TjTjUOg==
X-Google-Smtp-Source: AK7set+lVvVY4FziSRRfPKq3rHn1hWLe9VJbSzh76+m189ZOrx5E2lz7lYSP1nbFspYJ587Bl4JjlyoL5YqLtGZhBXg=
X-Received: by 2002:a81:b667:0:b0:534:d71f:14e6 with SMTP id
 h39-20020a81b667000000b00534d71f14e6mr14180137ywk.9.1678370938978; Thu, 09
 Mar 2023 06:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20230309135255.3861308-1-geert+renesas@glider.be>
In-Reply-To: <20230309135255.3861308-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 15:08:47 +0100
Message-ID: <CACRpkdant3mQJX0FM3q65mBaS0fXJ=7tag5dx-1Jp5xpc3EQJg@mail.gmail.com>
Subject: Re: [PATCH] sh: mach-x3proto: Add missing #include <linux/gpio/driver.h>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 2:52 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> shx3_defconfig:
>
>     arch/sh/boards/mach-x3proto/setup.c: In function =E2=80=98x3proto_dev=
ices_setup=E2=80=99:
>     arch/sh/boards/mach-x3proto/setup.c:246:62: error: invalid use of und=
efined type =E2=80=98struct gpio_chip=E2=80=99
>       246 |                 baseboard_buttons[i].gpio =3D x3proto_gpio_ch=
ip.base + i;
>           |                                                              =
^
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Link: https://lore.kernel.org/r/CA+G9fYs7suzGsEDK40G0pzxXyR1o2V4Pn-oy1owT=
sTWRVEVHog@mail.gmail.com
> Fixes: 21d9526d13b5467b ("gpiolib: Make the legacy <linux/gpio.h> consume=
r-only")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This is fallout from cleanups in Bartosz GPIO tree, so it will be applied t=
here.
Make sure Bartosz gets the patch (now on To:)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
