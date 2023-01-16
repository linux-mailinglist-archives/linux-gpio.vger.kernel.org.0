Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05C666B4F8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 01:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbjAPAgT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Jan 2023 19:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjAPAgR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Jan 2023 19:36:17 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8837744B4
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 16:36:15 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so10784098pjm.1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 16:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wc1cgBeO+d8IYJtLjLDU6EliwkctV+bS0eK5XGqtBM0=;
        b=Gb34nQWH5oznj9a7n6evyfngfpjA92BpJ77iCsKBWS+fbUzzM970WPk6n2b8cfTRjF
         juNuJpbreTAym+MWQEETljchvWXzCBjJa3TFHKo0Dt3V2ieNNnRDuMF5WsWxnLdYL/Dq
         KODxDlGqM7ISlr8rf1XI9ZUeqU0vvzd3GYgV/2vfOHdPQvRz7yTgIYKLRMmkp2qexBZb
         IWP6b8C8YhVdbSUgAQV7nBwf9Ay9gJiw/ShsO6gv3uLKFciR2RvWtWAO795s8ZJloqcv
         MEE9ght3A3iAlFp11H2wCQ+S3pv3A6L4kXdkzfF8k+Igfn+KBuHynuAF7HhJMTrtT0vK
         +wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wc1cgBeO+d8IYJtLjLDU6EliwkctV+bS0eK5XGqtBM0=;
        b=6v92GJCIFTfLz0O21ZQwhRNdN1Dwz2J/3V6/9rP0tVn3DFKfTAwmL0y5rgWcUeSgSw
         4f8pGdXtK7bvr8dlckXHSyPcyZl67JmGbGFQeNHRhfsiK/15Vanbv5ukekEWF/qah+wk
         3k/4xez07NMlKAh59f0ItZ4HDccuwU7BaywHiUHKVNtQRqlIDNf7BhPaiAqWg4GF4xHD
         GD8LcbXELXz0ZBJ+yqQqaZTc6gtPYgqChY/p7IMDYPaNWqg4S3pca+9oBbFY6RGKcXiM
         X8og5a2/kNvUE7sT/I48nYCoQb4E0joEvCzxoOX8V0GC/49uhGDOGqtMm0ZdtlC0DOT6
         FYGA==
X-Gm-Message-State: AFqh2koLCfAgxSAFzGPHvABXWFg0fdEJuVGDkBbGQi4TbmWGDBQ4Wi1+
        ECG6N32shTW5yiNF9Pb81P5hzLKFt4HdhA==
X-Google-Smtp-Source: AMrXdXtrGAgwfGSO6Uvfsprku5F+TV2WvxFW5yN2RzHduPfWLhvJV2nzrmjiB7700NkUTApDnCXd8w==
X-Received: by 2002:a17:903:130a:b0:194:5d26:11cc with SMTP id iy10-20020a170903130a00b001945d2611ccmr16817599plb.6.1673829374806;
        Sun, 15 Jan 2023 16:36:14 -0800 (PST)
Received: from sol.home.arpa (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902e1d200b001783f964fe3sm11281239pla.113.2023.01.15.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 16:36:14 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] bindings: rust: fix documentation of line_request set_values
Date:   Mon, 16 Jan 2023 08:36:06 +0800
Message-Id: <20230116003606.11998-1-warthog618@gmail.com>
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
 bindings/rust/libgpiod/src/line_request.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 2816cc1..35f07b3 100644
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
         if values.len() != self.num_lines() {
             return Err(Error::InvalidArguments);
-- 
2.39.0

