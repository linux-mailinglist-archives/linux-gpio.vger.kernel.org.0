Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B86293956
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 12:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393295AbgJTKrO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 06:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390218AbgJTKrO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Oct 2020 06:47:14 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15657C061755
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 03:47:14 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id j13so1583171ilc.4
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 03:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pCa5kD9yeyyJ5NE+QQ8oD6FXR20pGyxayfGYunEz1Pc=;
        b=zkgLymDK550MDtd+16fqZJJFIa0FO+2mzMUthxz5HlZeGZe5utaiT466xVREmt/bUj
         5omcCdZSGbY+TMp3IjgPJqyhwpbXgwm9aUDlqcv+LObl8QkSkHQH/riLEVoInQ50Ysmj
         zDLHfgeOZqoGkSeFaySJzn1m3izb7PBfQTTx2xj5rpdhZ+YocABBTOJ8EAgSf0iMX8S1
         xFQgWjYNoKChQn65alL8hWk55bBFMQ8I+x0LZMxvI/pCS3JVyegY0OO8KOod9Zk5Mr7Y
         bjmgZ18AtukL5pqNX8WN/Htsoo9tvbl7ryn9fEGuibpL6f7GxWPNX3D0PnE2Y1roHWxt
         CDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pCa5kD9yeyyJ5NE+QQ8oD6FXR20pGyxayfGYunEz1Pc=;
        b=NT9Def5sjvnh40Lrak4E1REJMDdFe8WwDgE98NMaKm2x+e93wrPGWrTr2vhreAj2C0
         Adp/p0vHWzX9ec46QWrXWMHiDZGOmKXhp/pxjxvv+s0jw94vbvH/5spWVM0Pa6Dvco8O
         f7bRZf2PWKLwVQbNe2AaFiliilL/2TAhEx4TRsLeg7wfqPSP4Akv0f4KLaiHPCRmOc/3
         PjqaYldWSWkF8i+JqmZGrwDUw7YjaJkVMFpD+v7a46BC7EkCNQ9C22bPt5TOJp7lNksX
         9CjubT7xZs8uJfCoSFFH28+gfewyXwURi96kopOQkdnvTM7+albQl1PDr6atBV0hTapO
         hkQQ==
X-Gm-Message-State: AOAM532nufytQi+Su4RGkW+uAMPCeL6pNbWem3wWQSfN6sGN60z8ZPw9
        NK7yAdpkEl8tttSMM5X1WCki3F8TGpSHQATOoO35hBxT0JA=
X-Google-Smtp-Source: ABdhPJzfk4ymLxlrqFVUcS6xofpE1DVukweJ7TlUuR+TUeQmS5XUyrDQohnOz8Dz8mUOTFmsd33QzZ03x5YaprbheNM=
X-Received: by 2002:a92:b610:: with SMTP id s16mr1566769ili.6.1603190833384;
 Tue, 20 Oct 2020 03:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol> <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol> <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
 <20201019162142.GA85778@sol>
In-Reply-To: <20201019162142.GA85778@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 20 Oct 2020 12:47:02 +0200
Message-ID: <CAMRc=MfoqJURP_X5uhMe4Gz=5h55pHpq90cNZmocA+rkMgb99Q@mail.gmail.com>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 6:21 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Oct 19, 2020 at 03:31:07PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 13, 2020 at 10:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> >
> > [snip]
> >
> > > >
> > > > struct gpiod_line_bulk {
> > > >     struct gpiod_chip *owner;
> > > >     unsigned int num_lines;
> > > >     uint64_t lines;
> > > > };
> > > >
> > > > And the 'lines' bitmap should actually refer to offsets at which the
> > > > owning chip stores the line pointers in its own 'lines' array - up to
> > > > 64 lines.
> > > >
> > > > But we'd still have to sanitize the values when adding lines to a bulk
> > > > object and probably check the return value. I'm wondering if there's a
> > > > better way to store group references to lines on the stack but I'm out
> > > > of ideas.
> > > >
> > >
> > > So you are proposing keeping the bulk of the bulk in the background and
> > > passing around a flyweight in its place.  Makes sense.
> > >
> >
> > So this won't fly of course because a bitmap doesn't hold enough
> > information to reference an arbitrary number of lines in the chip in
> > any meaningful way.
> >
>
> Yeah, that is what I was trying to get at earlier, but from your replies
> I assumed you would have an array mapping from bitmap index to line
> hidden somewhere behind the scenes on a per-bulk basis...
>
> > I have another idea. I can live with struct gpiod_bulk being allocated
> > dynamically whenever users of the library use it - because it's quite
> > unlikely they'd do it all that often. What I'd like to avoid is
> > allocating a new bulk object whenever we want to package a single line
> > passed to e.g. gpiod_line_request() before we propagate it to
> > gpiod_line_request_bulk().
> >
> > How about we define struct gpiod_line_bulk as:
> >
> > struct gpiod_line_bulk {
> >     unsigned int num_lines;
> >     unsigned int max_num_lines;
> >     struct gpiod_line *lines[1];
> > };
> >
> > And expose it in gpiod.h header?
> >
>
> I don't have a problem with that definition, appropriately documented,
> but I wouldn't want to expose that to the user, so my preference would
> be to make it opaque, but....
>
> ... that will make the API more awkward to use, as the methods that
> populate a bulk will now have to have that bulk constructed beforehand.
> Or you change them to accept a struct gpiod_line_bulk ** to return the
> bulk constructed by libgpiod.  Either way the user will have to free the
> bulk afterwards.  But there are only a few of those of those methods.
>

Or we can even make these methods return struct gpiod_line_bulk *
which is cleaner than passing struct gpiod_line_bulk ** as argument
IMO. I'm fine with that.

> And all the bulk accesor methods are currently inline - that would also
> have to change if you go opaque, so you will get a code size and
> performance hit as well.

This may slightly increase the size of the library indeed but it will
decrease the size of the user programs. Anyway: we're talking about
miniscule changes. Performance hit isn't that much of a concern either
- function calls are fast and we're not adding new system calls that
could lead to more context switches.

>
> Maybe keeping it exposed is the best - just heavily documented?
> At least start out that way, since it is closest to what is already there.
>

I'm now actually leaning more towards making it opaque but I need to
find a way to make gpiod_line_bulk_foreach_line work with hidden bulk
struct.

Bartosz
