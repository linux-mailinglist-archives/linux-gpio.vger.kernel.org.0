Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459DC6022BA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 05:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiJRDgh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 23:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiJRDgC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 23:36:02 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B8B2BDF
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 20:27:43 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y191so12920743pfb.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 20:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6ZwToB5571D30g2GehUi/en1nfmty6CJ8Np7LP05eM=;
        b=KxgKcN/tX0+brg7Arq/nrb5iUlEf+HAFJe2cQmoLeWzHLAt9l+V72L6H0M1NnRQD8i
         R0mx1s4Nkgt8twGdQhoVTpGUavb+EJsAcbcQgpL0Onvt/2g8+4lpANcbjnHupAI6XzGs
         KD2w8IfTUuZynU8qyiQL2lEizwowcRtFgxuii2/sBw1BwLJhYAFkbU1+znvIfAxr4rB4
         P8Gi+UJb5AiR9DMb/jeTh4kNqDKzfa8hjLCP+htivwenraB/FK06TdgT2dSPqAiiT27I
         znJ2ZBRWXh7P+YS0++jPKBLjZc+yJFS+7pkWg+UaifSL3nTWdlISg6nL35KdUW29G19V
         mT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6ZwToB5571D30g2GehUi/en1nfmty6CJ8Np7LP05eM=;
        b=pzgHP2OrIdekAfGd2fyAN86irTRimo1l0vlfnv8pXO+EqUl06aypb6TnaTjEGZa2d6
         3aDGEWiSCuH3fP5ps9zOaUHlMBj15CZt8cpkd76bmucAnTXWq2o3AjWrcLomffflW1uh
         Lm2TNtKlac/jEIJY5iyZ7FFlu9LSWLQzPa7ejPhlnDJunBiscMbMOWF1MnJ4jaDGBp4I
         mmCoLAs1h3btTKXG1b7gHW3u1QmAJfiAW2Ln7V7gLbgwcCEOwudxEpsebMVIwLj3D16j
         Y/+VbIxMPHnpcJlzqivIVjobME7UTedcg9op9yESBX9fKjDBxth18vdKOzlEg2DD55Qe
         A5Rg==
X-Gm-Message-State: ACrzQf0nG2jz+YtjcVrgRqxDMQu/GAKkW1hCwEGpKvibdnCPK4OHk2pi
        tjBjzWyeq9Ft4TCt9QoIgaqMGHtNrdA=
X-Google-Smtp-Source: AMsMyM4qyUvBqSQSiEQZjf5tr16xFxY873Yt4hWzP0j07rjW8AHhKYyhDrCKCSXQhD27rmHYZs359w==
X-Received: by 2002:a63:69c2:0:b0:46a:eeb1:e784 with SMTP id e185-20020a6369c2000000b0046aeeb1e784mr869256pgc.589.1666063662977;
        Mon, 17 Oct 2022 20:27:42 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b5-20020a63cf45000000b0044e8d66ae05sm7017492pgj.22.2022.10.17.20.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 20:27:42 -0700 (PDT)
Date:   Tue, 18 Oct 2022 11:27:36 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y04dKCIhFPbJRFqC@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 04:17:20PM +0530, Viresh Kumar wrote:
> Add rust wrapper crate, around the libpiod-sys crate added earlier, to
> provide a convenient interface for the users.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

One more thing - I overlooked trying to build on 32-bit while reviewing.
(in this case on a Raspberry Pi 4)

Unfortunately that fails:

   Compiling libgpiod v0.1.0 (/home/pi/libgpiod/bindings/rust/libgpiod)
error[E0308]: mismatched types
    --> libgpiod/src/edge_event.rs:32:88
     |
32   |         let event = unsafe { gpiod::gpiod_edge_event_buffer_get_event(buffer.buffer(), index) };
     |                              ----------------------------------------                  ^^^^^ expected `u32`, found `u64`
     |                              |
     |                              arguments to this function are incorrect
     |
note: function defined here
    --> /home/pi/libgpiod/bindings/rust/libgpiod-sys/src/bindings.rs:1151:12
     |
1151 |     pub fn gpiod_edge_event_buffer_get_event(
     |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
help: you can convert a `u64` to a `u32` and panic if the converted value doesn't fit
     |
32   |         let event = unsafe { gpiod::gpiod_edge_event_buffer_get_event(buffer.buffer(), index.try_into().unwrap()) };
     |                                                                                             ++++++++++++++++++++

error[E0308]: mismatched types
  --> libgpiod/src/edge_event.rs:81:18
   |
80 |     pub fn global_seqno(&self) -> u64 {
   |                                   --- expected `u64` because of return type
81 |         unsafe { gpiod::gpiod_edge_event_get_global_seqno(self.event) }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
   |
help: you can convert a `u32` to a `u64`
   |
81 |         unsafe { gpiod::gpiod_edge_event_get_global_seqno(self.event).into() }
   |                                                                      +++++++

error[E0308]: mismatched types
  --> libgpiod/src/edge_event.rs:89:18
   |
88 |     pub fn line_seqno(&self) -> u64 {
   |                                 --- expected `u64` because of return type
89 |         unsafe { gpiod::gpiod_edge_event_get_line_seqno(self.event) }
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
   |
help: you can convert a `u32` to a `u64`
   |
89 |         unsafe { gpiod::gpiod_edge_event_get_line_seqno(self.event).into() }
   |                                                                    +++++++

error[E0308]: mismatched types
   --> libgpiod/src/line_config.rs:100:72
    |
100 |             unsafe { gpiod::gpiod_line_config_get_offsets(self.config, &mut num, &mut offsets) };
    |                      ------------------------------------              ^^^^^^^^ expected `u32`, found `u64`
    |                      |
    |                      arguments to this function are incorrect
    |
    = note:    expected raw pointer `*mut u32`
            found mutable reference `&mut u64`
note: function defined here
   --> /home/pi/libgpiod/bindings/rust/libgpiod-sys/src/bindings.rs:847:12
    |
847 |     pub fn gpiod_line_config_get_offsets(
    |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

error[E0308]: mismatched types
   --> libgpiod/src/line_info.rs:168:40
    |
168 |         Duration::from_micros(unsafe { gpiod::gpiod_line_info_get_debounce_period_us(self.info) })
    |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
    |
help: you can convert a `u32` to a `u64`
    |
168 |         Duration::from_micros(unsafe { gpiod::gpiod_line_info_get_debounce_period_us(self.info).into() })
    |                                                                                                +++++++

error[E0308]: mismatched types
    --> libgpiod/src/line_request.rs:226:17
     |
223  |             gpiod::gpiod_line_request_read_edge_event(
     |             ----------------------------------------- arguments to this function are incorrect
...
226  |                 buffer.capacity() as u64,
     |                 ^^^^^^^^^^^^^^^^^^^^^^^^ expected `u32`, found `u64`
     |
note: function defined here
    --> /home/pi/libgpiod/bindings/rust/libgpiod-sys/src/bindings.rs:1058:12
     |
1058 |     pub fn gpiod_line_request_read_edge_event(
     |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
help: you can convert a `u64` to a `u32` and panic if the converted value doesn't fit
     |
226  |                 (buffer.capacity() as u64).try_into().unwrap(),
     |                 +                        +++++++++++++++++++++

error[E0308]: mismatched types
   --> libgpiod/src/line_settings.rs:209:17
    |
207 |             gpiod::gpiod_line_settings_set_debounce_period_us(
    |             ------------------------------------------------- arguments to this function are incorrect
208 |                 self.settings,
209 |                 period.as_micros() as u64,
    |                 ^^^^^^^^^^^^^^^^^^^^^^^^^ expected `u32`, found `u64`
    |
note: function defined here
   --> /home/pi/libgpiod/bindings/rust/libgpiod-sys/src/bindings.rs:746:12
    |
746 |     pub fn gpiod_line_settings_set_debounce_period_us(
    |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
help: you can convert a `u64` to a `u32` and panic if the converted value doesn't fit
    |
209 |                 (period.as_micros() as u64).try_into().unwrap(),
    |                 +                         +++++++++++++++++++++

error[E0308]: mismatched types
   --> libgpiod/src/line_settings.rs:217:13
    |
217 |             gpiod::gpiod_line_settings_get_debounce_period_us(self.settings)
    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
    |
help: you can convert a `u32` to a `u64`
    |
217 |             gpiod::gpiod_line_settings_get_debounce_period_us(self.settings).into()
    |                                                                             +++++++

For more information about this error, try `rustc --explain E0308`.
error: could not compile `libgpiod` due to 8 previous errors

---

An example of one of the relevant generated signatures is:

    pub fn gpiod_edge_event_buffer_get_event(
        buffer: *mut gpiod_edge_event_buffer,
        index: ::std::os::raw::c_ulong,
    ) -> *mut gpiod_edge_event;

On 32-bit c_ulong maps to u32, not u64.

Cheers,
Kent.

