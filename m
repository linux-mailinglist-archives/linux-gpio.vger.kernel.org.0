Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 098CCF02A0
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 17:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390223AbfKEQY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 11:24:57 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43987 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390163AbfKEQY4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 11:24:56 -0500
Received: by mail-ot1-f67.google.com with SMTP id l14so3791008oti.10
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ACgV5Qz5qoyvObJcEokfh+YgIcM7Wy3YFVfH8xgbTzc=;
        b=DL7+MBWxDUInhQs1/f5s+0GxJ7vFSDvgdWStkRgtBFKU5G2g9HfrNQee9J05NFIOnU
         qSOXTOUOvuQMHVKdn7ImT9t6myz46c9jJod8Fbz9ES3ayDxzbcTzKes2HgBo2y0LaSEJ
         +5LmS634Tgztk5LLHzSQsd9NXa6JtNCASAgO1wv8n+THRo5W8n3sRZSGQgMn8dtkDvEM
         BITfKmcRVPdWRNonO3Glra5/hkDy32JnrOBdgzVtWNuZ232ovQSNMMwmOVWrAeAaFndR
         sn+LCDNYWGbZQPcnt5i2p7rEuMdarLs84eZinhdtxWs6FcZuazCNqgtqn9BFJKK39BHK
         ftyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ACgV5Qz5qoyvObJcEokfh+YgIcM7Wy3YFVfH8xgbTzc=;
        b=d+XRz+Pqc96BN07+86bpfQUOvwtYggOoVqEFYJVpw/dtBbsBjsJu0XXyrLZK0Ec4Pz
         q6Y3l9VIAjUncImchN+OIrYho+EWNqmVbt78KCEP+ZgsCjuDCnaxJy+ZUFfwt3N62cpu
         t4iumaMFlQohMb+owT+lEjHDDM8k2J36uHnVz3+TosLHaXfd+3eS5F53IiRMxw2EOit9
         dNbDmxExNfUNIStR0mhYTcPZwGzOfG0iKY52YCFP6P63EzrN0zIWNxEkE68WuZyroFtK
         trcKL4LKjvxWdWx7+EfGoHDDzIiO8HAJMjYCf6+gMlealGGp6Ad6qT8YE6hvQFjayD0N
         BMhA==
X-Gm-Message-State: APjAAAWHeoBYglc2gBRdy7eW/18g0XiYEGigdlBv2w583RbjV9Oub67w
        OQwUGvTLtboWtnf2YVHSYveXi2aU1oEasUkdLC/oMXrp
X-Google-Smtp-Source: APXvYqy6gSr7jDVDGTYpTQtwu/Hi/udUDEg77f72I6s4/Ast7rnnATqWf1qnkubrn97mDUlyoHmx6U51d5ADGrc2N4c=
X-Received: by 2002:a9d:7d09:: with SMTP id v9mr23847324otn.292.1572971095664;
 Tue, 05 Nov 2019 08:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20191105020429.18942-1-warthog618@gmail.com> <20191105152616.GA19978@sol>
In-Reply-To: <20191105152616.GA19978@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 5 Nov 2019 17:24:44 +0100
Message-ID: <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 5 lis 2019 o 16:26 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a):
>
> On Tue, Nov 05, 2019 at 10:04:22AM +0800, Kent Gibson wrote:
> > Patches are against Bart's gpio/for-kent branch[1].
> >
> > The patch has been successfully tested against gpio-mockup, and
> > on a Raspberry Pi, in both cases using the feature/pud_set_config
> > branch of my Go gpiod library[2], as well as with my feature/pud
> > development branch of libgpiod[3].  Patch 7 has only been tested using
> > my gpiod library as libgpiod has not yet been updated to support the
> > SET_CONFIG ioctl.
> >
>
> I've just pushed a first pass at SET_CONFIG support into my libgpiod
> feature/pud branch.  It is causing me a bit of grief.  Due to the way
> the libgpiod API is structured, with the direction flags pulled out into
> the request type, I thought it would be cleaner to keep changes to direct=
ion
> orthogonal to changes to the other handle flags.
>

I'd love to see that branch - is it public?

> So I've added these methods to the API:
>
> int gpiod_line_set_config(struct gpiod_line *line, int flags)
> int gpiod_line_set_direction_input(struct gpiod_line *line)
> int gpiod_line_set_direction_output(struct gpiod_line *line,
>                                     int value)
>
> along with their bulk equivalents.
>
> I've coded that and started adding tests when I tripped over changing
> bias.  The kernel requires a direction to be set, but I'm setting it
> as-is in gpiod_line_set_config - so that wont work.
> Open drain/source are in the same boat - they require output mode.
>

Ha! Yes this is a problem - how about this:

If the caller of set_config in the kernel doesn't pass any of the
direction flags, then we read the current direction, set the right
flag in lflags and only then call the function validating the flags?

> I see these options:
>  1. set the direction as part of gpiod_line_set_config
>  2. relax the kernel restriction.

Yes, I don't think we should force users to always pass the direction
flag in set_config. Good point.

>  3. don't support changing bias or open source/drain.

No! We definitely want to support it in libgpiod.

>  4. rethink the API.

As for libgpiod: I think we should have a low-level
gpiod_line_set_config() that would set both the direction and other
flags (it could for instance only accept two request flags: input and
output) and then a higher-level set_flags(), set_direction_input(),
set_direction_output() that would call the low-level variant and - for
set_flags() without the direction argument - it could simply retrieve
the current direction and pass it to gpiod_line_set_config().

But this is only a vague idea - I'd have to actually start looking at
the code to be sure. I'd love to see what you came up with so far
though!

Bart

>
> The first option requires caching the value set for outputs which I'm a
> bit hesitant to do, though I'm not sure why - I've already added caching
> of the handle flags for the direction functions.
>
> Any preferences or suggestions?
>
> Cheers,
> Kent.
