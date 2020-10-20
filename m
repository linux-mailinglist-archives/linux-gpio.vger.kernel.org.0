Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871D8293FFD
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 17:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436960AbgJTPxn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 11:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436948AbgJTPxn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Oct 2020 11:53:43 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66A0C061755
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 08:53:42 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id q9so4135343iow.6
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=avkppn1nvGzytvrzJHoI6sgxmDiQpW+NnoRrImVuiik=;
        b=W3zElbaNea7cFheAn6fztAuFn9447paKlB27jmUQXCu+tP2+9bhc9X8XZDXlOxb5Ge
         PBeL6lFLlOr2gmNg9Rv1POJDHpuDfzsFmRR18nUyKtt6xESogfDPtLcLnmrNO6NAffvE
         bWt6P4XWhTi0480sK79qSuiycxLQZ2oh031tT3mMdCmaI0mhyEs0g1M0hjmhnIfm1GQt
         yHlIiQymS/kXy0ABs3XVOW54HMloLVMtoTVMrQw0QCiymOhIGhu1nOGNaEy/BoB2a0bV
         nuJ5dR+R9mE3hokZ4J3jUsExDREd+Oa7s5GXic3dd1xXSnot2+RCPOBp79F5z4cI2xH+
         Yelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=avkppn1nvGzytvrzJHoI6sgxmDiQpW+NnoRrImVuiik=;
        b=MuRhFZ13CLTmAm434m1Lu9MdbXlMsL4F4XagmARIKxdfLtNkcj4cQk+eQBrP/EZ6K5
         E9xyDXoxF5Ht7pU8avFqJaUmeNHPPWneKJocp/ro/+7uNi6fnqAAhzOzAlg+nWII4jGp
         040PQ/vxtRzP6Rx6kYTudI/9IoIpqjDgLuDVBJ5P6tFdfd4VAHdzZCKQXL0Yo4ok0ElC
         hw2Df6+MDUX8oDnEZYVRA3+ZvXDw53vkW9YZvBpHClNaZTC+SrPyil0gpAlupUBxk8Pi
         g8uIrs1To/Y66wKdJF7YR4vhwqGdiDbjYGuJkoTJDzDiJNl335IN+T7603JpCr0TwNgW
         yrSw==
X-Gm-Message-State: AOAM533cVmtOj9H7trHzEKf0dVHMqojHJgN/u6WnG5n21Li1yJ6Xihz0
        fCaMruPQtLoOizrdqnWCIF/v48hRYXAodqu3pPB6CB1Z15c2yA==
X-Google-Smtp-Source: ABdhPJwMgX0S4/RDoXtbvlEmdqMNy12s4/ToTGXOvXxAL2ahJMn/qfGfIcYllWt8QV6acWg5ZL7Qkk/4BJSOGJxjpIc=
X-Received: by 2002:a02:c80a:: with SMTP id p10mr2536176jao.114.1603209222096;
 Tue, 20 Oct 2020 08:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol> <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol> <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
 <20201019162142.GA85778@sol> <CAMRc=MfoqJURP_X5uhMe4Gz=5h55pHpq90cNZmocA+rkMgb99Q@mail.gmail.com>
 <20201020150558.GA17003@sol>
In-Reply-To: <20201020150558.GA17003@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 20 Oct 2020 17:53:31 +0200
Message-ID: <CAMRc=MfbVTZF_=e7dtLEtKMzd0WQfEPBVzYDaamkyUZWoxbeoQ@mail.gmail.com>
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

On Tue, Oct 20, 2020 at 5:06 PM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

> > >
> > > I don't have a problem with that definition, appropriately documented,
> > > but I wouldn't want to expose that to the user, so my preference would
> > > be to make it opaque, but....
> > >
> > > ... that will make the API more awkward to use, as the methods that
> > > populate a bulk will now have to have that bulk constructed beforehand.
> > > Or you change them to accept a struct gpiod_line_bulk ** to return the
> > > bulk constructed by libgpiod.  Either way the user will have to free the
> > > bulk afterwards.  But there are only a few of those of those methods.
> > >
> >
> > Or we can even make these methods return struct gpiod_line_bulk *
> > which is cleaner than passing struct gpiod_line_bulk ** as argument
> > IMO. I'm fine with that.
> >
>
> Returning NULL for the error cases, as per gpiod_chip_find_line()?
>

Yes, definitely.

> > > And all the bulk accesor methods are currently inline - that would also
> > > have to change if you go opaque, so you will get a code size and
> > > performance hit as well.
> >
> > This may slightly increase the size of the library indeed but it will
> > decrease the size of the user programs. Anyway: we're talking about
> > miniscule changes. Performance hit isn't that much of a concern either
> > - function calls are fast and we're not adding new system calls that
> > could lead to more context switches.
> >
>
> Those inlines are just simple field accessors and mutators, and you'd hope
> that has less overhead than a function call.
>
> Opaque is certainly preferable - it reduces the API surface and you are
> also free to change the implementation later.
>
> Can we also add in range checking to functions that accept offsets while
> you are at it? e.g. gpiod_line_bulk_get_line() should return NULL if the
> offset is out of range. Or are we assuming that the user will always
> ensure offset < num_lines first?  If the latter can we at least document
> the bad behaviour if offset >= num_lines?
>

Yes, that's what I already have in my dev branch - functions that
return errors but I imagine, the users wouldn't be forced to check
these return values if they are sure the supplied arguments are
correct. If we ever use the warn_unused_result attribute in the
library - the bulk functions would not be annotated with it.

> > >
> > > Maybe keeping it exposed is the best - just heavily documented?
> > > At least start out that way, since it is closest to what is already there.
> > >
> >
> > I'm now actually leaning more towards making it opaque but I need to
> > find a way to make gpiod_line_bulk_foreach_line work with hidden bulk
> > struct.
> >
>
> Why not just drop it in favour of gpiod_line_bulk_foreach_line_off()?
>

The one with the line being supplied to the user automatically is more
elegant. If anything - I'd prefer to drop
gpiod_line_bulk_foreach_line_off(). Callbacks as suggested by Andy is
a good idea - something like what GLib does in a lot of helpers for
lists etc.

Bartosz
