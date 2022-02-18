Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707214BBFC3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Feb 2022 19:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239483AbiBRSna (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 13:43:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239455AbiBRSnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 13:43:15 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEDD2A0D5C
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:42:48 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id w3so16979766edu.8
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Hu8lDHwm7E5XzqDgLfCXGXt1lM9AfLjGlpZVIJmWao=;
        b=BHbV4GzRobEoqnX0Li//XYGxkLIQSll6/qWCgA7iPGOQdW3iqSb/LdpBZFm2oGtJo5
         Jl5V29UzbdtfxX6oIw/Th1eW5oAvM2LQC3Fh0GioOxKPm2XCr40rEN2kVW0fRlB+sX4/
         oJs2+iQkSub91wWPszVQEBHewICPWbbOB3slS+tWHqB4yKeuBDCIRGW9HsCR66QmNrgw
         XCihpIHLXuSe6H4cZCI3by0XdacmJXJGhpdFFS+fbIwdwtYk8aMi/iNMRSbsHgLnDILL
         VNMOWNYCyYNlL23cU7xoDQ6S+oEgGaCgjtGOFC2ZDOseu4LuTo+pIW+VbzOYeVdC0nbf
         VH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Hu8lDHwm7E5XzqDgLfCXGXt1lM9AfLjGlpZVIJmWao=;
        b=Qtda83YAcTqfnvG8S2leMNr1INF5gygw+3ZKqM4ZY+uLlEo4KKHhNgu7aqMxrKE67V
         Q3KaPI9KB9LGseJOfKB+jtF4+fiGJojbs4a50ad5yifcvjEHbyNgJw0qc2J8dMs+f6II
         TgsLVeigZ8ELcfVX5kk2GCm4uPN+cF92gWk7GD7fZQ1A8arYHaoyiELnNacFEce9WxbL
         soZZUq6Ql+ODhn4ZCYIRYv0VR+NWwNsZfcPX7LcnB2OyKHH6dFBtddGKPFjtz7/eu8gI
         Vy5UP83oLWGOBs8VFVKvPQG6kpXQzJ+FgkP6eQ1J10fM0MKs7BzJzrotmnKihmT1y//x
         L8MA==
X-Gm-Message-State: AOAM530p7aTnvuMO3twF91Ozr0B4goTXhU811wYIU6hCUKgvbTWBvbwq
        HSNHvAowSUdyZCkd+oA64f++6SoxfcpRQIjAwq6UzNPn0D8=
X-Google-Smtp-Source: ABdhPJxCoArofCRQDdBkNlm8Q0FzFJvmb1XZaE5d4A7cgcfjLTDLGEbcmXt/qgXP11+CLdXOrR71wUMOCOTtnJeUZj0=
X-Received: by 2002:aa7:d6c3:0:b0:40f:405a:fbf8 with SMTP id
 x3-20020aa7d6c3000000b0040f405afbf8mr9413346edr.447.1645209767216; Fri, 18
 Feb 2022 10:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20220202114204.31918-1-joel@jms.id.au> <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
In-Reply-To: <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Feb 2022 19:42:36 +0100
Message-ID: <CAMRc=McUht0K+=86VfV7Z8kOU+DMoaYbX65_CrA8WVVE9XhxvA@mail.gmail.com>
Subject: Re: [libgpiod PATCH] core: Fix line_bulk_foreach_line invalid memory access
To:     Joel Stanley <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 18, 2022 at 7:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Wed, Feb 2, 2022 at 12:42 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Running libgpiod applications under valgrind results in the following
> > warning:
> >
> > ==3006== Invalid read of size 8
> > ==3006==    at 0x10C867: line_request_values (core.c:711)
> > ==3006==    by 0x10CDA6: gpiod_line_request_bulk (core.c:849)
> > ==3006==    by 0x10AE27: main (gpioset.c:323)
> > ==3006==  Address 0x4a4d370 is 0 bytes after a block of size 16 alloc'd
> > ==3006==    at 0x483F790: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
> > ==3006==    by 0x10B884: gpiod_line_bulk_new (core.c:109)
> > ==3006==    by 0x10DBB0: gpiod_chip_get_lines (helpers.c:24)
> > ==3006==    by 0x10ADC3: main (gpioset.c:313)
> >
> > This is because the foreach loop reads the next value before checking
> > that index is still in bounds.
> >
> > Add a test to avoid reading past the end of the allocation.
> >
> > This bug is not present a released version of libgpiod.
> >
> > Fixes: 2b02d7ae1aa6 ("treewide: rework struct gpiod_line_bulk")
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  lib/core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/core.c b/lib/core.c
> > index 6ef09baec0f5..4463a7014776 100644
> > --- a/lib/core.c
> > +++ b/lib/core.c
> > @@ -178,7 +178,8 @@ GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
> >  #define line_bulk_foreach_line(bulk, line, index)                      \
> >         for ((index) = 0, (line) = (bulk)->lines[0];                    \
> >              (index) < (bulk)->num_lines;                               \
> > -            (index)++, (line) = (bulk)->lines[(index)])
> > +            (index)++,                                                 \
> > +            (line) = (index) < (bulk)->num_lines ? (bulk)->lines[(index)] : NULL)
> >
> >  GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
> >  {
> > --
> > 2.34.1
> >
>
> I'll skip this because this entire struct is going away in v2 and the
> bug is not present in v1.6.x.
>
> Bart

Ugh actually all three patches fix issues in the master branch that
have never been nor will be released.

I'm not sure if I made myself clear on that - the changes in the
master branch are going away and the de facto new API is in
next/libgpiod-2.0. I already pushed the other two so I'll leave them
there but please take a look at the next branch so that you know how
the upcoming API will work. That's also applicable to the patches
adding the by-name option to the tools - I think it would be better to
base them on that branch right away.

Bart
