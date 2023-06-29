Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7356C7424C5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 13:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjF2LKD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 07:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232212AbjF2LJk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 07:09:40 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181873596
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:15 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-313e34ab99fso564614f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688036953; x=1690628953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6JGgBC9El8dhrOzeQnHhabqG5Il9YZSVayP4JvpXkw=;
        b=OJgUwH+2xp+VXzhcJEj5I/eiaQBEEfKcBlBKsyYh8HK5ssT1nLBS72C8V7zV9THon0
         ZgJqXC6ZWOq3bkFPuMpN+/r9yIjBuol02+RiIS+pyn5GZK//icIZj+ypjC1LwqdD8m9C
         hKObhTLlTNVml4gTQXoH9ADKqfHB6dPCsHfBzw+VZtNhl0xyhFRI0kusfFXQetXUO7N9
         QIAIUqEeelbA0atHMbpVaT1hG16nVqhDnEO2b0/UyK7zHkkv33H9mI70iYPsKW5hFfYx
         CIpCSsRVj18SzLc5lDQgGtner6OoK9nSGbREbT4pV3pNZyr2nQjCsEI1UNyfJ55KvXXq
         fOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036953; x=1690628953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6JGgBC9El8dhrOzeQnHhabqG5Il9YZSVayP4JvpXkw=;
        b=UG1WDs5kVuDqdFg+leACO33fEaGmgZN2tjtnlDuyXnDrbzwz7DjQK3lGl/GCaJEpPe
         d/Gd9McpcSeaaes7GBwlT0xfkoL6Y0xvOjP3dVDdwff1eFAId77+HSz5xHMgxzfaZp1t
         t5OTX6hpBniGgod85QOkc9T13JqZ408JxbGpoznlvRc/+o9bKzCCKqmZ60pvHbrqZ+CV
         LYSZFYeAU8WX1mTiqe3ZttTGCOO2O47EHp69JoMLm7mQhJKTnd6Vw+Zya/5528AO9tyd
         20W+rdUuTweCg3jgRwI8XFJyqOw5pRL2iUlCXoCQOoWBSEeB/pa8Q1D9/2bclzgNMYyk
         Qf4g==
X-Gm-Message-State: AC+VfDzCbTyWSg1bCmz11oaEEafPKjLdutNgckpXQt5c/OaWDRsq14KD
        +OPOG1D+8RgfuTAB3cclUfH/zBAZcjvCB8gzL3Q=
X-Google-Smtp-Source: ACHHUZ4yQ/obiONl+vByhuTMQrpK7DuJHTRRFnharBjPJxX/BFzsgs1sgZ0XYq8EYCJbMgXteNondg==
X-Received: by 2002:a5d:6a85:0:b0:314:c93:79fd with SMTP id s5-20020a5d6a85000000b003140c9379fdmr3862417wru.29.1688036953640;
        Thu, 29 Jun 2023 04:09:13 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438BA.versanet.de. [92.116.56.186])
        by smtp.gmail.com with ESMTPSA id cw13-20020a056000090d00b003112f836d4esm15571197wrb.85.2023.06.29.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 04:09:13 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Thu, 29 Jun 2023 13:09:01 +0200
Subject: [PATCH libgpiod 3/4] bindings: rust: clippy: drop unneeded
 conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230629-clippy-v1-3-9ff088713c54@linaro.org>
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
In-Reply-To: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688036951; l=1654;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=X5OP4eeAxxS0VNQ54POfDetV3O/sUCRZBKm25Yei+XE=;
 b=Ap6UYiprvyxDnyoODrRqZoz+eI7HK6zcBqqaAAnMNFakSIOUOAJ888SgerUE0G3ERw8NyO7+a
 Ki9325kPj6XA11islxVZrZUTUaSN1B3F9wx2VmL4Y+KD2c18R8srgFV
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

Ran cargo clippy --fix on clippy 0.1.70 (90c5418 2023-05-31).

Tested build on x86_64, armv7hf, aarch64.

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
2.40.1

