Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA677B12CA
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 08:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbjI1GZZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 02:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjI1GZN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 02:25:13 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3023C1E
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 23:23:29 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ad8d47ef2fso1559048366b.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 23:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695882205; x=1696487005; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMH7tfXWPDCZzp8TYg3XpNbiRzbuLbGrkZPZpBTFCuM=;
        b=nNbPAaJpUisEyfpTGQ/EcuCJnNdiss12W7khPGgBraE04CX15t+mE7QG2RQYqrJZhm
         Ih+DYdGpA2capqUJiGSDmdvCom5hBqynGCe85c/4kutXzdEEn4ADUBJRGqZfibBP4k6j
         Zthhu4JRJye5pcg1Ao0GDA3QsZwO0ae19OCUFqydrXm/zxfdo0kDsLy/1D9xzHdWDOjE
         V4OHdjeo92HANiU/XwkCbpMnkIPHpFQ154fJPuR4rWqRiuGp4+8+6LTkpink0L8Eog49
         WVX7beeMusIN7gJ90ls27fZtCcs6LJrOmsSaf2j0oAIRMGkz9OhQ1SqUo3MGZ53ehOY+
         xIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695882205; x=1696487005;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMH7tfXWPDCZzp8TYg3XpNbiRzbuLbGrkZPZpBTFCuM=;
        b=HBwV3B+pr/W824Tn3V+pXpcFgUFoyouhg7IFVXXJ+abvvnh8yoOCXnN/NceEWYCzLN
         KOdwdQJS1tkRTba9xVvPcpAiYlPqV0n9GGAmkLmRKiFDQIGvLF75UNh7ZFf7ACuS0PSD
         Sko0u6POARr/XhK3BIaf7xixMl7wnMNZ2K2e2Az/lSr9hmDo7x2wD5RzmpxtTk3FCrmj
         6+mymZ9IB66hdVTgX4ZhI8lB2p386/0CoQ5yckGW9nF+XMJx8M+TJ99c+cMkv7c+C0yn
         +Mfqkx45dpP+v93QB0vy9Lx9eieAuSKGlhZyx9Eym/H+Oq7IZiSu+5WtAiRdxPJD50g4
         meew==
X-Gm-Message-State: AOJu0Yxt7E4hA64QBEgsg8dzniH6nCh65n3PuksMMmCwfu4fd+JfVfIB
        CCmhvwzgvG06IBDeWP3QyoWPwQ==
X-Google-Smtp-Source: AGHT+IFgWinmeRC16v6vNNPbCeeeoTPr4rXtovxVygqZQ1+BYvbAE19RfdoYddO28EEnC9SHvGRpLw==
X-Received: by 2002:a17:906:15d:b0:9ae:621b:b41e with SMTP id 29-20020a170906015d00b009ae621bb41emr345037ejh.66.1695882205159;
        Wed, 27 Sep 2023 23:23:25 -0700 (PDT)
Received: from [192.168.1.149] (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id t11-20020a1709066bcb00b009a0955a7ad0sm10362567ejs.128.2023.09.27.23.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:23:24 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Thu, 28 Sep 2023 08:23:19 +0200
Subject: [libgpiod][PATCH] bindings: rust: remove useless clone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-useless-clone-v1-1-c512c3c6bf2f@linaro.org>
X-B4-Tracking: v=1; b=H4sIANYbFWUC/x3MTQqAIBBA4avErBPMiH6uEi1MxxoQFYcikO6et
 PwW7xVgzIQMS1Mg401MMVR0bQPm1OFAQbYalFS9nNUkLkaPzML4GFBoNw6m18Nk3Qi1SRkdPf9
 vBU/7kSha2N73A8ez5T5pAAAA
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695882204; l=1626;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=EyYy6pM7ltDQNwRnyUdQ17ea1Ce06SsJ7hUbiZKlxsk=;
 b=D8L9bEf42aYf6xLFStxkM3vx/p2504HOkGSXweuE4wWTy46nRaIuPA7wkRHAwz58a57D96Fof
 uLPscO/tzr9BVg2qj3sq9kpu1YrbtRC84rmyTeIYNuBiLD0/I/56Wb3
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

Reported by 1.74.0-nightly:

  warning: call to `.clone()` on a reference in this situation does nothing
    --> libgpiod/tests/line_request.rs:71:44
     |
  71 |             let chip_name = sim.chip_name().clone();
     |                                            ^^^^^^^^ help: remove this redundant call
     |
     = note: the type `str` does not implement `Clone`, so calling `clone` on `&str` copies the reference, which does not do anything and can be removed
     = note: `#[warn(noop_method_call)]` on by default

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Found while running nightly toolchains in order to run tests under the
AddressSanitizers.

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/libgpiod/tests/line_request.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index 9af5226..da22bea 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -68,7 +68,7 @@ mod line_request {
 
             let arc = config.sim();
             let sim = arc.lock().unwrap();
-            let chip_name = sim.chip_name().clone();
+            let chip_name = sim.chip_name();
 
             assert_eq!(config.request().chip_name().unwrap(), chip_name);
         }

---
base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
change-id: 20230928-useless-clone-af75c3a58df7

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

