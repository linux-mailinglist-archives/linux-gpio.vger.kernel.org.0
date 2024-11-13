Return-Path: <linux-gpio+bounces-12906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1A9C69FA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 08:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1BE31F25580
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 07:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E829F188700;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fM56Kuea"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6C518562F;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482982; cv=none; b=oQFrEqg5jEspf6QLHe2aWj+qyOAkLBprzkWXzHf4QhAwK2HMgJafxqM+2gD6IjNdGv4x5Pi6aJW/v6umHQVKNqw1PwbFmi+24Fh3Z7Cgx/yWx74SC2RuGR6NzgVKcwjFMOvNHsNs7NlBgE9205vZS2vvHwW3tWhaLZ8n6nHZETg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482982; c=relaxed/simple;
	bh=8TOv1Z5OyPH3FzN2qQ0QJp6OTICIwjthX/si2CeYrbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=exR1jON9wDdtF7YeRXSpnPDD4kCU11udYo415g3Ss88c5s7CyWkhHx1N2LBOxOa2JTMWw6j/greG21xyk9HBJYYcy3B8YnnRT7QfMzIf2bKSrFIulVAcmuwOeSH44wqgYYpm+MKhn5528tR9aHY7xPIhzepy164yCbysziM54A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fM56Kuea; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27AD3C4CED5;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731482982;
	bh=8TOv1Z5OyPH3FzN2qQ0QJp6OTICIwjthX/si2CeYrbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fM56KueaqDCfmePk1psTjw1egBSo2uy5d3j7Yzn/KqQOkkswCSsmFE5SpC6RGsjRI
	 r/pT7V9DsZ/PIf62TEXmd0ioF7vv8aTSuweXKBDSKQkZiQZDshCt/O8sBAymUj8xEg
	 aE1i1gtd43ktRsNNeoiMlBMQbjos5WRszehH2yVKruy38rkKaAWJrNO7ciMRP8rDFd
	 Xg7NSIbTlPsilIQM8XhoxdmddoL4L5gc7Nco8PSC8or0o85P0Z7xy5D+E1FaIw+4Lz
	 mYKGEr95z0FAQqVNJmQBUc1EARql/mzFnLqiHzAtn+jT/r6n/DIcsSM1EAEL2w2ll0
	 T0cgcodU4yXZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135D2D41C12;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 15:29:41 +0800
Subject: [PATCH v6 3/5] pinctrl: meson: add interface of of_xlate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-a4_pinctrl-v6-3-35ba2401ee35@amlogic.com>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731482979; l=1754;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=kZkfTxXyUa/bUEnikqRrRpqnocDlXw3ORsFp/T0SNwU=;
 b=3PeJkCu/mERXBOEPe0kwA68C9B29lxXDsLkZNI/NHnkgbug00+MVamJFxMg0gFzBpfNsu045c
 nhl6XxbpWEuBUECuNbdKEaGVM6i1h5S0pE8kNlbQh34oV1+/YzwJPQp
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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



