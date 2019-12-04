Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA9161137C8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 23:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbfLDWmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 17:42:53 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39325 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDWmw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 17:42:52 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so562874pfx.6;
        Wed, 04 Dec 2019 14:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pF5bjopQFQ3A+SmApS9xhaC/5lZoT7rSCk2k4/K0fE4=;
        b=Q7CxIZRtAxRwNYXgAnY2x8ZSABqYYcEYAir0rRuMfUunI+Fxerl//0q8FcT1DVmfjn
         XzXlJHh5j9uevlTyhz8h7q0o/RYfQjR0ZjoUo1D/1KGJJTkieQNF5JZ4NqchzW7b0e5o
         qcz616/VCrszZCijm1L7szNpT5eayAgJDHDiTgul0LaYivT7+p5yYoaZAhQSSY8UL+VK
         dakBEb/CPTPdW4tJVWL77/zTSxlTzK6E7k+j7lqiksgGkRFYf8y5NXzocpls2ycBrtWl
         XM37VPKiRXfJW9osEbPEDJKsDKQKdFjQuH40qCYHeXzudpIzHdVg84WYRO24o04dPWeK
         fS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pF5bjopQFQ3A+SmApS9xhaC/5lZoT7rSCk2k4/K0fE4=;
        b=gfr8SyQ6eryTJiXeTI3RsVZ3ymNKNsL8U3wwJxBlBN0EwOWder0msdmdpQODlZ5/br
         YEW+OZYM5PNchoY5SBEY/EpBD7OCPck5iu6memrdsAIdpLtCYHDGXJpdu6EJJB65US3l
         117Q9GBWNKp+wAXgDlB1Df8DjEwNcjO5PSpIXnOE/suMglT2qagRQLYji7AfRedxg8e7
         gX/oRleLnR9seubuHieZnuE/xrnkSAQC9TV4vOZzRVdieIPEGQ5QvjtMP5S4yqPoG+XP
         RqpPln6/pk1ZYLuWFcekAkVG5VjF4WRzLTert+z0I5pcYbufmPq+oS/h5lILsaX6ohgv
         WLTA==
X-Gm-Message-State: APjAAAWbiatoC5da41dZNRCmE0hkCn6m76UEH6s3qQdwPi7pzctqbVyw
        kOye8bjSmiQRX1Ohae0emKM/PYGb2WCubev8rYs=
X-Google-Smtp-Source: APXvYqymNpUaoVnbcqpxgLX98vJUDKoclbK7ri5vX4NtbmNr3chcTbHAfQl60OLoWW3pvhXgQw4moYc5eOJhW+lBB58=
X-Received: by 2002:a63:e14a:: with SMTP id h10mr5900277pgk.74.1575499371944;
 Wed, 04 Dec 2019 14:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <20191204155941.17814-2-brgl@bgdev.pl>
In-Reply-To: <20191204155941.17814-2-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 00:42:39 +0200
Message-ID: <CAHp75VcqYsKUzxGUhn8aHg_u-B=FkqmTU2YS+yyVNfAPu+715w@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] tools: gpio: implement gpio-watch
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 7:19 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Add a simple program that allows to test the new LINECHANGED_FD ioctl().

> --- a/tools/gpio/.gitignore
> +++ b/tools/gpio/.gitignore
> @@ -1,4 +1,5 @@
>  gpio-event-mon
>  gpio-hammer
>  lsgpio
> +gpio-watch

Perhaps keep it sorted?

> +++ b/tools/gpio/gpio-watch.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * gpio-watch - monitor unrequested lines for property changes using the
> + *              character device
> + *
> + * Copyright (C) 2019 BayLibre SAS
> + * Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> + */
> +
> +#include <ctype.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <linux/gpio.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <unistd.h>
> +
> +static bool isnumber(const char *str)
> +{
> +       size_t sz = strlen(str);
> +       int i;
> +
> +       for (i = 0; i < sz; i++) {
> +               if (!isdigit(str[i]))
> +                       return false;
> +       }
> +
> +       return true;
> +}

strtoul() will do the same.

char *p;
unsigned long dummy; // do we need it?
dummy = strtoul(..., &p);
return *p == '\0';

> +int main(int argc, char **argv)
> +{
> +       struct gpioline_info_changed chg;
> +       struct gpioline_info req;
> +       struct pollfd pfd;
> +       int fd, i, j, ret;
> +       char *event;
> +       ssize_t rd;
> +
> +       if (argc < 3)
> +               goto err_usage;
> +
> +       fd = open(argv[1], O_RDWR | O_CLOEXEC);
> +       if (fd < 0) {
> +               perror("unable to open gpiochip");
> +               return EXIT_FAILURE;
> +       }
> +
> +       for (i = 0, j = 2; i < argc - 2; i++, j++) {
> +               if (!isnumber(argv[j]))
> +                       goto err_usage;
> +
> +               memset(&req, 0, sizeof(req));
> +               req.line_offset = atoi(argv[j]);

Oh, why not to call strtoul() directly?

> +
> +               ret = ioctl(fd, GPIO_GET_LINEINFO_WATCH_IOCTL, &req);
> +               if (ret) {
> +                       perror("unable to set up line watch");

Don't you need to unwatch previously added ones?

> +                       return EXIT_FAILURE;
> +               }
> +       }

> +       for (;;) {
> +               ret = poll(&pfd, 1, 5000);
> +               if (ret < 0) {
> +                       perror("error polling the linechanged fd");
> +                       return EXIT_FAILURE;
> +               } else if (ret > 0) {
> +                       memset(&chg, 0, sizeof(chg));

> +                       rd = read(pfd.fd, &chg, sizeof(chg));
> +                       if (rd < 0 || rd != sizeof(chg)) {
> +                               if (rd != sizeof(chg))
> +                                       errno = EIO;
> +
> +                               perror("error reading line change event");
> +                               return EXIT_FAILURE;
> +                       }

Shouldn't we handle the -EINTR?

> +               }
> +       }
> +
> +       return 0;


-- 
With Best Regards,
Andy Shevchenko
