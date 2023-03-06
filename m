Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A526AC1E3
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 14:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjCFNwq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 08:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjCFNwp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 08:52:45 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506988A7A
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 05:52:44 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id o32so9132926vsv.12
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 05:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678110763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcQqyyuEdZ0qVm26gnIRJamrFwUaEOQ1LvTWK6MmhMo=;
        b=y2bEyX8CiaXCdqR9+AGpNYQErjQJ3Kpf1yI2TKSZW0SnEWy1Pt5359y82FntnU10f/
         oSRs16xLsVOHNZuy8szGkQWzx46w4e3W9t7oMzGWIyf7+4gq7bWh/0Mh5HHwKiZOVRX2
         rTknr6IcDhG9Ni9/Bs1IIRyMp3BTLoSZaa1IjjF4iYLndtkNnDiTo7YkW93DYFqRQiME
         f7jaXY9wPx3ghnvjxXzsDygqEl4GGMYKZOAxgpLUwzcpgFIxsOP8AZArsgtEyxgCpLJZ
         KjgztwGyXuD2nt13S14genK594biX5PtUAfbt9vqGyfX4AFqFy7kFSw744dPHA+1yPha
         qBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcQqyyuEdZ0qVm26gnIRJamrFwUaEOQ1LvTWK6MmhMo=;
        b=45HiWFYnhYDc6AqKMzRKxHXrLEEEWU4nr+WTt1a3qugHRMEUmMMWcTFA30gkhqTpca
         6Zwd7lh4mQGfl8X9ft8Tpp2UUrKhw0bJq4VAFcUIaz21WgRclzituSqsdHG4MHuzgHVB
         51pIoljW1YUzEtoFBxp+eWvOxUgmuKGNwjOq5WvXjJsuJ5bQZIkfHJlzng62gvP/UqlA
         O2P4CEY5JsR0ntNBLN0ayJ02O/r+ICBy+PCgsBWK/SN1jyahx26nhLqyo7e1BlsD8/sP
         kWl9EYvZsGnK9k2Zsfvn6GmV/hn6ayfiLA9SlI+RzP7hD0ZN+kKY7bEujbt22tVut+bL
         nQLA==
X-Gm-Message-State: AO0yUKX9U2HykjGv+Y58PS7COlReaC3q/HZJeldPLUTyMtzY2axfpqBa
        bF9lQZQ3eFz7ZwuObH+yY3oYYdaRfmmeAh3cEyVCFkJ9kBV8bWLQ
X-Google-Smtp-Source: AK7set/s7cozR7e8zzdehHRmsssFghjWyZvfM2oujSl55ZLsar5QohXdJTph5Zbp+xJHDdDsjTxJo4MXSnH/OqJtODE=
X-Received: by 2002:a67:e089:0:b0:411:f6d4:1be9 with SMTP id
 f9-20020a67e089000000b00411f6d41be9mr7137893vsl.5.1678110763240; Mon, 06 Mar
 2023 05:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20230228001307.249811-1-benl@squareup.com> <20230228001307.249811-2-benl@squareup.com>
In-Reply-To: <20230228001307.249811-2-benl@squareup.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 14:52:31 +0100
Message-ID: <CAMRc=MftFexcJTEzsLCVTC79oA=GsD3+zfJSnCkZxCzbPhDw4g@mail.gmail.com>
Subject: Re: [libgpiod,v3 1/2] tools: remove dependency on glibc program_invocation_[short_]name
To:     Benjamin Li <benl@squareup.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 28, 2023 at 1:13=E2=80=AFAM Benjamin Li <benl@squareup.com> wro=
te:
>
> Platforms like Bionic libc don't have program_invocation_[short_]name,
> which is a GNU extension. It does have getprogname(), a BSD extension,
> but rather than supporting multiple extensions let's just introduce
> our own local helpers.
>
> We derive the short name ourselves rather than calling basename(),
> as the POSIX version takes char *, not const char *, and is thus
> not guaranteed to avoid modifying its input. (The GNU version does
> take const char * but we are avoiding extensions here.)
>
> Signed-off-by: Benjamin Li <benl@squareup.com>
> ---
>  tools/gpiodetect.c   |  5 +++--
>  tools/gpioget.c      |  5 +++--
>  tools/gpioinfo.c     |  5 +++--
>  tools/gpiomon.c      |  5 +++--
>  tools/gpionotify.c   |  5 +++--
>  tools/gpioset.c      |  5 +++--
>  tools/tools-common.c | 34 ++++++++++++++++++++++++++--------
>  tools/tools-common.h |  4 +++-
>  8 files changed, 47 insertions(+), 21 deletions(-)
>
> diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
> index f0211da..eb8d273 100644
> --- a/tools/gpiodetect.c
> +++ b/tools/gpiodetect.c
> @@ -12,7 +12,7 @@
>
>  static void print_help(void)
>  {
> -       printf("Usage: %s [OPTIONS] [chip]...\n", get_progname());
> +       printf("Usage: %s [OPTIONS] [chip]...\n", get_prog_short_name());
>         printf("\n");
>         printf("List GPIO chips, print their labels and number of GPIO li=
nes.\n");
>         printf("\n");
> @@ -51,7 +51,7 @@ static int parse_config(int argc, char **argv)
>                         print_version();
>                         exit(EXIT_SUCCESS);
>                 case '?':
> -                       die("try %s --help", get_progname());
> +                       die("try %s --help", get_prog_short_name());

This changes the semantics though - previously it would have returned
the long name. I think it's better for the help output to return the
full path. It's also consistent with what most command-line program
seem to do.

Same elsewhere.

Bart

>                 default:
>                         abort();
>                 }
> @@ -89,6 +89,7 @@ int main(int argc, char **argv)
>         int num_chips, i, ret =3D EXIT_SUCCESS;
>         char **paths, *path;
>
> +       set_prog_name(argv[0]);
>         i =3D parse_config(argc, argv);
>         argc -=3D i;
>         argv +=3D i;
> diff --git a/tools/gpioget.c b/tools/gpioget.c
> index 08c17e6..c8238cf 100644
> --- a/tools/gpioget.c
> +++ b/tools/gpioget.c
> @@ -26,7 +26,7 @@ struct config {
>
>  static void print_help(void)
>  {
> -       printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
> +       printf("Usage: %s [OPTIONS] <line>...\n", get_prog_short_name());
>         printf("\n");
>         printf("Read values of GPIO lines.\n");
>         printf("\n");
> @@ -120,7 +120,7 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>                         print_version();
>                         exit(EXIT_SUCCESS);
>                 case '?':
> -                       die("try %s --help", get_progname());
> +                       die("try %s --help", get_prog_short_name());
>                 case 0:
>                         break;
>                 default:
> @@ -146,6 +146,7 @@ int main(int argc, char **argv)
>         struct config cfg;
>         const char *fmt;
>
> +       set_prog_name(argv[0]);
>         i =3D parse_config(argc, argv, &cfg);
>         argc -=3D i;
>         argv +=3D i;
> diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
> index 1ec7f63..ce2df63 100644
> --- a/tools/gpioinfo.c
> +++ b/tools/gpioinfo.c
> @@ -20,7 +20,7 @@ struct config {
>
>  static void print_help(void)
>  {
> -       printf("Usage: %s [OPTIONS] [line]...\n", get_progname());
> +       printf("Usage: %s [OPTIONS] [line]...\n", get_prog_short_name());
>         printf("\n");
>         printf("Print information about GPIO lines.\n");
>         printf("\n");
> @@ -83,7 +83,7 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
>                         print_version();
>                         exit(EXIT_SUCCESS);
>                 case '?':
> -                       die("try %s --help", get_progname());
> +                       die("try %s --help", get_prog_short_name());
>                 case 0:
>                         break;
>                 default:
> @@ -228,6 +228,7 @@ int main(int argc, char **argv)
>         struct config cfg;
>         char **paths;
>
> +       set_prog_name(argv[0]);
>         i =3D parse_config(argc, argv, &cfg);
>         argc -=3D i;
>         argv +=3D i;
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index 93ff463..893b966 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -34,7 +34,7 @@ struct config {
>
>  static void print_help(void)
>  {
> -       printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
> +       printf("Usage: %s [OPTIONS] <line>...\n", get_prog_short_name());
>         printf("\n");
>         printf("Wait for events on GPIO lines and print them to standard =
output.\n");
>         printf("\n");
> @@ -195,7 +195,7 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>                         print_version();
>                         exit(EXIT_SUCCESS);
>                 case '?':
> -                       die("try %s --help", get_progname());
> +                       die("try %s --help", get_prog_short_name());
>                 case 0:
>                         break;
>                 default:
> @@ -360,6 +360,7 @@ int main(int argc, char **argv)
>         struct config cfg;
>         int ret, i, j;
>
> +       set_prog_name(argv[0]);
>         i =3D parse_config(argc, argv, &cfg);
>         argc -=3D i;
>         argv +=3D i;
> diff --git a/tools/gpionotify.c b/tools/gpionotify.c
> index a0976f7..e19d88c 100644
> --- a/tools/gpionotify.c
> +++ b/tools/gpionotify.c
> @@ -27,7 +27,7 @@ struct config {
>
>  static void print_help(void)
>  {
> -       printf("Usage: %s [OPTIONS] <line>...\n", get_progname());
> +       printf("Usage: %s [OPTIONS] <line>...\n", get_prog_short_name());
>         printf("\n");
>         printf("Wait for changes to info on GPIO lines and print them to =
standard output.\n");
>         printf("\n");
> @@ -144,7 +144,7 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>                         print_version();
>                         exit(EXIT_SUCCESS);
>                 case '?':
> -                       die("try %s --help", get_progname());
> +                       die("try %s --help", get_prog_short_name());
>                 case 0:
>                         break;
>                 default:
> @@ -370,6 +370,7 @@ int main(int argc, char **argv)
>         struct pollfd *pollfds;
>         struct config cfg;
>
> +       set_prog_name(argv[0]);
>         i =3D parse_config(argc, argv, &cfg);
>         argc -=3D optind;
>         argv +=3D optind;
> diff --git a/tools/gpioset.c b/tools/gpioset.c
> index a7084a3..cc9106c 100644
> --- a/tools/gpioset.c
> +++ b/tools/gpioset.c
> @@ -36,7 +36,7 @@ struct config {
>
>  static void print_help(void)
>  {
> -       printf("Usage: %s [OPTIONS] <line=3Dvalue>...\n", get_progname())=
;
> +       printf("Usage: %s [OPTIONS] <line=3Dvalue>...\n", get_prog_short_=
name());
>         printf("\n");
>         printf("Set values of GPIO lines.\n");
>         printf("\n");
> @@ -212,7 +212,7 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>                         print_version();
>                         exit(EXIT_SUCCESS);
>                 case '?':
> -                       die("try %s --help", get_progname());
> +                       die("try %s --help", get_prog_short_name());
>                 case 0:
>                         break;
>                 default:
> @@ -876,6 +876,7 @@ int main(int argc, char **argv)
>         struct config cfg;
>         char **lines;
>
> +       set_prog_name(argv[0]);
>         i =3D parse_config(argc, argv, &cfg);
>         argc -=3D i;
>         argv +=3D i;
> diff --git a/tools/tools-common.c b/tools/tools-common.c
> index a0080fc..e5f6fc1 100644
> --- a/tools/tools-common.c
> +++ b/tools/tools-common.c
> @@ -19,9 +19,28 @@
>
>  #include "tools-common.h"
>
> -const char *get_progname(void)
> +static const char *prog_name =3D NULL;
> +static const char *prog_short_name =3D NULL;
> +
> +void set_prog_name(const char *name)
> +{
> +       prog_name =3D name;
> +       prog_short_name =3D name;
> +       while (*name) {
> +               if (*name++ =3D=3D '/') {
> +                       prog_short_name =3D name;
> +               }
> +       }
> +}
> +
> +const char *get_prog_name(void)
> +{
> +       return prog_name;
> +}
> +
> +const char *get_prog_short_name(void)
>  {
> -       return program_invocation_name;
> +       return prog_short_name;
>  }
>
>  void print_error(const char *fmt, ...)
> @@ -29,7 +48,7 @@ void print_error(const char *fmt, ...)
>         va_list va;
>
>         va_start(va, fmt);
> -       fprintf(stderr, "%s: ", program_invocation_name);
> +       fprintf(stderr, "%s: ", get_prog_name());
>         vfprintf(stderr, fmt, va);
>         fprintf(stderr, "\n");
>         va_end(va);
> @@ -40,7 +59,7 @@ void print_perror(const char *fmt, ...)
>         va_list va;
>
>         va_start(va, fmt);
> -       fprintf(stderr, "%s: ", program_invocation_name);
> +       fprintf(stderr, "%s: ", get_prog_name());
>         vfprintf(stderr, fmt, va);
>         fprintf(stderr, ": %s\n", strerror(errno));
>         va_end(va);
> @@ -51,7 +70,7 @@ void die(const char *fmt, ...)
>         va_list va;
>
>         va_start(va, fmt);
> -       fprintf(stderr, "%s: ", program_invocation_name);
> +       fprintf(stderr, "%s: ", get_prog_name());
>         vfprintf(stderr, fmt, va);
>         fprintf(stderr, "\n");
>         va_end(va);
> @@ -64,7 +83,7 @@ void die_perror(const char *fmt, ...)
>         va_list va;
>
>         va_start(va, fmt);
> -       fprintf(stderr, "%s: ", program_invocation_name);
> +       fprintf(stderr, "%s: ", get_prog_name());
>         vfprintf(stderr, fmt, va);
>         fprintf(stderr, ": %s\n", strerror(errno));
>         va_end(va);
> @@ -74,8 +93,7 @@ void die_perror(const char *fmt, ...)
>
>  void print_version(void)
>  {
> -       printf("%s (libgpiod) v%s\n",
> -              program_invocation_short_name, gpiod_api_version());
> +       printf("%s (libgpiod) v%s\n", get_prog_short_name(), gpiod_api_ve=
rsion());
>         printf("Copyright (C) 2017-2023 Bartosz Golaszewski\n");
>         printf("License: GPL-2.0-or-later\n");
>         printf("This is free software: you are free to change and redistr=
ibute it.\n");
> diff --git a/tools/tools-common.h b/tools/tools-common.h
> index 434e5ba..c82317a 100644
> --- a/tools/tools-common.h
> +++ b/tools/tools-common.h
> @@ -78,7 +78,9 @@ struct line_resolver {
>         struct resolved_line lines[];
>  };
>
> -const char *get_progname(void);
> +void set_prog_name(const char *name);
> +const char *get_prog_name(void);
> +const char *get_prog_short_name(void);
>  void print_error(const char *fmt, ...) PRINTF(1, 2);
>  void print_perror(const char *fmt, ...) PRINTF(1, 2);
>  void die(const char *fmt, ...) NORETURN PRINTF(1, 2);
> --
> 2.25.1
>
