Return-Path: <linux-gpio+bounces-25738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5872AB48D81
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 627631B283B6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47D42FDC3E;
	Mon,  8 Sep 2025 12:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Y0EIPGSh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cq9DJUtZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2054A3B7A8;
	Mon,  8 Sep 2025 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757334577; cv=none; b=CCvkjkX/7MTyziAiZ6+D3/eVlV1AwSf4bAuBrww6nDHY9fntofQN93PvMmX2MZWb8Ch6bTCclFaxdC51tc6BW8ry0B0H4kWNWJf6r5KYZKMgmsMc66ggIxNzcU9MN1m7oLD2WC8Pit0U5mCXV0uoYir6Sl5OGfm68NKxiT6LqOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757334577; c=relaxed/simple;
	bh=9eDGuUU8Kw5mCLNHIuF1Jxrh5ykEUYWqrvMjduNi80Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWJK9mOqxE5jTrRr/ulE+O1BtDZdb338KIJGHqhzgvggxgWf7EgovlVlk2lTqJa/IL4+FshQEgd9t8nvrlnKn9ImWXhXo+4w/zWYPJrshAos/y8RfP8XEsDEtl7WICac8v0ibvAZXQ7ZdNqUrzQqcHuIVcCkvIXQPoc0Q83Tgvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Y0EIPGSh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cq9DJUtZ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1757334528; bh=V16pK0ZIYfgGqNl0Egkr0xM
	YcXCi1y1o+CJdLE00J8g=; b=Y0EIPGShiDzwyWrEuvgtMuS3NfrNGPbP1gPFNNhR9w/9FUjndy
	I/tgFdSh+05opWhw+4kb2gDlUQOj0VVh1e28qqfSf3jZlATzGJfRmgg3AXrxnqkuoJTVMz1pUuE
	yQKl6LJ3j5IqRftr3TepaG6iCwnayJALbXeb9hRPHIOa7WiTCKEkrYRc8UwW9eK7eEk2jJn6qSo
	GaiyFbFwyWi1U/MJTsx2PVBCY3jnTr6qSsJNE91/2lY6Am49OmK/cO5kj9fP7CyYBXseI6rAIJU
	aZqqDJ7bvdYXAT6VqSySwJC5SbqKDn40eDa0PX2IaKTBziYFJywiw7VXJ15MaI4cohg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1757334528; bh=V16pK0ZIYfgGqNl0Egkr0xM
	YcXCi1y1o+CJdLE00J8g=; b=cq9DJUtZrlegFB10RxnzO0wn8DlkSKW6baIy+ceE/Alv8IwP2N
	f598FJ9nR5Q45CVZX/HbvrrPfT3mo861nzDw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 08 Sep 2025 15:28:44 +0300
Subject: [PATCH v6 1/3] pinctrl: qcom: lpass-lpi: Add ability to use custom
 pin offsets
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-sdm660-lpass-lpi-v6-1-e0a2e2ffff3a@mainlining.org>
References: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
In-Reply-To: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757334525; l=3314;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=9eDGuUU8Kw5mCLNHIuF1Jxrh5ykEUYWqrvMjduNi80Q=;
 b=X99dDeSlaDr4QY8HTBU2YDWu1mIqMAXq1wjzlClxBdbBdafnPLxBnPFpgWHk+9rdrkdr6+K5Q
 bRUFIuDnaYaA2FKE9T/Ns2FKkfr0KIDNrYJV4pz3VZoQg2rrcJRZn5z
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

By default pin_offset is calculated by formula: LPI_TLMM_REG_OFFSET * pin_id.
However not all platforms are using this pin_offset formula (e.g. SDM660 LPASS
LPI uses a predefined array of offsets [1]), so extend lpi_pingroup struct
with pin_offset field, introduce extended LPI_PINGROUP_OFFSET macro with
pin_offet field and introduce LPI_FLAG_USE_PREDEFINED_PIN_OFFSET flag.
This adds an ability to use predefined offset for pin if it exists.

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


