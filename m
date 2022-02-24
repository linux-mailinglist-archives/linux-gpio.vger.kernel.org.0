Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5644C2EA7
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 15:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiBXOvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 09:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiBXOvA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 09:51:00 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5806A222182
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 06:50:30 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id qx21so4823799ejb.13
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yHQScCfPSxk1/2qgU1rzoQQDyNgB9x+6ryIxhq8g+cw=;
        b=pwGBOUEAyJs9ZXumudOWjhbbY0HCOjePpUknR//4S/oTtBkW9k6aTVC1Eugs4DmXA1
         gqVVu/0BGwBHz7/lGUE+gdoFkP/iuza2gWLGV9E42SjWLmK0BcT62DMRoavN67YQqGLq
         nLmnfqApSvdrIFPKX2TkTvjbTSCsZcaasmPt65IqaBGq5r20t9mmhUStx0SduM8EsMrZ
         jPmeETHr6hmSImnbmtiifneD015L6fThw+xHhWH9YhQnDVbTeM4gBfC2fmOc65cyiJfL
         a7Hk+UkTC0wnm3G2lsUHA3hlHklThRgdI6ZGYwbe2tOXUHr3n5e2zBPUFMvHraCKOzu1
         dJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yHQScCfPSxk1/2qgU1rzoQQDyNgB9x+6ryIxhq8g+cw=;
        b=0B67nYEBNl9Qp1ub0U382awyviVIdYUpkmIk6XDrgs1H9jjlBBtJs2+LBUel1JD3p3
         wTB5cpK2hBqLMQfc/F2dbup7PmFvH0DZA8UL5QSJRSGxxI6gHvCRyvgYjXRoJB0nxgY9
         Ny+JqhWucdAnjp8zBfnqNReYIrXkTen9x8dnFU/bwgsvsMCcCMyXjJu6f764uuYQb3CX
         hbf/omYknDVgZbaexnUI3NFDLkdN2Xj64ij4dqIIi6vEi1L1YaIseA1Gic0EBYaUV0lU
         AEFdJ/vNqouqf4BXrMigizPzA0UqkqMG2MFKa9VsGBaOgJLU4yxcJIb1FobNYswiz3vC
         ATog==
X-Gm-Message-State: AOAM530PyT056+wJzICTW7FP0rh3dp/uTVGDyEcGoJPhcsXfXG135vb9
        cX8mlVa8AyMhdZioBViiK2pC0+5BpC9RDrwjtF2usptqTsQ=
X-Google-Smtp-Source: ABdhPJw8wYuOeFTGn4WR7KRWRicVGdEDcLQ/oUcZSALtTQYeG8F+K4jqbOwxBN/4fGfEd7ovtyPAle7GVExn2Ux1ShQ=
X-Received: by 2002:a17:906:8606:b0:6d1:5031:86da with SMTP id
 o6-20020a170906860600b006d1503186damr2573603ejx.734.1645714228781; Thu, 24
 Feb 2022 06:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20220202114204.31918-1-joel@jms.id.au> <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
 <CAMRc=McUht0K+=86VfV7Z8kOU+DMoaYbX65_CrA8WVVE9XhxvA@mail.gmail.com> <CACPK8XeN9Ym8wGVmZ15HprGb+UePY51tmcptC2o9zbUgTcP6HQ@mail.gmail.com>
In-Reply-To: <CACPK8XeN9Ym8wGVmZ15HprGb+UePY51tmcptC2o9zbUgTcP6HQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 24 Feb 2022 15:50:18 +0100
Message-ID: <CAMRc=McSdV9pxxyiHWeD-nr0VKcchEG7LnT=Z8f8f8pqd_USOQ@mail.gmail.com>
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

On Thu, Feb 24, 2022 at 2:15 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 18 Feb 2022 at 18:42, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Fri, Feb 18, 2022 at 7:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > On Wed, Feb 2, 2022 at 12:42 PM Joel Stanley <joel@jms.id.au> wrote:
> > > >
> > > > Running libgpiod applications under valgrind results in the following
> > > > warning:
> > > >
> > > > ==3006== Invalid read of size 8
> > > > ==3006==    at 0x10C867: line_request_values (core.c:711)
> > > > ==3006==    by 0x10CDA6: gpiod_line_request_bulk (core.c:849)
> > > > ==3006==    by 0x10AE27: main (gpioset.c:323)
> > > > ==3006==  Address 0x4a4d370 is 0 bytes after a block of size 16 alloc'd
> > > > ==3006==    at 0x483F790: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
> > > > ==3006==    by 0x10B884: gpiod_line_bulk_new (core.c:109)
> > > > ==3006==    by 0x10DBB0: gpiod_chip_get_lines (helpers.c:24)
> > > > ==3006==    by 0x10ADC3: main (gpioset.c:313)
> > > >
> > > > This is because the foreach loop reads the next value before checking
> > > > that index is still in bounds.
> > > >
> > > > Add a test to avoid reading past the end of the allocation.
> > > >
> > > > This bug is not present a released version of libgpiod.
> > > >
> > > > Fixes: 2b02d7ae1aa6 ("treewide: rework struct gpiod_line_bulk")
> > > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > > ---
> > > >  lib/core.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/lib/core.c b/lib/core.c
> > > > index 6ef09baec0f5..4463a7014776 100644
> > > > --- a/lib/core.c
> > > > +++ b/lib/core.c
> > > > @@ -178,7 +178,8 @@ GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
> > > >  #define line_bulk_foreach_line(bulk, line, index)                      \
> > > >         for ((index) = 0, (line) = (bulk)->lines[0];                    \
> > > >              (index) < (bulk)->num_lines;                               \
> > > > -            (index)++, (line) = (bulk)->lines[(index)])
> > > > +            (index)++,                                                 \
> > > > +            (line) = (index) < (bulk)->num_lines ? (bulk)->lines[(index)] : NULL)
> > > >
> > > >  GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
> > > >  {
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > I'll skip this because this entire struct is going away in v2 and the
> > > bug is not present in v1.6.x.
> > >
> > > Bart
> >
> > Ugh actually all three patches fix issues in the master branch that
> > have never been nor will be released.
> >
> > I'm not sure if I made myself clear on that - the changes in the
> > master branch are going away and the de facto new API is in
> > next/libgpiod-2.0. I already pushed the other two so I'll leave them
> > there but please take a look at the next branch so that you know how
> > the upcoming API will work. That's also applicable to the patches
> > adding the by-name option to the tools - I think it would be better to
> > base them on that branch right away.
>
> That's a bit frustrating.
>

I know and I'm sorry. I admit that this is not the best time to try to
get new features in.

> Perhaps you could make the master branch contain the code you're
> working on (instead of next), if you plan on abandoning the current
> code base?

I can't just yet. I want to keep the codebase bisectable and only
merge the new API into master once it's complete for the C, C++ and
Python parts. The branch called next/libgpiod-2.0 contains the WIP
changes but they are not complete yet. I just posted the test suite
for C and plan on posting the complete C++ bindings soon.

In fact - we discussed it with Kent and Linus and I expect to be able
to release the v2 in around two months and merge the new API into
master in a month.

You can base your work on next/libgpiod-2.0 but could you just hold
off the new features until after the new API is in master?

Thank you for your understanding,
Bart
