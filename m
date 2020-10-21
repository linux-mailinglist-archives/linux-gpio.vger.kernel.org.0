Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898AE294958
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 10:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407827AbgJUI3Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 04:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407519AbgJUI3Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2020 04:29:24 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEB8C0613CE
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 01:29:24 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id n9so1048756pgt.8
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gOTbISMRVl2PhE2BQ5Q5SSqB79X6XyQQyaFYI+Lc0uI=;
        b=CizGBLANK1C6c5uM3cFPjocTbeIGonkanRhyzl22cf87fvOYw/jRX8ewgelV4HZJgL
         ooOc6mjLbaTL0ygooxSiF5ZbAjUDkMZ6eJbYnXfD+uP9RvC7B42W6iu/JnacXz3ibJiy
         8267GIaDh6rrfKnPJAZoMXxoVJEx8dI+k4hTW10kt9+EyVqLp1cInITrg4jNqWZd8ImN
         CmVYuU6WM1eGu/cu7oEdTPim0DWg+mxqdp6MFQUGA9N7vfaVWmiJF2Pb+R7xUTgqMSEe
         O1UqLGVeksbiCK8fPlXk4sijiIBQRm4kTw28zJcPVY2PSd6adEsek5rA3lsdfazIJ3wb
         qH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gOTbISMRVl2PhE2BQ5Q5SSqB79X6XyQQyaFYI+Lc0uI=;
        b=YiW2MYj3lhei0OjQwEGH/89RdC6hzJQlUzC5SrJRxDN5t7+iqkqPcl0BDgQtjXW/eg
         eXghvhAPb8Qv+T+0clkfE0DXfZtGld7zr8us8bF1MuBW0PQA0xMYpvcQCVzZA8i2lXqZ
         dhB6G3YCl1gyRX7HoBgzHhhWATKi0kX667eg94YE7L6ZS13Ymc8AAB6KInR504qd5a4Y
         oaqSBjrUgHjUbWsLFMerxKOEHLbILpo9UHyLwLa/zj2lX2Q9oPjtPx5sScn7d13ZjAlA
         vW6qLtGTHGbQqgZcNCIp3U+6DVgLNrm9XU78Spldqyc6I04NlHqUOD/116TcEx3VTUpX
         WlJA==
X-Gm-Message-State: AOAM531eq7zZniBEVa2xLhQjb5ADlP/pSPeVeETyAdI4tJuk6OQBjcuy
        SYm3UqN3utSGEseUWmris0g=
X-Google-Smtp-Source: ABdhPJw+c3TohD33DzMv6zrSRzyRi+66t4HRavc2c9k+VoWU1gAuk4SKhE/3uabaWHkRQyb/GqHRjg==
X-Received: by 2002:a62:5215:0:b029:156:6a80:a257 with SMTP id g21-20020a6252150000b02901566a80a257mr2413168pfb.63.1603268963411;
        Wed, 21 Oct 2020 01:29:23 -0700 (PDT)
Received: from sol (106-69-190-250.dyn.iinet.net.au. [106.69.190.250])
        by smtp.gmail.com with ESMTPSA id p188sm1646071pgp.65.2020.10.21.01.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:29:22 -0700 (PDT)
Date:   Wed, 21 Oct 2020 16:29:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
Message-ID: <20201021082917.GA22853@sol>
References: <20201013005252.GA9387@sol>
 <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol>
 <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
 <20201019162142.GA85778@sol>
 <CAMRc=MfoqJURP_X5uhMe4Gz=5h55pHpq90cNZmocA+rkMgb99Q@mail.gmail.com>
 <20201020150558.GA17003@sol>
 <CAMRc=MfbVTZF_=e7dtLEtKMzd0WQfEPBVzYDaamkyUZWoxbeoQ@mail.gmail.com>
 <20201020222440.GA4920@sol>
 <CAMRc=Mf9EEjVFSvguGzem2awf36DOJoib-nwTrJr6G1xzjT5rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf9EEjVFSvguGzem2awf36DOJoib-nwTrJr6G1xzjT5rg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 09:33:03AM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 21, 2020 at 12:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Oct 20, 2020 at 05:53:31PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Oct 20, 2020 at 5:06 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >
> > [snip]
> > > > >
> > > > > I'm now actually leaning more towards making it opaque but I need to
> > > > > find a way to make gpiod_line_bulk_foreach_line work with hidden bulk
> > > > > struct.
> > > > >
> > > >
> > > > Why not just drop it in favour of gpiod_line_bulk_foreach_line_off()?
> > > >
> > >
> > > The one with the line being supplied to the user automatically is more
> > > elegant. If anything - I'd prefer to drop
> > > gpiod_line_bulk_foreach_line_off(). Callbacks as suggested by Andy is
> > > a good idea - something like what GLib does in a lot of helpers for
> > > lists etc.
> > >
> >
> > Not sure what you mean here - they both return the line, the difference
> > is how they store the loop state, with gpiod_line_bulk_foreach_line()
> > exposing the bulk->lines array via the lineptr.  That is the source of
> > your problem if you go opaque - that array becomes hidden, as it
> > probably should be.
> >
> 
> No idea what I meant either. :)
> 
> When using a function with a callback we no longer need the user to
> supply the memory for storing the loop state - it can be stored in the
> stack frame of said function - so the callback should only take the
> line as argument (+ void * user data) and the user can store the loop
> state however they like. This is how I see it.
> 

That makes sense - if you are going opaque then the callback is cleaner.

Will the callback have any return code, say to trigger a break from the
loop?

Cheers,
Kent.
