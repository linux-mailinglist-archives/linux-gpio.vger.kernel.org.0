Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B70772C2F3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 13:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbjFLLhH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 07:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237885AbjFLLg3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 07:36:29 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3912611B
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:15:02 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5147e8972a1so7486439a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686568501; x=1689160501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DVWYkURR6mcXMKYmOIQUwAj0q/FyswtijwBX81gzGo=;
        b=hn/Sj/8YYXXELLlR5K1tUqQpA4LCJtVPFppN4uv5plJN6j8s7iopuj+O3hKSdzfkSG
         gAJ2ar9GZlwUo7Nu6rJJAklI06/v4LhlbD8cKm24tjIASdVtns+GzrOoyhipHBjxcjJl
         PqqLtNadwRZAHUHviBbjOHA09nNu1kyuLRpnML6KzI72/U1ygUxCfCXWBW8U6uKdRKwS
         KPChIzwJOV8Oyvy2xiKAdcCCs68O3mCoISKAqExE99pQUfXFxw2DGCe4AaMXR6GMGprf
         iRDGMlhMBCSCPXc2UWf2oJ9/BEJRP/TIggxK9hhPd7FLMIOzF+6JuL7jAvW3tGq1gKz/
         eHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568501; x=1689160501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DVWYkURR6mcXMKYmOIQUwAj0q/FyswtijwBX81gzGo=;
        b=XzKlnv1YdkxJL8x5eX8y4LZWLLTAsLsmnFeNEjDw3dMLU5YBtRBFS5mbI0ffbN07Xr
         PLqnfTlRfcS8fgEMUB2ojEYgbIaGPzx78KIul9+34rt+Tkv2aGzum1Ovmg39JspjpDLX
         XKgr2bBQtQc4vpVa/cFDZ5p/XejGGBm6SKBcU3PB36iEUfojJBHeUIKfQLCTM6sjJCdS
         IPc2xKJGnhZTG2ThJeP2a66+R118zoJxQf6/F4EkmJsKqtn8uXXf6O9cWAsFrErW6Au0
         JABoFvdobxZHcTzh4oNJyP5kpeJP7iCDYDWsUV8sLY9wQWBUnDqmbucDYiw+u9OFUxa2
         LMhA==
X-Gm-Message-State: AC+VfDze15wG/K0SgVX6LugdTnzkDXwVs7BjPkCORv1i9FkltpnGwGnv
        1l0EYcJQZIMC6XlaI3yQZSd57TzjhzzjM2jB8Es=
X-Google-Smtp-Source: ACHHUZ6+cP3LPGxpA35QW/qwC140lndYuLWv9D1KRR/fdyNdOkWnXsVx0k+ApN7/H7gwAZnm3i7OkQ==
X-Received: by 2002:a17:906:5d0e:b0:970:553:272c with SMTP id g14-20020a1709065d0e00b009700553272cmr10438613ejt.27.1686568500769;
        Mon, 12 Jun 2023 04:15:00 -0700 (PDT)
Received: from [192.168.1.149] (i5C74066A.versanet.de. [92.116.6.106])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709064e4c00b00965e1be3002sm3463054ejw.166.2023.06.12.04.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 04:15:00 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Mon, 12 Jun 2023 13:14:48 +0200
Subject: [PATCH libgpiod 1/3] bindings: rust: add version number to
 dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-crates_io_publish-v1-1-70988ee9a655@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686568499; l=1134;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=pLfqJD80oUldRNxQB5/ahE0iI4z7PT2xbEwmBys45+A=;
 b=vBwpRMnpIXmWXDsxxPEx95sit+Z27wXuIbmPcdWcHoc7mpbmm5mCxFTcyrHaKlk4wrEDi80cz
 6zz+VAUMfRDC/9FVcMBqtSaxAyKaUoLCVeZb6SanMak3UAREr0L9k1n
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

When publishing to crates.io, all dependencies need to have a version
number. When building from crates.io the version number will be used,
otherwise the `path` is effective for builds when checking out the
repository.

As discussed on the maillinglist [1], each crate will have their own
version number (like the other language bindings) that will be bumped as
needed to fulfill the Rust SemVer requirements.

[1] https://lore.kernel.org/r/CACMJSes5+vT=NBqSe7xpSEPAEMmkgrZvJ8iKx7oBCKZQaGB_rg@mail.gmail.com/

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 48681de..b19e888 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -18,7 +18,7 @@ edition = "2021"
 errno = "0.2.8"
 intmap = "2.0.0"
 libc = "0.2.39"
-libgpiod-sys = { path = "../libgpiod-sys" }
+libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }
 thiserror = "1.0"
 
 [dev-dependencies]

-- 
2.40.1

