Return-Path: <linux-gpio+bounces-6875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 660838D3CBF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97B611C210B0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9371C9EC9;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRxff3Si"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A48F194C66;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=L5Tlqn/0krb5PP2Hb9mazOZ+P/P1hu1K86fb2lQY+GIEJmCMKLUedqxBxyp2YUasPSze5K3eGIGppbqjZ9zGo4XBkbgwfDx02Q7QqfIyMv2JmY747L3axz4I2HjCnclTH+gExmTA7qV7ccvumyt8TT/4r2qV7ISnmE7sxkxxVJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=9D6ySfgbWhQOFK6PfMLujLLbbQCJ9ljTc4OjiKugm44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lz4XkRXZWNQ6+28QwWPSyEHFm30tsnpGf2hZzOebxZWiKkIQMqta/VD8WP7FvsdvMjrviirh6GGvB9FFZf10VioxENxE9O2f3jELjVWrH4hxI9WHQsHjyGs9wj5ZiDiThnVAyxAytfAhz2fmgyYm5/BT4QyfQz5jAxOXB0dta7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRxff3Si; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF042C4AF0A;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000236;
	bh=9D6ySfgbWhQOFK6PfMLujLLbbQCJ9ljTc4OjiKugm44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XRxff3Si8T3w4EsMM+jiwSbHJVXoKYJr7+4jRhq3FPMhNW8MOd8WDyhOP0DYIdwQZ
	 cze326C+SxHZmRMLRVEjwPB18DrmdxVnZTN7xvFpyG7MZv+pAdak4wbw22dReMM6Dr
	 p+2vwxrYWkjDNC/i5ESOAwZcwC1ESIo1M341EYYoNFOFWyrma/ZDLCY7zivkxs7peu
	 bdL0ZnDvV2ZykombcCouuP1hECvifMYyutR7DDtqmies3nB2gjSah77s8t+9gAG+E1
	 vtQTmPBYVC+DftcQypp0td+11f7Jm45ov4/mis/vTfBvYk2DiAA4lV94LqMgRWto4L
	 Nj150dMoCm9EA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCB-000000004iu-3Qlj;
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
Subject: [PATCH v2 07/14] mfd: pm8008: drop unused driver data
Date: Wed, 29 May 2024 18:29:51 +0200
Message-ID: <20240529162958.18081-8-johan+linaro@kernel.org>
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

The i2c client driver data pointer has never been used so drop the
unnecessary assignment.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index bab17417aeec..72199840231e 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -167,8 +167,6 @@ static int pm8008_probe(struct i2c_client *client)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	i2c_set_clientdata(client, regmap);
-
 	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
-- 
2.44.1


