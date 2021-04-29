Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13EA536EB20
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 15:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237228AbhD2NIt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 09:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237194AbhD2NIt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Apr 2021 09:08:49 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F667C06138B
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 06:08:02 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id w3so99821957ejc.4
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q2zIGHBLONCpUQrF3uOD05ZC3z2X5jUPTVQrS242f8Y=;
        b=XX++9GLeV9eLtgveGDjOBywG3+wv872Hyuq2JczMF2uI3zAqE3Aa8iMYU5Q6J5GK3g
         b/uFfBRWeI34DG1n+6FshKruu5y0hmf66jj4iRECKAiX9QQIaaIWTsT9XC5Gn6Q0GJ5u
         ViDdosL5X+XtMz4RS9RQryYiTkUhWKPdeupU9r2ZqWaBCGwkh3zvOtRmwlJsTCL4QCVo
         Z5fLtQw2pw+9Y7l7Dy/Yu9EOBiWADkxOuOUA1RosTshBzebY44UQ7fITN53LZhO9BhuS
         BlM2+biiKVgyTHDjolZzBy5x3Gl9P1uD4TxiL4YRnPhqArL3OsMTllNtT65gSEXb7jMa
         BnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q2zIGHBLONCpUQrF3uOD05ZC3z2X5jUPTVQrS242f8Y=;
        b=X+CPvhtZ692QVDI6A1Rs/65UsJsgQ9A5+c0O8p+ts7zMb8ialx80wDe9i06ATnEWB5
         UnWsqMGn6uFKUKhM/HMKbm/s3M+IZzQ3ZAkHLcvoxc19ktslwpCX6p+E24Is/uHxiJfB
         IQYQ/c5UyF6it+BIb1lBSR0A+h3GIxT2BaOU1xtGApn648hlBjpyDIie3t88USHRlcJS
         5RAed3axSkHzPzV4E8MWjqPiYs7/luaDabsEGaxspE+DcnjzcrJHaMVUXkpFCLM3B25j
         Oq95nqcLz2EfVXgc6Ekg1S+drfzc5LPKBkM2J7AsMMr3f9n5JTdVgttFPEji7B2szEe1
         OijQ==
X-Gm-Message-State: AOAM5326do9j5ebOWUxgWjpCwidOv4nKmIYS3stVvSyxWig/CKI1zFFc
        VHIufQrkMxu03XKdNN4Rmubz5y3LDPlStLaNAQlmdg==
X-Google-Smtp-Source: ABdhPJxER/ZVoASCLdl1cZOGAVT+KlPOd4sa3ZR24sowUP4cnlLu9D7BP7Rqg6/ApbC+lBzrrBzfxhBmefNxF1IzkXQ=
X-Received: by 2002:a17:907:78c4:: with SMTP id kv4mr8838473ejc.445.1619701680538;
 Thu, 29 Apr 2021 06:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210429094734.9585-1-brgl@bgdev.pl> <20210429094734.9585-3-brgl@bgdev.pl>
 <YIqXHXU/tqxXjaKA@smile.fi.intel.com>
In-Reply-To: <YIqXHXU/tqxXjaKA@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 29 Apr 2021 15:07:49 +0200
Message-ID: <CAMRc=MeKciVDxdFvq6_d8mN8M08tqDSc1qDqmywswF2gbUa=Dg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/3] libgpiosim: new library for controlling the
 gpio-sim module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 29, 2021 at 1:23 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 29, 2021 at 11:47:33AM +0200, Bartosz Golaszewski wrote:
> > Add a C library for controlling the gpio-sim kernel module from various
> > libgpiod test suites. This aims at replacing the old gpio-mockup module
> > and its user-space library - libgpio-mockup - in the project's tree.
>
> ...
>
> > +     rv = uname(&un);
> > +     if (rv)
> > +             return -1;
>
> Wondering why in all such cases instead of returning error code from upper
> layer we shadow it with -1.
>

Unlike the linux kernel - the error codes in libc are not returned as
return values of functions. Instead standard routines return -1 in
almost all error cases and set errno to indicate the error code. This
is why it's not necessary to propagate error numbers.

> ...
>
> > +GPIOSIM_API void gpiosim_ctx_unref(struct gpiosim_ctx *ctx)
> > +{
> > +     if (--ctx->refcnt == 0) {
>
>         if (--refcnt)
>                 return;
>
> ?
>

Matter of taste I suppose but whatever, I can change it.

>
> > +             close(ctx->pending_dir_fd);
> > +             close(ctx->live_dir_fd);
> > +
> > +             if (ctx->cfs_mnt_dir) {
> > +                     umount(ctx->cfs_mnt_dir);
> > +                     rmdir(ctx->cfs_mnt_dir);
> > +                     free(ctx->cfs_mnt_dir);
> > +             }
> > +
> > +             free(ctx);
> > +     }
> > +}
>
> ...
>
> > +/* We don't have mkdtempat()... :( */
>
> But we have tmpnam() / tmpnam_r(), why to reinvent it below?
>

Because of this:

$man tmpnam_r
...
The created pathname has a directory prefix P_tmpdir.
...

And this:

./stdio.h:120:# define P_tmpdir "/tmp"

> > +static char *make_random_dir_at(int at)
> > +{
> > +     static const char chars[] = "abcdefghijklmnoprstquvwxyz"
> > +                                 "ABCDEFGHIJKLMNOPRSTQUVWXYZ"
> > +                                 "0123456789";
> > +     static const unsigned int namelen = 16;
> > +
> > +     unsigned int idx, i;
> > +     char *name;
> > +     int ret;
> > +
> > +     name = malloc(namelen);
> > +     if (!name)
> > +             return NULL;
> > +
> > +again:
> > +     for (i = 0; i < namelen; i++) {
> > +             ret = getrandom(&idx, sizeof(idx), GRND_NONBLOCK);
> > +             if (ret != sizeof(idx)) {
> > +                     if (ret >= 0)
> > +                             errno = EAGAIN;
> > +
> > +                     free(name);
> > +                     return NULL;
> > +             }
> > +
> > +             name[i] = chars[idx % (GPIOSIM_ARRAY_SIZE(chars) - 1)];
> > +     }
> > +
> > +     ret = mkdirat(at, name, 0600);
> > +     if (ret) {
> > +             if (errno == EEXIST)
> > +                     goto again;
> > +
> > +             free(name);
> > +             return NULL;
> > +     }
> > +
> > +     return name;
> > +}
>
> ...
>
> > +     for (i = 0; i < num_names; i++) {
> > +             len = names[i] ? strlen(names[i]) : 0;
> > +             /* Length of the name + '"'x2 + ', '. */
>
> This x2 is  kinda hard to get on the first glance, perhaps:
>
>                 /* Length of the '"' + name + '"' + ', '. */
>
> ?
>
> > +             size += len + 4;
> > +     }
> > +
> > +     buf = malloc(size);
> > +     if (!buf)
> > +             return -1;
> > +
> > +     memset(buf, 0, size);
>
> calloc() ?
>


Nah, I prefer malloc() for single block allocs even if it needs a memset().

>
> > +     for (i = 0; i < num_names; i++)
> > +             written += snprintf(buf + written, size - written,
> > +                                 "\"%s\", ", names[i] ?: "");
> > +     buf[size - 2] = '\0';
>
> Dunno if you can use asprintf() and actually replace NULL by "" in the original
> array. Ah, see you already using it somewhere else, why not here?
>

Not sure what you mean, we can't use asprintf() to create a composite
string like what is needed here. Can you give me an example?

> ...
>
> > +     while (--tries) {
>
> I consider such loops better in a form of
>
>         do {
>                 ...
>         } while (--tries);
>

Sure.

Bart

>
> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
