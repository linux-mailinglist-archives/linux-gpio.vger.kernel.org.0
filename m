Return-Path: <linux-gpio+bounces-1239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF83D80D14E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 17:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A0732818CC
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796DB4D12D;
	Mon, 11 Dec 2023 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p5M1w0w5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A40D2
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:25 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3332ad5b3e3so4297036f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311864; x=1702916664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xJMMkIi7gHwqFFRiNxJNl8E4vObJQqSH/0uTp/Sg+Q=;
        b=p5M1w0w5aoGqUTf8Cl1dh1jDvoovO5MLbzMPF4RH22DKiABwKlHxMORql0ejvkWOry
         oiadA3eLeYD8NZMV/NLjvzLhnotTEHuVD79fs6ZCMXlWTp1YDneL2kroTSzYeKvnIiod
         rU1kkmTBsz0KIeX3phQg3Zm/psdOm52zeFW98NyaN89jweTO54Qcc2dSNmm6CCKXqK+y
         8XQVX1SBpx70DjWzvHVuPGN4TvGxdb7HqILE94QifhVsHtSgcLCdGuibj4k+iUR4hsjL
         B6rd3KYjVgJUgj+1fJ+9/a8bqTL7b2lOx3Rze8213C2XvxnHHd1G1hAr4f65VS44Obr/
         Zkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311864; x=1702916664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xJMMkIi7gHwqFFRiNxJNl8E4vObJQqSH/0uTp/Sg+Q=;
        b=ovNcPFL74jJ8eaubOg415au9XKq1T0mQEr2H0sqmiZZDCZVqioBvovrBPBu4o+CbbP
         x2PnuPAyaBxnqVjLT8bhZ7T2q9Skzj0aXIOdWGW8WRCIth8qpE+36w2zC8WopA7pgJ52
         VNUdKbMsJYK0zItz8jUSqZQWro2zxzZoGPnJ8L2/bejEOCo+vSb8bxzlr29SIw22CjUQ
         MYFww7pvItWtN9mrnMC0Kg3fRbobsgoSEo5tGv99ogOQZYsKAxgnsnhCIWwTZknGbY8Q
         Eae0KmtL2bOULDmhRpY59hiGFx4aIZb+QB/1EDyELOBWPY91GoI2xacTCwb90WA6JOs5
         BXFw==
X-Gm-Message-State: AOJu0Yz2X2ensGapCGPCW2swwnLKoauILgBJEJhGH7bw8EsVCQWrFXuF
	GDrDJ+OeJPtrxBOnP9kwtwiRXg==
X-Google-Smtp-Source: AGHT+IHI8/u+g6/qyk1RENiAKJhOgl7pE0mrv/dVTAf7uAdlcOf9jEVdC0jE09pvx1o8Y/jX/B8VvA==
X-Received: by 2002:a5d:6a0a:0:b0:333:39dc:d9a6 with SMTP id m10-20020a5d6a0a000000b0033339dcd9a6mr2148999wru.85.1702311863797;
        Mon, 11 Dec 2023 08:24:23 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:23 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v7 07/16] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
Date: Mon, 11 Dec 2023 16:23:22 +0000
Message-ID: <20231211162331.435900-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-pll.c | 6 ++++++
 drivers/clk/samsung/clk-pll.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 74934c6182ce..4bbdf5e91650 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -443,6 +443,9 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
 	fvco *= mdiv;
+	if (pll->type == pll_0516x)
+		fvco *= 2;
+
 	do_div(fvco, (pdiv << sdiv));
 
 	return (unsigned long)fvco;
@@ -1316,6 +1319,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
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
2.43.0.472.g3155946c3a-goog


