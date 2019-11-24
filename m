Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB930108171
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2019 03:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfKXCZd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Nov 2019 21:25:33 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45003 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfKXCZd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Nov 2019 21:25:33 -0500
Received: by mail-pg1-f195.google.com with SMTP id e6so5314004pgi.11
        for <linux-gpio@vger.kernel.org>; Sat, 23 Nov 2019 18:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ezvtvH2eNTxJOzNmeoDxiknEAKj2qsIPZE+yMTZeRyI=;
        b=r/pHZvMEz8tSuCgsd5YG72fc0k5AnWL7AC5MBTL2SgNJI05iTHrPzyvT6FVaJ2+V3P
         LmHt0nV2SvbBJTFVU5rCoQpB33bDmspoArn7zLwC8e8pyynUvHOVYkJleohZxMoDAgpr
         Ld+ExtTqgkFAgt4agNeQiOl8xLURheZbBr9Uffhy1W5mPwit2NuGjFwaLIfhNOfjeJyf
         54tc1LMKNVMDgOaGtnjsXzkJAeha8dRpuzuXBUYwoVDNUnbkrEX5eR9yNn7eU71nDf+b
         iVzwx03xXKYGv9FX1rX3Bxr3W2NWKw3BeKz0GX2WzsXlj+cMnvfSAHvNtuPy9cLcqy/w
         sMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ezvtvH2eNTxJOzNmeoDxiknEAKj2qsIPZE+yMTZeRyI=;
        b=IbFS025YclE5Fw7t8x1kwO88BuoTv6xof+qhxKKkdqLtFPRok6SJkWnCrjvqgt6P2W
         UC36+vskYkwSw6jj8UsHrj5U8uu1vIfXwXAYWKaNi48u8y0ikbqJphPqNQxXH5TtdGL9
         2033GsnGoKCjKgoEkzj1FTVT32mhYkaAdp4e2xefVGEGz7p2cIuVk2RmrBHNRHgRF8fI
         1iMrO/LB2Bknzzb6KUvSl3JZQLTtHvYAi7w4Hz40fJ2qORWTrScm9DPQZXEHAIoUn+d0
         8CDMERZLapbZSczFMaGUGwVa7pScXTFDq8/cqXulcGNFJpxOBh48BWZJ11rQgUp6/CqE
         HCNg==
X-Gm-Message-State: APjAAAWiYNFkhq5O7xaTuZ8PlDq1L5Dldqe8Ycj4sTBx2186l11jBTm/
        c55rOUcRvKlXMqrixoHJuBRiGmzjN04=
X-Google-Smtp-Source: APXvYqzq1bL4yBTi5zS7GwTOeUjUAoqr4bts/dRGtROsFc12W6HEFvu5E8/rBIAmODdVygtu5teYBg==
X-Received: by 2002:a63:c013:: with SMTP id h19mr24985102pgg.447.1574562332102;
        Sat, 23 Nov 2019 18:25:32 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id k10sm3225147pjs.31.2019.11.23.18.25.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Nov 2019 18:25:31 -0800 (PST)
Date:   Sun, 24 Nov 2019 10:25:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2] core: deprecate gpiod_needs_update()
Message-ID: <20191124022526.GA9031@sol>
References: <20191122103512.12173-1-brgl@bgdev.pl>
 <CAMRc=MfZHZpb9xAxBk_XmwidmudvcfGkvq7a9DCA=SGy8gmQ5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfZHZpb9xAxBk_XmwidmudvcfGkvq7a9DCA=SGy8gmQ5Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 23, 2019 at 03:50:23PM +0100, Bartosz Golaszewski wrote:
> pt., 22 lis 2019 o 11:35 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This function and the logic behind have been introduced in an early
> > version of libgpiod for reasons that have been long forgotten.
> >
> > When updating the line info after a line request fails, just propagate
> > the error out of the request function instead of setting the internal
> > needs_update variable. Drop the entire logic behind gpiod_needs_update(),
> > make this routine always return false and mark it as deprecated in the
> > header.
> >
> > Suggested-by: Kent Gibson <warthog618@gmail.com>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> > v1 -> v2:
> > - made the documentation of gpiod_line_update() clearer
> >
> >  include/gpiod.h    | 39 +++++++++++++++++----------------------
> >  lib/core.c         | 30 ++++++++++++++----------------
> >  tests/tests-line.c |  2 --
> >  3 files changed, 31 insertions(+), 40 deletions(-)
> >
> > diff --git a/include/gpiod.h b/include/gpiod.h
> > index 6dfa18a..3fc1c0c 100644
> > --- a/include/gpiod.h
> > +++ b/include/gpiod.h
> > @@ -725,37 +725,32 @@ bool gpiod_line_is_open_source(struct gpiod_line *line) GPIOD_API;
> >  /**
> >   * @brief Re-read the line info.
> >   * @param line GPIO line object.
> > - * @return 0 is the operation succeeds. In case of an error this routine
> > + * @return 0 if the operation succeeds. In case of an error this routine
> >   *         returns -1 and sets the last error number.
> >   *
> >   * The line info is initially retrieved from the kernel by
> > - * gpiod_chip_get_line(). Users can use this line to manually re-read the line
> > - * info.
> > + * gpiod_chip_get_line() and is later re-read after every successful request.
> > + * Users can use this function to manually re-read the line info when needed.
> > + *
> > + * We currently have no mechanism provided by the kernel for keeping the line
> > + * info synchronized and for the sake of speed and simplicity of this low-level
> > + * library we don't want to re-read the line info automatically everytime
> > + * a property is retrieved. Any daemon using this library must track the state
> > + * of lines on its own and call this routine if needed.
> > + *
> > + * The state of requested lines is kept synchronized (or rather cannot be
> > + * changed by external agents while the ownership of the line is taken) so
> > + * there's no need to call this function in that case.
> >   */
> >  int gpiod_line_update(struct gpiod_line *line) GPIOD_API;
> >
> >  /**
> >   * @brief Check if the line info needs to be updated.
> >   * @param line GPIO line object.
> > - * @return Returns false if the line is up-to-date. True otherwise.
> > - *
> > - * The line is updated by calling gpiod_line_update() from within
> > - * gpiod_chip_get_line() and on every line request/release. However: an error
> > - * returned from gpiod_line_update() only breaks the execution of the former.
> > - * The request/release routines only set the internal needs_update flag to true
> > - * and continue their execution. This routine allows to check if a line info
> > - * update failed at some point and we should call gpiod_line_update()
> > - * explicitly.
> > - *
> > - * This routine will not indicate any potential changes introduced by external
> > - * actors (such as a different process requesting the line). We currently have
> > - * no mechanism provided by the kernel for that and for the sake of speed and
> > - * simplicity of this low-level library we don't want to re-read the line info
> > - * automatically everytime a property is retrieved. Any daemon using this
> > - * library must track the state of lines on its own and call
> > - * ::gpiod_line_update if needed.
> > - */
> > -bool gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API;
> > + * @return Deprecated and no longer functional - always returns false.
> > + */
> > +bool
> > +gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API GPIOD_DEPRECATED;
> >
> >  /**
> >   * @}
> > diff --git a/lib/core.c b/lib/core.c
> > index d79e52e..a21918c 100644
> > --- a/lib/core.c
> > +++ b/lib/core.c
> > @@ -41,7 +41,6 @@ struct gpiod_line {
> >         bool open_drain;
> >
> >         int state;
> > -       bool needs_update;
> >
> >         struct gpiod_chip *chip;
> >         struct line_fd_handle *fd_handle;
> > @@ -320,15 +319,6 @@ static int line_get_fd(struct gpiod_line *line)
> >         return line->fd_handle->fd;
> >  }
> >
> > -static void line_maybe_update(struct gpiod_line *line)
> > -{
> > -       int rv;
> > -
> > -       rv = gpiod_line_update(line);
> > -       if (rv < 0)
> > -               line->needs_update = true;
> > -}
> > -
> >  struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line)
> >  {
> >         return line->chip;
> > @@ -374,9 +364,9 @@ bool gpiod_line_is_open_source(struct gpiod_line *line)
> >         return line->open_source;
> >  }
> >
> > -bool gpiod_line_needs_update(struct gpiod_line *line)
> > +bool gpiod_line_needs_update(struct gpiod_line *line GPIOD_UNUSED)
> >  {
> > -       return line->needs_update;
> > +       return false;
> >  }
> >
> >  int gpiod_line_update(struct gpiod_line *line)
> > @@ -405,8 +395,6 @@ int gpiod_line_update(struct gpiod_line *line)
> >         strncpy(line->name, info.name, sizeof(line->name));
> >         strncpy(line->consumer, info.consumer, sizeof(line->consumer));
> >
> > -       line->needs_update = false;
> > -
> >         return 0;
> >  }
> >
> > @@ -537,7 +525,12 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
> >         gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
> >                 line->state = LINE_REQUESTED_VALUES;
> >                 line_set_fd(line, line_fd);
> > -               line_maybe_update(line);
> > +
> > +               rv = gpiod_line_update(line);
> > +               if (rv) {
> > +                       gpiod_line_release_bulk(bulk);
> > +                       return rv;
> > +               }
> >         }
> >
> >         return 0;
> > @@ -577,7 +570,12 @@ static int line_request_event_single(struct gpiod_line *line,
> >
> >         line->state = LINE_REQUESTED_EVENTS;
> >         line_set_fd(line, line_fd);
> > -       line_maybe_update(line);
> > +
> > +       rv = gpiod_line_update(line);
> > +       if (rv) {
> > +               gpiod_line_release(line);
> > +               return rv;
> > +       }
> >
> >         return 0;
> >  }
> > diff --git a/tests/tests-line.c b/tests/tests-line.c
> > index 8411132..205c622 100644
> > --- a/tests/tests-line.c
> > +++ b/tests/tests-line.c
> > @@ -78,7 +78,6 @@ GPIOD_TEST_CASE(consumer, 0, { 8 })
> >
> >         ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
> >         g_assert_cmpint(ret, ==, 0);
> > -       g_assert_false(gpiod_line_needs_update(line));
> >         g_assert_cmpstr(gpiod_line_consumer(line), ==, GPIOD_TEST_CONSUMER);
> >  }
> >
> > @@ -101,7 +100,6 @@ GPIOD_TEST_CASE(consumer_long_string, 0, { 8 })
> >         ret = gpiod_line_request_input(line,
> >                         "consumer string over 32 characters long");
> >         g_assert_cmpint(ret, ==, 0);
> > -       g_assert_false(gpiod_line_needs_update(line));
> >         g_assert_cmpstr(gpiod_line_consumer(line), ==,
> >                         "consumer string over 32 charact");
> >         g_assert_cmpuint(strlen(gpiod_line_consumer(line)), ==, 31);
> > --
> > 2.23.0
> >
> 
> Seems I missed the [libgpiod] tag. Anyway - patch applied.
> 
> Kent: hopefully it won't be too much work for you to rebase on top of
> current master. Otherwise I can probably fix the patches up myself.
> 

No problem at all.  I've rebased my pre-v3 on the current master@296441,
and made the corresponding changes to set_config and set_flags.
Those changes are also committed to my development branch on github, if
you want a preview.

Do you want to review the v2 or should I submit the v3 as is?

Cheers,
Kent.
