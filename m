Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4519E4C2129
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 02:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiBXBn2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 20:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiBXBn2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 20:43:28 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B4861A07
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 17:42:55 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id n185so655662qke.5
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 17:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vx2Zk6+SWiLdSaoXgQipdaVqnvHH4v+4mNsECcKDgiw=;
        b=WJ8avMMsby9jJ/c3Ni0a/WYvxexsEm+96dBq+9n04NXDClAvo9f/eRG/OtbcvFWLIr
         dSy/DB7VE79t7I+K6NSdQscCltHlzyY6O7JFxUx/V4F2Uqt2XzHXSEJkjLRcxZ/MIWxb
         4lqfi9QcrpAO3CRWg3uSqwYZdy5gn9dJbDZJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vx2Zk6+SWiLdSaoXgQipdaVqnvHH4v+4mNsECcKDgiw=;
        b=ITysLF9qAID4LveqxLjlucRT77oja05j3LnfdNkLKtXK6KLxnXk9jZIuCT0MoV1FBx
         s/0AZ7CF9QK8GYmoSWQ+pHxCA/OEQBBTneaupEQp2mjzrSthl1Cw0JNYxNJ/AvlcuvDa
         DC4gd6l3NRO1UyfCiTNtHso1Juh603fFuBgtow1GqUw05MlRo0Pi6sbUIJuRhra2Yr/R
         49uBlqHcKc+MtTzh7diXFS8hBtJgukuZ5Z1YcobJ6UyQ6iVnGJsAEQy4uU16FobciM/G
         WA+n8tO1Znw9VIGrToksa6fkXc8mPmS0lB0AhHaJUHZqUoc2FsjqYAPJbCqdrqAkZMjA
         d0EQ==
X-Gm-Message-State: AOAM531mwPs5j4KNFJpUsl16f4oASSZSxRW24BsJLscMDnHy/OaxrHe5
        HQEu7BFfAjEPid85JMX08spManliZwQUDa1tuFvmI83Y
X-Google-Smtp-Source: ABdhPJyeNQv3IZFiTS6yCMfIoZSAbZuAJ6qWGzi/2h/5barSNgpaPvee/aqUujOpNhfp/i301QqVLWcrwI6xp2fc1mQ=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr442431qta.58.1645665334114; Wed, 23 Feb
 2022 17:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20220202114204.31918-1-joel@jms.id.au> <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
 <CAMRc=McUht0K+=86VfV7Z8kOU+DMoaYbX65_CrA8WVVE9XhxvA@mail.gmail.com>
In-Reply-To: <CAMRc=McUht0K+=86VfV7Z8kOU+DMoaYbX65_CrA8WVVE9XhxvA@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 24 Feb 2022 01:15:22 +0000
Message-ID: <CACPK8XeN9Ym8wGVmZ15HprGb+UePY51tmcptC2o9zbUgTcP6HQ@mail.gmail.com>
Subject: Re: [libgpiod PATCH] core: Fix line_bulk_foreach_line invalid memory access
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 18 Feb 2022 at 18:42, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Feb 18, 2022 at 7:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Wed, Feb 2, 2022 at 12:42 PM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > Running libgpiod applications under valgrind results in the following
> > > warning:
> > >
> > > ==3006== Invalid read of size 8
> > > ==3006==    at 0x10C867: line_request_values (core.c:711)
> > > ==3006==    by 0x10CDA6: gpiod_line_request_bulk (core.c:849)
> > > ==3006==    by 0x10AE27: main (gpioset.c:323)
> > > ==3006==  Address 0x4a4d370 is 0 bytes after a block of size 16 alloc'd
> > > ==3006==    at 0x483F790: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
> > > ==3006==    by 0x10B884: gpiod_line_bulk_new (core.c:109)
> > > ==3006==    by 0x10DBB0: gpiod_chip_get_lines (helpers.c:24)
> > > ==3006==    by 0x10ADC3: main (gpioset.c:313)
> > >
> > > This is because the foreach loop reads the next value before checking
> > > that index is still in bounds.
> > >
> > > Add a test to avoid reading past the end of the allocation.
> > >
> > > This bug is not present a released version of libgpiod.
> > >
> > > Fixes: 2b02d7ae1aa6 ("treewide: rework struct gpiod_line_bulk")
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  lib/core.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/lib/core.c b/lib/core.c
> > > index 6ef09baec0f5..4463a7014776 100644
> > > --- a/lib/core.c
> > > +++ b/lib/core.c
> > > @@ -178,7 +178,8 @@ GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
> > >  #define line_bulk_foreach_line(bulk, line, index)                      \
> > >         for ((index) = 0, (line) = (bulk)->lines[0];                    \
> > >              (index) < (bulk)->num_lines;                               \
> > > -            (index)++, (line) = (bulk)->lines[(index)])
> > > +            (index)++,                                                 \
> > > +            (line) = (index) < (bulk)->num_lines ? (bulk)->lines[(index)] : NULL)
> > >
> > >  GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
> > >  {
> > > --
> > > 2.34.1
> > >
> >
> > I'll skip this because this entire struct is going away in v2 and the
> > bug is not present in v1.6.x.
> >
> > Bart
>
> Ugh actually all three patches fix issues in the master branch that
> have never been nor will be released.
>
> I'm not sure if I made myself clear on that - the changes in the
> master branch are going away and the de facto new API is in
> next/libgpiod-2.0. I already pushed the other two so I'll leave them
> there but please take a look at the next branch so that you know how
> the upcoming API will work. That's also applicable to the patches
> adding the by-name option to the tools - I think it would be better to
> base them on that branch right away.

That's a bit frustrating.

Perhaps you could make the master branch contain the code you're
working on (instead of next), if you plan on abandoning the current
code base?
