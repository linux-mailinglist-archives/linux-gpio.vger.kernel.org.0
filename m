Return-Path: <linux-gpio+bounces-8144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 087B992C157
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2ED61F21B77
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA661B23AF;
	Tue,  9 Jul 2024 16:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuG1yyHa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB21B23A4;
	Tue,  9 Jul 2024 16:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542428; cv=none; b=Qz/dMs+O0Q8EQWsq5K4wbZlKuU5vLYnHjaigld6lyLHO+U6rL9nnLwjqw0LYpqgunlJTYZ2/09LzMOCavIHe7+v7E0J7yO8kgIdowsayDH9GQpmi0a2bZm+ebeBtt3WNclwTKwr2O8oL2r3z7a8/hko1c1Wy8gC5tkqBADcXJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542428; c=relaxed/simple;
	bh=PB2N1eX+pov5VJqR3NyzDSn32fREMRxdp5mlsLtGc3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjwqLSg6V61PV5Qqp66kefJW1mD4MELSPxxz5+zNY2kRL5fZHU78KrszmsK9T827HZi8rffBXST3QAlheG9b+Dt7X1w+tXovIDHSd2bcmn3YQYITDxHsZB7LLRJg3sXQMEXncgQvTcLMrl4FK2aWCtmiuAw6OKHl7FIfLPfRBKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuG1yyHa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4802BC32782;
	Tue,  9 Jul 2024 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542428;
	bh=PB2N1eX+pov5VJqR3NyzDSn32fREMRxdp5mlsLtGc3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CuG1yyHaDUE1C/P164wpER1CzzJ988T6ipW29ldSEBrNpUqM+5gT126ei06td+4Oh
	 8gHgaDG359SLgqvXYEap5fnD5AiGX8i53KR75hR8TKMiXY+U1RzwF7moBddtjPMOwR
	 3h9tcTsrrabhKeVP9H/z7v15zFkXlms5R7aiFgBSMpGQiblXvkPdzTv0dI8elS+5XL
	 CUfWGIEJl+5Dr5M2uitB5ojz1xIMMHK/0AHGSWTgP2S1tYWmjqqc6K1rej3GPCWd9/
	 I4DwHM9gSbXAl5eD1HZ+3s0QH4/P17nDC055NHi+Sm2PtxERxHe1868dXnNYgmebro
	 YuAcATDGV2sow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 06/11] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Date: Tue,  9 Jul 2024 12:26:39 -0400
Message-ID: <20240709162654.33343-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162654.33343-1-sashal@kernel.org>
References: <20240709162654.33343-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.279
Content-Transfer-Encoding: 8bit

From: Ian Ray <ian.ray@gehealthcare.com>

[ Upstream commit bfc6444b57dc7186b6acc964705d7516cbaf3904 ]

Ensure that `i2c_lock' is held when setting interrupt latch and mask in
pca953x_irq_bus_sync_unlock() in order to avoid races.

The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
lock is held before calling pca953x_write_regs().

The problem occurred when a request raced against irq_bus_sync_unlock()
approximately once per thousand reboots on an i.MX8MP based system.

 * Normal case

   0-0022: write register AI|3a {03,02,00,00,01} Input latch P0
   0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
   0-0022: write register AI|08 {ff,00,00,00,00} Output P3
   0-0022: write register AI|12 {fc,00,00,00,00} Config P3

 * Race case

   0-0022: write register AI|08 {ff,00,00,00,00} Output P3
   0-0022: write register AI|08 {03,02,00,00,01} *** Wrong register ***
   0-0022: write register AI|12 {fc,00,00,00,00} Config P3
   0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
Link: https://lore.kernel.org/r/20240620042915.2173-1-ian.ray@gehealthcare.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index c81d73d5e0159..d4c81373929af 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -696,6 +696,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 
 	if (chip->driver_data & PCA_PCAL) {
+		guard(mutex)(&chip->i2c_lock);
+
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 
-- 
2.43.0


