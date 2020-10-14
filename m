Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E57028DD2A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 11:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbgJNJWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 05:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbgJNJV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 05:21:56 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AC1C041E4F
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:17:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id p11so1036879pld.5
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AFiAWzeQwYCBxWJn+p7sl1CpJQNcHmYqdittu295f+A=;
        b=Y7FcHDL2v1FYoiIAfFEfRWYDZyShzAM+YAQZbAQG9qsX8/l81WkUxwuw1ghAHoS2qG
         Rhxlgfy5mPO3hCo4U3P0zpU59h1f8FfHVHCr2eaQFU2OykDDG57RDAfCZz6zGQETeeqb
         vyGB0pbDk6pM51P6WJWQi4In3HUuPUn7bVrNJfcUtNRP1bAvy8EbOMgjbBRVxAr3RhlJ
         mi9qclDLNqDoOffx5qJuO3Qh6j/hKYSq9WkMc6HyKzNUfLYqOe5+Rx1A8y3kkcb4Fz8y
         6BFqGWteFO0CiNhYeW5pdyESFz/Jl8fjt8njD+i+H1kUt/ymxYvdQvoq6T+CLg4COvqo
         cIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AFiAWzeQwYCBxWJn+p7sl1CpJQNcHmYqdittu295f+A=;
        b=otOfp5L+NOAMFylLLcK2Ztz4oOrbSlY9SDn2btCOnpKmQ0k6HoZvAMCdSTo7f6qOkD
         CukSKxP+yZH+ccnrz70ef9urDjlPHnKp/EvSNbMmYNOdomaj8/u5rUtnfTu51ryuHmjz
         HtWEkN5soX9RFZOume5Hr15nVLvG/c5EvkBAMaiIJ0vlqOlJDSPuat6gCafKK2uFMJHC
         JY1CfxEhGi6xFKkBDBdlRjgw613TdTTZm3+poe/FYNCVuyplJVYH3Mypwfk6jL9nPIPM
         DVCYLg87om7QDqQK9XFoh4hXLihvdKGlBKt8o1cgD+wg8uayT23R0Lb7efwAjfRQiKZR
         MVlQ==
X-Gm-Message-State: AOAM531g+63oiyIOhReCIOZCTULciUBUojB2QczisajC6rFJfik2W6fy
        ONwsRWbvb4+6ETKSNhZ9qxY=
X-Google-Smtp-Source: ABdhPJxgTEs2xi12VD/ONUYLGYvuRoVn9Rz0KuZ6xS30GS1H+9kou7gwmqujQtLCsIxVYSOb/7Qvqg==
X-Received: by 2002:a17:90a:e2d8:: with SMTP id fr24mr1405029pjb.219.1602645446938;
        Tue, 13 Oct 2020 20:17:26 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id ch21sm754801pjb.24.2020.10.13.20.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 20:17:26 -0700 (PDT)
Date:   Wed, 14 Oct 2020 11:17:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH] core: Basic port to uAPI v2
Message-ID: <20201014031721.GA12685@sol>
References: <20201002063148.32667-1-warthog618@gmail.com>
 <CAMRc=Md51g2-3PvQV_BA-qFJ=iDHqQELyMLx18yLR2LDQOCNHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md51g2-3PvQV_BA-qFJ=iDHqQELyMLx18yLR2LDQOCNHw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 09:08:44AM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 2, 2020 at 8:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Port existing implementation from GPIO uAPI v1 to v2.
> > The libgpiod external interface remains unchanged, only the internal
> > implementation switches from uAPI v1 to v2.
> >
> > This is a minimal port - uAPI v2 features are only used where it
> > simplifies the implementation, specifically multiple events on a bulk can
> > now be handled directly by the kernel in a single v2 line request rather
> > than being emulated by multiple v1 event requests.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> 
> Hi Kent!
> 
> I just noticed that this broke the tests in Python and C++ bindings.
> Something to do with the RISING and FALLING edge values and how
> they're translated in the bindings, it seems. Let me know if you'd
> have time to take a look at it and see if it's something obvious.
> Otherwise I'll investigate that tomorrow.
> 

Lots of problems here, so where to start...

Firstly, I foolishly assumed that the coverage of the CXX and Python
tests was aimed at testing the binding, and that wouldn't provide
additional coverage to the core API to that tested by the C tests.
Not the case :(.

Most of the problems are due to the switch from an event request per
line to a single line request.  This breaks tests that assume an fd per
line and test the fds using poll.  As they are now the same, all line fds
in the bulk become ready to read at once, where previously it was only one.
These are only present in CXX and Python test cases :(.

I also misunderstood the use case for gpiod_line_event_wait_bulk(),
and used the event from the fd to determine the line (incorrectly as it
turns out).  As a consequence tests that then read the event from the
line fd find the subsequent event, or the wrong number of events.
Again, these are only present in CXX and Python tests :(.

And I misunderstood the offset passed in gpiod_line_bulk_get_line(),
using the chip offset not the bulk offset (there are too many damn
offsets here), so that only happened to work in the C tests as ALL lines
on the test chip were requested so the chip and bulk offsets match.
Changing the test to mismatch those offsets makes the C tests fail as
well :).
To fix that we'd need to peek into the file to get the event
offset without actually removing the event from the file, and be able to
find the line in a bulk based on chip offset.

Oh, and gpiod_line_bulk_get_line() doesn't do range checking, so will
happily return garbage if offset >= bulk.num_lines.  It happened to
return NULL in my testing, resulting an exception when trying to add the
line to the bulk.  But if it had returned something else...

So, in short, the switch to using one line request for all events in the
bulk is problematic with the exposing of the line fd, and the
current implementation of gpiod_line_event_wait_bulk() is broken.

Where to go from here depends on where you want to go with the API.
As mentioned yesterday, my preference would be for
gpiod_line_event_wait_bulk() to return the next event that occured on the
bulk rather than a bulk of lines with events.

And it needs to be made clear that the fd returned by
line.event_get_fd() applies to the bulk - assuming we switch to the one
request per bulk.

Cheers,
Kent.
