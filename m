Return-Path: <linux-gpio+bounces-30195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCF1CF82E9
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 12:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DD063038963
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 11:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1567E30DEA4;
	Tue,  6 Jan 2026 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVxyxsZ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97512F3601
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767700304; cv=none; b=NHug+l3nMS3cpoTUEKe3aOqiT3LPlnMX1L2J2ADZNSsO3m2kU1fvc8byhdSbPfh28zt+Nwc9yTtfpeNYQA9/X2Q1F5nCvro30OrpHqOgWt8PCvP9lTxm6SrNnSHiGz7iTcF3s1GTomneXnwExft3np8FJ5LSZbnrdnSAJ9hv8JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767700304; c=relaxed/simple;
	bh=lqlHva6Idg941wRK5tfoDwh1vBbO67utzB1ooq5GOio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zww1FZYg902a4zEt1wOC3WUDq5h48RSGGO/pPrUOPFuJzIRH5GWYJjgb5kmUx+ho4f+qnaQTjamGAMtFl9AtBTTtt1yT5ns9cmuASq/+zia0+EZBaMD5JKC9RuYETIP5EYpa1lD90swk1QnV7TLD6+G0/AL2kG83CfzAyEUSJxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVxyxsZ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F299C116C6
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767700304;
	bh=lqlHva6Idg941wRK5tfoDwh1vBbO67utzB1ooq5GOio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mVxyxsZ/atHf9YcB4mt2tu5AjqAmOqs+8ip9Ax6EIimwzxRW55qJo9tu6KRhnnZtD
	 0vyZ2L1FH2qHSU8tC8NwY1/rNQ2X3QSCocJZkPz1/1pzgbZ3/yCdqyOhudMf/jfAYZ
	 c0fXqam3iglsr+Pb1EtP+cNasbxW4POkhm77UxcamFle8o1rWtvDaa29zBqhsqtdQb
	 bLdZCs4u6i17wlGDGrMgaDFp1kzNeXFmv6j5FM9t8hi+MmGCwEMtkrIlwplsztwLYz
	 v05YF5+iLBNpK8+dvm/ucbffOu1cR9APhPXOhBozxy9rWk+o/HXrnZIAUiYLdgszef
	 Oh6y+vKV7DdQQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-598f59996aaso870306e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 03:51:44 -0800 (PST)
X-Gm-Message-State: AOJu0Yzh1t64svjwCDXFhm2LRfUkjuzsFRdZ8E5VFKeWUZN4Mzb4jixv
	VPwlgtZ1DRS+fjlVrjgmjVbaumVPKphowGt/gxaW71agVp5XQ9WFFMevtKwY7AOApRRliKbK1uM
	kvJKNB1XJZowm08F/WCHObGgUe5F92pyNwKT6re81Xg==
X-Google-Smtp-Source: AGHT+IEVYb9aCBdu4iYv4U3fVMJuy8/ZTV9mDOXFTRfOn3lEZIW6FiwvMRLkScGw0RFHveBT6eu4fYtTYyS///jCmN0=
X-Received: by 2002:a05:6512:a88:b0:594:4b55:d2dc with SMTP id
 2adb3069b0e04-59b6526152fmr994718e87.47.1767700303020; Tue, 06 Jan 2026
 03:51:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105170451.7496-1-shaarang.tyagi@gmail.com>
In-Reply-To: <20260105170451.7496-1-shaarang.tyagi@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 12:51:31 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md_o=sDuHrBhwjXCi50eub0GycOheK6LNDkhzBmQ2Bg8Q@mail.gmail.com>
X-Gm-Features: AQt7F2pzOaIgRsrCN7Azml5zMG1NxLAYFbz6YznTqLS2NZs5G7EU74ExaMTo5s0
Message-ID: <CAMRc=Md_o=sDuHrBhwjXCi50eub0GycOheK6LNDkhzBmQ2Bg8Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: add initial-state option
To: shaarang.tyagi@gmail.com
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 6:06=E2=80=AFPM <shaarang.tyagi@gmail.com> wrote:
>
> From: Shaarang Tyagi <shaarang.tyagi@gmail.com>
>
> Add a gpiomon initial-state command line option to display initial line s=
tates,
> this is diplayed before waiting for events.

Hi! Thanks for doing this. Can you also add some test-cases to
tools/gpio-tools-test.bash?

>
> Closes: https://github.com/brgl/libgpiod/issues/159
> Tested-by: Shaarang Tyagi <shaarang.tyagi@gmail.com>

Tested-by is a tag added by third party developers who tested code you
authored. Don't add your own T-b to your patches. I sure do expect you
to test code you're sending. :)

> Signed-off-by: Shaarang Tyagi <shaarang.tyagi@gmail.com>
> ---
>  tools/gpiomon.c | 39 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index 88b5ccf..4d109c3 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -32,6 +32,7 @@ struct config {
>         enum gpiod_line_clock event_clock;
>         int timestamp_fmt;
>         long long idle_timeout;
> +       bool initial_state;
>  };
>
>  static void print_help(void)
> @@ -69,6 +70,7 @@ static void print_help(void)
>         printf("  -p, --debounce-period <period>\n");
>         printf("\t\t\tdebounce the line(s) with the specified period\n");
>         printf("  -q, --quiet\t\tdon't generate any output\n");
> +       printf("  -S, --initial-state\t\tprint initial states of the line=
s\n");

Can you make it `-i` instead?

>         printf("  -s, --strict\t\tabort if requested line names are not u=
nique\n");
>         printf("      --unquoted\tdon't quote line or consumer names\n");
>         printf("      --utc\t\tformat event timestamps as UTC (default fo=
r 'realtime')\n");
> @@ -113,7 +115,7 @@ static int parse_event_clock_or_die(const char *optio=
n)
>
>  static int parse_config(int argc, char **argv, struct config *cfg)
>  {
> -       static const char *const shortopts =3D "+b:c:C:e:E:hF:ln:p:qshv";
> +       static const char *const shortopts =3D "+b:c:C:e:E:hF:ln:p:qshvS"=
;
>
>         const struct option longopts[] =3D {
>                 { "active-low", no_argument,    NULL,           'l' },
> @@ -136,6 +138,7 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>                 { "unquoted",   no_argument,    NULL,           'Q' },
>                 { "utc",        no_argument,    &cfg->timestamp_fmt,    1=
 },
>                 { "version",    no_argument,    NULL,           'v' },
> +               { "initial-state",      no_argument,    NULL,           '=
S' },
>                 { GETOPT_NULL_LONGOPT },
>         };
>
> @@ -197,6 +200,9 @@ static int parse_config(int argc, char **argv, struct=
 config *cfg)
>                 case 's':
>                         cfg->strict =3D true;
>                         break;
> +               case 'S':
> +                       cfg->initial_state =3D true;
> +                       break;
>                 case 'h':
>                         print_help();
>                         exit(EXIT_SUCCESS);
> @@ -353,6 +359,24 @@ static void event_print(struct gpiod_edge_event *eve=
nt,
>                 event_print_human_readable(event, resolver, chip_num, cfg=
);
>  }
>
> +static void initial_line_values_print(struct line_resolver *resolver,
> +                       struct config *cfg)
> +{
> +       printf("\nInitial line state(s): ");
> +       int i;
> +       const char *fmt =3D cfg->unquoted ? "%s=3D%s" : "\"%s\"=3D%s";
> +
> +       for (i =3D 0; i < resolver->num_lines; i++) {
> +               struct resolved_line *line =3D &resolver->lines[i];
> +
> +               printf(fmt, line->id,
> +               line->value ? "active" : "inactive");
> +               if (i !=3D resolver->num_lines - 1)
> +                       printf(" ");
> +       }
> +       printf("\n");
> +}

It's not a hill I'll die on but gpioset already implements code for
doing this. Any chance you could abstract parts of it into
tools-common.c and reuse it here instead?

> +
>  int main(int argc, char **argv)
>  {
>         struct gpiod_edge_event_buffer *event_buffer;
> @@ -363,6 +387,7 @@ int main(int argc, char **argv)
>         int num_lines, events_done =3D 0;
>         struct gpiod_edge_event *event;
>         struct line_resolver *resolver;
> +       enum gpiod_line_value *values;
>         struct timespec idle_timeout;
>         struct gpiod_chip *chip;
>         struct pollfd *pollfds;
> @@ -423,7 +448,9 @@ int main(int argc, char **argv)
>         requests =3D calloc(resolver->num_chips, sizeof(*requests));
>         pollfds =3D calloc(resolver->num_chips, sizeof(*pollfds));
>         offsets =3D calloc(resolver->num_lines, sizeof(*offsets));
> -       if (!requests || !pollfds || !offsets)
> +       values =3D calloc(resolver->num_lines, sizeof(*values));

This can fail (I mean, not on linux but still, it's good practice),
please check the return value. And free this memory at the end like we
do for everything else.

> +
> +       if (!requests || !pollfds || !offsets || !values)
>                 die("out of memory");
>
>         for (i =3D 0; i < resolver->num_chips; i++) {
> @@ -445,6 +472,14 @@ int main(int argc, char **argv)
>                         die_perror("unable to request lines on chip %s",
>                                    resolver->chips[i].path);
>
> +               if (cfg.initial_state) {
> +                       ret =3D gpiod_line_request_get_values(requests[i]=
, values);
> +                       if (ret)
> +                               die_perror("unable to read GPIO line valu=
es");

It doesn't seem like you use values elsewhere, maybe you can allocate
it only if needed inside this block?

> +                       set_line_values(resolver, i, values);
> +                       initial_line_values_print(resolver, &cfg);
> +               }
> +
>                 pollfds[i].fd =3D gpiod_line_request_get_fd(requests[i]);
>                 pollfds[i].events =3D POLLIN;
>                 gpiod_chip_close(chip);
>

Bart

