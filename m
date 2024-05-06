Return-Path: <linux-gpio+bounces-6146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8E8BD12A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 124F5B236D8
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D533E15575A;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNDhr/bo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B774154BE9;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=LCCXBx1kg5hL0VJePBJIssDbwP4SdwCCSQjKrQ3c+KnuZrklQFwRjg5NwNii0lSJuH+cB9+sjw5Yfnp/OBk8uq6X0y91Yt6xZ3K9Nbst07xZVrX6882Nnra3i3FYTRKoGzRjvijprBmtxZFs8LF3IZpOXuPZ4rB7fCICkJT2lO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=HhlLnCR9F5J17LJe4ADpdzxAsvlsyae/fKK3YJPeBm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSaOypagbCm+EGMUl6TqtUlnSQzcCw1qrFv7RL2kgoFls9thoDni7ellV1b8uzNl5419MhTHkpMH8XJ1dYv9VwovtbOmMLjjn72andcNRiZUX/B/vtFI80AChlf+q8tK5KnZSuhTLhTgKMUUm25Bb25fZ6b9XzejP7Y3GCEOhns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNDhr/bo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D1DC4AF67;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008214;
	bh=HhlLnCR9F5J17LJe4ADpdzxAsvlsyae/fKK3YJPeBm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VNDhr/bodaRVN3PneIIGwUtSGZse8FFNzIApL4G3CurQ+0bJOKVu2Y1w79zvtr38o
	 l5Zn5c5vdA+SAKEm9+DSXnByXjUX1t8jTEiN1Jr5C1WYNeq9yOLTLLblHM8K24UIJw
	 Adqc1/XZXVIp09CdXQWjn29bmjIydQ4m7+65gGUysvfSXRuTLwUl7Quz/Kdl9p+Uhj
	 2itJyVHnkT2EbVjXVPNAbxWmS73vN11JeSnkIHIxseDNcILfwYBYuAiFJSv59O5FG3
	 sOBa8KK5baE9+D3vegG46MWopVVFC3t9Uuy24snTUi0mjomct1jgZAFHg2zB77bNyQ
	 zHe3bu7Ov24fg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006CH-0yFM;
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
Subject: [PATCH 05/13] mfd: pm8008: use lower case hex notation
Date: Mon,  6 May 2024 17:08:22 +0200
Message-ID: <20240506150830.23709-6-johan+linaro@kernel.org>
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

Use lower case hex notation for consistency.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 42dd4bf039c9..f1c68b3da1b6 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -38,8 +38,8 @@ enum {
 
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
-#define PM8008_PERIPH_2_BASE	0xC000
-#define PM8008_PERIPH_3_BASE	0xC100
+#define PM8008_PERIPH_2_BASE	0xc000
+#define PM8008_PERIPH_3_BASE	0xc100
 
 #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
 #define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
@@ -153,7 +153,7 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 static struct regmap_config qcom_mfd_regmap_cfg = {
 	.reg_bits	= 16,
 	.val_bits	= 8,
-	.max_register	= 0xFFFF,
+	.max_register	= 0xffff,
 };
 
 static int pm8008_probe(struct i2c_client *client)
-- 
2.43.2


