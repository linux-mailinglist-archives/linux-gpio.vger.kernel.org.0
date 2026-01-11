Return-Path: <linux-gpio+bounces-30414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EEBD0FCE0
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 21:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00A963028FD5
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 20:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1682580D1;
	Sun, 11 Jan 2026 20:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuncVLAc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B81EBFF7;
	Sun, 11 Jan 2026 20:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768163368; cv=none; b=VXDeg9ki/P2kzxIhRoCtvo3c1KQkS/wJRK9WEosCFAIuLnJanf2L30/ddmUNDPndyQYYbZAoN22rcAfQMsaoglBNO1UsCizKxyjUwl0PRsjspG5XURYTwODhTgyomzSJIjUFfC8BZOOuITOBq5nGLK+wXi25WxKZldmhOgJcGpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768163368; c=relaxed/simple;
	bh=6oA/Zpv40boNXu9flhLjZnCSCituxNm3WBB02StEqlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqMo4HYfmSXzbPab2aNQsyV1PgVa2RcfCYWlVwbFI666CqgJKky8r04ZJYu4DNhaBiuTzC/MOplRY4sZ/OnBkTXXg1nCP6yWgaV2H+RZLiNpbWe9gTBGo8kdCz5eTsMmrfUGuVnvUhm8xpBzy3KLBPD49BC6oGhSSC5rtUJZqoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuncVLAc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE98C4CEF7;
	Sun, 11 Jan 2026 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768163368;
	bh=6oA/Zpv40boNXu9flhLjZnCSCituxNm3WBB02StEqlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uuncVLAcRpqSTlbr7qLJijd2DtnBPezA2c5VXmSGuhUKOOnFEjrjpodWKBTFfTxNX
	 E5hQxYVi0lU/1lhWe0ykFFKDnJkNOUEjjNRow0qNysaCd0p3wCwzonl62lVZnAMV8F
	 E+eCNya2VqXMvIHGUaBq6M103+5+Bq6NZFbSnBip/XpGdYk1rbsJUBTTNKa6RON8k3
	 nVZg52U+oygCCrUP84VHyUzLYgCewnCxtp4t/ctCXWIo2bySZCPTenJS8fdDVfXXYk
	 /nhPyisDVcRyXysv04ZGYssTDLMwMzmnKysn7+s4BGx7inmEbociQ46o7uDDVcJP9V
	 vVy0hD1KcjbxA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Jan 2026 21:29:22 +0100
Subject: [PATCH 2/2] RFC: pinctrl: apple: Implement GPIO func check
 callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-apple-req-gpio-func-v1-2-6deb1b695371@kernel.org>
References: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
In-Reply-To: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
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

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index a4161d59ab9f..fd20d0e49f48 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -170,6 +170,13 @@ static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
 
 /* Pin multiplexer functions */
 
+static int apple_gpio_pinmux_func_is_gpio(struct pinctrl_dev *pctldev,
+					  unsigned int selector)
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


