Return-Path: <linux-gpio+bounces-7519-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42B90CA52
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 13:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB6FF1F239A0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 11:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D20F6F2F7;
	Tue, 18 Jun 2024 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gI6TmKU7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4866418EBF
	for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709974; cv=none; b=HCeIrTzSir86/MRfGERMbQ1KmO9rONGS5zSdADiMKghVuxpT/hta4hs4KUk1PESZ6g3mBXQpIFqtvNe4Br6BJ1IHipwumGfnlHOO2lKLdr4hNGQfSN6eBq81FTw74mWEXhhSLdNy+v0G2zoX9a8pRd1lv7XBZTYFNeYCkpWB2uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709974; c=relaxed/simple;
	bh=HWd5Qrc523h0Kpm2S7GzAhcGs62cslS7+w1cTcJe1zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rsy3elyQjNTMT9fsD66xlYPuTPycH91Dm2u1H6pHviBd9AB5Tk1+8b+EnodGcxLW27t8GYXh2fZtEQWbetkiYdjxHOO5k3nqdnucUyxj5U3dLWtQv4DPJBdk6ZyQuqmOXb/LmjIc4fcDQNNz95mbo3CAgeQGaJ6gMPbWrp/OC50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gI6TmKU7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc035a7ccso5598451e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 04:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709971; x=1719314771; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4cPDV7XReKgIf8BONvjHKsljmYvPykjYsPmvngmsEM=;
        b=gI6TmKU7bXpvcuPLAFjEWwvMgn+1YmMUq477a/UnyrvUDlO7KLfQAX+XjMvMSAeMiK
         AycZrYtNupztX7cqMvFEH3FjAG0Y3iJALDvKelbqrlYTnGPFfWskMHNt/UC8//mBMzg4
         PJYDff/QMOIhJQjjNPKRE1iEQd1Jp6Tf2NuqugdA3TGM7sVMOBq+VdVYtEwuIPo4Wug2
         UTD4gTSvSDKSgclKROWsbb1ASiHxStPfoNoVYCHsFdR8cf+CH0wvUp+MFr34zPA1wv4Y
         cN6M2trG9FTUIPDk//dlbufacsLxNUZg8Jj06qfatORGBMcoMgKauqfl9W44kw5EH/o7
         Aykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709971; x=1719314771;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4cPDV7XReKgIf8BONvjHKsljmYvPykjYsPmvngmsEM=;
        b=Je98DmV5xRXE7KfMo3B0+qcYRkl6M2oLHKs67ceXVDDvA/O7q7/XPANIf4PGOtwlRR
         PX2cIOItV9LnZyNShG8RR3ESWrtl3Ul8nZGGPGiCo6Jx9XEY51CfCzGDxcF9uzO5N/Rs
         bG7iKoRu7CoKwQg3GlJ42G6n5Lm6Tzz/qCFFsRPxpgBuZFg8dn251I8VigXpY0P9UTMo
         0xMazwFk9I5hITUxd9poWdgtiNM1pzLITzJo32ZmgpHQ/z1jCjgmRmAuNDYA+YsUzHT1
         1+RQYmyaDo/DVLtNTYI+p8GfLBWf2i5IS7W4gbpzne0ZOr4PkDjPu8rqDCRMQ+Wou3dc
         +0oQ==
X-Gm-Message-State: AOJu0Yx9e5wiUquprDB2EBWPXvhUYT0s8qRakOO6ty53lZ3/nbj6e7NP
	Ti5IG26Nx+3Dv+uTuywj8HBARjwWQi686Crmvhes8MvQ5B1TUvoqSIBRck4u1p+VFH/jq3fYNX9
	X
X-Google-Smtp-Source: AGHT+IE/0Z7xSIngz4lYAkm0cwsZjT4khb+yfRf8aox8yQwBxwd/m10WABjZH83hoq6GciyOBEX3mA==
X-Received: by 2002:a05:6512:3258:b0:52b:79d6:5c28 with SMTP id 2adb3069b0e04-52ca6e902f6mr6549493e87.52.1718709969417;
        Tue, 18 Jun 2024 04:26:09 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825706sm1490665e87.39.2024.06.18.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 04:26:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:26:07 +0200
Subject: [PATCH] pinctrl: freescale: Select missing features
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-imx-scmi-generic-v1-1-67808a48beac@linaro.org>
X-B4-Tracking: v=1; b=H4sIAM9ucWYC/x3MTQqAIBBA4avErBtQkZCuEi38GW0WWihEEN49a
 fkW33uhUWVqsE4vVLq58VlGyHkCf9iSCDmMBiWUFos0yPnB5jNjojKox+jIOSlC0MbCYFelyM+
 /3PbePzxlnRRiAAAA
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

Fix the compile problem for pinctrl-imx-scmi by selecting the
right core features so the symbols resolve.

Fixes: 1e37f761d016 ("pinctrl: imx: support SCMI pinctrl protocol for i.MX95")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406172317.Sds860AS-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/freescale/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index bdc40332f93a..3b59d7189004 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -12,6 +12,8 @@ config PINCTRL_IMX_SCMI
 	depends on ARM_SCMI_PROTOCOL && OF || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
 	help
 	  i.MX95 SCMI firmware provides pinctrl protocol. This driver
 	  utilizes the SCMI interface to do pinctrl configuration.

---
base-commit: d81889c15871f350b213566a43f09943f93fb706
change-id: 20240618-imx-scmi-generic-fbebb10dd48a

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


