Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C757440A9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 19:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbjF3RA3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 13:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjF3Q7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 12:59:41 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B878844B4
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 09:58:59 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31114b46d62so2347095f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688144337; x=1690736337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=safrMj4vy3+0ORPoAOcHGXU9yJdkC+AfKJ9DByswV9U=;
        b=lLnVdrw2EiSYW0TzS5oXpXUn00LFUe5uWezU6Knq3a+K5EfgjWi3VLLM93y7J4J8C+
         M0pw6AKbbhMm4vPquXrsqqvMYa9nxJlrpAoxOGQGp3HZtNHqszxo4s9fctQz7IUO7mtM
         Bd8yHsc9Iw7jFE7JQYq0uvCATVQ0ZT/KA1Fz2Qfc13038jdpksmKW4VyfbGLfT1oi62V
         444cv4OU6WcOT2oDcWtibODh7coMduW5w+z+CO22s/94ex6kjrQ7fiWC0oTbuVD80o/y
         VyRZaU6E5AAbCNhUr1B7dLPtMMF37+w5JppHPZspuG+mRwhXtKCoSUrXMnrrqe9xt4Rl
         Q5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144337; x=1690736337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=safrMj4vy3+0ORPoAOcHGXU9yJdkC+AfKJ9DByswV9U=;
        b=LBHUtyq2y3Tqr+9VRunaWBRg5jtVjD5W+eAx2GXGRCCDT3P1N4t40dD+mO7RVG+azN
         2Ts3f3P/a2ShYUrXal2ZALLK6NujkmQMYFkOKexps6FD8E0E+NPgL2aE2l8r6Rc0MZcZ
         lVSTb1yaTWXzbUrLxaFx53DZ2hvEeJDuNjVPHplw+t8kYIT778WHGZ6TYpVbmrlnzFUD
         yWF3fgL8atsZwYAe70JFP8lzy+aQQhrUteabFxyEP9V6j3sBYMDnqSoI73mp7pjNtBqW
         746v/wAHUXUa+bgkL4Ly8DDsr4kqZbxmMC1U18ikhpNbZNcqvPn5xNLAjNka7IwwB68+
         uLaQ==
X-Gm-Message-State: ABy/qLahVZwGUo8U2I0oOqYFDa8opjo5xElXzCN7nXYy07puYh85U72H
        CVWZEvfSEVYrOrpMbfSQUIEV0K/JYNpET3i00NSvvw==
X-Google-Smtp-Source: APBJJlEKyEGgCYGMVtZF4uOEb2+kQTTFHk1HYk7zoA+qJfRnhfllehuKYiRJedUqKHunCJKD/gD5YA==
X-Received: by 2002:adf:ed0a:0:b0:314:13e2:2f6c with SMTP id a10-20020adfed0a000000b0031413e22f6cmr2444572wro.58.1688144337623;
        Fri, 30 Jun 2023 09:58:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:57 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 30 Jun 2023 18:58:38 +0200
Subject: [PATCH v2 13/15] irqchip: irq-versatile-fpga: remove obsolete
 oxnas compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-13-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Hwq/1nyBJbIaeaNsvFzhDu1oXx5gpF7OJ2azvf7yeno=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm5eVilyz5juesTZ+I8YEmM7E2RHfvZxVYP1ZZV
 mwVWJPmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuQAKCRB33NvayMhJ0dq1EA
 Cn2KcT1QQ1o1T7+RYh3kPUyZMDiiOc1DSphO3W/uzuy17B2do61hFjY0ldTR9LVnga9ZpODHRUkIR7
 XY925yWYXfnrJgPmf02FEU37ju1/RJ424oSZMlsZ99qOyF0Gd4/pCCGcSwDiVhFH6+gx4ASuiOTZc9
 UNHnfQjGBOcD/HnhgwB38S+QSpueoaTYDT6Mjc5cX0SBcGXjGp9Bx+Md99BODkp4Hd9Y5mJ+CY/+8/
 w1GO8w/7Dmb7m79QwPWi6c/G5/i5MHFpAl9kc2QU/6ynyI5xPJUoJiFFLZAlNngwtVPWJENg0Q1UBw
 YN7jBh7yKomkrlxp6NW4WKFYSEFaKt4ybYtjmo+3DmpbQO/yc6r1k1bl46qufJJWzK1fE7phMItHf/
 1EO6h4/9HG5YhAEmtw4VuXyotDSG7xHUX84iTUqisRFHtkh3aq+vcCh42Glx+/g9amw3FUDvIQw9lm
 B7w/d/CgDk94Qs0gp/nKv8v/o1/fZMhTgS2mZbSXar3CcvfJEaoG3oNjk0VIK8iHwEbgROuQgEGKbz
 evwteKmyZKDOO1c/lCrJmD/4h3CnxXB9HxUynW1SZXjBIpchVe5SetsPfmEo1WkJzkyQvNovTcLpaJ
 rjkszeLvxd0rHZrpvV22nNfMyHRdmt4uWeyFu7fIz0koHI40RGLbE+d44/5Q==
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
and since no new features will ever be added upstream, remove support
for OX810 and OX820 IRQ controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/irqchip/irq-versatile-fpga.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index ba543ed9c154..5018a06060e6 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -242,5 +242,4 @@ static int __init fpga_irq_of_init(struct device_node *node,
 }
 IRQCHIP_DECLARE(arm_fpga, "arm,versatile-fpga-irq", fpga_irq_of_init);
 IRQCHIP_DECLARE(arm_fpga_sic, "arm,versatile-sic", fpga_irq_of_init);
-IRQCHIP_DECLARE(ox810se_rps, "oxsemi,ox810se-rps-irq", fpga_irq_of_init);
 #endif

-- 
2.34.1

