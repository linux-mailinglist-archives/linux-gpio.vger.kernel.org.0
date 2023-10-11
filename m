Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985097C5BFB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 20:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347022AbjJKStx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 14:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbjJKSt3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 14:49:29 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B31B0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:25 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405524e6769so610635e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050164; x=1697654964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yofb7s9KpXjYrtBhecTDWpMWHMMT9y1sYOj5t1WJR70=;
        b=Vgm/n/kPCkajbNAU6jhofNvERvwMxZdZRMeclaAjsCxKsgsgBnlRI/To/vlADjBcdj
         /PIp8SdxZyz4UbASWfiKDbR/BrN3xVa2KtMP3DhWqlY7Xt5+qaT7aqzR05ZuS6BYzfcD
         f0o6Epk4SLhlqqIlROSt+wHTQNzw7+qc4FRGX4vokaG3wrZn/kquyDWy2tHmQfjWMOfI
         r1ImFZZf57tuJKrJm60Ml3OcaET/0VGRzEw4KTyAj24BJvOJMvqH7ynAMk8DGlErEIW2
         NT/Ddfje9e2UVVG6Tr9/KPjN+gVaA3TcDE5j+kOR+gaN3LVISoC66dfZD7rjzs6BT3Ua
         wlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050164; x=1697654964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yofb7s9KpXjYrtBhecTDWpMWHMMT9y1sYOj5t1WJR70=;
        b=FmfpHaejz5x6s+BHagk5/pJ7CO2ibrluyRi5CJ0+s48Qy7RP1E/fhWDtl6JDAhE+0B
         nm6kGO6+Gc+/fJMXWkvIj6YJJDeC6SYonZpIxd2Wm/agGkN6RYAxIgHsA5iMaXe3jBqI
         P7FdfWtPndgxGpUTSzenGEeVFEAomBUzmuWuckogEN/JShTl/uY2Z5XiErB39WWBw0fy
         pF8iSJMTQBbnSC14LL0PHibJIeya4SeGpcS0OCO6EySWK6Qcuuo2D3FIIOnf/XS1ZnMt
         ww1LCfA0HxTsITyYK4LSShpDoVBd7vmzfmAUL7AguabhDbsXBZx275mjLBVxWtIGSfMa
         dZwQ==
X-Gm-Message-State: AOJu0Yz5pTEtf6we1EKH3N2FDreh3yfvl9ictQaUF7+zePpUVISowDJD
        J5D1U5UJPiXsRnzSG7ExOAoZlg==
X-Google-Smtp-Source: AGHT+IGRf9EJmduCoWrPdacsOlAVwtKIk7xvt+R0abAHC3IS9G9FktwJ/XEdwmLlUD4wNHZenVMAsA==
X-Received: by 2002:a05:600c:3657:b0:406:44fc:65c9 with SMTP id y23-20020a05600c365700b0040644fc65c9mr17722504wmq.8.1697050164013;
        Wed, 11 Oct 2023 11:49:24 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:23 -0700 (PDT)
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
Subject: [PATCH v3 09/20] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
Date:   Wed, 11 Oct 2023 19:48:12 +0100
Message-ID: <20231011184823.443959-10-peter.griffin@linaro.org>
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

These plls are found in the Tensor gs101 SoC found in the Pixel 6.

pll0516x: Integer PLL with high frequency
pll0517x: Integer PLL with middle frequency
pll0518x: Integer PLL with low frequency

PLL0516x
FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)

PLL0517x and PLL0518x
FOUT = (MDIV * FIN)/PDIV*2^SDIV)

The PLLs are similar enough to pll_0822x that the same code can handle
both. The main difference is the change in the fout formula for the
high frequency 0516 pll.

Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.

When defining the PLL the "con" parameter should be set to CON3
register, like this

PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
    NULL),

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-pll.c | 9 ++++++++-
 drivers/clk/samsung/clk-pll.h | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 74934c6182ce..4ef9fea2a425 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
-	fvco *= mdiv;
+	if (pll->type == pll_0516x)
+		fvco = fvco * 2 * mdiv;
+	else
+		fvco *= mdiv;
+
 	do_div(fvco, (pdiv << sdiv));
 
 	return (unsigned long)fvco;
@@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1417x:
 	case pll_0818x:
 	case pll_0822x:
+	case pll_0516x:
+	case pll_0517x:
+	case pll_0518x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 0725d485c6ee..ffd3d52c0dec 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -38,6 +38,9 @@ enum samsung_pll_type {
 	pll_0822x,
 	pll_0831x,
 	pll_142xx,
+	pll_0516x,
+	pll_0517x,
+	pll_0518x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.42.0.655.g421f12c284-goog

