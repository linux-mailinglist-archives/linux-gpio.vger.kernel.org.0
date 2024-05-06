Return-Path: <linux-gpio+bounces-6152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400E18BD133
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 707651C21A89
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D1F155A4D;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9eQ1sU3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBDE155341;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=jv6MocxXT2T2N/jSvnFAjhwJoVTijiEtLAzB7BnPznWYO5oGNT+EkOWnVgfaBcfGuItwTYUj6jZP4llMTmbjQxT2yf6NIaRyQbheG4d8Gk1NH/yytRxRrKXj4SDZeA3phd24nZSeW3gMfB+JNbTOxVN2KFfRa35pCds/IBPLUKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=WE6fiiBRXkuvD5QoFFN6grCsQPErDYZqFjeNOGTsme8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Obc8rJfCM9llb36q5yTOf6TTZtmqeVs7u7QdyVmxC/VkWxaiHjMZUhWIaWdplTfSOLSRSAVVQH5iJHr7GCa62cewaeE6BpCmMGQyIGJu21oIyt3+faUIBwRr3AXqG0wOToyRV0K4SsDF+Iwc+2/jS0E04A1yYJFoL5aIKaDGAwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9eQ1sU3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98C7C4DDE0;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008214;
	bh=WE6fiiBRXkuvD5QoFFN6grCsQPErDYZqFjeNOGTsme8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9eQ1sU3y8iRZaa55hQUp+u8QHHIElfOLFNPrXhYMn8oNWIfZXJFvT45rp/W4Y9MQ
	 33rq2nddVU2v0apc3klXXTUZShxvfEWB9Va5xuo37c3EinT7kqslTlSYyGa8OuHX6S
	 zJO6vvQLRcxDu0geIo7a9iPVZGCcVsA/fj85EbR9sZMHQvs6cYb2m+zZjdrh2o+E2X
	 4eRHFt7p7YV+hbW6OVvTp3n2A6TtsaCqLfbLVL5+LuOrfsaEdqXNjNi2eUfvChk87d
	 VItoLd7NXWQwDtyjWC2tPDxX90inkqXcEZ5+OGkTTbDaUzmvrh1v+gBq5DYfLh9iFS
	 Z2ZZW3w83VQEQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006CF-0ekN;
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
Subject: [PATCH 04/13] mfd: pm8008: mark regmap structures as const
Date: Mon,  6 May 2024 17:08:21 +0200
Message-ID: <20240506150830.23709-5-johan+linaro@kernel.org>
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

The regmap irq chip structures can be const so mark them as such.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index d0f190c2ea2b..42dd4bf039c9 100644
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
@@ -131,7 +131,7 @@ static int pm8008_set_type_config(unsigned int **buf, unsigned int type,
 	return 0;
 }
 
-static struct regmap_irq_chip pm8008_irq_chip = {
+static const struct regmap_irq_chip pm8008_irq_chip = {
 	.name			= "pm8008_irq",
 	.main_status		= I2C_INTR_STATUS_BASE,
 	.num_main_regs		= 1,
-- 
2.43.2


