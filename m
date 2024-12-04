Return-Path: <linux-gpio+bounces-13505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 511AB9E417D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D401289E58
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F58A226EDD;
	Wed,  4 Dec 2024 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+RcrQ3b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46395226ED0;
	Wed,  4 Dec 2024 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331791; cv=none; b=UpuZQrA7bF3CaoLhtZ7GCrO6/v2JbUDHXOQi/teJ/Oq2VZwXUvtyjigvPpc2QZDMEQQIdC+8pFN+U5LkdbfdiqFwbH+bmx/8h2k7bqFZvkTouK4d63W56tVOuoqtZLfO5flzekMHr1WMXvVfOwvAI9u8m+VscT83fXo5wLsH3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331791; c=relaxed/simple;
	bh=XJDQxIdlkmIqGQfjP5HpKi0zsi8ZCuk2mF71PYsEefc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wic8HZbDHBDv8TugiqQ+JPku6z/g4IBCgvX4muFGCoToydY3cKyUCTOOuzcTXM537l+qbw5JWEjBVlA5A5eAfwEt1vFQ76X0GOW6nJbpAUZNd3JPPbE5CA18ImGxXdMgnwujRtgZlTPKPE7Mt4W5fmGEhngbazPd1eTRvROyCmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+RcrQ3b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD18C4CED6;
	Wed,  4 Dec 2024 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331791;
	bh=XJDQxIdlkmIqGQfjP5HpKi0zsi8ZCuk2mF71PYsEefc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o+RcrQ3bynBWlHOpxSSZVdfVazrJOZxszpGyauTvd9XxqqhTfDQmF6O7iOBVLF+7T
	 FUbgf48hFD0BeDacNptxB4cxweR1VkJF+AACosz4MxENlwvU7nRO/krSGhVZO/5OqX
	 y13henmv6p5RAtykH6Ej7KdAa5xiizFzQt8Ei83PYif00G+u+Enfs+PbLr8+MhWjwR
	 jGLzxtsT+5SsWZMc2AYpmDO3ybAJ/8Dlzwj3FK5h11WI4gfRicVnjeQ2Vsw+Eq6ALH
	 OsBHp2nTEFzC+kNqtL6qzl4uUPxCh9xHdnLuqaFoW1kLyIP438leDn7E+a+zJpnjOb
	 pauqeDMD6DC4g==
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
Subject: [PATCH AUTOSEL 5.15 8/9] pinctrl: qcom-pmic-gpio: add support for PM8937
Date: Wed,  4 Dec 2024 10:51:38 -0500
Message-ID: <20241204155141.2214748-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204155141.2214748-1-sashal@kernel.org>
References: <20241204155141.2214748-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
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
index b2562e8931397..42f8b661f19c0 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1156,6 +1156,8 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	/* pm8937 has 8 GPIOs with holes on 3, 4 and 6 */
+	{ .compatible = "qcom,pm8937-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	/* pm8950 has 8 GPIOs with holes on 3 */
 	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
-- 
2.43.0


