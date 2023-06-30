Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1449744054
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 18:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbjF3Q6p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 12:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbjF3Q6n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 12:58:43 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE74F3C30
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 09:58:40 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso9586715e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 09:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688144319; x=1690736319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5VfCDku7PhFUhxNZL9RrxiZVdAXUGwMdzc9iuToxvY=;
        b=fUKK6eN/ScDGy7o4nq6+yIdxkSMayAvigomaImI/5ndSFAERxgZD44tOEhSRiWAj0x
         /I55SERez8tq5p33w6NSE0ZDrvBOrsucEjr9zIk/zm6A4tW8EBOzf7sFREGJeLPN8R2V
         W0IO5zzcF/n+oXs3V0GlEIvEZ5qLcteJM6/Q0x6MU13+VTFsaJeibgV0p0xyJFwYBLX3
         7qSM74Pnh0MwuDXM1ouLk9p+Yc8ZTC68/KU2LceIZ+dybuzDkPdAzQEABlXdeEyid3UU
         gPW4+noy/ovR20GuN+4fPKHh9gamCrjUfJOibKmkF7jyJUW5yUGRovS262POuNg6XktU
         XpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144319; x=1690736319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5VfCDku7PhFUhxNZL9RrxiZVdAXUGwMdzc9iuToxvY=;
        b=lH5y/KP5VLDw5kjeqWp566u0ZOsNbVMDTimk45II8ubbEgD4rLiRAoXKbquvgSWG8h
         rbYdJTUtyr/9VGBaqH1O+R+YrSdZBBDmSPlwxKa1BIlbGhwtlqXrGEWVK65yBQl0rEpw
         pRNdecmFtTQPQ92QqTNp04bUIR422Afooz5T425wQvUMF/RofhTcnaZl+5s0Rdfm6jim
         lDBf5vAP5W0FlFfxB5lsPdvfJFLkUYnAfqL6YFi3IQlgVTj/ms73pCSb0x6fbk0BJJvG
         291Qf/rcD3C6FK8L4kYvqPQCornNDxKbR9ul6Ep70fUUEWwGFYoJleJj0mm4yA3/SP86
         6Yeg==
X-Gm-Message-State: AC+VfDzuuGA89m2IRsDRsZh4gvH87oPyQJ8lWLjs2eB2/vLuUae8gAj5
        gl/iJJwiuq2EcM3w/k4YHY1wPYRPS2e5SGfqVQNuqQ==
X-Google-Smtp-Source: ACHHUZ4jfOLP9DSUM8iQinRS8Vum9XKSxSLXf+7HjFdIRyfIkOHCYGoWFaqy2VXVGNXPMBo+xTlFUg==
X-Received: by 2002:a1c:4b16:0:b0:3fb:be7c:d58a with SMTP id y22-20020a1c4b16000000b003fbbe7cd58amr2269200wma.26.1688144319230;
        Fri, 30 Jun 2023 09:58:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:38 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 30 Jun 2023 18:58:27 +0200
Subject: [PATCH v2 02/15] dt-bindings: clk: oxnas: remove obsolete bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-2-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-oxnas@groups.io,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bzno7XM9r0SNC/gStJcrLz6bOxC+B4tnBfXrQVc4AKA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm08GTlhXUvs7ni+2UnaR66va/P33VZvppd02s3
 XjaYa9iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtAAKCRB33NvayMhJ0fEwD/
 0c8c0kdMcu9cAO6MW+kau0NON/fYuaafAI++DNEg4rOBcbZZ9RNE9EqK8ZG+ERzfrEi1n/fLjJS0x5
 E6k5Fj2Q+rGH7PAw1HeAmuECHlLgX2IMHWVF4EDSLWIlzZPUS8XFNz5vIMGCCMLv7Y311cVfmzrTtr
 IEwejNA/OmS0grIUXEClx8Sp1TinImZI9jHZh3AijGq8XiEW2E0rFGHrATPJHuA9Nx1BwEtrKMecSk
 wFtJCh+PCDWqm1SNjVQcYLbX3RPFRz0aXKKjET4NB7kZvPtD7T5mNh6cjK1k/keUTjEVplgtjJwA/d
 HZOrPOQNr1jKROsXy72AQ3XUs4WnPy8g31SX1EQNlXBl9j40MaU14ZEHPTtS5C/iIJrqxM4KNKGFWY
 5pBAzHw/vaYt7C5NcrI4LGTpWgGwFPrvhahxuXCgAPHeEaHOAxcdYt3wjfm3obKlDO4bVWFYmnwGYb
 TFSxRTatfNcT/7G8e/fPR2InfUfImg9Q08gRNTvR0ls0t3P49CYiS1VwFL4cV9dT4CnQvNEWkmLNjf
 l/K7qlaz1AtLH22wg9bT79EL/ud1qabQeYwF5uFQHItpwMH3bgcoREdJeHPSLbdL4ZTJOzKFoSGJz0
 ir6/tIunoN+bjEYP4Voc/7R8Pq+IIgVJ/8ED+SCvmiwkzoJFptWW6NxwIHRg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 clock bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/clock/oxnas,stdclk.txt     | 28 ----------------------
 1 file changed, 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt b/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
deleted file mode 100644
index b652f3fb7796..000000000000
--- a/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Oxford Semiconductor OXNAS SoC Family Standard Clocks
-================================================
-
-Please also refer to clock-bindings.txt in this directory for common clock
-bindings usage.
-
-Required properties:
-- compatible: For OX810SE, should be "oxsemi,ox810se-stdclk"
-	      For OX820, should be "oxsemi,ox820-stdclk"
-- #clock-cells: 1, see below
-
-Parent node should have the following properties :
-- compatible: For OX810SE, should be
-		"oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd"
-	      For OX820, should be
-		"oxsemi,ox820-sys-ctrl", "syscon", "simple-mfd"
-
-example:
-
-sys: sys-ctrl@000000 {
-	compatible = "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd";
-	reg = <0x000000 0x100000>;
-
-	stdclk: stdclk {
-		compatible = "oxsemi,ox810se-stdclk";
-		#clock-cells = <1>;
-	};
-};

-- 
2.34.1

