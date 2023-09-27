Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4877AFFDE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjI0JZg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjI0JZe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:25:34 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C9DC0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:25:33 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50308217223so16893119e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695806731; x=1696411531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOa0OVpmZLHbMVx4pyKJ35hFw24eZFxEY5E8RERmDF0=;
        b=xCIQtqJ/Qtv3W0GnCYgo8u6pCbhYzxvWIpBxKaMdWaKtMs3XF196bnykeJz1EXd9GR
         W7JyDZiWPc4v+0nUffRYvyaIQBA7nZXk6F5Lmn8t/xcYlVQ1kfyJAaxNUz7gK0UHvqko
         Upirn98jewqKQQ61jAEcfs4GdzoujhanaU4aX1GPsGTGfMR0MZ1n2TEjwWuSzHSJUdsh
         F8cSf+uN1PKOR65YRzCy9t5yM12xoNMAIt3navz8a7MTEtRF6VZCZcUL8D6CN/bvgAbh
         Wgqbu4q25hy2SPyNHtXRZY+LUskqASt/T0Iew8GEaRswwRvFWv6KyCPKSwPTvF5KNanP
         8BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695806731; x=1696411531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOa0OVpmZLHbMVx4pyKJ35hFw24eZFxEY5E8RERmDF0=;
        b=aZVHe/CPgMbYTkCeQaocHxCD0SxgiVFHZgvjgyD9MkfhYWr2RXFMeGPjH2kQiLN9K0
         fA0vARq1gKMAeGy08W9Iv9NtydDguMb765IqabN5MsRmBMQCiD+tr4d3ie9URyRVasmZ
         hrKUQbXSTfj/Jb0FpJPd2SZZWL/Wp6l9Hy4Q73mA7knNH//c3eV5+T5p4NWyWhBZ36N0
         OjQuqgc3KNpDX6gb2tYYoYsRlmIWPqs/mludfW4ppTR+Uv2OQGnTo3rBn7lS3tXzP7ru
         UR2OW7w13Wg4MZnTzCMEOdRcviAnLfRATU+irciA0B1rAwyJr79FZtzpIIxQZ/96jl+i
         Dohw==
X-Gm-Message-State: AOJu0Yy1+qVphcMhYW+EHswTdOcHN93ywlLXmr9HCcQWqMFaVCLBDot6
        8a4CfXOROYww0ub77772vCAtwA==
X-Google-Smtp-Source: AGHT+IFehugoyRmTh9eXw0mMvHC2aW/KJxTu6kN+q6kCKwzhDxBI5Svhl1ZkXle3Lv1iAx6Jpsshhw==
X-Received: by 2002:a05:6512:3e14:b0:500:b8a3:1bf1 with SMTP id i20-20020a0565123e1400b00500b8a31bf1mr1500894lfv.43.1695806731345;
        Wed, 27 Sep 2023 02:25:31 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438B3.versanet.de. [92.116.56.179])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0ac900b0040646cf9fa7sm667861wmr.42.2023.09.27.02.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:25:31 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Wed, 27 Sep 2023 11:25:23 +0200
Subject: [libgpiod][PATCH 1/2] bindings: rust: construct chip infos by
 reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-chip-drop-arc-v1-1-28013bf95948@linaro.org>
References: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
In-Reply-To: <20230927-chip-drop-arc-v1-0-28013bf95948@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695806730; l=1345;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=BOoUGMj1ZUKSLqJMzr0ikpC/UYwE2u7KEOzKDK4TWm0=;
 b=JA5FnITVfTV6o/IBomf7F04Sxdb4kcUfQMkGrJmGoZivOfxhAmuXKz/rsIz0jhjv6ITLUHp6E
 gBgNTC9a4dxDkzLb+H3aVe6AALmudifOFTz+fH+C5Mo5gbbjTgFnQPx
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

No need to clone the Arc for this. A simple reference is enough to get
to the underlying chip pointer.

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/chip.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index 81e1be6..4545ddb 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -79,7 +79,7 @@ impl Chip {
 
     /// Get the chip name as represented in the kernel.
     pub fn info(&self) -> Result<Info> {
-        Info::new(self.ichip.clone())
+        Info::new(self)
     }
 
     /// Get the path used to find the chip.
@@ -239,9 +239,9 @@ pub struct Info {
 
 impl Info {
     /// Find a GPIO chip by path.
-    fn new(chip: Arc<Internal>) -> Result<Self> {
-        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
-        let info = unsafe { gpiod::gpiod_chip_get_info(chip.chip) };
+    fn new(chip: &Chip) -> Result<Self> {
+        // SAFETY: `chip.ichip.chip` is guaranteed to be valid here.
+        let info = unsafe { gpiod::gpiod_chip_get_info(chip.ichip.chip) };
         if info.is_null() {
             return Err(Error::OperationFailed(
                 OperationType::ChipGetInfo,

-- 
2.41.0

