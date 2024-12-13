Return-Path: <linux-gpio+bounces-13872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D99C79F13B5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ADEA283B87
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220191E5718;
	Fri, 13 Dec 2024 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9LLd5Mr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704B1AF0C9;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111176; cv=none; b=Fg3cpatXOxtzrmEin2OOmkULKu6Wal7Gf6ejF9cm/DxeQ1ID5hpfpEc5xUwVAO6lNR30RX6m+SfXlTtBeBmYT7e2DwVNS/lCs0oZRcfIPTcF5xHT7quAF1jtSfYxYGgiJJQaA1vHxixLaaJybLIE75qIxHDz3nOPXWgWXrebmWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111176; c=relaxed/simple;
	bh=tW/GZdRkERn4AgqOn0aRJErFK3vdaJON1HRH4cqQBvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bo4DKvBskY4AteNF/205T3WHMhb+F44QPUrbwzA/TuvTKfNrDu35ELCGE8nvFdcd3jppPdYe139NqcCbImeuCR6s9fKMsryiEDpBQ40jN6AA/jCuPrdQZmIkRfPLZTNyYdqq92mPflpS4MmJ+9uMJPDK7gaQm81p6nvlIri4cdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9LLd5Mr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F886C4CED7;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734111176;
	bh=tW/GZdRkERn4AgqOn0aRJErFK3vdaJON1HRH4cqQBvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p9LLd5MrVVYagEhhySIQEG449ksnyZLoGmModcGo1/31QtlFzovjokqpaRBQk7GZB
	 j9UUKMQ2Ryay0lbYDlbss0hyck8vUnrOt9312/oQmNZtqZtrN2DzxBQvRuMY04K9/y
	 q/9wgQMV6D7qRs67K+h8KlDXHxkT4+sAhZJSCuEfQn4LktpY5/lCCunMh8vfYjVGel
	 mjX+8n4IAVJGIkHDv1WmhcltWSUulnhdhYvFOcXJLPDu8qvwgrG2+jPYpD5y3x/dCc
	 M/e8tJCOaGE+GUztaN0G5oh0dG8wWhvECfw07sOQ4aGxGjXlI8il+GEk/OBvxHSCKl
	 kLzDiIqn87hIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BD9E77180;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 13 Dec 2024 18:32:49 +0100
Subject: [PATCH 3/4] gpio: 74x164: Add On Semi MC74HC595A compat
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241213-gpio74-v1-3-fa2c089caf41@posteo.net>
References: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
In-Reply-To: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734111175; l=813;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=p+SUfUYDkyNDyg/5TyAQUD1YpV5pIGrbCTPlXDqshWE=;
 b=VBcoDkEueYYIwD8l+8ddCJA3JnJCeZrIc+cMWRpeiVfxRjxuCb5X/lqRgvAxv7VHZvzgpl+Nf
 tdsgqVmlPeZCaHH/q9EANaHOs0feIIaB3Yw5AaveRt8r8hbabfPAG6S
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The On Semi MC74HC595A/MC74HCT595A is another part that is compatible
with the Fairchild MM74HC595. This patch adds it to the driver.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 drivers/gpio/gpio-74x164.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index fca6cd2eb1ddacb3c330111343ebecf9b7c9234d..187032efa5b5cd1aa7aea7b2d55f6c06df4ccac4 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -173,6 +173,7 @@ MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 static const struct of_device_id gen_74x164_dt_ids[] = {
 	{ .compatible = "fairchild,74hc595" },
 	{ .compatible = "nxp,74lvc594" },
+	{ .compatible = "onnn,74hc595a" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gen_74x164_dt_ids);

-- 
2.45.2



