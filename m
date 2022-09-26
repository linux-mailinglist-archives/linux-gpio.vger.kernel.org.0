Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1845EA960
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 16:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234673AbiIZO7r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 10:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234898AbiIZO7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 10:59:24 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9156926AD8
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 06:29:54 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso3714482wms.5
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=h2B/EaxHn24cu1+VG3oQWgzzuRspCOkETMlXGQgYH10=;
        b=Xo5FDq0ybWmUPzi7RxKKFbG0KNQKvmNBUH+uMlv2CQXbzQksEH7xCXDvHQKv7QPpKH
         cxWm66mKk54VCkBSS3t/Q/Y6T8SpTMS8KGoeNGpoADPoKJSIW9k/bD2rXli02q/5+pvo
         vRzrzCg54+IY5wQdJo//m/vy431exlOBy1Z3r7/dlFSH5hYZ+bVQNM5Ry7iXYfoUi/vz
         j3l4diiMUcyJG1EQ80CRBUUIyUT4nIXBc/Pkjp/6y7OBuYD8X8/F+r8R9Y1RwmhpzFAn
         W1790UTdCNUskrBCohcYYpL8xnOl8rXM/eLrDbK/Xk519JQrFQkKvhJxPcVYZU6VeZ1r
         LiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=h2B/EaxHn24cu1+VG3oQWgzzuRspCOkETMlXGQgYH10=;
        b=n6AeD/I5OzpKo9VhU9PTscfNfE/Fo5WybPIRsEfyxcpcrvp1++2Nvrfr5OOUATeAhm
         dQZmjShcsI9Nr94yfrVdj/ubZGHpwwA/U1mxzUxMy+MrL06T78Mq/+fmwbpv07Y1H/e+
         sao0BEh7xccbb+TXV7os7jz/F2hmCHQAoivfmF2Ee+m1kGXit9yDR8veT47dFHRwLyt8
         X/jl98CfuEE8Rs9Czx2QV3ANs0DeSvYKq9HK7pt+CoZWxI/f+jAn0h6ijArf3X7AUzp+
         azqmd2ih4Qdqwhh5Tvqj/kJLTw+SOcABChtJNtJW3HtVbCv2jShe56+xim423o7UyOTi
         EwJA==
X-Gm-Message-State: ACrzQf2Zio6dAHU/bK//0PrjGzwVZsZhXQt3W2K7vFgUU4XYDXXjvfiR
        TRVHeBDYBE4vClXne9E24J0orF08793wRl5zk7u7mA==
X-Google-Smtp-Source: AMsMyM4XawZgEW3N29q2wEaxU2aGzspjut7tdM+LMyKd4MFTgCbippnZRGzijaew2LsOKYJtXO09LObYzJ25wRKmr14=
X-Received: by 2002:a05:600c:1caa:b0:3a8:4066:981d with SMTP id
 k42-20020a05600c1caa00b003a84066981dmr22168297wms.54.1664198992517; Mon, 26
 Sep 2022 06:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664189248.git.viresh.kumar@linaro.org> <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
In-Reply-To: <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Sep 2022 15:29:41 +0200
Message-ID: <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
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

On Mon, Sep 26, 2022 at 1:08 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Add rust wrapper crate, around the libpiod-sys crate added earlier, to
> provide a convenient interface for the users.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Hey Viresh!

Thanks for being patient with me. :)

I obviously cannot give a comprehensive review of Rust code as you
know it much better than I do but there's one thing that bothers me at
first glance. Please see below.

[snip]

> diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
> new file mode 100644
> index 000000000000..e272e7aa9e9d
> --- /dev/null
> +++ b/bindings/rust/libgpiod/src/event_buffer.rs
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use std::os::raw::c_ulong;
> +use std::sync::Arc;
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use super::{edge, gpiod, Error, OperationType, Result};
> +
> +/// Line edge events buffer
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub(crate) struct BufferInternal {
> +    buffer: *mut gpiod::gpiod_edge_event_buffer,
> +}
> +
> +impl BufferInternal {
> +    /// Create a new edge event buffer.
> +    ///
> +    /// If capacity equals 0, it will be set to a default value of 64. If
> +    /// capacity is larger than 1024, it will be limited to 1024.
> +    pub fn new(capacity: usize) -> Result<Self> {
> +        let buffer = unsafe { gpiod::gpiod_edge_event_buffer_new(capacity as c_ulong) };
> +        if buffer.is_null() {
> +            return Err(Error::OperationFailed(
> +                OperationType::EdgeEventBufferNew,
> +                Errno::last(),
> +            ));
> +        }
> +
> +        Ok(Self { buffer })
> +    }
> +
> +    /// Private helper, Returns gpiod_edge_event_buffer
> +    pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
> +        self.buffer
> +    }
> +}
> +
> +impl Drop for BufferInternal {
> +    /// Free the edge event buffer and release all associated resources.
> +    fn drop(&mut self) {
> +        unsafe { gpiod::gpiod_edge_event_buffer_free(self.buffer) };
> +    }
> +}
> +
> +/// Line edge events buffer
> +#[derive(Clone, Debug, Eq, PartialEq)]
> +pub struct Buffer {
> +    ibuffer: Arc<BufferInternal>,
> +}
> +
> +impl Buffer {
> +    /// Create a new edge event buffer.
> +    ///
> +    /// If capacity equals 0, it will be set to a default value of 64. If
> +    /// capacity is larger than 1024, it will be limited to 1024.
> +    pub fn new(capacity: usize) -> Result<Self> {
> +        Ok(Self {
> +            ibuffer: Arc::new(BufferInternal::new(capacity)?),
> +        })
> +    }
> +
> +    /// Private helper, Returns gpiod_edge_event_buffer
> +    pub(crate) fn buffer(&self) -> *mut gpiod::gpiod_edge_event_buffer {
> +        self.ibuffer.buffer()
> +    }
> +
> +    /// Get the capacity of the event buffer.
> +    pub fn capacity(&self) -> usize {
> +        unsafe { gpiod::gpiod_edge_event_buffer_get_capacity(self.buffer()) as usize }
> +    }
> +
> +    /// Read an event stored in the buffer.
> +    pub fn event(&self, index: u64) -> Result<edge::Event> {
> +        edge::Event::new(&self.ibuffer, index)
> +    }

In Event's new() you call gpiod_edge_event_buffer_get_event() which
returns a pointer to an event stored inside the buffer. There's also
the event_clone() function that calls gpiod_edge_event_copy() but I
don't see it called anywhere. Should users pay attention to the
lifetime of the buffer storing the event? Because IMO if the buffer
goes out of scope, the program will crash attempting to access the
event.

In C++ the events in the buffer can only be accessed as const
edge_event& so it's clear we're only holding a reference to an object
existing somewhere else. Internally, the object stored in the buffer
doesn't copy the edge event, only holds a C pointer to the event
structure in struct gpiod_edge_event_buffer. Only upon calling
edge_event& edge_event::operator=(const edge_event& other) will we
trigger a copy.

This way doing `for (const auto& event: buffer)` allows us to iterate
over events without doing any additional allocations.

Can we reproduce that behavior in Rust? For instance, the above
function could return a borrowed reference and then we could have some
interface to trigger the copy? Maybe do an implicit copy like in C++?
I don't know if that's possible though.

Bartosz

> +
> +    /// Get the number of events the buffer contains.
> +    pub fn len(&self) -> usize {
> +        unsafe { gpiod::gpiod_edge_event_buffer_get_num_events(self.buffer()) as usize }
> +    }
> +
> +    /// Check if buffer is empty.
> +    pub fn is_empty(&self) -> bool {
> +        self.len() == 0
> +    }
> +}

[snip]
