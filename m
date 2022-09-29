Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313335EEF39
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 09:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234856AbiI2Hh4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 03:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235263AbiI2Hh4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 03:37:56 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF80139434
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 00:37:53 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s14so821069wro.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 00:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xG6pe0Nay2+KrgG9S8vdNuAtRjhdZxqetcN9bQkot20=;
        b=HEN/jqAE2JezpK7R9YCzOonruSd64+3jK7G1P9TDS8uFgsAE3Safe/mypetBJMbfZI
         DSaHugbtQlZCf+49Wd5VMCT80LCAveYI8qzCtJeBu2Wf0dzND2U32BA4xE2y2PwuTiEM
         QVYr5dwDQbaLbFxZop1okYUd/5UKwle9I3hxrz33uneYdStGOR1ZRBcf/kz5B45H7M81
         sxfoGWgeh/MtR3QmhSQLNzd1rG4RFtoflgJOJGjxQkCQVHEqxlcuJ7xuFRx9nMOAtsIr
         GpbN5UlXCo0ebpO0oyw0oqjK697Q+kowPGzyWTz3HUFzyKO3vRZO2YTZFVMkNxaDh3V3
         DAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xG6pe0Nay2+KrgG9S8vdNuAtRjhdZxqetcN9bQkot20=;
        b=H+EWaqtWFHtGYz7dgqOixfPlOBPMAJSdj8qmRaOB9Irz1XenTqICFkVdjtbXK0FhgA
         p92Gvl5Fy8jTxfYcxOsoCug8n9QSU9xqIXhYHccIk9zS9OJFa7/+7lefxGI5gKS+QElE
         b6rXK+kk+FnQjlqi6ROS4Wo8HOYJ74sH23VhmeATf1B0W0XxbkZ24BTV1PoGE3jRCYN6
         ArekTFoHK9djEkcDRVorn89l0mMdF4aWLQWFItEbw2kxdmAYUJZxd2LQqDdbD8zRTXYR
         XyvUax/fdLSH3RplOJ8y5BYf3W9FlQnEq5qcSDHmZg1DSAApWARUcP8YYTVIVOijOee4
         fBRA==
X-Gm-Message-State: ACrzQf3ml7hM41/f/41RvdTArdeTq4J9pF9ic8AXW/6J4yG2/Oe85QwU
        +tjOn4U93I5VKBQzS/erpqM0RLn2x0nGdeNHK2j1Eg==
X-Google-Smtp-Source: AMsMyM4ks5gAiuVMx711Z/72no3JerL8iWbDRDem5jZ1fbMEYIMXT7/GHlZtxF043hsk4edunxWm8uBRWQRI5iXn7os=
X-Received: by 2002:a05:6000:231:b0:22c:c8e3:67e5 with SMTP id
 l17-20020a056000023100b0022cc8e367e5mr1198602wrz.570.1664437072110; Thu, 29
 Sep 2022 00:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7> <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7> <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <20220929065409.rqilrzxaczvvds4i@vireshk-i7>
In-Reply-To: <20220929065409.rqilrzxaczvvds4i@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 29 Sep 2022 09:37:40 +0200
Message-ID: <CAMRc=McSZWLdPNESPLfDD4UgyvtyU7BcvB-ZZrvDWM3LDYjEMA@mail.gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 29, 2022 at 8:54 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 28-09-22, 19:54, Bartosz Golaszewski wrote:
> > On Wed, Sep 28, 2022 at 5:17 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > Hmm, so what exactly do we want to do here then ?
> > >
> > > - Don't allow events to be referenced ? i.e. make event_clone() the default
> > >   behavior ?
> > >
> >
> > God no, that would be wasteful.
> >
> > > - Don't allow read_edge_event() to be called twice for a buffer ? that will be
> > >   inefficient though.
> > >
> >
> > Not good either.
>
> As I expected for both of them :)
>
> > > - Somehow guarantee that reference to all the events are dropped before issuing
> > >   read_edge_event() again, else make it fail ? I am not sure how straight
> > >   forward that can be though.
> >
> > In C++ the preferred way is to do buffer.get_event(0) which will
> > return a constant reference. If you store that reference as const
> > edge_event& ev = buffer.get_event(0) and reuse it after rereading into
> > that buffer and the program crashes - that's on you. In most cases you
> > should just do buffer.get_event(0).line_offset() etc. If you do:
> >
> > edge_event event = buffer.get_event(0);
> >
> > You'll copy the event and it will survive the overwriting of the buffer.
>
> Right, same happens here.
>
> > I'm a Rust beginner but my understanding is that the whole idea of the
> > language design is to *not* allow a situation where the program can
> > crash. It should be detected at build-time. We must not rely on
> > "contracts" defined by documentation.
>
> If everything was written in Rust, then this problem won't occur for sure. But
> in this case part of the code is available via FFI (foreign function interface)
> and they guarantees are a bit limited there and depend on what the FFI
> guarantees.
>
> > Is there a way to invalidate a reference in Rust? Have a small (cheap)
> > object in the buffer which the event references and which would get
> > dropped when reading into the buffer?
>
> I am not sure. There are locks, but then they have a cost.
>

I'm not talking about locking, this should be left to the user of the module.

Can we force-drop an object still referenced by other objects in Rust?
This is what I had in mind - a small, dummy, cheap object inside the
buffer that's created when reading into the buffer. Each even would
reference it and then Rust would not allow us to drop it as long as
there are references to it. Does it make sense? Is that possible?

> Miguel, any suggestions ?
>
> Bartosz, just as an FYI I am out on vacation until end of next week and won't
> have access to a workstation. I can still reply via Gmail (html) from my phone
> though.
>

Nah, just take the time off and rest. BTW, I'm starting at linaro next week. :)

Bart
