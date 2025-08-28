Return-Path: <linux-gpio+bounces-25158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA41B3AAD6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 21:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2491BA7AC3
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7656627B340;
	Thu, 28 Aug 2025 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnaEuTPD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153D4270568;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756409020; cv=none; b=sNCuuOz4zvJg5zEzmt9s4DkVerATx2pwQ7GBk6HptkR69unznp1GJAZIeY5jL29C9Q60KPcL+MIGGkD8MZiDApNUNv54cbp8Qt/uU3K5j59BQCwCFEA2nqdkpByD2aE5SELBK9WovGeDDNb32QuuKzLKRzYWynBfFLOfQuU220c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756409020; c=relaxed/simple;
	bh=JWHLtek4k5suu8EbBErIvruvR2tJvUjGe6+Sr41q1Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7taG++upWbkS6c4pdAh6R6SRJIj8Jjz7M9JUqGmBmYwG7tYqCetG3Re8/1jyzfky0ujX4Hp+SQ3TmhjxAifk4lcGqIDMvw3faMrxzEm8uNerk7XEfabonhrqwfrgbXu9S/TP5LMRXdXnkJsRkzFzxGP5pXfE/CpzmiyDw/pr1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnaEuTPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A78C8C4CEEB;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756409019;
	bh=JWHLtek4k5suu8EbBErIvruvR2tJvUjGe6+Sr41q1Jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jnaEuTPDvJFOR/jQVUVNO5uaXEBEVO9nxIpqrIjQmMliafwth1wOQlNe/NXJTw6Mp
	 eEGz/bTmM69CK4dmK3CBhggTlOfkzBljYyNvyS6GX7P6h1nsRqlYae/Q1BmDnY/X6H
	 aze1yRg9jDcpoJopTooPTbkfdSn1rpR9KdiVy/AhgaLzew497f5aviw4A5Nduppe6S
	 IKBsdMWRehkqmNBMyO5sraWpfkI/yI74RYMJN8AR0P18Aov972WCb8oS46ThFYwYi1
	 NjpWnGCwjZhVuQnuG+VwSb4EKHbs1yATBa2IhD23cCtQ3wDdwBp2OCAEotiFjuNUV2
	 CbfWcp1vxFpkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2BAC8303F;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Date: Thu, 28 Aug 2025 22:23:37 +0300
Subject: [PATCH v4 1/3] pinctrl: qcom: lpass-lpi: Add ability to use custom
 pin offsets
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-sdm660-lpass-lpi-v4-1-af4afdd52965@yandex.ru>
References: <20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru>
In-Reply-To: <20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756409018; l=3248;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=/WK82cuSvBmdPjcww2s89K1u5jRqfdDhfVpHCgd9t3w=;
 b=X86tC9inPJB0w/b4uE2S/GXLPgZCHrnJoVI5Gor/3oBMtUSHDr1dyyn+FygtxFPxbrwHhwEU8
 5v7EN7v0ij/BPPsiJJHMlheGmQeAZz7aLeTiuypCirIPQzeqQJXriwZ
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

From: Nickolay Goppen <setotau@yandex.ru>

By default pin_offset is calculated by formula: LPI_TLMM_REG_OFFSET * pin_id.
However not all platforms are using this pin_offset formula (e.g. SDM660 LPASS
LPI uses a predefined array of offsets [1]), so extend lpi_pingroup struct
with pin_offset field, introduce extended LPI_PINGROUP_OFFSET macro with
pin_offet field and introduce LPI_FLAG_USE_PREDEFINED_PIN_OFFSET flag.
This adds an ability to use predefined offset for pin if it exists.

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 18 ++++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 57fefeb603f0e2502fccd14ba3982ae3cb591978..9e841fed87162551bf7165ca4838a1e530e02724 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -41,13 +41,27 @@ struct lpi_pinctrl {
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 			 unsigned int addr)
 {
-	return ioread32(state->tlmm_base + LPI_TLMM_REG_OFFSET * pin + addr);
+	u32 pin_offset;
+
+	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
+		pin_offset = state->data->groups[pin].pin_offset;
+	else
+		pin_offset = LPI_TLMM_REG_OFFSET * pin;
+
+	return ioread32(state->tlmm_base + pin_offset + addr);
 }
 
 static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 			  unsigned int addr, unsigned int val)
 {
-	iowrite32(val, state->tlmm_base + LPI_TLMM_REG_OFFSET * pin + addr);
+	u32 pin_offset;
+
+	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
+		pin_offset = state->data->groups[pin].pin_offset;
+	else
+		pin_offset = LPI_TLMM_REG_OFFSET * pin;
+
+	iowrite32(val, state->tlmm_base + pin_offset + addr);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index a9b2f65c1ebe0f8fb5d7814f8ef8b723c617c85b..f48368492861348519ea19b5291ac7df13050eef 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -55,6 +55,22 @@ struct pinctrl_pin_desc;
 			LPI_MUX_##f4,			\
 		},					\
 		.nfuncs = 5,				\
+		.pin_offset = 0,			\
+	}
+
+#define LPI_PINGROUP_OFFSET(id, soff, f1, f2, f3, f4, poff)	\
+	{							\
+		.pin = id,					\
+		.slew_offset = soff,				\
+		.funcs = (int[]){				\
+			LPI_MUX_gpio,				\
+			LPI_MUX_##f1,				\
+			LPI_MUX_##f2,				\
+			LPI_MUX_##f3,				\
+			LPI_MUX_##f4,				\
+		},						\
+		.nfuncs = 5,					\
+		.pin_offset = poff,				\
 	}
 
 /*
@@ -62,6 +78,7 @@ struct pinctrl_pin_desc;
  * pin configuration.
  */
 #define LPI_FLAG_SLEW_RATE_SAME_REG			BIT(0)
+#define LPI_FLAG_USE_PREDEFINED_PIN_OFFSET		BIT(1)
 
 struct lpi_pingroup {
 	unsigned int pin;
@@ -69,6 +86,7 @@ struct lpi_pingroup {
 	int slew_offset;
 	unsigned int *funcs;
 	unsigned int nfuncs;
+	unsigned int pin_offset;
 };
 
 struct lpi_function {

-- 
2.51.0



