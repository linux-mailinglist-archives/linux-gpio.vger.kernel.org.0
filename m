Return-Path: <linux-gpio+bounces-20638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C8EAC675E
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 12:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 019B01BC6E38
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 10:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132D527E1C0;
	Wed, 28 May 2025 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7HRiw0q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227E527AC56
	for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428905; cv=none; b=Jgn/cU6OqB51DPR0YkcRyRFKOFkYw1PW1A5Z5WiFQ7+syxvpj7QcHC44ldiH9sXU+59364ptj5v0sg+xQI/5EW0MKB5Ev4BLlFyVa67ZsFThNv9d6MwUqQlvCvDNwbX8obpq2UMll7rf5kEEa1Ct6vFt+dY46q2MOXqwXwRFF9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428905; c=relaxed/simple;
	bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fahkn24ZVsKWv0fSO5blFQuBg0Yg91luWz6zNB7/osi5pBfol09GUcsV1q0c9MFLTHg6/nKftHfJ690KLUxU/qiVFUbHjTjvCGwYAJUe6w/SP4YRAaGZ4pRca5LTX0iufl0uBvnEBSeV6FvAi4tX6+gyhrvRJ8ipNzu8EHDvtdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P7HRiw0q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso212549f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428901; x=1749033701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=P7HRiw0qGG/WII6MP1FGAfbPIRbSrX/kCjHfofWvHD6l7IVe2Oj0JuPVPgqCylghf4
         Hjs/l2g9Y5KQqEkWFrkQMtLolSxzzWf3pI2rmpmuaSPZtO7uOR70GX0kOJPS24NKqs0P
         38uwCb5GDOgqZSiMFWatxGsQN7YV7ajNWkE6MTWthJpcufjtHwGLyR3XRv+g3hwhJCgq
         K0XjVjaiB8fuYy7z+FU1M9+/jJ4uup+mJtdg7nu1fU9zHGZmDQ+RSxt2RfmTD1YY+AwU
         pUsGuKJL8esP2os1Lj53rIriUvGMkvLV1kIhLqKyTKclf5PN8WhWqAHUcbC9WnCn00tc
         iqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428901; x=1749033701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=QMvnL9liEpXIKsSAd0EOczMNART342duyc9mYa7QIGPpMr2vgV+Aa2TOLVjdBFkVHs
         WCMguXfFWrVfClJRMMyh/BkAgXdAscvLmAE3I5Jg0lxeXy3h0N/FpqS8vpAgtv/4mHjz
         Mc0QBZc9LORwAZE7KjTZ137X65WPSsGzDRx5MQ4DvX0Mpn8EaWgBj7AGydnNbqMrp7ZE
         5f+Vt/MjbPepdHugN3MkNz1lhn/7zBwcpWuVCM2Z+H2Q1r5++KknEcPn+ndzc3vtYfzJ
         /bh1fieV5BFS7Iqd3jTzfU6Z37ivHtKPigh0pXuAa+S5Q1yWrB52xm3uZldYhjTWQ1he
         X65g==
X-Gm-Message-State: AOJu0YzJAmBijcB0y+qD5Y4ZSZyqEBUP1rHL4fAnBvLkF6CkDkj3fBSq
	CIybsCaEDYQ5RHHNr2atLLov4W9w0OoNBuQJWtoVRAViCzWzTeTfqYNG4HKwcVGhZpo=
X-Gm-Gg: ASbGnct0RY5M1yfJYTBPpR/M4c0NMmJ2x5H7OiAfnQj1+iC3NiEKR9jE56GLh5rYneX
	Gz7wlJqC1d91s4YI0/tDdJYAvCrLfSIb0xY+bglGFKbCJFvEf4fQmuc7Dd3hSj/Dxae43ngQVmj
	XxjVW5EqjfC9PHO4oToyo70skQ4eCT57DlL6UmG/x6nUdgSAavGhWM+2hXPpoPbpKuDD/EwYmGA
	lC3Ca+iOBancghMxk5wlMgpz6B830qkJ013eiKoNuxcTA6h+EC6JuRv0eaQehO+ZMTU9mgeFjgE
	Kw5+9uwx56fUqVNgDxm/WTaEy4yxlu2gULux+eKrAQ9nqq6QxlEKXx0r1T8Pevdz2zueURg=
X-Google-Smtp-Source: AGHT+IGTCix0Q1jy4BrWDlq0WKvq1kDgy90AgIQftKVJ3+fHqWj3CB+Y/tqyidOqQgU6X8SjWLe21w==
X-Received: by 2002:a05:600c:4fd6:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-44c91cd5207mr54787535e9.2.1748428901365;
        Wed, 28 May 2025 03:41:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:40:59 +0200
Subject: [PATCH 03/17] pinctrl: amd: Constify pointers to 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-3-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhLzdvZMq9JNg5GdFBWovE17QCtk/Hvs4oxC
 jNRdzKNaGSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSwAKCRDBN2bmhouD
 1xJDD/9Iu071wp2X2mrBlbLxwbQSEt1jzUyA7UUF1e0KxgZt+zVcRXMVNMYoIThkWeyGVX52CQf
 okr8IMWAZsAUcHN251LBi/oyOy+JqW1cgzOn6ZWcJjsltruW1VOALbEswkI8rArGMBIiyh8f1tV
 8MtIMjNj1oTD4WOIVlp6L9ofpzo/9brBrdU5MDFOKeNXXa/dN/Fhk7RDaG2E3JMOzSFvmV4ZYzN
 bc4nYH4r3RCB47xeTr2E1Qv7mUO+RQySQxRO6oc0QFnkgLN6YcKhDn4yGIb/YmeYeGeVHbIwR7P
 33MJf8lYeKIBsczVrSDgBvg/jD/jRhVvXA7k1jPopbOAOIp4Nby4auXmhLYKI+jvfPfeTrqnhvb
 mh/B+jVb5w0Y3EQj2kG4RDtjdusNR36nNV+diBZB8+t0KbIgX2vQQkHkKvTeMecvEibBkYDZ+Kg
 T4NKgjTaQYKABGFej9HjbOu2v6g21yzG+Lp+koCs79oV+3X4bXHim4pzDHS3KXWPIg1dxwRPyvl
 3rjjnknIlcL425x+wOv4JdEt9YcjyPk6mmqB7RtPvnB1wGEhmHSGIUEpmDQtTWy5p+E4B28dzdL
 9xoD/l18/y+W5yHJkwZ+CXugsTc0rgO6qDgGrZ/gbW+vVsOz8fTZTC/FCjnmDN5YLE61AOBvgUQ
 wKkwwIR56tYVS7w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Internal functions obtaining pointers to 'struct pinctrl_desc' do not
modify the contents so they can be made pointers to const.  This makes
code safer, explicit and later allows constifying 'pinctrl_desc' in
pinctrl core code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5cf3db6d78b79af9ac5e7226de239a0d2f9aaacc..85617cfed2299e131c110e9d4084370790106404 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -872,7 +872,7 @@ static const struct pinconf_ops amd_pinconf_ops = {
 
 static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 {
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	u32 pin_reg, mask;
 	int i;
@@ -901,7 +901,7 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 static void amd_gpio_check_pending(void)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev;
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	int i;
 
 	if (!pm_debug_messages_on)
@@ -957,7 +957,7 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 	u32 wake_mask = is_suspend ? WAKE_SOURCE_SUSPEND : WAKE_SOURCE_HIBERNATE;
@@ -1001,7 +1001,7 @@ static int amd_gpio_hibernate(struct device *dev)
 static int amd_gpio_resume(struct device *dev)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 

-- 
2.45.2


