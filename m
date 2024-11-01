Return-Path: <linux-gpio+bounces-12440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9709B8D0C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D2311C2204B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B68158845;
	Fri,  1 Nov 2024 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dADt3Ewz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F915820C;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449641; cv=none; b=L+7SVC6wGpyUrn46WTNYkveqcJlaRidj+56oGcdylu13buv/MOeTU+xvb3w1kf+xzLHize2ypoCO9J1k9T3QbYugoYXzkUWm2LSU9kzgMqP9bY12F0OS/W5kfl/kbPVwZmkVesLQrZVzIzWvrhAfvbej5dzErzhbqBCKa0rAJTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449641; c=relaxed/simple;
	bh=u/qw2hKCT9cFOoXZwF+MDoMtpUmJbTAMh7xRFAFXzgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZYMGMvtvDooBSLFSHgx/SpNhKsTyS+OZnQp1+43LQuwgK+MH3U106HrRuxig79ZbuwvoytNkY4yx1wzu/WADN83SCALSF+EZ7sURsCNx1CMxAfRFYXHWPl+dLIDCWinUzbhPQHWsXka9fyNP3EPbqeZSI4xqdh37dYPsejDGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dADt3Ewz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C09F8C4CED2;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730449640;
	bh=u/qw2hKCT9cFOoXZwF+MDoMtpUmJbTAMh7xRFAFXzgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dADt3Ewzi+v+7BOLMRY/nL9peULtYo1hrrdsEYcYUWYXDWOtvHfSwuFrroU/QLyfN
	 +vXsKQayCiR4WR5aWBnveTlwo9mnGipsgrjZL0CHiA3+hKY1cn/xvHvVEXt5WgbrKg
	 eqRc4ONQX6s0UVVhlupgAqA+YZqa3FLnqUxO/tPfegfKvJ9BS9pQ1sj5i3/ci+3SVU
	 JzePKKwPse4snaswDUIBFEJnK5s0mQaqfv3IfZJSFuGxAWpxriwhRG2gtwPo6rZUKK
	 BG2TVoqmkfq+r/G/Nw8+XgTKnaSYi+A+m6qDcmFIVGijf/Qyods9etXohQ5mXe7cWt
	 CaA+UoRjBYrig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91C4E674B9;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 01 Nov 2024 16:27:18 +0800
Subject: [PATCH RFC v4 2/4] pinctrl: meson: add interface of of_xlate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-a4_pinctrl-v4-2-efd98edc3ad4@amlogic.com>
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
In-Reply-To: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730449638; l=1697;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=knLIUCSGih56JEya5+7FKqp5xI+HFVaycdj15fbWv+g=;
 b=QM1zSNe+4Fb8fwciG4BdSgMCDW+B64PF10XSfq5BS4qnHgRf/iIEaq+FaP/S6LiR/h8wqDPjc
 KBviRMisYn4CC8xJYgYk1KmfCA9Iczlea98u8TknDZIcXaNtKHZiSGP
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic pinctrl software framework use system API of_gpio_simple_xlate
which only support linear one-to-one correspondence to translate gpiospec
to the GPIO number and flags before. It can not meet the non-linear needs.
Add the interface satisfies the underlying driver to implement the
transformation to meet the needs of various scenarios.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 4 ++++
 drivers/pinctrl/meson/pinctrl-meson.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 253a0cc57e39..fc0c0bef38c0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -620,6 +620,10 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
 	pc->chip.can_sleep = false;
+	if (pc->data->of_xlate) {
+		pc->chip.of_gpio_n_cells = pc->data->of_gpio_n_cells;
+		pc->chip.of_xlate = pc->data->of_xlate;
+	}
 
 	ret = gpiochip_add_data(&pc->chip, pc);
 	if (ret) {
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 7883ea31a001..cbb3f22552b9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -120,6 +120,10 @@ struct meson_pinctrl_data {
 	const struct pinmux_ops *pmx_ops;
 	const void *pmx_data;
 	int (*parse_dt)(struct meson_pinctrl *pc);
+	int (*of_xlate)(struct gpio_chip *gc,
+			const struct of_phandle_args *gpiospec,
+			u32 *flags);
+	int of_gpio_n_cells;
 };
 
 struct meson_pinctrl {

-- 
2.37.1



