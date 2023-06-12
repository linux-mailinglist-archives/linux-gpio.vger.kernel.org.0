Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5214B72CAFB
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 18:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbjFLQFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 12:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235749AbjFLQFb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 12:05:31 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226DA1701
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:05:23 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6b2993c9652so2741391a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686585922; x=1689177922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTPY5LGmv252Sxv/4T9/5BJmtlqXgqm7Tn4mQj9pRls=;
        b=hBnrCecpivhdlgtn820cWzQi2BEEDaeUPvaXX0UYsPppsUD+tEg0Kr3AwOaFOOqzvS
         g5jFT3PBae1N+SWNwZazZzCLWYwen6QwsHiaUGWq1OsKKxKwr2aQFXt4aEnC6RAsUMKq
         uIWEsMvjnyjsryCapYCOQ+nh6c9daQavlNYMaBmX1rwa4W8MmSo1Nyb+sDfpNUAk/VmG
         1nmxaTkT3g4LQpmGgbbIPwNYXH/OI2YlfVosVv51jjLEFfthyU10j0Pvgy7GqvAtGOIe
         yLW0teCWp3uza+vWYzY9q4NGcCcXuTMmj30Q7IqhKrto8EhWQTPxDnveeHeIZqnW2Dd2
         92tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686585922; x=1689177922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTPY5LGmv252Sxv/4T9/5BJmtlqXgqm7Tn4mQj9pRls=;
        b=P404drgFeSDGnjJFls4AuhKcDQKI3G6SUN2TjROxAsayLuI8sBuVOAKhj89QKjuN/W
         I/yHfbauxqLsZL+pGN3lKbr6aWsWlOKc+DHtqwxL3tpj6LXOvnAmxpzUTztjeddwGuDw
         EvKdwF3oBSjLsyU1Qh3biNQ2ZeVutdbDER35BrhJw4O3oVjNsB017HZATr+RSBbX8CKq
         qlsM0eBZHQVfHtZJES62PCFdGX81EgOZ7CDGCRfB6hH9dEF5W258wnjh6rhqefkC3ANm
         NSl+rHfK51eEemoTzUarrIqowP+5aa4lj/RjnUGE0bZ/XOlObgM9iR34yhPaQg80jvL4
         swYQ==
X-Gm-Message-State: AC+VfDyoHUT4zclywXwDPNeXvzhSHs0L0eZ637Uu6rb2HUwsYwojk1tD
        hPHKzDvR8JE2c8vVGMLwtd+tIdPHJhb58eb9+MSvfQ==
X-Google-Smtp-Source: ACHHUZ6PQBmFnaKGzwSosQJuHuf1t3mdhgP9SoOiLM/amU3y3udYhgv1GlM5rBC/HUeAanr5rNeg4Lx0z3C3pPjgy84=
X-Received: by 2002:a05:6358:cb14:b0:12b:e105:ec28 with SMTP id
 gr20-20020a056358cb1400b0012be105ec28mr1642069rwb.21.1686585922246; Mon, 12
 Jun 2023 09:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230612013049.10708-1-gabriel.matni@gmail.com>
In-Reply-To: <20230612013049.10708-1-gabriel.matni@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 18:05:11 +0200
Message-ID: <CAMRc=MeBQFeafXxR9fGjUCSh0UhZKvcO0pZxsRYCNHX=s87E6A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V4 1/1] tools: gpiomon/gpionotify: add
 idle-timeout option
To:     Gabriel Matni <gabriel.matni@gmail.com>
Cc:     linux-gpio@vger.kernel.org, warthog618@gmail.com,
        gabriel.matni@exfo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 3:31=E2=80=AFAM Gabriel Matni <gabriel.matni@gmail.=
com> wrote:
>
> From: Gabriel Matni <gabriel.matni@exfo.com>
>
> Add an idle timeout option to gpiomon and gpionotify to exit gracefully
> when no event has been detected for a given period.
>
> Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
> ---
> V3 -> V4: Submitting patch with git send-email
>
> V2 -> V3: Addressed the following review comments:
> - Simplify the commit message
> - Clarify the help description of the --idle-timeout option
> - Declare ret variable at the top of function for gpionotify, not require=
d for gpiomon
>
> V1 -> V2: Addressed the following review comments:
> - Renamed timeout option to idle-timeout
> - Timeout value is now signed
> - Reused print_period_help() for idle-timeout option
> - Added the idle-timeout option to gpionotify for consistency
>
>  tools/gpiomon.c    | 14 +++++++++++++-
>  tools/gpionotify.c | 17 +++++++++++++++--
>  2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index c2684c2..e3abb2d 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -30,6 +30,7 @@ struct config {
>         const char *fmt;
>         enum gpiod_line_clock event_clock;
>         int timestamp_fmt;
> +       int timeout;
>  };
>
>  static void print_help(void)
> @@ -57,6 +58,8 @@ static void print_help(void)
>         printf("\t\t\tBy default 'realtime' is formatted as UTC, others a=
s raw u64.\n");
>         printf("  -h, --help\t\tdisplay this help and exit\n");
>         printf("  -F, --format <fmt>\tspecify a custom output format\n");
> +       printf("      --idle-timeout <period>\n");
> +       printf("\t\t\texit gracefully if no events occur for the period s=
pecified\n");

I think it would be useful to state the time units used by this option here=
.

Bart

>         printf("  -l, --active-low\ttreat the line as active low, flippin=
g the sense of\n");
>         printf("\t\t\trising and falling edges\n");
>         printf("      --localtime\tformat event timestamps as local time\=
n");
> @@ -123,6 +126,7 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>                 { "event-clock", required_argument, NULL,       'E' },
>                 { "format",     required_argument, NULL,        'F' },
>                 { "help",       no_argument,    NULL,           'h' },
> +               { "idle-timeout",       required_argument,      NULL,    =
       'i' },
>                 { "localtime",  no_argument,    &cfg->timestamp_fmt,    2=
 },
>                 { "num-events", required_argument, NULL,        'n' },
>                 { "quiet",      no_argument,    NULL,           'q' },
> @@ -139,6 +143,7 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>         memset(cfg, 0, sizeof(*cfg));
>         cfg->edges =3D GPIOD_LINE_EDGE_BOTH;
>         cfg->consumer =3D "gpiomon";
> +       cfg->timeout =3D -1;
>
>         for (;;) {
>                 optc =3D getopt_long(argc, argv, shortopts, longopts, &op=
ti);
> @@ -170,6 +175,9 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>                 case 'F':
>                         cfg->fmt =3D optarg;
>                         break;
> +               case 'i':
> +                       cfg->timeout =3D parse_period_or_die(optarg) / 10=
00;
> +                       break;
>                 case 'l':
>                         cfg->active_low =3D true;
>                         break;
> @@ -445,9 +453,13 @@ int main(int argc, char **argv)
>         for (;;) {
>                 fflush(stdout);
>
> -               if (poll(pollfds, resolver->num_chips, -1) < 0)
> +               ret =3D poll(pollfds, resolver->num_chips, cfg.timeout);
> +               if (ret < 0)
>                         die_perror("error polling for events");
>
> +               if (ret =3D=3D 0)
> +                       goto done;
> +
>                 for (i =3D 0; i < resolver->num_chips; i++) {
>                         if (pollfds[i].revents =3D=3D 0)
>                                 continue;
> diff --git a/tools/gpionotify.c b/tools/gpionotify.c
> index 990ca04..2c56590 100644
> --- a/tools/gpionotify.c
> +++ b/tools/gpionotify.c
> @@ -23,6 +23,7 @@ struct config {
>         const char *chip_id;
>         const char *fmt;
>         int timestamp_fmt;
> +       int timeout;
>  };
>
>  static void print_help(void)
> @@ -43,6 +44,8 @@ static void print_help(void)
>         printf("\t\t\t(default is all events)\n");
>         printf("  -h, --help\t\tdisplay this help and exit\n");
>         printf("  -F, --format <fmt>\tspecify a custom output format\n");
> +       printf("      --idle-timeout <period>\n");
> +       printf("\t\t\texit gracefully if no events occur for the period s=
pecified\n");
>         printf("      --localtime\tconvert event timestamps to local time=
\n");
>         printf("  -n, --num-events <num>\n");
>         printf("\t\t\texit after processing num events\n");
> @@ -52,6 +55,7 @@ static void print_help(void)
>         printf("      --utc\t\tconvert event timestamps to UTC\n");
>         printf("  -v, --version\t\toutput version information and exit\n"=
);
>         print_chip_help();
> +       print_period_help();
>         printf("\n");
>         printf("Format specifiers:\n");
>         printf("  %%o   GPIO line offset\n");
> @@ -89,6 +93,7 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
>                 { "event",      required_argument, NULL,        'e' },
>                 { "format",     required_argument, NULL,        'F' },
>                 { "help",       no_argument,    NULL,           'h' },
> +               { "idle-timeout",       required_argument,      NULL,    =
       'i' },
>                 { "localtime",  no_argument,    &cfg->timestamp_fmt, 2 },
>                 { "num-events", required_argument, NULL,        'n' },
>                 { "quiet",      no_argument,    NULL,           'q' },
> @@ -103,6 +108,7 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>         int opti, optc;
>
>         memset(cfg, 0, sizeof(*cfg));
> +       cfg->timeout =3D -1;
>
>         for (;;) {
>                 optc =3D getopt_long(argc, argv, shortopts, longopts, &op=
ti);
> @@ -125,6 +131,9 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>                 case 'F':
>                         cfg->fmt =3D optarg;
>                         break;
> +               case 'i':
> +                       cfg->timeout =3D parse_period_or_die(optarg) / 10=
00;
> +                       break;
>                 case 'n':
>                         cfg->events_wanted =3D parse_uint_or_die(optarg);
>                         break;
> @@ -362,7 +371,7 @@ static void event_print(struct gpiod_info_event *even=
t,
>
>  int main(int argc, char **argv)
>  {
> -       int i, j, events_done =3D 0, evtype;
> +       int i, j, ret, events_done =3D 0, evtype;
>         struct line_resolver *resolver;
>         struct gpiod_info_event *event;
>         struct gpiod_chip **chips;
> @@ -413,9 +422,13 @@ int main(int argc, char **argv)
>         for (;;) {
>                 fflush(stdout);
>
> -               if (poll(pollfds, resolver->num_chips, -1) < 0)
> +               ret =3D poll(pollfds, resolver->num_chips, cfg.timeout);
> +               if (ret < 0)
>                         die_perror("error polling for events");
>
> +               if (ret =3D=3D 0)
> +                       goto done;
> +
>                 for (i =3D 0; i < resolver->num_chips; i++) {
>                         if (pollfds[i].revents =3D=3D 0)
>                                 continue;
>
> base-commit: 9788bdd3d6791205431e65366dcc518446f7ca6a
> --
> 2.25.1
>
