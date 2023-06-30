Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F7B7440AF
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 19:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbjF3RAl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 13:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbjF3Q7t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 12:59:49 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1879F4683
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 09:59:00 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31297125334so1909766f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688144339; x=1690736339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RE5534hcGxVn/KNo4nNaHNAogiNWte5Y38IgWgMeyE=;
        b=gR6XOYdMaz4svBnafrAt8z5G3LWrxkXx+DHTJ3rnahYVDf05L/uW7OhXWeAWIqfQVo
         edwrNpWAfmHD/o9eGOgjuDipftZKWa8FzAaHW58dpkijnk56ldCGxmyCK6cPs3guGGFG
         s+8itEyQW84sAG5APGIGylBvPZKRmcrwxH0KM5ZIyKwbUsq0A7pSt4qK5PVnT04kSTbx
         8SH3WgcUUyG2AGIiwSEzrlBfALSCgC+x36PgqYPgBFdktRGSShh5gO4yLrlJRvfmPbji
         GbCP6PJZqhbajC2s8LN0ysfkZ67Cx07Wy20YrtJUyJ9WhQKPBLq2r88Z/kj7Auc6BBjE
         GJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144339; x=1690736339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RE5534hcGxVn/KNo4nNaHNAogiNWte5Y38IgWgMeyE=;
        b=LSv89rRqgroeQe1J2bPAHXwSXEk/LVK5w+a4P8F/rjybKwQXaqJRVBEkDqrLV4H5JV
         CVmDExamFeSYuKcrHVPx8siPlK1IU2Iz5o33sGLhIUyuBGQxJofp6JCkdbC7pHTYbDbl
         Xa79S6vOYXkBiKRk4zmyt2kAog5Q82iUiAqbFgW0x73vc6kbU7PIXHWpy5JRoXKbFWHz
         KPSfYXOCjEA2Zbqu9bEvDqx++Nh61nMh6S3kkNoVaaQfF3L/2zQtV806i0cCfktEY6x/
         Qs+0A9F/+qvQq3xr5gvSNdHBJkJGjGy7m4MQdkgN75g0dXabb0JKNkW1bn0x52Ykr1i7
         IOcw==
X-Gm-Message-State: AC+VfDyyJermEBFDb3FFJYQgTd5eGqtUMUsQ5TqraXVWg7Htbpr9APm4
        VtaXUmHlS3hOccRBAJu3ljdar40HHfF0uBJpNv2juA==
X-Google-Smtp-Source: ACHHUZ67VHZg4s+SYrTR6+84c/ufKS7Q01De9EVEy+1Ktnx9SqhFoXMa/ALr5i7wOY4YYAh12zGPEA==
X-Received: by 2002:a05:6000:104d:b0:314:2c4:9fea with SMTP id c13-20020a056000104d00b0031402c49feamr7004552wrx.29.1688144339127;
        Fri, 30 Jun 2023 09:58:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:58 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 30 Jun 2023 18:58:39 +0200
Subject: [PATCH v2 14/15] dt-bindings: interrupt-controller:
 arm,versatile-fpga-irq: mark oxnas compatible as deprecated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-14-fb6ab3dea87c@linaro.org>
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
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KAyf/uprdG2/Uxev0fRE9woiE1KO/ssntpRa1SRTGCE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm5ebaeq5y28ag1NJPXsR2UMRtXo/2vvtxyaCAH
 q7bNYGyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuQAKCRB33NvayMhJ0a00D/
 949YBvowHmFLhM/PIxv1RNwEMg/gXdoG/wZrUvr3PALas1Cu0FQTMj4xevGv3DdfS8uo3ctM9oWYV6
 By90JIc1WSNQmG+KCH4hm+/qf5oE+Gw0Z3wEBD3rsvElYFEQ3fwuPrztim6PnbGy8QDBwms1IQIfzf
 h7RLWvZ+E8qGp3eltGC12OHkBIePX0rXXrxjdedr/j5FIw6tA75yvupH2hOl4NrPRBMFysio3ZkDWc
 9M8CG8/5lKHq46Y0YQxGe33JYEliELgFeuQZ2F2wAa8691MAj/qQgGvNkK+p0d3QC8ffPUSwyr3VmH
 5Q25o0x6lw7sIETB+MEPAkNIHmB/T6nlcBZXSf8KPxekM9p89ERPpyZVYu6fgo7AgnHZ2ViAWfT0aK
 vJMjzlAtrNbHtCUfuytjC+4kbC3bDd9vNFE29dLvMuhuZD+DnsX/UoP/WyAgt28L2k8BVEWwSbyCaQ
 2eYdh4Y+6SFl4s5/eClwjOvqKjGKgqEhW8aOec1A+m1QS5VYIk8pHdk0RSKLAMbNrghtIhbKMyQhU5
 860pnYTW31uqEHzSrRV62sO4Jd841tMmNAuImfY91tf2tLKDPYfECYF1tRp4lhsqUy9s8lxoRc4IJV
 mozMYh/oDrg2/3lH8mszi0QhKB4BvSDNTDFh/hQrDLMyXPR5es8ILH2xAzcg==
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
and since no new features will ever be added upstream, mark the
OX810 and OX820 IRQ compatible as deprecated.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/interrupt-controller/arm,versatile-fpga-irq.txt          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
index 2a1d16bdf834..ea939f54c5eb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
@@ -6,7 +6,7 @@ controllers are OR:ed together and fed to the CPU tile's IRQ input. Each
 instance can handle up to 32 interrupts.
 
 Required properties:
-- compatible: "arm,versatile-fpga-irq" or "oxsemi,ox810se-rps-irq"
+- compatible: "arm,versatile-fpga-irq"
 - interrupt-controller: Identifies the node as an interrupt controller
 - #interrupt-cells: The number of cells to define the interrupts.  Must be 1
   as the FPGA IRQ controller has no configuration options for interrupt
@@ -19,6 +19,8 @@ Required properties:
   the system till not make it possible for devices to request these
   interrupts.
 
+The "oxsemi,ox810se-rps-irq" compatible is deprecated.
+
 Example:
 
 pic: pic@14000000 {

-- 
2.34.1

