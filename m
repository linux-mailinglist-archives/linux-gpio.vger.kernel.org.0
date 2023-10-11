Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 123A77C5BA0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 20:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233194AbjJKStS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 14:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233127AbjJKStR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 14:49:17 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B868FD6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:14 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-405505b07dfso8641155e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050153; x=1697654953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjn+HCp9G7ZHzIyDxbnLCnTHGxIfK36bGHTjBoI+aL0=;
        b=HALuFxuctaoY5FsdXFeK6hiBeTxfgFHGMMfphvzbqafnZcRbBsQXyuuIUHtTvWAqqJ
         zmKU6AQBdyM6cJSHakwxZOQ33XTE0tWM+XWD4VqZR4EOtnymX8GG8kfYWapSYQkAmgDx
         GDAkX5YuwUBsoBIgVduhn3ahqR/0b3Y3IzOk/Kl+7Y0py5f/1V/ae53zA5mOzKGpVkfG
         fm4p4VTO9bwxJUXSzIbvAwnfk4/fY0WRwrR2tfvJ6fQkgHM8vJkY8hjghTjtLhnGSVe8
         p1oZfHRGZsAOoRxjEI773HC8A6M4v5uz7Kep0AiQEH0I0dpooDo6D30evCRMLS/tLFe1
         WDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050153; x=1697654953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjn+HCp9G7ZHzIyDxbnLCnTHGxIfK36bGHTjBoI+aL0=;
        b=YYQxTpQXDtAt7eyDPcHTmj7Qn7mX/k032m2PX50X48Wsjz+V/pDfK5ajFCmS3kmlc7
         KW6oARsF5D25Ti03O3A5DQiA8AhxdpDi47azUUiBtMpObin9d4dDgO4LdkJPuS+YZwsF
         zmPkqEvfbLE1w3Vwh2YXKJbRQSo2eNRk3TEAp9zFYJzveod5pek/zB/ErYzbWWGtHtMq
         knuXDlrIJLZqrtSrQ6nbNW/713dsFeChpQaldHP3A7hCpVZ4yCt1frTKWPWo7rT5JdSH
         AYXQ5yG2CQUf1ZwFYXuL2fIbd7EugX1JDngxbV4TPVrs1H6OEnzNQKgm1ShlV1ZSHW+V
         dOiQ==
X-Gm-Message-State: AOJu0YwuTObvMkK9VIerE77WuX6BcjkJoWjAf9Diw4CH2443mxjN3H7W
        qeR6TPIJeFBR/7/KQNVnNjzgRA==
X-Google-Smtp-Source: AGHT+IFOwG6H4bUwl9oYnw/1oaFVA9Ze2qjkasIInOAk9yMIVanltuFWLRsVMEOKeF1K8mucpLtxfA==
X-Received: by 2002:adf:ab0f:0:b0:32d:8113:eda3 with SMTP id q15-20020adfab0f000000b0032d8113eda3mr3616045wrc.10.1697050153044;
        Wed, 11 Oct 2023 11:49:13 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:12 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date:   Wed, 11 Oct 2023 19:48:04 +0100
Message-ID: <20231011184823.443959-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
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
2.42.0.655.g421f12c284-goog

