Return-Path: <linux-gpio+bounces-26375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E4B89687
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 14:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AAF6585D15
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 12:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE2A311976;
	Fri, 19 Sep 2025 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aOekwumb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168233101DF
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758284260; cv=none; b=qI7KtylVqnl//JGbngQNqiE7TdRZoT6YXrgQaRSPJnQJ2QrzBdAPWkXMeJDVJ3EH2Nfi2u3H1cUH7cFEr2PcyHLotqN8EVAzTdqbYRcHIqRormHlEoUsJY1CySu41gaNDj8V0OugU1C7ZnIjm89LS9ezSvJYEAvzXmJJrz7XLs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758284260; c=relaxed/simple;
	bh=uXMsVRvIWUUHVkklABfE5JimlZKe9ncD9jrhLJ/1tIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dWLiPdGq7r74S8kXNWVqqoPl4S4sV27iDn1o10nEt9WcbQgr8qrE2rgsU2ngGn7qwW9gbFjNNCwub5vloDBjCfLoOXyUFdrBCmmyo2sdw3/hBEabYnzFKRE5jIQUBZBwsDj9h61AsYcwj18HqvrnsMF9Pw7Yx8O2zmW1bfYRmzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aOekwumb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ece1102998so1140996f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758284257; x=1758889057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIW2cqbRLJugG5iAmnoTn2WqOkPb3SCBmhz78WCDfZg=;
        b=aOekwumbS67JQCB5kDY34mBviO7d8/N3UTXkPnSu1VJjDuQojzQ1JgSurl11vUr1cd
         pX3HdjKZL2AW8Weyrl+g1zJjq3hM4n9RnKcA6H8Gx/VVNR/bZlafA7h+x7aONWj06ekA
         pJPGkF30Ln7V92NWuTJFW3I/GFe2ShJvNhB6mmhFh8nsDM86VWm6yNuBIi/+2pEdKPMH
         EpaddFhTtWJuAB2geNue+67ne28ZCJQBjFiVjEOamD7/Bg2GVOb/GHOabLcKMMeftSnZ
         RRoh0u37hMZhJm9m956fHETGSD1PyscKuUtEQQJgUA/BoKMA3+Cw/LZobaHzMJQ7Dago
         OD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758284257; x=1758889057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIW2cqbRLJugG5iAmnoTn2WqOkPb3SCBmhz78WCDfZg=;
        b=tenku1wPgE9g4vnR9oqtNrqxl5jysg694WGJopg6RwEHlSfSNKUjCtzddeai/USRG1
         b7hdveRtKaosX0EFlqi8DhElwUzXssyiJ3lRGxy7FL0AnNVa/k23wB8ulNoJuRry4CBG
         uAnvblN74HDosa3VmMu3P9JcYtv2hr58s3YWWp2IcCGP0WUafU6lgcDZVVuI/TKJA5fI
         BN6nhUNsDUuYTdSMFd+/eI3GAXFcrKapzE3Zq80sNhkbDvpjTZH3rQMNJKlo03P46FxG
         B6oSeQHkffVtHFIZ06Q7Okzpl/AzX31zqFWSqtLQPsz3O0jaW1dVBAZQrRtB7z/8KBLV
         xHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCURHDxrDef1cOJ4RrdojdBMNUbu9qNvA4I5LqIxq6ofWCjB1sbHWq4+8vH5yzpJPQCa//WEaey8G9dj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9l30O0EIUKL4Q2dbLOCrNqeltUmZIMrd9MyQBn7xjmrqnYnNp
	5/Sr51o8HQ+cQvXRsgDciX78PMumAayOh3+n3UdjaKp7k8yaM+UaKgFE+G8KGtO/srxRVFz78fz
	0+LgY
X-Gm-Gg: ASbGncu15lY8q3eEPcJogQRCmTg8Fe4vzSt5KM5I5I8WgH3TmjZnpF0HLJ58zegsL7k
	pgl4oOVY3GtCqaMtAj377akzMRC6kiJys03yc+eT7cSYeZXAjU1a0WYth9LvkP6hoBjxZXXpYl3
	hW97HyAbiG8Ki37jlEb4zoN/19oEqk5K/VdwbV2IIXlNKSYmnQ7MKcF9VEucUS69ZB3ttCrHDEx
	fmpLFgzgUDZnboe8lzISP3XlS1YXrHDo75wSpk0Zu7H0Cze/f7JpLwAI0Gpwbm7uvSEpOroUNC9
	yBAN4JTi4wuSdBE2x2m4yzPJ3Rg9/usp+4jXxkvd6Qln3gUj07YkcetoQsxyB+y4xncHk3l4qQG
	fbmMFibVHe3OwdPk9X6118z0=
X-Google-Smtp-Source: AGHT+IEU5j/e9+xQRgSg21pb50+kFe5FlXJM7VGLOto6peVQI7x2WopuQi2c3s4oSklCM8+Yd4STAA==
X-Received: by 2002:a05:6000:2f83:b0:3eb:f3de:1a87 with SMTP id ffacd0b85a97d-3ee87cb37ddmr2548806f8f.56.1758284256906;
        Fri, 19 Sep 2025 05:17:36 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf20b9sm7655176f8f.57.2025.09.19.05.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 05:17:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 19 Sep 2025 15:17:12 +0300
Subject: [PATCH 2/2] pinctrl: qcom: glymur: Fix the gpio and egpio pin
 functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-pinctrl-qcom-glymur-fixes-v1-2-426ea410aa94@linaro.org>
References: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
In-Reply-To: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=uXMsVRvIWUUHVkklABfE5JimlZKe9ncD9jrhLJ/1tIM=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGjNSdvIDDjbI1JLB8ePj/ESqVEnWB5TaAl9s/1lTqUIn4wue
 YkCMwQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJozUnbAAoJEBtfRMkAlRVWZOEQAIxO
 ssFzqa8egLYxWi5IpqBNV+LRJgUFBcOn4okFexW0eomoaAP1I+WPrh26ke0+EQr11sHB60MlgJE
 e5gXfLdwfryc7rsuzJxi0sKCwWqHdxGAXYzt0cu6PeR35gVWfPahLJ8CAmQWzCsmZJnKmPJKAml
 GirTnUTj4OljMmZprdgfiNCEwBFL3gWSfUmGiCHyPwZy3qUBEdQZfLFOQSzuo8hpkwuYW2zJTv/
 p6uCbYrjSwvJNzYBG4mfXp8Uk2VNvZoJKLE5F8LthiCvIOxFLt73MwdAbHGMhXORl+ebUbnEpnk
 Iqyn1VRlrv0U4YQn5N5DUbSjlwNBjMWHZTFouRBv425krhbh50QeDQODYsLTzpEP7OmovrA1Hjm
 vH/Ynw5EjW+KUcYu8XgMIi8NLfMIswqlpiX4Cy1H2xxNjVGJlz6IAGW3u9idfxqfUMLIB8ocgT2
 k9CEc2sS59Ygq/plITHnJqqgXk+Cb9q8+n3MQ7KtWtPX0cA15/yeNZGKzeK8fgtWw6v9X/HK9p/
 oCBPl8xARiOEC2j11Kq0Q7ZkmJDPrI472Aipe3m3KG6PdxAOZtnJXV/e/d42mZ0Abl7lmSIADXC
 VVrdXijALy5qm9uMF87/f3DlyNV4kK7o10Y4nJxJwCJKEGOP+leEOm0F+9aGEJtljVZluDZh4pe
 5cK1a
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Mark the gpio/egpio as GPIO specific pin functions, othewise
the pin muxing generic framework will complain about the gpio
being already requested by a different owner.

Fixes: 87ebcd8baebf ("pinctrl: qcom: Add glymur pinctrl driver")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 9781e7fcb3a11c85dbd5497170188e2da051215b..335005084b6bc87db6d700471264edde00370ca0 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -1316,7 +1316,7 @@ static const char *const wcn_sw_ctrl_groups[] = {
 };
 
 static const struct pinfunction glymur_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(resout_gpio_n),
 	MSM_PIN_FUNCTION(aoss_cti),
 	MSM_PIN_FUNCTION(asc_cci),
@@ -1342,7 +1342,7 @@ static const struct pinfunction glymur_functions[] = {
 	MSM_PIN_FUNCTION(edp0_hot),
 	MSM_PIN_FUNCTION(edp0_lcd),
 	MSM_PIN_FUNCTION(edp1_lcd),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(eusb_ac_en),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),

-- 
2.48.1


