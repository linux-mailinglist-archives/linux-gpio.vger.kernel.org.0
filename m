Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF1E70DB6C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 13:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjEWL0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 07:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233200AbjEWL00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 07:26:26 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C38611A
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 04:26:22 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so1140530a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 04:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684841181; x=1687433181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSRh5YpJNZyKU79HfIsiaXhN0Nt28k1YrpgmzdCgZJM=;
        b=VgwXg+DxUPKzVaorm7wwxR5WwXectIFPoJ32mhgfBaMkpB93PI6uJKR9tmEEPoSGzF
         QGmpQ68mzRm7Yc9R2IsKsIjnHsY2cNKuQAQEB3DlAu0dtiNDZ0rCWm6siURs1G/J3jQ6
         AN6xtZBBKovuOQfvn2bPnoWY9mprOm63riEIpsN5ZnERCJPjr0oMIfpV4oLEm0iVOuh7
         /0yTYtBEkNN0RlcJexEJmsBfewSwGsMvrub6fYwGIsZsboLeYksvdQlfAPWxABkIIu1E
         m3qX17be1g5BSIlXHa/CAfRn/hZPqu9uVnWuVNRhaxZPsajvzVTEkqvkdcti3G880r6+
         BGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684841181; x=1687433181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSRh5YpJNZyKU79HfIsiaXhN0Nt28k1YrpgmzdCgZJM=;
        b=jS/gq4a5xHQHFiykJgnJvnawA+UGZKwToi7gLttMcwrUha+Y/6MnQs9hWX4LTRBNMP
         jLtlxDdrZsJU6EsZ85KFZ5IeoBMJproct46SZ+K6crbKpiXhSPZ7zpPxFhdm7EVbwGMi
         YyamgkfdNgK/X6q2O7P1Uxn4VQB3vsyl7mt4Y9GpoqlFgu7iT71Wcsz7ST8EibMPGMLq
         BGVyR2sYegxEeq3XE1ffMguvfLskkH6c0s0EGUrov8jeaa0e/muGXfbuc7RPaoXBhLYG
         Qy9btROHkhVk8YciqZNRvtuoAVJHRrAddc5E/j+wQ7ZP3RhA46GfVcRotYRx62PtlxRP
         NfNw==
X-Gm-Message-State: AC+VfDxMWc4Bd5sLbNOb1xFSjdSMLGL4GRIbmjWmP6+m2wHqo+Wxo3AV
        FAHjcNyWreHMIzdEkcUey1Qynw==
X-Google-Smtp-Source: ACHHUZ4wWgAxDpeqw8HC7wzzEE0golCb12CYPjdGues95vI6v2PASq06b6IvUIxdiGVaxduWlOqkBQ==
X-Received: by 2002:a17:907:70a:b0:966:2123:e0c3 with SMTP id xb10-20020a170907070a00b009662123e0c3mr13159458ejb.15.1684841181041;
        Tue, 23 May 2023 04:26:21 -0700 (PDT)
Received: from [192.168.1.149] (i5C7409D3.versanet.de. [92.116.9.211])
        by smtp.gmail.com with ESMTPSA id gv3-20020a1709072bc300b0094f3b18044bsm4342911ejc.218.2023.05.23.04.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 04:26:20 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Tue, 23 May 2023 13:25:46 +0200
Subject: [PATCH libgpiod RFC 1/3] bindings: rust: drop legacy extern crate
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230522-crates-io-v1-1-42eeee775eb6@linaro.org>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
In-Reply-To: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684841179; l=743;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=PcWsfB5fQWns8QdVUTDMIWalHo+rM28xkDqyRS9wXmQ=;
 b=ogoCZFzLziKez78FWpeIVrQhZABukbHgHCCOeH5+v0faZXMitBpRhuA067tyBWPNAuNGB+rBq
 Pufsb2oWjAkCb3MSBk/3IpfdlnA4R+yaWySdK6qDe36HDnTURqxzmsZ
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

This is a relict from old Rust standards and no longer requires [1].

[1] https://doc.rust-lang.org/edition-guide/rust-2018/path-changes.html#no-more-extern-crate

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod-sys/build.rs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index e3ed04a..b1333f1 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -2,8 +2,6 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-extern crate bindgen;
-
 use std::env;
 use std::path::PathBuf;
 

-- 
2.40.0

