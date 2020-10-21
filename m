Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F912948EE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 09:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408252AbgJUHdR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 03:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408228AbgJUHdR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2020 03:33:17 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA11C0613CE
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 00:33:15 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id k1so1430690ilc.10
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 00:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KVTKSDj8JUm+SZ+O/7nUD/TkPrGc45B7vx0eiF6aG9M=;
        b=2B/WfvwVOU86sA+UFGLLJe4lRQ1gjxu1WcdAHiMaDbjJg0+k2SdgUi6/FeTZJDrqy5
         J8Vd/KQNo+gy1G1uXwy84qJco3NzQqCsJH+rqa3fjxIeXmrKfsbVGvH/jzTLCtImlhgd
         vGxFuCbDJelJpX+5ewTdNLf3NignBtvEnfK5VXi3mIYaIDea7a9pcMxl/JpPL1BlaVwt
         lMQBC2R/WI3pnN8iCjfIrdVar0DkgL+7w2aa7hEHsI2322I4fRAMtyIvF0wcBg0/dT7O
         YRNp8/Hys+gVWr28lXQi4NPnF+PlZ1RWUU+5/D6t4ddbidfx6OmqYK+klqJBjgaB76JA
         IZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KVTKSDj8JUm+SZ+O/7nUD/TkPrGc45B7vx0eiF6aG9M=;
        b=SVFfJZN5AIZOH8YmC/iGzyORSdFjCpB7uDFPJ/9bBahAnXIGmSImW2mtz3a6j8ChuZ
         bUl6L8gTf6DFltbnwX7otVEeG6tHyvKMfOR0frta9/6JqAJD4JWSarpU4gO7mSWgtt0K
         z+ljyz2fjdMo4HQCeYwQOTG0gCojbDEouvqvlIRu+xm7VksrdyloBN1SVDu1ld+y+/7Y
         ZPbQ0HEOIy7yyA3uOsurSWoePOkUA7/u0lvEL7Ymbfp9Yann4fE1zf97h3sgkyA9QsGP
         ZkCU45p6+oeEBL/XSYi8NoRGfmsH90BUdbVyNtmFcuIR74tI/jTWVwWtPAANHJkkBngu
         Zskg==
X-Gm-Message-State: AOAM531DY7tZsycJX2rxSzGVP/s33nOVvvVpQZIg8TyNY9kh81DbJC5X
        2AP+XQ1Xzj6IDnqad9W9e3mI+Mi6QgjLoruF/0vCWw==
X-Google-Smtp-Source: ABdhPJxumWxM0P58bXJ9AfMxKzIGHvECdAWNsJWE4Nf1GEMxyZTFXArmGC/dkmZStdsgnYsj9//WRSgTrRGlaasEkrY=
X-Received: by 2002:a92:1952:: with SMTP id e18mr1429668ilm.189.1603265594993;
 Wed, 21 Oct 2020 00:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol> <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol> <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
 <20201019162142.GA85778@sol> <CAMRc=MfoqJURP_X5uhMe4Gz=5h55pHpq90cNZmocA+rkMgb99Q@mail.gmail.com>
 <20201020150558.GA17003@sol> <CAMRc=MfbVTZF_=e7dtLEtKMzd0WQfEPBVzYDaamkyUZWoxbeoQ@mail.gmail.com>
 <20201020222440.GA4920@sol>
In-Reply-To: <20201020222440.GA4920@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 21 Oct 2020 09:33:03 +0200
Message-ID: <CAMRc=Mf9EEjVFSvguGzem2awf36DOJoib-nwTrJr6G1xzjT5rg@mail.gmail.com>
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

On Wed, Oct 21, 2020 at 12:24 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Oct 20, 2020 at 05:53:31PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 20, 2020 at 5:06 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> >
> [snip]
> > > >
> > > > I'm now actually leaning more towards making it opaque but I need to
> > > > find a way to make gpiod_line_bulk_foreach_line work with hidden bulk
> > > > struct.
> > > >
> > >
> > > Why not just drop it in favour of gpiod_line_bulk_foreach_line_off()?
> > >
> >
> > The one with the line being supplied to the user automatically is more
> > elegant. If anything - I'd prefer to drop
> > gpiod_line_bulk_foreach_line_off(). Callbacks as suggested by Andy is
> > a good idea - something like what GLib does in a lot of helpers for
> > lists etc.
> >
>
> Not sure what you mean here - they both return the line, the difference
> is how they store the loop state, with gpiod_line_bulk_foreach_line()
> exposing the bulk->lines array via the lineptr.  That is the source of
> your problem if you go opaque - that array becomes hidden, as it
> probably should be.
>

No idea what I meant either. :)

When using a function with a callback we no longer need the user to
supply the memory for storing the loop state - it can be stored in the
stack frame of said function - so the callback should only take the
line as argument (+ void * user data) and the user can store the loop
state however they like. This is how I see it.

Bartosz
