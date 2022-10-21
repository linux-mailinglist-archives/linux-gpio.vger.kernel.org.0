Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60012607616
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 13:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiJULZL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 07:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiJULZK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 07:25:10 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C70DBBCD
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 04:25:06 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y4so2084943plb.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 04:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UrzI9a2AXP6IMfVjgIFYzpTwx7mc5H+EAwb6YxzPYOQ=;
        b=dB89pZgGv18c37kNrU3xClB7WN/JlYfzDoXOm9ITWmMYIBXE1ITBxGzwXFemM6i3jT
         XQqt4s6M4gvin2sVf4wIw7ewsJdq3h4DpFxgDivYDazrPaePtlukiF5KzDKcu8YC7vgx
         vWPc0Hwf7U83gftw6iuz65gJpNUbvkShtMDpfBIlXA8ZV9iLMFN00nG8N4hFZaHKQiM5
         5ejek/S5IsOqVv2Vd+2SrcrNZFjhqYzdlWnmsu1j5ifuM5zQhul+qw+0tobcPhtFmnM1
         0+d01/2uzSdpi78VyeQBmiIcMC5F+L0R1/NdnEV264o9Nkik3RH8U/A3PXS+McFEA+7I
         +f3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrzI9a2AXP6IMfVjgIFYzpTwx7mc5H+EAwb6YxzPYOQ=;
        b=fwne9AX8w2/DBzUSc7Yb6rohFFM0eXSv623DYgMmfb5GKPaHX0HvOe9bXuCfAPD562
         3BYj/4DEM2JKZvLb8j7ETetagsO/HDxWLwprxRVYk5/2+0qKZV5L6Z6i1GVs7mapu0uH
         jaz3V5/gEAUBs9SUdLePvNNltH3XHyHEjN4ZxHf8No7E5c/8YTFPKDgZrLIeZhSn3XVe
         tEaRRcOE/iqLxyvAYSVbQwwn3qYuA6rjms2C5D76lj0w6iWDbsKwTRz5njSlZoOzkaFy
         lH4utASdGl/9B+PACgdlwG6GS6vJEfteXpUkM3Ael2sZRX7/mze7kYZA3O0073eyGv51
         unIw==
X-Gm-Message-State: ACrzQf2Px8EcSlVu1psZPyXxI0LpE2jpsnoTnVZLXK0dnVqElKDf6xeK
        DAaOtPt/geJ6IoOQoKJODVJ7Rw==
X-Google-Smtp-Source: AMsMyM5fmUJj0bVfCk1PO5MNBDnJRPCRxeAZa6M6g/mCCmVwc2p3AffUMtRACnK9sC5/teZVUExoog==
X-Received: by 2002:a17:90b:3b88:b0:212:d5c7:8858 with SMTP id pc8-20020a17090b3b8800b00212d5c78858mr1504468pjb.151.1666351506000;
        Fri, 21 Oct 2022 04:25:06 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902ced200b0017eea4a3979sm14582225plg.154.2022.10.21.04.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 04:25:05 -0700 (PDT)
Date:   Fri, 21 Oct 2022 16:55:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20221021112502.xd6xpywttgot2mw6@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y04dKCIhFPbJRFqC@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y04dKCIhFPbJRFqC@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18-10-22, 11:27, Kent Gibson wrote:
> One more thing - I overlooked trying to build on 32-bit while reviewing.
> (in this case on a Raspberry Pi 4)

I missed running this :(

cargo build --target arm-unknown-linux-gnueabi

I have these changes on the top and yet I have an error which I am not
sure how to fix here without special if/else code per target.

diff --git a/bindings/rust/gpiosim/src/sim.rs b/bindings/rust/gpiosim/src/sim.rs
index 4dd4adfa0d3f..dfa22fbec94b 100644
--- a/bindings/rust/gpiosim/src/sim.rs
+++ b/bindings/rust/gpiosim/src/sim.rs
@@ -186,7 +186,7 @@ impl SimBank {

     fn set_num_lines(&self, num: u64) -> Result<()> {
         // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
-        let ret = unsafe { gpiosim_bank_set_num_lines(self.bank, num) };
+        let ret = unsafe { gpiosim_bank_set_num_lines(self.bank, num.try_into().unwrap()) };
         if ret == -1 {
             Err(Error::OperationFailed(
                 OperationType::SimBankSetNumLines,
diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index 0d328ebb2b03..87c5af228e2b 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -76,7 +76,7 @@ impl<'b> Event<'b> {
     /// associated line request.
     pub fn global_seqno(&self) -> u64 {
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_edge_event_get_global_seqno(self.event) }
+        unsafe { gpiod::gpiod_edge_event_get_global_seqno(self.event) as u64 }
     }

     /// Get the event sequence number specific to concerned line.
@@ -85,7 +85,7 @@ impl<'b> Event<'b> {
     /// lifetime of the associated line request.
     pub fn line_seqno(&self) -> u64 {
         // SAFETY: `gpiod_edge_event` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_edge_event_get_line_seqno(self.event) }
+        unsafe { gpiod::gpiod_edge_event_get_line_seqno(self.event) as u64 }
     }
 }

diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index a458e72e0b12..aa1824cf3e80 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -144,7 +144,9 @@ impl Info {
     /// Get the debounce period of the line.
     pub fn debounce_period(&self) -> Duration {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Duration::from_micros(unsafe { gpiod::gpiod_line_info_get_debounce_period_us(self.info) })
+        Duration::from_micros(unsafe {
+            gpiod::gpiod_line_info_get_debounce_period_us(self.info).into()
+        })
     }
 }

diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index d422ad1ea68f..4df3efb1a93f 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -220,7 +220,7 @@ impl Settings {
         unsafe {
             gpiod::gpiod_line_settings_set_debounce_period_us(
                 self.settings,
-                period.as_micros() as u64,
+                (period.as_micros() as usize).try_into().unwrap(),
             );
         }

@@ -231,7 +231,7 @@ impl Settings {
     pub fn debounce_period(&self) -> Result<Duration> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         Ok(Duration::from_micros(unsafe {
-            gpiod::gpiod_line_settings_get_debounce_period_us(self.settings)
+            gpiod::gpiod_line_settings_get_debounce_period_us(self.settings).into()
         }))
     }

diff --git a/bindings/rust/libgpiod/tests/chip.rs b/bindings/rust/libgpiod/tests/chip.rs
index aaee910e457f..a7fdaadf4da1 100644
--- a/bindings/rust/libgpiod/tests/chip.rs
+++ b/bindings/rust/libgpiod/tests/chip.rs
@@ -90,7 +90,10 @@ mod chip {
             // Failure
             assert_eq!(
                 chip.line_offset_from_name("nonexistent").unwrap_err(),
-                ChipError::OperationFailed(OperationType::ChipGetLineOffsetFromName, Errno::new(ENOENT))
+                ChipError::OperationFailed(
+                    OperationType::ChipGetLineOffsetFromName,
+                    Errno::new(ENOENT),
+                )
             );
         }
     }
$


-------------------------8<-------------------------

Current failures:

error[E0308]: mismatched types
   --> libgpiod/src/line_config.rs:105:78
    |
105 |         let ret = unsafe { gpiod::gpiod_line_config_get_offsets(self.config, &mut num, &mut ptr) };
    |                            ------------------------------------              ^^^^^^^^ expected `u32`, found `u64`
    |                            |
    |                            arguments to this function are incorrect
    |
    = note:    expected raw pointer `*mut u32`
            found mutable reference `&mut u64`
note: function defined here
   --> /mnt/ssd/all/work/repos/virtio/rust/libgpiod/bindings/rust/libgpiod-sys/src/bindings.rs:847:12
    |
847 |     pub fn gpiod_line_config_get_offsets(
    |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For more information about this error, try `rustc --explain E0308`.
error: could not compile `libgpiod` due to previous error


-- 
viresh
