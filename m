Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B701CFF97A
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2019 13:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfKQM2I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Nov 2019 07:28:08 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35604 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfKQM2H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Nov 2019 07:28:07 -0500
Received: by mail-pj1-f65.google.com with SMTP id s8so694735pji.2
        for <linux-gpio@vger.kernel.org>; Sun, 17 Nov 2019 04:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BHHXml1mej3jh7F+ZZKYf0mcBskDphGNF5ttZa0IC9c=;
        b=s43zSTlx8TbWid8JSFLF9aaBZ6SxVlZceX8iqKkDcl8Mrvi2zBS5w9lH6MuwpCoNp4
         wt3J+YgCyopMEKHWwkSJZdE8xzrAwRUm35HXKMGN+tCH+hUq7ynQApSzCRmCN8pPikLT
         7R/6IBeiW72boMH3uCtP5P1RBXRXpg0htPOk/Kny92LjKDVOMhsdiUkUNRO9DRblGwqO
         XFW04iMXOMFlBiZbhNYGILBaP3EES7H8kmHoifqSrpSQ/AbtFl4ccpspn4En6+AAuGrq
         xA1znxW4wPmqV7vO59cku2I943jkUgCSqvwXvn2rYRg+oxS8hGjLETmC5x6/IBvm5Xdj
         bq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BHHXml1mej3jh7F+ZZKYf0mcBskDphGNF5ttZa0IC9c=;
        b=ed/N8nplozcIJgzH0vMf4jFumEiAvV4UMtZfgDq41C/8CDqMaJi2GjEfxysepjUoMJ
         vHnSOIJnBDALaOaQzQPtzvxyMy/amhnRZa/xvdkHLpUa9ej9chb7PPt2fm/D7FWmUmSt
         KE+qy4HNeinzm6RgNKKpG2QHmgMnk7gi+/z9539vZrLjVHS/azZzwbqnUEQp0ryyCCi1
         ahRvDzxvHhVmEoHBhT/6cJPtps0wTcSfTkZFkPwglBrWhof9kbtU+oruyRHGh9NhJwC9
         fLlT2EJ8QNLpae0a3j7TYHOU/8FgzkVXphFRPxMj+B4EbTuNQeqq6GKbXqVVL5z5VDa6
         aAgA==
X-Gm-Message-State: APjAAAXYlsYLSHQD9kuoFjNErLLEaUf7F3kTq6qyD12HcfkQq9ZLE0qb
        mHg0mEiQVytlKCpsRiTkcVa0GTIAyDM=
X-Google-Smtp-Source: APXvYqwHQZQ1C8lTYaPm49QFAxhEcWY35Oht9C3BnnQahVaYJ0clc4BMuq1y1//XxT6DX1nleEsy/A==
X-Received: by 2002:a17:90a:3807:: with SMTP id w7mr33305117pjb.33.1573993686291;
        Sun, 17 Nov 2019 04:28:06 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id r5sm17184832pfh.179.2019.11.17.04.28.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2019 04:28:05 -0800 (PST)
Date:   Sun, 17 Nov 2019 20:28:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 18/19] tools: add support for bias flags
Message-ID: <20191117122801.GA16015@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-19-warthog618@gmail.com>
 <20191116154028.GA30166@sol>
 <CAMpxmJXGZ3BF8YpdA=RmGQ91gUpvevL1H7v1Vm2S770E565j4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXGZ3BF8YpdA=RmGQ91gUpvevL1H7v1Vm2S770E565j4Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 17, 2019 at 01:18:26PM +0100, Bartosz Golaszewski wrote:
> sob., 16 lis 2019 o 16:40 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Fri, Nov 15, 2019 at 10:43:54PM +0800, Kent Gibson wrote:
> > > Add support for bias flags to applicable tools - gpioget, gpioset, and
> > > gpiomon.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > >  tools/gpioget.c | 24 ++++++++++++++++++++----
> > >  tools/gpiomon.c | 28 ++++++++++++++++++++++------
> > >  tools/gpioset.c | 26 +++++++++++++++++++++-----
> > >  3 files changed, 63 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/tools/gpioget.c b/tools/gpioget.c
> > > index 196ebeb..025811a 100644
> > > --- a/tools/gpioget.c
> > > +++ b/tools/gpioget.c
> > > @@ -17,10 +17,13 @@ static const struct option longopts[] = {
> > >       { "help",       no_argument,    NULL,   'h' },
> > >       { "version",    no_argument,    NULL,   'v' },
> > >       { "active-low", no_argument,    NULL,   'l' },
> > > +     { "pull-down",  no_argument,    NULL,   'D' },
> > > +     { "pull-up",    no_argument,    NULL,   'U' },
> > > +     { "bias-disable", no_argument,  NULL,   'B' },
> > >       { GETOPT_NULL_LONGOPT },
> > >  };
> > >
> > > -static const char *const shortopts = "+hvl";
> > > +static const char *const shortopts = "+hvlDUB";
> > >
> > >  static void print_help(void)
> > >  {
> > > @@ -32,6 +35,9 @@ static void print_help(void)
> > >       printf("  -h, --help:\t\tdisplay this message and exit\n");
> > >       printf("  -v, --version:\tdisplay the version and exit\n");
> > >       printf("  -l, --active-low:\tset the line active state to low\n");
> > > +     printf("  -D, --pull-down:\tenable internal pull-down\n");
> > > +     printf("  -U, --pull-up:\tenable internal pull-up\n");
> > > +     printf("  -B, --bias-disable:\tdisable internal bias\n");
> > >  }
> > >
> > >  int main(int argc, char **argv)
> > > @@ -39,6 +45,7 @@ int main(int argc, char **argv)
> > >       unsigned int *offsets, i, num_lines;
> > >       int *values, optc, opti, rv;
> > >       bool active_low = false;
> > > +     int flags = 0;
> > >       char *device, *end;
> > >
> > >       for (;;) {
> > > @@ -56,6 +63,15 @@ int main(int argc, char **argv)
> > >               case 'l':
> > >                       active_low = true;
> > >                       break;
> > > +             case 'D':
> > > +                     flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
> > > +                     break;
> > > +             case 'U':
> > > +                     flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
> > > +                     break;
> > > +             case 'B':
> > > +                     flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
> > > +                     break;
> > >               case '?':
> > >                       die("try %s --help", get_progname());
> > >               default:
> > > @@ -86,9 +102,9 @@ int main(int argc, char **argv)
> > >                       die("invalid GPIO offset: %s", argv[i + 1]);
> > >       }
> > >
> >
> > Nuts - this is wrong - it should be using the CTXLESS flags, not the
> > LINE_REQUEST flags.  That applies to all three of the tools changed.
> > I forgot to propagate the last minute CTXLESS changes to the tools.
> > And unfortunately we don't have test cases for the tools :-(.
> 
> But we do![1]
> 

Damn - I missed that.  I'll see about adding some cases for the bias
flags for v2.

Kent.

> > I've got a fix in my github branch that I will incorporate into v2.
> >
> > I'm also wondering if it would be preferable to replace the individual
> > bias command line flags with a single bias parameter, e.g. --bias=pull-up
> > I've coded that in my github branch as well, if you would care to
> > compare.
> >
> > Let me know if you'd like a v2, otherwise I'll hold off for a few days
> > in case something else crops up.
> 
> Let me review the rest before that, I'll do this tomorrow.
> 
> Bart
> 
> >
> > Cheers,
> > Kent.
> 
> [1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpio-tools-test.bats
