Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5315A5EC44D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 15:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbiI0NWr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 09:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbiI0NVD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 09:21:03 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE831B14EA
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 06:18:30 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id l18so2975700wrw.9
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dEfZGQDOc3Cuu3YaylwQKAXSYcmzPlMx+H1srGxKK/E=;
        b=HpLAlEjeHq9StXiF2VNwRFDkZ8Qw1KRGDGg+jXpMwzcslfNFEMk+PUNCamL3MBnQoW
         mg91WPpk7P44HLF3qV0qayIQHr7Bv8Oc3MHP8ch548DKquXUmbKbOluwg0V60tkG+qun
         eB0jry8GWrf3WogivqLGRTQGjRnq6XQQhnMSVWdQJfm8ovReRN63/lHwS1UJnSwxxs3o
         ADaYte+MwhnwdoEv2c9kV4ivphzdX1RMLw6g98j6BVneGLa86qamnbQo6c/n5V04oeEi
         BEaiPrwu/gTAPlBFNF7vOBxsmd1HLfUKF3sH4TvGcRWGO5vUTCz/SwNSbQXGo2YSSRD1
         C0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dEfZGQDOc3Cuu3YaylwQKAXSYcmzPlMx+H1srGxKK/E=;
        b=TpJSuCzwR9138ziSbdt17pUFhCfhnIUFrJs2lpPX08wVOoUsuW3NEWvwCCtbnYHA4+
         eBWKntglhN4eqEUbauYx8dF9lR0nHs0b6Yv+qR8NHp92fKPW9hsdlXGNFlt9kIIN/2Js
         F0ZxHAMOFSs5OH2iJkRxPRqyHlbiygnYk2+kRCVcxuQBK9LrCkc4ZuA9lQ/KoX4X8fjy
         6NnGls5gZI/L6MKfs7zXkOAHUk1ilk1g1AU6uS2YWT+TW5kHgF57S9drTY8c1isR9GwR
         PQNH1/3cqvjEUHmkWRBAiv8KY6bPidlQjLsTYCtQcdVt52KFyRu+jmhkAciUuHVKJv8/
         91oQ==
X-Gm-Message-State: ACrzQf1oWp3ltq5xM7Dv66yLzKgJMys/fsT/MxhtcjqaPUF3tUOf25W0
        wU1wEBn7HmcpFKOt9brZWlGj5EdKURtUhp3RFG26rQ==
X-Google-Smtp-Source: AMsMyM4maGMB3T8zMLN/4ik+8aVzqcmB/1bJHjWReIlqxm3Qq/O6M3ywxhUsccCg8zCuqoscfM/wDnpKaLIvV2uIkrQ=
X-Received: by 2002:adf:fb50:0:b0:22a:e4e9:a6b3 with SMTP id
 c16-20020adffb50000000b0022ae4e9a6b3mr16617721wrs.467.1664284707501; Tue, 27
 Sep 2022 06:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664189248.git.viresh.kumar@linaro.org> <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com> <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
In-Reply-To: <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 27 Sep 2022 15:18:16 +0200
Message-ID: <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
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

On Mon, Sep 26, 2022 at 5:27 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 26 Sept 2022 at 18:59, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > Thanks for being patient with me. :)
>
> I should thank you for being patient with me :)
>
> > > +    /// Read an event stored in the buffer.
> > > +    pub fn event(&self, index: u64) -> Result<edge::Event> {
> > > +        edge::Event::new(&self.ibuffer, index)
> > > +    }
> >
> > In Event's new() you call gpiod_edge_event_buffer_get_event() which
> > returns a pointer to an event stored inside the buffer. There's also
> > the event_clone() function that calls gpiod_edge_event_copy() but I
> > don't see it called anywhere.
>
> I thought that is required if the user is concerned that the buffer will
> be overwritten by a new event, hence make a copy. Is that
> understanding correct? I didn't use it here for that reason, but it can
> be useful to the user expecting a lot of events.
>

Yes, that's one of the use-cases. Copy an event from a buffer before
reading more into it.

> > Should users pay attention to the
> > lifetime of the buffer storing the event?
>
> No.
>
> > Because IMO if the buffer
> > goes out of scope, the program will crash attempting to access the
> > event.
>
> This is where Rust's memory safety comes in. If you see the design of
> the 'structure Event', it saves a reference to the 'struct BufferInternal'.
> The drop() implementation of BufferInternal calls:
> gpiod_edge_event_buffer_free(), but it won't get called unless all the
> references to it have gone out of scope. So untill the time user is still
> using any of the events, the buffer won't get freed. So we will never
> have invalid reference issue here.

You've got to help me out here, just looking at the code doesn't make
things clear for me.

Am I right to understand that each Event holds a reference to the
BufferInternal object and it will only be destroyed when the last
event is dropped? If we read new events into the buffer, does that
create a new BufferInternal? Is that efficient? Aren't we allocating
memory for each new BufferInternal at every read?

>
> > In C++ the events in the buffer can only be accessed as const
> > edge_event& so it's clear we're only holding a reference to an object
> > existing somewhere else. Internally, the object stored in the buffer
> > doesn't copy the edge event, only holds a C pointer to the event
> > structure in struct gpiod_edge_event_buffer. Only upon calling
> > edge_event& edge_event::operator=(const edge_event& other) will we
> > trigger a copy.
> >
> > This way doing `for (const auto& event: buffer)` allows us to iterate
> > over events without doing any additional allocations.
> >
> > Can we reproduce that behavior in Rust? For instance, the above
> > function could return a borrowed reference and then we could have some
> > interface to trigger the copy? Maybe do an implicit copy like in C++?
> > I don't know if that's possible though.
>
> So here in Rust, you clone() normally to make a copy, but the
> standard clone() declaration can't have an error returned and so I had
> to name it event_clone().
>

Bart
