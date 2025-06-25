Return-Path: <linux-gpio+bounces-22175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C4CAE7F96
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 12:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88F171BC4C98
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1537E2D321F;
	Wed, 25 Jun 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V/TJAhTH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD662D239F
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847634; cv=none; b=fLBEZM/uu6j/gHdAAlyhtiHj0no5YtLLVzVg09XwfA95m+XIfMeoXHd3vRvgSFYHVE+rc1NzNCUt5hgA2sDgd2lMERRaL01Fkh3BsuoBIrmpIkyCj+xtXLHqZXcFC9G1AWR5WlaYYGp9BscWeuKe7kwkLWFOymWtI7vG1G0HJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847634; c=relaxed/simple;
	bh=/R5v1/odu4+g59x92l+r8Nz1efWq5aExO8tpI+Nyoc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDRi69mKIMwmiKkD0n3WP1to1JQsPMldB9/BsDfz18GuTjeUCb9SSVcGlOl15JgJoHyhma7A/B4mM18nMXsQHDEi6e3CySO0uoeeVyF3gdu6YnWNnoJZqj4mzOEIGSnaieh7UO2o+3gpTUM7ahtmPRAnlTktz8yIoxwTm1BLXIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V/TJAhTH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so506584f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847631; x=1751452431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJHIuMYrWN8IdFB2bnihanEiItYdX6hdAm3LOb4QX6U=;
        b=V/TJAhTHTv84GoEU5sFBIi5SB5XrT/yZyyTRv6i+UBbLSFvylfEKOL4wxeTfRt+qHb
         VXt1LlcnkuPDDFmfHilHB+Q1rLhMKDFbxQn3qz3RMawU5CaYK4dMtamV3TgdcJilO3AG
         rQVKarckTgBqPbZ+XaseNoL2tyljQRhqWp82zR5CnnRstwwyyOvOd1L0R4ukN4Y5PKq0
         fBrhzbP8osYCG6kDOUWt8yA0dJ4UEuef3K/oJqAgv79h0NBsC1pJCuJVJpq/YQOquqrD
         tE14srabErRJMbws1PaSnzQ/IOUqJHFM5Ky0iiRCmTTawOMzNtU7Kio4zZkKzNU4mdot
         2RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847631; x=1751452431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJHIuMYrWN8IdFB2bnihanEiItYdX6hdAm3LOb4QX6U=;
        b=QvSm25fgGjDWRy6y3f1A9ZyF/hFsanPo24FPHa7KNDiJHwtPgqu00eCQJHna9/G/Qr
         Wxelpokc3s60UBFyibI12MzZMzodH588MGUpRbXovdPUO5DnMDuhYX5tbxeg5ecDPeKp
         DA2+LOoI2oCJKwMBpW24QaFK/sqOxIKOaTahq3Plg+V/u7xK0sNiREm9wZMG8np/X9n9
         KZWExATbHa/IqJvfTMbuip1m/o6bFwpFFIez0VBxj6dOK9C1rD4dtkMCC1wq4GyZiBI/
         pCC7EfL0Foja2NVn+IVxPZX9Iwgdnc3JtEvhtJqWiNBKSY4G95o/3gFlQBdhdieokYYt
         YKJA==
X-Forwarded-Encrypted: i=1; AJvYcCUTn1Nm38DJ3IbYSyYti0fqKqoDEz4owdxXI7QGRFqxU3Ueh6sx6iWRnNfvIE/l7/sMdaarWmDkTjNT@vger.kernel.org
X-Gm-Message-State: AOJu0YwQsM6xvb1WFo31gosg89q6/Hj+LH+9shZ+oSilvmg2WRoQsRj1
	CcIqZgib6ZJZmC4e26MsfGdzRA84ZCgQum+Wtod2ZKuEgUqS3v8QFAIB17fKKGwiwupC0N8fiSw
	S3WwBMP8=
X-Gm-Gg: ASbGncsvMnFIehS8rI0592g8pWsId1prCcL6fpqmuZP0ECMwGeGfOuXFXVZJ2QX3Wgk
	p56CKy9MoQ0sSgT3u5ghF3Swlnd5rCVXtzIwgCwsx6jsrK6tSyVScvm48o2ros4lph6U5zGCJ83
	QHpFvWojXesYgdZ1cKVT0pGvQ2rj2btSnJzn06mFoReMAv33Y4HlcGc8jMHpPrzAWaysjPteoBW
	86dKr9R3y+JYZSTTRaNRCbHOG1Yh0Zg0VsFZaGJvEHz2b+CaUVpcgD+Gdy79Tar9K/nQmGdlaWz
	jK+TtdJFzQbNYzos2auExlrXFTkwmfw0xrgfsEAiyaM3Uk9XmJ7UAYnM
X-Google-Smtp-Source: AGHT+IHVlfqB4inzXZzLgekCnTIjuihgVCYxGd7tprEn7YokvX3NE5HXPw4UxnDwuCjQPML6+E/5Fg==
X-Received: by 2002:a5d:5f92:0:b0:3a5:25e2:6129 with SMTP id ffacd0b85a97d-3a6e7206741mr6336631f8f.21.1750847630882;
        Wed, 25 Jun 2025 03:33:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:33 +0200
Subject: [PATCH 10/12] gpio: syscon: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-10-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4222;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sjfHOc+5FIElw6Tn67jgDQmefJjmNImROrNF3EFqBFg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CA83SVJti9vEV1Z0Jj0mn5RsqIkTfAL4+Q6
 qHpliBjLBKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 cmakD/0bM1j6L2o30Tp+dbPHedW5MlBncI7X9OnpYlO059zCAtX6weW1EA7auFfb0pdgDrfc8ju
 9P5nzipoqm1g9uh5EW5ZdT7ZJoaL0KAOfmZNC9NMTIotgDYZkC/9K7W7ZJtXNYQiofJYV47yCOZ
 kL4vOnVBZPiaEyKO0xFm5x7OUnV3dVCovfICjZ96PuxIInIlToYVDkR0g30XRN2sigYYgNdtCIE
 kerUi0WQNQt5yS4+00WCichtEFr2W/q6AlgHPAoQ/WLm2q1Fs+eUj6D2HCIVFCfNXrMepgTYmHZ
 FdAGaF9VjhyPnlgQ0zSGcbmIXVlYkf6+/iicvTtJDzo69K4mh1b17ZLpIqg5UMIqOx7LjhijbfO
 JyQfwsyWY2rZafQjfgE5FrfPlKPGbzs+EiYzCdlYrO0mlbq4/UByZXeNRZ3LOOWOcou8CZQ74kd
 XPDPaP07F2vdEPMHkbRs2gfZ9dfQdnayC0IIQnzR13Sh5nrdUW2YtalxOl12QBXSWNfkCsDRNfW
 +F2WqxK7s67FsSnl+Id/m4j6wu+PqYDnwxHKdTXsaXCw6dCmHAF8J2qY3udEZcemFhsuR3Kwc/g
 2RQ1p2buy65m4uB9eJE9W4PHCBI/Z8niJDMCY/e9NZMH9aqqOAj44pwau4RDrH9m96Q+0L7S2pJ
 vIUv+bZN/Ve660A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-syscon.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 5ab394ec81e69beae2080a3ca7ecf35868e79abf..f86f78655c2420ef91f1248653b4943b5d8ed1c0 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -40,8 +40,8 @@ struct syscon_gpio_data {
 	unsigned int	bit_count;
 	unsigned int	dat_bit_offset;
 	unsigned int	dir_bit_offset;
-	void		(*set)(struct gpio_chip *chip,
-			       unsigned offset, int value);
+	int		(*set)(struct gpio_chip *chip, unsigned int offset,
+			       int value);
 };
 
 struct syscon_gpio_priv {
@@ -68,17 +68,17 @@ static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offs % SYSCON_REG_BITS));
 }
 
-static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int syscon_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
 
 	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
 
-	regmap_update_bits(priv->syscon,
-			   (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
-			   BIT(offs % SYSCON_REG_BITS),
-			   val ? BIT(offs % SYSCON_REG_BITS) : 0);
+	return regmap_update_bits(priv->syscon,
+				  (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
+				  BIT(offs % SYSCON_REG_BITS),
+				  val ? BIT(offs % SYSCON_REG_BITS) : 0);
 }
 
 static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
@@ -115,9 +115,7 @@ static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
 				   BIT(offs % SYSCON_REG_BITS));
 	}
 
-	chip->set(chip, offset, val);
-
-	return 0;
+	return chip->set_rv(chip, offset, val);
 }
 
 static const struct syscon_gpio_data clps711x_mctrl_gpio = {
@@ -127,8 +125,8 @@ static const struct syscon_gpio_data clps711x_mctrl_gpio = {
 	.dat_bit_offset	= 0x40 * 8 + 8,
 };
 
-static void rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			      int val)
+static int rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
@@ -144,6 +142,8 @@ static void rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			   data);
 	if (ret < 0)
 		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
+
+	return ret;
 }
 
 static const struct syscon_gpio_data rockchip_rk3328_gpio_mute = {
@@ -156,7 +156,8 @@ static const struct syscon_gpio_data rockchip_rk3328_gpio_mute = {
 
 #define KEYSTONE_LOCK_BIT BIT(0)
 
-static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int keystone_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
@@ -165,7 +166,7 @@ static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
 
 	if (!val)
-		return;
+		return 0;
 
 	ret = regmap_update_bits(
 			priv->syscon,
@@ -174,6 +175,8 @@ static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 			BIT(offs % SYSCON_REG_BITS) | KEYSTONE_LOCK_BIT);
 	if (ret < 0)
 		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
+
+	return ret;
 }
 
 static const struct syscon_gpio_data keystone_dsp_gpio = {
@@ -248,7 +251,7 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
 		priv->chip.direction_input = syscon_gpio_dir_in;
 	if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
-		priv->chip.set = priv->data->set ? : syscon_gpio_set;
+		priv->chip.set_rv = priv->data->set ? : syscon_gpio_set;
 		priv->chip.direction_output = syscon_gpio_dir_out;
 	}
 

-- 
2.48.1


