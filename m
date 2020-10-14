Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CAB28DAEE
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgJNIOx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbgJNIOi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:14:38 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CBCC05111C
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 00:37:49 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id k1so805201ilc.10
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 00:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ECwItJ1lALKlX0ZcXtD0YP3cu8V/3wSlXxURpG7j4iM=;
        b=QEWzXL8SINDjie6chJM5yqXYCkd0p54TJoVBqRO2UPna69T9pMNh7xq6LBA5llfm8I
         aMG17oWxarLJvUMw740AhOjkod2yREhSQwap9sjyscti3mLInxj8d8rfigg2Jjx9XtDk
         NNdw4UJHsJ/WTtymphx+0H5iNNGCOoFocbkUyGTwAZetKcOl9SmJpgyrlqZpNFO690pP
         SxDfcnHxjwv2qKh+6r2oTSMKjauMGzveKijDgSslFMVzcu7UrCMEJ7v8qo5X3bGh+SUj
         SR4gtmPDpXYcuE38myeZyYi+08oFvNpveHTuFiCNMfzXoP5SEnwaQWPqf8nivRrpg7+H
         ujFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ECwItJ1lALKlX0ZcXtD0YP3cu8V/3wSlXxURpG7j4iM=;
        b=dlJSE+qXUgdYy/PBKdWVznqXiyBnHG79LndKAqw4TjD+Qn9q4DAgV7e6WaY94UcOhs
         Sk1VACMKyixiXZ592F+ay/kEta+Li5ubd0gZmlFCiKPSwzmoOqtzqTbd1c7yGzuFQ2JM
         ublW+HeH3TZjHcNed20AFjk/MRj2A9tD4vBCLDJS8hH2lxK0BgROpgmpRqgjOTyOsFSb
         4hRWZqVEePWzvw0EtUbs3Fs2dNJpT/NQ20kC6/NnMDeFlmOJv0rFIaaqNUlTFhKegDun
         WYr9NFaldUk2vfqGrG5VwnkB3Wm6kmkF/ryinB2kxPvSmvvQF6AP7bx/JClpgS/kGlAc
         V5Tw==
X-Gm-Message-State: AOAM5320HcMGj2jbsBLnEM2mBIgYBfrWWD4oyGrbV9fGQTIsuOLB5T0H
        A4FcfZTf+qmNhjHrr2WplGyfUeB0fBD1fdMnIsb0Kw==
X-Google-Smtp-Source: ABdhPJyBk2mnCZ/A8S+cYOSYN0tkAssWPvyybTnPdKmKnGqQbh94ZeTD2Si3jQmXca0yxKQYGN1xHT5b1ifHUQnrsws=
X-Received: by 2002:a92:ca92:: with SMTP id t18mr2896062ilo.287.1602661069101;
 Wed, 14 Oct 2020 00:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201002063148.32667-1-warthog618@gmail.com> <CAMRc=Md51g2-3PvQV_BA-qFJ=iDHqQELyMLx18yLR2LDQOCNHw@mail.gmail.com>
 <20201014031721.GA12685@sol>
In-Reply-To: <20201014031721.GA12685@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Oct 2020 09:37:38 +0200
Message-ID: <CAMRc=MdSxXgtf_t9Lxox-rt9Vj+N2dNqdQ_FpXLBFBQFWrZRjw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: Basic port to uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 5:17 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 09:08:44AM +0200, Bartosz Golaszewski wrote:
> > On Fri, Oct 2, 2020 at 8:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Port existing implementation from GPIO uAPI v1 to v2.
> > > The libgpiod external interface remains unchanged, only the internal
> > > implementation switches from uAPI v1 to v2.
> > >
> > > This is a minimal port - uAPI v2 features are only used where it
> > > simplifies the implementation, specifically multiple events on a bulk can
> > > now be handled directly by the kernel in a single v2 line request rather
> > > than being emulated by multiple v1 event requests.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> >
> > Hi Kent!
> >
> > I just noticed that this broke the tests in Python and C++ bindings.
> > Something to do with the RISING and FALLING edge values and how
> > they're translated in the bindings, it seems. Let me know if you'd
> > have time to take a look at it and see if it's something obvious.
> > Otherwise I'll investigate that tomorrow.
> >
>
> Lots of problems here, so where to start...
>
> Firstly, I foolishly assumed that the coverage of the CXX and Python
> tests was aimed at testing the binding, and that wouldn't provide
> additional coverage to the core API to that tested by the C tests.
> Not the case :(.
>
> Most of the problems are due to the switch from an event request per
> line to a single line request.  This breaks tests that assume an fd per
> line and test the fds using poll.  As they are now the same, all line fds
> in the bulk become ready to read at once, where previously it was only one.
> These are only present in CXX and Python test cases :(.
>
> I also misunderstood the use case for gpiod_line_event_wait_bulk(),
> and used the event from the fd to determine the line (incorrectly as it
> turns out).  As a consequence tests that then read the event from the
> line fd find the subsequent event, or the wrong number of events.
> Again, these are only present in CXX and Python tests :(.
>
> And I misunderstood the offset passed in gpiod_line_bulk_get_line(),
> using the chip offset not the bulk offset (there are too many damn
> offsets here), so that only happened to work in the C tests as ALL lines
> on the test chip were requested so the chip and bulk offsets match.
> Changing the test to mismatch those offsets makes the C tests fail as
> well :).
> To fix that we'd need to peek into the file to get the event
> offset without actually removing the event from the file, and be able to
> find the line in a bulk based on chip offset.
>
> Oh, and gpiod_line_bulk_get_line() doesn't do range checking, so will
> happily return garbage if offset >= bulk.num_lines.  It happened to
> return NULL in my testing, resulting an exception when trying to add the
> line to the bulk.  But if it had returned something else...
>
> So, in short, the switch to using one line request for all events in the
> bulk is problematic with the exposing of the line fd, and the
> current implementation of gpiod_line_event_wait_bulk() is broken.
>
> Where to go from here depends on where you want to go with the API.
> As mentioned yesterday, my preference would be for
> gpiod_line_event_wait_bulk() to return the next event that occured on the
> bulk rather than a bulk of lines with events.
>
> And it needs to be made clear that the fd returned by
> line.event_get_fd() applies to the bulk - assuming we switch to the one
> request per bulk.

Thanks for the detailed explanation. It all makes sense now. I thought
it's possible to just use the new uAPI while keeping the old library
interface for now. It does not seem to be the case (at least for
events) in which case I'll just back out your port and I'll start
working on a new API bit by bit, changing separate parts and
introducing non-compatible changes where it's required.

If you want to work on this too - just let me know which parts so we
don't do the same thing twice.

Bartosz
