Return-Path: <linux-gpio+bounces-24396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B5B26EA6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 20:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08F7C7BB58E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 18:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7120431986F;
	Thu, 14 Aug 2025 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="NwSUjG8y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131C319847
	for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2025 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755195167; cv=none; b=H7nH/1am+zK7uv3M2eYF6WDLNwqiFYibtGiCM8qoDgdwwYe2rVLaUE40uyDLxt5FkUmy5+QFUytT+eSLvhFFbveooXJ5JQyzRhmru+lh21jzzhfkqVv2DxG76v/MeUXNF4+F1nc+p8vHdJ/+QoczyiDVvnaCGKv/lGPy5xWGVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755195167; c=relaxed/simple;
	bh=ixFsJ3RPHuU/BU5W6UO6O467skwYcxEo8e5gerlA/Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBwh9/JdlGLSKurDs3CZgYcyWzbKXnngfjpyRHUv1Pxvwf/e0Sak//BBCtUrSYVc2ND8wXEwBNaqdGPgjWDk+weMizq7DP1gRbOWZqIjgdRfJ/3y+HHVfCO3IxmlsXCW6wWO4DUQ5L+pcCQ85w7TsG0N6AxFtcQZGpnFx5r6zF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=NwSUjG8y; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e87030df79so123648885a.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2025 11:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755195163; x=1755799963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4/dZvvhdpeV5T70CXzzhIM2ftvucviNjA+HOyZU3hVU=;
        b=NwSUjG8y5m02ew1jaWglQPvBmFJzJ9KZcTQUsPdCdmiMyXw1LdvDkT2Ey+DO+oj18R
         KLGaHh1pTZecpNBsYl3xi9WT0ibZ5ovLKlMRJfPstzT4TrD01fQk1ZXUVZrCWExzWDwT
         7/Q1r1Ftf67AEJP1qM4Qlrl5rQfcax9/cd5Oa48OqhY4YUk8B8qTx7cg/dTuZN27TgQp
         tK7AdSV8bwQJPrnCmWBxp44PsxIGiRtf8W7AxYS3odPLdtAlixHWLEh4J4FuZ4PlnZFe
         neRgauxt+CJvc+jA+WVV7pm/IcMGopnTpeRQprLv4M6Q27IM6Dlk/HFoqA/AgOS+uv9Q
         8iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755195163; x=1755799963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/dZvvhdpeV5T70CXzzhIM2ftvucviNjA+HOyZU3hVU=;
        b=ArCt7RVWKcJ0dkjShXCke5sEYc7TUhwfjhm66thNfS3N+eb7WzeMh6/lug005t7CHl
         +Qh78B7onD+36GDQmLFOYVUoroieqMXJ9J9tmfCsjJ6fkceSNSejtMyxabvOReA7jzHA
         sjFig0dUn3A5wJtMCt76ARb66kzhJkWWITy4o6FWCux2zBxb5yy9O7MQU2eyeW82Kf6i
         C2zpSlEt7ckT9AsrWaNA2WjYOmCXz78Bbgmxoj5NFXq5H/SXjoK1gQOjtwimbbjsy1N8
         ceyheocSZGvh/Z8D1SGtAEkxt1rhHSsynUTBCCjFZRfA7p6uHQyvPIkoyDBB5h8lPBV5
         io1A==
X-Forwarded-Encrypted: i=1; AJvYcCVuQ/HuO1tjtDimmVjuhLFZgF9Lm1k3v9f3mtKOp+mNLKusWsxSCwGCtV50munKTFpAzYdNi2xmHleP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8j8KXq5EKXlkjC1KpaYDsnPtD5d2BjOTygz3SLbs/N53Zyv8X
	XIIDg9mHKnrYhBfU7/597b9fXIQsZEsD2Hb5R2DpGtpMa5SMcxzUAnhgc/i6h19Pgg==
X-Gm-Gg: ASbGncuxolgFxi9baaDKcgCbe5HOq7nhOn9hI6k5GJvW+okDeN5Q7JdGkLuch3L9ymG
	4iwliAmS0eep4GJlL01oNGtTRqk1orL4Ajf3fV3HhLejK5LfVYJNb26zNnRZZmFK1PxESNRmnmK
	KGHe0jjY1DENmD2aKScSAd/mS2yfZi707h40fHyUzlpDjt7kzIzqyfXUHY1XVztc3tyvbckA8WB
	/YJr0D+96/bi4zN2Cs8AjNcTTRdoloRWI8ViHQVfzun0C0Lh6DwZBL5yc8HCN9ryPYTJalzZ8ck
	xnAi2XRq14GAGvEuyEBUfW8ad6yrv5HzGW9jGCDODdRfIyyitXb37KIfjT7lvYnMFuondJ5+fE3
	zLNvwMaAxDUIOlyD7cr5z4j6dFxM=
X-Google-Smtp-Source: AGHT+IHZet1Jvv8jg99HpAw6hDsF8fx3/AYC1SN8lGZ35gs0uFt1zck15oaDyeVmE3ge8wvu7oeH4w==
X-Received: by 2002:a05:620a:4055:b0:7e8:2989:1149 with SMTP id af79cd13be357-7e8705b5fa2mr627043385a.49.1755195163315;
        Thu, 14 Aug 2025 11:12:43 -0700 (PDT)
Received: from localhost ([172.56.29.94])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-70af5c43392sm16269836d6.84.2025.08.14.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:12:42 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: meson-g12a: add GPIOC_7 pcie_clkreqn pinmux
Date: Thu, 14 Aug 2025 14:12:36 -0400
Message-ID: <20250814181236.1956731-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amlogic G12 exposes PCIe clock request signal on GPIOC_7 pinmux func 1

Add the relevant pinmux and pin groups

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 8b9130c6e170..117e72b4ffcb 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -442,6 +442,8 @@ static const unsigned int tdm_c_dout1_z_pins[]		= { GPIOZ_3 };
 static const unsigned int tdm_c_dout2_z_pins[]		= { GPIOZ_4 };
 static const unsigned int tdm_c_dout3_z_pins[]		= { GPIOZ_5 };
 
+static const unsigned int pcie_clkreqn_pins[]		= { GPIOC_7 };
+
 static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GPIO_GROUP(GPIOZ_0),
 	GPIO_GROUP(GPIOZ_1),
@@ -721,6 +723,7 @@ static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(pdm_din2_c,		4),
 	GROUP(pdm_din3_c,		4),
 	GROUP(pdm_dclk_c,		4),
+	GROUP(pcie_clkreqn,		1),
 
 	/* bank GPIOH */
 	GROUP(spi1_mosi,		3),
@@ -1183,6 +1186,10 @@ static const char * const tdm_c_groups[] = {
 	"tdm_c_dout2_z", "tdm_c_dout3_z",
 };
 
+static const char * const pcie_clkreqn_groups[] = {
+	"pcie_clkreqn"
+};
+
 static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
 	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
@@ -1309,6 +1316,7 @@ static const struct meson_pmx_func meson_g12a_periphs_functions[] = {
 	FUNCTION(tdm_a),
 	FUNCTION(tdm_b),
 	FUNCTION(tdm_c),
+	FUNCTION(pcie_clkreqn),
 };
 
 static const struct meson_pmx_func meson_g12a_aobus_functions[] = {
-- 
2.47.2


