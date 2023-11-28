Return-Path: <linux-gpio+bounces-589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E374F7FBE35
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EE1FB2157C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6E41E489;
	Tue, 28 Nov 2023 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PN9gFLyC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E5FD4F;
	Tue, 28 Nov 2023 07:35:49 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9EA4FF80D;
	Tue, 28 Nov 2023 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701185748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ocmY2rTbsBcnpJcCLqop9OYoHfDfDmIGmzhdSEl8zaY=;
	b=PN9gFLyCfcdftiOVVVcveMQGH2DcAO1mDq2SuICwIszsZkmF/92H3KUx1YfWmvqCESl+cA
	QSnrmNhlMVaDdCoAlRS4g4alcL+SN3jxI9iOihI73+r/qVK3Mq3ZBarG5tzJPe02It6Wko
	6pipFyH1uU4VlSJpRwUP8EZWL6Ag883qsSyNVfG93UQyWKXWobuhoXZZjOUSUoAjOPWqmC
	u4qq5rqx6Vdtj3zfXhI14ET2rwmCTHxyr4gqOwO0hq1CJx7pdLCbywZwzLkUPWq0FQUfo6
	cz04O527KEihxGSxlzu5cHYETNB9Hv3F9pl8/7ct5RfKXGk3bSKVfRuSH+ghGQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 28 Nov 2023 16:35:00 +0100
Subject: [PATCH 2/3] pinctrl: pinctrl-single: add ti,j7200-padconf
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-j7200-pinctrl-s2r-v1-2-704e7dc24460@bootlin.com>
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
In-Reply-To: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

On j7200, during suspend to ram pinctrl contexts are lost. To save and
restore contexts during suspend/resume, the flag PCS_CONTEXT_LOSS_OFF
shall be set.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pinctrl/pinctrl-single.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 8267be769635..19cc0db771a5 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1955,6 +1955,10 @@ static const struct pcs_soc_data pinctrl_single_am654 = {
 	.irq_status_mask = (1 << 30),   /* WKUP_EVT */
 };
 
+static const struct pcs_soc_data pinctrl_single_j7200 = {
+	.flags = PCS_CONTEXT_LOSS_OFF,
+};
+
 static const struct pcs_soc_data pinctrl_single = {
 };
 
@@ -1969,6 +1973,7 @@ static const struct of_device_id pcs_of_match[] = {
 	{ .compatible = "ti,omap3-padconf", .data = &pinctrl_single_omap_wkup },
 	{ .compatible = "ti,omap4-padconf", .data = &pinctrl_single_omap_wkup },
 	{ .compatible = "ti,omap5-padconf", .data = &pinctrl_single_omap_wkup },
+	{ .compatible = "ti,j7200-padconf", .data = &pinctrl_single_j7200 },
 	{ .compatible = "pinctrl-single", .data = &pinctrl_single },
 	{ .compatible = "pinconf-single", .data = &pinconf_single },
 	{ },

-- 
2.39.2


