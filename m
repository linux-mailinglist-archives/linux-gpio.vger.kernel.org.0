Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9E09FF95E
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2019 13:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfKQMSk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Nov 2019 07:18:40 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45003 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfKQMSj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Nov 2019 07:18:39 -0500
Received: by mail-oi1-f194.google.com with SMTP id s71so12746164oih.11
        for <linux-gpio@vger.kernel.org>; Sun, 17 Nov 2019 04:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7WkzCSmGSvgkfrKW2kC5CgdzgSsr9VunNl9H+IvF3kQ=;
        b=Gldc8SSt7oRCcdsZ40arRUPXlHXajl/IjtfJ7i1i+CTiQtEC/Anvq07hhQHgKknNmE
         IIM2lZR8HruwL5VvYhU9SL/NAc3wbr2DDu2en9c5ucUnYjwyZ0Z+FXBUGq19TvKZ1Dvj
         S1rGI7b6P9OJfEe7BLha/MnzcMYSWrTKbg3GsXlOAl6owV9MHP1cPglLf2YVTKymprVr
         KQuUoJUw52Ti82Tp9ItzwiSnxPRcfHQN75KHUfLTNTVafcj8dnrAqwSyDcykYRApviPB
         lmMFGrWXOmtaq874vcssBHfzT8Y6mlo5LUZwyYvWc07gRF1ybMpSzxTScLP81YgVfPXk
         sCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7WkzCSmGSvgkfrKW2kC5CgdzgSsr9VunNl9H+IvF3kQ=;
        b=HmH2DgpNQOT1Vtk/vgxF9T19urpoiCEH4pwzAl9Ka1PJekxQ89YXVEtcbBGG6TA6qW
         HQZXWNf1CthqAXGdW44lGVrJzehMvNmRt8NcLMvJbW8V3WKPOtyQGyul6o7IyEc0sf1c
         0CKN06OnNzzZRqemO5hN6Fo8BGyXjIez2STjN+53ZtSTxGFREOD0qC7uj7Uhl/PjV74p
         ZdJtOCqQntaG9/b9yZVPj6RsVsjTHBS1VD5EiRbcXjRxknzfUnTD2eVB5T8fNeGJlFal
         QL5xqTkDbN9PD3vmiHgQhbFL8O6y+5Fo5ccNz+xo+5gUMLBalYiCRvShIemaXqA2joaK
         8gBw==
X-Gm-Message-State: APjAAAWYXfWWuKwsSv5VK/1+3Oj6jrZWVbjqearD5QVdpv8R5sQ/FRGL
        3vxoUrI1vEMLeRZgRPV5hqpyutTR46OR21jchKvhiyIbsog=
X-Google-Smtp-Source: APXvYqxGyOPCvlk/ADyGSHknLzS7wtMaaqtxh5fGjSaHfZ2/uj1KwlvuUigaeFVbDQg0lXFkd0Z3K+GewbD28wbcFNE=
X-Received: by 2002:a05:6808:9a1:: with SMTP id e1mr16186289oig.175.1573993117400;
 Sun, 17 Nov 2019 04:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <20191115144355.975-19-warthog618@gmail.com>
 <20191116154028.GA30166@sol>
In-Reply-To: <20191116154028.GA30166@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 17 Nov 2019 13:18:26 +0100
Message-ID: <CAMpxmJXGZ3BF8YpdA=RmGQ91gUpvevL1H7v1Vm2S770E565j4Q@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 18/19] tools: add support for bias flags
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 16 lis 2019 o 16:40 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Fri, Nov 15, 2019 at 10:43:54PM +0800, Kent Gibson wrote:
> > Add support for bias flags to applicable tools - gpioget, gpioset, and
> > gpiomon.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  tools/gpioget.c | 24 ++++++++++++++++++++----
> >  tools/gpiomon.c | 28 ++++++++++++++++++++++------
> >  tools/gpioset.c | 26 +++++++++++++++++++++-----
> >  3 files changed, 63 insertions(+), 15 deletions(-)
> >
> > diff --git a/tools/gpioget.c b/tools/gpioget.c
> > index 196ebeb..025811a 100644
> > --- a/tools/gpioget.c
> > +++ b/tools/gpioget.c
> > @@ -17,10 +17,13 @@ static const struct option longopts[] =3D {
> >       { "help",       no_argument,    NULL,   'h' },
> >       { "version",    no_argument,    NULL,   'v' },
> >       { "active-low", no_argument,    NULL,   'l' },
> > +     { "pull-down",  no_argument,    NULL,   'D' },
> > +     { "pull-up",    no_argument,    NULL,   'U' },
> > +     { "bias-disable", no_argument,  NULL,   'B' },
> >       { GETOPT_NULL_LONGOPT },
> >  };
> >
> > -static const char *const shortopts =3D "+hvl";
> > +static const char *const shortopts =3D "+hvlDUB";
> >
> >  static void print_help(void)
> >  {
> > @@ -32,6 +35,9 @@ static void print_help(void)
> >       printf("  -h, --help:\t\tdisplay this message and exit\n");
> >       printf("  -v, --version:\tdisplay the version and exit\n");
> >       printf("  -l, --active-low:\tset the line active state to low\n")=
;
> > +     printf("  -D, --pull-down:\tenable internal pull-down\n");
> > +     printf("  -U, --pull-up:\tenable internal pull-up\n");
> > +     printf("  -B, --bias-disable:\tdisable internal bias\n");
> >  }
> >
> >  int main(int argc, char **argv)
> > @@ -39,6 +45,7 @@ int main(int argc, char **argv)
> >       unsigned int *offsets, i, num_lines;
> >       int *values, optc, opti, rv;
> >       bool active_low =3D false;
> > +     int flags =3D 0;
> >       char *device, *end;
> >
> >       for (;;) {
> > @@ -56,6 +63,15 @@ int main(int argc, char **argv)
> >               case 'l':
> >                       active_low =3D true;
> >                       break;
> > +             case 'D':
> > +                     flags |=3D GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN=
;
> > +                     break;
> > +             case 'U':
> > +                     flags |=3D GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
> > +                     break;
> > +             case 'B':
> > +                     flags |=3D GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
> > +                     break;
> >               case '?':
> >                       die("try %s --help", get_progname());
> >               default:
> > @@ -86,9 +102,9 @@ int main(int argc, char **argv)
> >                       die("invalid GPIO offset: %s", argv[i + 1]);
> >       }
> >
>
> Nuts - this is wrong - it should be using the CTXLESS flags, not the
> LINE_REQUEST flags.  That applies to all three of the tools changed.
> I forgot to propagate the last minute CTXLESS changes to the tools.
> And unfortunately we don't have test cases for the tools :-(.

But we do![1]

> I've got a fix in my github branch that I will incorporate into v2.
>
> I'm also wondering if it would be preferable to replace the individual
> bias command line flags with a single bias parameter, e.g. --bias=3Dpull-=
up
> I've coded that in my github branch as well, if you would care to
> compare.
>
> Let me know if you'd like a v2, otherwise I'll hold off for a few days
> in case something else crops up.

Let me review the rest before that, I'll do this tomorrow.

Bart

>
> Cheers,
> Kent.

[1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gp=
io-tools-test.bats
