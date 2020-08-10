Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A605240EB1
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 21:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729558AbgHJTPf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 15:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730201AbgHJTPb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2020 15:15:31 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D41C061756
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 12:15:30 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id g19so10123682ioh.8
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 12:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYMUd6VPuUUbsQuz0OYEj8ysZWxlOEqCQI2Ji5XBOo4=;
        b=daJ9wsF6DuQE8g4D4zU6Yoh0HTFk5TgX4G56KZ5r57dHawNueLk6nYvRx6v3RQ3rZB
         r4INHWMMVAvObAMZJ4em3Eu3TBc5a3c+NpApjmaV+OKRlhDw+98Sq56GJg16OwQkmH1H
         24QRnFfeQPi87SQUzI4YAe6ls9POpLTQMvvtEPlKzOXaSM7hp40CzsXfwDqITW1kxsFm
         kRggqHFLZq5IDtNUJeo21Xl7vrmILnLQ3U2aXERSw+ls6YXjxCTOPj84+r+sGJUuVp7r
         5Qp4ZPr/GKxL6ZQDKFs5hntB2q0feW8UgWjcE3Xz59sD1YbPXNl2DWXOWi2jhKYwK9wu
         F3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYMUd6VPuUUbsQuz0OYEj8ysZWxlOEqCQI2Ji5XBOo4=;
        b=mDATUIFhA+zXPy6NjF8gaPQ6TMGgnL05vosuFZrHqq17x4Sd64RpxhYG9SxzvO1rB8
         WTa/SVuHv+GoSu2CJ1l5ZPAXZXTPhsr4ZEGMzqZc44X0dKwCDc3QYFehpERO7eplz+43
         Q6ujXNK5UWh436acQQ5ByrL3weEq4K/DlsgyxCEaHuM5IUVG5sfWNuA6qNF5zra22e7S
         Dc0pNVaMRomRjOQ/uSPuzgQFUOl49ziIKSNCIXNuuuZ1iimDXKKWwPAbbpxf3bU5EuhD
         4l/04ZDyom4q7NyHhkdoKFBaCN5PCKaqWL8/wWbIubzPVGPetijTioJzm0rf3ej9st8Y
         +Tkg==
X-Gm-Message-State: AOAM530RI4LLHhlgjI+weNO1P4kDHu9EWYnguhVX75hF0jDBLDe1l8au
        1qqlKPEhAWkxqbG+lsr9/Ql0iDdZq2O3vm9OTy5nDg==
X-Google-Smtp-Source: ABdhPJyjakvB++eLYYoI3eTuqe9JQCYeoCzYSe21wBT5m12Yl5RQ82mypzYQP7U9UD/TE3FScxv7oEo8JXZWPVJMEKE=
X-Received: by 2002:a6b:6c13:: with SMTP id a19mr19187415ioh.31.1597086929599;
 Mon, 10 Aug 2020 12:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com> <20200608090652.805516-3-gary.bisson@boundarydevices.com>
In-Reply-To: <20200608090652.805516-3-gary.bisson@boundarydevices.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Aug 2020 21:15:18 +0200
Message-ID: <CAMRc=MdLXhcauwSeFKxeBbJUUTVTHCw3Pwkkxx3Emmao7MnXjw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/3] tools-common: fix build for Android
To:     Gary Bisson <gary.bisson@boundarydevices.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 8, 2020 at 11:07 AM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
>
> program_invocation_name doesn't exist in Android, getprogname() should
> be used instead.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi,
>
> I couldn't an equivalent to program_invocation_short_name, so the
> program is now using program_invocation_name all the time, hope it's ok.
>
> Regards,
> Gary
> ---
>  tools/tools-common.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/tools/tools-common.c b/tools/tools-common.c
> index 12bde20..1d7fc2c 100644
> --- a/tools/tools-common.c
> +++ b/tools/tools-common.c
> @@ -21,7 +21,11 @@
>
>  const char *get_progname(void)
>  {
> +#if defined __ANDROID__

I'd prefer to keep libgpiod Android-agnostic. Does prctl() exist in
Android? It too can be used for that.

Bartosz

> +       return getprogname();
> +#else
>         return program_invocation_name;
> +#endif
>  }
>
>  void die(const char *fmt, ...)
> @@ -29,7 +33,7 @@ void die(const char *fmt, ...)
>         va_list va;
>
>         va_start(va, fmt);
> -       fprintf(stderr, "%s: ", program_invocation_name);
> +       fprintf(stderr, "%s: ", get_progname());
>         vfprintf(stderr, fmt, va);
>         fprintf(stderr, "\n");
>         va_end(va);
> @@ -42,7 +46,7 @@ void die_perror(const char *fmt, ...)
>         va_list va;
>
>         va_start(va, fmt);
> -       fprintf(stderr, "%s: ", program_invocation_name);
> +       fprintf(stderr, "%s: ", get_progname());
>         vfprintf(stderr, fmt, va);
>         fprintf(stderr, ": %s\n", strerror(errno));
>         va_end(va);
> @@ -53,7 +57,7 @@ void die_perror(const char *fmt, ...)
>  void print_version(void)
>  {
>         printf("%s (libgpiod) v%s\n",
> -              program_invocation_short_name, gpiod_version_string());
> +              get_progname(), gpiod_version_string());
>         printf("Copyright (C) 2017-2018 Bartosz Golaszewski\n");
>         printf("License: LGPLv2.1\n");
>         printf("This is free software: you are free to change and redistribute it.\n");
> --
> 2.26.2
>
