Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B255600DAD
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 13:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbiJQL0b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 07:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiJQL0a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 07:26:30 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975B24F1B3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 04:26:28 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id p14so10804230pfq.5
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 04:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HeSAgqk107qL/AhX2O9KwlqqGhz7oKqv6E+ktTRaM9U=;
        b=nqUW+2m2AlsJwk2Ea4wjkIAT4bou9dhZAcj9gsNiUesQO6KxA2+UDUQIfvuB/MNWcw
         DwHoLybdu/zWTmuWaWpgyH6Qty0bOBIGLG7zIt3p/K8K4MCCC/4oA/lKdq9q3iR3Uj/k
         wjCjXTqkC3+rdTrzTTF5bKxune+KtLBGzt46oaEZc+XiSXIqpCCHlUVkOOj+9UNvCfsv
         Ti2OToNCboQP3dWAdfaA51Lu8v4o2M+OV5IXqH+CLry5UjtiGYBrx+WrvzG2dzIIeKYR
         0Ltmi2P2est2pFEgbI9+OKctY/2QJcBEBhVeZTdSgn4ER+JN6+pkHMCMpKwF76n6SmDj
         CSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeSAgqk107qL/AhX2O9KwlqqGhz7oKqv6E+ktTRaM9U=;
        b=UzowPgJKlbuOhgge92cvagsfQShqxqTUu2zKRrcY+33jQ8g6clKmGkon3Wlw0UzQo9
         ZaaANVkGKoRZirJN3vj74POi4ckXZOUYaGT7EdYsd/yuyt8xvmpM5zVmOLXbhKNjLlqC
         74mRHp3ECDyl1qe/fsJX2hzVrQSZgjYIqWv2aZkFgOtykSuA/zBDfkgM8/YYOqDJclP6
         W3+uE8EJzlM2bNLmDojkzPR8GRj3jOVb6NE96Bd2NRff7fEeWs+uI0PveK6XGAH0FHTp
         3VYWgJwLVlCaIXAh32TBZ5yDmRWD3Qhg+ulqnm0rYdj3F5WUHa0SpEG6w5loGFERI6v5
         Z5Rg==
X-Gm-Message-State: ACrzQf3N0typUG+pCJSqhWcINEXfruP0soICdsHUfUdGitGVeV74/Izh
        VlyrQbJjDP+050iGoYRC0CyQAQ==
X-Google-Smtp-Source: AMsMyM4QZCIO4hqgNixhR6We4ULWcm5P3yquyz46NW20PqhPMh0eA7GXrkSjUlqeEreNk8OxG7E39Q==
X-Received: by 2002:a63:ed07:0:b0:442:87:3a38 with SMTP id d7-20020a63ed07000000b0044200873a38mr10497379pgi.216.1666005987971;
        Mon, 17 Oct 2022 04:26:27 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id r16-20020a63e510000000b004308422060csm5884781pgh.69.2022.10.17.04.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 04:26:27 -0700 (PDT)
Date:   Mon, 17 Oct 2022 16:56:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20221017112625.sobgfiist7t6w5zz@vireshk-i7>
References: <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7>
 <20221013061204.hu2vn24g42egybbl@vireshk-i7>
 <CAMRc=MfNjCARhhG1yGDKU0HYUmsHkN_MihWy-+pg+SY0T9WERg@mail.gmail.com>
 <20221014095724.ajajkp3ysdfxd2f2@vireshk-i7>
 <CAMRc=Mc5qVJfcPoVit8zgnoAPKqWY3qb1MQwtfP7FNJ53O=UjA@mail.gmail.com>
 <Y0mJC8lVM/cgBLyi@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0mJC8lVM/cgBLyi@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15-10-22, 00:06, Kent Gibson wrote:
> If the mutators for each field still exist they may as well be pub.
> 
> And they should return Result<&mut Self> so they can be chained, as you
> suggest.
> 
> Wrt the values param (which I would prefer was called props)

Is this fine now ? Rebased over v7.

diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index 2c3090132ea5..be50b5b41c5a 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -70,18 +70,18 @@ impl Settings {
     }

     /// Set line prop setting.
-    pub fn set_prop(&mut self, values: &[SettingVal]) -> Result<()> {
-        for value in values {
-            match value {
-                SettingVal::Direction(val) => self.set_direction(*val)?,
-                SettingVal::EdgeDetection(val) => self.set_edge_detection(*val)?,
-                SettingVal::Bias(val) => self.set_bias(*val)?,
-                SettingVal::Drive(val) => self.set_drive(*val)?,
-                SettingVal::ActiveLow(val) => self.set_active_low(*val),
-                SettingVal::DebouncePeriod(val) => self.set_debounce_period(*val),
-                SettingVal::EventClock(val) => self.set_event_clock(*val)?,
-                SettingVal::OutputValue(val) => self.set_output_value(*val)?,
-            }
+    pub fn set_prop(&mut self, props: &[SettingVal]) -> Result<()> {
+        for property in props {
+            match property {
+                SettingVal::Direction(prop) => self.set_direction(*prop)?,
+                SettingVal::EdgeDetection(prop) => self.set_edge_detection(*prop)?,
+                SettingVal::Bias(prop) => self.set_bias(*prop)?,
+                SettingVal::Drive(prop) => self.set_drive(*prop)?,
+                SettingVal::ActiveLow(prop) => self.set_active_low(*prop),
+                SettingVal::DebouncePeriod(prop) => self.set_debounce_period(*prop),
+                SettingVal::EventClock(prop) => self.set_event_clock(*prop)?,
+                SettingVal::OutputValue(prop) => self.set_output_value(*prop)?,
+            };
         }

         Ok(())
@@ -102,7 +102,7 @@ impl Settings {
     }

     /// Set the line direction.
-    fn set_direction(&mut self, direction: Direction) -> Result<()> {
+    pub fn set_direction(&mut self, direction: Direction) -> Result<&mut Self> {
         let ret = unsafe {
             gpiod::gpiod_line_settings_set_direction(
                 self.settings,
@@ -116,17 +116,17 @@ impl Settings {
                 Errno::last(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }

     /// Get the direction setting.
-    fn direction(&self) -> Result<Direction> {
+    pub fn direction(&self) -> Result<Direction> {
         Direction::new(unsafe { gpiod::gpiod_line_settings_get_direction(self.settings) } as u32)
     }

     /// Set the edge event detection setting.
-    fn set_edge_detection(&mut self, edge: Option<Edge>) -> Result<()> {
+    pub fn set_edge_detection(&mut self, edge: Option<Edge>) -> Result<&mut Self> {
         let ret = unsafe {
             gpiod::gpiod_line_settings_set_edge_detection(
                 self.settings,
@@ -140,17 +140,17 @@ impl Settings {
                 Errno::last(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }

     /// Get the edge event detection setting.
-    fn edge_detection(&self) -> Result<Option<Edge>> {
+    pub fn edge_detection(&self) -> Result<Option<Edge>> {
         Edge::new(unsafe { gpiod::gpiod_line_settings_get_edge_detection(self.settings) } as u32)
     }

     /// Set the bias setting.
-    fn set_bias(&mut self, bias: Option<Bias>) -> Result<()> {
+    pub fn set_bias(&mut self, bias: Option<Bias>) -> Result<&mut Self> {
         let ret = unsafe {
             gpiod::gpiod_line_settings_set_bias(self.settings, Bias::gpiod_bias(bias) as i32)
         };
@@ -161,17 +161,17 @@ impl Settings {
                 Errno::last(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }

     /// Get the bias setting.
-    fn bias(&self) -> Result<Option<Bias>> {
+    pub fn bias(&self) -> Result<Option<Bias>> {
         Bias::new(unsafe { gpiod::gpiod_line_settings_get_bias(self.settings) } as u32)
     }

     /// Set the drive setting.
-    fn set_drive(&mut self, drive: Drive) -> Result<()> {
+    pub fn set_drive(&mut self, drive: Drive) -> Result<&mut Self> {
         let ret = unsafe {
             gpiod::gpiod_line_settings_set_drive(self.settings, drive.gpiod_drive() as i32)
         };
@@ -182,44 +182,49 @@ impl Settings {
                 Errno::last(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }

     /// Get the drive setting.
-    fn drive(&self) -> Result<Drive> {
+    pub fn drive(&self) -> Result<Drive> {
         Drive::new(unsafe { gpiod::gpiod_line_settings_get_drive(self.settings) } as u32)
     }

     /// Set active-low setting.
-    fn set_active_low(&mut self, active_low: bool) {
-        unsafe { gpiod::gpiod_line_settings_set_active_low(self.settings, active_low) }
+    pub fn set_active_low(&mut self, active_low: bool) -> &mut Self {
+        unsafe {
+            gpiod::gpiod_line_settings_set_active_low(self.settings, active_low);
+        }
+        self
     }

     /// Check the active-low setting.
-    fn active_low(&self) -> bool {
+    pub fn active_low(&self) -> bool {
         unsafe { gpiod::gpiod_line_settings_get_active_low(self.settings) }
     }

     /// Set the debounce period setting.
-    fn set_debounce_period(&mut self, period: Duration) {
+    pub fn set_debounce_period(&mut self, period: Duration) -> &mut Self {
         unsafe {
             gpiod::gpiod_line_settings_set_debounce_period_us(
                 self.settings,
                 period.as_micros() as u64,
-            )
+            );
         }
+
+        self
     }

     /// Get the debounce period.
-    fn debounce_period(&self) -> Result<Duration> {
+    pub fn debounce_period(&self) -> Result<Duration> {
         Ok(Duration::from_micros(unsafe {
             gpiod::gpiod_line_settings_get_debounce_period_us(self.settings)
         }))
     }

     /// Set the event clock setting.
-    fn set_event_clock(&mut self, clock: EventClock) -> Result<()> {
+    pub fn set_event_clock(&mut self, clock: EventClock) -> Result<&mut Self> {
         let ret = unsafe {
             gpiod::gpiod_line_settings_set_event_clock(self.settings, clock.gpiod_clock() as i32)
         };
@@ -230,17 +235,17 @@ impl Settings {
                 Errno::last(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }

     /// Get the event clock setting.
-    fn event_clock(&self) -> Result<EventClock> {
+    pub fn event_clock(&self) -> Result<EventClock> {
         EventClock::new(unsafe { gpiod::gpiod_line_settings_get_event_clock(self.settings) } as u32)
     }

     /// Set the output value setting.
-    fn set_output_value(&mut self, value: Value) -> Result<()> {
+    pub fn set_output_value(&mut self, value: Value) -> Result<&mut Self> {
         let ret =
             unsafe { gpiod::gpiod_line_settings_set_output_value(self.settings, value.value()) };

@@ -250,12 +255,12 @@ impl Settings {
                 Errno::last(),
             ))
         } else {
-            Ok(())
+            Ok(self)
         }
     }

     /// Get the output value, 0 or 1.
-    fn output_value(&self) -> Result<Value> {
+    pub fn output_value(&self) -> Result<Value> {
         let value = unsafe { gpiod::gpiod_line_settings_get_output_value(self.settings) };

         if value != 0 && value != 1 {

-- 
viresh
