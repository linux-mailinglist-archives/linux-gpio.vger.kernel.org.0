Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC23293F37
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 17:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbgJTPGG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 11:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727760AbgJTPGG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Oct 2020 11:06:06 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A50DC061755
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 08:06:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id kk5so580017pjb.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2020 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NLO/kyoiVTRHBk9XLBOTJXvMqM8KfeR+WZjSZI7VV48=;
        b=Q6GmW0cztxnr6HXBg5IEmDRRGPpNa9VWAWXmrAR1K5k2iSj7D7SOOoPxY23bWHJCQT
         XPWVFn/T6QTWUXKVi4tdaTt+CXmlD62o07+v3BfitgzPARSWpu3K/2xA413kma/KfBo5
         /UJmuxAMB+2yFgyTBq1KadEaWYUozpwcUHjKmAm79WAGxXQKW4NC+L3xvHEUgl0LX3QH
         opic06t/S6IYbkrEaZHqcrAINYhQli9HqOSLzjxATgUDgPTPHSOOmwbKgghMyhYgybAF
         8QLJi+80q4E8z/HwERGXoiX7z4kheBI7Rf7OfJPQJhRkGQmeBF3t91BRE6rGtbcx+TAc
         yp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NLO/kyoiVTRHBk9XLBOTJXvMqM8KfeR+WZjSZI7VV48=;
        b=oEQo+GqivMLwS3zhunG98VlnhRjLF20vO5CpapZdDwIt3zba3ebJnDZNPuw8jdklnP
         66GL5lFrYqq+HvpDEDLCdcAPzczfvJWFgJ1O/01+EzS98kfXnAytNMynsxsjCI6EAqTO
         frloUUbcJvUhZsuk9GOJrb2ROPdylCazqXFWJW5VjsRcvL7cz+D4ExNP9JmOfBhS2LZi
         LNgPJ2kTl1o5b0FMr0eEOnDLj/XlrcP/QPAi73CdQtBj/hw4/qSfTTB0GSJM/xRgpOf1
         Aw/Px3rl+X6zOZMVF1Dkfx7248JbII6rObRvCpngpMXiQqm9sqdLrGeViD/Y9yubfW3U
         9C/Q==
X-Gm-Message-State: AOAM532/Mlx1NcfUGXzsJWH0JK9n/e3w4W8dkqOPWRZ02RvPbQsowRj1
        mREjeyqItQKQ/deu2ZFVAUI=
X-Google-Smtp-Source: ABdhPJy5vm9/mVvlJEyJpHSOa8fSYS1jVTPjB0mVflE4mzmTc1IIVfuvjX603VE1ZYCvPWyObISmxQ==
X-Received: by 2002:a17:902:a98b:b029:d5:d9d5:e6cf with SMTP id bh11-20020a170902a98bb02900d5d9d5e6cfmr418052plb.58.1603206365930;
        Tue, 20 Oct 2020 08:06:05 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id b3sm2268423pjz.57.2020.10.20.08.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 08:06:04 -0700 (PDT)
Date:   Tue, 20 Oct 2020 23:05:58 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
Message-ID: <20201020150558.GA17003@sol>
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol>
 <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol>
 <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
 <20201019162142.GA85778@sol>
 <CAMRc=MfoqJURP_X5uhMe4Gz=5h55pHpq90cNZmocA+rkMgb99Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfoqJURP_X5uhMe4Gz=5h55pHpq90cNZmocA+rkMgb99Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 20, 2020 at 12:47:02PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 19, 2020 at 6:21 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Oct 19, 2020 at 03:31:07PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Oct 13, 2020 at 10:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >
> > > [snip]
> > >
> > > > >
> > > > > struct gpiod_line_bulk {
> > > > >     struct gpiod_chip *owner;
> > > > >     unsigned int num_lines;
> > > > >     uint64_t lines;
> > > > > };
> > > > >
> > > > > And the 'lines' bitmap should actually refer to offsets at which the
> > > > > owning chip stores the line pointers in its own 'lines' array - up to
> > > > > 64 lines.
> > > > >
> > > > > But we'd still have to sanitize the values when adding lines to a bulk
> > > > > object and probably check the return value. I'm wondering if there's a
> > > > > better way to store group references to lines on the stack but I'm out
> > > > > of ideas.
> > > > >
> > > >
> > > > So you are proposing keeping the bulk of the bulk in the background and
> > > > passing around a flyweight in its place.  Makes sense.
> > > >
> > >
> > > So this won't fly of course because a bitmap doesn't hold enough
> > > information to reference an arbitrary number of lines in the chip in
> > > any meaningful way.
> > >
> >
> > Yeah, that is what I was trying to get at earlier, but from your replies
> > I assumed you would have an array mapping from bitmap index to line
> > hidden somewhere behind the scenes on a per-bulk basis...
> >
> > > I have another idea. I can live with struct gpiod_bulk being allocated
> > > dynamically whenever users of the library use it - because it's quite
> > > unlikely they'd do it all that often. What I'd like to avoid is
> > > allocating a new bulk object whenever we want to package a single line
> > > passed to e.g. gpiod_line_request() before we propagate it to
> > > gpiod_line_request_bulk().
> > >
> > > How about we define struct gpiod_line_bulk as:
> > >
> > > struct gpiod_line_bulk {
> > >     unsigned int num_lines;
> > >     unsigned int max_num_lines;
> > >     struct gpiod_line *lines[1];
> > > };
> > >
> > > And expose it in gpiod.h header?
> > >
> >
> > I don't have a problem with that definition, appropriately documented,
> > but I wouldn't want to expose that to the user, so my preference would
> > be to make it opaque, but....
> >
> > ... that will make the API more awkward to use, as the methods that
> > populate a bulk will now have to have that bulk constructed beforehand.
> > Or you change them to accept a struct gpiod_line_bulk ** to return the
> > bulk constructed by libgpiod.  Either way the user will have to free the
> > bulk afterwards.  But there are only a few of those of those methods.
> >
> 
> Or we can even make these methods return struct gpiod_line_bulk *
> which is cleaner than passing struct gpiod_line_bulk ** as argument
> IMO. I'm fine with that.
> 

Returning NULL for the error cases, as per gpiod_chip_find_line()?

> > And all the bulk accesor methods are currently inline - that would also
> > have to change if you go opaque, so you will get a code size and
> > performance hit as well.
> 
> This may slightly increase the size of the library indeed but it will
> decrease the size of the user programs. Anyway: we're talking about
> miniscule changes. Performance hit isn't that much of a concern either
> - function calls are fast and we're not adding new system calls that
> could lead to more context switches.
> 

Those inlines are just simple field accessors and mutators, and you'd hope
that has less overhead than a function call.

Opaque is certainly preferable - it reduces the API surface and you are
also free to change the implementation later.

Can we also add in range checking to functions that accept offsets while
you are at it? e.g. gpiod_line_bulk_get_line() should return NULL if the
offset is out of range. Or are we assuming that the user will always
ensure offset < num_lines first?  If the latter can we at least document
the bad behaviour if offset >= num_lines?

> >
> > Maybe keeping it exposed is the best - just heavily documented?
> > At least start out that way, since it is closest to what is already there.
> >
> 
> I'm now actually leaning more towards making it opaque but I need to
> find a way to make gpiod_line_bulk_foreach_line work with hidden bulk
> struct.
> 

Why not just drop it in favour of gpiod_line_bulk_foreach_line_off()?

Cheers,
Kent.
