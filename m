Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54F416D1A7B
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 10:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbjCaIh5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 04:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjCaIhG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 04:37:06 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49ED71D90E
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 01:35:35 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id h17so21571492wrt.8
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5S8DS7MwX0eSMjECdngcIupXRvdIfBFKmoZZhwAEom0=;
        b=tnfnYtQdWHkb+imXQ5cdS0qz5r299xH4jhkGPSnNJ2hyhvDgzphIZ+JrRafIpmAM9p
         AYZ75Po2o2Z0SH8MZ2PJlbzGo/n61VmC8VnuZ2JuYUqUV2XrQWwn3l07chxkJqnSXjPP
         5f1CEgxiSVpvn2h1nzoHxbtdANfxsiKSj6kGo5Gn+zXB98k4Ll0nq2FYEQMcqg9qKycl
         SaFHJ31SA4vogcCrvZnJv61gFMikTvHDNS7J+H+by9jPFBPOVQx/EaIZbfwOl1I2Oqqc
         0h4V53L2ZH7bwDuc5XrqWaqkZAcFFMRby1EyH50XYnZmPSj9SLb8FRQWZxdM2RBBTVHm
         BCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S8DS7MwX0eSMjECdngcIupXRvdIfBFKmoZZhwAEom0=;
        b=jFCTYIe13wnKPQPhGLgXQvBm7jY7XPgs+2oZXBUAQYsUe+m50OaP6/9EhVaG/j2zje
         vWQce1dRT7Wf1jdHDPJzvCmOAZQO4KS33ct4uRoa0In3WqdwBaK6iSQ7jN3LJlbDA9dR
         Let60U1qKpdW5BzXIoCYVrZpimemdws4LRaBokzrK8BUeY7G/sbf5T+zR7k7PRLJDe1U
         geuatdw8nIbhInu0LZChA36/2HqLb03Nu7zr/JS8+cGSiG9C+1UAjVK/x99FtArzmnq7
         QPSGKN9PPh5ez/rU3NDIFyJKdJujlDqJbSzPOnGmLL8Ee8iL0Wqnam8pG6OXq1UshCgk
         gsDQ==
X-Gm-Message-State: AAQBX9cZth0/Z0jgnqt9lgqCHJsP8feSa+/MVNckFtpxtqBatZ+9PGYc
        mXbqbP7kWwHlsXHZKRW3QTl8GQ==
X-Google-Smtp-Source: AKy350bVO2xvOdcujlPweNogfEF/aS/RwRjRN7oD1rhoaEfLODuiLQvDCF4zUxggrf8oM3l2ae/tZg==
X-Received: by 2002:adf:fa09:0:b0:2dd:cb8:2299 with SMTP id m9-20020adffa09000000b002dd0cb82299mr20102833wrr.11.1680251710872;
        Fri, 31 Mar 2023 01:35:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:10 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 31 Mar 2023 10:34:57 +0200
Subject: [PATCH RFC 19/20] dt-bindings: interrupt-controller:
 arm,versatile-fpga-irq: mark oxnas compatible as deprecated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-19-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
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
        Sebastian Reichel <sre@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, mark the
OX810 and OX820 IRQ compatible as deprecated.

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

