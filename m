Return-Path: <linux-gpio+bounces-21317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF0AD4B40
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92C631706B6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCD123C8A4;
	Wed, 11 Jun 2025 06:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ah5Iao1u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F48423C508
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622514; cv=none; b=fpuJDvYDvzCTiOk5Jizu5EYInLc10UlcGuxnfWso68btzYKsBTz5VmPHVDNgl//0IpSbZWUEfPQRVB0uwRjka1fl4OYcHMWay+Xrr/H8k8PpRLTngW3EIIKjYI2HAuTpKT+Ix8pIS7oLJ+YcvujL12VVb/++LVgdjZAvbJL2OYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622514; c=relaxed/simple;
	bh=aZiHVtAix4Bs7VFa47r9w+gaIOPFsTrPZZVeoeZFBbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDFS7v0Gih2DvbpieG0QHEwKf7WFuq6CUV6/63UyczffLezQnC4E1UE9x9R9HzcQKWczpgbLmEEIcqXv4MaHBWUs3rDzM2tTxekBdLEc4VTy4sjvVH871akZrdJSlnXuIXtvTlzEpeTsyowYUbMKiMdpNuqV2yKR++va7+5LE8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ah5Iao1u; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so32979f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 23:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622510; x=1750227310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=Ah5Iao1uoR91qIN+j4clhnv9wQrnCGse0RsdpiYp50PwzmBiW0/GgHL8bZx35Dr/Rs
         ndFeaMF0Q0pD7R71+oCaUa35eE+oOQLsLBbHAPmujZNqlOQ9+sWlJejfH4o/isnj/Nr0
         09WZQabZTrbGIVMiqZu4EhMCoT+YAD5Poy/Celpj5EXvKQBlAtRD+zhuBDj2BtedTBuu
         WUYcWluSk6ytY8OGy41gSgbokRFHZbtiuk/iv5uqS4155bfmbCIHKEvOrFqGKUflSpne
         /5rp+ci3q5Wx+atE0l/M2qK33OD8B7nMksdFknkkzWQIwpaguc7F6M+MDNqL3iACANkG
         gWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622510; x=1750227310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=Jj1urm4fBCUV3Flh7XkmfeB4SIFN43Qww+8A4egiXjmua+caDvmNnKJhRpjBoA82uw
         zSXtjca1xQ+478UQoYi/rmeHTVmKL6RmrztrOOm4FLUSGHFEVbjXGMacJA8BfaiZOD6k
         s+Mw2fpROIdI/f+ouSidIVCnKnfDExisRfDUMmOXFgkctOjqBXHyMJFHSWbzgOpERNf0
         S5kRAzWTpiV5FGaqVIuVHShy2OEIU5nCM7FGg6Nl6ze22eXLDcaZ2spie/FvgTgOl8ip
         TCsWmqfSBkxJRou9ibHHbXt4c69R8YffMtaUTYMkx/r+PJanicuyjDfzDiU+9ISqBs+l
         6MEg==
X-Gm-Message-State: AOJu0YxNqZbFjwmY/h5nn/DQ1U4mFA8ylc3dTHwH7wVz+p1gTPytEbWe
	6cnKQSrJO9UGxvRehJonvjM3ppaS9TgbC5g78G5XVnUqSi+3t/u88fFqKmUeGAuvAEc16XQE2fr
	dPm+y
X-Gm-Gg: ASbGncsDJLyw6Njr+cK3MTXMFaNl3NQncG4X0aEsbu2rOIoMA9ldIGdpFxrYetyIF0g
	QD0vZbD2DUZovKE1QereFFC4diSWDc7PVO6Wf5aSjL42yOrwr+LjqUm+uA3Kv7C6m6gbeRBYzBW
	JmX0Hi3bapEbnefvKF0m9FNu5aVB/d08AQ3zaIQdXqz6izxricu8qx4IlB1SS+mkcAUa4zWFdh2
	hGacpLJrbeIhYnHhws1a+7GnLLephknUvFGDckKdO0vyWYI/8YjHD2cMJcZlf36RLGRRqCH2B+e
	ZkRosd/let6/If2ZA0WJHyr6EKQN4CUSoLllEoJTRMHHrs7AbMzjoKc7vtDfeM/2vvPjQjQOGZw
	UFXtssmYTENaH9RzOsg==
X-Google-Smtp-Source: AGHT+IE7ZMpyUDf4YrNSUvsjoRE3vjRVPb6bVXPGoeL9ls3/WZGat0okcbwks4ptZKut2a4VQEsADA==
X-Received: by 2002:a05:6000:18a5:b0:3a4:e667:923d with SMTP id ffacd0b85a97d-3a5586cbaafmr541720f8f.7.1749622510208;
        Tue, 10 Jun 2025 23:15:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:15:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:49 +0200
Subject: [PATCH v2 17/17] rtc: stm32: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-17-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aZiHVtAix4Bs7VFa47r9w+gaIOPFsTrPZZVeoeZFBbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6t5SafcpPp5dX+SCVOeGb2hFRBkfuLb14pw
 s7c8HNmfV+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkerQAKCRDBN2bmhouD
 11knD/9M3DV/vwXFJpNByYjPAAfPbQYiYkwFNYQHUnPzXNhKs/vugtZWoOplA3JWYFVV83HKQP7
 uw3WamLIyTbIQRBTc1s5kYotDILFcXtEuSZn9ut+zGmEtrMVigSPDvqgokfS+ZQSs6dQPF5ZJv7
 +aqYtV+yIAgCJ5de6A8vYZsWp6UYmn51U4Y4R/OX8UM6fxzj+bbMuXr73AsweooW/WYTwxs0tGQ
 u8J/Ig7SVBkSMfYTdGAi2fabtexF7dXOeVyVlmbn9PdktSW/PsChHgaxt74g8YGyq8RAVS7G3oy
 Wb5YIe+nXI8oxp2pRHHcp/1xme8/Dq/OHlHDjYlqltkPGqKUpbDCTqOMbfwl+oqk832IU9YSTYE
 6qMWelzKCzuphqYOP+gk02SE2WKQ5xuQ3kLSCC2YtcSwoP3/V85G4qFLQm2dXZHHW1lAjFiMdL4
 k6iyeo+At8cXPMKvUYLbuCfzKzXpCJ1F45XL0v4mlYrRtXqlWYkAdPq93S3x5jij462AEvNwTz4
 G6DrpD8SbLh/EnkF2C3h7fpu++EsQsj3fXVaN5uHzzibtagMfWEF/xN9Li05E8PYsIhiqmrijA/
 blAWty+7bSqiSP1NbqhzH0zmIcCtAbAzmN9j6DHNVcQq5mzCAKwkNBKtxMNJ2suuFDzyHqWvfGI
 a63Jhr46asoT94w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch depends on this series - const in pinctrl core. Please ack and
this should go via pinctrl tree.
---
 drivers/rtc/rtc-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index ef8fb88aab48a0edad19ae5872421815aa04fe46..d4ebf3eb54aa9e91c8e9f8254f571c53794192fd 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -393,7 +393,7 @@ static const struct pinmux_ops stm32_rtc_pinmux_ops = {
 	.strict			= true,
 };
 
-static struct pinctrl_desc stm32_rtc_pdesc = {
+static const struct pinctrl_desc stm32_rtc_pdesc = {
 	.name = DRIVER_NAME,
 	.pins = stm32_rtc_pinctrl_pins,
 	.npins = ARRAY_SIZE(stm32_rtc_pinctrl_pins),

-- 
2.45.2


