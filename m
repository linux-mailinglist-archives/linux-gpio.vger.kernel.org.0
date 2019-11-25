Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE28108F7B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbfKYOBs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:01:48 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33842 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727702AbfKYOBs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:01:48 -0500
Received: by mail-oi1-f193.google.com with SMTP id l202so13195917oig.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v4Gyie4CDy9dfQfgHiDS7neMKLJs3UeDygBnd0JYAqw=;
        b=SmaW/h2M0aNlumKZYCU3xiKWEF9NCjUSs2Ub5nEHIG/qGPBNzTDyoPZCQQpCDEWn0j
         nCsdx2V6HvtUuqTRqWrAWMbi1VyDvy2r3v7t7QABiewX1TiiWmEfyfvfjKNAcm/Vw8rA
         8j0H5qBNBGWysvU1zyrLJfyu7hum2YrU4ZKA5dkMH4vQt1D2ZV0pGhBYPLT4RTT90Jin
         y/yqVIaftlptMw4ee6jpFLbLuCASUdXjUJzoDfQVnbyiGH2hOUCseJO7XfGefpo0TE+X
         SwYhW3yiFSKomCyJSP+8DCCZaXEzsVWAAD58lmAXRGUWZEYMD9bzMtHFzpr35zD6ks3T
         QH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v4Gyie4CDy9dfQfgHiDS7neMKLJs3UeDygBnd0JYAqw=;
        b=q2+f6aksqmVi01Q5XG7mpZRio2kpQtVRO8c9NBSsTdchPs4uDJkOyNaYZ6cAU93lIf
         qeykqt2PbA7SvoiJCsCasMxmPY+KCZCRcKNoNXqRWYIP/SAwxyfPvXa1RT+YqLPhFeyg
         c4W9Ji/PwrLvExuNc5rhrFUGIhlQvGFuIY6GxXSuoCTpWvDvOFAGCw9q59Sfj/+pvHko
         lVcZjSGhzmn/BIZHZhvqTd9mLW4/M0Up/zhbMHN07odnx/E+ATtcQFijrFUP1a4CQHKN
         Z/2EBofP/GXXUpORkEvSUFi+vYIx8XtfvKICvhP9UmOlrWEiBboJY5CXl8hXlkxC0kiJ
         lXdA==
X-Gm-Message-State: APjAAAUCt8jB8zd6Zu5j5BynjqhqUqx16jvG6zi1/APVQ1vin7uG+Zx6
        78H9NjmWwhjKK7uJv6akwWRLJpKZkUiBd++PgyRTkw==
X-Google-Smtp-Source: APXvYqwifYtLAzokkzOnS23+38Q+/nCh+47NXRJ/a2VImNMR8PVRoa4CKZTH6qLeQyEjxr5pyLJ1UkkP8PR5dxly6Ks=
X-Received: by 2002:aca:d904:: with SMTP id q4mr23274146oig.21.1574690506989;
 Mon, 25 Nov 2019 06:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20191122103512.12173-1-brgl@bgdev.pl> <CAMRc=MfZHZpb9xAxBk_XmwidmudvcfGkvq7a9DCA=SGy8gmQ5Q@mail.gmail.com>
 <20191124022526.GA9031@sol>
In-Reply-To: <20191124022526.GA9031@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 Nov 2019 15:01:35 +0100
Message-ID: <CAMpxmJUWs+Q6ORt9Ng4wD4cwhaXNdfjvvZHY66a=cUFb+2xgoA@mail.gmail.com>
Subject: Re: [PATCH v2] core: deprecate gpiod_needs_update()
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 24 lis 2019 o 03:25 Kent Gibson <warthog618@gmail.com> napisa=C5=82=
(a):
>
> On Sat, Nov 23, 2019 at 03:50:23PM +0100, Bartosz Golaszewski wrote:
> > pt., 22 lis 2019 o 11:35 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > This function and the logic behind have been introduced in an early
> > > version of libgpiod for reasons that have been long forgotten.
> > >
> > > When updating the line info after a line request fails, just propagat=
e
> > > the error out of the request function instead of setting the internal
> > > needs_update variable. Drop the entire logic behind gpiod_needs_updat=
e(),
> > > make this routine always return false and mark it as deprecated in th=
e
> > > header.
> > >
> > > Suggested-by: Kent Gibson <warthog618@gmail.com>
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > > v1 -> v2:
> > > - made the documentation of gpiod_line_update() clearer
> > >
> > >  include/gpiod.h    | 39 +++++++++++++++++----------------------
> > >  lib/core.c         | 30 ++++++++++++++----------------
> > >  tests/tests-line.c |  2 --
> > >  3 files changed, 31 insertions(+), 40 deletions(-)
> > >
> > > diff --git a/include/gpiod.h b/include/gpiod.h
> > > index 6dfa18a..3fc1c0c 100644
> > > --- a/include/gpiod.h
> > > +++ b/include/gpiod.h
> > > @@ -725,37 +725,32 @@ bool gpiod_line_is_open_source(struct gpiod_lin=
e *line) GPIOD_API;
> > >  /**
> > >   * @brief Re-read the line info.
> > >   * @param line GPIO line object.
> > > - * @return 0 is the operation succeeds. In case of an error this rou=
tine
> > > + * @return 0 if the operation succeeds. In case of an error this rou=
tine
> > >   *         returns -1 and sets the last error number.
> > >   *
> > >   * The line info is initially retrieved from the kernel by
> > > - * gpiod_chip_get_line(). Users can use this line to manually re-rea=
d the line
> > > - * info.
> > > + * gpiod_chip_get_line() and is later re-read after every successful=
 request.
> > > + * Users can use this function to manually re-read the line info whe=
n needed.
> > > + *
> > > + * We currently have no mechanism provided by the kernel for keeping=
 the line
> > > + * info synchronized and for the sake of speed and simplicity of thi=
s low-level
> > > + * library we don't want to re-read the line info automatically ever=
ytime
> > > + * a property is retrieved. Any daemon using this library must track=
 the state
> > > + * of lines on its own and call this routine if needed.
> > > + *
> > > + * The state of requested lines is kept synchronized (or rather cann=
ot be
> > > + * changed by external agents while the ownership of the line is tak=
en) so
> > > + * there's no need to call this function in that case.
> > >   */
> > >  int gpiod_line_update(struct gpiod_line *line) GPIOD_API;
> > >
> > >  /**
> > >   * @brief Check if the line info needs to be updated.
> > >   * @param line GPIO line object.
> > > - * @return Returns false if the line is up-to-date. True otherwise.
> > > - *
> > > - * The line is updated by calling gpiod_line_update() from within
> > > - * gpiod_chip_get_line() and on every line request/release. However:=
 an error
> > > - * returned from gpiod_line_update() only breaks the execution of th=
e former.
> > > - * The request/release routines only set the internal needs_update f=
lag to true
> > > - * and continue their execution. This routine allows to check if a l=
ine info
> > > - * update failed at some point and we should call gpiod_line_update(=
)
> > > - * explicitly.
> > > - *
> > > - * This routine will not indicate any potential changes introduced b=
y external
> > > - * actors (such as a different process requesting the line). We curr=
ently have
> > > - * no mechanism provided by the kernel for that and for the sake of =
speed and
> > > - * simplicity of this low-level library we don't want to re-read the=
 line info
> > > - * automatically everytime a property is retrieved. Any daemon using=
 this
> > > - * library must track the state of lines on its own and call
> > > - * ::gpiod_line_update if needed.
> > > - */
> > > -bool gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API;
> > > + * @return Deprecated and no longer functional - always returns fals=
e.
> > > + */
> > > +bool
> > > +gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API GPIOD_DEP=
RECATED;
> > >
> > >  /**
> > >   * @}
> > > diff --git a/lib/core.c b/lib/core.c
> > > index d79e52e..a21918c 100644
> > > --- a/lib/core.c
> > > +++ b/lib/core.c
> > > @@ -41,7 +41,6 @@ struct gpiod_line {
> > >         bool open_drain;
> > >
> > >         int state;
> > > -       bool needs_update;
> > >
> > >         struct gpiod_chip *chip;
> > >         struct line_fd_handle *fd_handle;
> > > @@ -320,15 +319,6 @@ static int line_get_fd(struct gpiod_line *line)
> > >         return line->fd_handle->fd;
> > >  }
> > >
> > > -static void line_maybe_update(struct gpiod_line *line)
> > > -{
> > > -       int rv;
> > > -
> > > -       rv =3D gpiod_line_update(line);
> > > -       if (rv < 0)
> > > -               line->needs_update =3D true;
> > > -}
> > > -
> > >  struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line)
> > >  {
> > >         return line->chip;
> > > @@ -374,9 +364,9 @@ bool gpiod_line_is_open_source(struct gpiod_line =
*line)
> > >         return line->open_source;
> > >  }
> > >
> > > -bool gpiod_line_needs_update(struct gpiod_line *line)
> > > +bool gpiod_line_needs_update(struct gpiod_line *line GPIOD_UNUSED)
> > >  {
> > > -       return line->needs_update;
> > > +       return false;
> > >  }
> > >
> > >  int gpiod_line_update(struct gpiod_line *line)
> > > @@ -405,8 +395,6 @@ int gpiod_line_update(struct gpiod_line *line)
> > >         strncpy(line->name, info.name, sizeof(line->name));
> > >         strncpy(line->consumer, info.consumer, sizeof(line->consumer)=
);
> > >
> > > -       line->needs_update =3D false;
> > > -
> > >         return 0;
> > >  }
> > >
> > > @@ -537,7 +525,12 @@ static int line_request_values(struct gpiod_line=
_bulk *bulk,
> > >         gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
> > >                 line->state =3D LINE_REQUESTED_VALUES;
> > >                 line_set_fd(line, line_fd);
> > > -               line_maybe_update(line);
> > > +
> > > +               rv =3D gpiod_line_update(line);
> > > +               if (rv) {
> > > +                       gpiod_line_release_bulk(bulk);
> > > +                       return rv;
> > > +               }
> > >         }
> > >
> > >         return 0;
> > > @@ -577,7 +570,12 @@ static int line_request_event_single(struct gpio=
d_line *line,
> > >
> > >         line->state =3D LINE_REQUESTED_EVENTS;
> > >         line_set_fd(line, line_fd);
> > > -       line_maybe_update(line);
> > > +
> > > +       rv =3D gpiod_line_update(line);
> > > +       if (rv) {
> > > +               gpiod_line_release(line);
> > > +               return rv;
> > > +       }
> > >
> > >         return 0;
> > >  }
> > > diff --git a/tests/tests-line.c b/tests/tests-line.c
> > > index 8411132..205c622 100644
> > > --- a/tests/tests-line.c
> > > +++ b/tests/tests-line.c
> > > @@ -78,7 +78,6 @@ GPIOD_TEST_CASE(consumer, 0, { 8 })
> > >
> > >         ret =3D gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
> > >         g_assert_cmpint(ret, =3D=3D, 0);
> > > -       g_assert_false(gpiod_line_needs_update(line));
> > >         g_assert_cmpstr(gpiod_line_consumer(line), =3D=3D, GPIOD_TEST=
_CONSUMER);
> > >  }
> > >
> > > @@ -101,7 +100,6 @@ GPIOD_TEST_CASE(consumer_long_string, 0, { 8 })
> > >         ret =3D gpiod_line_request_input(line,
> > >                         "consumer string over 32 characters long");
> > >         g_assert_cmpint(ret, =3D=3D, 0);
> > > -       g_assert_false(gpiod_line_needs_update(line));
> > >         g_assert_cmpstr(gpiod_line_consumer(line), =3D=3D,
> > >                         "consumer string over 32 charact");
> > >         g_assert_cmpuint(strlen(gpiod_line_consumer(line)), =3D=3D, 3=
1);
> > > --
> > > 2.23.0
> > >
> >
> > Seems I missed the [libgpiod] tag. Anyway - patch applied.
> >
> > Kent: hopefully it won't be too much work for you to rebase on top of
> > current master. Otherwise I can probably fix the patches up myself.
> >
>
> No problem at all.  I've rebased my pre-v3 on the current master@296441,
> and made the corresponding changes to set_config and set_flags.
> Those changes are also committed to my development branch on github, if
> you want a preview.
>
> Do you want to review the v2 or should I submit the v3 as is?
>
> Cheers,
> Kent.

Please submit a v3.

Bart
