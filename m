Return-Path: <linux-gpio+bounces-37486-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFw5JOHGFGqzQAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37486-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 00:02:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB785CEF65
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 00:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91378301FFA9
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 22:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6F3399CE4;
	Mon, 25 May 2026 22:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV3BwLVn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A9A28541A
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779746506; cv=none; b=cHn/N0gMHhp4cyJJ0yAlH1gZobic4Vq4l1SSNIXaVu/1d0Ov5e5HznrmJf19Dho0TAkwCX3qdSZS8/cKrFmFJ9oj49/ql9EM8TDvsaXtBwZSWxuNLw9obQKIV26f2EQY9QKn+NF1YHexNKG1ciswyoMmAw8Y/45HUJ8UYww0S44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779746506; c=relaxed/simple;
	bh=6uBZcvpHVG9ghMmyfS/bczxD/gV3gurTm4gN5EMIuSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AX05HBSZcZHPpyQwIHIhNBhIE/PjyJJDf0Nemfx9pqKKecdo+YEnaZXMgO+OD0RwtT+JdidO9RVfhRbH03SyP+yMy67JdkiUnieobDaJV8S3Myk/qa9Bfr+lRX9C6Hkkdp+yhYwF44y/nTakPNkx3Gbg0y0dwY4Oz79arVSC1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV3BwLVn; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c827313dac0so4865805a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779746504; x=1780351304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7NKAW/ulkmG6NXCszZo+vmmRfLFaqedn1kwzn4OXVM=;
        b=kV3BwLVnXBHkc5dV9v8ZhShidwKIw4trhK21aU+r8aMcWxJfhVaPuykG1dTU8WdSNy
         c+ChPnUbdm1Px8fq76YiD8pnaDaiD+cegr9bDrkjFD0gPmBPJhlU/xDhRw+e7qyocUXT
         kI5btX1p5kv4c5CC8jEgvlt9FhTLA+9gqwAW1x6sHojzBFSJwnvr7NCDY3AQEYvW3XqW
         9OBQUqAIoMu7QtO4iKWyKT3eZTnWcECeYMMlGrjkgkDGF/xDrOtQl9QE9Clo2zfk6c11
         GNXKO8OZ/K9tybQTxDmW6zY+FNiJn6yBi5hCslwR/whwd36sPhkD0mAn2ghxCvNRo7Uy
         IvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779746504; x=1780351304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7NKAW/ulkmG6NXCszZo+vmmRfLFaqedn1kwzn4OXVM=;
        b=PSsMPL53FOi0waMIDw/FTBVs2cFfFYbFuJcr3kFQQRJOMOfzUZQsZJTQmRUzMWRUNx
         5O5YIpoge9uDQbjGPMQX90FNdenMFWunUhrCu5uploYMjY8A+Rnr21NOEFOAZeVzD1j7
         wTa15e9cDRba7HQopNN224H69K8IsxXJzI/IadM/nrfvUQHpahW/ajjmUBarimIOGqHa
         Vm2hfUDoVkQ8j58PkdTrLN2/N5N66DP1t5ZhOjUT59QzT4ea0ytGp7FIoC7yaU0vPDPB
         rvzGX5gplIJDWY5MJVViZSt8qlnZNaNxJZCmxs2Dzcy/oiFZStNkYCLASZ/tkz9tVtz+
         alQA==
X-Gm-Message-State: AOJu0YwE8BFmT68UMelW9pLfDGj7BhbKbTT0GwAV+ETTi9jiyIsGsufz
	eC9xtl79CBB1mAfJjDjnoTduUKtxiiy1Z6vOwNctQc9ECvtkdtQqy6XPESeP4w==
X-Gm-Gg: Acq92OGvIdlh77Bc2gvGdCYs7zwNe0oXxeBmv+c+oGIsNpzmKBwJaZbHtpy+ip93J1T
	/Sd5mNXU6lCBWyq6/XvGp7ULSEMLls7cI4qOw/WEB7SBo0hgRGQFFCGa8gxhOi5ttlXso0yWQdO
	9NyXXX3iQslux288KqNpMp8ZddEq3ZanRivAe3FlMM4EqSPSsV8QiRiEi/Pg7y7DAkKwvWQKlya
	h8nXqJOn/2g67C6r1rO31PDGDwXt/1d0yiv8ZxRfOgAp9AsMcOjtzezz/+lWW6Ajg8xK1oZrpSa
	lcCtKGdHLUwgE77CeXddUp3DwlqME5cC5U2p/DVDwMWIdqg9f3FFErikLBLgqzxvT1vZBdPQ2G7
	+KkA5s5PzLWbGhDpiFFli2EObhVALuQNbr6WDDFpc4OCAs4F2gJKscqyvrau0Bobk8DC4PjxjyC
	FvZt04YbSosF8rlu0l8+TTIUrLTyHRF+dLGD0UBQ72Z02YO7cKLMhiuQbhikbrQK5m4U5pUJddT
	s4RZ2PD+t1XwPcbxhKQ6iQj2X5LSDWe4co=
X-Received: by 2002:a05:6a20:d80f:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b329541ab3mr12825168637.12.1779746503829;
        Mon, 25 May 2026 15:01:43 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe0bb8sm9526514b3a.51.2026.05.25.15.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 15:01:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linusw@kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-renesas-soc@vger.kernel.org (open list:PIN CONTROLLER - RENESAS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH] pinctrl: rza2: embed pins in the priv struct
Date: Mon, 25 May 2026 15:01:26 -0700
Message-ID: <20260525220126.93990-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37486-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0CB785CEF65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Turn the separately allocated pinctrl_pin_desc array into a flexible
array member of struct rza2_pinctrl_priv, annotated with
__counted_by(npins). The pin count is now computed before allocation so
struct_size() can size the combined object, collapsing two allocations
into one.

Assisted-by: Claude:Opus-4.7
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/renesas/pinctrl-rza2.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index 8618f32ed26a..42c228b860a4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -44,12 +44,12 @@ struct rza2_pinctrl_priv {
 	struct device *dev;
 	void __iomem *base;
 
-	struct pinctrl_pin_desc *pins;
 	struct pinctrl_desc desc;
 	struct pinctrl_dev *pctl;
 	struct pinctrl_gpio_range gpio_range;
 	int npins;
 	struct mutex mutex; /* serialize adding groups and functions */
+	struct pinctrl_pin_desc pins[] __counted_by(npins);
 };
 
 #define RZA2_PDR(port)		(0x0000 + (port) * 2)	/* Direction 16-bit */
@@ -289,21 +289,17 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
 
 static int rza2_pinctrl_register(struct rza2_pinctrl_priv *priv)
 {
-	struct pinctrl_pin_desc *pins;
+	struct pinctrl_pin_desc *pin;
 	unsigned int i;
 	int ret;
 
-	pins = devm_kcalloc(priv->dev, priv->npins, sizeof(*pins), GFP_KERNEL);
-	if (!pins)
-		return -ENOMEM;
-
-	priv->pins = pins;
-	priv->desc.pins = pins;
+	priv->desc.pins = priv->pins;
 	priv->desc.npins = priv->npins;
 
 	for (i = 0; i < priv->npins; i++) {
-		pins[i].number = i;
-		pins[i].name = rza2_gpio_names[i];
+		pin = &priv->pins[i];
+		pin->number = i;
+		pin->name = rza2_gpio_names[i];
 	}
 
 	ret = devm_pinctrl_register_and_init(priv->dev, &priv->desc, priv,
@@ -482,12 +478,17 @@ static const struct pinmux_ops rza2_pinmux_ops = {
 static int rza2_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rza2_pinctrl_priv *priv;
+	int npins;
 	int ret;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	npins = (int)(uintptr_t)of_device_get_match_data(&pdev->dev) *
+		      RZA2_PINS_PER_PORT;
+
+	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pins, npins), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	priv->npins = npins;
 	priv->dev = &pdev->dev;
 
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
@@ -498,9 +499,6 @@ static int rza2_pinctrl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	priv->npins = (int)(uintptr_t)of_device_get_match_data(&pdev->dev) *
-		      RZA2_PINS_PER_PORT;
-
 	priv->desc.name		= DRIVER_NAME;
 	priv->desc.pctlops	= &rza2_pinctrl_ops;
 	priv->desc.pmxops	= &rza2_pinmux_ops;
-- 
2.54.0


