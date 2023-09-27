Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41427B0A24
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 18:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjI0Q3t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 12:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbjI0Q3r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 12:29:47 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A40EF9
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 09:29:44 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5335725cf84so12837578a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695832183; x=1696436983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo06My6sHAZQKm5bcwq+iQTqtJpbGcs8+Z9sow3dJjE=;
        b=uoZNBaUeajiyqB+afUHkgPrKwjSHk3AC9DO3L+4ECNCzkt8Fn+tbyjGXjsQ4jUNtK8
         6kzrFGSHwug61vtnL5X7duV2J/joPnlNJgh/Rkg66UtUyrZljJ57OnCgWLSik9zVUzz2
         PMgLNXB+l8wQSD1N71VdKmTvfjS8Tr3vnz4PVL6deAjj1Ng5yntFlUM34PK9WL3zDSlx
         I5qDxeXbM3Q/6wLRfQjfIa5f/j/dKrssx2RM7tQ6muSl0gv+jQtVLblym+jpbnDGUszT
         kuDrz24pR1oA3yP5pai99U3bnVKoWloZhmsqGhdgSz4QgnEK8CLtfvbhY5CYcXAoQcc3
         ab5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695832183; x=1696436983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vo06My6sHAZQKm5bcwq+iQTqtJpbGcs8+Z9sow3dJjE=;
        b=Fe28lY+xBXzPmL4owWMmh1CswTnBACkvA96DVTFNCdHUTYAxC1UtJ3WUpESjXsjfRe
         RPtbABAuGqjT/I9yB3OWhiZ6JcpMzbZE91rmiYYoZs6PcGLl4UaWxGt8mk7Ela68DDbH
         JfPs+PSx4QbErFQuFtljW+jCmAK4IVZ1KMeU9nUcBqlY4tEbSCWK5EM5rClE1g2U98F5
         0yMZBRujmNJclGhYICWUxwXfdzloBEKr0/oYTTWJOUE6kBmBnceqKr2NjGd1TA2a9YEy
         YmAoR+C4QbHFdNaeLDMoAJ0+A+ktoJLY6oDwk8GU7mhKReQkMZ8xlO9Xkb/4dGAMtWzE
         VDuA==
X-Gm-Message-State: AOJu0YwCDPrRXJ/IpI7BI9ky+xRUVm6AS+FCtUQeM7doVwIqHFHqchHa
        OtrGqK2YPezm7Xi0TKBqMaI0qw==
X-Google-Smtp-Source: AGHT+IFEZ5thY3L1iERKZQyWbVp89GbCHlEnEem3oDxbpPPtoxXhZaXuovdjvqJMclNHBggUOw5rBw==
X-Received: by 2002:aa7:d38c:0:b0:52f:2bd3:6f4d with SMTP id x12-20020aa7d38c000000b0052f2bd36f4dmr2798420edq.0.1695832182719;
        Wed, 27 Sep 2023 09:29:42 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438B3.versanet.de. [92.116.56.179])
        by smtp.gmail.com with ESMTPSA id q8-20020a056402032800b00522828d438csm8384685edw.7.2023.09.27.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:29:42 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Wed, 27 Sep 2023 18:29:39 +0200
Subject: [libgpiod][PATCH 3/3] bindings: rust: bump major for libgpiod
 crate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-rust-line-info-soundness-v1-3-990dce6f18ab@linaro.org>
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
In-Reply-To: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695832179; l=1005;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=PcOVUqQ7ca/3tD9NzySf7uY+U8FcDHCGFswfcvmUy7g=;
 b=g11dKo+5YPCSm00IapYC7B2FeohkFEvdzxUz8DF+UUsHqCmGO7jZ7E8m/sgiw2y6rPIzfC4uj
 +vSCWiBH6UZAdFl56Ou5GZGIzXvZSpKL7swiqwH3pCqPQ9nejrD6CGn
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since the type changes around ownership of line_info instances are not
necessarily transparent to the user, we bump the major for the next
release of the crate.

Note:
I am using the term "major" as defined in the Rust SemVer compatibility
guide [1], where the first non-zero digit is considered as "major".

[1] https://doc.rust-lang.org/cargo/reference/semver.html

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 518e5e5..3be4aa0 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "libgpiod"
-version = "0.1.0"
+version = "0.2.0"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod wrappers"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"

-- 
2.41.0

