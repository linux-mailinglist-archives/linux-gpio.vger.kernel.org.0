Return-Path: <linux-gpio+bounces-18237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A883DA7BC24
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 14:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85BF03BC195
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 12:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8CE1F1525;
	Fri,  4 Apr 2025 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iu149ib8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FAF1F0E59
	for <linux-gpio@vger.kernel.org>; Fri,  4 Apr 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767848; cv=none; b=MENvcXdxWal0+jBad/IhWriUCQ2tziezJlXHROg4X3iMTMEas/el8ENQy8ip+zCZMcz40gROnguAl9ynsQ2QPkI3Smq+ookiaowyD9H71lopH8lGV0QUu/D3aD3ePSupS6TrnwTeVy54KtTGH1gNZl+9qrF54sWXk/eXCknC8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767848; c=relaxed/simple;
	bh=f5+Z3NxSd3MuBNTouLvShUVcveuEqAlNOVOD9G+dzxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyMhmm9Me2pHxxO4xjN10BufXNXd4BNTAgWAPkF/frYzJ2kJd5l1w6y1vxZQb5HHi9o5cxbjL0UuWw4zZG9iaG5X/VRZ5qAdZI5JrCfKIuHS6Uf6quPwoQpNwg12Yn6tvM0raYBJmCamWiZr1nsODFu/3ZsV276WYAy35cSS+tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iu149ib8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39127effa72so177502f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Apr 2025 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767845; x=1744372645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7FNE7uW7CqflTfCGo1n2418876ImE/7n6IUCl4015U=;
        b=Iu149ib8On0f8AYOMN3K/oNF8Mvwann0+MzmD8y7xThXE+Eut5ej8ZZMkbY8dnyrPF
         t9jfFOGeWABPzeEab+5eHa0YPbDZ4bPUQp31Op7JQTJd/8iKZiadXpE7ey7Vxp4AkBRZ
         lBg6413kINlqHlHhIVcKao+GnJftIVde8u0diD40hDrdeS1OT4cgZ3MMLlpyhhDSmD4Z
         fO8+gRPPq5Ttn3RtzEe8zBtCWhaL/+yG/yHzFqN1JxM/g74+uviWXtDvR7yPmJY42uw6
         TJbQJbzvuJcgazVnN/p2kmdzGkaixwAHTAWihkGEtjR3U/6RDm6C0Ao41kgF79qZmFur
         92pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767845; x=1744372645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7FNE7uW7CqflTfCGo1n2418876ImE/7n6IUCl4015U=;
        b=N8wwmbM0mkDq7Gl09jd8Q+is9apqkiAM48A2IOvg+2ZtHKt8qkJ3F93AxiILmv0ih5
         YMeFNi0z8F18rI5f0kmwl9yTF4FFbmSjC6HHhnVvmVbGwMfUzsAQSGjxMMYTXl6hKULN
         A7D/AIssmHR1USC3N8A94VuPPJbY9fijPXsX0IIS788dT40wpvLqsspD17Pz6ZonGkVz
         Yy1Zpbk9cM7j5LO/KRu9qgNRml+z/XapEhkfgqJRuilj1bU8oIRre6JgIlHGe6i7enuR
         ncTWlLwu0eRTSfH39dpDkba9Fk2kDDO8npMlOKKQcP5hqLZvXuAdJRS2bsSPsKrNoGhn
         PhWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJivk348VFtA6bcDfbtakiFsBUvVKKlxFAscu2gJUeVpEhNVPEH19hVtJBnKBKguTyRf/NI/FygFJY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd4zoJxr7/j9NImylkWg3ZngW+J2XdKUIBftDJD8pTS7U3Ba4Y
	V0Vyod28vSg4j20Rgx0RFtrmNnYz8iiBpMjZgAsR9MCwbGvKuJTo1jo2nxvane8=
X-Gm-Gg: ASbGncs0fzvDbO3m3n+F0rbPPzyMkAxUibAuvb2/ZRQkCXze7ZwqX5Jbg7VE0V1maah
	uDHjQztEwSGFy8AvyP5rKWibHY2W7r2bPrk25dJgilrpS01jrl/sfuPXsN8nDfcRTqs/6P+eom8
	i0n8wI1Vu/KBmqI/xpuvxN0GY1rPnPTJeRjDXrFGFqE0mprwbqnMCYy5Y9K56UAuyUKTYHo+rHn
	wg7DGBKvyby6T9qR1v5gq5W6JWeQPhLH8BOl88txb0bQPtVL+Tk5hRyvYgN63I5dFT92SFuoj5u
	f3V3HAhGLhcciAhjM+YEIuLSWqp4yu86wbtT8yP7jdUXZVFW22OoAQ==
X-Google-Smtp-Source: AGHT+IHBtV33JgKfAEZ/K/Z3eAGyaEe//CmaN4daL7d9M+mX3ZcQYu8+eSe3/MU83jWvj/2V41Xy8g==
X-Received: by 2002:a5d:6d81:0:b0:38f:27d3:1b44 with SMTP id ffacd0b85a97d-39cb357b616mr910662f8f.2.1743767844740;
        Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm4209455f8f.60.2025.04.04.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] pinctrl: uniphier: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 13:57:19 +0200
Message-ID: <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/uniphier/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/Kconfig b/drivers/pinctrl/uniphier/Kconfig
index b71c07d84662..5e3de0df756b 100644
--- a/drivers/pinctrl/uniphier/Kconfig
+++ b/drivers/pinctrl/uniphier/Kconfig
@@ -3,7 +3,7 @@ menuconfig PINCTRL_UNIPHIER
 	bool "UniPhier SoC pinctrl drivers"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
 	depends on OF && MFD_SYSCON
-	default y
+	default ARCH_UNIPHIER
 	select PINMUX
 	select GENERIC_PINCONF
 
-- 
2.45.2


