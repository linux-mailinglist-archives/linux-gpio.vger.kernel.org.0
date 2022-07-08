Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A12056B8A2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 13:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237487AbiGHLfP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 07:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237365AbiGHLfO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 07:35:14 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C484188F26
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 04:35:13 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y9so9086959pff.12
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rk3DhN0hlB//7nCiRduAgUt6fPdLaH7zTfFGKPx/lAc=;
        b=CDwOpxbTZbtataTIs2ct2+DJnlwq4U+Wk6c7M40dFMEMmZhToKIsIMTcaA5TwEVDSi
         qKyZTnBnKwZEtEVL2k3yBzoFucN9esXK2PYo4xFMbcGKssdLq3KoxX9GkEiVoEi5fAQb
         VO8H4bvvfOe5NLLH3tCsqtfrwzV7G9nUmXiL1JOsIbAuPKaFFoRnfns70Luo3+UFXQsx
         BKwJIwC+OF/D8eNlumAtvuM84okNgKngDFUJOgy171fLCUnXfJi3BJUUjFBjWVQP07oc
         5lYK1G7u0iOane4jyDQTmYOTI3CgNrdRaf8HwtS/PXGq2cY5KowDyvB6vWPgn+oD48u/
         e2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rk3DhN0hlB//7nCiRduAgUt6fPdLaH7zTfFGKPx/lAc=;
        b=yJxxg8rPpIPUXiAeck3jrnZy0ku/gZtNtalZWDnVt4VU93otCSDqASwlkNzMOgqgFa
         xj7NNeqlSPSFhnVlUCzNNGlF1DFHBShSIpQOpHKys+Wg1PW0l2loSaS7QBsSD8ylMLbM
         mlIrzpBplBu+CULt7qJViMbVSedO0ZfI/EYqXiKOGUJu0C9QDLL4N4t9oa3rYWyfwlZf
         MHAQ/e0Ua6DO/TB4ke6bP0DBmCx41PspW3L83JLlWom7lQSQOMyGYC7YoZh5AtnYfTc7
         LOXMeUflwWSzGeqH1FPq+T7ZJByFxECHo6oNm0/ZcDzELHHgARqFKguYq2wiKzr98b29
         yX4A==
X-Gm-Message-State: AJIora8w6uCHHazyCY0599nKRO/kyNmy4PzBS9aW1p3gAsSxDsw15bvP
        4fyPyXMNaWh8dkwmUIKG3NDQAw==
X-Google-Smtp-Source: AGRyM1uUhPeejzuWkvgt5zuMz5BkOXH2LwTQtPiRxavo0G+/EzfNruyhET4KcdKLq2eHb++cQyJ6xQ==
X-Received: by 2002:a63:e446:0:b0:412:937b:5a3c with SMTP id i6-20020a63e446000000b00412937b5a3cmr2952728pgk.316.1657280113285;
        Fri, 08 Jul 2022 04:35:13 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id f80-20020a623853000000b0052ab37ef3absm865557pfa.116.2022.07.08.04.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:35:13 -0700 (PDT)
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
Subject: [PATCH V4 3/8] libgpiod-sys: Add support to generate gpiosim bindings
Date:   Fri,  8 Jul 2022 17:04:56 +0530
Message-Id: <9cc6890c1039f75eadb77a1c9c16bf947ec9eb9e.1657279685.git.viresh.kumar@linaro.org>
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

Add support to generate gpiosim bindings.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/libgpiod-sys/Cargo.toml        |  1 +
 bindings/rust/libgpiod-sys/build.rs          | 19 +++++++++++++++++--
 bindings/rust/libgpiod-sys/gpiosim_wrapper.h |  1 +
 3 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 bindings/rust/libgpiod-sys/gpiosim_wrapper.h

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 77f82719d269..73b6761d16dd 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -9,6 +9,7 @@ edition = "2018"
 
 [features]
 generate = [ "bindgen" ]
+gpiosim = [ "generate", "bindgen" ]
 
 [build-dependencies]
 bindgen = { version = "0.59.1", optional = true }
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index bbcd30f79d23..147daaf6b1da 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -14,13 +14,25 @@ fn generate_bindings(files: &Vec<&str>) {
         println!("cargo:rerun-if-changed={}", file);
     }
 
+    if cfg!(feature = "gpiosim") {
+        println!("cargo:rerun-if-changed=gpiosim_wrapper.h");
+    }
+
     // The bindgen::Builder is the main entry point
     // to bindgen, and lets you build up options for
     // the resulting bindings.
-    let bindings = bindgen::Builder::default()
+    let mut builder = bindgen::Builder::default()
         // The input header we would like to generate
         // bindings for.
-        .header("wrapper.h")
+        .header("wrapper.h");
+
+    if cfg!(feature = "gpiosim") {
+        builder = builder.header("gpiosim_wrapper.h");
+        println!("cargo:rustc-link-lib=kmod");
+        println!("cargo:rustc-link-lib=mount");
+    }
+
+    let bindings = builder
         // Tell cargo to invalidate the built crate whenever any of the
         // included header files changed.
         .parse_callbacks(Box::new(bindgen::CargoCallbacks))
@@ -46,6 +58,7 @@ fn build_gpiod(files: Vec<&str>) {
         .define("_GNU_SOURCE", None)
         .define("GPIOD_VERSION_STR", "\"libgpio-sys\"")
         .include("../../../include")
+        .include("/usr/include/libmount")
         .compile("gpiod");
 }
 
@@ -61,6 +74,8 @@ fn main() {
         "../../../lib/line-request.c",
         "../../../lib/misc.c",
         "../../../lib/request-config.c",
+        #[cfg(feature = "gpiosim")]
+        "../../../tests/gpiosim/gpiosim.c",
     ];
 
     #[cfg(feature = "generate")]
diff --git a/bindings/rust/libgpiod-sys/gpiosim_wrapper.h b/bindings/rust/libgpiod-sys/gpiosim_wrapper.h
new file mode 100644
index 000000000000..47dc12a87917
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/gpiosim_wrapper.h
@@ -0,0 +1 @@
+#include "../../../tests/gpiosim/gpiosim.h"
-- 
2.31.1.272.g89b43f80a514

