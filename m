Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A985EC79E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 17:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbiI0P0O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 11:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbiI0P0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 11:26:12 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C4F1B0509
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:26:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id k3-20020a05600c1c8300b003b4fa1a85f8so5643651wms.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cF3W7awyQNB8gdTp3YakzHskc9PG7e6qXEa9Jm3f6oo=;
        b=p1mCbZngF9YPFsOQw1mD80st7xLm/+p/4nboC0XNAQSgMyuoUrM3+iHOs4MQceYqFg
         p2GWPAJbdK4s6UWGjNS4FMR/q7qRTp683YKVlNQtDJEDzFeSjbJznEPsLVTAoWHqBix4
         /cz2gQhxXn3e3CYFsFhORaUTcCefEOTF0HEqQ+hOkDwsfR+byNcuWu6DAOTXAkInMy6J
         ZHxWwnb0Wrpv7REj8xACHlFBgQ5HTukXLlsMIDb4a7FS4A9Bl721ZNvJADLGU6CC+Bvx
         TEoe1m4ZT3eYaGeaxefWnSA7r/5MU6acXtRkO7b/J71P5HG4hGyNEc9ViOi1/o6yFkaA
         rM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cF3W7awyQNB8gdTp3YakzHskc9PG7e6qXEa9Jm3f6oo=;
        b=MXH7qzmwgaX33Wtg3zbNcyXmBzkI1SDuxyg+00vDxI/RMkbgsq5KN/iLazYzkfGbB7
         2QNsBKEuK8bBUbj9Ig71DHteBShWcHdnyb61KqDB34uk+DMIWMdXMK1RdNiD25XTJblu
         XB06Qvf5X8XnP+XtWUaMClbNVfV37LPt8ztveg7D5hR1+LSzXo1vFV5j5o5LM2B15c4Z
         67t5u35uVqM4nSEhZKbL6PehP7cFb6eSsnJAXjvupYFBejXuYy7u9KyQElceEmH58EzE
         8jJWJa4cWckP6lNuP9UnBnDS1Xj+cO3ZccrfzUOLJ9BYK4JNhTZWI4r5JqmvpMFE84Ru
         0EQg==
X-Gm-Message-State: ACrzQf1KU+3Iwj0vHPSxu98efKnf1t16vws+BDOtIKcl4zuUD1A4nHi3
        qy/kLQZJmC1OblxzOCpZEClhLZeNtxcbfHwLBRkcaQ==
X-Google-Smtp-Source: AMsMyM7sky2OqeeFx7ki7pos4/Qq39i3UMMDrN0v6blE4KukgVLCjxiajoxbBCKiZMysRZSDU6oXGmCt26MjARCUyyQ=
X-Received: by 2002:a05:600c:b42:b0:3b4:7580:a995 with SMTP id
 k2-20020a05600c0b4200b003b47580a995mr3226587wmr.30.1664292369320; Tue, 27 Sep
 2022 08:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664189248.git.viresh.kumar@linaro.org> <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com> <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
In-Reply-To: <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 27 Sep 2022 17:25:58 +0200
Message-ID: <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
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

On Tue, Sep 27, 2022 at 3:57 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On Tue, 27 Sept 2022 at 18:48, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Mon, Sep 26, 2022 at 5:27 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> > > This is where Rust's memory safety comes in. If you see the design of
> > > the 'structure Event', it saves a reference to the 'struct BufferInternal'.
> > > The drop() implementation of BufferInternal calls:
> > > gpiod_edge_event_buffer_free(), but it won't get called unless all the
> > > references to it have gone out of scope. So untill the time user is still
> > > using any of the events, the buffer won't get freed. So we will never
> > > have invalid reference issue here.
> >
> > You've got to help me out here, just looking at the code doesn't make
> > things clear for me.
>
> Just to clarify, Buffer is just a wrapper over BufferInternal, you can think
> of them as the same entity for simplicity.
>
> > Am I right to understand that each Event holds a reference to the
> > BufferInternal object and it will only be destroyed when the last
> > event is dropped?
>
> Yes. But the buffer variable itself too holds a reference to the Buffer.
> Even if all the events are dropped, the buffer won't get free unless the
> buffer variable gets dropped too.
>
> > If we read new events into the buffer, does that
> > create a new BufferInternal?
>
> No. It uses the existing buffer only, that we created using Buffer::new().
>

So what happens if I do this:

let buf = edge::event::Buffer::new(10)?;
let request = chip.request_lines(&rconfig, &lconfig)?;
let count = request.read_edge_events(&buffer)?;
let event = buffer.event(0);
let count = request.read_edge_events(&buffer)?;
println!("line: {}", event.line_offset());

?

> > Is that efficient? Aren't we allocating
> > memory for each new BufferInternal at every read?
>
> No, we reuse the same buffer for all the reads.
>
> If you see the gpiomon.rs example, it shows how this is being done.
> The buffer (and internal buffer too) is created only once in line 42:
>
> let buffer = edge::event::Buffer::new(1)?;
>
> This allocates the memory for buffer only once, after that we continue
> reading from the same buffer.
>
> The BufferInternal structure is enclosed within an Arc<> instance, which is
> "Atomically Reference Counted", very much like kref_get/put in kernel.
>
> Unless the last reference is dropped, it stays.
>
> Hope I was able to clarify this here.
