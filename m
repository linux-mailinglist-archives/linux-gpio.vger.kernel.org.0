Return-Path: <linux-gpio+bounces-280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA17F1ECF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 22:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2B792818CC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 21:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8251737146;
	Mon, 20 Nov 2023 21:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W6CPFW2F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5FA12A
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:19 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so13118655e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 13:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515278; x=1701120078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkMSBNYAvYCAc3X4q8qxASdZhZ6ecouGkRCIVe4XyTs=;
        b=W6CPFW2Fes5ogCaFKqBnyhIyeufYNOxLlE/r/Sdo5gMeWKLEFKz7kM6Fk4zum/xTn8
         ayfk/BvFNWAuXl+WJhX8EZmQUVIDJambUVSAWl968hUK38RKFxoyXfgwDhw4x3HyP0ZS
         MNdwO8q2MarggSY8ZoL1tW/smyZ1yjMKAQnslLqxOJ3eeuM4fz4c/wytQuRFaGtKiEtm
         oGey/silqi7Q/6KgrQhoBenpYVs+DavYy+JYK/3ubCI1evbcAYgCLsN3CgHQCCDpnSvt
         dBx955cuXza97FFxIIFskvbljn190qmskbNFXp9YLS7bRYKt+qlYBPWD+U/gKqRA94WY
         svmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515278; x=1701120078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkMSBNYAvYCAc3X4q8qxASdZhZ6ecouGkRCIVe4XyTs=;
        b=u+C9iXOSJBnjS+xsxi+gi1u4rVMnM5E1Q3jSP8oXThd54GV7zxxqExHkeUOEJwPvnt
         YM2hb/8FNXdVFvpPcUpuz5ygQmqfMvJgO9MVTxtQlMXu7mykXfHfWQth1E0cyjZroZXo
         IrRZRPL+PfefKBhr3IOYuA0jT0CInokY4/Dh4XvdopTM+Gwe3j/mMuSM8ySlJUveeSXk
         U7YZ7Tke+ftz6yedTKwfG7hhTKHQTjTVgkKXCrYHf0phf5BIX6odSQ0gxmtMqR4F6vpB
         gGYfqphTa1/EW0AUbC91uoL352C2n9QPN2+0T9NhnTFqH7Eybj+ZYAS+PWyMCVgBgaSb
         LqjQ==
X-Gm-Message-State: AOJu0YzVrfpwH5ynJdNGfJ/SXrLOP9I7jFj7uQuwKzudDcVfKTAa1O5p
	z/6NOGhnD59sPJsU3FkBu98WBQ==
X-Google-Smtp-Source: AGHT+IEJbzDcW7S5/GI1PbDI0zdEaDb2gaggZv2mN99zjWhskgR9PmElBCBPkOp59Dez6eQSpkYf2g==
X-Received: by 2002:a05:600c:1d1a:b0:402:ea8c:ea57 with SMTP id l26-20020a05600c1d1a00b00402ea8cea57mr602593wms.7.1700515278079;
        Mon, 20 Nov 2023 13:21:18 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:17 -0800 (PST)
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
Subject: [PATCH v4 08/19] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Mon, 20 Nov 2023 21:20:26 +0000
Message-ID: <20231120212037.911774-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index e32c1b462836..ccc3626779d9 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
-- 
2.43.0.rc1.413.gea7ed67945-goog


