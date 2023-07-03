Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF707455DB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jul 2023 09:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjGCHUU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 03:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjGCHUS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 03:20:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3AAD1
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jul 2023 00:20:16 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b698371937so65073871fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2023 00:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688368815; x=1690960815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GscKwqtm1Vlz4XMIYRM2fkIJmpvlXOf0rC99HOzQQ5o=;
        b=UankCob0Mg2qxnh4aTIf/K8cuJLDrHHo08ABvN49qAirAg3BSCyIjx3Gx2Gra31rMP
         bLes6CJSG1IUpa1WXUmnMznW9OFoSUYeBmN12t14ecDN9suEtIZEj1q5d0+eaHfP3AJh
         ubuF24oUpQAIHZJ/dHSWvzm6/fn4FX45T2xZGZW8U4VSKvmgVAeHq8QAvC9NQRyWS7pK
         IewFPXtfnQScqX5IIi8oDvIn+VTs4CcW5n8DautIM5J7ut4RiSTKJKXMhfy0YBR+f+Qx
         Z24p+cDuVwUOx+hkf/zQXLJBvqXSiAr3FtWDpW76p9AgPoBlG2xQ7+xDJqI86t0hJvJN
         9mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688368815; x=1690960815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GscKwqtm1Vlz4XMIYRM2fkIJmpvlXOf0rC99HOzQQ5o=;
        b=GpX1uMm2ns/NtfwDQDZ2e6ylAh2NIxha70BfxhY1397eKF97z+DztRVrb4rOzblv8b
         /hLotpBL59ojpmPadi2nj1CH4gLzd/+lY/+rHQ5L92HYAMXQhmAiccAPWLwy9khjRjqD
         KdrKcxjTBXT9JZcK7p5WncIg++cjgfewO5G2guu0ML+o/ZppC3XKAigCRmh6sTedydbd
         XZPmmDr/Qw8sQDzTCQJT/ltkY42Fx32qdRWg7UCAhHBRZFqCWVt/CSNAKTe+WGxGBbSG
         7tGRmtHUe1hSQQ6TmXCZxry7l25DH15e2Ax3kHSMpwbhzoChHHltnqCefGGX0O3aqdkS
         IDRA==
X-Gm-Message-State: ABy/qLb8PtOa8dhwDFQLyOr9cL3CcTPLaxuBnSLOXQTZBTTG6a1XmRwL
        1W1MgsIvvS+uUQaoMKjlcjV0wQ==
X-Google-Smtp-Source: APBJJlHVGpWQj0ehYzyE3Z4xl++ysG8QIdFAI855CHyY0H07FH/A/WjV7t139Uzi7xSWs/uzU7rHeg==
X-Received: by 2002:a2e:b1c4:0:b0:2b6:dd9a:e1d3 with SMTP id e4-20020a2eb1c4000000b002b6dd9ae1d3mr2856225lja.44.1688368815000;
        Mon, 03 Jul 2023 00:20:15 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438F8.versanet.de. [92.116.56.248])
        by smtp.gmail.com with ESMTPSA id s13-20020aa7c54d000000b0051e1660a34esm391449edr.51.2023.07.03.00.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 00:20:14 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Mon, 03 Jul 2023 09:19:59 +0200
Subject: [libgpiod][PATCH v2 1/2] bindings: rust: add README.md for
 libgpiod crate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-rust-readme-v2-1-ba7d7f04bed6@linaro.org>
References: <20230703-rust-readme-v2-0-ba7d7f04bed6@linaro.org>
In-Reply-To: <20230703-rust-readme-v2-0-ba7d7f04bed6@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688368813; l=1556;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=x6CQkS6c/01TZRpp2zsmkNyDONuqI1Gc4dPx1y15AkY=;
 b=pJtluXuOqvWuiuUOwq2df8qW8/oYMUScGR+KHYEhrAvE/vG82IahlzNS8rq89s3o4KFeaaPAd
 HpnRFO/9GDADO7DnEHV9UryNeAYbVZ3U1BlTY4XrZJzK3hkChsm0pT6
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

crates.io treats the README as landing page for a crate [1]. Since
we have none, it currently displays a blank page. Lets add at least a
little bit of info here so people can figure out what they are dealing
with.

[1] https://crates.io/crates/libgpiod

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/README.md | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/bindings/rust/libgpiod/README.md b/bindings/rust/libgpiod/README.md
new file mode 100644
index 0000000..8d514e7
--- /dev/null
+++ b/bindings/rust/libgpiod/README.md
@@ -0,0 +1,25 @@
+<!--
+SPDX-License-Identifier: CC0-1.0
+SPDX-FileCopyrightText: 2023 Linaro Ltd.
+SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linaro.org>
+-->
+
+# Safe wrapper around Rust FFI bindings for libgpiod
+
+[libgpiod](https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/README)
+is a C library that provides an easy to use abstraction over the Linux GPIO
+character driver. This crate builds on top of `libgpiod-sys` and exports a safe
+interface to the C library.
+
+## Build requirements
+
+By default, `libgpiod-sys` builds against the libgpiod version identified via
+`pkg-config`. See the `README.md` of `libgpiod-sys` for options to override
+that.
+
+## License
+
+This project is licensed under either of
+
+- [Apache License](http://www.apache.org/licenses/LICENSE-2.0), Version 2.0
+- [BSD-3-Clause License](https://opensource.org/licenses/BSD-3-Clause)

-- 
2.41.0

