Return-Path: <linux-gpio+bounces-6149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7CE8BD12E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 581FFB236D2
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE5C155A52;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn4l2ry0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4F615533B;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=Has7jwBuG0EGIgNHyS5ntO2vab0xhPpkVmF96/dSasTbNc1gshbUcqS9Wx475OnFEyjHh3aLypLarMpbmK3+j2tdU0WqQPqCKa08yuVGoI2QO750j1d7eVGM5137/9G/FnJU9kfuE+xT2//71TryucvOR5kwh26N4s5tO5e9dNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=HmGUGhnzq6QWX6rTJF28CKXiwTy0X3WDlAtZACUyhGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmxVa+OlYYoMMwgNkHKQvARPjCiM3MpHvj3mzSsAbiqRbzep835XY8HgSy1P/jdGaAVnGsFvaS7qcB+lUPCPC6l8G/mwuVpCMi55HANENBmie1l/ST/mqHToFarUDNrf+JBttIGR/QWbX4hnGuaXdHYn1P95r2ijOa9/FCdMXjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn4l2ry0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC291C4DDE3;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008214;
	bh=HmGUGhnzq6QWX6rTJF28CKXiwTy0X3WDlAtZACUyhGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cn4l2ry0hKT6yqFRwCGAXb20eJaRxo8ufaXe1rq3p25aXgXmMSXuQxsFcJVw1EBMi
	 m/4k1KXL0hfWhHM5Yxohn/ZexZuaIcadzmh/Qp1/jW1vkmaNNbsfVvinsv2OKNznQ8
	 P2fzeBtQ7miyec2PfOEZ+z95Fpmjj0L0U7Tv+VT4AvA9llvYfkXoAGfGLtuZNt2ITq
	 m2PaWC9PU8tDkafOWoSfuPhxJPVJmiU/rbzraFwNJDsYiYJXLmAW5LS1TsYgdnu81x
	 +t5zksOxwU1xMQIhbzIcwBT5Cmh+YI49FWJjn0W4seekphkYUo6lWVvuH9KeRIsP95
	 M2hTBEhF8TC4A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006CD-0KE4;
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
Subject: [PATCH 03/13] mfd: pm8008: deassert reset on probe
Date: Mon,  6 May 2024 17:08:20 +0200
Message-ID: <20240506150830.23709-4-johan+linaro@kernel.org>
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

Request and deassert any (optional) reset gpio during probe in case it
has been left asserted by the boot firmware.

Note the reset line is not asserted to avoid reverting to the default
I2C address in case the firmware has configured an alternate address.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index d53c987b0d49..d0f190c2ea2b 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -158,6 +159,7 @@ static struct regmap_config qcom_mfd_regmap_cfg = {
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	struct gpio_desc *reset;
 	int rc;
 	struct device *dev;
 	struct regmap *regmap;
@@ -169,6 +171,10 @@ static int pm8008_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, regmap);
 
+	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
 	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
 		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
 				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
-- 
2.43.2


