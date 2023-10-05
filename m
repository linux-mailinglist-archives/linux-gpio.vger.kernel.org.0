Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC3FF7BA4BB
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 18:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237746AbjJEQKu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 12:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238114AbjJEQJv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 12:09:51 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EC18721A
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 08:57:37 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so1156487f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521455; x=1697126255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCRvx18FXBZUIE55KgKCOULc2WUqPQQy1aHNXgrW/y8=;
        b=Mi3d0w2olglNDWnNu8Yu+exguXEdJJXXYh/tY4f1lyxJLlxBQ6iHRxjhXkxoseGfwU
         iixAD+/OsQwxtbTTiR/5ha+ecW1STPSDQE0iUYHYOu7uvl0UXB/S7Q3k5ajXyngAVMRB
         5IJ7ocpcTXH+1V5udWDoTTcJhvtrO0gtRm4c3nHwrnR05soUEQ/fm8TK+HmLODFnDG3W
         xd8H6fYMOtrmSRNOlfOHAlcrKr2g/m9QLrG9MRI15DsCGmSjnBzeFRqJ4Q2yZ3ni0WIq
         t9eilC8PsGzY0dmJZgZ5t+7kIDMgkJA4aa5NqT/nvyCVsXYBgV2BFMdKXoVVad9uswKv
         0Jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521455; x=1697126255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCRvx18FXBZUIE55KgKCOULc2WUqPQQy1aHNXgrW/y8=;
        b=EAdlT3b8OTGJID6nTjfNWEkebVtpCReoMjccNTCNqRZdO3TrQ5fPmtwPY2oH86HJPf
         3xVntepY/LxtM1af+FpoZIUP7Qs2RLB07M4lLhtxB2Rl+PM+qjtLDHrZmYyEG283viOy
         0BfSAGvepygR8zF72twx84/U4uKobb+RfQPDd7SSwRYCo2pLzOb9fh1R+rkpWe9jnTbN
         Mb6MHqQU0SLXzbyjx/mD7u+XgnhUqLd7VtCnU5BJ+89fvltPMXpJNeU9TYZuUlhK77Gn
         apNsn31o0HoY/yDS4CwPxoXbq+oZReQinOPYj6mj/549PiKtHAvPSuE8olReRgPASd5m
         9PCQ==
X-Gm-Message-State: AOJu0YzxhhKHLBKCKF4B8Dt1A4Fehx/dwvSC990K/MlMdNVMNSY+bovP
        ywfdYSmz+M8JmGR24DAAxzAP+g==
X-Google-Smtp-Source: AGHT+IGXl1CoGjZQDrIr/dGSwn1zWY2LS9ksQvXQhCz9d02zBxSqzFembYLOfI32ScvmkDqICjuDCQ==
X-Received: by 2002:adf:ec48:0:b0:31f:f99c:600a with SMTP id w8-20020adfec48000000b0031ff99c600amr5234563wrn.46.1696521455682;
        Thu, 05 Oct 2023 08:57:35 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:35 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 11/21] dt-bindings: clock: gs101: Add cmu_misc clock indices
Date:   Thu,  5 Oct 2023 16:56:08 +0100
Message-ID: <20231005155618.700312-12-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CMU_MISC generates clocks for IPs such as Watchdog. Add
clock indices for the PLLs, Muxes, dividers and gates
in this clock management unit.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/dt-bindings/clock/gs101.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/gs101.h b/include/dt-bindings/clock/gs101.h
index d9b8299fcc0b..7765ba68f734 100644
--- a/include/dt-bindings/clock/gs101.h
+++ b/include/dt-bindings/clock/gs101.h
@@ -218,4 +218,15 @@
 #define CLK_APM_PLL_DIV4_APM					13
 #define CLK_APM_PLL_DIV16_APM					14
 
+/* CMU_MISC */
+
+#define CLK_MOUT_MISC_BUS_USER					1
+#define CLK_MOUT_MISC_SSS_USER					2
+#define CLK_DOUT_MISC_BUSP					3
+#define CLK_DOUT_MISC_GIC					4
+#define CLK_GOUT_MISC_PCLK					5
+#define CLK_GOUT_MISC_SYSREG_PCLK				6
+#define CLK_GOUT_MISC_WDT_CLUSTER0				7
+#define CLK_GOUT_MISC_WDT_CLUSTER1				8
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.42.0.582.g8ccd20d70d-goog

