Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC99F10C6AB
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 11:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfK1K37 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 05:29:59 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45728 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfK1K36 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 05:29:58 -0500
Received: by mail-oi1-f194.google.com with SMTP id 14so22843370oir.12
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 02:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sujkTkF6l3QxWA/nIBi49KgKzAh2lIJD2cEe6m6IJv4=;
        b=nOz2buMY+Mg1D3Hz8fXVXKCLScCMToCcsQewAgCSttKL6wVbghl9oWgs+wAMZglwPU
         zRe42iDz3rA9i3EPLv1/7CFKBhvuOwTHeQm+Yyzm1xCTaI9kc8rt0pUwcCopzyob8sIV
         NC378IimyZZnl1W8dSjK54x5G6d+rzjl0+hgZ6vRKGhbNAewLkc6vGnuMjViq9xmE5eW
         y1YP4mS15iNrN2k3nlIQ1ysMNCgrXUMV33HKEjGyz4ZFIA99HLtgAyDH5lSlBXzAXg70
         TE5Ph5dmjQ6QN1YYzB2K0v/e8LP5KYnBzFmQWgAApdlwdH0c4RVonTRVxu3vmyO11XoT
         qTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sujkTkF6l3QxWA/nIBi49KgKzAh2lIJD2cEe6m6IJv4=;
        b=QiOL/iZWOoHP45W9xxTLKfvI27aUXbfk6jd48749FGIiHpSiRtfN70n9QKJSF2WH2R
         z4d/9DOq2AWf+ft5SsZQXWEn6W7fXdoAodf/Suby1H4nmfEpwEWBWS8KIRdxew0XEc2o
         DluluRPWWur4w5RmoGXnuVfVL2NNYT0h7lLkqRwWBDtuA/wkYkWO1TVcbUe2kHnq68Yl
         JTAdBSBCjJt+/G7CL76IPiayY1NOti+ffESkIDrpT6LVmYWu5yAid9qKora6gk9nd8xw
         ULgEdwIaa3qVP36oeIZ3HuTelXW1IwXibZUFusdVG9GMGh2s2Rz9/AmoKaaUX0JOKNf8
         vGmQ==
X-Gm-Message-State: APjAAAVF2G5JffyJ8/Blv3cw1yTIbxNB9UOOa0WMnDuLp6ZSfhusY+XT
        NN2oIeTpB2Ij83hTkVeclH1IatM+d5SPHi9MWK1Eqw==
X-Google-Smtp-Source: APXvYqz1z43ynhJeZQtyQhYUicg54JPZSm/lFDuRpagtVwFJ64G/Hi+er67Ncpnno8u32ZV4G0Aso+M/5OL1fsAXtYo=
X-Received: by 2002:a05:6808:9a1:: with SMTP id e1mr8052979oig.175.1574936996108;
 Thu, 28 Nov 2019 02:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20191125143157.26154-1-warthog618@gmail.com> <20191125143157.26154-14-warthog618@gmail.com>
In-Reply-To: <20191125143157.26154-14-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 28 Nov 2019 11:29:45 +0100
Message-ID: <CAMpxmJVzZafHY0vFA5qfyGQDdSV=eXJOjvhUS3GboGmxLDJhEw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 13/14] tools: add support for bias flags
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 25 lis 2019 o 15:33 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> Add support for bias flags to applicable tools - gpioget, gpioset, and
> gpiomon.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  tools/gpioget.c | 32 +++++++++++++++++++++++++----
>  tools/gpiomon.c | 36 +++++++++++++++++++++++++++------
>  tools/gpioset.c | 54 ++++++++++++++++++++++++++++++++++++++++++++-----
>  3 files changed, 107 insertions(+), 15 deletions(-)
>
> diff --git a/tools/gpioget.c b/tools/gpioget.c
> index 196ebeb..17614cb 100644
> --- a/tools/gpioget.c
> +++ b/tools/gpioget.c
> @@ -17,10 +17,11 @@ static const struct option longopts[] =3D {
>         { "help",       no_argument,    NULL,   'h' },
>         { "version",    no_argument,    NULL,   'v' },
>         { "active-low", no_argument,    NULL,   'l' },
> +       { "bias", required_argument,    NULL,   'B' },
>         { GETOPT_NULL_LONGOPT },
>  };
>
> -static const char *const shortopts =3D "+hvl";
> +static const char *const shortopts =3D "+hvlB:";
>
>  static void print_help(void)
>  {
> @@ -32,6 +33,25 @@ static void print_help(void)
>         printf("  -h, --help:\t\tdisplay this message and exit\n");
>         printf("  -v, --version:\tdisplay the version and exit\n");
>         printf("  -l, --active-low:\tset the line active state to low\n")=
;
> +       printf("  -B, --bias=3D[as-is|disable|pull-down|pull-up] (default=
s to 'as-is'):\n");
> +       printf("                set the line bias\n");
> +       printf("\n");
> +       printf("Biases:\n");
> +       printf("  as-is:\tleave bias unchanged\n");
> +       printf("  disable:\tdisable bias\n");
> +       printf("  pull-up:\tenable pull-up\n");
> +       printf("  pull-down:\tenable pull-down\n");
> +}
> +
> +static int bias_flags(const char *option)
> +{
> +       if (strcmp(option, "pull-down") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN;
> +       if (strcmp(option, "pull-up") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_BIAS_PULL_UP;
> +       if (strcmp(option, "disable") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_BIAS_DISABLE;
> +       return 0;
>  }
>
>  int main(int argc, char **argv)
> @@ -39,6 +59,7 @@ int main(int argc, char **argv)
>         unsigned int *offsets, i, num_lines;
>         int *values, optc, opti, rv;
>         bool active_low =3D false;
> +       int flags =3D 0;
>         char *device, *end;
>
>         for (;;) {
> @@ -56,6 +77,9 @@ int main(int argc, char **argv)
>                 case 'l':
>                         active_low =3D true;
>                         break;
> +               case 'B':
> +                       flags =3D bias_flags(optarg);
> +                       break;
>                 case '?':
>                         die("try %s --help", get_progname());
>                 default:
> @@ -86,9 +110,9 @@ int main(int argc, char **argv)
>                         die("invalid GPIO offset: %s", argv[i + 1]);
>         }
>
> -       rv =3D gpiod_ctxless_get_value_multiple(device, offsets, values,
> -                                             num_lines, active_low,
> -                                             "gpioget");
> +       rv =3D gpiod_ctxless_get_value_multiple_ext(device, offsets, valu=
es,
> +                                                 num_lines, active_low,
> +                                                 "gpioget", flags);
>         if (rv < 0)
>                 die_perror("error reading GPIO values");
>
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index 9a1843b..687212d 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -22,6 +22,7 @@ static const struct option longopts[] =3D {
>         { "help",               no_argument,            NULL,   'h' },
>         { "version",            no_argument,            NULL,   'v' },
>         { "active-low",         no_argument,            NULL,   'l' },
> +       { "bias",               required_argument,      NULL,   'B' },
>         { "num-events",         required_argument,      NULL,   'n' },
>         { "silent",             no_argument,            NULL,   's' },
>         { "rising-edge",        no_argument,            NULL,   'r' },
> @@ -31,7 +32,7 @@ static const struct option longopts[] =3D {
>         { GETOPT_NULL_LONGOPT },
>  };
>
> -static const char *const shortopts =3D "+hvln:srfbF:";
> +static const char *const shortopts =3D "+hvlB:n:srfbF:";
>
>  static void print_help(void)
>  {
> @@ -43,6 +44,8 @@ static void print_help(void)
>         printf("  -h, --help:\t\tdisplay this message and exit\n");
>         printf("  -v, --version:\tdisplay the version and exit\n");
>         printf("  -l, --active-low:\tset the line active state to low\n")=
;
> +       printf("  -B, --bias=3D[as-is|disable|pull-down|pull-up] (default=
s to 'as-is'):\n");
> +       printf("                set the line bias\n");
>         printf("  -n, --num-events=3DNUM:\texit after processing NUM even=
ts\n");
>         printf("  -s, --silent:\t\tdon't print event info\n");
>         printf("  -r, --rising-edge:\tonly process rising edge events\n")=
;
> @@ -50,6 +53,12 @@ static void print_help(void)
>         printf("  -b, --line-buffered:\tset standard output as line buffe=
red\n");
>         printf("  -F, --format=3DFMT\tspecify custom output format\n");
>         printf("\n");
> +       printf("Biases:\n");
> +       printf("  as-is:\tleave bias unchanged\n");
> +       printf("  disable:\tdisable bias\n");
> +       printf("  pull-up:\tenable pull-up\n");
> +       printf("  pull-down:\tenable pull-down\n");
> +       printf("\n");
>         printf("Format specifiers:\n");
>         printf("  %%o:  GPIO line offset\n");
>         printf("  %%e:  event type (0 - falling edge, 1 rising edge)\n");
> @@ -240,10 +249,22 @@ static int make_signalfd(void)
>         return sigfd;
>  }
>
> +static int bias_flags(const char *option)
> +{
> +       if (strcmp(option, "pull-down") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN;
> +       if (strcmp(option, "pull-up") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_BIAS_PULL_UP;
> +       if (strcmp(option, "disable") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_BIAS_DISABLE;
> +       return 0;

Does it mean that any other string would be interpreted as 'as-is'?
I'd prefer it to bail out on invalid value.

> +}
> +
>  int main(int argc, char **argv)
>  {
>         unsigned int offsets[GPIOD_LINE_BULK_MAX_LINES], num_lines =3D 0,=
 offset;
>         bool active_low =3D false, watch_rising =3D false, watch_falling =
=3D false;
> +       int flags =3D 0;
>         struct timespec timeout =3D { 10, 0 };
>         int optc, opti, rv, i, event_type;
>         struct mon_ctx ctx;
> @@ -266,6 +287,9 @@ int main(int argc, char **argv)
>                 case 'l':
>                         active_low =3D true;
>                         break;
> +               case 'B':
> +                       flags =3D bias_flags(optarg);
> +                       break;
>                 case 'n':
>                         ctx.events_wanted =3D strtoul(optarg, &end, 10);
>                         if (*end !=3D '\0')
> @@ -320,11 +344,11 @@ int main(int argc, char **argv)
>
>         ctx.sigfd =3D make_signalfd();
>
> -       rv =3D gpiod_ctxless_event_monitor_multiple(argv[0], event_type,
> -                                                 offsets, num_lines,
> -                                                 active_low, "gpiomon",
> -                                                 &timeout, poll_callback=
,
> -                                                 event_callback, &ctx);
> +       rv =3D gpiod_ctxless_event_monitor_multiple_ext(
> +                               argv[0], event_type, offsets,
> +                               num_lines, active_low, "gpiomon",
> +                               &timeout, poll_callback,
> +                               event_callback, &ctx, flags);
>         if (rv)
>                 die_perror("error waiting for events");
>
> diff --git a/tools/gpioset.c b/tools/gpioset.c
> index d9977a7..b91baea 100644
> --- a/tools/gpioset.c
> +++ b/tools/gpioset.c
> @@ -23,6 +23,8 @@ static const struct option longopts[] =3D {
>         { "help",               no_argument,            NULL,   'h' },
>         { "version",            no_argument,            NULL,   'v' },
>         { "active-low",         no_argument,            NULL,   'l' },
> +       { "bias",               required_argument,      NULL,   'B' },
> +       { "drive",              required_argument,      NULL,   'D' },
>         { "mode",               required_argument,      NULL,   'm' },
>         { "sec",                required_argument,      NULL,   's' },
>         { "usec",               required_argument,      NULL,   'u' },
> @@ -30,7 +32,7 @@ static const struct option longopts[] =3D {
>         { GETOPT_NULL_LONGOPT },
>  };
>
> -static const char *const shortopts =3D "+hvlm:s:u:b";
> +static const char *const shortopts =3D "+hvlB:D:m:s:u:b";
>
>  static void print_help(void)
>  {
> @@ -42,12 +44,27 @@ static void print_help(void)
>         printf("  -h, --help:\t\tdisplay this message and exit\n");
>         printf("  -v, --version:\tdisplay the version and exit\n");
>         printf("  -l, --active-low:\tset the line active state to low\n")=
;
> +       printf("  -B, --bias=3D[as-is|disable|pull-down|pull-up] (default=
s to 'as-is'):\n");
> +       printf("                set the line bias\n");
> +       printf("  -D, --drive=3D[push-pull|open-drain|open-source] (defau=
lts to 'push-pull'):\n");
> +       printf("                set the line drive mode\n");
>         printf("  -m, --mode=3D[exit|wait|time|signal] (defaults to 'exit=
'):\n");
>         printf("                tell the program what to do after setting=
 values\n");
>         printf("  -s, --sec=3DSEC:\tspecify the number of seconds to wait=
 (only valid for --mode=3Dtime)\n");
>         printf("  -u, --usec=3DUSEC:\tspecify the number of microseconds =
to wait (only valid for --mode=3Dtime)\n");
>         printf("  -b, --background:\tafter setting values: detach from th=
e controlling terminal\n");
>         printf("\n");
> +       printf("Biases:\n");
> +       printf("  as-is:\tleave bias unchanged\n");
> +       printf("  disable:\tdisable bias\n");
> +       printf("  pull-up:\tenable pull-up\n");
> +       printf("  pull-down:\tenable pull-down\n");
> +       printf("\n");
> +       printf("Drives:\n");
> +       printf("  push-pull:\tdrive the line both high and low\n");
> +       printf("  open-drain:\tdrive the line low or go high impedance\n"=
);
> +       printf("  open-source:\tdrive the line high or go high impedance\=
n");
> +       printf("\n");
>         printf("Modes:\n");
>         printf("  exit:\t\tset values and exit immediately\n");
>         printf("  wait:\t\tset values and wait for user to press ENTER\n"=
);
> @@ -178,11 +195,31 @@ static const struct mode_mapping *parse_mode(const =
char *mode)
>         return NULL;
>  }
>
> +static int bias_flags(const char *option)
> +{
> +       if (strcmp(option, "pull-down") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN;
> +       if (strcmp(option, "pull-up") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_BIAS_PULL_UP;
> +       if (strcmp(option, "disable") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_BIAS_DISABLE;
> +       return 0;
> +}
> +
> +static int drive_flags(const char *option)
> +{
> +       if (strcmp(option, "open-drain") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_OPEN_DRAIN;
> +       if (strcmp(option, "open-source") =3D=3D 0)
> +               return GPIOD_CTXLESS_FLAG_OPEN_SOURCE;
> +       return 0;

Thanks for doing this, but please put it into a separate commit that
adds support for drive flags.


> +}
> +
>  int main(int argc, char **argv)
>  {
>         const struct mode_mapping *mode =3D &modes[MODE_EXIT];
>         unsigned int *offsets, num_lines, i;
> -       int *values, rv, optc, opti;
> +       int *values, rv, optc, opti, flags =3D 0;
>         struct callback_data cbdata;
>         bool active_low =3D false;
>         char *device, *end;
> @@ -204,6 +241,12 @@ int main(int argc, char **argv)
>                 case 'l':
>                         active_low =3D true;
>                         break;
> +               case 'B':
> +                       flags |=3D bias_flags(optarg);
> +                       break;
> +               case 'D':
> +                       flags |=3D drive_flags(optarg);
> +                       break;
>                 case 'm':
>                         mode =3D parse_mode(optarg);
>                         if (!mode)
> @@ -268,9 +311,10 @@ int main(int argc, char **argv)
>                         die("invalid offset: %s", argv[i + 1]);
>         }
>
> -       rv =3D gpiod_ctxless_set_value_multiple(device, offsets, values,
> -                                             num_lines, active_low, "gpi=
oset",
> -                                             mode->callback, &cbdata);
> +       rv =3D gpiod_ctxless_set_value_multiple_ext(
> +                               device, offsets, values,
> +                               num_lines, active_low, "gpioset",
> +                               mode->callback, &cbdata, flags);
>         if (rv < 0)
>                 die_perror("error setting the GPIO line values");
>
> --
> 2.24.0
>
