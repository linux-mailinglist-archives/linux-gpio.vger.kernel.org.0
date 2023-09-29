Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B15E7B2B5E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 07:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbjI2Fj5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 01:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbjI2Fjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 01:39:33 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4982B195
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 22:39:29 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c3c8adb27so1842013366b.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 22:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695965968; x=1696570768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ5vJt4uEBZYxaoCUMCaBdZYOuAagvaFox1SiyVlaFY=;
        b=M8Scall27LM9JZIEc0lNb6z87WIUQzcanG8ecsXwR1YcH2cZKsl2X/RsuQoIeTR0Y/
         oVs7ZYbCW50dhWM56t3/ofoOpo7n9YAMB7xpmwmKroD+ymLuAHcpWeqzp7hQWQX9SbZj
         VEP+hRKJJFLGfIeyItINIlDYAcIQkqPq61AdLTa4mKFSmNzKxRkSjbnLBKUeyhK8+avJ
         +7+tvkmHBOialyd1xxGu8pOvdfr+qp0oFs+d3PfROkVvl/JeAG9w2WjbvXJucBT+KtqB
         maZLISG48QzeFqyOBYnQ77eiu3yL9IasvuGkxknYgYB7dzEoU7BScIo3SHssTA1KDI59
         dyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695965968; x=1696570768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQ5vJt4uEBZYxaoCUMCaBdZYOuAagvaFox1SiyVlaFY=;
        b=AyHbuFdCqSRxAD/Ll7TPv05bVjFBJ81egP+cnyUOhOoZnfOMIqB0YgoEuY3W93DUwF
         juyyzx/6T4ae8QUP1TqcQXsxvZGGd5gHEgiNMntgGktrlIyoiH+XcPkVlVqzqUsP3Zvf
         oZGwoZCeYWIdjNlEv2JrCAZaz+1ZblHsccpuUGROKj51PS64XCvvDmsnPPmZoSLW9P2F
         UYOPV4KorbQWY9vcWkqNUyfgpn4/I8jGFP7qdCw+aNDO4vRvn5EhDuwzzdOjJ8kEz+oi
         jqCbXr2+aYsHxplxKckun3N4hjWPmGQRqLOmr2BZGmDq7wUF52mOg81GBpD9qMHaXDz7
         935g==
X-Gm-Message-State: AOJu0YzQzH9oTeQStEd8wL2cqDMuBnWwMHiPDAPXk/H8y29kbDGekSka
        mcXJQlzvTcy+fIuozesDQJKXmg==
X-Google-Smtp-Source: AGHT+IF2d7y2sZctyVqepi31GT6G13UI30T9U1ZXO4+TvKL35jVYdGIA1Qbh0TvHWtTX5d5AgXLNmQ==
X-Received: by 2002:a17:907:2717:b0:9b2:d78c:aff4 with SMTP id w23-20020a170907271700b009b2d78caff4mr175767ejk.74.1695965967847;
        Thu, 28 Sep 2023 22:39:27 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:39:27 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org, arnd@arndb.de,
        neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/28] clk: renesas: rzg2l: trust value returned by hardware
Date:   Fri, 29 Sep 2023 08:38:51 +0300
Message-Id: <20230929053915.1530607-5-claudiu.beznea@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
References: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Initial value of CPG_PL2SDHI_DSEL bits 0..1 or 4..6 is 01b. Hardware user's
manual (r01uh0914ej0130-rzg2l-rzg2lc.pdf) specifies that setting 0 is
prohibited. The rzg2l_cpg_sd_clk_mux_get_parent() should just read
CPG_PL2SDHI_DSEL, trust the value and return the proper clock parent index
based on the read value. Do this.

Fixes: eaff33646f4cb ("clk: renesas: rzg2l: Add SDHI clk mux support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- Used "return val ? val - 1 : 0;"

 drivers/clk/renesas/rzg2l-cpg.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 0679f2c7649e..6f50f0329ecf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -238,14 +238,8 @@ static u8 rzg2l_cpg_sd_clk_mux_get_parent(struct clk_hw *hw)
 
 	val >>= GET_SHIFT(hwdata->conf);
 	val &= GENMASK(GET_WIDTH(hwdata->conf) - 1, 0);
-	if (val) {
-		val--;
-	} else {
-		/* Prohibited clk source, change it to 533 MHz(reset value) */
-		rzg2l_cpg_sd_clk_mux_set_parent(hw, 0);
-	}
 
-	return val;
+	return val ? val - 1 : 0;
 }
 
 static const struct clk_ops rzg2l_cpg_sd_clk_mux_ops = {
-- 
2.39.2

