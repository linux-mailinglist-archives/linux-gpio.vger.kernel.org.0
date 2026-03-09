Return-Path: <linux-gpio+bounces-32863-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMBFEbZXr2lJUgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32863-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 00:28:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D908F242AB5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 00:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9E2D308956A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 23:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4BC393DD9;
	Mon,  9 Mar 2026 23:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYCCQJJr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D044D3939C4
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773098905; cv=none; b=PObPGmuIRFR/Aoyuc5NJ5jZq5kXLlZBo8Z9zYrSCOJPw6K5RtAcim728cXwDdTB7gWgS7WHZn1aCOhmyRsYXpgBscYwm7T7AZBmS66vOkVy1eqe8buKaXIJsG52Vj69LwH8cJsbkOtkzLD4GBIpYTSIk2oCY+wPRZzwdgzZ1Pw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773098905; c=relaxed/simple;
	bh=MWbUKB2ezRImDoJVgS2/+wEVlNLF38LUmNJhx9sh7GI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fartmXbGkT4xJfk7PgEj89+DYuuYKpkyIyJh0BXPgOClbi3nT5oJj7i8u1q1dZADdisR8Va5I9E2bA0j4NHGPtUpCFxZ4878VdJntQLTqaqu5daWkK+fNTcGHSM5tpJWEVdJGz108iLT+l2HADjs9lF0EH0nxdSSTjUGU+GCUqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYCCQJJr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae8979dbb2so19571965ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 16:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773098903; x=1773703703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zThsLLueEsXMRUWwQCRT0ylC/fnc8iJ8IJ/w6hvboLo=;
        b=kYCCQJJrpau+WlSNWNvtEUJQIP8deY/OVMDAr3myKg7j9Caj419udngtZUuU3oiowh
         0KkjppEdxBpeHu258CKto2eESaEoIq2Zck8sFCB0xyowGnQwT482LU2bXX5IdYh/+BjL
         Azj6sw9EvGHZQON+9gy4kqMOJshzuHIdNvJ2LW7uIJpSpYuxIU7/m9epfGK+1hENTBY7
         qaPtgXF+ElnUL2MhZCjaJ/Rk3CiLHaGNHfAYSHL++jTWzkrk4IedaNEhScR5SxvUdQIp
         6D6Fp9llhcgsdXPMBcvVtziyHaNr7fLvIo4xsjmqBOyXXjtC4SUwRqpmi81OMnqGRxrE
         BupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773098903; x=1773703703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zThsLLueEsXMRUWwQCRT0ylC/fnc8iJ8IJ/w6hvboLo=;
        b=E5QFj6gbI8Rwiza6yScjhy7lYW2I0HnGN6BPDJN0BgQ7/3LBOR+aOcehW+At2iLb89
         Nh/5rWscjLDBeFcKz29IjCuD4aw6vdsldYGdwmve1RS8ixr6/D0qAoG+S4URGZsUY4H/
         7nXunlfCzN1YBC9SRmE0uP3B1dIv83rF9/u2ty4IIJJa+eUKGWgdTfnmszQPO8c6i5rY
         GCSeDiwoZ2FMiveks/GbZvYMlYR4wMxRLsstJ9BG2odRBA8bWjqoz9vsHOe08mtw96BJ
         mBuAmg8DbP9pnJGN5l3uXQZEon3eqI1f5UEh5WYn7JsfQd1tpj750ex6WmGUKoUfqt0x
         In7g==
X-Gm-Message-State: AOJu0YxSiATnEwQsH8J96QV10zwrVlvDjmqhVtr4KSeG8BvbQZXcQ1IM
	QUFkTjRzihL8YK4WlkwfAhwwoR5zhzPg9TmaRwQA+OO178zBx5pn7YkftaG521KFqXo=
X-Gm-Gg: ATEYQzzvW1G106BDtKp2pKU2UIyglehi09rcbxjNna7lhJzcvXyTLMixBdDnv5ILt6s
	hikYRiSBOh8f2qNz74MfPghrJvjEoF03Md4TfqNRIrO0YvKzvf7tPQiqkMqxib1jmIEAr801k4J
	t1tsD65EoXzqtFbVQ6ygJd27+z1FuEiZVtZQX5pCsVx4aGBRBPbFE0GDYXL2dvqfqagekoqsGB+
	nG8Gm+4FCiySsnzdhsH2sEfSdKgHGeSSOeGwFhehbhdv22JoWqn74v0fOfhUXBWaxUf9SF6aL8w
	LCDGHVC0Qz5PjhpjFnmNPpMqKvuuSVVLVkY1GAVmwNtUvybh7TAXgSmg+xvRZiPrKVwxp83aTPE
	wV6rx09/VocT7W5AOR28dGxEPWJmfFgPZJzzQ0qYBnVWq5ij2TYjG4qXJaNTKp/7XENIq+X93Qk
	OvCdqTWksqBx2BJC7utNK3Bbg4YYdt6ItiamOrtBpxDxZMKfz4tKCKfQ==
X-Received: by 2002:a17:903:ac4:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2ae824dd11dmr127212465ad.27.1773098902876;
        Mon, 09 Mar 2026 16:28:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f9678fsm130423725ad.68.2026.03.09.16.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:28:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: tegra186: allocate irqs with the main struct
Date: Mon,  9 Mar 2026 16:28:04 -0700
Message-ID: <20260309232804.331882-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D908F242AB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32863-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Remove an extra kcalloc call by using a flexible array member.

Add __counted_by for extra runtime analysis.

Assign counting variable immediately after allocation as required by
__counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-tegra186.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index fb26402b6c47..aa7c3e44234f 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -125,7 +125,6 @@ struct tegra_gpio_soc {
 struct tegra_gpio {
 	struct gpio_chip gpio;
 	unsigned int num_irq;
-	unsigned int *irq;
 
 	const struct tegra_gpio_soc *soc;
 	unsigned int num_irqs_per_bank;
@@ -133,6 +132,8 @@ struct tegra_gpio {
 
 	void __iomem *secure;
 	void __iomem *base;
+
+	unsigned int irq[] __counted_by(num_irq);
 };
 
 static const struct tegra_gpio_port *
@@ -859,10 +860,16 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	char **names;
 	int node, err;
 
-	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	err = platform_irq_count(pdev);
+	if (err < 0)
+		return err;
+
+	gpio = devm_kzalloc(&pdev->dev, struct_size(gpio, irq, err), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
+	gpio->num_irq = err;
+
 	gpio->soc = device_get_match_data(&pdev->dev);
 	gpio->gpio.label = gpio->soc->name;
 	gpio->gpio.parent = &pdev->dev;
@@ -889,21 +896,10 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
-	err = platform_irq_count(pdev);
-	if (err < 0)
-		return err;
-
-	gpio->num_irq = err;
-
 	err = tegra186_gpio_irqs_per_bank(gpio);
 	if (err < 0)
 		return err;
 
-	gpio->irq = devm_kcalloc(&pdev->dev, gpio->num_irq, sizeof(*gpio->irq),
-				 GFP_KERNEL);
-	if (!gpio->irq)
-		return -ENOMEM;
-
 	for (i = 0; i < gpio->num_irq; i++) {
 		err = platform_get_irq(pdev, i);
 		if (err < 0)
-- 
2.53.0


