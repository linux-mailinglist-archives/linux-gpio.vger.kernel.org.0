Return-Path: <linux-gpio+bounces-6148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A17E8BD127
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27E3A2853B7
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11C6155A30;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfR5drgW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F5B155336;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=D5ur/YhYk8qOIJcE0BVkZ3PgQhfMGMcZKEB/o/lcfeZX2oJ3tMeSm/e+6jegis4S2iJFTs5WAFiZp6NFk1lh7FlVqU9fEW2HlB/tEr82f2MaiiaIVTlg+6eyfSf7TTQsWfo8O2eCSTX+LRfM44QaLQ+OE3761hpWAlpIGmklXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=ysW2dfSlvMClvcrj43aokizS/K9NZ5GHVi4SudgETa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1NOqUqYc0SkWdDgxQXKGpyR4qBypoCmedHfS9jJ2Shd+Fv+vgz94ehUegRmBte8tPlo6r7/AUwPVmAO3fajl7s4TltQIkqkNkoGdQNYNdvaL1/f8VzXXaNnj8NW7fs4NuZj6zr+IYAXuiUgfA0e3LEVP8i0iijiByqGNvUkl1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfR5drgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4220C4DDFD;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008215;
	bh=ysW2dfSlvMClvcrj43aokizS/K9NZ5GHVi4SudgETa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PfR5drgW597jkO7PARyT6eQjHYQ9cnUHTy8i4JrrMV8+PnAjO+Zzwol8lzL4Tit5I
	 oXDwZjot/WmMDmxolLhVlDWVmafDYu02txnCzojkBeKRL/PkzPHQySLVRoVxF+1/+J
	 39Uea5MJzS8QEgnzIp8L9lVa+9qxzmuEvTIXi0NLBOsP5xzsJ2vRm6pyW7OaTAD8Tq
	 NConWcEdhGICWofjR3CRAhMK+uASZ5R0VLN3akWZyDwG1AhKepmGxdbOoNeBllDJ6c
	 5L7pfZKHPGsi73R5FhDrtJDvKTAYqrfLlCcO6dTDUj8LccERh1IE1pDUux/NDGop6M
	 24r+y+/r/6zhw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006CP-2KgO;
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
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 09/13] pinctrl: qcom: spmi-gpio: drop broken pm8008 support
Date: Mon,  6 May 2024 17:08:26 +0200
Message-ID: <20240506150830.23709-10-johan+linaro@kernel.org>
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

The SPMI GPIO driver assumes that the parent device is an SPMI device
and accesses random data when backcasting the parent struct device
pointer for non-SPMI devices.

Fortunately this does not seem to cause any issues currently when the
parent device is an I2C client like the PM8008, but this could change if
the structures are reorganised (e.g. using structure randomisation).

Notably the interrupt implementation is also broken for non-SPMI devices.

Also note that the two GPIO pins on PM8008 are used for interrupts and
reset so their practical use should be limited.

Drop the broken GPIO support for PM8008 for now.

Fixes: ea119e5a482a ("pinctrl: qcom-pmic-gpio: Add support for pm8008")
Cc: stable@vger.kernel.org	# 5.13
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f4e2c88a7c82..e61be7d05494 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1206,7 +1206,6 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm7550ba-gpio", .data = (void *) 8},
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
 	{ .compatible = "qcom,pm8019-gpio", .data = (void *) 6 },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
-- 
2.43.2


