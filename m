Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59C73743AAB
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbjF3LTK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjF3LTJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:19:09 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EE130F7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:19:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb7acaa7a5so2779461e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688123941; x=1690715941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqIBmblL51gCVie+Rr+d8JxwRSKAKeJ3aC+qfC/UEYI=;
        b=uPg0RrB8IDMlAJO4XFF1fXa97yt1f7K/ZPcsPcq9rZxhK2Ko7WRsT337U8gEDw0uHY
         /o8xRgPfzdDJsEZevKhADNHEEv9yZhvTTUqlA+1FEq6T7o47+xItNm9k47u5TziX2Yzi
         LT0TS97DE1VGVjLmQCi1eHG1oCsTb6ePyL8hkBRkTJa4N3JhBEC7q+1iJzYhBg450ggt
         bvn0sBgF8J4ZkY0Pw+G49BeZ4XzhiTJqKlnwJzdJEmAHvY2sGfjADG+jPg9GpNUStLwR
         X3y0otQf1v/NdXZZBDkyWnI7Ah4IIEeDpAF3RfxLUEbjE/y/sR/MhjhrfQqejxgLOOVw
         l/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688123941; x=1690715941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqIBmblL51gCVie+Rr+d8JxwRSKAKeJ3aC+qfC/UEYI=;
        b=V659BEeRA4eM/l2os6DW3K7BMOpI7B+8NQZkJQpr6IWTkB4NXQG7WPBdOQP64sIz4i
         IVOFfxXE7J+/2IAlaJ5odHBVg2BAFQ5afwsi42CpLLRqoNAgLQwRS94UfBA/RDculDkx
         vcm2X4BECnkDi/uzOInRmUAb1PYUFUDJXq92q3yMKtfRk1Pd+tBuBx1jwdZBmonkAJlE
         +5VxwcNqvZISisnRX7DdHEAlnlt9hzKSvUtO2cT9ySQfU5I7TRPSpM/DeuaJhfyPupnR
         qCEmPaVv1TPgqbBY+DFBlrg+XmcI8qiFqKTPcVkfNv5Jd1mcD8bQVyZCX1MHO4kyvFIs
         v0sQ==
X-Gm-Message-State: ABy/qLYxwyC6BNPwJhE2Wcga+jEq7mOl7I4gYuW8fFcAkhwapjmsBI2R
        X4YUolDhpyB115g5/JUR9zamIw==
X-Google-Smtp-Source: APBJJlE+p/JUmzx+Q+8BRt5AQvkEpkL+WzSNnKR8Nkq/MNdJlw0/3mZEYnlJUKb+uUrHARqYT4aL8A==
X-Received: by 2002:a19:6905:0:b0:4fb:845d:9e8f with SMTP id e5-20020a196905000000b004fb845d9e8fmr1800779lfc.53.1688123940770;
        Fri, 30 Jun 2023 04:19:00 -0700 (PDT)
Received: from [192.168.1.127] (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003fbb618f7adsm4621917wml.15.2023.06.30.04.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:19:00 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 30 Jun 2023 13:18:46 +0200
Subject: [libgpiod][PATCH v2 3/4] bindings: rust: clippy: drop unneeded
 conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-clippy-v2-3-f44447925ad6@linaro.org>
References: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
In-Reply-To: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688123937; l=1702;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=DeLt66AswuBhVJmoupyKkCl9zpHWd5d4lBEoM4vT8nc=;
 b=TfCM7p62UiSwF/fVgO8L1Fd444/w/BoOta49VHKq5sdYlsm63kpaS+AuxELofVAOtv4NrRpdH
 zoVuPI4LpbUAYurbyte5b7t+m6XMyCVnizGoN8lLl/wQIohXK3cP/Zt
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes clippy warnings on these lines.

Applied the suggested fix using:

    cargo clippy --fix

clippy version: clippy 0.1.70 (90c5418 2023-05-31).

Reported-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/gpiosim-sys/src/sim.rs       | 2 +-
 bindings/rust/libgpiod/src/event_buffer.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpiosim-sys/src/sim.rs
index 16c2b3e..71b9453 100644
--- a/bindings/rust/gpiosim-sys/src/sim.rs
+++ b/bindings/rust/gpiosim-sys/src/sim.rs
@@ -186,7 +186,7 @@ impl SimBank {
 
     fn set_num_lines(&self, num: usize) -> Result<()> {
         // SAFETY: `gpiosim_bank` is guaranteed to be valid here.
-        let ret = unsafe { gpiosim_bank_set_num_lines(self.bank, num.try_into().unwrap()) };
+        let ret = unsafe { gpiosim_bank_set_num_lines(self.bank, num) };
         if ret == -1 {
             Err(Error::OperationFailed(
                 OperationType::SimBankSetNumLines,
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 520eb2a..b79e9ea 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -108,7 +108,7 @@ impl Buffer {
             gpiod::gpiod_line_request_read_edge_events(
                 request.request,
                 self.buffer,
-                self.events.len().try_into().unwrap(),
+                self.events.len(),
             )
         };
 

-- 
2.41.0

