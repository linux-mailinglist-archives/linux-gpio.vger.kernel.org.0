Return-Path: <linux-gpio+bounces-8672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456494C2BF
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 18:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F770B265E5
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 16:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CCC18F2C5;
	Thu,  8 Aug 2024 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWnQY1M8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991F18B47A
	for <linux-gpio@vger.kernel.org>; Thu,  8 Aug 2024 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723134486; cv=none; b=NG0TFoIFn+iyQSaQ8U49P6+APGuJauahsxXi3kV7urW/5/VgG5fNoFkwmS0zbFlc0yx/mKBSd63i7kozDHeB3czU26/P0CPYe3APThQSZ+Pn9U2VZlVd8eGkGkERKPjHozlgyUBpjXX6qyiNXatlROo5eCTSr61u6rtdFR3ilR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723134486; c=relaxed/simple;
	bh=UK/cETamLxpyFIOG9UuHmjCuwYs5yCzAVU3e8VKJjaU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X7mynLmp0uvbkQ4KYJ88tT8cAt2DhLxQ3aEbeF+0mV+wx83Ju7Jh2TeGcIR3qcW9F+S6OVnU96cvuh6AQIr7hyh6MugdC0OtJplIGK54mKmXQDvaah0/KyjLw3JmOTeoGiT9nXP2QzEXbnN5QHXhTzS21GAj2/8fycbWG++Rmfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWnQY1M8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cb5a947b7dso219587a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2024 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723134485; x=1723739285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h55Ss4x4ropCBofo0X6KlfEBUKmmcmXJv6SUvAqr8VE=;
        b=OWnQY1M8d9inTprhqOfcIjTUqepYfI8c7xRCepQyku1eT6xoNlcjZLip/G3yGaZYwA
         xiM6iMtJn15/6aRLCxtz8gYG7ThxNBcgGNgks8ljxtNzJKrUO/RLguW3Atrbvy3SMAeS
         ty4nMseflATJrdiEMcyHvqRF02fTEa2ZxNsMEPjScY1ZKGyPvU4c67HG1vU70oLMOtGt
         MLZ2qf9L//9e/WrEUp6iGqdP51Zkb30DTM0sl9BVUUbfSkCjjXCcIlezSuOmIGEVtjd9
         TJSLwMCOw89k03nc8ykV+eP2nYjPk5SjxVG5QieB+DhtVO5NGrAl5e+mzDKK+XIWFvwq
         Z4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723134485; x=1723739285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h55Ss4x4ropCBofo0X6KlfEBUKmmcmXJv6SUvAqr8VE=;
        b=Hp6OL/VmT3TfvTBfyHLub29EEnkyt5PZ9KeeiobqGhCFYbQiukYDwwucy8GytEmMEz
         Tx42+Ej0liYXf6Zac06k9KcMnkgpl5vqU3WQUYAt91xuIFo6XpaGGZXzXHnnTzrDyTrv
         ErF7DpNb4P1zSx+kX7ATpBLTDn1lY8yIXMIiIteC/261NjjolidV6rEc+Gy3z7cCMhd5
         Z3e97r9l6KBRjp35/3I+7HnprVqGATolwe7wVGRJr75WYX0uHz+y5EbVgMVpMUTiVZwH
         ZFYS8bT3mCmrkGarDTQrAU14Pzr4lA/7lbnTNkBctI+952tvnSu6iWRoA3CU16H6ELdu
         9m7w==
X-Forwarded-Encrypted: i=1; AJvYcCUnV2VwJuq5q0gqkmV5ZN9rJV+UPipfzPGlyoO7UEs6BNdVhk9UngbfCWJz7VmgWWybs7xQvgqFQyBfT2u56+b93YOcyK4TyYzqcQ==
X-Gm-Message-State: AOJu0YxxX6DOGk+3HXPMOmmTig7VS9r/dLLx9cx/VFXOWLd7RosqUl1s
	U0yXgUmdXabofDVSe2zGdo2Miax6JnJBLdb2lD8/qIkjYMZTm5Iqli62eA==
X-Google-Smtp-Source: AGHT+IGRTgtmm4ljHUK/mCPuCaC5RCAN35nHV+wyRTJR8W+TGHEqgLOwkGi16J1pvUjgVOVGJ/6qLg==
X-Received: by 2002:a17:90b:3cc8:b0:2ca:63a7:6b9d with SMTP id 98e67ed59e1d1-2d1c3465e32mr1669631a91.3.1723134484560;
        Thu, 08 Aug 2024 09:28:04 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9dce50asm1327934a91.54.2024.08.08.09.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:28:04 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linus.walleij@linaro.org
Cc: aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	linux-gpio@vger.kernel.org,
	peng.fan@nxp.com,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Date: Thu,  8 Aug 2024 13:27:50 -0300
Message-Id: <20240808162750.244092-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_LATE_SYSTEM_SLEEP_PM_OPS() with its modern
LATE_SYSTEM_SLEEP_PM_OPS() alternative.

The combined usage of pm_sleep_ptr() and LATE_SYSTEM_SLEEP_PM_OPS() allows
the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Use pm_sleep_ptr() (Peng).

 drivers/pinctrl/freescale/pinctrl-imx.c    | 7 +++----
 drivers/pinctrl/freescale/pinctrl-imx8mq.c | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9c2680df082c..d05c2c478e79 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -804,14 +804,14 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(imx_pinctrl_probe);
 
-static int __maybe_unused imx_pinctrl_suspend(struct device *dev)
+static int imx_pinctrl_suspend(struct device *dev)
 {
 	struct imx_pinctrl *ipctl = dev_get_drvdata(dev);
 
 	return pinctrl_force_sleep(ipctl->pctl);
 }
 
-static int __maybe_unused imx_pinctrl_resume(struct device *dev)
+static int imx_pinctrl_resume(struct device *dev)
 {
 	struct imx_pinctrl *ipctl = dev_get_drvdata(dev);
 
@@ -819,8 +819,7 @@ static int __maybe_unused imx_pinctrl_resume(struct device *dev)
 }
 
 const struct dev_pm_ops imx_pinctrl_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
-					imx_pinctrl_resume)
+	LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend, imx_pinctrl_resume)
 };
 EXPORT_SYMBOL_GPL(imx_pinctrl_pm_ops);
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
index 529eebe46298..e59e4fc80193 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
@@ -341,7 +341,7 @@ static struct platform_driver imx8mq_pinctrl_driver = {
 	.driver = {
 		.name = "imx8mq-pinctrl",
 		.of_match_table = imx8mq_pinctrl_of_match,
-		.pm = &imx_pinctrl_pm_ops,
+		.pm = pm_sleep_ptr(&imx_pinctrl_pm_ops),
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8mq_pinctrl_probe,
-- 
2.34.1


