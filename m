Return-Path: <linux-gpio+bounces-20639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 537E9AC675D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 12:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3695E9E368B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 10:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84494202998;
	Wed, 28 May 2025 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJZhipyS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724F27CCC7
	for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428908; cv=none; b=bROvWFFrE8p2ialZp+Qe4XUzP9Twt7WT+aSPGVj4FQgz0d2tFRiCNsFkLY9WZkYcMnIpGPx7cw621D+kJvNtWjG7aFPrGw7KijtshtUuD5PQwPpImZvybQC94JZ1kaS5hQIllgYW2d02666LIKNZ8eqnBNbrMpEKEaezDDaDJl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428908; c=relaxed/simple;
	bh=MF4Zmmi+u4TqsjCbXpvQp2nvOFecMjqOedfODYY8uy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P8D95RpfA1oCkVP4QbHNbeR9+QBZeht6KBcM3wHya6XRVftYttP7II1KRslahRtzvz9OaCsZ0Ewi3ctpJ6ChKMC1ikqpRQr8imqUK/FVZTK56OGmrbc2ovaqn17foqGVbOp7Ocb4uw029zXxQkrVOUVVl8TsqPenXslL4th++9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJZhipyS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43f106a3591so5000675e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428905; x=1749033705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXTyYXfzhcaLBKxfXPlEyeZbv/5uabWWatfOoXzctws=;
        b=CJZhipySimQD+XnTQ6AJbhBJcO9UBxPWhYs16O/QQACIL+XghReSYZjr1wpe06n64A
         8BnksuLrbwtlYFPyd5YQaern6wiMYFpJCBh4KqlXpjq6onTGntnGcAnmToGaPYhPHEnd
         2NXUu+knFXz9JuzTRaehFX9dPm4otPcWqlc+AglKk8jXn8WDB8oFroLS7yy8XrrJ/bLw
         WtLmI0fUsKuB8I4VJjp6BvvtHA0NWlFRCwIN7/g6GppvlqxZDpEpKU8msA5w3TN0g3SY
         qgFH18kZFuAmicMJr057WDanqzkWq+06qjYWwNiQ+qpYJ+r1IHzhr3dEnlGadYmubbhK
         kb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428905; x=1749033705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXTyYXfzhcaLBKxfXPlEyeZbv/5uabWWatfOoXzctws=;
        b=OwiTMPV/laE24LOGxGqdhJkIkc9e17Hud4E7BHZsjHiox2grUYNTLZ4RgfjhMagvnr
         M+ITVfxrtvNtuPJcyUvHftTiQqvCjm2EolS3jaWiXChztZmbIW8f4c2I+r2FnwZlEUj9
         zoPZaURpVtvI4PF8ARfDs9+0zRr+satpyc+RiCLrCChydVcJx7GuGd8DvGJfw5Lqmp3z
         HZWp4IrH/HjEXn/F5f8RaoKJTUx1rD/cJ/7sFM6I/L+MooPwjAsH5ht6NiQwmYob0d6v
         m7yiVs/2IDkxYkWULPtOHo2adnMSV2Y8hJpyJXYVTVi4x9bxgqzQKWHPvPG0z275volr
         Wu0A==
X-Gm-Message-State: AOJu0Yw5yuhJ/LRIDyRIyTwev4vwYWlL0Hnq0WPZZeiummTa6AEA48zb
	wF2I/hEzaFNs9uUdLdZhyaN87BS4z7uDShpliWfqHuP0J3VxicW11CWr5IFS9RYhXNM=
X-Gm-Gg: ASbGncuhADK+7JEgLGGIhVw/JFYer6neRa/M9i3L+LtcsmvIqyAfTiSALcP1sFVa/iI
	7mArXGJCs4RZq8B4S6nrEWAUJveXvDOvMH/i+BEoibQhQyFvHqmBEbwTRX0Y1SVBM7AtsVbl7dp
	F3Hg4jtWDAnp8v7oJwvla834UGGMUnKhgIbux7i77OUjbSWBEiEtzAl68ITm7m5Yt8Wd/q8Rnqi
	75hm0wYR92YfAjjUdqaxuY3O9FuH+j0wVuscPgDLmY9GxQ8zZht+YaeF8Z9lSKYr0s/6y89ZTcY
	ZCYTVjxhQDz7tgpg/ocstA6q+So5hTWyp1QwYVFTqFa+OPxhakzKMA3n7QBzvTCc5c9yXrE=
X-Google-Smtp-Source: AGHT+IEA4AZtTD+Q8/VZ37CChuwEWmOT9diS1X23uFatCSgyEJyQiHDJbW9CLfhnKvp4tXypbpndMw==
X-Received: by 2002:a05:600c:1ca3:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-44da83f6d0amr44456075e9.6.1748428904593;
        Wed, 28 May 2025 03:41:44 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:00 +0200
Subject: [PATCH 04/17] pinctrl: Constify pointers to 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MF4Zmmi+u4TqsjCbXpvQp2nvOFecMjqOedfODYY8uy4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhM1rWln/nmJgYh2DZGvcDXJy96iRpwljs5a
 xaRjo1vRRiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTAAKCRDBN2bmhouD
 1+kwD/4sLoK8DSjFqggVXP+fCLA7THgzjnyz01SNNQhU7wei18AGNJMIcztcrXxSfyqxOsE9m26
 3xg5l+2PdxSB/aq8DDcjAGUuJFfiBr3DwvtXD0R5kqT7fErKneCTZMHEKsRTA613sgxQPkSkGhH
 J/nz66172/T6EhiPm8ykbJpLrrLSP0bIpiw3gBRqdflxlVOp87//vr6xiRhNbUOUNl8PCfbw4/x
 rx6GcGsxg+Rvz6ZfnT+z8zCM0svA2OOEHA4083PN2qCPYPhBXwZFcfe3uZ1j6g8ffXzFqa38dxK
 ZjF68IuePkoK1d4gqwWgstkkZOM8nt1jmkeWXYEgArFoVEwhszCxEol5CUU92pK2+2OGXusBK4z
 yKgMiectIIR9hEKEqr8RNSIGh9O3Tq6jJbYzGMtEPquIlcMwffT+mMcJ9AR5rtDZ44ZYafzohoS
 gh0/zpM2FiR8p1YsHW/zv/yqhQlxrnLuGev7Lr1T6j3BBvWKyctkxVVEZN073tNnAGBN1LOkGMz
 CORCSWjImfC83kw3p6EIWSk/+DqNVIuiHgYGvVWVBuyvkC2Ub5q3jm++93XFBWuzqZvHsV2SeKi
 NQkNPhbiN+bdhnsEfdA+2Tw/GJwFn5p+4gQuKd0OMPkuSLxO7TcifBTRE2IZyXBfAzMnHvRFDjv
 KPmDdWC60XPnPvQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Pin controller core code only stores the pointer to
'struct pinctrl_desc' and does not modify it anywhere.  The pointer can
be changed to pointer to const which makes the code safer, explicit and
later allows constifying 'pinctrl_desc' allocations in individual
drivers.

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


