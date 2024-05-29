Return-Path: <linux-gpio+bounces-6873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 174BA8D3CB1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 467D71C252BD
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9250D1C8FD4;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZ+7vg+b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6A190684;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=QhtmQdy0XOnw/0r+j52J+j9nQCX+lgsiUgAquVj22qyq+ubuIr8cHrMpPYn9MMOVIRaSowwvqNry7IO6mzHb0b9foL+AzSKrEGHkFOQ1Ss/micr7Xf7D64JzGpcEpHExbSBhgVoAHEp1ksVOdnRGF6mSsQ9z3JZHPACLi4TuIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=lga3d+eXyDGzWJge8vvnwfcv1gyBqqWJmkYtkVpaX6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkzajrZre9/uAf+zcHIOnrhJFIerr8vxu5ps7gXm3DN+kN7HA4gtQICHRIiYdSGjoPjz9kw0YgSlD3BSy/hxPH9asm76A231RwSpaXZcCVWFcp67HsL/fqqAIqswOZ6Sk3xoovZtuUJhPXGLq3/YtBnnP+JuVfW6Fa5rq3Pp3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZ+7vg+b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F71C4DDE2;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000235;
	bh=lga3d+eXyDGzWJge8vvnwfcv1gyBqqWJmkYtkVpaX6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pZ+7vg+baXHSYPaOi0WCGDW/RzsM6T0n59YPjj+DfPiAFJ89kLgRFQxk43lDah0Cv
	 A7M/w7pFpq9EJzarS9ED9a8bcEC36L+GDRz1tlXBuRWPw5zQL87X6ZnDEc3cVugyEA
	 UyeVZtl4G9/BH+hpaMjaMYswwHmgKqpJVblM8YgF6mGdwgmPxriH279kXWIrUQsf9z
	 AY7vr2HBNbvlWUOFKuqYHCLp9nzFMxKOKvxNqn0/gUBIU/nCMMxTKXn3jjZMAPRY6p
	 l6++qcAYMzi+P4fjnnCFY7Fo3j9w1UlNbnQr7oDv100widQfbsI2Lm/wGt7PDunz35
	 fWvSran9qZ82A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCB-000000004is-36OJ;
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
Subject: [PATCH v2 06/14] mfd: pm8008: rename irq chip
Date: Wed, 29 May 2024 18:29:50 +0200
Message-ID: <20240529162958.18081-7-johan+linaro@kernel.org>
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

Drop the redundant "irq" suffix from the irq chip name.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 18173c7a7e7b..bab17417aeec 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -130,7 +130,7 @@ static int pm8008_set_type_config(unsigned int **buf, unsigned int type,
 }
 
 static const struct regmap_irq_chip pm8008_irq_chip = {
-	.name			= "pm8008_irq",
+	.name			= "pm8008",
 	.main_status		= I2C_INTR_STATUS_BASE,
 	.num_main_regs		= 1,
 	.irqs			= pm8008_irqs,
-- 
2.44.1


