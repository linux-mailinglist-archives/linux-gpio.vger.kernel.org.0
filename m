Return-Path: <linux-gpio+bounces-6871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A3B8D3CAC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F983286127
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5787119069B;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gysS0y5G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063E518735A;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=FvUN2tXhG5x6RXcBykxte6ThBGQNAdmvZe4Shi9mG+6aBYWFZEX3sEhsKtwJv5qNTiRQCK+BLuUAqglFfUvAaooGNhd0a0cj6Pk/zHRU/AS7FPIuihqavU/P8Qzyy+AyQzJVP5GwLwVlcgzcn9IlEr8k6/E99zkNx98+wXU1hrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=ktUgF/6UawgynxPPaqC7L5uMYlNVYYch3qE9zi0eRhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBe4r92kfJ/Iblt94TpLr7B2l9ijyxjSPeYaEpnTETCWi97Mw0JHkx8nKbtygbTurTVCKew9yfA8kGt2wCW0BZvzWL9xTFvsZySxnyjM7eRSbRYhnCb7dV0avpsnChma7q8zTjS/+fmJgpcp7BHQiTbrEmDJ6b20bhLfoVDEiso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gysS0y5G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837EEC113CC;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000235;
	bh=ktUgF/6UawgynxPPaqC7L5uMYlNVYYch3qE9zi0eRhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gysS0y5GxOLy2gSWjX2Nmxy4IdenFHxzkia8cDFvsi07Eo7trhiVbQKo4iM/edUJ7
	 k3bmhjOI++rlSb6TWrgx9+oEzj0IRK2lAyMBy78u0CK+K75vEmh+/pjLr5pb2Luktl
	 Hpz2jlPaVP3GyxftSYxco/yu626Ay4KzVhUZWeIOz3otyT7GYXbiS5E3aEvEarBXft
	 IK34ztYY/17GJq5lqkaNXJoaYfRZZmT6hj8YKpKKzC3Mzx/5hqf9FS3oC/wxAYCL0r
	 YEVFy3XXiaNcYHWMvvPBUNo50W0/Wnv36e0WyT9K0IspiCjsNhCDo2AOKlINM9lxFM
	 qseiQLW1xaseA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCB-000000004iq-2nfk;
	Wed, 29 May 2024 18:30:35 +0200
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
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 05/14] mfd: pm8008: use lower case hex notation
Date: Wed, 29 May 2024 18:29:49 +0200
Message-ID: <20240529162958.18081-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240529162958.18081-1-johan+linaro@kernel.org>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use lower case hex notation for consistency.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index ab55d524c27b..18173c7a7e7b 100644
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
@@ -151,7 +151,7 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 static struct regmap_config qcom_mfd_regmap_cfg = {
 	.reg_bits	= 16,
 	.val_bits	= 8,
-	.max_register	= 0xFFFF,
+	.max_register	= 0xffff,
 };
 
 static int pm8008_probe(struct i2c_client *client)
-- 
2.44.1


