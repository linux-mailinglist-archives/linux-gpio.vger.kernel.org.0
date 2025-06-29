Return-Path: <linux-gpio+bounces-22381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85630AECC1B
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Jun 2025 12:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0878016E439
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Jun 2025 10:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9674021D3F0;
	Sun, 29 Jun 2025 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SugUPofI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506281DDA15;
	Sun, 29 Jun 2025 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751192049; cv=none; b=VjTaQctfvtaMk2U09OlKvlXdAGN2CNuvjex7Z2l5U4voal5P1WIpQLc3frk/gbopyM4QAJzznM1TyxJfMmftuVV2b9ktba8Q5H4/4HNWu1g0HoLwvfFf/Inmxp+IFDfN1NPRC06qqY5wzMMwFuiczfV8IgGyOstoVt0AbzaO/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751192049; c=relaxed/simple;
	bh=XdbvY3hb9xbkGi10tmDHNYZ5H0m/0HmqoivDL+4z5O0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t0xvwgKOsyEoevFKcZR2eFYrvCM5kJLt+d3XQHXYhV51xvGUXjRVQnDl5jLDh1iyWVaaqKKP4gZRKp7MIHK8GlCDSZ3D+jWZmTJ1sfPqCM8+3MztdHMkhSZKOAZB+hLtkQOUrnE15vR8mjeYp6FJFATOnPHjljXElyTYXyn3XoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SugUPofI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF04C4CEEB;
	Sun, 29 Jun 2025 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751192048;
	bh=XdbvY3hb9xbkGi10tmDHNYZ5H0m/0HmqoivDL+4z5O0=;
	h=From:To:Cc:Subject:Date:From;
	b=SugUPofIsg+lg/f0zWJ0eM1weJyTWWTh4pZGUf00/yh10BYPJMMU8tAOArt33fM+X
	 Lrg9UQXcGn1JwWmbGlX9Ra+Uqjtq03yjDRZoMhzCllwJliKA0gQXdHcnMCzZMJTabP
	 AfqbPy/yoEpMPlpSKyEfWcnpL1MdNWgsqfoQAYalEJit4MNRTFFR0xcT65l9l2lfc+
	 2DX9+SjQGLSYUlD2au+1RX5NnmJsOkU2eiqMSxfLyrsOgue9LB/OSBYES7/7DlZVwh
	 WT4czD+Qe3wvwlO9uTnh6laUIZxySZ4mKbQsaEyrWFKRBxw9Q7vXaGkaxkzMru8lNV
	 /4RuxbWqQUIjw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] regulator: sy8827n: make enable gpio NONEXCLUSIVE
Date: Sun, 29 Jun 2025 17:57:16 +0800
Message-ID: <20250629095716.841-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms, the sy8827n enable gpio may also be used for other
purpose, so make it NONEXCLUSIVE to support this case.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/regulator/sy8827n.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/sy8827n.c b/drivers/regulator/sy8827n.c
index f11ff38b36c9..0b811514782f 100644
--- a/drivers/regulator/sy8827n.c
+++ b/drivers/regulator/sy8827n.c
@@ -140,7 +140,8 @@ static int sy8827n_i2c_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	di->en_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	di->en_gpio = devm_gpiod_get_optional(dev, "enable",
+			GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	if (IS_ERR(di->en_gpio))
 		return PTR_ERR(di->en_gpio);
 
-- 
2.49.0


