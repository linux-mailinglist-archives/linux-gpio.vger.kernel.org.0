Return-Path: <linux-gpio+bounces-6872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394858D3CAE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69ADD1C250A5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67158194C64;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTTCjZlN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FDD190661;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=dQAoosMlCtIE/qTgR8LcZMCc2L/r3PueT4aEt/4B1kVSA3U6/iA7gK1XMiL3gMQVmL+8QJfQTRQhrgX/jSOL2+yuMsU4ZpK6sOPYrBAk5+1YFjWXjzSUiiL4I//hzM7YWR5eVFNthMkApx4xyYvdmNb6Anwi18Zti0Z1idRsDM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=xvGDdXmPugW8gDTyzx+vdea6PEvo7eNqJuG1wNKxm9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3i0ke1PezoaH/0OgCUcSMBgBC6cSQWvWIMV1ylae9JQ9007/6UoxS/zHtEP57eivlst9q4ZBYIlMRY00ddRQJx7X6g4qiM2ViUL14XgTID6GUgvtuBohUYf5Z1MTMTNBcYuW+QL/TeER4bglRxcYqQ9gUrgYY+taKMG+JKhe5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTTCjZlN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C57C32782;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000235;
	bh=xvGDdXmPugW8gDTyzx+vdea6PEvo7eNqJuG1wNKxm9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iTTCjZlNlK954ebceB6ssZ+LdKlW1fV7MIqih+4zIpyx9aJtY85I5UDCc2+Lugc3n
	 srosb1DPi7aGuN7Vw+tY3nQpZ5fu0pn/BW5AE6FoYU9CQhLkNsKA9s4v1TTG3S/uYp
	 rJRRajRwKpxvewmAa9Zhept+6oZdSE/DxW9izkE0ArnFxdYaKNF313DLeGQCJckeHB
	 4MPBw4beAKZ8TwUsf0cG5g9C5wv6yXaCNI3TaKGU6C5cRKzWtgdcrDfow5Qzkm2Znj
	 JP3ScQ0r/AmJnUvglKezbmpkA2Fak2MtwOeNCinppCowvd5bY8AFnzpuPxs9NGl1lM
	 BNYPcBRLZc2UQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCB-000000004io-2RKi;
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
Subject: [PATCH v2 04/14] mfd: pm8008: mark regmap structures as const
Date: Wed, 29 May 2024 18:29:48 +0200
Message-ID: <20240529162958.18081-5-johan+linaro@kernel.org>
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

The regmap irq chip structures can be const so mark them as such.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 5a77155a63d7..ab55d524c27b 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -51,7 +51,7 @@ enum {
 	POLARITY_LO_INDEX,
 };
 
-static unsigned int pm8008_config_regs[] = {
+static const unsigned int pm8008_config_regs[] = {
 	INT_SET_TYPE_OFFSET,
 	INT_POL_HIGH_OFFSET,
 	INT_POL_LOW_OFFSET,
@@ -129,7 +129,7 @@ static int pm8008_set_type_config(unsigned int **buf, unsigned int type,
 	return 0;
 }
 
-static struct regmap_irq_chip pm8008_irq_chip = {
+static const struct regmap_irq_chip pm8008_irq_chip = {
 	.name			= "pm8008_irq",
 	.main_status		= I2C_INTR_STATUS_BASE,
 	.num_main_regs		= 1,
-- 
2.44.1


