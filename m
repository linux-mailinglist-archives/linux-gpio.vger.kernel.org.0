Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E92E5EC524
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 15:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbiI0N5u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 09:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbiI0N5g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 09:57:36 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF0D15D646
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 06:57:31 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id l18so3145622wrw.9
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YOJlD40U6QqjQtv9JzMCIjJWGkq9MU/e/ftg7Eq2Bks=;
        b=qQxvkuStzGqiOWXve8/2NneGWW1/kxooxIOQScJXLLX2T0KUjj3Nq7fAz/q4uoPTNB
         wSPtyWI3YOVVWBj9wfDyxrkH6ZW7Zitv7aMtKludT9Rr1/+uT8dBf3vRRnt5HJlOxYi9
         Wl7uWoK5lmhXAdmG2DMDjN0rUi71m5s1P5TQYkVG0WQMwH8VclM0yzPbpxYZzNQVbWcX
         NbEXFC6WePumzBxellJN+A06It/7BYGSVUrkE2c1P4LaTS7FBh4XKjbBm8JeXgO0IGAF
         hQ3hLYr0kXS6jLPm9kQiZ0uObBiLxumoWOjCggacTWoqWvs6ZQTRaTAgo2xdgnkRNbxT
         fIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YOJlD40U6QqjQtv9JzMCIjJWGkq9MU/e/ftg7Eq2Bks=;
        b=x4d4W4tBcqp9HikZuo8wWFAseJTR0CEBqXXbu9D6pxFKLli+jF3LTu6mBUV2z7lTWT
         PRzZ2LQaqWVUsW86MhmBXv7gBeNTAGc6uHX6fowJ3rTN5IQDzmGQLEeX3mCjFfMCmJe1
         +YtUYeevS08IFPMcBD8E9DNM+ePJGZIAzwz8w+au9fVtRmb1ugel4+KXyqTJwNJtjYGt
         Q8p0xQxzB2hUZl71OMjnjwTmMjx/gwhp3eP/0BSfamDef5UJqzvtz4wcFyhPhNYPKZbA
         gj7LwgAS83Bkdj5FUGxhNF/z2iNbQYcsjZKcdK1P73iro2FLDkzcpVcCEMkd2yJJRWyc
         fofg==
X-Gm-Message-State: ACrzQf3YWVozRNo/1eTyLWobIPePs5ueBV72t/Kf8RR3ju89YB+T84m7
        /iLuQu0YPHaM+pU1843lG0+IlCkrCbmVOf4KVgBhBw==
X-Google-Smtp-Source: AMsMyM6I6cAd4rtIVMkaIy2I8/614HnzPR5JRRjXq38oRxaaLRCpLapaUJvZog6W4ZuJ2rGHwhJhmir8/8ezPyLs+/s=
X-Received: by 2002:a05:6000:86:b0:228:db07:24bc with SMTP id
 m6-20020a056000008600b00228db0724bcmr16774286wrx.204.1664287049723; Tue, 27
 Sep 2022 06:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664189248.git.viresh.kumar@linaro.org> <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com> <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
In-Reply-To: <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
From:   Viresh Kumar <viresh.kumar@linaro.org>
Date:   Tue, 27 Sep 2022 19:27:18 +0530
Message-ID: <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
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

On Tue, 27 Sept 2022 at 18:48, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Sep 26, 2022 at 5:27 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> > This is where Rust's memory safety comes in. If you see the design of
> > the 'structure Event', it saves a reference to the 'struct BufferInternal'.
> > The drop() implementation of BufferInternal calls:
> > gpiod_edge_event_buffer_free(), but it won't get called unless all the
> > references to it have gone out of scope. So untill the time user is still
> > using any of the events, the buffer won't get freed. So we will never
> > have invalid reference issue here.
>
> You've got to help me out here, just looking at the code doesn't make
> things clear for me.

Just to clarify, Buffer is just a wrapper over BufferInternal, you can think
of them as the same entity for simplicity.

> Am I right to understand that each Event holds a reference to the
> BufferInternal object and it will only be destroyed when the last
> event is dropped?

Yes. But the buffer variable itself too holds a reference to the Buffer.
Even if all the events are dropped, the buffer won't get free unless the
buffer variable gets dropped too.

> If we read new events into the buffer, does that
> create a new BufferInternal?

No. It uses the existing buffer only, that we created using Buffer::new().

> Is that efficient? Aren't we allocating
> memory for each new BufferInternal at every read?

No, we reuse the same buffer for all the reads.

If you see the gpiomon.rs example, it shows how this is being done.
The buffer (and internal buffer too) is created only once in line 42:

let buffer = edge::event::Buffer::new(1)?;

This allocates the memory for buffer only once, after that we continue
reading from the same buffer.

The BufferInternal structure is enclosed within an Arc<> instance, which is
"Atomically Reference Counted", very much like kref_get/put in kernel.

Unless the last reference is dropped, it stays.

Hope I was able to clarify this here.
