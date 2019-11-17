Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F7CFF9D0
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2019 14:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfKQNMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Nov 2019 08:12:21 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:45724 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfKQNMV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Nov 2019 08:12:21 -0500
Received: by mail-pj1-f67.google.com with SMTP id m71so711327pjb.12
        for <linux-gpio@vger.kernel.org>; Sun, 17 Nov 2019 05:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Y2q0xDXJgGTlhl4yOGTJTT+G3wtfq1bvBmKXpyGc+XY=;
        b=QnAVFbDITB3SPG9p2CA7M/cPvN/eKnYciVNw+0etmf0wR7YffamOZVo8akNU2aVWaL
         o2jT7R0lcjUShETvW5TMYbYZ58wJwaAdzqXsiosqWGxk2mPpczxnwsaDcgMbNUxgybHb
         9ZoAZA8pAPpbSP/i0Sq+gnxS9sEk4JRFFP7ZPxXwMx6CWzLILAAjLAZU9xBNIKEGQavd
         oXFHQcP3SJP4O9IL1X/iGkEMk5jOC5VlheZMAdRj/buTGflLJhsnTK0KPIYSehZk4EIo
         ZEZnFgEB+aLNQ2aw8kfEg3ZcP0E1L+glBZ4N5vMlwz0tuZNNc+eLpmN9SFj2MWobRw/G
         oAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Y2q0xDXJgGTlhl4yOGTJTT+G3wtfq1bvBmKXpyGc+XY=;
        b=LrEojCsPISVyWIAt65FlPVUnM7VVNfgE5n/6qQDFyaIlL2rtb+CGutayqViilO58a5
         v/4Ap82d76/gDfWihRkTGCX/dSqr0c3qKbgJmVhd6mltxqoJgjFsuQzUe60lSZ/df9kC
         QYVfuEA8JWnJn8UQN2mqe1BtguW7kmDPIPnJO5N8I+JFdyhwxBcW+IKiUd7VjszHQ7GJ
         ADjYpAifg12FIbCK4Ml37Bwb6Si7vJ7LryoxC/ceJwiTf0E5yDJ+0djhTLRvgsCXPUfw
         oHBxGaFAnwxXkM/x/33aagb1Mh/MPuKsQxY7baqgYeePyK404R+nSk2t2MJrHyi9rf4g
         b3vw==
X-Gm-Message-State: APjAAAWAT05bm34w7msanGGrkSEPLwQBvFLq+l++9Wvjw841BQabJCT2
        jNJuedT4lJlimmQjXRkB3WcFzim4XiA=
X-Google-Smtp-Source: APXvYqx1+H+6rZVUv0cbDP0U+vFp5GPSzvKftdzMGgVE9ATsLee20E/9/FAdTGnDupl7KRfq/lDanw==
X-Received: by 2002:a17:90a:1b69:: with SMTP id q96mr32887674pjq.89.1573996338180;
        Sun, 17 Nov 2019 05:12:18 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s18sm18104075pfc.120.2019.11.17.05.12.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2019 05:12:17 -0800 (PST)
Date:   Sun, 17 Nov 2019 21:12:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 18/19] tools: add support for bias flags
Message-ID: <20191117131212.GA17921@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-19-warthog618@gmail.com>
 <20191116154028.GA30166@sol>
 <CAMpxmJXGZ3BF8YpdA=RmGQ91gUpvevL1H7v1Vm2S770E565j4Q@mail.gmail.com>
 <20191117122801.GA16015@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191117122801.GA16015@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 17, 2019 at 08:28:01PM +0800, Kent Gibson wrote:
> On Sun, Nov 17, 2019 at 01:18:26PM +0100, Bartosz Golaszewski wrote:
> > sob., 16 lis 2019 o 16:40 Kent Gibson <warthog618@gmail.com> napisał(a):
> > >
> > > On Fri, Nov 15, 2019 at 10:43:54PM +0800, Kent Gibson wrote:
> > > > Add support for bias flags to applicable tools - gpioget, gpioset, and
> > > > gpiomon.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > > >  tools/gpioget.c | 24 ++++++++++++++++++++----
> > > >  tools/gpiomon.c | 28 ++++++++++++++++++++++------
> > > >  tools/gpioset.c | 26 +++++++++++++++++++++-----
> > > >  3 files changed, 63 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/tools/gpioget.c b/tools/gpioget.c
> > > > index 196ebeb..025811a 100644
> > > > --- a/tools/gpioget.c
> > > > +++ b/tools/gpioget.c
> > > > @@ -17,10 +17,13 @@ static const struct option longopts[] = {
> > > >       { "help",       no_argument,    NULL,   'h' },
> > > >       { "version",    no_argument,    NULL,   'v' },
> > > >       { "active-low", no_argument,    NULL,   'l' },
> > > > +     { "pull-down",  no_argument,    NULL,   'D' },
> > > > +     { "pull-up",    no_argument,    NULL,   'U' },
> > > > +     { "bias-disable", no_argument,  NULL,   'B' },
> > > >       { GETOPT_NULL_LONGOPT },
> > > >  };
> > > >
> > > > -static const char *const shortopts = "+hvl";
> > > > +static const char *const shortopts = "+hvlDUB";
> > > >
> > > >  static void print_help(void)
> > > >  {
> > > > @@ -32,6 +35,9 @@ static void print_help(void)
> > > >       printf("  -h, --help:\t\tdisplay this message and exit\n");
> > > >       printf("  -v, --version:\tdisplay the version and exit\n");
> > > >       printf("  -l, --active-low:\tset the line active state to low\n");
> > > > +     printf("  -D, --pull-down:\tenable internal pull-down\n");
> > > > +     printf("  -U, --pull-up:\tenable internal pull-up\n");
> > > > +     printf("  -B, --bias-disable:\tdisable internal bias\n");
> > > >  }
> > > >
> > > >  int main(int argc, char **argv)
> > > > @@ -39,6 +45,7 @@ int main(int argc, char **argv)
> > > >       unsigned int *offsets, i, num_lines;
> > > >       int *values, optc, opti, rv;
> > > >       bool active_low = false;
> > > > +     int flags = 0;
> > > >       char *device, *end;
> > > >
> > > >       for (;;) {
> > > > @@ -56,6 +63,15 @@ int main(int argc, char **argv)
> > > >               case 'l':
> > > >                       active_low = true;
> > > >                       break;
> > > > +             case 'D':
> > > > +                     flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
> > > > +                     break;
> > > > +             case 'U':
> > > > +                     flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
> > > > +                     break;
> > > > +             case 'B':
> > > > +                     flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
> > > > +                     break;
> > > >               case '?':
> > > >                       die("try %s --help", get_progname());
> > > >               default:
> > > > @@ -86,9 +102,9 @@ int main(int argc, char **argv)
> > > >                       die("invalid GPIO offset: %s", argv[i + 1]);
> > > >       }
> > > >
> > >
> > > Nuts - this is wrong - it should be using the CTXLESS flags, not the
> > > LINE_REQUEST flags.  That applies to all three of the tools changed.
> > > I forgot to propagate the last minute CTXLESS changes to the tools.
> > > And unfortunately we don't have test cases for the tools :-(.
> > 
> > But we do![1]
> > 
> 
> Damn - I missed that.  I'll see about adding some cases for the bias
> flags for v2.
> 

I've pushed some tests for the tools bias and drive options to my github
branch.  I will include them in v2.
They use the --bias/--drive forms as that is what is currently at the HEAD,
but it is trivial to change them to the distinct flag versions if you
prefer that.

Cheers,
Kent.

> 
> > > I've got a fix in my github branch that I will incorporate into v2.
> > >
> > > I'm also wondering if it would be preferable to replace the individual
> > > bias command line flags with a single bias parameter, e.g. --bias=pull-up
> > > I've coded that in my github branch as well, if you would care to
> > > compare.
> > >
> > > Let me know if you'd like a v2, otherwise I'll hold off for a few days
> > > in case something else crops up.
> > 
> > Let me review the rest before that, I'll do this tomorrow.
> > 
> > Bart
> > 
> > >
> > > Cheers,
> > > Kent.
> > 
> > [1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tools/gpio-tools-test.bats
