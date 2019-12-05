Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5BD113E81
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 10:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbfLEJsx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 04:48:53 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:45700 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfLEJsw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 04:48:52 -0500
Received: by mail-io1-f65.google.com with SMTP id i11so2885857ioi.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2019 01:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uETehSid0KbgkrMqALuI9xpJZ+8tQuqfj+BUwHEHAkU=;
        b=Lt3QshLyBDNGtHfxD8XyRrfuTO5PvedlequdU0OKg3+cNK1MbXUhvdxLtH1BWOymU/
         8p09ygPx3hl6x39mAaM2p2zTkHERx7E+gBOU8q8FkO9aZ9TGhGENt9UvziTKPNvt7hDe
         x1wh/WquvPJvYiSrgqO11EN5flIVkCyyHmLY6HEsA7Cs/4uiWz39vf21T9nSXedbOjIj
         oKEK8mqPKPR53mi7dXBocsDm0L6/XCy17RFxZD3HmQ+URVPZis8M7dfBVWb9q6Gh4L2d
         t1QHBp5OxFWvE+u7qoVTMCTl9v2ZWwJQlr1nmFxzLrspoHm9Nq+LocYo+u2LDRlfHnUT
         XPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uETehSid0KbgkrMqALuI9xpJZ+8tQuqfj+BUwHEHAkU=;
        b=LhA9RUrzzgvlNgebnj9D+lgbsBXpDpqEVN2iBjPP3Mwuc14SvFdk6qPogZgUcSXmG4
         iCMh7HpOhK+g677Ew/P3z24qn/qhH2ScLA2vyD42AzswyR4NX7ipXUDsAYXjTKhHsvau
         Ihc30UUzVkxFq055Pp4pXwdaq3mSacWh/1+ngrXDoyOltybcnK8y0xCwkEWlCiivlD00
         sztbJr9vIUW3F+Kd3Zn3lnvceZcjT0BOphZ9bJNXri2/k81dAAdOL0ye2Xogz+GSLKkx
         jlhrlJGmlISRWy3X1tjugNH81Y9Xf1l56378uxqTcViWJqkNTS8DXcupdO1cpRftP0Rm
         yL6A==
X-Gm-Message-State: APjAAAUvEo/ChjdksXbaSXgZYUReIl3y3uOtH6wJTZK1+QsM2OFlIEzd
        vU4pFCrnqDBelfD01X6jfUEhuQfVmk4YP9Yxy+TG6Q==
X-Google-Smtp-Source: APXvYqwuSdBxkw7QMwW/k06DWq9pdxGmWL6HmYR6bBcgQjcroGUDE5/pbI9BZQpy7u1azgf7Ugyv1UX3dUn08qxbl5w=
X-Received: by 2002:a5d:9dd9:: with SMTP id 25mr5741439ioo.287.1575539331814;
 Thu, 05 Dec 2019 01:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <20191204155941.17814-2-brgl@bgdev.pl>
 <20191205094408.GA9303@sol>
In-Reply-To: <20191205094408.GA9303@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Dec 2019 10:48:40 +0100
Message-ID: <CAMRc=Md8sm0WqN+PjR1yjh+MHPn0YM-3KbDfkOj3VE7qQa42QA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] tools: gpio: implement gpio-watch
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 5 gru 2019 o 10:44 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Wed, Dec 04, 2019 at 04:59:41PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Add a simple program that allows to test the new LINECHANGED_FD ioctl()=
.
> >
>
> A minor nit - the ioctl has since been changed to LINEINFO_WATCH.

Will fix, thanks.

>
> Do you have anything else to test the ioctls?
> Either way, I'll try to find some time to add some to my gpiod library.
>

The time I can spend on this is limited, so I decided to go with the
kernel API first with a simple user-space test in the kernel source.
Once we agree upon it, I'll add support for this to libgpiod. The
user-space part would then probably be merged after v5.6-rc1 is tagged
and it leaves us 7 weeks to fix any bugs.

This is what I plan on doing with your series too. I hope to merge it
next week and then we can fix any potential bugs and do a libgpiod
release simultaneous with linux v5.5.

Bart

> Kent.
>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  tools/gpio/.gitignore   |   1 +
> >  tools/gpio/Build        |   1 +
> >  tools/gpio/Makefile     |  11 +++-
> >  tools/gpio/gpio-watch.c | 112 ++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 124 insertions(+), 1 deletion(-)
> >  create mode 100644 tools/gpio/gpio-watch.c
> >
> > diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
> > index a94c0e83b209..fffd32969d62 100644
> > --- a/tools/gpio/.gitignore
> > +++ b/tools/gpio/.gitignore
> > @@ -1,4 +1,5 @@
> >  gpio-event-mon
> >  gpio-hammer
> >  lsgpio
> > +gpio-watch
> >  include/linux/gpio.h
> > diff --git a/tools/gpio/Build b/tools/gpio/Build
> > index 4141f35837db..67c7b7f6a717 100644
> > --- a/tools/gpio/Build
> > +++ b/tools/gpio/Build
> > @@ -2,3 +2,4 @@ gpio-utils-y +=3D gpio-utils.o
> >  lsgpio-y +=3D lsgpio.o gpio-utils.o
> >  gpio-hammer-y +=3D gpio-hammer.o gpio-utils.o
> >  gpio-event-mon-y +=3D gpio-event-mon.o gpio-utils.o
> > +gpio-watch-y +=3D gpio-watch.o
> > diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
> > index 6080de58861f..842287e42c83 100644
> > --- a/tools/gpio/Makefile
> > +++ b/tools/gpio/Makefile
> > @@ -18,7 +18,7 @@ MAKEFLAGS +=3D -r
> >
> >  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
> >
> > -ALL_TARGETS :=3D lsgpio gpio-hammer gpio-event-mon
> > +ALL_TARGETS :=3D lsgpio gpio-hammer gpio-event-mon gpio-watch
> >  ALL_PROGRAMS :=3D $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
> >
> >  all: $(ALL_PROGRAMS)
> > @@ -66,6 +66,15 @@ $(GPIO_EVENT_MON_IN): prepare FORCE $(OUTPUT)gpio-ut=
ils-in.o
> >  $(OUTPUT)gpio-event-mon: $(GPIO_EVENT_MON_IN)
> >       $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> >
> > +#
> > +# gpio-watch
> > +#
> > +GPIO_WATCH_IN :=3D $(OUTPUT)gpio-watch-in.o
> > +$(GPIO_WATCH_IN): prepare FORCE
> > +     $(Q)$(MAKE) $(build)=3Dgpio-watch
> > +$(OUTPUT)gpio-watch: $(GPIO_WATCH_IN)
> > +     $(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> > +
> >  clean:
> >       rm -f $(ALL_PROGRAMS)
> >       rm -f $(OUTPUT)include/linux/gpio.h
> > diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
> > new file mode 100644
> > index 000000000000..69aee43655ae
> > --- /dev/null
> > +++ b/tools/gpio/gpio-watch.c
> > @@ -0,0 +1,112 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * gpio-watch - monitor unrequested lines for property changes using t=
he
> > + *              character device
> > + *
> > + * Copyright (C) 2019 BayLibre SAS
> > + * Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > + */
> > +
> > +#include <ctype.h>
> > +#include <errno.h>
> > +#include <fcntl.h>
> > +#include <linux/gpio.h>
> > +#include <poll.h>
> > +#include <stdbool.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <sys/ioctl.h>
> > +#include <unistd.h>
> > +
> > +static bool isnumber(const char *str)
> > +{
> > +     size_t sz =3D strlen(str);
> > +     int i;
> > +
> > +     for (i =3D 0; i < sz; i++) {
> > +             if (!isdigit(str[i]))
> > +                     return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +     struct gpioline_info_changed chg;
> > +     struct gpioline_info req;
> > +     struct pollfd pfd;
> > +     int fd, i, j, ret;
> > +     char *event;
> > +     ssize_t rd;
> > +
> > +     if (argc < 3)
> > +             goto err_usage;
> > +
> > +     fd =3D open(argv[1], O_RDWR | O_CLOEXEC);
> > +     if (fd < 0) {
> > +             perror("unable to open gpiochip");
> > +             return EXIT_FAILURE;
> > +     }
> > +
> > +     for (i =3D 0, j =3D 2; i < argc - 2; i++, j++) {
> > +             if (!isnumber(argv[j]))
> > +                     goto err_usage;
> > +
> > +             memset(&req, 0, sizeof(req));
> > +             req.line_offset =3D atoi(argv[j]);
> > +
> > +             ret =3D ioctl(fd, GPIO_GET_LINEINFO_WATCH_IOCTL, &req);
> > +             if (ret) {
> > +                     perror("unable to set up line watch");
> > +                     return EXIT_FAILURE;
> > +             }
> > +     }
> > +
> > +     pfd.fd =3D fd;
> > +     pfd.events =3D POLLIN | POLLPRI;
> > +
> > +     for (;;) {
> > +             ret =3D poll(&pfd, 1, 5000);
> > +             if (ret < 0) {
> > +                     perror("error polling the linechanged fd");
> > +                     return EXIT_FAILURE;
> > +             } else if (ret > 0) {
> > +                     memset(&chg, 0, sizeof(chg));
> > +                     rd =3D read(pfd.fd, &chg, sizeof(chg));
> > +                     if (rd < 0 || rd !=3D sizeof(chg)) {
> > +                             if (rd !=3D sizeof(chg))
> > +                                     errno =3D EIO;
> > +
> > +                             perror("error reading line change event")=
;
> > +                             return EXIT_FAILURE;
> > +                     }
> > +
> > +                     switch (chg.event_type) {
> > +                     case GPIOLINE_CHANGED_REQUESTED:
> > +                             event =3D "requested";
> > +                             break;
> > +                     case GPIOLINE_CHANGED_RELEASED:
> > +                             event =3D "released";
> > +                             break;
> > +                     case GPIOLINE_CHANGED_CONFIG:
> > +                             event =3D "config changed";
> > +                             break;
> > +                     default:
> > +                             fprintf(stderr,
> > +                                     "invalid event type received from=
 the kernel\n");
> > +                             return EXIT_FAILURE;
> > +                     }
> > +
> > +                     printf("line %u: %s at %llu\n",
> > +                            chg.info.line_offset, event, chg.timestamp=
);
> > +             }
> > +     }
> > +
> > +     return 0;
> > +
> > +err_usage:
> > +     printf("%s: <gpiochip> <line0> <line1> ...\n", argv[0]);
> > +     return EXIT_FAILURE;
> > +}
> > --
> > 2.23.0
> >
