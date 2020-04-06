Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8475D19F0B3
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2020 09:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgDFHXo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Apr 2020 03:23:44 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:33197 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgDFHXo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Apr 2020 03:23:44 -0400
Received: by mail-qt1-f196.google.com with SMTP id c14so12116632qtp.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2020 00:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=twcs6P15/Fo4o9uxF8ZeMANmA7O7+QirDH77UvEkdNY=;
        b=o+jZxOMoHuYclJ1FTlfi0KCwn/21N+FIpHruHJB/qjShYbrIhaWA1owzxdVgO/EEQS
         OA4APKEYM80ZvCDw6O9Xdy5WUOTsRlAVb03ClePS6UZI7CAjdrL7fhmbjQ/zWSFdSygX
         O4IICNbnGXXC3QESx1vpiT751DfxZjazDqMiUH9oT8XZOt6D7ENjp+Z12SUv0nBP5ybw
         a89ujVocHeyKbBGkt3/f8qscKoG/BJzAQ3DSFwtvDp6endkLXbDRki6L2aQ69/E8lkK2
         XQ2C5/jG6e6FBhUFg2SMYmDGm07L7u8ow22jW9wywYAqPEahnof6NTq6GSni1Pnnc1gP
         xEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=twcs6P15/Fo4o9uxF8ZeMANmA7O7+QirDH77UvEkdNY=;
        b=fB92HTwuJ3Y4DE6HnGX5vn5AvaVghCbz6XDCejaLf9TH/aWQxo2dfHRKGdeNAhlSbF
         Rdo3G+aINsLJyaNAuURlET3z+tpySs7t5f0YNsAUQMSEdr1MuyY6DLTzSqIJVbrGlAE/
         2a3dCGy4bcH9H8cMiFOWzLZS3wtykHOtonswSIbEgs/a/Zv1b87bxY6/U/XYmirys7Vp
         6m5MZ99/b9luOXgjgNCN4JP4EHupwnWcqPm3LpflZWPAIix7HqK1DmRUCmZQVmbo96Cv
         /LYaRBwYi3fHEfYwby6mevPyFWGTa7/i9i8eJDckOVuKTXhY086CK+f6vljSBwiuRzyl
         pqnw==
X-Gm-Message-State: AGi0PuZxL0zHXU9+EDsMGHuvDNPP4L7dc9LzWayeLbBAqbwX6ewsvVbM
        sa5d6vQhkVAAMWXgrdfvBKZNBnygUU9+5KureeDp9g==
X-Google-Smtp-Source: APiQypK6/jiHkJMHWPay2/C7yVkdF6yl9UNO9NdzFaerCL+9Cg43hkSBb5zX+a57m2WI75RUy4AePv4ywvdpgGFIZEg=
X-Received: by 2002:ac8:70d6:: with SMTP id g22mr4887922qtp.27.1586157821656;
 Mon, 06 Apr 2020 00:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200402201859.35832-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200402201859.35832-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 6 Apr 2020 09:23:30 +0200
Message-ID: <CAMpxmJVxQFUBkvQ8aDiybRab_xk+xy2GBgz0g=A6TVEDanRTfw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: pch: Use BIT() and GENMASK() where it's appropriate
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 2 kwi 2020 o 22:19 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> Use BIT() and GENMASK() where it's appropriate.
> At the same time drop it where it's not appropriate.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-pch.c | 43 +++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
> index 3f3d9a94b709..0b5aea0b1e8a 100644
> --- a/drivers/gpio/gpio-pch.c
> +++ b/drivers/gpio/gpio-pch.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (C) 2011 LAPIS Semiconductor Co., Ltd.
>   */
> +#include <linux/bits.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> @@ -11,11 +12,11 @@
>  #include <linux/slab.h>
>
>  #define PCH_EDGE_FALLING       0
> -#define PCH_EDGE_RISING                BIT(0)
> -#define PCH_LEVEL_L            BIT(1)
> -#define PCH_LEVEL_H            (BIT(0) | BIT(1))
> +#define PCH_EDGE_RISING                1
> +#define PCH_LEVEL_L            2
> +#define PCH_LEVEL_H            3

If these define bitmask values for some fields in registers, then I'd
suggest to write it as hex numbers. I find it much more readable this
way.

Bart
