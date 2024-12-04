Return-Path: <linux-gpio+bounces-13507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB2F9E45A4
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 21:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9244BA2877
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68940218AD5;
	Wed,  4 Dec 2024 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVYI9wIr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFFC218AC5;
	Wed,  4 Dec 2024 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331808; cv=none; b=Xf8Bf8jhN7cvGJZ8j7mjwgbJHUSq2C4m3w6MF+sbJjnMx28YHWV0AB1A1TZcxlgJA3x1XOyqwokY9ekZ8iGDKs85CoP+sI0RMu+ZXgEj6ikg9E8nAEOdQQysrqHab70VCHACz6wRPV5O+bltGUnWvwSgxPPBwL9ynXXEgtYUFsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331808; c=relaxed/simple;
	bh=BAtYgzy4rvRUDcmcLeuuSuc7wPnz3hH/LbP+TPbtIzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZBhqMN821S2gY4/cPli3WmTwN6MCe7Q2OssPyr6G/emXVAhER0urRGOshp47Eof/v2fWapoHLD+0JUr3xDYJ/m18WAS9aS9T25DUhYv1tBO8cS51uPGZ4M+iNLN9rRNRbaly2jGccVDaVmY4S7ARxmZw8v5djwchHjpD4YeqCjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVYI9wIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0AFC4CECD;
	Wed,  4 Dec 2024 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331808;
	bh=BAtYgzy4rvRUDcmcLeuuSuc7wPnz3hH/LbP+TPbtIzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVYI9wIrMa0FoaHE6R0x9OdTCWbxk/REHmHxirDlTn3zrMnb3iEaQkCrUUlX/uE+x
	 Ed4ABdEgwOZIN+V6pIhDsVDaqd5dDmoVUR/eWl0FxYsJvTs3TiaflH2otKV1ATKLND
	 PWlTsJTKGEf75lXSKAAkQnA9Y8qiZ1b9cOc5voXP+OBxi1Rc2/LF7S7TPqu0DVh4MO
	 /JyDpwHyqcmzU3NOlOzF7tQbVCJGOiAV09sTdyfxv7iTqJB4RUDkmFBCF6lx4u53z8
	 urTpbSiVkiPELXlhCBbv/l/bF44qQno0vKCrJqDtTeVfS99tSmzoDoSlp6UIxJvoJt
	 jzZTjfRKvGJrg==
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
Subject: [PATCH AUTOSEL 5.10 8/9] pinctrl: qcom-pmic-gpio: add support for PM8937
Date: Wed,  4 Dec 2024 10:51:54 -0500
Message-ID: <20241204155157.2214959-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204155157.2214959-1-sashal@kernel.org>
References: <20241204155157.2214959-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
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
index 17441388ce8f5..fd1e4fb176c79 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1106,6 +1106,8 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	/* pm8937 has 8 GPIOs with holes on 3, 4 and 6 */
+	{ .compatible = "qcom,pm8937-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	/* pm8950 has 8 GPIOs with holes on 3 */
 	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
-- 
2.43.0


