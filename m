Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6090F56B89D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 13:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237760AbiGHLfY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 07:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237549AbiGHLfW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 07:35:22 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D98205C4
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 04:35:21 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id x18-20020a17090a8a9200b001ef83b332f5so1624264pjn.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u/136Pn2e5zcdxkV0/au4yNKOb6M10Nw+36EnmaP59I=;
        b=tOc3MnXI5f60usRQHJg1eGYA5hbgjOsk/pA0Mwbt/G9mXDGBS3n58i4lVrPBEfyoKY
         y/wmMbYuzbiO4ETHsxUkwKzKtem9NhfoTqSV25cksbSTBDWKUi3E+niiRgLGnWdMe90Z
         2j/YFFkNmizrFa3QoKB7/og3Lp30PQ6huA7B0+0OxLT8KbOQ6HPT+W3jvXyyMeFH2rx6
         spbDEitLP6A9HeugDZjb/2F4uuxXFlWTWi3h1ZPT16A6sseeZnaqIegsrUF6lKhHu0Bt
         VWH/bzvVKhzqNMbgWdHWf6ysrK2iD072fqnl7iNFxpMGaBvDrns70CbKF9yO9oQ+amsR
         47+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u/136Pn2e5zcdxkV0/au4yNKOb6M10Nw+36EnmaP59I=;
        b=0R+bW96d3P7gPbDQZAft6nJKGdXrZ02QFxtEGzPJPePGRKlV5aC/Xp69X96xDo0QkF
         VB+y9lAXEnMMyVgylcV63/GaFPJ0XXbw2TierjS7h5dwAEoA5GyFFTmubpbFR60g+/96
         BH9yq6KARHn9bTgQHZFXOtPCHcmddm5ykvZX02wa5FEHsbiYgBKjajQl4r+KgS5M1jl1
         Zwhut82rUPq0peoxo3Y/zEgpn165Ed6ZXu3boBjplhFkCNZnTa2kF5g2UK/jLtYl6/Ng
         BXp1RlI06vVLI06p6vZIQbRUspIZ8mTMk2wCM1CbrNqHEU6KogdG4ah/LGaQBbJ81Mex
         p3iQ==
X-Gm-Message-State: AJIora8WNW78abv4mbd2t8vdBO/xjb3Tq3rNYTydxO8cCV2xgLGXXG2H
        d4N7AmBdlF1gS9DcQXXPy7HOZw==
X-Google-Smtp-Source: AGRyM1tQDV8RfGdkA4ml1/A33GCuF9Ry1zz09emg9HjiGZYLIyQvQD0FPAn+K6OIpKgS85NN68KTZA==
X-Received: by 2002:a17:902:d707:b0:16b:e35e:abd4 with SMTP id w7-20020a170902d70700b0016be35eabd4mr3240728ply.111.1657280120771;
        Fri, 08 Jul 2022 04:35:20 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id i11-20020a1709026acb00b001640aad2f71sm29612722plt.180.2022.07.08.04.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:35:20 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V4 6/8] libgpiod: Derive debug traits for few definitions
Date:   Fri,  8 Jul 2022 17:04:59 +0530
Message-Id: <490e4efc900d8173fb3e2f1373c97e1a20cb9ac3.1657279685.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1657279685.git.viresh.kumar@linaro.org>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These are required for tests, which will be added by a later commit.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/src/chip.rs      | 5 +++++
 bindings/rust/src/chip_info.rs | 1 +
 bindings/rust/src/lib.rs       | 8 +++++++-
 bindings/rust/src/line_info.rs | 1 +
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/bindings/rust/src/chip.rs b/bindings/rust/src/chip.rs
index 50b5d6102f96..ecff4b003cd9 100644
--- a/bindings/rust/src/chip.rs
+++ b/bindings/rust/src/chip.rs
@@ -21,6 +21,7 @@ use super::{
 /// character device. It exposes basic information about the chip and allows
 /// callers to retrieve information about each line, watch lines for state
 /// changes and make line requests.
+#[derive(Debug)]
 pub(crate) struct ChipInternal {
     chip: *mut bindings::gpiod_chip,
 }
@@ -52,11 +53,15 @@ impl Drop for ChipInternal {
     }
 }
 
+#[derive(Debug)]
 pub struct Chip {
     ichip: Arc<ChipInternal>,
     info: ChipInfo,
 }
 
+unsafe impl Send for Chip {}
+unsafe impl Sync for Chip {}
+
 impl Chip {
     /// Find a chip by path.
     pub fn open(path: &str) -> Result<Self> {
diff --git a/bindings/rust/src/chip_info.rs b/bindings/rust/src/chip_info.rs
index 950368b54c6f..7188f91a92a6 100644
--- a/bindings/rust/src/chip_info.rs
+++ b/bindings/rust/src/chip_info.rs
@@ -11,6 +11,7 @@ use vmm_sys_util::errno::Error as IoError;
 use super::{bindings, ChipInternal, Error, Result};
 
 /// GPIO chip Information
+#[derive(Debug)]
 pub struct ChipInfo {
     info: *mut bindings::gpiod_chip_info,
 }
diff --git a/bindings/rust/src/lib.rs b/bindings/rust/src/lib.rs
index 2f2ac515d353..63b0b82281b7 100644
--- a/bindings/rust/src/lib.rs
+++ b/bindings/rust/src/lib.rs
@@ -59,6 +59,7 @@ pub enum Error {
 }
 
 /// Direction settings.
+#[derive(Debug, PartialEq)]
 pub enum Direction {
     /// Request the line(s), but don't change direction.
     AsIs,
@@ -88,6 +89,7 @@ impl Direction {
 }
 
 /// Internal bias settings.
+#[derive(Debug, PartialEq)]
 pub enum Bias {
     /// Don't change the bias setting when applying line config.
     AsIs,
@@ -125,6 +127,7 @@ impl Bias {
 }
 
 /// Drive settings.
+#[derive(Debug, PartialEq)]
 pub enum Drive {
     /// Drive setting is push-pull.
     PushPull,
@@ -154,6 +157,7 @@ impl Drive {
 }
 
 /// Edge detection settings.
+#[derive(Debug, PartialEq)]
 pub enum Edge {
     /// Line edge detection is disabled.
     None,
@@ -223,6 +227,7 @@ impl Config {
 }
 
 /// Event clock settings.
+#[derive(Debug, PartialEq)]
 pub enum EventClock {
     /// Line uses the monotonic clock for edge event timestamps.
     Monotonic,
@@ -248,6 +253,7 @@ impl EventClock {
 }
 
 /// Line status change event types.
+#[derive(Debug, PartialEq)]
 pub enum Event {
     /// Line has been requested.
     LineRequested,
@@ -268,7 +274,7 @@ impl Event {
     }
 }
 
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug, PartialEq)]
 /// Edge event types.
 pub enum LineEdgeEvent {
     /// Rising edge event.
diff --git a/bindings/rust/src/line_info.rs b/bindings/rust/src/line_info.rs
index 70b6bd6a84bb..426bd16aa616 100644
--- a/bindings/rust/src/line_info.rs
+++ b/bindings/rust/src/line_info.rs
@@ -23,6 +23,7 @@ use super::{
 /// line, which does not include the line value.  The line must be requested
 /// to access the line value.
 
+#[derive(Debug)]
 pub struct LineInfo {
     info: *mut bindings::gpiod_line_info,
     ichip: Option<Arc<ChipInternal>>,
-- 
2.31.1.272.g89b43f80a514

