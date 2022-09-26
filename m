Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 083F75EACC4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 18:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiIZQkx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 12:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiIZQkR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 12:40:17 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF2713F298
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 08:27:05 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n35-20020a05600c502300b003b4924c6868so8239801wmr.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tFE5SbkFgpb1NvTKVHzw1d3zMhgb4sE+PEHXvzG2uqM=;
        b=Ejntay67JSZq4w3jzdJQ8fUfJ7rsbksdyz1iLxr9yNr2h7bgFx4gmM6hFblMW5K/q0
         br6EnnUHOIF6tZ4OETLYHbVunBpYoueWc6ifFHtnRKvxioRL1mJR6/engmXVnKyqOApo
         +GN+S1eIUgl5O1asLFia5P1+08Gd8AyzJhsbUocRsw6KEnVGqnbJdPh7E93Rbp7gifl0
         z33e3WRpCx9BrOzgJRmNi9uYy6GmVEsRiVLyjHTjhIF63vs/G6RrYAbTET92SNhqLgk4
         d2QiEJBzdQQcUv8fZHR0b+sO3lSBUTNyFSYAMMDthXIfkYINwtQqH59GJWfULAmqBcw+
         Q/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tFE5SbkFgpb1NvTKVHzw1d3zMhgb4sE+PEHXvzG2uqM=;
        b=4WWcZYt3jY+PQsu6DHeoGbKmuonZV/H1knfoBgw1dVDbf6vbJlZ2j7cP6kiMBSU122
         jjXuDMyk1nizPBzsY8y3f+CbtagZ7uNoUT4JFJBRrCyge00pKHspW7EiV3CFWekmlfHZ
         +1ZvlSzsIGlqRXECvNMI5QX4YprB+dFZYyxXMIOEOK08JzTZvLHGOrnkuFM2b/SPkWJC
         8mnyaeMBZ90PPVZtm+o3sWilmgVMDs8GT2g2GiTRDgZD2Qox+6WlR5D7mK4p7dBl2CTW
         7Y7sNjt8IwRQj4BHG+mvNBumF119Oo+Fyk5uYsiqnVKhhRrnWbn4qAbuD3QoSYp76dhm
         67KA==
X-Gm-Message-State: ACrzQf1L0k+3P363v8re7a6DbRsMuhqevJjXQJPuxFLojXzu7T5UwZdr
        wLzPeXw8WBotZjBwzglnerZ1KRQZmDbmUngNOF3qLA==
X-Google-Smtp-Source: AMsMyM4p8BgC7fd/fNSKGzo+zV03AEtoC81YHu4OPasEFYTxayyU9myDzw/NkTdgQENtuDRSnOPuYQ8wtut1ZC/Rx0I=
X-Received: by 2002:a05:600c:a185:b0:3b4:ff33:9fc4 with SMTP id
 id5-20020a05600ca18500b003b4ff339fc4mr16731609wmb.2.1664206022182; Mon, 26
 Sep 2022 08:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664189248.git.viresh.kumar@linaro.org> <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
In-Reply-To: <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
From:   Viresh Kumar <viresh.kumar@linaro.org>
Date:   Mon, 26 Sep 2022 20:56:51 +0530
Message-ID: <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Mon, 26 Sept 2022 at 18:59, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Thanks for being patient with me. :)

I should thank you for being patient with me :)

> > +    /// Read an event stored in the buffer.
> > +    pub fn event(&self, index: u64) -> Result<edge::Event> {
> > +        edge::Event::new(&self.ibuffer, index)
> > +    }
>
> In Event's new() you call gpiod_edge_event_buffer_get_event() which
> returns a pointer to an event stored inside the buffer. There's also
> the event_clone() function that calls gpiod_edge_event_copy() but I
> don't see it called anywhere.

I thought that is required if the user is concerned that the buffer will
be overwritten by a new event, hence make a copy. Is that
understanding correct? I didn't use it here for that reason, but it can
be useful to the user expecting a lot of events.

> Should users pay attention to the
> lifetime of the buffer storing the event?

No.

> Because IMO if the buffer
> goes out of scope, the program will crash attempting to access the
> event.

This is where Rust's memory safety comes in. If you see the design of
the 'structure Event', it saves a reference to the 'struct BufferInternal'.
The drop() implementation of BufferInternal calls:
gpiod_edge_event_buffer_free(), but it won't get called unless all the
references to it have gone out of scope. So untill the time user is still
using any of the events, the buffer won't get freed. So we will never
have invalid reference issue here.

> In C++ the events in the buffer can only be accessed as const
> edge_event& so it's clear we're only holding a reference to an object
> existing somewhere else. Internally, the object stored in the buffer
> doesn't copy the edge event, only holds a C pointer to the event
> structure in struct gpiod_edge_event_buffer. Only upon calling
> edge_event& edge_event::operator=(const edge_event& other) will we
> trigger a copy.
>
> This way doing `for (const auto& event: buffer)` allows us to iterate
> over events without doing any additional allocations.
>
> Can we reproduce that behavior in Rust? For instance, the above
> function could return a borrowed reference and then we could have some
> interface to trigger the copy? Maybe do an implicit copy like in C++?
> I don't know if that's possible though.

So here in Rust, you clone() normally to make a copy, but the
standard clone() declaration can't have an error returned and so I had
to name it event_clone().

--
Viresh
