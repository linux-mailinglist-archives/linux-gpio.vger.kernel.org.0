Return-Path: <linux-gpio+bounces-18225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15AA7B316
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 02:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C71A8189B658
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 00:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453131B042E;
	Fri,  4 Apr 2025 00:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaJsMSNN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE21A1AE877;
	Fri,  4 Apr 2025 00:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725102; cv=none; b=pvU7ezWiq5EGjAYw6QfSscK/WBvODXG4rduXtk0xBumlGg1sGqQlx2I4v1oatcONgUV3FAx3KtmndC4qXCWgHA4CWu9btD5jou3hatdhOnOZIh+P5458hqHAWUsMP2lq0HVnWZ9XzEiD9c75kU//QE7kNuFbt0JrFjE4/WZ2e1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725102; c=relaxed/simple;
	bh=fv93mNmTgll8s1lzzmMzuD6QI4oex6qpoMEo2aBam74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U2MqEuk3xuYTVbZsGduqgK/7OZsU3B5W6jDnezjVEd4Oh4AX7sor2Il36cQsKbrTdfPncbSufH06u7PiiTEp3qH6nWwLbPbTlxmb0LxvQR2OzV1AErBzoVRFI5F+6FMM2phQ/+1HbyHerFAQuqTHPgT2HtfJD5jtPZBmXiHLz5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaJsMSNN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D410FC4CEE3;
	Fri,  4 Apr 2025 00:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725101;
	bh=fv93mNmTgll8s1lzzmMzuD6QI4oex6qpoMEo2aBam74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PaJsMSNNwvgpvBGy9mpHIrdaOk4ru2+NA/qYqfiPkAPj46ciEkKthgjubCVgjprXP
	 WL6TD7PCy78+7zmqzQgq/m2L59ik4w+o5Z2qjBDg6Hs/fuvVAmOGl7HA7nxR347iR7
	 1T31y3uLmjSz1upjmQy2qnBvFsSOWTjwI0FjmEz84/7CFDdH88hNkYH+trfOSKnejC
	 xMuKfJJO95hrAi5KM1yv9WctFQnPP1kI8n07oi3JPDmhy5gdtzDFXuZ9dYVMtJAvhb
	 f8c9pWWOmZmXmYfWhj3XiakmFcDbbJYqTwNCjDbAkpWbPyLERhNbrlXPGwnVOcLUne
	 cPxOE1yY4wanw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chenyuan Yang <chenyuan0y@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 03/22] pinctrl: renesas: rza2: Fix potential NULL pointer dereference
Date: Thu,  3 Apr 2025 20:04:32 -0400
Message-Id: <20250404000453.2688371-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000453.2688371-1-sashal@kernel.org>
References: <20250404000453.2688371-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit

From: Chenyuan Yang <chenyuan0y@gmail.com>

[ Upstream commit f752ee5b5b86b5f88a5687c9eb0ef9b39859b908 ]

`chip.label` in rza2_gpio_register() could be NULL.
Add the missing check.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Link: https://lore.kernel.org/20250210232552.1545887-1-chenyuan0y@gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/renesas/pinctrl-rza2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index dd1f8c29d3e75..a654ede01f705 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -246,6 +246,9 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
 	int ret;
 
 	chip.label = devm_kasprintf(priv->dev, GFP_KERNEL, "%pOFn", np);
+	if (!chip.label)
+		return -ENOMEM;
+
 	chip.parent = priv->dev;
 	chip.ngpio = priv->npins;
 
-- 
2.39.5


