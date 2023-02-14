Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368A3695962
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Feb 2023 07:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjBNGp4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Feb 2023 01:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbjBNGpu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Feb 2023 01:45:50 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02701D93E
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 22:45:45 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id o8so13694304pls.11
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 22:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le9fM18mP4cGW/xZpYvSDjpmlg7QVRuW+mP1TFxDzjw=;
        b=QwJ0HGN2Gd71ZmFK8SDjsxRsgJkd5uEvK9ubO7r/HeGu9ogfldkjHl+Z0tadUG/x+Y
         eDe3EVJNAVTUZ7/mJ3c9NZ32AQPZebO/6WfHOabF2y6zcSwFGjm6Wooax8z0UpEA70Me
         HI6x8xgdoJ1TOCcKVzCoxDruxbT3WnpmrJQPSPxxc+Y0Fr5TrJdGulwvyoCuuT+BP6R0
         0LtG51CMHNoVTaT5vNBMexfztTxHTKT+gCwmGzc/PAEagzJE0Z+M/rIR4Q9j4olCj7hK
         TIz1yl+Cx8njwcKsVk0gfb2gvKTiqii4hT11O0oSAN5oaaS/AiuvJ9cj0mYgdvx7l8/j
         JhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le9fM18mP4cGW/xZpYvSDjpmlg7QVRuW+mP1TFxDzjw=;
        b=mJFbdob4IqT7ZxvmgkQAzbCub4gfFX+zhZcgmy0ndpODO8CfV6zz0+u+i7c+yk3+Kx
         TAA6rz+q3RXSC0CGGwj8JM380CEWV1QimaxANGg4L3XjKbllxVj19/c5+dJEr8DTNCwG
         D5DXnIc0hnWgKUl82kcKXiUN8YVuIonmShautLSc0gGQkER+BNNzrV5cIQqKsybeb+z+
         piSBUbvAbTDK3PeYYehke7EBc6ltGVBA1Uo4nnwRpya/suAk8A5iWryji48IIYXkTe1L
         IgE4CwwoXs9efEHv4K96vepGXXSCX2KDAtXFiu3tEn2gJxE8XdOickZF8hcmI9IQLI2A
         WoNg==
X-Gm-Message-State: AO0yUKW9qNkv65VFvE3TrLzAFZBLAj5PgZpjbqiBcyX66HdukCAHdw/7
        Z1V5GBopSgQCerAnj2SF73zueFEwnN9Nbe1X
X-Google-Smtp-Source: AK7set+vKHI9d/kxjwInqy3iKPe4Qx63CUTfo+HiItTvegX7OZHJ0ttqqJCVlqlKZIVW9OcDXcMOrw==
X-Received: by 2002:a17:902:e804:b0:196:519d:8655 with SMTP id u4-20020a170902e80400b00196519d8655mr1939744plg.5.1676357145258;
        Mon, 13 Feb 2023 22:45:45 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c24500b0019a928a8982sm4464156plg.118.2023.02.13.22.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 22:45:44 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/2] bindings: rust: Update bindgen's version
Date:   Tue, 14 Feb 2023 12:15:35 +0530
Message-Id: <28f987bd0b6fd94f381b27f712c7d99ade607cf6.1676357080.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <24d754e5d765de80f99d8f8942d7ffeea8f3110c.1676357080.git.viresh.kumar@linaro.org>
References: <24d754e5d765de80f99d8f8942d7ffeea8f3110c.1676357080.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The currently selected version of bindgen has a unmaintained dependency
and generates the following build warning while building vhost-device
crate:

Crate:     ansi_term
Version:   0.12.1
Warning:   unmaintained
Title:     ansi_term is Unmaintained
Date:      2021-08-18
ID:        RUSTSEC-2021-0139
URL:       https://rustsec.org/advisories/RUSTSEC-2021-0139
Dependency tree:
ansi_term 0.12.1
└── clap 2.34.0
    └── bindgen 0.59.2
        └── libgpiod-sys 0.1.0
            └── libgpiod 0.1.0
                └── vhost-device-gpio 0.1.0

error: 1 denied warning found!

Fix it by moving to a later version of bindgen, which updates the types
of few of the arguments to the FFI helpers and so required changes to
few of explicit type conversions.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml         | 2 +-
 bindings/rust/libgpiod-sys/Cargo.toml        | 2 +-
 bindings/rust/libgpiod/src/event_buffer.rs   | 3 +--
 bindings/rust/libgpiod/src/line_config.rs    | 6 ++----
 bindings/rust/libgpiod/src/line_request.rs   | 8 ++++----
 bindings/rust/libgpiod/src/request_config.rs | 4 ++--
 6 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index c3571d2cf48e..9aa047feba82 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -19,5 +19,5 @@ errno = "0.2.8"
 libgpiod = { path = "../libgpiod" }
 
 [build-dependencies]
-bindgen = "0.59.1"
+bindgen = "0.63"
 cc = "1.0.46"
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 479184da3f7b..3bc3525aedca 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -17,5 +17,5 @@ edition = "2021"
 [dependencies]
 
 [build-dependencies]
-bindgen = "0.59.1"
+bindgen = "0.63"
 cc = "1.0.46"
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 5a72ddb197ac..0675ea6c5181 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -2,7 +2,6 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-use std::os::raw::c_ulong;
 use std::ptr;
 
 use super::{
@@ -74,7 +73,7 @@ impl Buffer {
     pub fn new(capacity: usize) -> Result<Self> {
         // SAFETY: The `gpiod_edge_event_buffer` returned by libgpiod is guaranteed to live as long
         // as the `struct Buffer`.
-        let buffer = unsafe { gpiod::gpiod_edge_event_buffer_new(capacity as c_ulong) };
+        let buffer = unsafe { gpiod::gpiod_edge_event_buffer_new(capacity) };
         if buffer.is_null() {
             return Err(Error::OperationFailed(
                 OperationType::EdgeEventBufferNew,
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index 3848a3a68304..a2721a20e4fa 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -2,8 +2,6 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-use std::os::raw::c_ulong;
-
 use super::{
     gpiod,
     line::{Offset, Settings, SettingsMap, Value},
@@ -65,7 +63,7 @@ impl Config {
             gpiod::gpiod_line_config_add_line_settings(
                 self.config,
                 offsets.as_ptr(),
-                offsets.len() as c_ulong,
+                offsets.len(),
                 settings.settings,
             )
         };
@@ -91,7 +89,7 @@ impl Config {
             gpiod::gpiod_line_config_set_output_values(
                 self.config,
                 mapped_values.as_ptr(),
-                values.len() as u64,
+                values.len(),
             )
         };
 
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index a77c95deb1e3..ebf41f240ae2 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -2,7 +2,7 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-use std::os::{raw::c_ulong, unix::prelude::AsRawFd};
+use std::os::unix::prelude::AsRawFd;
 use std::time::Duration;
 
 use super::{
@@ -40,7 +40,7 @@ impl Request {
             gpiod::gpiod_line_request_get_requested_offsets(
                 self.request,
                 offsets.as_mut_ptr(),
-                self.num_lines() as u64,
+                self.num_lines(),
             )
         };
         offsets.shrink_to(num_offsets as usize);
@@ -70,7 +70,7 @@ impl Request {
         let ret = unsafe {
             gpiod::gpiod_line_request_get_values_subset(
                 self.request,
-                offsets.len() as c_ulong,
+                offsets.len(),
                 offsets.as_ptr(),
                 values.as_mut_ptr(),
             )
@@ -127,7 +127,7 @@ impl Request {
         let ret = unsafe {
             gpiod::gpiod_line_request_set_values_subset(
                 self.request,
-                offsets.len() as c_ulong,
+                offsets.len(),
                 offsets.as_ptr(),
                 values.as_ptr(),
             )
diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
index 939838cbed2f..2ad68efdd12a 100644
--- a/bindings/rust/libgpiod/src/request_config.rs
+++ b/bindings/rust/libgpiod/src/request_config.rs
@@ -3,7 +3,7 @@
 // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
 use std::ffi::{CStr, CString};
-use std::os::raw::{c_char, c_ulong};
+use std::os::raw::c_char;
 use std::str;
 
 use super::{gpiod, Error, OperationType, Result};
@@ -75,7 +75,7 @@ impl Config {
     /// Set the size of the kernel event buffer for the request.
     pub fn set_event_buffer_size(&mut self, size: usize) -> &mut Self {
         // SAFETY: `gpiod_request_config` is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_request_config_set_event_buffer_size(self.config, size as c_ulong) }
+        unsafe { gpiod::gpiod_request_config_set_event_buffer_size(self.config, size) }
 
         self
     }
-- 
2.31.1.272.g89b43f80a514

