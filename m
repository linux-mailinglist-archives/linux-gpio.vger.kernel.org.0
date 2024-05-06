Return-Path: <linux-gpio+bounces-6145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F48BD11D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D3B1C22B44
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9493C1553A0;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEyNIng4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32246154433;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=n8PVdDFoktg/p5qoqL/4FYI6Rn62PJZPB61mEY1NFLwHaPuQ0uiIa82aSnNjVwvml+fslqIWZDvzBvUFEIJEgGOAR4T9to4VFzCcoE6lY7WsnkB8NbLGT+50Q6j1iA7NMLu2hvqj2yp8sa/PB/6gdiMb7oow9exbO9yex1QkcNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=3KIBPMYxlsik6cDO7/GK2sOz5yizOcMa7uM6iabiCx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHESxMpkXwfP81nYrDmbVaD5Dd1vwWvBzqeyMUsa0yzeaIjcArDj+cjPXj/ap+lNuFiy0SleH/yMeSQDsi1NdCbDJoeAM2gRzOx9QEI5BRXdgBylYeFCXQdapyC+h1jbakmHxv1QiDEke+MtE5g61vVRYUwR/BnvskuzhdJYA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEyNIng4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C1DC116B1;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008214;
	bh=3KIBPMYxlsik6cDO7/GK2sOz5yizOcMa7uM6iabiCx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oEyNIng402YHRxPlGaux4wtc6byOacBpT2TD/+MAtwuIo3Auy62aVEL7Ku2Ls04Fs
	 uy6TPAgFtpUy2IsqE5wih9EtCNaV9MyjhpGSMEKpi3SgkMDoWds/aerxEXL93dsX58
	 3LNrXKrCWIEZms6W5J8DL3Ssy1QGFsEotSOqaKpdRayBsqDZAdF7/Ly3Jvognft1hB
	 ZyD+xjSadQUIULRQBjIFmZbjTGtPVbleTlnxOJJ3w0gEkgaGb02MedQlM6XjceOdXG
	 1Vb7X6FWdGS8Zu8MwbHx0R7GglHmj/e8fZgLn/tvgBYzBoOM/m3Dc91zDZZVXHI2HY
	 lntu2czvaeByA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006CJ-1Guc;
	Mon, 06 May 2024 17:10:16 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 06/13] mfd: pm8008: rename irq chip
Date: Mon,  6 May 2024 17:08:23 +0200
Message-ID: <20240506150830.23709-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506150830.23709-1-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the redundant "irq" suffix from the irq chip name.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index f1c68b3da1b6..a04bae52a49a 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -132,7 +132,7 @@ static int pm8008_set_type_config(unsigned int **buf, unsigned int type,
 }
 
 static const struct regmap_irq_chip pm8008_irq_chip = {
-	.name			= "pm8008_irq",
+	.name			= "pm8008",
 	.main_status		= I2C_INTR_STATUS_BASE,
 	.num_main_regs		= 1,
 	.irqs			= pm8008_irqs,
-- 
2.43.2


