Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83A30712970
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 17:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237482AbjEZP2K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 11:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjEZP2J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 11:28:09 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF7619A
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 08:27:43 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96fbc74fbf1so149836266b.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685114861; x=1687706861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DS41ornEV9lQz2B3fbj5X3z+qOEzLQfQfVbRT/jAKE=;
        b=qIr+B1rSVROG/DsMIyolNS3ItR2gGhB+wIthxtaXln+YiWia5EG6npsjDTip+7mzYL
         JXTEGqSpiKOl8UmeOqMY2EwbW+V6n7GYSCC6NARNKJ/+HDvy4F54T6ibO4kByoEb2dLq
         //RO1oqVf06rQTB1/ztzts+hayXfGngQht3t07ct4YTi7Wb8xEgaA+/UyK7ZM+eXEvtH
         JXr5uEJmRsJLvVZuz748yu8gOafWZToD26BFOLBn8Rq2LQoQ9BuwxV+2mGz3ppY956Q6
         r70SzTJOZhXgRjLwZqfC+RbIPdwaA1eKj0mIZ4Ehpj6NHJGQKkD4z8S7f+z/fxQrQuG9
         4tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685114861; x=1687706861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DS41ornEV9lQz2B3fbj5X3z+qOEzLQfQfVbRT/jAKE=;
        b=EiAA0NfO1yjKcVpWlBhndhXEwVLRe8ZlWV+KZxs/MszrVmu2TIQ5U0JULWZgpX2Qpp
         rKz5166vqeXFu7WfkEoPZ/GtKhChQXj2dfkfbBNTxatMRFIov6mOa+KOEY8wJ5E9tdx1
         +37V0+IN7LPpKrh2SBgA7bbqilUpVjS3suZttTM0/08bALadE8mpt5qlqavYAZPWjTXQ
         zsxZ8dLjJ3uQVuTdbhO97POe6vM3hy+RQrdHk4TyNN4ehGPAeHY55KkwMiL0jgCOU9c8
         TLMwWAIOL2mTm9jZsAhZtbOUCQTqyeJs1LUaZ/mA3FNDYWPZydmMm8zGuWxmDTBQQEiT
         DjRg==
X-Gm-Message-State: AC+VfDxndmTaCXsOYyMs18TWmWK033wJHfO8WIvpAhIq45YvN6kOjgzw
        U+loJVu7jpLUeelgMwnBbBa4lQ==
X-Google-Smtp-Source: ACHHUZ4+eT7FUZ9PEMFIaP0v9d/O+u+MFDQcigepppU39hQcZzMGh7oSP1CwJSx6e2TACB4P5wD9SQ==
X-Received: by 2002:a17:907:a0e:b0:970:19a2:7303 with SMTP id bb14-20020a1709070a0e00b0097019a27303mr2479341ejc.19.1685114861713;
        Fri, 26 May 2023 08:27:41 -0700 (PDT)
Received: from [192.168.1.149] (i59F67C10.versanet.de. [89.246.124.16])
        by smtp.gmail.com with ESMTPSA id m13-20020a170906160d00b0095342bfb701sm2305894ejd.16.2023.05.26.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 08:27:41 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 26 May 2023 17:27:32 +0200
Subject: [PATCH libgpiod v2 1/2] rust: bindings: turn SPDX tags into
 comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230522-crates-io-v2-1-d8de75e7f584@linaro.org>
References: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
In-Reply-To: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685114860; l=1784;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=GjwZ30+ZeJb5nwzVO+CFv9ZxGtcVSB1hJ0CdB2Qq3iQ=;
 b=at/VtG7JXOqkcGy2oC2f9QL2mx85tcOXZDDVHt5+aOjkG6k7uFfgV/HiAwoGNevYckEb9+i0P
 KTsqPxLI6H7BTXO2JD9wgiJST2R7PFTKRbrgxqWmE3kwaH5p0IqAsLo
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

In markdown `# Foo` generates a top-level heading. This leads to to some
weird, huge SPDX tags being rendered before the start of the actual
content.

Lacking good examples, I just took the syntax that `reuse addheader`[1]
outputs.

[1] https://github.com/fsfe/reuse-tool

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/gpiosim-sys/README.md  | 8 +++++---
 bindings/rust/libgpiod-sys/README.md | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/README.md b/bindings/rust/gpiosim-sys/README.md
index 6cd24d9..b13f09a 100644
--- a/bindings/rust/gpiosim-sys/README.md
+++ b/bindings/rust/gpiosim-sys/README.md
@@ -1,6 +1,8 @@
-# SPDX-License-Identifier: CC0-1.0
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+<!--
+SPDX-License-Identifier: CC0-1.0
+SPDX-FileCopyrightText: 2022 Linaro Ltd.
+SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+-->
 
 # Generated gpiosim Rust FFI bindings
 Automatically generated Rust FFI bindings via
diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
index 3eb5c9d..1cb3b0a 100644
--- a/bindings/rust/libgpiod-sys/README.md
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -1,6 +1,8 @@
-# SPDX-License-Identifier: CC0-1.0
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+<!--
+SPDX-License-Identifier: CC0-1.0
+SPDX-FileCopyrightText: 2022 Linaro Ltd.
+SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+-->
 
 # Generated libgpiod-sys Rust FFI bindings
 Automatically generated Rust FFI bindings via

-- 
2.40.0

