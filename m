Return-Path: <linux-gpio+bounces-30493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480DD1976C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 15:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83A9330145BB
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 14:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B4F29DB6E;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2Y7LFv9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85595288514;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314589; cv=none; b=Lg6+QrjYJddewguC6q04zHwIGJgszqtYTdSwowQEpIlcGDe0BYhSpcHxF6BeExhjFldboRw3BsUKiNpO0ShZf+1pbvR9r1WBD4qzTcqOtA5mI4MpAzofBmeJVDPqIxynpqRMaTCFo8+pUMvYrKwZCnmC8FW3T0AYw5R4XS0HX5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314589; c=relaxed/simple;
	bh=JDY/q5Fh1nzZe8lpn1aPwLKadCV6KYWXWmlbn1LC/iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qrm5zGqgC0D408zNfNE9XhB0oEeqyAC5vnjNbyEIScib/oOaXtn2N7Ho14c60S7ZhC9b+6FT/qtDVo0oQ9SR7d878vbVYwPCReruMpIzpU0Um7fx9JdTUM4W6V6JrOcI8w+w9AhFzXU3BM6601HSldtHs5P44xSouxKiT2XBfh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2Y7LFv9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4913CC19422;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768314589;
	bh=JDY/q5Fh1nzZe8lpn1aPwLKadCV6KYWXWmlbn1LC/iY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z2Y7LFv9heWjiWxLKZ+C/t+defSyLKTvTdCvSADt8hFgI+u0XhVz+rmk4ObWdf8I2
	 jQnUicNeXzJnCNZEL1nOvTS/eV3xzdWC2P2Okdi6lL4WxZFiwemqwyuXTKC4OlmiDR
	 f4KIWI8NZXivmCwovybxMUT5SOeHscVcaRWcH7y1TuAG8dU07LAVZfWEFFprgxDVJh
	 pMUAtooNiDUxcQjtb8Dcy6j6JDv3NwP4tBoxI9v/epM9YF0/Lpg9GN50v6n44+yrRw
	 TZ6AUTMfCKwjZlstf64Jzk1NUDmrRbs8VFTc1XhqTfhwObG+xxU3URFdqWgRo5Nl4o
	 tAQaNn6NQdk4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CE2D2D10F;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
From: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Date: Tue, 13 Jan 2026 15:29:47 +0100
Subject: [PATCH 1/2] pinctrl: mcp23s08: support gpio-line-names
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-mcp23s17-multiple-addr-names-v1-1-f14b60f92c82@yoseli.org>
References: <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
In-Reply-To: <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768314588; l=1684;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=QFjSY0s5khZXPkC3pGl32aLWJsaAHDlYMLi07GfN99c=;
 b=mUhgWjNV40Q/PX355Gyy729hsSTSUpMGhEeAPChUIFa6DDGqDTW//CI8B4aFHksjn9EkCpP34
 uA3rblN76FJAPryM4srND8rPZYsBxBXX0qlmPG70ISov4lCFAMV1UXW
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-Endpoint-Received: by B4 Relay for
 jeanmichel.hautbois@yoseli.org/20240925 with auth_id=570
X-Original-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Reply-To: jeanmichel.hautbois@yoseli.org

From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

The MCP23S08/17/18 SPI driver supports multiple chips sharing the same
SPI chip select by using the hardware address pins (A0-A2). Each chip
gets its own gpio_chip instance, but they all share the parent device
tree node.

Without setting gpio_chip.offset, the gpio-line-names property cannot
be used because gpiolib assigns all chips names starting at index 0.
Set offset based on cumulative GPIO count to enable sequential
gpio-line-names in device tree:

    microchip,spi-present-mask = /bits/ 8 <0x03>;  /* chips 0 and 1 */
    gpio-line-names =
        /* Chip 0: 16 names */
        "EXP0_A0", "EXP0_A1", ..., "EXP0_B7",
        /* Chip 1: 16 names */
        "EXP1_A0", "EXP1_A1", ..., "EXP1_B7";

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 54f61c8cb1c0..105efc85c3e7 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -141,6 +141,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 	unsigned long spi_present_mask;
 	unsigned int ngpio = 0;
 	unsigned int addr;
+	unsigned int line_offset = 0;
 	int chips;
 	int ret;
 	u32 v;
@@ -178,6 +179,9 @@ static int mcp23s08_probe(struct spi_device *spi)
 		if (ret)
 			return ret;
 
+		data->mcp[addr]->chip.offset = line_offset;
+		line_offset += data->mcp[addr]->chip.ngpio;
+
 		data->mcp[addr]->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
 								    "mcp23xxx-pinctrl.%d",
 								    addr);

-- 
2.39.5



