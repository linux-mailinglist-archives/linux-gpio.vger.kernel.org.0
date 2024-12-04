Return-Path: <linux-gpio+bounces-13491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7519E4301
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 19:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0AB0B25420
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8637227BB4;
	Wed,  4 Dec 2024 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUQfYzPd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E816227BAB;
	Wed,  4 Dec 2024 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331525; cv=none; b=k2TWcGoYLiEzAbFRappsLc8PqfIbvRKKy0rSqmHt04wyevD+Tem0dYTHQeg5WG+DkqYu3Rjwxr4fN0G8A0mI/nrBf5GNNCmCIEpjJcb0hik6kAinpvVJUsjSmSLFmG5x+pCJwQ6hVVVVTkoaIAeiAR+/gWk4viAH0+pPkA9LoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331525; c=relaxed/simple;
	bh=4PTzI9SiixNaBPPfu0IX8+a8aPSOijkDtiLpKSS0aaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hxkM67Dom9MuAl7dU6ZVmjwNqEhuJ3hE9Kncw7KgsgAtsbQ7R5iE3QBWadvmrehlVkIJ3m7nMoYTZQW1pXaw2u1/FlAOE6vvUV+8IBmwypivL9wJOl/SZc8lArIwsezeonMTbho9HbjOQFu2w7W5N+/23obdhVSdGzF6fZRV9uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUQfYzPd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E41DC4CECD;
	Wed,  4 Dec 2024 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331525;
	bh=4PTzI9SiixNaBPPfu0IX8+a8aPSOijkDtiLpKSS0aaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUQfYzPdw8XmwjUC9WBlnZmpAGGeAhlpItoOiQ871L6ch/8mw2I4oTHqyDPMZMsMu
	 XbhE8rmsJb+iUioJ0rg0QSy94RJGIM3HhdqG3MwwbQ0vnqoqx+OvH8Wf0MhiSLfl1W
	 zwIfeAHpH7MzXxpIGXnJTvjhhCNhWvzgRknKDPaFmzjGZiGwPLQuhrHA0m/53Qy3bM
	 FQJXWgktOvj5CPOUI9rOLgRRtrBfJ7+HZyeYOtPXm9WWHeGU2Xiwlx9Ymo9sBlbzs7
	 iM3AG7hL1Snn4SPAFmaIUyk56OfJ6BsD/+CqrVjiYbKV4rhyBO8ug2XcTPRmzCi589
	 AHm4/x8P3+RnQ==
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
Subject: [PATCH AUTOSEL 6.12 28/36] pinctrl: qcom-pmic-gpio: add support for PM8937
Date: Wed,  4 Dec 2024 10:45:44 -0500
Message-ID: <20241204154626.2211476-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204154626.2211476-1-sashal@kernel.org>
References: <20241204154626.2211476-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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
index d2dd66769aa89..79ee60514372d 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1226,6 +1226,8 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8550ve-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8550vs-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	/* pm8937 has 8 GPIOs with holes on 3, 4 and 6 */
+	{ .compatible = "qcom,pm8937-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	/* pm8950 has 8 GPIOs with holes on 3 */
 	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
-- 
2.43.0


