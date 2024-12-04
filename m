Return-Path: <linux-gpio+bounces-13502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5C9E4166
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E54D167DFA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B5F224AF2;
	Wed,  4 Dec 2024 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKqRkNC0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97185224AE2;
	Wed,  4 Dec 2024 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331769; cv=none; b=HhXzBORSL+8knVNUOn9r7ywHIfxkLNvunUSjRRIEILYiaJQ5Ubcur6Fg8LcZV7+m1qz0WLmEDXSCf1FXBSrhVddhSMvy8n57f0iPOa0o8x6om0RPBNqvphuwyPG8z0TFE+c/vuFlDmC++iwINtyRpT3/R3cBZl5AqRBF9pnWkcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331769; c=relaxed/simple;
	bh=QS/ZBPCkzVLC0rhnq2BndNZJNnvf7RIDWqh/r/f5dzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gj1dfGJ5FDr1zI+AN8k3OEfjcHWObG9q2Rmoae7Zz3kJ7nJVI+2JoJV5+9deVuMWHZIA1/MHq5f8hXFTBlWameGAvDfATLUHyyV2ADpUYfhrQ59gTb3UXJEeSVAAD70X1uE6bXN/CoKsH3s1kcrNfqjzqLYpZQlI13y7NQg95Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKqRkNC0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAA7C4CEDF;
	Wed,  4 Dec 2024 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331769;
	bh=QS/ZBPCkzVLC0rhnq2BndNZJNnvf7RIDWqh/r/f5dzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKqRkNC0agG9UecQNkQOrCbeLeniuF7lS+9J0iwQ/3nw2wyiBEsaRfvRNkjfOIJd3
	 VSCD861v+W82TKxt90ejOsU7MsPkDTtW2t43ps1FcnBJILDoN9U871cAz1KIlF563Z
	 A3qvbx4/KAIESPbnxCLD1nKFf3EgDtVjcWsn4x8p6XmLjZTa7sRAc57Y4hAaMEmoRb
	 8yDsMi0XV5m45tNmqYSbAziPm+XdVOsB9HlcjBZeUSHigwPzgjpfKfuBL3Ka0J7nTu
	 r08Ob3N5RdN0wzMmAUsNVwtvKtkOV/M4vP31uMvBkIcwFMXqSgWZ1W9y2Entsg+t+k
	 3sv7B69wdi1Tg==
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
Subject: [PATCH AUTOSEL 6.1 11/15] pinctrl: qcom-pmic-gpio: add support for PM8937
Date: Wed,  4 Dec 2024 10:50:50 -0500
Message-ID: <20241204155105.2214350-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204155105.2214350-1-sashal@kernel.org>
References: <20241204155105.2214350-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
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
index 6d43c2123e69a..6c3da790c7901 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1219,6 +1219,8 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
 	{ .compatible = "qcom,pm8450-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	/* pm8937 has 8 GPIOs with holes on 3, 4 and 6 */
+	{ .compatible = "qcom,pm8937-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	/* pm8950 has 8 GPIOs with holes on 3 */
 	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
-- 
2.43.0


