Return-Path: <linux-gpio+bounces-21644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E663AADA961
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C98318952E9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68162206F27;
	Mon, 16 Jun 2025 07:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ujoTUWM1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E111FF1A1
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058661; cv=none; b=bUDrw06U0flwcL0kY/ZgGxg+vPBUtbA3O67OtA7RBfjk5pOg2o8F9yjBo0Fd0uVSwjLNHv40kQ2u/dY4KdDT6eMEO1/EcrLe8m+w9XI3mte0trKUY0YzpKXWpp+MYtyUF4cWvYwQuwu0c0jSPsCoWQ2qZUCkGDblg2BqMmnYhRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058661; c=relaxed/simple;
	bh=bd8/aik3yGNPjXbB6KULRUrIDnWYBUIad25vDgDipU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsqV7XHmkkt91UVmSpWgGJsMYfmhwCvuxTJDX+WECQnAuU+OnalJDDbHwTOQxg0gJBxVf7yP05eNNxvzcc68GdagLZSARuTnr7qYhrIdE3mNGxFwWbl8pNtU1e33QZj/ZZKoJ/rf8wO1tRMrAUtS8qZDCoLPqUQxbN9iZpH+nh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ujoTUWM1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f71831abso3779258f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058658; x=1750663458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dk2490V7toxDqdX6m2bpZwWhZapb2e47P6mgRch0L+A=;
        b=ujoTUWM1TmRCawfIfkGrng0fH6oVXjIASiOFOF8WPqxZhSGHLX4Lug87FgUyqtSyO5
         rfYR6iEPbFU2p5lunn9GcE4q9hWL8+HBVkiY2B6hhPfKOOrckVhRZXWfyGJt5Pwa9rc3
         tdyEw9WGcR0f3xMozQmRmj3dpjyMNVOqwVquwZlkWDnJcaA0GO5c3cvyHk7Y799EKqyt
         zWvjbEqsI8u3yrRm8K6JHsQKrdF2yDV1YMrhtymi2YDavBY5c+/OMNNM+HrXteCMi/AV
         1fEQXhNL5q/zDUIu0KqoWFgk2o6rk/E3rstMVK4MRPuIYQN8GqK9lFnd6bQr3mCxk7BN
         Vk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058658; x=1750663458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dk2490V7toxDqdX6m2bpZwWhZapb2e47P6mgRch0L+A=;
        b=RcZX0wLvbU8wvbyYHratacpKtRsWuh2uXyHVUTHPUr3v2KWu8bRMAsZNb/1cFCXHfT
         m0GVdHRde22QJoEihTe0ytHEep/dmo4YyJOT3dTILma1WIxgjFtxRwdAHu7uTy+rgAbM
         L3VUt9vQkhgApNRNBNeZRCmL33GzTY9wbCUyggOOy6tSjeu4BU8+1j9RNxeoYp5qxl+y
         7sIwwaYRBzUX5WRRkMPgzS0BfkEp+r58zavt9l2FXWbD2ZMx1dpezH1YSKfXAqKZxaJB
         11OppdBWAOdQOAvnJJyaFaWXc/IMz0xHng07yA+L7eNHC2FWhdq/5EosrjfkXTOlLGKH
         Q38g==
X-Forwarded-Encrypted: i=1; AJvYcCX6vEfERcnupjVtVWNpNYkoQ6y/+rmIuR2QtrNTI1On7CxxIgYcUeIv1Zz8IP399c5Oa7GJAIaE2sfr@vger.kernel.org
X-Gm-Message-State: AOJu0YzxfR0dcekrpnEexq855Z/03Hfys3mZqHXdFLKZaiaDw+XNNcvS
	l3SYthstVy2Rt6Y/Tbdo20KTEGBcz9Ahh3b1de0W0fUuu+mNL7QWoSmSKBuNjA/rD74=
X-Gm-Gg: ASbGnct2hBef7EEXSYYTZEBIt9Y/wLKBkKI/V7xwvAFHprGNXXS1TjpGBDU+XMw6uA1
	7ljEaLQIvu/DeFD8p4xQUxLGY3u9YfAZYwBoeo3OOR+GXnkwdw1TyfcyW8IN1ReEtPhd5bDAJAA
	Kl5oI/rJSD4yU3TuVzr5LopNqNbeNmNu+zExjf2k0or6UScNJygW12rLv8SgQ7hqdoJe0V+bzf7
	fLlxgvm4t51urNopC3LzMSKS6Tmfy75lU7uhWqAkjVyb+fpfeNCQaLP3uNrkNxF4EN17SPFoOPH
	OennY3mFq68ERrKGPdxJGyV0+JTuxHbXzRDMXs0UBpHJ2SeB5Lcwt4K+
X-Google-Smtp-Source: AGHT+IHjTITSdrkkTH11GT/+EzTBq3NAlKsV/J8ox/RCJxKJGn5B+8SotQM6qAKPmFBSZqyU8wHWmA==
X-Received: by 2002:a05:6000:2901:b0:3a5:2f23:3789 with SMTP id ffacd0b85a97d-3a5723721acmr6221770f8f.15.1750058657595;
        Mon, 16 Jun 2025 00:24:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:08 +0200
Subject: [PATCH v2 5/5] net: phy: qca807x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-5-cae0b182a552@linaro.org>
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=902geVroxqYNedJuDkhJncS6CjvxOYP3g9PjXCsT2tY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aZsS4bPVXRFW8hbhc2HST9zbVAikAosjSbI
 VX1fc56BVGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmQAKCRARpy6gFHHX
 crs/EACb+XZ2NzlhRTyZfKfSIMQTWBEOV5YlX+0P+ziYYneyaZfSMCBPUdEJBK484XG1I1qHbJv
 Cmm6pNOUfA/aS3PvVVLRpFRew4lHAGNBxWMwkEDMdr4R3fLHomhTENRC/o5GlosvQbirXlm+YZ3
 xl+ulmmLLqnxVo2rkU85w+4KaCvAZQWOWrGHjCmP6qbYdLh5UvNbq7Adfu7hvuaNn7tPTdVrvCP
 gpod/ON6nr2S48R5ssyepgil95lcxK+GL883CxVhFpYNBxXswOlUjmb6dhEAAQIs7lz0k5I4Vfz
 hkDI0NuwjjNWG5VCXCF1c6rDyDn0MZNaoQTxhuAlk/RzIoE9VW8n/mTzISVQO3uI4qq7LakfmQa
 QmACdUVNQJcVF/bhdLfkbTm3wYlVcgj5cVhg+D/6XuIyJ30s8VfVltAyuh8+0HDtqRGLJ396pNN
 gK3QIS5FwHsvtDIEWoswl/DsYodSNONEubXFnddYuM4SvhMHM1Oj4EVkC3F8Lx7AVMGpeCu4Rnk
 e987RhUzSpX7bPmzdtASZSflEpbRKe5vESs+ZXkMWWBo8qbfL4QEINVH4IpN2b82fUmSAUTKXns
 XPxhjw4a+Gggh9ujtD6GzkOXQbxq2Nd+85WregsI5+tVUQXeGUsF4WLG/lJKPiGKSIEVaGEXZVp
 SbeagtT3GHBmMPA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/phy/qcom/qca807x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 1af6b5ead74bf615ad155e396b0ecc6fe5636e8c..6d10ef7e9a8a4d906ea3a7e0d73087e8907be9c4 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -377,7 +377,7 @@ static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
 }
 
-static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
 	u16 reg;
@@ -386,18 +386,19 @@ static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int valu
 	reg = QCA807X_MMD7_LED_FORCE_CTRL(offset);
 
 	val = phy_read_mmd(priv->phy, MDIO_MMD_AN, reg);
+	if (val < 0)
+		return val;
+
 	val &= ~QCA807X_GPIO_FORCE_MODE_MASK;
 	val |= QCA807X_GPIO_FORCE_EN;
 	val |= FIELD_PREP(QCA807X_GPIO_FORCE_MODE_MASK, value);
 
-	phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
+	return phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
 }
 
 static int qca807x_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
 {
-	qca807x_gpio_set(gc, offset, value);
-
-	return 0;
+	return qca807x_gpio_set(gc, offset, value);
 }
 
 static int qca807x_gpio(struct phy_device *phydev)
@@ -425,7 +426,7 @@ static int qca807x_gpio(struct phy_device *phydev)
 	gc->get_direction = qca807x_gpio_get_direction;
 	gc->direction_output = qca807x_gpio_dir_out;
 	gc->get = qca807x_gpio_get;
-	gc->set = qca807x_gpio_set;
+	gc->set_rv = qca807x_gpio_set;
 
 	return devm_gpiochip_add_data(dev, gc, priv);
 }

-- 
2.48.1


