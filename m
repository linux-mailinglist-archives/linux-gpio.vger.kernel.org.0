Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9407607441
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 11:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiJUJjQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 05:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiJUJjP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 05:39:15 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C0B24BABF
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 02:39:14 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id h13so2075749pfr.7
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CEWS2gM1hDrNN5TAS8NN4vFVt7MLPFG/9zIztEGenEs=;
        b=StCH3XJHAlaph76B30WZX8A3FMlh8U1oxrKxBACuHD+y6iuPtd9KrqTsGeQYaZajFk
         EqW8p6Fb4L7GX/p/ypR8vqcaGBs2zlF+LDRPjmhZbu63ZFDd6gaqaOM2iQhQTuXNO/QX
         DhQSH6Gx2WHCIKADl2+W/5yc4woXvEVV+wf9NjFMjf3p4FZrPKXPSYq2LoyY0j5FJx2a
         E2kU45+szeDM9hBfSkLC3ap4uNXtOeymUtPkLBRmRBW74v30/ghy3Q9TqdN+FF57OrQS
         9WTf/KWg7j8aXlyC0JOdQRQycn6NyaY555TICXCUwdXLQ8dPqgpx+mYwM4uKvr3ubA/v
         KhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEWS2gM1hDrNN5TAS8NN4vFVt7MLPFG/9zIztEGenEs=;
        b=tTOb5Yk5oOu6xbjXI7xDxO2I7cu8BalNLai0VrauTTYI6nqP1SYToSUzPKmvXkJ5eB
         RYxwj2sdiuEzdKn4m8yoDfCfbtk6HXxacKsedpkCLkvWdV+LgRY9IkBrgs+C2K4dD0LH
         rb7RtxKJVeBlMmJJ+SjDfeEw8ueioSNf3r+5nJnujBLQ1HYxrEZpx0+wYMH7P5cKvOT9
         DQhNWQIRNLcSU2UL9dGCKb6jGpey8tBJ3EkGrmr2TFSIKubhrNYUDIzGFdipa6fl9Yrz
         JxCvFfHZzuW/e69oUBVQhZRHtlYLq1Vgjk60N3kt2MQbS1bPrds9hm3S5V7pvmWeIfiG
         xI+g==
X-Gm-Message-State: ACrzQf2d/u0CmMDFf0GX6iHnc6g+wwpLte+doEId5Yog0+5nY5Uyjr3b
        wjqju8EH70oje5AJv2ER4n2KqW3M6YDasA==
X-Google-Smtp-Source: AMsMyM6bOL3h8fxYPHGXIumhYqirBjs5Jk+/9BP/gB/pH0aI6lYgrjFO6BD77Hoj6I7geneVNF4EqA==
X-Received: by 2002:a63:5c56:0:b0:464:85bb:8fd9 with SMTP id n22-20020a635c56000000b0046485bb8fd9mr15092379pgm.188.1666345153454;
        Fri, 21 Oct 2022 02:39:13 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902c95100b00181e55d02dcsm14324911pla.139.2022.10.21.02.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:39:13 -0700 (PDT)
Date:   Fri, 21 Oct 2022 15:09:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [PATCH V7 0/8] libgpiod: Add Rust bindings
Message-ID: <20221021093911.vj5todjdfqptdy7d@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <CANiq72m_9RK7viLpaREMGiMLuWs9m1oy9N78ok1d7uzC+18zNg@mail.gmail.com>
 <F4hN01T_BkoMFY7LNhQlmQPrXGv3a2byhEuDLleJfpWlfF98Dopa2FPrl4JDEoER8y7bN41KMkmWqM50YAIBK0BowT_9skmLKY8gsqYEJBc=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F4hN01T_BkoMFY7LNhQlmQPrXGv3a2byhEuDLleJfpWlfF98Dopa2FPrl4JDEoER8y7bN41KMkmWqM50YAIBK0BowT_9skmLKY8gsqYEJBc=@protonmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Björn,

I have bounced (mutt's feature) the initial emails to your and other
email ids that Miguel added. The patches should be in your inbox now.

On 20-10-22, 13:29, Björn Roy Baron wrote:
> At
> https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad51220c4b4e90e/bindings/rust/libgpiod/src/lib.rs#L469
> and elsewhere you might want to use `CStr::from_ptr(version)`. This
> does the `strlen` call for you and you can convert it to an `&str`
> using `.to_str()`.
 
> At
> https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad51220c4b4e90e/bindings/rust/libgpiod/src/chip.rs#L171
> you could use `CString` and use the `.as_ptr()` method to get a
> null-terminated string. Not sure if it would be nicer that what you
> currently have though.

These two were nice. Thanks.

> At
> https://github.com/vireshk/libgpiod/blob/3e7fb99173856a3995360fc3fad51220c4b4e90e/bindings/rust/libgpiod/src/edge_event.rs#L46
> the lifetimes are unclear. Is Event allowed to outlive the buffer?
> Can you add a lifetime annotation like fn event_clone<'a>(event:
> &Event<'a>) -> Result<Event<'a>> if it isn't allowed to outlive the
> buffer or fn event_clone<'a, 'b>(event: &Event<'a>) ->
> Result<Event<'b>> if it is allowed to outlive the buffer. I'm not
> sure which of the two the lifetime elision rules cause the current
> code to be equivalent of, but even if it is correct, explicitly
> stating the lifetime here is clearer IMHO.

An Event created using Event::new() can't outlive the buffer, though
an Event created using Event::event_clone() can.

I tried to play around it based on your suggestion and here is the
diff, does it make sense ?

diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index b36c23601bb4..0d328ebb2b03 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -33,7 +33,7 @@ pub struct Event<'b> {

 impl<'b> Event<'b> {
     /// Get an event stored in the buffer.
-    pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Self> {
+    pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Event<'b>> {
         // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to live as long
         // as the `struct Event`.
         let event = unsafe {
@@ -52,22 +52,6 @@ impl<'b> Event<'b> {
         })
     }

-    pub fn event_clone(event: &Event) -> Result<Self> {
-        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
-        let event = unsafe { gpiod::gpiod_edge_event_copy(event.event) };
-        if event.is_null() {
-            return Err(Error::OperationFailed(
-                OperationType::EdgeEventCopy,
-                Errno::last(),
-            ));
-        }
-
-        Ok(Self {
-            buffer: None,
-            event,
-        })
-    }
-
     /// Get the event type.
     pub fn event_type(&self) -> Result<EdgeKind> {
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
@@ -105,6 +89,27 @@ impl<'b> Event<'b> {
     }
 }

+impl<'e, 'b> Event<'e> {
+    pub fn event_clone(event: &Event<'b>) -> Result<Event<'e>>
+    where
+        'e: 'b,
+    {
+        // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
+        let event = unsafe { gpiod::gpiod_edge_event_copy(event.event) };
+        if event.is_null() {
+            return Err(Error::OperationFailed(
+                OperationType::EdgeEventCopy,
+                Errno::last(),
+            ));
+        }
+
+        Ok(Self {
+            buffer: None,
+            event,
+        })
+    }
+}
+

-- 
viresh
