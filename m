Return-Path: <linux-gpio+bounces-6880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B70D8D3CCA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 365A22870BA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2B51CB300;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpo4OJu2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563E194C76;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=kNAL+jy/dXhlKzGZ8pz2sx11/cQLbn9kskgsNcUk8P0wfGfZ0zWpu4TVqlPrDEjFgh8RXAmRUlEl++SSW4u1s5dQRIb5xEcla/e1/+6yqKPlymfDN/hXyT4MjenS2epxx11ZgFrnrcQ5p8qyxi9ysRp3/RGp58fvb9iK65w7Yng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=6qyl2l/7GJ36hxg+alBAoZ3ixQ8wp+igH5vBpgh6QLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMQ6giGslfC77S5dwJCyujbEQAnCPmA7QFP20CiBLznnGagPGgKyD8steiVh8EOIcbihvmLRhKUIOvB6YwhUq61vJih1LVdn3P48K/7VI5pEFxl+p1gkwbA4ziYwVzG2HlIE8UdQuqUGxsnICNZ0kONyMoGSUn5cqypLyzuX+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpo4OJu2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F1DC4AF10;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000236;
	bh=6qyl2l/7GJ36hxg+alBAoZ3ixQ8wp+igH5vBpgh6QLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cpo4OJu25woQCRXyS1H4K7mvjp2+w2dkahdVBQqpNXz9v3XFkcfU33gK0uWPGrM+5
	 z9phuPkp+PRH4cnfUtXYtO4Ih8RG9RSfZkkMtF2Q8kZYFmC2xCOzmmHOl7LAPMe2Oc
	 sWe2exDkYZ428k7YI/GwdL27w825EbI7SO/qONkIxGU74Qy6lqab3YzLO8EoPTTH7h
	 LrTP0BPcfkWZhJP/Kk/Kw2hUyYPQWEG1eDC18Y9QbPKw0Ts9Dl36If4F/KA3rmc0qS
	 fSgl3QdGYRoFW9oLp7My90wB1+sbZgqKv86xvVVu0bv238j8NE8QMgdBnJalkRR8qg
	 jwS225+m5Gq0A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCB-000000004iy-3oEp;
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
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 08/14] pinctrl: qcom: spmi-gpio: drop broken pm8008 support
Date: Wed, 29 May 2024 18:29:52 +0200
Message-ID: <20240529162958.18081-9-johan+linaro@kernel.org>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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
2.44.1


