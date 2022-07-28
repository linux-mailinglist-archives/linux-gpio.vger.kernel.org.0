Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA6C58404D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jul 2022 15:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiG1Nsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jul 2022 09:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiG1Nsc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jul 2022 09:48:32 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934E562A6A
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 06:48:29 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sz17so3244723ejc.9
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r+1TBu687nWQgnDLvnkVse0tVKy5rmaUjY9l5bul1bw=;
        b=mnYFb6Z0gowla85/6p8edOEMndatPD9pHHbUPzZ2s4k7oY8QU0bfnxMTqkBA21e7M9
         c2HgrfohogAzB8QnNIq1ZBa+YhuniXejTt3Dfv81dER5eYLZmVwEQrMljZ9MCdmcrPli
         72ZDcJm/ZLjMZLjDuDPbGuADQBUOXTGa1k1U/e5l5wZH7KDrYiF0tpU6RiVcUoQ/oseb
         MSZxyLJyqwlLnLmgeUaG5sEuziiKXyUpMyhDW8hAvdM5efY6/7saWadMWNdWSuNsJmFU
         Zjzsop40EXqXk3c8H7uinr3UkW9fd93I6Vyzm974gVlTX2/4xP7gUmiGBGeGN/4RBJXN
         WIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r+1TBu687nWQgnDLvnkVse0tVKy5rmaUjY9l5bul1bw=;
        b=iheLVZjQQ5wDBKxIfW8+Q5igkvolquZG9ghNMACT7nGmkloUf61psL5R3bZxwcvhrz
         u2wh5MEVy/jOjyKv+8767+Aieva14zJ5ABX6ooOSwtI08gbgc9smwpKUK1lc6mcanR/e
         s2JZjYnYMjcl7/qb6rUmGwmhYWq6CofrXor6noUBgQ9OVvSsLGIF2BJhacEqiMTcBbBc
         rIUgVXehad/N6KAZeYETyPdpknAH7R8YZlPuXoKJVKMWaorl8GOKAI1toksWY1iB4Ypf
         Dgtzes/9hyST/pDh/cqThpZ29XkZTNK2EilyWqgpjLaweIqHMJMFuM5CpAP0NAtIY/aO
         a7KA==
X-Gm-Message-State: AJIora9q7lJaUcHRFpVUCmIBBZM3VtVdZKt3+0emLU6EOoRuGhvsr1e8
        1p2jCqNpRjQkOgqSHBiQsWeawRvz5puz5wZVr8MOfkdG58Y=
X-Google-Smtp-Source: AGRyM1sF5rXxF3KvP5Js0FEK0zzhguPLYc3HGt8R2vajyLSw++pPaBZPBHljYOhtWkFFGphjXk99ORezR9cjYgIjEg8=
X-Received: by 2002:a17:907:9482:b0:72b:8c16:dac0 with SMTP id
 dm2-20020a170907948200b0072b8c16dac0mr18130555ejc.286.1659016107934; Thu, 28
 Jul 2022 06:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220726091448.81746-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220726091448.81746-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 28 Jul 2022 15:48:17 +0200
Message-ID: <CAMRc=MepfRwCvkos5yqQMHk0m=yXXqSv3O+nYWW0x6MuKE=t4Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: 74xx-mmio: Use bits instead of plain numbers
 for flags
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 26, 2022 at 11:14 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The initial code was misleading to use bitwise AND against plain number,
> and the commit d3054ba1db62 ("gpio: 74xx-mmio: Check MMIO_74XX_DIR_IN flag
> in mmio_74xx_dir_in()") missed that. Switch definitions to be defined bits
> for the correct comparison.
>
> Fixes: d3054ba1db62 ("gpio: 74xx-mmio: Check MMIO_74XX_DIR_IN flag in mmio_74xx_dir_in()")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-74xx-mmio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
> index cd399898ed12..0464f1ecd20d 100644
> --- a/drivers/gpio/gpio-74xx-mmio.c
> +++ b/drivers/gpio/gpio-74xx-mmio.c
> @@ -13,8 +13,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>
> -#define MMIO_74XX_DIR_IN       (0 << 8)
> -#define MMIO_74XX_DIR_OUT      (1 << 8)
> +#define MMIO_74XX_DIR_IN       BIT(8)
> +#define MMIO_74XX_DIR_OUT      BIT(9)
>  #define MMIO_74XX_BIT_CNT(x)   ((x) & GENMASK(7, 0))
>
>  struct mmio_74xx_gpio_priv {
> --
> 2.35.1
>

Applied, thanks!

Bart
