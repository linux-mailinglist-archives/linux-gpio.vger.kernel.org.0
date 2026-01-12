Return-Path: <linux-gpio+bounces-30446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950BD11CDB
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 11:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D06C5300877C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DEC2C159E;
	Mon, 12 Jan 2026 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="um/uMGqx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D088627CB35;
	Mon, 12 Jan 2026 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213239; cv=none; b=bt6xmR5zQJYKJ7VTFNqM4hGl3abXg48YfCy4k1hwaxBdJmoJKvNTyDPFE7u1/cqnm8DzYkp522kQ/sAKaPIZiI1FUSN3VxogNE8+HJDyAGkQUQqZNWWkysl0afa3hfpZFdsl0m6LrDKPtxUbiD7bJzOOfaJPovoMldMUudza4Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213239; c=relaxed/simple;
	bh=xkYzUdmREYDJRqPUh32xP2grXpOE5bywwQkQJYrx8H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDn7vK7FnFUTJIaq2550cBEBLdemqjJ5sHE24CiiuJb0d7AW8csUQbh1LWoAX2fTwLULjZUmZR2xKEYjeVMy/Bamj+MZcRNgrKL8p+r+KbjK/VozC11nySsc3ft2WDGOyW88X+zc0MCf7b22noaTslIVcmh+l0zLH9jZ5Gpz+V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=um/uMGqx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8DCC16AAE;
	Mon, 12 Jan 2026 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213239;
	bh=xkYzUdmREYDJRqPUh32xP2grXpOE5bywwQkQJYrx8H4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=um/uMGqxFAjePXUG3INtpSZGK0VHNEtJtxSjOwSiYSOcm1O9u4JmDBbqDd+5cnYpr
	 bSaWgCO41jn7erVRqL6lHUi4szOxoGKlC2wI8iAcrUlqVqm/e/38zec9QoNEzgmv3t
	 Qj6lInGSWQvzMsyrIJiw039V7PfoXkg8kI8A3eyRE31OvFHzdm8cct9cKDW1EqL84W
	 Q1vODyJfQSo9RqvMZ9DJqLVOlePD6/VExceHHGkriQdy+y4cf/lPHmmJcj3988aPE5
	 myXvNy/Sht0w/j6hi+HZDjeUvyMEv4gCA4Cs3/vRtgMR3Xq7SN94GOpVXN9TQn/hkz
	 89jUTGwD3AIvw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 11:20:32 +0100
Subject: [PATCH v2 2/2] pinctrl: apple: Implement GPIO func check callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-apple-req-gpio-func-v2-2-fbb91114e630@kernel.org>
References: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
In-Reply-To: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This function will check if the indicated function enumerator
i.e. the value set into bits 5 and 6 of the pin configuration
register, is zero and thus corresponds to the GPIO mode of the
pin.

This may be necessary to know since the pin controller is
flagged as "strict": once you set a pin *explicitly* to GPIO
mode using function 0, the core is unaware that this is
actually the GPIO mode, and clients may be denied to
retrieve the pin as a GPIO.

Currently none of the in-kernel device trees sets any pin to
GPIO mode, but this may happen any day.

Reviewed-by: Sven Peter <sven@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index a4161d59ab9f..2bd5013b19ac 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -170,6 +170,13 @@ static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
 
 /* Pin multiplexer functions */
 
+static bool apple_gpio_pinmux_func_is_gpio(struct pinctrl_dev *pctldev,
+					   unsigned int selector)
+{
+	/* Function selector 0 is always the GPIO mode */
+	return (selector == 0);
+}
+
 static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned int func,
 				 unsigned int group)
 {
@@ -186,6 +193,7 @@ static const struct pinmux_ops apple_gpio_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = apple_gpio_pinmux_func_is_gpio,
 	.set_mux = apple_gpio_pinmux_set,
 	.strict = true,
 };

-- 
2.52.0


