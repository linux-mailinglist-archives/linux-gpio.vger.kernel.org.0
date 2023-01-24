Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBDE36792FE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 09:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbjAXIYZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 03:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjAXIYZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 03:24:25 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6520BB
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 00:24:23 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id k13so14078028plg.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 00:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7gLXq4ZFSqafs80Sd3lKjhLu4IsjizEIRLtplmdEu8=;
        b=DyaGK6aEgVhUnauB3u70U/RPhXVViT8cJJuewveqL6g0ykbQqzgslkzXBR+MgI8JW6
         mWy961hyNTCIUy0UiydUSW4jn0E0m8hs/dZwmJOZTAhYmViF1WqYHca1Ouuk77MtteiL
         cwsZ5K4AWN3IgvqoCt+CkB63ApaeotVGCso21WqtR6Xrz86lbvoep6pnKgjO9pint5e1
         vPf8edHXIBRaDIUqhK5i8cIrOEGcSh3mTjwbfiWGrKblwx1oSe55rRYuQ1TLGwG7hS5j
         3J2zAon9pdBeUCpvjCVpDhbFH4kShbGlDqenSWa0McezJqjQDO6aKqW/yhe8c0WEe+DF
         KBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7gLXq4ZFSqafs80Sd3lKjhLu4IsjizEIRLtplmdEu8=;
        b=1EgNvI5Z5LU3eMJINDDsWiPCGVM8Cec0g30L+aIF/f9IcZM0tpu9EktTZRedSpdkrD
         D7eNrwA5nC2eyVIWNYDjWcIQrvVoCG+m+eOXqml07YnQ6WYrWAGOIMowO+jkf98OrNJd
         /rSAVr3Fru0VKdYxYAk3tIqPva56ZtIkfQwEIvXJfao1+agLZrImE26OgwhvK/8Y8w7T
         6DhwMyTU+xZhWp++0uWIMNxXg9cwMD8B6Zhp8bVciQuon7l7vpVN2PdgR458BNk8lLz5
         F3V/QTaTkAp/5QBm9WiAYfK5UKAGaquTvsA1vPXwjyy7mqq561fou3akqTv0uOhnGvh9
         j1kQ==
X-Gm-Message-State: AFqh2kpdWM5ZV9X3tQ1MUEsFSdzWL0GE1Jp5Pt9r4WJI9p887eulj+4h
        FAmC8FrxW9BYFGEHeR6UmiDmYlvcMJDyYuYT
X-Google-Smtp-Source: AMrXdXv2UDb41hZdiqq/MCgxNuFgHX1qzCtxX6WV3yXo8SDPIE0Y3cga+F3b4eXyO5u0TE7uX5siDQ==
X-Received: by 2002:a17:902:a717:b0:194:78e2:f272 with SMTP id w23-20020a170902a71700b0019478e2f272mr27564660plq.53.1674548663442;
        Tue, 24 Jan 2023 00:24:23 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id be1-20020a170902aa0100b0019608291564sm1044086plb.134.2023.01.24.00.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 00:24:22 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] rust: Allow reusing locally installed gpio library
Date:   Tue, 24 Jan 2023 13:53:43 +0530
Message-Id: <3d03ede97ce0717e3f69de8fd4175407a3aa3a0e.1674548651.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The rust crates builds fine when built with the 'make' command, as
static linking works fine. But when referenced from a remote rust crate,
it gives following error:

error: could not find native static library `gpiod`, perhaps an -L flag is missing?

This happens since we only support 'static' LIB-KIND currently. Remove
the same to allow others to work too.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/libgpiod-sys/build.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index 274069eb9e9d..e3ed04afa141 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -37,5 +37,5 @@ fn main() {
     generate_bindings();
 
     println!("cargo:rustc-link-search=./../../lib/.libs/");
-    println!("cargo:rustc-link-lib=static=gpiod");
+    println!("cargo:rustc-link-lib=gpiod");
 }
-- 
2.31.1.272.g89b43f80a514

