Return-Path: <linux-gpio+bounces-24499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE87B2AAFE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 16:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 951355C3527
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 14:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364BB35A28B;
	Mon, 18 Aug 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QoMj9hyO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBDE35A283
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527054; cv=none; b=LdcwSL9tXds9tfzQcK5ProrPYcFomc4HtZsRAQHYCNodwMmSh4j9VGX4/gcu+at1oujZWJTNdXhT/epQNR5Opv/j6n0U7PMtXN02qFmq5cdrrBx19L9uW0GJJYvkqe/5OrCW4rADlexCGWedMKv1xmcbkReaqh7NPb8DOglTi1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527054; c=relaxed/simple;
	bh=GQ5ftdYWjc1ggmTXk0Nbj6QK5jviPLomx0fpZtjccPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SU2livJgnzROPLUE+OF2xT6V57865Vci0pRZiXQV+n4nycK27B7PvZgRcqffT3MQEiXKQfyc7eODl5rLlcqltvnJWZQinfEcLZWCW0I2ZbMIQE9boA/uzDbAT1rG+1uns2W329ElJBdkmK5gXnf50cJhrsGlh+EjXRUh0cKANF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QoMj9hyO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb72b3a1bso76640266b.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 07:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755527050; x=1756131850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QamokhfM1GcyheOMdy3Zz4jkOrdWtl4wsYSaEK3Ivkw=;
        b=QoMj9hyOnlsba5x1RCnXKx7newWyshWX1ot+tb/73K9KyLlL4HdalFoO9PuiuRlmod
         LPeiT52VoRnLknov3b4xxSG+8mMZEpYeTsA1VVP+zPPVNLfMi65+nJB7uocPk8t5gbvd
         0oWPBH6CRIfbIGHlYpC4wnP4yVFZCU8ftgPXY9dthYoq2wXCmFvkhB6l3ODsfdPynaIK
         +Tyk+TY3X8I0gOKvoSjDNUnX+rO3nYP7AF/BxEcCmowLRm1gEl2q0ijlu6gACXjVxvCN
         3sXr0E7KOTXM8yV2hICwVXWkxaPmEkMGYRkyBIVvyGMgXkWivwQsflJj7njwful35Su+
         4bDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527050; x=1756131850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QamokhfM1GcyheOMdy3Zz4jkOrdWtl4wsYSaEK3Ivkw=;
        b=kfaObhndpcaacnUEdeeCxwZivDQmbhthAwJso3/RhCUiAuh8xgOQlmFoLOOvFjzFDe
         fs+u0oeVYP2iMdp8RoIpeejEeObfDzEmikYfbH1S6P8zs2q3r1QPZIuE24mvClkU25BT
         vRRtaz0VGwsgPQc6jH7iS/TLtvZUN9apgXxRRdl115ydoHV3e3t516RjL7ffZEX7yi3z
         Wjw4mvzZ3Bmi/iBDxj2/n6eRGPyc/WMBLfCdmnLhB8NFk4f+klvxk8CWFElCYAwdknHP
         FLIzI2u+pu3MnQdYMRi/8wcKsxKGApd24Aiixs1dyYCiGn2C0wUzL9PdYK2texkt8yCT
         fphA==
X-Forwarded-Encrypted: i=1; AJvYcCWJlOWKLrTYipzPqXjpmU8zhcsJGr/fl36TzSgSpGfDbkyu/Mr1Hvzy6Xadk4on+3jZusr8dvMEeHbg@vger.kernel.org
X-Gm-Message-State: AOJu0YxoD2t5XtFCBq0MUzsvlRL77U2Dns+tsDKKwUJck1JBIc9ywMFE
	lfOJr311FTtBbHGwL3pXP/poyQw7WPi+BDEsmQjxWjGsx5g/iCWQTMDmBSXHB/E5l7M=
X-Gm-Gg: ASbGncsZeJh9BnB8ODJp2uZxSvjVgvK3cAn26F/NqnsGRbEl9YIn5Kual0bEO/CAvF6
	qwLF2JJyij2DRS6pB4X4qdMz727NtPa3/aJzTnANh6Qlvv2EHMk7XmdZMX2FXC9WWYxGn/b+o0y
	rGXKYseyyZKJd5BfUEGVL8U4QpGV735d3MO531QEJGA4H/4raeMtyLmW/MM6R2SG7Lbmt5po7BL
	Ey9bd9n30w9hGkB331XkIsNtobcGbQ4H9WgiBws5lnvU6tJ884EOhAIHfp0PRdTRs3GgZkSBrr6
	08vGPlISHWUufDWsGx0FSneoXq9iT0OqrtAOC4g7yH9ANNx8lgMlLlWpu1QpBCnBJDeQXSAtcb6
	z6a9ne6ZJ4p6O/CpBE6lRDibMWr1+A52sJA==
X-Google-Smtp-Source: AGHT+IF0eQL4ER7n043LGZ/uWkPZXG/pygEg35URndrpoalaoUz4uPyviRVbuOk3OWfAjWq8XjlDiA==
X-Received: by 2002:a17:907:7fa7:b0:af9:566c:4cd2 with SMTP id a640c23a62f3a-afcdc2367a4mr462998666b.10.1755527049798;
        Mon, 18 Aug 2025 07:24:09 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53dd5sm803192366b.5.2025.08.18.07.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:24:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: stm32: Constify static 'pinctrl_desc'
Date: Mon, 18 Aug 2025 16:24:03 +0200
Message-ID: <20250818142402.132008-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=840; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=GQ5ftdYWjc1ggmTXk0Nbj6QK5jviPLomx0fpZtjccPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoozeCHbXUKSjJp2DSxgX9G/1zAJfSI1ztiFFmO
 GadvdBbwOOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKM3ggAKCRDBN2bmhouD
 1yoED/4kiZrB9q1OBGXP/IDolXlLyozFqO4AV9Emhx7w6pECE6srTXNW0Io7CnrMi0NzZMG58Ok
 fm+15O1C8b/juIQEqd21izzXzrGo27C3MZyD0BRrXqiwig7D2md0Om36cPq5qhacQ/zDmTpqwre
 RB3kZssnYEetCx0yNNlo+4FilIdI73HUOLBe7NjhjdgYyinQ1CUFjyQBrIkfunSZqcBZezmsQ++
 D0K40lIyY0h5nBjRIKpz+x6o7wDitTdHR41tBju6dC/iGlvLJy+EEOpTTi8OuybUdMZTjyXH+AW
 v3l7+uSupThYNKmIPHmI+dgJTg6wYmF+RRwgTwlKOIVSkrjSK0qlmYJxDubNzMVhPGQtLju+zZf
 yrapLhuKFH6b2QE3QQigfWAWcilF9rdt7gD/mr8FljvXYBKtQVazVxlky4pZWXtJnk0acqX4+bu
 JRmGZ08gufYi08WEAQ4Fbq4ef0x1HR4/6epHh6Kyf033ep138BhgWHGz5jinmmwQmCTJPowT+Iu
 ZRAS5U1JPvwEAQHEQsFTMttnyATQyBPYpJ7NZiTc+QJMTnYhxHhQBnpIrcUZuQ8gjf9Aw+NoO5s
 cCDK8474FZvZaoSSTtwZPWx9SuZLQQmpjUT5Yjad3ZHNO4LYiv5uT/wfKA8WZczUAJ1ziod5OIU fbYKk48w9jEUxLw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index e91442eb566b..0cd41f3f7a52 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -575,7 +575,7 @@ static const struct pinmux_ops stm32_hdp_pinmux_ops = {
 	.gpio_set_direction  = NULL,
 };
 
-static struct pinctrl_desc stm32_hdp_pdesc = {
+static const struct pinctrl_desc stm32_hdp_pdesc = {
 	.name	 = DRIVER_NAME,
 	.pins	 = stm32_hdp_pins,
 	.npins	 = ARRAY_SIZE(stm32_hdp_pins),
-- 
2.48.1


