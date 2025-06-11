Return-Path: <linux-gpio+bounces-21304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402ACAD4B0D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B62A3A5A3B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4733022F3B0;
	Wed, 11 Jun 2025 06:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="otRAjlOK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B40E228C9D
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 06:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622467; cv=none; b=R07btvIiNfA5SszlvwHnLZOTUAMQma6jG0SUzhrKLVXTookj69rpnPMxDp82s+le7AXe5SR6bRxalTJEDxKzlIHQ/7mFcYwPdv9Xi9rFCn2ExM/bIJqHx2+ZF731IPDvzpDPdFkQ9/7q4Vla4i6o/3FlB+6h7J2pLPOhXZ2mut4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622467; c=relaxed/simple;
	bh=nR+2FS8PYTwR5NQQoTqx9iHRdQvo+vV4Iua6AqxT5Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ej6wE7F+BAQC4v3pLi/VRVU80drPaqjdv1O8nGuQqw7TLdgs7E2PDDU7OqmOpkaVztxWrUNMm70gSj5UW4hMEVvGi4Vg0ORayjdH5bd0fwIK/57n3SyH+m3snFDoDxDwdNupgyqvfEO+2TtUHvpGPvnYIB+yNFWzZbbqxQ5Hoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=otRAjlOK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso409575e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622463; x=1750227263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecu8yupT+rCBH08RZ8e0dqpuzlN5xMN0SV7HkCMJ9k8=;
        b=otRAjlOK4zKkyejCfvh3qXBIUg+MbJBqaqGOrEfA7OfkJJfOTTvgG5toU//2rxl6Np
         uV5HTyZWA/ipWd20J4Cfs+eU/wRvIrTC2HOl2csXZVqGewn2l7GGU+UnvHx2yku4rZaJ
         JvY8Jri76MulgtKiT2oxbVshefGwk3ysc3OG9ggik8NplX6w8dCTJi4+jtJ9ZkCHHCy1
         Mo+L2MPaxzof3K7exm7rhtRZcyVjZ8e+LG2u9H48mpeh9dCBI3c/ldBJyEbNJIv57G5E
         k1O3dYT4br9PgRtPej4VxvATVt3/gMTPT/RoD9QoLQd2b7FFVekdGXsYGefjPKXfhuft
         IIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622463; x=1750227263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecu8yupT+rCBH08RZ8e0dqpuzlN5xMN0SV7HkCMJ9k8=;
        b=ujZpE8SBtVr40t+NkPlidGEaDArbgcMHwWOkcLQsCSazdas4B1fqYj2EJ8nmldvHKT
         ykxhylKqXrcS2ftSftXHU5KXQCB6UGPH7QuQt9VRqTeGyZO9TvH6cLM82LyDBf50KNdz
         85CBrugbJ2hed3n/yjNhX1fgE2WSEkw1MCRcpWUvBlZHS1i+OQRT77e/orBMNq0HJOSA
         v3KVWQTA5j1vvMqjYMmIvteUaDDNZ3ez2ZR3j87KyD52sGmJ54WJt16ElLZ/WklFIQQm
         XrX/Mgcdvnzn4BhHwrmvrJ6uVoKd2NA5gU7tNIpblDm0dpPtSdocTk0cCpqtIjqCxIsG
         O8Kg==
X-Gm-Message-State: AOJu0Yx5CfsBuQlXliKSD2CdOUg3dSDsz1rHLUcpUcDc1lUUgJ7wXWAj
	IoZWPtZ00ou8Uc866OLX4JF/GdGbmKMF/pMbFjlbe9DFgUJ+ZRmRMwvuL1uynBlV+WHpY2G/HA+
	A8+li
X-Gm-Gg: ASbGncsLQgebtn7u+ryfu4iNjfa43Sq+Ra9aMggfcXFbGrWig0Kg687eqg/2zFMSp7/
	gJz/NPRJOwn/+xouEO7Y3A/5Vvs1l3CouKoSkw6DhLB18DZMWaWE1jYonw06yDN08E7pe3mBOTE
	e6lFq9Lags+D4bNdvJrBHa12n3l4liE3HjE2l/xoKpL4ocAhyq43iRfWCMvL/fgJTvmZf0j3Mip
	gJzUqAzqdB6Q/ZOxRHfWkstGAizXYWW2XUo+VfSRSJoz4kZjqnEDlJrwnym3Au8EPBSEZFi82ka
	byiKaJLhBRuTIOZt0N+jLr6DJ9dN0n9JHPfPOfuxM7mJUqJxr2DTVz0CaGU8ohtxM8oZ0oX61gw
	9qUdkzYQ=
X-Google-Smtp-Source: AGHT+IFfJgestylyWWTFhvNWZXRgEjP+auivw4jI2Dh1LfZu2fjTV+4EOE/BFvcRpTxAjjUQnLhlFQ==
X-Received: by 2002:a05:6000:2088:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3a5586c59cfmr506452f8f.6.1749622462916;
        Tue, 10 Jun 2025 23:14:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:36 +0200
Subject: [PATCH v2 04/17] pinctrl: Constify pointers to 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-4-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nR+2FS8PYTwR5NQQoTqx9iHRdQvo+vV4Iua6AqxT5Nc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6ikhHWTfLaUx53ErHmCNvMDtuwZ6lVKR4RR
 0yG94URNwGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeogAKCRDBN2bmhouD
 13d1D/0cTiL0nPIVc59aoSJVwhVV3NR69H2ygZw5k+q2RV7dSayB/i8dGfZgnZHJiG21q1xVLex
 vusrPMcisMsjokc7a7W0t0dTxxM8FS11ivjQfeWUutmL7xCo9FjTJC35TamPh/eTK3IbJyVpVEv
 DQ42DQ7ogisRRN8V0a7C5F62h9jU8rsNRdRWMfEAVoIWlaRQKdFms4jjazFWDVtLpIWq8WRZq9L
 gF5gELsOUj8CT8CYb8R+FoPrSvCtU+A4O4EXwm5TdHORWpbU95IfR20Av1HUyK7tad6COn3Jmwi
 3Qq8ZVpD0rdjEmlLZ+HIwdVO/CBSMjGTkQCcycSK4I47cc22MDLVQdsTesZpi6d1xdninpaaX7L
 PoOfudghYpHzaziiwHv7cgMyr7WARCnREfTLLqOYjgxbklA7EvXpIkQ9VmFmEedee/wp3Mq6sTT
 kyIhkCXj/eanf82v/IOnh9Fp6IThWVBU6RGuCWS0bepidD+XYDMj01M4a6petC2k2iNg8q331wq
 U0NPQBNuLmfidJTf/A0acOYAvSw33H2S1crIvjNMY3KJ4kfiWeNpLYeFPaCebi0ig6NZxukpRa1
 RiMOrWRAyJmV2ZuPSLFvbxxocjhYKp3U4q+/f5tMjHmqP5tB0i3qvrjO7khJC5XWUoZllIcX3lX
 wmRssquEAgIJxkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Pin controller core code only stores the pointer to
'struct pinctrl_desc' and does not modify it anywhere.  The pointer can
be changed to pointer to const which makes the code safer, explicit and
later allows constifying 'pinctrl_desc' allocations in individual
drivers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

This is the pre-requisite patch for all further patches.
---
 drivers/pinctrl/core.c          | 13 +++++++------
 drivers/pinctrl/core.h          |  2 +-
 include/linux/pinctrl/pinctrl.h |  8 ++++----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9046292d1360218bc70eff418fb8d1028c22b11a..73b78d6eac672095c8556763af1744be6f558501 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2062,7 +2062,7 @@ static int pinctrl_check_ops(struct pinctrl_dev *pctldev)
  * @driver_data: private pin controller data for this pin controller
  */
 static struct pinctrl_dev *
-pinctrl_init_controller(struct pinctrl_desc *pctldesc, struct device *dev,
+pinctrl_init_controller(const struct pinctrl_desc *pctldesc, struct device *dev,
 			void *driver_data)
 {
 	struct pinctrl_dev *pctldev;
@@ -2132,7 +2132,8 @@ pinctrl_init_controller(struct pinctrl_desc *pctldesc, struct device *dev,
 	return ERR_PTR(ret);
 }
 
-static void pinctrl_uninit_controller(struct pinctrl_dev *pctldev, struct pinctrl_desc *pctldesc)
+static void pinctrl_uninit_controller(struct pinctrl_dev *pctldev,
+				      const struct pinctrl_desc *pctldesc)
 {
 	pinctrl_free_pindescs(pctldev, pctldesc->pins,
 			      pctldesc->npins);
@@ -2209,7 +2210,7 @@ EXPORT_SYMBOL_GPL(pinctrl_enable);
  * struct pinctrl_dev handle. To avoid issues later on, please use the
  * new pinctrl_register_and_init() below instead.
  */
-struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
+struct pinctrl_dev *pinctrl_register(const struct pinctrl_desc *pctldesc,
 				    struct device *dev, void *driver_data)
 {
 	struct pinctrl_dev *pctldev;
@@ -2239,7 +2240,7 @@ EXPORT_SYMBOL_GPL(pinctrl_register);
  * Note that pinctrl_enable() still needs to be manually called after
  * this once the driver is ready.
  */
-int pinctrl_register_and_init(struct pinctrl_desc *pctldesc,
+int pinctrl_register_and_init(const struct pinctrl_desc *pctldesc,
 			      struct device *dev, void *driver_data,
 			      struct pinctrl_dev **pctldev)
 {
@@ -2330,7 +2331,7 @@ static int devm_pinctrl_dev_match(struct device *dev, void *res, void *data)
  * The pinctrl device will be automatically released when the device is unbound.
  */
 struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
-					  struct pinctrl_desc *pctldesc,
+					  const struct pinctrl_desc *pctldesc,
 					  void *driver_data)
 {
 	struct pinctrl_dev **ptr, *pctldev;
@@ -2364,7 +2365,7 @@ EXPORT_SYMBOL_GPL(devm_pinctrl_register);
  * The pinctrl device will be automatically released when the device is unbound.
  */
 int devm_pinctrl_register_and_init(struct device *dev,
-				   struct pinctrl_desc *pctldesc,
+				   const struct pinctrl_desc *pctldesc,
 				   void *driver_data,
 				   struct pinctrl_dev **pctldev)
 {
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index d6c24978e7081a663b8a0fa6cb9314670575b1bc..fc513a9cdd4f2f9dd4ec4a088eee53fdbd673285 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -51,7 +51,7 @@ struct pinctrl_state;
  */
 struct pinctrl_dev {
 	struct list_head node;
-	struct pinctrl_desc *desc;
+	const struct pinctrl_desc *desc;
 	struct radix_tree_root pin_desc_tree;
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
 	struct radix_tree_root pin_group_tree;
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 9a8189ffd0f2c28c88640280deee194d17d18400..d138e18156452e008f24ca06358fcab45135632f 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -165,25 +165,25 @@ struct pinctrl_desc {
 
 /* External interface to pin controller */
 
-extern int pinctrl_register_and_init(struct pinctrl_desc *pctldesc,
+extern int pinctrl_register_and_init(const struct pinctrl_desc *pctldesc,
 				     struct device *dev, void *driver_data,
 				     struct pinctrl_dev **pctldev);
 extern int pinctrl_enable(struct pinctrl_dev *pctldev);
 
 /* Please use pinctrl_register_and_init() and pinctrl_enable() instead */
-extern struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
+extern struct pinctrl_dev *pinctrl_register(const struct pinctrl_desc *pctldesc,
 				struct device *dev, void *driver_data);
 
 extern void pinctrl_unregister(struct pinctrl_dev *pctldev);
 
 extern int devm_pinctrl_register_and_init(struct device *dev,
-				struct pinctrl_desc *pctldesc,
+				const struct pinctrl_desc *pctldesc,
 				void *driver_data,
 				struct pinctrl_dev **pctldev);
 
 /* Please use devm_pinctrl_register_and_init() instead */
 extern struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
-				struct pinctrl_desc *pctldesc,
+				const struct pinctrl_desc *pctldesc,
 				void *driver_data);
 
 extern void devm_pinctrl_unregister(struct device *dev,

-- 
2.45.2


