Return-Path: <linux-gpio+bounces-25514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA6B42214
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 997E03A7097
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88930309DB4;
	Wed,  3 Sep 2025 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ondzNKIn";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gpe/m/sb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CB81B042E;
	Wed,  3 Sep 2025 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906815; cv=none; b=bUcpVKwMbnIBmcW6p8tx+T5vr4RxBnyqdVwGgrfy19n5D99NwlzovofP/P/4AbulgSgf7ziKasspVMEl410E9sHShoKHHw2xVA17KoAuU4EjZX6AOWv4NHhANutgdcku9lt+Nj1xYZRfHRvE6I/DZUacX7/fXWPTZMWMowV18FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906815; c=relaxed/simple;
	bh=UDjBzLHJyceNEODuQekgk32ElLSjX8bBaaXR4ejCFgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uyVmYpm+tvoF94JQMcZWua+x47hmfTh6z4yft0ZHtpQs7TtfpS3lo5QtCKwFg72wxeIfbPzZ41HsOFK9xPdVJ5JJvBODlyZinDOcUDyiMt7s2oTizC6B6jPvGDNT8rMIoMwHwJfRBN60UnIM5oIYvjNvl3TenQHFGPKAyqihDDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ondzNKIn; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gpe/m/sb; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756906765; bh=Ap9PmaLbcb+WogVuc7wy1Yk
	iuqv8lK9Tk2nzSVuerL8=; b=ondzNKIndwsTZN3iKA2cdiEGgxhnZFENOS+1O3/YRHYggr0Xs6
	IXTOAour3EMSblWQqFZa0RaYV2D20+XJzOQxEqam0PaXkxRpFlCNkmDJz0S8bUvIj5DQ6/RG2FO
	JuD9hpGptxlW+AaeK1qdEyrPUyUZ0THecx8YdUs0z64n1GL0c7KeAxPEm52ZQTOfiU/SQdGBkGC
	2rjprWW9vowAbPwyOzb6YoVxMD+qIg/UJET7cKmwMrdeg9lJZ1UVf16y/rMRVf6bWpfCkeVpkkG
	Cft6Wj59tuaCRvhgjAsEwd5agiHZTZ+Ki2/I9p2lmn8Spkb7Ql/F1nWzOlxU33U5rrA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756906765; bh=Ap9PmaLbcb+WogVuc7wy1Yk
	iuqv8lK9Tk2nzSVuerL8=; b=gpe/m/sbrH8nYp7Swcd3yf7YquU7+iOsNoHdDhXkiSNsT4fJC9
	bS3U4Vk9GXUy6Y34aj4R2c1cGNaIeNufSZAQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 03 Sep 2025 16:39:01 +0300
Subject: [PATCH v5 1/3] pinctrl: qcom: lpass-lpi: Add ability to use custom
 pin offsets
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-sdm660-lpass-lpi-v5-1-fe171098b6a1@mainlining.org>
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
In-Reply-To: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@yandex.ru>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756906764; l=3253;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=UDjBzLHJyceNEODuQekgk32ElLSjX8bBaaXR4ejCFgs=;
 b=+EXsr/yNEN3s7t2QomUUM7DzNx3eydSo5bcsQ4eGE5w095kx3eK/aP6rmL0qe7U1pPm93xDFP
 57c6HLOVykwAW8HskkWc7SQLf1ilQ4mmOXBXXf4T70tk9UAMJ0Ublmj
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

By default pin_offset is calculated by formula: LPI_TLMM_REG_OFFSET * pin_id.
However not all platforms are using this pin_offset formula (e.g. SDM660 LPASS
LPI uses a predefined array of offsets [1]), so extend lpi_pingroup struct
with pin_offset field, introduce extended LPI_PINGROUP_OFFSET macro with
pin_offet field and introduce LPI_FLAG_USE_PREDEFINED_PIN_OFFSET flag.
This adds an ability to use predefined offset for pin if it exists.

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 18 ++++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 54c77e0b96e91de8d96ff3cbd0ca88fadc6d55f6..d6c1ba109b958296acd8f129a781da1a08e8e438 100644
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


