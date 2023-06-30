Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7447439D7
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 12:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjF3KrR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 06:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbjF3KrO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 06:47:14 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C5A2D56
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:47:11 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-991da766865so207063866b.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688122030; x=1690714030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bp8pyyjjjRBBMHpCp5DXYxv37D46lCdheAvcicq4drM=;
        b=WK0CJUe42CzTJwsTQvh7lLhI8qY5ANAKfj953ICpftBX3+g2GIkmT+6BgRVfGPAAid
         nLGNONxSBHWBHwvUiGCORtq6uhqznYOJeo3pt+rH0lcTvbyuu879Tx9MfIzFhYa/eAGG
         nkuajHP5UhMjS/R+Wt0vbS4o2jRoQo/YBMPB8LzaWJeSlJ/y1IiDBbw/52tnt34XImJt
         HHq+jdy8ay7by/2s3EQu3k21w+PQFS3SAZCs0ZentjFqZ0nYobz4H/Hg4K7QAkEPDAI3
         6yO2zoZKT1j1t+5kw3xw9KrSLLw+ch8Vxv/nsgi+myrVcJJ3DXlpCi79DNv9F9fiI6T+
         /xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688122030; x=1690714030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp8pyyjjjRBBMHpCp5DXYxv37D46lCdheAvcicq4drM=;
        b=fNW0naLr7hUPx7Ivxzwtb6jw1qqhvJ8vpCec5OeEt0LmByilZBbfSIFnEAtKLk3EVh
         60JIthBRqm1Q1qqJ1NDzmtlUElftnNho0HE3ZqNFYJyhWfLrE1TC74yY9eGhk9h7RFVy
         TqgtYGmhHbVhgKaAQ6kh9Hj63q/Xfe7Tre6kRIN2N2ksfMXkguxRg+2v4ZOV0fkg3vL4
         ydMD95K9supA841EfnaUeYclDF1JTwXG4wWTbMi1OUY0MHOO3YtPJTfNmI/rs+YInn8n
         JMI8aVGQpX5/7qgfhZ+o88hOWletiDZyGce9fXkK9JfGRxd2ejzSKy3Z+ZhDG9Ig8wQy
         6csQ==
X-Gm-Message-State: ABy/qLalB3d1t/yKa5Ds/5a+W642VkMADf9lhjUx7+/xYqwvll0Vzk2K
        rAnbJ7cWgxTeN+wm4GPtqyKnPw==
X-Google-Smtp-Source: APBJJlHUxbPmqGslD+dBH+dhwgG3m155Z2OASTvLk1RpgdayVthjktshfadvRhHkF/0JahX0k7o+JQ==
X-Received: by 2002:a17:906:1db:b0:977:ceab:3996 with SMTP id 27-20020a17090601db00b00977ceab3996mr1756151ejj.76.1688122030249;
        Fri, 30 Jun 2023 03:47:10 -0700 (PDT)
Received: from [192.168.1.127] (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id op16-20020a170906bcf000b0099251a40184sm3436001ejb.99.2023.06.30.03.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:47:09 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 30 Jun 2023 12:46:43 +0200
Subject: [libgpiod][PATCH 1/2] bindings: rust: add README.md for libgpiod
 crate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-rust-readme-v1-1-1ce9e6f7985c@linaro.org>
References: <20230630-rust-readme-v1-0-1ce9e6f7985c@linaro.org>
In-Reply-To: <20230630-rust-readme-v1-0-1ce9e6f7985c@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688122029; l=1551;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=QRd7Xnd1T1b0YY4q9kG2ifito0lkKlV2qIrmhspIJLY=;
 b=JybKioaJfx0UWNuBdeN4dudrd470n96CKUDYdrPMpwSod2Jt5FCouo2R+4ecxDIhO1RGyMNfl
 EMKgaXOaOTHC3TsFkzbuXp4i9Wbo8EyK5UwTJnfs6X4kjUh8lzAOO6Z
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
index 0000000..4afd3d4
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
+is a C library provides an easy to use abstraction over the Linux GPIO character
+driver. This crate builds on top of `libgpiod-sys` and exports a safe interface
+to the C library.
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

