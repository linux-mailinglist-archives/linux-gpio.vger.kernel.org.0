Return-Path: <linux-gpio+bounces-1859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 090B281E371
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Dec 2023 01:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E14528796A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Dec 2023 00:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E748355C27;
	Tue, 26 Dec 2023 00:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMk+n/YJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2C55C19;
	Tue, 26 Dec 2023 00:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7EEC433C7;
	Tue, 26 Dec 2023 00:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703550118;
	bh=ATKbFb8xItD14sV+HY/3C2QY2YzOy11vk7JUIbyxGHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dMk+n/YJmRHcHN7/dw8e29zp58P4dU0BH17h6QQwJ9lBA5UoO48D4EfxQWadSaHwr
	 JAJu2f+gCAHoWf120ADScAl18DPsbFEU4fclkzz8avauGxa7Y1ToZcPqZ9uL18/jhO
	 W5JsaOIexSRc/9moP6Mp7DZHzsKG3k55iffRsUrSl5e+dILxJEVRnZ94ywjd6jWG0p
	 axjX5UyDkx69WaADuucS4aaWBs9uuNjbo1vsh+PQmjqsr/0MPT8H4KHT3EMKYO8HfO
	 Ih8gB+NfqQYjcoNiWTXDjSKn3BJzJAJn+qJYG1HmgNDRbKe0SK18Ay7DSzPwdsaLB8
	 et9Zeo8Q/dugA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 37/39] pinctrl: cy8c95x0: Fix get_pincfg
Date: Mon, 25 Dec 2023 19:19:27 -0500
Message-ID: <20231226002021.4776-37-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226002021.4776-1-sashal@kernel.org>
References: <20231226002021.4776-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.8
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

[ Upstream commit 94c71705cc49092cef60ece13a28680809096fd4 ]

Invert the register value for PIN_CONFIG_OUTPUT_ENABLE to return
the opposite of PIN_CONFIG_INPUT_ENABLE.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Link: https://lore.kernel.org/r/20231219125120.4028862-3-patrick.rudolph@9elements.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 280d7ebd50b71..f2b9db66fdb6a 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -714,6 +714,8 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 	ret = regmap_read(chip->regmap, reg, &reg_val);
 	if (reg_val & bit)
 		arg = 1;
+	if (param == PIN_CONFIG_OUTPUT_ENABLE)
+		arg = !arg;
 
 	*config = pinconf_to_config_packed(param, (u16)arg);
 out:
-- 
2.43.0


