Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5F77C448C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 00:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343880AbjJJWtw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 18:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbjJJWtv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 18:49:51 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F89FB6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:49 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-406650da82bso57633155e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978187; x=1697582987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfXAqV1pyqFtMV/UH+Un6VZ7ftSnQ6lOtRR1W2sjfGg=;
        b=al+VRbYRJRz9idIz4YM+RbMhUnDVdhZ7iJKSVzpedXqf4f7rvTH02P468vL+eUNcAb
         0pan5rk5nxEmNZv0pPFvo/xVxVsUyHmD5SmAuYFJZSVrJDRvMKTQ+Fgu1Qrpw1JdBUQ5
         COBv0ZSoLS14Uqk40eEdGJmbrr40pidfUsSwhozySBdxEkaponSyziHOYtQok9O+hYW5
         K5qcpIOb3rSHLS2H8JeWT0haxs9YRmK5DCuUQE2WcV7mlX5zPBUAXkJ37g+0hugNT1ib
         MszP1oQ6A6Pz9Ckjl/AKYIHFVb4UEmBvr77YTG8rB/8iPpDxwFVvv5u51GZ+tLyX9NyD
         Ighw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978188; x=1697582988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfXAqV1pyqFtMV/UH+Un6VZ7ftSnQ6lOtRR1W2sjfGg=;
        b=iPo6bokhqyer3tACRh2LiCHf6P+y8TZECezxBJzey+ouluaYoHTOueBzPmqxgcVzel
         LkU2u09WEFcWQuMhR30bhdFGXnua8Q08gdDh2uaF9T6nE2LDBAJ7K+Zv+XMKDlP3IhtG
         KgeHmJcBefw3lDkO3jtI8tgp7Z96FGnp6sKi1Y5kQo0or1YoYtG3p35dkxTWD5H+ujBE
         a8uSB54wG6wRil/zTxGGpsZ5aFuR9bmbkwfNoPRupy/LFRcFZs6Yj7tZuZqnK5PVeS1V
         pFCtbCSsnW4yj68gBghAp+llDAETkKQ5NHYyK2tty2OKqOXQHbxiyTplBNUg23IzwCcs
         ijug==
X-Gm-Message-State: AOJu0Yxwi/mFa6XdsvNeFpRo+yOmgSkvOQ7PgO6QHw64KCV9BAixjcGL
        eJAkBMaH7TfJcyC95sAmL6yrRA==
X-Google-Smtp-Source: AGHT+IEP2zxTpzOtUkFiPwRcOFsFqoBVvQ/ZCYKp0kk0nhdPzn6bCsAwihOCSclOVBe2WDi/PfNAUQ==
X-Received: by 2002:a7b:cbd4:0:b0:401:b76d:3b8b with SMTP id n20-20020a7bcbd4000000b00401b76d3b8bmr17968520wmi.16.1696978187754;
        Tue, 10 Oct 2023 15:49:47 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:47 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date:   Tue, 10 Oct 2023 23:49:09 +0100
Message-ID: <20231010224928.2296997-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add gs101-pmu compatible to the bindings documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index e1d716df5dfa..9e497c310532 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - google,gs101-pmu
           - samsung,exynos3250-pmu
           - samsung,exynos4210-pmu
           - samsung,exynos4212-pmu
@@ -35,6 +36,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu
-- 
2.42.0.609.gbb76f46606-goog

