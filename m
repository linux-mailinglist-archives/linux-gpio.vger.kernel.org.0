Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3127424C7
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 13:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbjF2LKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 07:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbjF2LJk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 07:09:40 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968133593
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:14 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fa7512e599so5544105e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688036953; x=1690628953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8RHvmB7ld/wK77znijVaEXaus1IN747vmI4vnxSxYM=;
        b=CwskU3imi73Lan4d2vPIOrLgrAfztapxw4zTw0OHdv9j+JblCMxn+N3N/IIS9fu7S5
         5kcPoOM/XB2GjerLArqJF0OHTC0lsx+vNOSBgu80TtasfKSs4U/I/IeMXgEi7vokSPRe
         nS+spUpIjYwpnwJGXSdqK4EX0ZHqBRg4THQTrn6VQSVufGqtYm9Q/0qv85nINj8aUZ/P
         sV2fax2Tue69syIoPwIXFbQLY2Ibw3tiVetliRr2FYerK4BOs+4IgPDsghoby14NU1BB
         1fJA5F3uGWNPJk5tCdlvjTXBuCNAX7Lv012g1to7gzEdVtWCN5U/fbPnp6HRKFrOT0WX
         Pjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036953; x=1690628953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8RHvmB7ld/wK77znijVaEXaus1IN747vmI4vnxSxYM=;
        b=Z/r4+oJaeX6lVm2aF7xcg3JBwJtGBtAOLSQZwqSNNs6pOgbAGvzirb2AKzH+aZaZ4T
         4Z//HERmodJ/mjGLdRhHY8QvOpTAKrPPxE0Dd4cPd6AXX0SAsmXbX20gO5eUdKESYXef
         mgJ9FZBof+RTR9azvw5R4y2xdrt1CrF7u/JIXUOby516s5ZYZw/H5xs41fNnHSafzATl
         uCQlIuWWuq44U4JarURRHCJ/pApEV18EL2SFJXPwyBDRzB6qUD/4fkLtSUymiAeyMoP2
         FDorsC9iJ5cV6Al4Q9DgU9aTAuqJaqyCw+AHQZF8VoX26uEMBUpXxE6yoWw4mQJa/is9
         l0Mg==
X-Gm-Message-State: AC+VfDyiC08olgG9BTPRQUQXc/qfWjCtYlUDGtr5jmp4Z9JIASJ7vUGk
        a7HiIaiQ+e6DQluVJy/09eULMswZDjnbMeEuEXE=
X-Google-Smtp-Source: ACHHUZ6NigSoMPK3SMVu2kD03BMATxyNjXqqN9h28kUKxz8GCb0RnS8VI/cv2RnNBvAcnb9ByfF9HA==
X-Received: by 2002:a7b:cb8f:0:b0:3fa:973e:2995 with SMTP id m15-20020a7bcb8f000000b003fa973e2995mr8724842wmi.12.1688036953007;
        Thu, 29 Jun 2023 04:09:13 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438BA.versanet.de. [92.116.56.186])
        by smtp.gmail.com with ESMTPSA id cw13-20020a056000090d00b003112f836d4esm15571197wrb.85.2023.06.29.04.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 04:09:12 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Thu, 29 Jun 2023 13:09:00 +0200
Subject: [PATCH libgpiod 2/4] bindings: rust: clippy: silence
 false-positives on casts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230629-clippy-v1-2-9ff088713c54@linaro.org>
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
In-Reply-To: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688036951; l=1902;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=+Y9l9n+fPMuYUZfj7h/wwtWgGxBDe0fk5hZvkvpJF5o=;
 b=aRox3aiy2GpgYkS/A4NZyZgiCQ/NJz34yhSyF1W88xMJ6xIv7mBMXDlQiseVgBR7nA4E1oUfR
 MZpfHSL66VWCs2xw3I3gzsfDfH9SWkxbWTsB3lZISChTP9JP/uVulXT
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tested build on x86_64, armv7hf, aarch64.

Reported-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/line_info.rs     | 3 +++
 bindings/rust/libgpiod/src/line_settings.rs | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index 702f1b4..c4f488c 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -142,6 +142,9 @@ impl Info {
 
     /// Get the debounce period of the line.
     pub fn debounce_period(&self) -> Duration {
+        // c_ulong may be 32bit OR 64bit, clippy reports a false-positive here:
+        // https://github.com/rust-lang/rust-clippy/issues/10555
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
         Duration::from_micros(unsafe {
             gpiod::gpiod_line_info_get_debounce_period_us(self.info) as u64
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index 79ee2f5..f0b3e9c 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -218,6 +218,9 @@ impl Settings {
 
     /// Get the debounce period.
     pub fn debounce_period(&self) -> Result<Duration> {
+        // c_ulong may be 32bit OR 64bit, clippy reports a false-positive here:
+        // https://github.com/rust-lang/rust-clippy/issues/10555
+        #[allow(clippy::unnecessary_cast)]
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         Ok(Duration::from_micros(unsafe {
             gpiod::gpiod_line_settings_get_debounce_period_us(self.settings) as u64

-- 
2.40.1

