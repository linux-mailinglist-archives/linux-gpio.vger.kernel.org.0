Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B80C28DC01
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgJNIvU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgJNIvU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:51:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3183C051112
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:51:19 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a17so1145608pju.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TSVgLz2oYU6OXwBD3AIMhs6EVDJK6dXDK9h2peb80/M=;
        b=X0HrUUuiBgTsBqjV3+BwTSel2yCvGHOC9zV+ejvlEELLjKO3jkOVWYMEMW+KZVpe8i
         QDrFnxGWWcFwsGJdzTtuYyjlRpR+Mzl+Lqu2RdEk0fjHo4OjjCo0lidrvkVq595MUjM3
         JDQxcpgMH8HquaA1upwRoEI5wH+aXJB82bERr7d6HXcusTIpSVQoWYIMWi+lFy/H+NQQ
         LLKA3DXz1UCyRlM75/QhmaU4q1doM1WvZF2fsutK0T+4GKYBoSD+m5ZgsmpLj3cD2EIN
         uuSdERWI7iP5QlBuW4V4kjR4wxNNiv6w/E0BtoKqs98VQRKZ+F756rYUyDi674tmJUKh
         4Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TSVgLz2oYU6OXwBD3AIMhs6EVDJK6dXDK9h2peb80/M=;
        b=XknC7NJ9VWdfqSlakCyeot+59z+yTz/rX9nmI8XgTuFPIgHsdQ6aIL2JluZy22TKsQ
         AnmOziASfYa2L+n5VtSNoKFuHk/DOyjufhBqelKVYKM8/+NvYcS2QFFm5WEbYNz9Xt0q
         DAykWjkPrwjCXPoN5HVkd6izCZS/RFxqthBSCeGeBAq8KY5PsbD8KmqY/WVskqDbCJX1
         PWVPmSVlez32wIhEOw+UTDBN7wpSBRc3u1HZ9cdoroA2EG797S13rV9wwEwi7p19EP7M
         7dazXhpGEVvTzmxInfnIcuDOKVnonQGJShc6hBgLsrGvm8DKvzBLjKV4BYM1AQ+tcf4m
         vGWg==
X-Gm-Message-State: AOAM532naspf55nDRRLW3UQ9fZc9AjE7UTjHnZR6shfvB+6Dj+0Wmaeo
        3/rmuBx92cQxAeC6SQRpKjVnG2LkLVEq9Q==
X-Google-Smtp-Source: ABdhPJwVJrO/e/MH86obBoGAH+MIBkFrV0ZMOx/cNE1qmfUtWuSUPKqSxWIOwb+GUW0/QJsYt/1Sxw==
X-Received: by 2002:a17:90a:4b87:: with SMTP id i7mr2610343pjh.68.1602665479336;
        Wed, 14 Oct 2020 01:51:19 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id t10sm2166398pjr.37.2020.10.14.01.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 01:51:18 -0700 (PDT)
Date:   Wed, 14 Oct 2020 16:51:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH] core: Basic port to uAPI v2
Message-ID: <20201014085114.GA93559@sol>
References: <20201002063148.32667-1-warthog618@gmail.com>
 <CAMRc=Md51g2-3PvQV_BA-qFJ=iDHqQELyMLx18yLR2LDQOCNHw@mail.gmail.com>
 <20201014031721.GA12685@sol>
 <CAMRc=MdSxXgtf_t9Lxox-rt9Vj+N2dNqdQ_FpXLBFBQFWrZRjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdSxXgtf_t9Lxox-rt9Vj+N2dNqdQ_FpXLBFBQFWrZRjw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 09:37:38AM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 14, 2020 at 5:17 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Oct 13, 2020 at 09:08:44AM +0200, Bartosz Golaszewski wrote:
> > > On Fri, Oct 2, 2020 at 8:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Port existing implementation from GPIO uAPI v1 to v2.
> > > > The libgpiod external interface remains unchanged, only the internal
> > > > implementation switches from uAPI v1 to v2.
> > > >
> > > > This is a minimal port - uAPI v2 features are only used where it
> > > > simplifies the implementation, specifically multiple events on a bulk can
> > > > now be handled directly by the kernel in a single v2 line request rather
> > > > than being emulated by multiple v1 event requests.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > >
> > > Hi Kent!
> > >
> > > I just noticed that this broke the tests in Python and C++ bindings.
> > > Something to do with the RISING and FALLING edge values and how
> > > they're translated in the bindings, it seems. Let me know if you'd
> > > have time to take a look at it and see if it's something obvious.
> > > Otherwise I'll investigate that tomorrow.
> > >
> >
> > Lots of problems here, so where to start...
> >
> > Firstly, I foolishly assumed that the coverage of the CXX and Python
> > tests was aimed at testing the binding, and that wouldn't provide
> > additional coverage to the core API to that tested by the C tests.
> > Not the case :(.
> >
> > Most of the problems are due to the switch from an event request per
> > line to a single line request.  This breaks tests that assume an fd per
> > line and test the fds using poll.  As they are now the same, all line fds
> > in the bulk become ready to read at once, where previously it was only one.
> > These are only present in CXX and Python test cases :(.
> >
> > I also misunderstood the use case for gpiod_line_event_wait_bulk(),
> > and used the event from the fd to determine the line (incorrectly as it
> > turns out).  As a consequence tests that then read the event from the
> > line fd find the subsequent event, or the wrong number of events.
> > Again, these are only present in CXX and Python tests :(.
> >
> > And I misunderstood the offset passed in gpiod_line_bulk_get_line(),
> > using the chip offset not the bulk offset (there are too many damn
> > offsets here), so that only happened to work in the C tests as ALL lines
> > on the test chip were requested so the chip and bulk offsets match.
> > Changing the test to mismatch those offsets makes the C tests fail as
> > well :).
> > To fix that we'd need to peek into the file to get the event
> > offset without actually removing the event from the file, and be able to
> > find the line in a bulk based on chip offset.
> >
> > Oh, and gpiod_line_bulk_get_line() doesn't do range checking, so will
> > happily return garbage if offset >= bulk.num_lines.  It happened to
> > return NULL in my testing, resulting an exception when trying to add the
> > line to the bulk.  But if it had returned something else...
> >
> > So, in short, the switch to using one line request for all events in the
> > bulk is problematic with the exposing of the line fd, and the
> > current implementation of gpiod_line_event_wait_bulk() is broken.
> >
> > Where to go from here depends on where you want to go with the API.
> > As mentioned yesterday, my preference would be for
> > gpiod_line_event_wait_bulk() to return the next event that occured on the
> > bulk rather than a bulk of lines with events.
> >
> > And it needs to be made clear that the fd returned by
> > line.event_get_fd() applies to the bulk - assuming we switch to the one
> > request per bulk.
> 
> Thanks for the detailed explanation. It all makes sense now. I thought
> it's possible to just use the new uAPI while keeping the old library
> interface for now. It does not seem to be the case (at least for
> events) in which case I'll just back out your port and I'll start
> working on a new API bit by bit, changing separate parts and
> introducing non-compatible changes where it's required.
> 
> If you want to work on this too - just let me know which parts so we
> don't do the same thing twice.
> 

I originally did the port in multiple steps, so I should be able to put
togther a patch that retains the old event behaviour without much
trouble.  That would switch you totally over to uAPI v2 while still
doing everything as per v1.  Then you could workout the best way to
integrate the new features from there.

Cheers,
Kent.
