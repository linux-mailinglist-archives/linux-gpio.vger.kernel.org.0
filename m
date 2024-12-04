Return-Path: <linux-gpio+bounces-13508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9F9E44B3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 20:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0666B3872D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B199218DA2;
	Wed,  4 Dec 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cF1SIAoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3303217658;
	Wed,  4 Dec 2024 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331821; cv=none; b=tU0q9CdIkHCuJNsulZRFLjdq7t7V4KZiBtlK/tboexH54dUxehR9T0TMyqQSRmw+CZIqngUwzX+WmLQ/gaYmWjWjbxiy5YQrGp+cCoDr2Etqp7bso74lpIenlKZkJy54HhTABcnA+WGaahF+zmZQPMp2C8jwKwgMwmAXEvEJ98Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331821; c=relaxed/simple;
	bh=CEqkOXGETOkGK4u5GSy8DHUBm0rJ9QD13ykbmqrS24s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AVW4B8Ql4CvMbsuZX3jrgCL1gkrLvdA07PbPlEraBZ0ATAuYW8Jzsg7VuVOpPNcGpO1yyeshnxZWAGrkrz9PQgdVWHEmXvVPwlmBDMrB24hZ63Dy5bZqGh2TLZdR/ISfDkY/J3pjzNU0VNokgDtnzaCvrqyXx3cHKAQmWIwkyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cF1SIAoJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E70C4CECD;
	Wed,  4 Dec 2024 17:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331820;
	bh=CEqkOXGETOkGK4u5GSy8DHUBm0rJ9QD13ykbmqrS24s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cF1SIAoJt4TOZLRpg+GY1Z+ZegfLB7w60fjCNqGCuPR9hactl9Rp1o88jKT0oudEh
	 aVvEROCbsgEEYcmkBhFU0l0MQK5R+GvRb3ibnOneycepABRTHjASvun8btva2DpjKm
	 RQrUsfj475COSs71YI0Sc/zU5vYquOxPQWBXSqFSIGLwJABsFdrVV2gw/P73/OxAvs
	 v1Dzl1u9pfvTJHIzS0gQl8daJesP1pQcYSYoKwJ6gTV7XKT0FH6UFWxst0SGzZvJcl
	 tAYb9e1vVlm9NBkDXP6DuMS0yS1+FvM4JwigK9HIpzHnaJaSOybUXfWzx2TBF6Lg2A
	 rSff5Hr/3En+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 6/7] pinctrl: qcom-pmic-gpio: add support for PM8937
Date: Wed,  4 Dec 2024 10:52:11 -0500
Message-ID: <20241204155213.2215170-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204155213.2215170-1-sashal@kernel.org>
References: <20241204155213.2215170-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.286
Content-Transfer-Encoding: 8bit

From: Barnabás Czémán <barnabas.czeman@mainlining.org>

[ Upstream commit 89265a58ff24e3885c2c9ca722bc3aaa47018be9 ]

PM8937 has 8 GPIO-s with holes on GPIO3, GPIO4 and GPIO6.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/20241031-msm8917-v2-2-8a075faa89b1@mainlining.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 3769ad08eadfe..ea244b00d5bed 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1106,6 +1106,8 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	/* pm8937 has 8 GPIOs with holes on 3, 4 and 6 */
+	{ .compatible = "qcom,pm8937-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
-- 
2.43.0


