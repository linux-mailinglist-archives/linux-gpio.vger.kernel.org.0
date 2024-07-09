Return-Path: <linux-gpio+bounces-8142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9C592C066
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4161F23230
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AC71C68A1;
	Tue,  9 Jul 2024 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plDWqSQe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3591C6896;
	Tue,  9 Jul 2024 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542186; cv=none; b=i4HbuU4ogIPBNYY2axhIJiUA7MLrEZegT1bqvq8X7W3jgcTlv6T72YH0+lDxrh/kLea3MNyVbX4kcaLER5xsS7U3qu5jcstsjHWkNLwZCyR34GyQJjAQZSdAqIT59dELe2oqAaYdFQCE1hvrPn1XNb/v/vcvcMoVNfOGzgp9jmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542186; c=relaxed/simple;
	bh=JQ8rH6L0UG56rgymtQj7bFKqC8XdJrsYxqZhDSzY9f4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpXCF9bfvJvFDYsjfCuDNAN9a7fOWKoSz5zrUt3IosQ6QkZfennDFHg3w4BLEBi666JEe3eKLuB8pAOvp+YodN88PfwmMKu1hTLe9v4uc4YxcGeDtQC0bpaDZVY9tEaaOTbxCubuGto9La4tQFtfUOouoPgDBkFZM+krU0hTaeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plDWqSQe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9054AC4AF0B;
	Tue,  9 Jul 2024 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542185;
	bh=JQ8rH6L0UG56rgymtQj7bFKqC8XdJrsYxqZhDSzY9f4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=plDWqSQewncF1pKOIyZyAy1E0T0ckGFcq6qCT7aKwTWUfunBJarR4Le6b53T0QlWn
	 XtvtGVxbiLAiP+gq7PFO7XVWVnTmcTP5J4ktESco7GlPaqpm3mmPNjDIaxZwXMSN/q
	 IJMHLc9kg7oWEkRDfum1FDZ6ud2pkaLoLaPyZmCOCy7aeJqOTOXrJHxuyYO0AL/0Q3
	 UorSzjdeAf0Lj5rHttHbi33S6RPDn3cmpEp+COi4wcEoNLV0YzNT6rcnegHTz3MqFT
	 4HHkUGRIt2kTQTuwmRokpktiP3+gprkhXmG3RTLhEIEQKmUEeNA+aL9YPoIfBvm22g
	 6w6VLkS7ci5Eg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 18/33] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Date: Tue,  9 Jul 2024 12:21:44 -0400
Message-ID: <20240709162224.31148-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162224.31148-1-sashal@kernel.org>
References: <20240709162224.31148-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.38
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
index bdd50a78e4142..ce9a94e332801 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -766,6 +766,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	int level;
 
 	if (chip->driver_data & PCA_PCAL) {
+		guard(mutex)(&chip->i2c_lock);
+
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 
-- 
2.43.0


