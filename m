Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A645766BE3A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 13:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjAPMym (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 07:54:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjAPMyR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 07:54:17 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B391D22A13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:51:59 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id 20so2923753plo.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 04:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DrXhaiA74X5wUVRmTa3tRAccDsq5ic6vAbcv2+acbUA=;
        b=pTA0L5z1ZWDjo57g9j63Zbon0rv9G6vJ3D08C1+XXKx4wyXjmbVIJMQ5G+MS40tMBg
         gHTcambETc640WHnDrKMcHfMYSdmvM7kThQ3N5xjY/5ZxQeMYlGDjG/uzCKykReL0L4C
         uORYyztfeCq2JyS0rwEsIrQMWG8e+hRXrHes1UKtvxNwqcffIHtqCy+avd3pJz0KGT9Y
         kMov1micIRet6yxLRzkS0a7g8kly+qErTeF7b7wl9/YtYGiHfgNXx9UW00SNo2vQfoEl
         RzbHyMdr1rl3J50LBhoA79eZfyXz5Wcn2a+TMKsYh9BFoQa8JfoDL991nFtGjftedV/G
         xj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrXhaiA74X5wUVRmTa3tRAccDsq5ic6vAbcv2+acbUA=;
        b=QFiDdhxXQCImrKH8EfYz3fn2t5D9GTynh973tkW4K56hTkc7OxY1DFvQNJSoAXvaG4
         /1NpDRMG9SAml12mxNvofFUT2WywmOD1iMHwqODrU9nExtk9rN6MTc4Dd2efcea0Zbbd
         /jHMh/NvXbFMPLNEQURBXTt9GzhiacKZfQat7jbAInj4pBfD5Jm87zrROawnpvMu0Rw2
         pQTD7w2fylYYUR3AymaH7SmxwdYuBfDVxuh7wMm6QNZxdqBCA4iWzkLPd6kbQ2l2WZKL
         pdP6+Ly5nLYJjjybz9597mLm1GYmpHWjibQ6AIn55ScFWRKuCt6K+f/zPXL6jqeAhhSU
         wwDw==
X-Gm-Message-State: AFqh2kqOy9IIKVqaxUCEBvbhMcqrWJpi88ZoPkd4ig8TGZ0MAndXcjOc
        lPvn5c15yVDuQJEIW9V4DLtWZWIyBLbhxg==
X-Google-Smtp-Source: AMrXdXspNPE2x2/mHX9O2knzZmANuzg4pw/WPz64fLahoE01bZ0C67PnB3D3DwQ7gus4ErTKnqb1kw==
X-Received: by 2002:a17:90b:190:b0:228:c8aa:b111 with SMTP id t16-20020a17090b019000b00228c8aab111mr26375355pjs.25.1673873511550;
        Mon, 16 Jan 2023 04:51:51 -0800 (PST)
Received: from sol.home.arpa (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id t10-20020a17090a3e4a00b00217090ece49sm16683644pjm.31.2023.01.16.04.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 04:51:51 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2] bindings: rust: fix documentation of line_request set_values
Date:   Mon, 16 Jan 2023 20:51:44 +0800
Message-Id: <20230116125144.36858-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace "Get" with "Set".

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
Changes v1 -> v2:
 - rebase on current master

 bindings/rust/libgpiod/src/line_request.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index c16ec9f..d9e041c 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -106,7 +106,7 @@ impl Request {
         }
     }
 
-    /// Get values of a subset of lines associated with the request.
+    /// Set values of a subset of lines associated with the request.
     pub fn set_values_subset(&self, map: ValueMap) -> Result<()> {
         let mut offsets = Vec::new();
         let mut values = Vec::new();
@@ -136,7 +136,7 @@ impl Request {
         }
     }
 
-    /// Get values of all lines associated with the request.
+    /// Set values of all lines associated with the request.
     pub fn set_values(&self, values: &[Value]) -> Result<()> {
         if values.len() != self.num_lines() as usize {
             return Err(Error::InvalidArguments);
-- 
2.39.0

