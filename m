Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A29872C2F6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 13:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234765AbjFLLhM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 07:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237996AbjFLLg3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 07:36:29 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77417126
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:15:03 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1b2ca09b9so48339671fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686568502; x=1689160502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnnDTLwUHWd0wGH57oxs0DArcCtdLn7SDUsoKTExzUc=;
        b=caPM4AVfLwareZhs7xz919EiNpKFQ9rRT1Rf2Y1vsIkyd2XLORY4tFSHtnQHBeSbKC
         csk/p/zxMw8ZOMWQY49jq66cLFe+1rslChopc/ukj3Bk0e/Q+WlibMLV8tPhOBDFNQhx
         30+j7wdxpIfoU+XGOgcnKUJJ7yPyFftIso3B5N28Xv2Yfu2J8PjEF5J6ip1vaok32OXU
         tpEycLQmNDPvwaepcRVTbFaUnAQEY75besCC2zS6LtSshRGmXR4DW18hpluGbbGWUaMB
         k/HjaerjWJva6OCX7RnTgu2MxIaPT4q56EExBm/9kt+jbuuZbBVi76Tmc0sAElRO0B/S
         7fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568502; x=1689160502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnnDTLwUHWd0wGH57oxs0DArcCtdLn7SDUsoKTExzUc=;
        b=hr9KrBVRdYAcacxvAZKvDMT6LlSZWoclIgma3ilKrOTU3FE7objrfS2xYWupn+tyuX
         zgfLpEYc+Tyu2Nech3JRicCZjubYLFfH96ncbtirYwqb7XRcz6V487nx5Xk2kSPFQOAS
         eupXmAbbnBrCxTa/J8VVz0Ixg2eH389+XUGTcg7Tdy47LYIo4BhTP0VHPY5jPoY34CtE
         Y6wz5BDKUYcOTn8/ifghTC4o0O4PXoWxS8RIkgXYmKBzLgdXdhFXzVNBRqg1SasE0jgi
         B8Qo1ZGOXw6ax5CfSck/uE+1iNTJmWGMVfgby0WFOZ9IYAe11YK6XYacATa+bTen6Ory
         CoyA==
X-Gm-Message-State: AC+VfDzDdvZ0uvXZS4YRgC/W4uKkZw+YSpteB/G2G8UJFAc0PsRFe7iP
        WsGD4ob8qYCEG5wq+NmvJsvD/bBB53qTrwPvoNM=
X-Google-Smtp-Source: ACHHUZ59BcEPxCywWKafyks6EqGAoRwxPFcVJxjml0FoSt4mo4Yc9V53KJ+9kiQS/KqfdEswVMTlLw==
X-Received: by 2002:a2e:87d9:0:b0:2b2:5d2:ce5f with SMTP id v25-20020a2e87d9000000b002b205d2ce5fmr2475722ljj.50.1686568501681;
        Mon, 12 Jun 2023 04:15:01 -0700 (PDT)
Received: from [192.168.1.149] (i5C74066A.versanet.de. [92.116.6.106])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709064e4c00b00965e1be3002sm3463054ejw.166.2023.06.12.04.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 04:15:01 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Mon, 12 Jun 2023 13:14:49 +0200
Subject: [PATCH libgpiod 2/3] bindings: rust: exclude Makefile.am from
 package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-crates_io_publish-v1-2-70988ee9a655@linaro.org>
References: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
In-Reply-To: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686568499; l=1088;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=mLxOjbp0vT37OOOE5gitGXzKtWG3+pg2bsDRrVqBPCA=;
 b=lgebQS7/k5lVVoK6FaDA+qtdecSlIS96NQ+7yiiGueig59/m/oSY3m3NzneYmyOb4rKTzapYP
 0bggA4z9eXBCtXICwdOcsGItiIRDGhH3DIC61a6XRY8O3/BgKr1mwTy
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

We do not use those when building from crates.io.

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod-sys/Cargo.toml | 4 ++++
 bindings/rust/libgpiod/Cargo.toml     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 8b17039..0c814ee 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -14,6 +14,10 @@ keywords = ["libgpiod", "gpio"]
 license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"
 
+exclude = [
+    "Makefile.am",
+]
+
 [dependencies]
 
 [build-dependencies]
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index b19e888..d6758be 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -14,6 +14,10 @@ keywords = ["libgpiod", "gpio"]
 license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"
 
+exclude = [
+    "Makefile.am",
+]
+
 [dependencies]
 errno = "0.2.8"
 intmap = "2.0.0"

-- 
2.40.1

