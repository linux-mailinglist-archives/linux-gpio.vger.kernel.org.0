Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB3D3512B3
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 11:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhDAJsw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 05:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233841AbhDAJsk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 05:48:40 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3962CC0613E6
        for <linux-gpio@vger.kernel.org>; Thu,  1 Apr 2021 02:48:40 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id e14so759892plj.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Apr 2021 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5erOAyvwJPN2bUhm/NBgsrWlD5lVMrDpDeN1dDRK8es=;
        b=URsTW2m52dbfp1cSY5EqzUlkR+kM+SNRsJVivyzqTvgFcaE/ZTfffwZRo6BKnFNnrA
         2AQgAyULFVn3dS3BHS0RdFVOvHeooEB4mF8fq6a1AdjJkjuU0aQzSJ1JTunzBuXc4YyZ
         BZ2Kl/jUc0coGM9h+sLKSxSFcFH50rpMQUr7OB3Ucz4SQJk+Si0la8pSI75/aby4MTzg
         q9j3exEwL8G8xdZnUillq1zpKhitNjDUPGB+eJpq0AaJKDl60uiRk6ChBM937cyOaaXt
         tX5gt/fJLRDPaQ67P9G+bHx3RvuOMeSdUE8M5OgwaXjJcIRNMvyV6gCC9kFPIjwNJrED
         9VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5erOAyvwJPN2bUhm/NBgsrWlD5lVMrDpDeN1dDRK8es=;
        b=BpFHaPser0zI+8azH8PuU7zY02mQonZYhNNq0YUMZQuZrwAdI14IyTlwnHfEBP2ZdR
         O36taFOORLnbRW7khmSlvrF6zbKqejwtuR2b4+/8unNII1ygocseUbPHwvji2yz1lya6
         tU/fjyoC476I8KsGrce3+uMcss1kGBdVKzUG3O9nNLc+7Y6T0BvL1lTcl8VE2BJvkKHa
         1NwY9K5gKUM0njAY8ziUps4tN2QkFp9bWK9zmh7butWHlMliLurkh+ZAfQC7j9j5eYsV
         RJyANeeTeWqMuBluya9WgO7PkiH0xcZsHwLZOlU5QkcyqFzJugj375h1hxkGSE/q64vN
         gc/g==
X-Gm-Message-State: AOAM530JkVIO3jxFhRh2eAfCk7/nprxVLiZ0jB8h86vAU91gWFwl1vSn
        0TRSrcR+baoF34iw1azRci0GaMGl9To+HWnVULU=
X-Google-Smtp-Source: ABdhPJyRcSEVl/i5H0boH0ZNgbhMRbigeUpFj71iSe5zliXB4cMWJKLMw/vzFpfpoqkOHRR8T2rugUomZmIrt961WYU=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr8203376pjr.228.1617270519749;
 Thu, 01 Apr 2021 02:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210401091546.5509-1-brgl@bgdev.pl>
In-Reply-To: <20210401091546.5509-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Apr 2021 12:48:23 +0300
Message-ID: <CAHp75VfdTeYY2i2_kBkD2zWvOhhuzgKhkU0-bQ0ER9Bs52fFJw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: relax gpiod_is_gpiochip_device() even more
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 1, 2021 at 12:17 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Currently libgpiod requires that the GPIO chip character device be named
> 'gpiochip%u' in devfs. However it's a perfectly valid use-case to have
> the device file renamed by udev (or equivalent) to anything else.
>
> Modify gpiod_is_gpiochip_device() to check the major and minor device
> numbers first and then ensure that the device in question is associated
> with the GPIO subsystem. No longer check the name.

As long as it passes all tests and nicely handles symlinks, I'm
completely fine with it
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

P.S. /offtopic/ gentle reminder about my PR, can we proceed with it?

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  lib/core.c | 41 ++++++++---------------------------------
>  1 file changed, 8 insertions(+), 33 deletions(-)
>
> diff --git a/lib/core.c b/lib/core.c
> index c1fb8ec..32c4238 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -182,11 +182,10 @@ GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
>
>  GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
>  {
> -       char *name, *realname, *sysfsp, sysfsdev[16], devstr[16];
> +       char *realname, *sysfsp, devpath[64];
>         struct stat statbuf;
>         bool ret = false;
> -       int rv, fd;
> -       ssize_t rd;
> +       int rv;
>
>         rv = lstat(path, &statbuf);
>         if (rv)
> @@ -217,15 +216,15 @@ GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
>                 goto out_free_realname;
>         }
>
> -       /* Get the basename. */
> -       name = basename(realname);
> +       /* Is the device associated with the GPIO subsystem? */
> +       snprintf(devpath, sizeof(devpath), "/sys/dev/char/%u:%u/subsystem",
> +                major(statbuf.st_rdev), minor(statbuf.st_rdev));
>
> -       /* Do we have a corresponding sysfs attribute? */
> -       rv = asprintf(&sysfsp, "/sys/bus/gpio/devices/%s/dev", name);
> -       if (rv < 0)
> +       sysfsp = realpath(devpath, NULL);
> +       if (!sysfsp)
>                 goto out_free_realname;
>
> -       if (access(sysfsp, R_OK) != 0) {
> +       if (strcmp(sysfsp, "/sys/bus/gpio") != 0) {
>                 /*
>                  * This is a character device but not the one we're after.
>                  * Before the introduction of this function, we'd fail with
> @@ -237,30 +236,6 @@ GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
>                 goto out_free_sysfsp;
>         }
>
> -       /*
> -        * Make sure the major and minor numbers of the character device
> -        * correspond to the ones in the dev attribute in sysfs.
> -        */
> -       snprintf(devstr, sizeof(devstr), "%u:%u",
> -                major(statbuf.st_rdev), minor(statbuf.st_rdev));
> -
> -       fd = open(sysfsp, O_RDONLY);
> -       if (fd < 0)
> -               goto out_free_sysfsp;
> -
> -       memset(sysfsdev, 0, sizeof(sysfsdev));
> -       rd = read(fd, sysfsdev, sizeof(sysfsdev) - 1);
> -       close(fd);
> -       if (rd < 0)
> -               goto out_free_sysfsp;
> -
> -       rd--; /* Ignore trailing newline. */
> -       if ((size_t)rd != strlen(devstr) ||
> -           strncmp(sysfsdev, devstr, rd) != 0) {
> -               errno = ENODEV;
> -               goto out_free_sysfsp;
> -       }
> -
>         ret = true;
>
>  out_free_sysfsp:
> --
> 2.30.1
>


-- 
With Best Regards,
Andy Shevchenko
