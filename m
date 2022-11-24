Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5506376B8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 11:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiKXKpI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 05:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiKXKpG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 05:45:06 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC74D92E7
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 02:45:04 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id b4so1295671pfb.9
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 02:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xb1AEyZH/RR9L6AUjyx4TH6rmbivQPK42JD/a1raQxs=;
        b=eUzQ39H7+GZQhpUeAEiDLottSV89r2pwQWaw20ED7ZQ5BfqYEgb2g6fxP2sKQyH9Lu
         85MTjzQy7xaz0jC489KSGOixWwm6W7LCZBrdKi64uo4UldJ85roTHrIX99RIqsti0f6j
         5sk0G+4e7HSm5z+0odpnzw6Rvtx4aN5DzJtBw2AP7RCIYEKxj+3+HXqX7r7whHA/FXFO
         wb0GTt/RxEy6XnMINkfaEJK21YZDLUh9W86PzsZpw17FVPy9hP7Wyahfl9qEoUpfETzS
         Qz+fI4M9yi6r3fm7gG95zxx6b7R1nYhGPKALPfvOQZXEKX+HVCZeSiBmqzRlzoc7wqAC
         ShHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb1AEyZH/RR9L6AUjyx4TH6rmbivQPK42JD/a1raQxs=;
        b=tmpytJc5+WXiuyoKQ2fASoX4ZoxWDS+sUpg6RUEO6xAzGhRPOJCBe3CGFWNRkGMKc7
         hkMshKF1pXHlDJhYttLGe5shISUt+lv24AsqAjxR9t5IQ/3j1bKgdUONUIiaoIG/8CKY
         rNRhuO4o+bArdzEppiOOVFOLU+ipcv5qXIFCcQy9SM9Ueo906XSQepA8nYtA8aXV3ogQ
         gHyOSm2ZPDoNe/Co3co8UohuDUGDYcfA21+ye4Km+CUGReueGng/VpqmnmI1xGjX0VUM
         0Y/pcl3TUhNsOU7c8Cwhi/aLdHIEywwkkCgWs3dGmuPKLZwg+58zhY7d5xhO0yaQSHJh
         8E0g==
X-Gm-Message-State: ANoB5pk2y99x7wnNnbCO+OmzTZP58dTyJ5UubyfQ151HAU73+xtQ9Ltp
        txqsNt/lzTMz3ER4bsSK6P38ZyueJ7fLIQ==
X-Google-Smtp-Source: AA0mqf5+DO7z/92H6GM3VXH6ftoIS6H88BE69aGH7QX6AUtKX27ceVrCLDU0QTxpSPbQXUpTHyqfDw==
X-Received: by 2002:aa7:9dc6:0:b0:561:b2ea:bfe9 with SMTP id g6-20020aa79dc6000000b00561b2eabfe9mr15166628pfq.4.1669286704060;
        Thu, 24 Nov 2022 02:45:04 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902650d00b0018863e1bd3csm952053plk.134.2022.11.24.02.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:45:03 -0800 (PST)
Date:   Thu, 24 Nov 2022 16:15:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
Message-ID: <20221124104501.2bfllqmpfegdcs3m@vireshk-i7>
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
 <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
 <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23-11-22, 19:37, Bartosz Golaszewski wrote:
> Could you take a look at https://github.com/brgl/libgpiod-private?
> There's a branch called topic/further-libgpiod-v2-updates. Can you
> check out commit 5a4e08d546a8ec32757e6c9cc59d7a16939721ea and tell me
> how you'd make rust bindings work with it because I'm out of ideas
> (and my comfort zone)?

https://github.com/vireshk/libgpiod brgl/fix

For the benefit of others, I am pasting the entire diff of Rust changes required
to make the C library enums named.

The part that can be improved, but I am not sure how, is the Error enum. Maybe
Miguel or Kent can help ?

The problem is that the InvalidEnumValue Error needs to be generic, which makes
it:

"
pub enum Error<E> {
    ...
    InvalidEnumValue(&'static str, E),
};

pub type Result<T, E> = std::result::Result<T, Error<E>>;
"

Where E can be i32 or u32. Currently I just cast it everywhere as i32 to make
it work.

With above generics change, we need modifications like below everywhere, which I
don't really like.

"
-pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
+pub fn gpiochip_devices<P: AsRef<Path>, E>(path: &P) -> Result<Vec<chip::Chip>, Error<E>> {
"

What's the best way to make Error accept generics and still have a simpler
Result prototype ?

-- 
viresh

-------------------------8<-------------------------

diff --git a/bindings/rust/gpiosim-sys/src/lib.rs b/bindings/rust/gpiosim-sys/src/lib.rs
index 5391dbd62f44..4b0c8cc6262f 100644
--- a/bindings/rust/gpiosim-sys/src/lib.rs
+++ b/bindings/rust/gpiosim-sys/src/lib.rs
@@ -29,7 +29,7 @@ impl Value {
         match val {
             GPIOSIM_VALUE_INACTIVE => Ok(Value::InActive),
             GPIOSIM_VALUE_ACTIVE => Ok(Value::Active),
-            _ => Err(Error::InvalidEnumValue("Value", val as u32)),
+            _ => Err(Error::InvalidEnumValue("Value", val as i32)),
         }
     }
 }
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 161de164dddd..0cff45a432ab 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -24,6 +24,35 @@ use thiserror::Error as ThisError;

 use libgpiod_sys as gpiod;

+use gpiod::{
+    gpiod_edge_event_type_GPIOD_EDGE_EVENT_FALLING_EDGE as GPIOD_EDGE_EVENT_FALLING_EDGE,
+    gpiod_edge_event_type_GPIOD_EDGE_EVENT_RISING_EDGE as GPIOD_EDGE_EVENT_RISING_EDGE,
+    gpiod_info_event_type_GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED as GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,
+    gpiod_info_event_type_GPIOD_INFO_EVENT_LINE_RELEASED as GPIOD_INFO_EVENT_LINE_RELEASED,
+    gpiod_info_event_type_GPIOD_INFO_EVENT_LINE_REQUESTED as GPIOD_INFO_EVENT_LINE_REQUESTED,
+    gpiod_line_bias_GPIOD_LINE_BIAS_AS_IS as GPIOD_LINE_BIAS_AS_IS,
+    gpiod_line_bias_GPIOD_LINE_BIAS_DISABLED as GPIOD_LINE_BIAS_DISABLED,
+    gpiod_line_bias_GPIOD_LINE_BIAS_PULL_DOWN as GPIOD_LINE_BIAS_PULL_DOWN,
+    gpiod_line_bias_GPIOD_LINE_BIAS_PULL_UP as GPIOD_LINE_BIAS_PULL_UP,
+    gpiod_line_bias_GPIOD_LINE_BIAS_UNKNOWN as GPIOD_LINE_BIAS_UNKNOWN,
+    gpiod_line_direction_GPIOD_LINE_DIRECTION_AS_IS as GPIOD_LINE_DIRECTION_AS_IS,
+    gpiod_line_direction_GPIOD_LINE_DIRECTION_INPUT as GPIOD_LINE_DIRECTION_INPUT,
+    gpiod_line_direction_GPIOD_LINE_DIRECTION_OUTPUT as GPIOD_LINE_DIRECTION_OUTPUT,
+    gpiod_line_drive_GPIOD_LINE_DRIVE_OPEN_DRAIN as GPIOD_LINE_DRIVE_OPEN_DRAIN,
+    gpiod_line_drive_GPIOD_LINE_DRIVE_OPEN_SOURCE as GPIOD_LINE_DRIVE_OPEN_SOURCE,
+    gpiod_line_drive_GPIOD_LINE_DRIVE_PUSH_PULL as GPIOD_LINE_DRIVE_PUSH_PULL,
+    gpiod_line_edge_GPIOD_LINE_EDGE_BOTH as GPIOD_LINE_EDGE_BOTH,
+    gpiod_line_edge_GPIOD_LINE_EDGE_FALLING as GPIOD_LINE_EDGE_FALLING,
+    gpiod_line_edge_GPIOD_LINE_EDGE_NONE as GPIOD_LINE_EDGE_NONE,
+    gpiod_line_edge_GPIOD_LINE_EDGE_RISING as GPIOD_LINE_EDGE_RISING,
+    gpiod_line_event_clock_GPIOD_LINE_EVENT_CLOCK_HTE as GPIOD_LINE_EVENT_CLOCK_HTE,
+    gpiod_line_event_clock_GPIOD_LINE_EVENT_CLOCK_MONOTONIC as GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
+    gpiod_line_event_clock_GPIOD_LINE_EVENT_CLOCK_REALTIME as GPIOD_LINE_EVENT_CLOCK_REALTIME,
+    gpiod_line_value_GPIOD_LINE_VALUE_ACTIVE as GPIOD_LINE_VALUE_ACTIVE,
+    gpiod_line_value_GPIOD_LINE_VALUE_INACTIVE as GPIOD_LINE_VALUE_INACTIVE,
+    gpiod_line_value_GPIOD_LINE_VALUE_INVALID as GPIOD_LINE_VALUE_INVALID,
+};
+
 /// Operation types, used with OperationFailed() Error.
 #[derive(Copy, Clone, Debug, Eq, PartialEq)]
 pub enum OperationType {
@@ -96,7 +125,7 @@ pub enum Error {
     #[error("Invalid String")]
     InvalidString,
     #[error("Invalid enum {0} value: {1}")]
-    InvalidEnumValue(&'static str, u32),
+    InvalidEnumValue(&'static str, i32),
     #[error("Operation {0} Failed: {1}")]
     OperationFailed(OperationType, errno::Errno),
     #[error("Invalid Arguments")]
@@ -150,18 +179,24 @@ pub mod line {
     pub type ValueMap = IntMap<Value>;

     impl Value {
-        pub fn new(val: i32) -> Result<Self> {
+        pub fn new(val: gpiod::gpiod_line_value) -> Result<Self> {
             Ok(match val {
-                0 => Value::InActive,
-                1 => Value::Active,
-                _ => return Err(Error::InvalidEnumValue("Value", val as u32)),
+                GPIOD_LINE_VALUE_INACTIVE => Value::InActive,
+                GPIOD_LINE_VALUE_ACTIVE => Value::Active,
+                GPIOD_LINE_VALUE_INVALID => {
+                    return Err(Error::OperationFailed(
+                        OperationType::LineRequestGetVal,
+                        errno::errno(),
+                    ))
+                }
+                _ => return Err(Error::InvalidEnumValue("Value", val as i32)),
             })
         }

-        pub(crate) fn value(&self) -> i32 {
+        pub(crate) fn value(&self) -> gpiod::gpiod_line_value {
             match self {
-                Value::Active => 1,
-                Value::InActive => 0,
+                Value::Active => GPIOD_LINE_VALUE_ACTIVE,
+                Value::InActive => GPIOD_LINE_VALUE_INACTIVE,
             }
         }
     }
@@ -181,20 +216,20 @@ pub mod line {
     }

     impl Direction {
-        pub(crate) fn new(dir: u32) -> Result<Self> {
+        pub(crate) fn new(dir: gpiod::gpiod_line_direction) -> Result<Self> {
             Ok(match dir {
-                gpiod::GPIOD_LINE_DIRECTION_AS_IS => Direction::AsIs,
-                gpiod::GPIOD_LINE_DIRECTION_INPUT => Direction::Input,
-                gpiod::GPIOD_LINE_DIRECTION_OUTPUT => Direction::Output,
-                _ => return Err(Error::InvalidEnumValue("Direction", dir)),
+                GPIOD_LINE_DIRECTION_AS_IS => Direction::AsIs,
+                GPIOD_LINE_DIRECTION_INPUT => Direction::Input,
+                GPIOD_LINE_DIRECTION_OUTPUT => Direction::Output,
+                _ => return Err(Error::InvalidEnumValue("Direction", dir as i32)),
             })
         }

-        pub(crate) fn gpiod_direction(&self) -> u32 {
+        pub(crate) fn gpiod_direction(&self) -> gpiod::gpiod_line_direction {
             match self {
-                Direction::AsIs => gpiod::GPIOD_LINE_DIRECTION_AS_IS,
-                Direction::Input => gpiod::GPIOD_LINE_DIRECTION_INPUT,
-                Direction::Output => gpiod::GPIOD_LINE_DIRECTION_OUTPUT,
+                Direction::AsIs => GPIOD_LINE_DIRECTION_AS_IS,
+                Direction::Input => GPIOD_LINE_DIRECTION_INPUT,
+                Direction::Output => GPIOD_LINE_DIRECTION_OUTPUT,
             }
         }
     }
@@ -211,24 +246,24 @@ pub mod line {
     }

     impl Bias {
-        pub(crate) fn new(bias: u32) -> Result<Option<Self>> {
+        pub(crate) fn new(bias: gpiod::gpiod_line_bias) -> Result<Option<Self>> {
             Ok(match bias {
-                gpiod::GPIOD_LINE_BIAS_UNKNOWN => None,
-                gpiod::GPIOD_LINE_BIAS_AS_IS => None,
-                gpiod::GPIOD_LINE_BIAS_DISABLED => Some(Bias::Disabled),
-                gpiod::GPIOD_LINE_BIAS_PULL_UP => Some(Bias::PullUp),
-                gpiod::GPIOD_LINE_BIAS_PULL_DOWN => Some(Bias::PullDown),
-                _ => return Err(Error::InvalidEnumValue("Bias", bias)),
+                GPIOD_LINE_BIAS_UNKNOWN => None,
+                GPIOD_LINE_BIAS_AS_IS => None,
+                GPIOD_LINE_BIAS_DISABLED => Some(Bias::Disabled),
+                GPIOD_LINE_BIAS_PULL_UP => Some(Bias::PullUp),
+                GPIOD_LINE_BIAS_PULL_DOWN => Some(Bias::PullDown),
+                _ => return Err(Error::InvalidEnumValue("Bias", bias as i32)),
             })
         }

-        pub(crate) fn gpiod_bias(bias: Option<Bias>) -> u32 {
+        pub(crate) fn gpiod_bias(bias: Option<Bias>) -> gpiod::gpiod_line_bias {
             match bias {
-                None => gpiod::GPIOD_LINE_BIAS_AS_IS,
+                None => GPIOD_LINE_BIAS_AS_IS,
                 Some(bias) => match bias {
-                    Bias::Disabled => gpiod::GPIOD_LINE_BIAS_DISABLED,
-                    Bias::PullUp => gpiod::GPIOD_LINE_BIAS_PULL_UP,
-                    Bias::PullDown => gpiod::GPIOD_LINE_BIAS_PULL_DOWN,
+                    Bias::Disabled => GPIOD_LINE_BIAS_DISABLED,
+                    Bias::PullUp => GPIOD_LINE_BIAS_PULL_UP,
+                    Bias::PullDown => GPIOD_LINE_BIAS_PULL_DOWN,
                 },
             }
         }
@@ -246,20 +281,20 @@ pub mod line {
     }

     impl Drive {
-        pub(crate) fn new(drive: u32) -> Result<Self> {
+        pub(crate) fn new(drive: gpiod::gpiod_line_drive) -> Result<Self> {
             Ok(match drive {
-                gpiod::GPIOD_LINE_DRIVE_PUSH_PULL => Drive::PushPull,
-                gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN => Drive::OpenDrain,
-                gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE => Drive::OpenSource,
-                _ => return Err(Error::InvalidEnumValue("Drive", drive)),
+                GPIOD_LINE_DRIVE_PUSH_PULL => Drive::PushPull,
+                GPIOD_LINE_DRIVE_OPEN_DRAIN => Drive::OpenDrain,
+                GPIOD_LINE_DRIVE_OPEN_SOURCE => Drive::OpenSource,
+                _ => return Err(Error::InvalidEnumValue("Drive", drive as i32)),
             })
         }

-        pub(crate) fn gpiod_drive(&self) -> u32 {
+        pub(crate) fn gpiod_drive(&self) -> gpiod::gpiod_line_drive {
             match self {
-                Drive::PushPull => gpiod::GPIOD_LINE_DRIVE_PUSH_PULL,
-                Drive::OpenDrain => gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN,
-                Drive::OpenSource => gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE,
+                Drive::PushPull => GPIOD_LINE_DRIVE_PUSH_PULL,
+                Drive::OpenDrain => GPIOD_LINE_DRIVE_OPEN_DRAIN,
+                Drive::OpenSource => GPIOD_LINE_DRIVE_OPEN_SOURCE,
             }
         }
     }
@@ -276,23 +311,23 @@ pub mod line {
     }

     impl Edge {
-        pub(crate) fn new(edge: u32) -> Result<Option<Self>> {
+        pub(crate) fn new(edge: gpiod::gpiod_line_edge) -> Result<Option<Self>> {
             Ok(match edge {
-                gpiod::GPIOD_LINE_EDGE_NONE => None,
-                gpiod::GPIOD_LINE_EDGE_RISING => Some(Edge::Rising),
-                gpiod::GPIOD_LINE_EDGE_FALLING => Some(Edge::Falling),
-                gpiod::GPIOD_LINE_EDGE_BOTH => Some(Edge::Both),
-                _ => return Err(Error::InvalidEnumValue("Edge", edge)),
+                GPIOD_LINE_EDGE_NONE => None,
+                GPIOD_LINE_EDGE_RISING => Some(Edge::Rising),
+                GPIOD_LINE_EDGE_FALLING => Some(Edge::Falling),
+                GPIOD_LINE_EDGE_BOTH => Some(Edge::Both),
+                _ => return Err(Error::InvalidEnumValue("Edge", edge as i32)),
             })
         }

-        pub(crate) fn gpiod_edge(edge: Option<Edge>) -> u32 {
+        pub(crate) fn gpiod_edge(edge: Option<Edge>) -> gpiod::gpiod_line_edge {
             match edge {
-                None => gpiod::GPIOD_LINE_EDGE_NONE,
+                None => GPIOD_LINE_EDGE_NONE,
                 Some(edge) => match edge {
-                    Edge::Rising => gpiod::GPIOD_LINE_EDGE_RISING,
-                    Edge::Falling => gpiod::GPIOD_LINE_EDGE_FALLING,
-                    Edge::Both => gpiod::GPIOD_LINE_EDGE_BOTH,
+                    Edge::Rising => GPIOD_LINE_EDGE_RISING,
+                    Edge::Falling => GPIOD_LINE_EDGE_FALLING,
+                    Edge::Both => GPIOD_LINE_EDGE_BOTH,
                 },
             }
         }
@@ -358,20 +393,20 @@ pub mod line {
     }

     impl EventClock {
-        pub(crate) fn new(clock: u32) -> Result<Self> {
+        pub(crate) fn new(clock: gpiod::gpiod_line_event_clock) -> Result<Self> {
             Ok(match clock {
-                gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC => EventClock::Monotonic,
-                gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME => EventClock::Realtime,
-                gpiod::GPIOD_LINE_EVENT_CLOCK_HTE => EventClock::HTE,
-                _ => return Err(Error::InvalidEnumValue("Eventclock", clock)),
+                GPIOD_LINE_EVENT_CLOCK_MONOTONIC => EventClock::Monotonic,
+                GPIOD_LINE_EVENT_CLOCK_REALTIME => EventClock::Realtime,
+                GPIOD_LINE_EVENT_CLOCK_HTE => EventClock::HTE,
+                _ => return Err(Error::InvalidEnumValue("Eventclock", clock as i32)),
             })
         }

-        pub(crate) fn gpiod_clock(&self) -> u32 {
+        pub(crate) fn gpiod_clock(&self) -> gpiod::gpiod_line_event_clock {
             match self {
-                EventClock::Monotonic => gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
-                EventClock::Realtime => gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME,
-                EventClock::HTE => gpiod::GPIOD_LINE_EVENT_CLOCK_HTE,
+                EventClock::Monotonic => GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
+                EventClock::Realtime => GPIOD_LINE_EVENT_CLOCK_REALTIME,
+                EventClock::HTE => GPIOD_LINE_EVENT_CLOCK_HTE,
             }
         }
     }
@@ -388,12 +423,12 @@ pub mod line {
     }

     impl InfoChangeKind {
-        pub(crate) fn new(kind: u32) -> Result<Self> {
+        pub(crate) fn new(kind: gpiod::gpiod_info_event_type) -> Result<Self> {
             Ok(match kind {
-                gpiod::GPIOD_INFO_EVENT_LINE_REQUESTED => InfoChangeKind::LineRequested,
-                gpiod::GPIOD_INFO_EVENT_LINE_RELEASED => InfoChangeKind::LineReleased,
-                gpiod::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED => InfoChangeKind::LineConfigChanged,
-                _ => return Err(Error::InvalidEnumValue("InfoChangeKind", kind)),
+                GPIOD_INFO_EVENT_LINE_REQUESTED => InfoChangeKind::LineRequested,
+                GPIOD_INFO_EVENT_LINE_RELEASED => InfoChangeKind::LineReleased,
+                GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED => InfoChangeKind::LineConfigChanged,
+                _ => return Err(Error::InvalidEnumValue("InfoChangeKind", kind as i32)),
             })
         }
     }
@@ -408,11 +443,11 @@ pub mod line {
     }

     impl EdgeKind {
-        pub(crate) fn new(kind: u32) -> Result<Self> {
+        pub(crate) fn new(kind: gpiod::gpiod_edge_event_type) -> Result<Self> {
             Ok(match kind {
-                gpiod::GPIOD_EDGE_EVENT_RISING_EDGE => EdgeKind::Rising,
-                gpiod::GPIOD_EDGE_EVENT_FALLING_EDGE => EdgeKind::Falling,
-                _ => return Err(Error::InvalidEnumValue("EdgeEvent", kind)),
+                GPIOD_EDGE_EVENT_RISING_EDGE => EdgeKind::Rising,
+                GPIOD_EDGE_EVENT_FALLING_EDGE => EdgeKind::Falling,
+                _ => return Err(Error::InvalidEnumValue("EdgeEvent", kind as i32)),
             })
         }
     }
diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index 1784cde27e2f..b45878c523c9 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -100,7 +100,7 @@ impl Info {
     /// Get the GPIO line's direction.
     pub fn direction(&self) -> Result<Direction> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.info) } as u32)
+        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.info) })
     }

     /// Returns true if the line is "active-low", false otherwise.
@@ -112,25 +112,25 @@ impl Info {
     /// Get the GPIO line's bias setting.
     pub fn bias(&self) -> Result<Option<Bias>> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.info) } as u32)
+        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.info) })
     }

     /// Get the GPIO line's drive setting.
     pub fn drive(&self) -> Result<Drive> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.info) } as u32)
+        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.info) })
     }

     /// Get the current edge detection setting of the line.
     pub fn edge_detection(&self) -> Result<Option<Edge>> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.info) } as u32)
+        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.info) })
     }

     /// Get the current event clock setting used for edge event timestamps.
     pub fn event_clock(&self) -> Result<EventClock> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.info) } as u32)
+        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.info) })
     }

     /// Returns true if the line is debounced (either by hardware or by the
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index cedf7cabafcc..1c5ac66f9ce7 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -102,10 +102,7 @@ impl Settings {
     pub fn set_direction(&mut self, direction: Direction) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         let ret = unsafe {
-            gpiod::gpiod_line_settings_set_direction(
-                self.settings,
-                direction.gpiod_direction() as i32,
-            )
+            gpiod::gpiod_line_settings_set_direction(self.settings, direction.gpiod_direction())
         };

         if ret == -1 {
@@ -121,17 +118,14 @@ impl Settings {
     /// Get the direction setting.
     pub fn direction(&self) -> Result<Direction> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        Direction::new(unsafe { gpiod::gpiod_line_settings_get_direction(self.settings) } as u32)
+        Direction::new(unsafe { gpiod::gpiod_line_settings_get_direction(self.settings) })
     }

     /// Set the edge event detection setting.
     pub fn set_edge_detection(&mut self, edge: Option<Edge>) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         let ret = unsafe {
-            gpiod::gpiod_line_settings_set_edge_detection(
-                self.settings,
-                Edge::gpiod_edge(edge) as i32,
-            )
+            gpiod::gpiod_line_settings_set_edge_detection(self.settings, Edge::gpiod_edge(edge))
         };

         if ret == -1 {
@@ -147,15 +141,14 @@ impl Settings {
     /// Get the edge event detection setting.
     pub fn edge_detection(&self) -> Result<Option<Edge>> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        Edge::new(unsafe { gpiod::gpiod_line_settings_get_edge_detection(self.settings) } as u32)
+        Edge::new(unsafe { gpiod::gpiod_line_settings_get_edge_detection(self.settings) })
     }

     /// Set the bias setting.
     pub fn set_bias(&mut self, bias: Option<Bias>) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        let ret = unsafe {
-            gpiod::gpiod_line_settings_set_bias(self.settings, Bias::gpiod_bias(bias) as i32)
-        };
+        let ret =
+            unsafe { gpiod::gpiod_line_settings_set_bias(self.settings, Bias::gpiod_bias(bias)) };

         if ret == -1 {
             Err(Error::OperationFailed(
@@ -170,15 +163,14 @@ impl Settings {
     /// Get the bias setting.
     pub fn bias(&self) -> Result<Option<Bias>> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        Bias::new(unsafe { gpiod::gpiod_line_settings_get_bias(self.settings) } as u32)
+        Bias::new(unsafe { gpiod::gpiod_line_settings_get_bias(self.settings) })
     }

     /// Set the drive setting.
     pub fn set_drive(&mut self, drive: Drive) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        let ret = unsafe {
-            gpiod::gpiod_line_settings_set_drive(self.settings, drive.gpiod_drive() as i32)
-        };
+        let ret =
+            unsafe { gpiod::gpiod_line_settings_set_drive(self.settings, drive.gpiod_drive()) };

         if ret == -1 {
             Err(Error::OperationFailed(
@@ -193,7 +185,7 @@ impl Settings {
     /// Get the drive setting.
     pub fn drive(&self) -> Result<Drive> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        Drive::new(unsafe { gpiod::gpiod_line_settings_get_drive(self.settings) } as u32)
+        Drive::new(unsafe { gpiod::gpiod_line_settings_get_drive(self.settings) })
     }

     /// Set active-low setting.
@@ -236,7 +228,7 @@ impl Settings {
     pub fn set_event_clock(&mut self, clock: EventClock) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         let ret = unsafe {
-            gpiod::gpiod_line_settings_set_event_clock(self.settings, clock.gpiod_clock() as i32)
+            gpiod::gpiod_line_settings_set_event_clock(self.settings, clock.gpiod_clock())
         };

         if ret == -1 {

