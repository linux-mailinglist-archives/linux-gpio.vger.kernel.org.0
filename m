Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C485706434
	for <lists+linux-gpio@lfdr.de>; Wed, 17 May 2023 11:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjEQJdp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 May 2023 05:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbjEQJdo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2023 05:33:44 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F99C4ECE
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:33:43 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-783e4666738so206419241.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684316022; x=1686908022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZP05VBsRBTnZPUQDMha8VxgfVkr0tg5YgvQMaq3VYA=;
        b=aBBRNgfRVqVIC9Dm9wfTTEuD3/7fHEtP2vqz1zKRHpv++rQJidsKaSv6VFaHtgUbRZ
         CXvFwrhx4TSnPhFw55pNZ6xWesH8LjcxhDZO0NhjUZTdxcvT+RpWAzoM4/jGu2B0q5tk
         /I/pHGwKwNVH2RwjTKwgErGoTTCaIjIwQrLjMJ9dFdAxHmyARJk5TfqE0oiSCE+xdRHY
         1WUCaoAVdW+sIheYNBjlyzTjOjC0Dx3a04IOVFFFmsPO7YnLXS0GrYyv04jt8A2sTol5
         kr6Wzma81tOJhTbplRq6UnjhD8F4ZAK7Y2VDE0Il3bseVJZY1BU9kmME6eOCZQ2qGZFR
         sSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684316022; x=1686908022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZP05VBsRBTnZPUQDMha8VxgfVkr0tg5YgvQMaq3VYA=;
        b=ewXRxHZBu7L1VOR2CCzxfzoMTHp0nQd1ZnmMJIdFSXjxMcxnxB8A/6mTZ+QGngvT6n
         RVjGJktZpYXhpdGNxm0m6OJ/yyDcrt6W7k7Zx+/NZQg/w3u5yxrFr/W+ALtdy0ngGJeO
         S8/yzpsR7n14DLN6RBD6pzT8cjbZLvUFgF35HXtdMEK5di5sQHeUSz9qqgmRJ062nrji
         on0bdesMjI5SwKt62XYE1wPP67HRqculD5yh9MeEUZijYhv0/UJWeYW+r1sCvG1C54TS
         8vgurdHUtAWGiV5dr4KPklsDkRtaC9w2KWWaixwlLQMUZb3bSDfcc772E9jm3vmUotRQ
         RlUQ==
X-Gm-Message-State: AC+VfDwAlMDBBcmpyqQMH7dwJ1XqOVOqvSLgUGWqf6vNQ9YrPcLhakwQ
        BiNEta+jb4bDI46yu47BRqPDhd7DByJo93L83w6DeQ==
X-Google-Smtp-Source: ACHHUZ5q/zWRBS78Q6k4yWV3Mh1qbcw1QL9guDD0uikNGXvaPjcLe0Aq0aLDDiyxGAu2nBIP9kLjT8g7+jMV4bVkJMw=
X-Received: by 2002:a67:fd8c:0:b0:434:7037:c7dd with SMTP id
 k12-20020a67fd8c000000b004347037c7ddmr16176876vsq.34.1684316022180; Wed, 17
 May 2023 02:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230516201642.557733-1-arnd@kernel.org>
In-Reply-To: <20230516201642.557733-1-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 17 May 2023 11:33:31 +0200
Message-ID: <CAMRc=Mdic_d3KaxFXrz7aVUcLyK8fBBHPgRGYP8nQvxN-ZwJXQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sa1100: include <mach/generic.h>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 16, 2023 at 10:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> sa1100_init_gpio() is declared in a machine specific header so it
> can be called from platform code, but the definition is in the device
> driver, which causes a warning:
>
> drivers/gpio/gpio-sa1100.c:310:13: error: no previous prototype for 'sa11=
00_init_gpio' [-Werror=3Dmissing-prototypes]
>
> It's already possible to include mach/generic.h from drivers, so add
> this one here as well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpio/gpio-sa1100.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
> index 342a59ea489a..3b1cc8462fcb 100644
> --- a/drivers/gpio/gpio-sa1100.c
> +++ b/drivers/gpio/gpio-sa1100.c
> @@ -13,6 +13,7 @@
>  #include <mach/hardware.h>
>  #include <mach/regs-gpio.h>

This doesn't apply on top of my branch (neither on next) because of
this line. I can't see where this was added. Any hint?

Bart

>  #include <mach/irqs.h>
> +#include <mach/generic.h>
>
>  struct sa1100_gpio_chip {
>         struct gpio_chip chip;
> --
> 2.39.2
>
