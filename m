Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 982C9107EF3
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2019 15:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfKWOuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Nov 2019 09:50:37 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:39118 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfKWOuh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Nov 2019 09:50:37 -0500
Received: by mail-io1-f65.google.com with SMTP id k1so11313608ioj.6
        for <linux-gpio@vger.kernel.org>; Sat, 23 Nov 2019 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gSDOa44+Q5Ox/PydnLKOEAUIlu2QigHGWfkpO599hYU=;
        b=qeTuh9gZ8cFDbtDm+hxVDHGw+uf0yCgrGsXfXsAe1uyRynrCxBbcUGnglYxA0qnXX/
         aqR6x48z9sB1lGy1c/F8+oQAu3kpJvwK2VKvD+6WtjuchnjmhugISKLkGXGHhXTGn9Bk
         LeikztS3YRqpr+y2SiMzAJhPA2geFWe3fFo7HrRBFOVLTRU7q6XyTlUw3fmpjfRBxZIz
         mcT/UwNnlI6xEkr9X9FkrmKrg/BulbMZIHa8bLs3cCMsPUEQJScd+w8xuH/JDj0hvwGJ
         Vp4RRNkgW9mI8pfJEpIxWNGnNtKCt3AX+egPLaE0H/b+IqIkleSAnnvbx5htmIvRQ9ly
         O2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gSDOa44+Q5Ox/PydnLKOEAUIlu2QigHGWfkpO599hYU=;
        b=d3VaT3SV2witEYK6RUk+NWjiJIOUUHXlX2VNwAIj4d9IvdalN5Q6YAQEZdFvGE4mMi
         3hyYoFFf9XRlTVW8Lv7SlrC0Sl5UHCxYluUQhePOoE63cTXG06ijyLNhXoZ6D44UpFGI
         lu+zgJ+6EeajLaJyHalcJndp3Vnq3b4exPdsRY0a4TVS87FNoNXH0hJ9M6WPKhTueqew
         Nb0l8WtUi1CIMzn004jjT3nP0b9QHE8ZEee4AgPXS4e3xhP70FS8+2kfteVtKPYs4BXt
         k0bhkBFV1hzqquMJWOgsWlzAxKBmOGTqPZp6EU4ir30L4sVZe3AHsFFKsUdSd025kwNm
         JprQ==
X-Gm-Message-State: APjAAAUKCBXO8mK8jjpv1a8aDzLnFbPi8tyZXlMi5BjzhnNbGm1vFv03
        fqJzE1/IOPksREX8FuFo86y85Sr1cXcIiiIYkmiz7uN5
X-Google-Smtp-Source: APXvYqxFySdBUxCOZRcUucbs4yW9KNfxJy2njLBGQYm5oncTUQL493/lZyDZKKV7ChEeo+bEQSS4dJKD31NK5tr9/VI=
X-Received: by 2002:a6b:ef0d:: with SMTP id k13mr17563886ioh.220.1574520634798;
 Sat, 23 Nov 2019 06:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20191122103512.12173-1-brgl@bgdev.pl>
In-Reply-To: <20191122103512.12173-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 23 Nov 2019 15:50:23 +0100
Message-ID: <CAMRc=MfZHZpb9xAxBk_XmwidmudvcfGkvq7a9DCA=SGy8gmQ5Q@mail.gmail.com>
Subject: Re: [PATCH v2] core: deprecate gpiod_needs_update()
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 22 lis 2019 o 11:35 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This function and the logic behind have been introduced in an early
> version of libgpiod for reasons that have been long forgotten.
>
> When updating the line info after a line request fails, just propagate
> the error out of the request function instead of setting the internal
> needs_update variable. Drop the entire logic behind gpiod_needs_update(),
> make this routine always return false and mark it as deprecated in the
> header.
>
> Suggested-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v1 -> v2:
> - made the documentation of gpiod_line_update() clearer
>
>  include/gpiod.h    | 39 +++++++++++++++++----------------------
>  lib/core.c         | 30 ++++++++++++++----------------
>  tests/tests-line.c |  2 --
>  3 files changed, 31 insertions(+), 40 deletions(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 6dfa18a..3fc1c0c 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -725,37 +725,32 @@ bool gpiod_line_is_open_source(struct gpiod_line *l=
ine) GPIOD_API;
>  /**
>   * @brief Re-read the line info.
>   * @param line GPIO line object.
> - * @return 0 is the operation succeeds. In case of an error this routine
> + * @return 0 if the operation succeeds. In case of an error this routine
>   *         returns -1 and sets the last error number.
>   *
>   * The line info is initially retrieved from the kernel by
> - * gpiod_chip_get_line(). Users can use this line to manually re-read th=
e line
> - * info.
> + * gpiod_chip_get_line() and is later re-read after every successful req=
uest.
> + * Users can use this function to manually re-read the line info when ne=
eded.
> + *
> + * We currently have no mechanism provided by the kernel for keeping the=
 line
> + * info synchronized and for the sake of speed and simplicity of this lo=
w-level
> + * library we don't want to re-read the line info automatically everytim=
e
> + * a property is retrieved. Any daemon using this library must track the=
 state
> + * of lines on its own and call this routine if needed.
> + *
> + * The state of requested lines is kept synchronized (or rather cannot b=
e
> + * changed by external agents while the ownership of the line is taken) =
so
> + * there's no need to call this function in that case.
>   */
>  int gpiod_line_update(struct gpiod_line *line) GPIOD_API;
>
>  /**
>   * @brief Check if the line info needs to be updated.
>   * @param line GPIO line object.
> - * @return Returns false if the line is up-to-date. True otherwise.
> - *
> - * The line is updated by calling gpiod_line_update() from within
> - * gpiod_chip_get_line() and on every line request/release. However: an =
error
> - * returned from gpiod_line_update() only breaks the execution of the fo=
rmer.
> - * The request/release routines only set the internal needs_update flag =
to true
> - * and continue their execution. This routine allows to check if a line =
info
> - * update failed at some point and we should call gpiod_line_update()
> - * explicitly.
> - *
> - * This routine will not indicate any potential changes introduced by ex=
ternal
> - * actors (such as a different process requesting the line). We currentl=
y have
> - * no mechanism provided by the kernel for that and for the sake of spee=
d and
> - * simplicity of this low-level library we don't want to re-read the lin=
e info
> - * automatically everytime a property is retrieved. Any daemon using thi=
s
> - * library must track the state of lines on its own and call
> - * ::gpiod_line_update if needed.
> - */
> -bool gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API;
> + * @return Deprecated and no longer functional - always returns false.
> + */
> +bool
> +gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API GPIOD_DEPRECA=
TED;
>
>  /**
>   * @}
> diff --git a/lib/core.c b/lib/core.c
> index d79e52e..a21918c 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -41,7 +41,6 @@ struct gpiod_line {
>         bool open_drain;
>
>         int state;
> -       bool needs_update;
>
>         struct gpiod_chip *chip;
>         struct line_fd_handle *fd_handle;
> @@ -320,15 +319,6 @@ static int line_get_fd(struct gpiod_line *line)
>         return line->fd_handle->fd;
>  }
>
> -static void line_maybe_update(struct gpiod_line *line)
> -{
> -       int rv;
> -
> -       rv =3D gpiod_line_update(line);
> -       if (rv < 0)
> -               line->needs_update =3D true;
> -}
> -
>  struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line)
>  {
>         return line->chip;
> @@ -374,9 +364,9 @@ bool gpiod_line_is_open_source(struct gpiod_line *lin=
e)
>         return line->open_source;
>  }
>
> -bool gpiod_line_needs_update(struct gpiod_line *line)
> +bool gpiod_line_needs_update(struct gpiod_line *line GPIOD_UNUSED)
>  {
> -       return line->needs_update;
> +       return false;
>  }
>
>  int gpiod_line_update(struct gpiod_line *line)
> @@ -405,8 +395,6 @@ int gpiod_line_update(struct gpiod_line *line)
>         strncpy(line->name, info.name, sizeof(line->name));
>         strncpy(line->consumer, info.consumer, sizeof(line->consumer));
>
> -       line->needs_update =3D false;
> -
>         return 0;
>  }
>
> @@ -537,7 +525,12 @@ static int line_request_values(struct gpiod_line_bul=
k *bulk,
>         gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
>                 line->state =3D LINE_REQUESTED_VALUES;
>                 line_set_fd(line, line_fd);
> -               line_maybe_update(line);
> +
> +               rv =3D gpiod_line_update(line);
> +               if (rv) {
> +                       gpiod_line_release_bulk(bulk);
> +                       return rv;
> +               }
>         }
>
>         return 0;
> @@ -577,7 +570,12 @@ static int line_request_event_single(struct gpiod_li=
ne *line,
>
>         line->state =3D LINE_REQUESTED_EVENTS;
>         line_set_fd(line, line_fd);
> -       line_maybe_update(line);
> +
> +       rv =3D gpiod_line_update(line);
> +       if (rv) {
> +               gpiod_line_release(line);
> +               return rv;
> +       }
>
>         return 0;
>  }
> diff --git a/tests/tests-line.c b/tests/tests-line.c
> index 8411132..205c622 100644
> --- a/tests/tests-line.c
> +++ b/tests/tests-line.c
> @@ -78,7 +78,6 @@ GPIOD_TEST_CASE(consumer, 0, { 8 })
>
>         ret =3D gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
>         g_assert_cmpint(ret, =3D=3D, 0);
> -       g_assert_false(gpiod_line_needs_update(line));
>         g_assert_cmpstr(gpiod_line_consumer(line), =3D=3D, GPIOD_TEST_CON=
SUMER);
>  }
>
> @@ -101,7 +100,6 @@ GPIOD_TEST_CASE(consumer_long_string, 0, { 8 })
>         ret =3D gpiod_line_request_input(line,
>                         "consumer string over 32 characters long");
>         g_assert_cmpint(ret, =3D=3D, 0);
> -       g_assert_false(gpiod_line_needs_update(line));
>         g_assert_cmpstr(gpiod_line_consumer(line), =3D=3D,
>                         "consumer string over 32 charact");
>         g_assert_cmpuint(strlen(gpiod_line_consumer(line)), =3D=3D, 31);
> --
> 2.23.0
>

Seems I missed the [libgpiod] tag. Anyway - patch applied.

Kent: hopefully it won't be too much work for you to rebase on top of
current master. Otherwise I can probably fix the patches up myself.

Bart
