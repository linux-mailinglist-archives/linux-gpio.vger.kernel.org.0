Return-Path: <linux-gpio+bounces-10663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D5298C794
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 23:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F9B28587D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 21:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19F71CEAB8;
	Tue,  1 Oct 2024 21:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7J1oZMq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9AB1CB32B;
	Tue,  1 Oct 2024 21:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727818049; cv=none; b=HlzWnmnhUI+4N+1bpgxMBoA9e2zW6dIcEoJQFOwZPgDWdehFiTXkONKfi6kNOq4zxnH+HHxDF6xQMjj8QxJSX/PuL3BCD8R9XbSM9UqeD5Bz+gRmYC9ZJV/JVVphTIPj2FtiB/gmIO9nK31WIYj6c5Ybw/wWsHtiiCy9ADLWdcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727818049; c=relaxed/simple;
	bh=scTDVUvA/rAFRAPo8zuycsCH9pRkxowhE/xKnrp4qr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6HCTETJD0eXs9Yj+nxapEZLdmxLGIK7z8nRBVOTsK/v6oiRTrgRPlEC6bbMiQR7Hv0jIIw37zVq93MSN8cyDwInlmRZL64yT1iHi1pNxwtg0A5h6b952xosXBKl1fhfcI0v+lo6GiMmMua+lFMJm4xLF8RG0OTY5ksPS/2A0Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7J1oZMq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71b00a97734so5246047b3a.1;
        Tue, 01 Oct 2024 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727818047; x=1728422847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzxw5fwHbnGXcVSgJzdzHGpw2sYpxV4QeEDmtY/DZjQ=;
        b=P7J1oZMqt+mtIiaKMk7nIDmrBb6VgbPJskO/PQ1Zgt3t7nKSmspx/hHKzKLfNebvs6
         WcWw1oopjtGFPvdDtu1/R1TwQpKKOAP7zb2vM/+jyPeMfAqp11ebnyHfFNdH9dX53zk6
         asfYhAVyJk95wwsv6tS1tPr6gJaDN44W1qVt2/1bQOUbesssJm/Iu7rubiNx14wmv9pm
         Gu87c/DanKHrlX8nLhcSHPXyIJCXSELT6xCodfk99QBwq3Oo+NRvvcHEkyCYBwKgj/Is
         dbVK0yIKSOb3WkK0ehRsEHUoxCyDUBZg7bGxk08MRuMf7WcOE1LEhVHhC2dMlIma/rPk
         FCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727818047; x=1728422847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzxw5fwHbnGXcVSgJzdzHGpw2sYpxV4QeEDmtY/DZjQ=;
        b=dDq+QNNTSkzf6FVANqT0QyM3+0XASctxuphAuPPH0WAKnizfEwkeun3kCmUExDjNj2
         ZJenvXILiB1sZPtWoA00gDxh1fDm6EPGxjmoqPqtkKyhL8Zo/gYel5tIpfzua+TBZv3G
         73Bob7DJ+8qBuKXdGf9Rz7zenPNE6PVx+0fc41Wu+5URioL/b7xgCb6kt0Lk+c6hosgy
         zcqtNVKI3CLeFSndrieVRzF1Wd2pYhYmQxuonpHYU0kRWiATqGdaRUXWjHZa6VHUkHOM
         Vyky5jSoIlk9arvNvDVttXhrF1a4jj1TIuLKRL79YiJrQvdH3H9oXeneRuFxFtHJgFXV
         mGMg==
X-Forwarded-Encrypted: i=1; AJvYcCVRr1xP/iBImF/5IBkKTqAFdQxiSTy5AYbQ38/lmYVRvf1kSBjwFn+/c1we2nxYB10h/nBBgyg2SGUeUlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDF+DA9SDid3qjBu54ZJEzEbjgCHW2Ikz7wBhDGiLfN5zX2oK8
	Qhu5vO7d9h7fHQrGlTFzOSlGq9P6qsvh/82gCz5tC5OlRWx3axziSQg0LE66
X-Google-Smtp-Source: AGHT+IEQQtcVTM1iN3N0gdTD5GjhvHNC4tKTAXWbV6Rz2mnTSTo38XEmUBPs9klO4aPxQx2ttL2hVQ==
X-Received: by 2002:a05:6a21:174b:b0:1cf:6953:2872 with SMTP id adf61e73a8af0-1d5e2d2a89fmr1523779637.48.1727818047176;
        Tue, 01 Oct 2024 14:27:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26518a2asm8572942b3a.107.2024.10.01.14.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 14:27:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] pinctrl: aw9523: use enable for regulator
Date: Tue,  1 Oct 2024 14:27:23 -0700
Message-ID: <20241001212724.309320-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241001212724.309320-1-rosenp@gmail.com>
References: <20241001212724.309320-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_regulator_get_enable_optional can be used to simplify the logic
here.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 1374f30166bc..cf2fb26992b4 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -80,7 +80,7 @@ struct aw9523 {
 	struct regmap *regmap;
 	struct mutex i2c_lock;
 	struct gpio_desc *reset_gpio;
-	struct regulator *vio_vreg;
+	int vio_vreg;
 	struct pinctrl_dev *pctl;
 	struct gpio_chip gpio;
 	struct aw9523_irq *irq;
@@ -972,16 +972,9 @@ static int aw9523_probe(struct i2c_client *client)
 	if (IS_ERR(awi->regmap))
 		return PTR_ERR(awi->regmap);
 
-	awi->vio_vreg = devm_regulator_get_optional(dev, "vio");
-	if (IS_ERR(awi->vio_vreg)) {
-		if (PTR_ERR(awi->vio_vreg) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		awi->vio_vreg = NULL;
-	} else {
-		ret = regulator_enable(awi->vio_vreg);
-		if (ret)
-			return ret;
-	}
+	awi->vio_vreg = devm_regulator_get_enable_optional(dev, "vio");
+	if (awi->vio_vreg && awi->vio_vreg != -ENODEV)
+		return awi->vio_vreg;
 
 	mutex_init(&awi->i2c_lock);
 	lockdep_set_subclass(&awi->i2c_lock, i2c_adapter_depth(client->adapter));
@@ -1027,8 +1020,6 @@ static int aw9523_probe(struct i2c_client *client)
 	return ret;
 
 err_disable_vregs:
-	if (awi->vio_vreg)
-		regulator_disable(awi->vio_vreg);
 	mutex_destroy(&awi->i2c_lock);
 	return ret;
 }
@@ -1043,9 +1034,7 @@ static void aw9523_remove(struct i2c_client *client)
 	 * set the pins to hardware defaults before removing the driver
 	 * to leave it in a clean, safe and predictable state.
 	 */
-	if (awi->vio_vreg) {
-		regulator_disable(awi->vio_vreg);
-	} else {
+	if (awi->vio_vreg == -ENODEV) {
 		mutex_lock(&awi->i2c_lock);
 		aw9523_hw_init(awi);
 		mutex_unlock(&awi->i2c_lock);
-- 
2.46.2


