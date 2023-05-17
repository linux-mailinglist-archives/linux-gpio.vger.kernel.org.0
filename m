Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04AF57064B8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 May 2023 11:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjEQJ4z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 May 2023 05:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjEQJ4y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2023 05:56:54 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242A344AD
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:56:51 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-44fd9584f47so233967e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684317410; x=1686909410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XPSuVta2HOg8vUR/UtRay+7le/6KZcKOQV/SsBICAQ=;
        b=xg2SrZFsIcXofYfCA/oEKWGumYVHRqt2E7GiaCt4zYD0Oo1spN4WAfYjdLySKN5cPH
         jNx9oLYtmKwyXXDchLi6waDj9wX+mshKdt+XbyjAU7y9+2wqNf8pSV9EFJ1h7C6mbjyo
         74Uz8uSQwULzZekhN914f4AEZgLj97M+LN9+YR1QrmKvDkdZNv86a2Q7KvozqCbQ214x
         2NDIyrBVCpMOuV7+0xgcYAccg+CWD9lHU2sAB5aZy+ceCNBNlNI25jaypvwQyHPNcZoh
         aLggCDng1mIU8SjvpYt9wxmZddfKA0kVhAvoBe9pHisF8KujGXCt3/LH/tHFPufYklg7
         z/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684317410; x=1686909410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XPSuVta2HOg8vUR/UtRay+7le/6KZcKOQV/SsBICAQ=;
        b=K/MWtCbk46jUBF04IwAar/3qnvfS2YVnJioFARolNLL36FFUegTvaHXcy3O5DtZruA
         l/qSQQ8+xhGLp2ryiDzHReyOBdsUWBMLTxgboxDpOBpvm02RBlwn001MOgUhCbgyTOBP
         NiF/6iXF2E2n29AxI47AVgs2AM4HVpuurrE0V3NcWyRRS7UCQw0TINifalf2BbRGUVR7
         mVdEBtkQA1H/oVl+Z+ql6r7BOUqY1cDVsMJ+PHqwstsn9I8F88IvOnsCE9jwJPq5xkI6
         br+8YlAb3NHVLs9aRYuNEeOdDGhSfY2bMWE/eKtBG3KT0ntqQ7AWVb2v9SJNSCvlBpFu
         5yCQ==
X-Gm-Message-State: AC+VfDwxFskvGXKKzIquEU0bu9u5ZCPQe4K7WtPBfbF2XnrW/VhXO0RW
        OLOCREfIZ2iBy9bS4QBuAboaToXxz8tEyiHe3WABwA==
X-Google-Smtp-Source: ACHHUZ7dirwHzYqNcWJVEqkux+QzlRUgjKDMGdkdIXhV7Xz7wEKIF4dhBqxRzz2JM//g+mgozFgPI8R4rAGnRt/XgIQ=
X-Received: by 2002:a1f:4bc4:0:b0:440:125:7e59 with SMTP id
 y187-20020a1f4bc4000000b0044001257e59mr14096028vka.1.1684317410290; Wed, 17
 May 2023 02:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230517095301.903567-1-arnd@kernel.org>
In-Reply-To: <20230517095301.903567-1-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 17 May 2023 11:56:39 +0200
Message-ID: <CAMRc=McaZQ=e18=fo1GzOmMh2nRdF3A5Z8a1ftUJhvrM3VtZOw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sa1100: include <mach/generic.h>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Wed, May 17, 2023 at 11:53=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
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
> v2: rebase back on mainline tree
> ---
>  drivers/gpio/gpio-sa1100.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
> index edff5e81489f..242dad763ac4 100644
> --- a/drivers/gpio/gpio-sa1100.c
> +++ b/drivers/gpio/gpio-sa1100.c
> @@ -12,6 +12,7 @@
>  #include <soc/sa1100/pwer.h>
>  #include <mach/hardware.h>
>  #include <mach/irqs.h>
> +#include <mach/generic.h>
>
>  struct sa1100_gpio_chip {
>         struct gpio_chip chip;
> --
> 2.39.2
>

Now applied, thanks!

Bart
