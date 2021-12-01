Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AA04649A5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 09:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347962AbhLAIce (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 03:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhLAIcd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 03:32:33 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E06C061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 00:29:13 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id y13so98236184edd.13
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 00:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAZPYRVnvBCeiKcXDK+/q3f5u0oQKdRXdD24cIuHcvE=;
        b=JKTp2Ww05F6bsm4jOVZ3fAKwiHd2CBLA5vW72UtfH7/nSJhJho3dX8TsyEu02hJXdm
         ogL6wOawe+pF6WzsFUQz5GsePtzVdIurjRhXgPRtCDTgruRUggRpjDFKCiOABLwyStvN
         v9YO0PH32sHAHOQ30fKlMAC0VQL6oJVzC41/LYzGSluVqxxHEAgHumwPo6rXEHZn5D80
         42SWeN1H2ulfKKfT+F4uebQjnTyAkWaD/AvvShpgHV/t8BGdg2E8Ja97CM1340doeprp
         HgKikaGhiEOjyZfDSCLc8KITz1fTDxxXNovkDe7z342+sIewJi7Ozd5gUqjNdQWw0DcP
         niFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAZPYRVnvBCeiKcXDK+/q3f5u0oQKdRXdD24cIuHcvE=;
        b=yQRbbfbRjentKJrX899HZKC3wEWBadJ/O32hdBX5WQ/nCBT2tlpHazo0e23t/6kot5
         /ozJ7OPFvEKAX4d5Mo/1umIWk4RQvfd5vJpNwyZTtvThaGEXCPjgEIGp7nE8lC2JbUnf
         xByCOrNEpFzUof2X9zzAtHhXkCljXvBcSHz+2f3qO0K+fT7VlB/uhKBjPV5F5ogPsQ0R
         GRsGKWH5sUqXiE5fT+/vjphlN3Mz/K0jFomVfuKGk2MmKQhfEAhaRyaGj+L1SQNpHylF
         Rta2q9WFk26fsJMnq+J2hKU72RheF6Yba8miXJYt2aaQOR+eZv8Q7aUB6gDad4oeIBFD
         ijKA==
X-Gm-Message-State: AOAM531Ki88T6SyivVujdPvhF7reumxPqw/NmX9tdE2nG73isW1AXjlV
        uc11PXokXG3EhDM+7bPguWBDvBYA7JGpM6ZsQX+LqQ==
X-Google-Smtp-Source: ABdhPJxD/nL3qj8GquoGY2T+A5+XkGYn6aEV1laTGeZavd1O8RHTg27u832Yw1qwgUv1P+aKrksO8Ez15FlQQHX7nJc=
X-Received: by 2002:a05:6402:27c7:: with SMTP id c7mr6727312ede.0.1638347351525;
 Wed, 01 Dec 2021 00:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20211201072902.127542-1-joel@jms.id.au>
In-Reply-To: <20211201072902.127542-1-joel@jms.id.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Dec 2021 09:29:00 +0100
Message-ID: <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
To:     Joel Stanley <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 1, 2021 at 8:29 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Systems provide line names to make using GPIOs easier for userspace. Use
> this feature to make the tools user friendly by adding the ability to
> show the state of a named line.
>
>  $ gpioget --line-name power-chassis-good
>  1
>
>  $ gpioget -L pcieslot-power
>  0
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> While users do have the ability to chain together gpioinfo and gpioget,
> this is less discoverable for people new to the tools, and harder to
> explain to eg. technicians, and requires more typing.
>
> Please consider this enhancement. If you are happy with it I can send
> a patch for gpioset too.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tools/gpioget.c | 86 ++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 64 insertions(+), 22 deletions(-)
>
> diff --git a/tools/gpioget.c b/tools/gpioget.c
> index 51cecb6a18a9..cd27320b7f2b 100644
> --- a/tools/gpioget.c
> +++ b/tools/gpioget.c
> @@ -6,6 +6,7 @@
>  #include <limits.h>
>  #include <stdio.h>
>  #include <string.h>
> +#include <errno.h>
>
>  #include "tools-common.h"
>
> @@ -18,7 +19,7 @@ static const struct option longopts[] = {
>         { GETOPT_NULL_LONGOPT },
>  };
>
> -static const char *const shortopts = "+hvlnB:";
> +static const char *const shortopts = "+hvlnB:L:";
>
>  static void print_help(void)
>  {
> @@ -34,6 +35,7 @@ static void print_help(void)
>         printf("  -n, --dir-as-is:\tdon't force-reconfigure line direction\n");
>         printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
>         printf("                set the line bias\n");
> +       printf("  -L, --line-name:\tUse this GPIO line (instead of chip name and offset)\n");
>         printf("\n");
>         print_bias_help();
>  }
> @@ -47,6 +49,7 @@ int main(int argc, char **argv)
>         struct gpiod_line_bulk *lines;
>         struct gpiod_chip *chip;
>         char *device, *end;
> +       char *name = NULL;
>
>         for (;;) {
>                 optc = getopt_long(argc, argv, shortopts, longopts, &opti);
> @@ -69,8 +72,13 @@ int main(int argc, char **argv)
>                 case 'B':
>                         flags |= bias_flags(optarg);
>                         break;
> +               case 'L':
> +                       name = optarg;
> +                       num_lines = 1;
> +                       break;
>                 case '?':
>                         die("try %s --help", get_progname());
> +                       break;
>                 default:
>                         abort();
>                 }
> @@ -79,30 +87,64 @@ int main(int argc, char **argv)
>         argc -= optind;
>         argv += optind;
>
> -       if (argc < 1)
> -               die("gpiochip must be specified");
> -
> -       if (argc < 2)
> -               die("at least one GPIO line offset must be specified");
> -
> -       device = argv[0];
> -       num_lines = argc - 1;
> -
> -       values = malloc(sizeof(*values) * num_lines);
> -       offsets = malloc(sizeof(*offsets) * num_lines);
> -       if (!values || !offsets)
> -               die("out of memory");
> +       if (name) {
> +               struct dirent **entries;
> +               unsigned int num_chips;
> +               int offset, n;
> +
> +               n = scandir("/dev/", &entries, chip_dir_filter, alphasort);
> +               if (n < 0)
> +                       die_perror("unable to scan /dev");
> +               num_chips = n;
> +
> +               values = malloc(sizeof(*values) * 1);
> +               offsets = malloc(sizeof(*offsets) * 1);
> +               if (!values || !offsets)
> +                       die("out of memory");
> +
> +               for (i = 0; i < num_chips; i++) {
> +                       device = entries[i]->d_name;
> +                       chip = chip_open_by_name(device);
> +                       if (!chip) {
> +                               if (errno == EACCES)
> +                                       continue;
> +
> +                               die_perror("unable to open %s", device);
> +                       }
> +                       offset = gpiod_chip_find_line(chip, name);
> +                       if (offset >= 0) {
> +                               offsets[0] = offset;
> +                               break;
> +                       }
> +               }
> +               if (i == num_chips)
> +                       die("unable to find line '%s'", name);
> +       } else {
> +               if (argc < 1)
> +                       die("gpiochip must be specified");
> +
> +               if (argc < 2)
> +                       die("at least one GPIO line offset must be specified");
> +
> +               device = argv[0];
> +               num_lines = argc - 1;
> +
> +               values = malloc(sizeof(*values) * num_lines);
> +               offsets = malloc(sizeof(*offsets) * num_lines);
> +               if (!values || !offsets)
> +                       die("out of memory");
> +
> +               for (i = 0; i < num_lines; i++) {
> +                       offsets[i] = strtoul(argv[i + 1], &end, 10);
> +                       if (*end != '\0' || offsets[i] > INT_MAX)
> +                               die("invalid GPIO offset: %s", argv[i + 1]);
> +               }
>
> -       for (i = 0; i < num_lines; i++) {
> -               offsets[i] = strtoul(argv[i + 1], &end, 10);
> -               if (*end != '\0' || offsets[i] > INT_MAX)
> -                       die("invalid GPIO offset: %s", argv[i + 1]);
> +               chip = chip_open_lookup(device);
> +               if (!chip)
> +                       die_perror("unable to open %s", device);
>         }
>
> -       chip = chip_open_lookup(device);
> -       if (!chip)
> -               die_perror("unable to open %s", device);
> -
>         lines = gpiod_chip_get_lines(chip, offsets, num_lines);
>         if (!lines)
>                 die_perror("unable to retrieve GPIO lines from chip");
> --
> 2.33.0
>

I'm not very convinced to be honest. It's not like "gpioget gpiochip0
`gpiofind gpiochip0 line-name`" requires much more typing than
"gpioget gpiochip --line-name=name". There are also other questions:
this uses getopt and only allows to specify a single line name. What
if we want to specify more lines like with offsets? Even if you allow
multiple names, getopt() doesn't guarantee ordering of arguments.

Bart
