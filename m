Return-Path: <linux-gpio+bounces-29226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB5C9ED96
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 12:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4B8C4E1680
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 11:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C732F5480;
	Wed,  3 Dec 2025 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Kh+JcnuO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E95424E4A1;
	Wed,  3 Dec 2025 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764761623; cv=none; b=WY76PZ+tuI41sM9tR+/NzwXb5ICd5yAUmVisJQE0qB9OuYEZI7ukTe9ZXc+UhVRzCw/oJ9NYmhOBqvJuJbV1T3z7TewTfotKyqtytATma+JSGfQGqNjVkn6i1eOp0QqyMu05kIxZpscmN5GRkoiE4gmlA4pKwTRx8vDTsCovv84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764761623; c=relaxed/simple;
	bh=9H0Lj32oVEU9hMfCGeT2VAyMxxGLg8HVaCtVRvgGbrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dPL4AJ14jgyy6p4GyA2UsJBSDTdJi9kPM50RvKebKzOeVSloiwPru6aF/yCoDz+SB07/PylMWKkPsdvenYMuooVZBN3TCMiFbKikY3HVsEEUrQvFg8lbEeaS/WoHVnvf422uoLt9+5I2RWwupqx7HyQIi+rYVKhBzisID7hOkA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Kh+JcnuO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764761619;
	bh=9H0Lj32oVEU9hMfCGeT2VAyMxxGLg8HVaCtVRvgGbrY=;
	h=From:Date:Subject:To:Cc:From;
	b=Kh+JcnuOVdXsSmFt8aDzBmFIvBAwKBSeqK4k8hki9mozRpAps4Qbl5POsXIihqzAb
	 dWfkAtNE6lJEMTi4P9es7jg7qNJ+AMpXBNEN4qrtwW58GIxopcCwLb1Zb8pCSfenUF
	 xGfrEFMj4FtOT3z0B7Ji0vufrLc6gUdAx4P5ThSgBwbOMUKtfogFR3HnXwjYd0n9xs
	 HZRAeMGFa3Bvb9pWTZCaJa//Vk2omBOcZgFLOWlHmIfl9MO8G0zxf3LbohMAZBvMUL
	 bCBUiO14gimDmn3kTmSPG79XXYrl3a8YStLwWcL6fTSqFsPDYY3UqoHQSv/AwMvIX5
	 gZMM8iW3mjxDg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0545A17E110C;
	Wed,  3 Dec 2025 12:33:38 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 03 Dec 2025 12:32:42 +0100
Subject: [PATCH] pinctrl: mediatek: mt8189: restore previous register base
 name array order
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-mt8189-pinctrl-fix-regname-order-v1-1-16c8ff5490a7@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWN0QrCMBAEf6XcswdNVKj9FelDTNZ6YNJ6iVIo/
 XeDxcdZlpmVMlSQqW9WUnwky5QqmEND/uHSCJZQmWxrz8a2R46lM92FZ0m+6JPvsrBiTC6CJw1
 Q7uA9THAnax1Vzayop1/iOuyseL1rqewj3VwG+ylGKX2TsBT+12jYti+LgxWnowAAAA==
X-Change-ID: 20251203-mt8189-pinctrl-fix-regname-order-8ecce1da422a
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764761618; l=2265;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=9H0Lj32oVEU9hMfCGeT2VAyMxxGLg8HVaCtVRvgGbrY=;
 b=oDdZtMbH8bHkD0JzMY8waTUEWya8OYrMVWHwRFtHs9F3HBu+n3XgDAr0pyySPY8l+PnPQnV0A
 glEhL+EwLcQAEsDxCpf1F0WtncftcEZltprCBeAnPszEvuzbJfV981S
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

In mt8189-pinctrl driver, a previous commit changed the register base
name array (mt8189_pinctrl_register_base_names) entry name and order to
align it with the same name and order as the "mediatek,mt8189-pinctrl"
devicetree bindings. The new order (by ascending register address) now
causes an issue with MT8189 pinctrl configuration.

MT8189 SoC has multiple base addresses for the pin configuration
registers. Several constant data structures, declaring each pin
configuration, are using PIN_FIELD_BASE() macro which i_base parameter
indicates for a given pin the lookup index in the base register address
array of the driver internal data for the configuration register
read/write accesses. But in practice, this parameter is given a
hardcoded numerical value that corresponds to the expected base
register entry index in mt8189_pinctrl_register_base_names array.
Since this array reordering, the i_base index matching is no more
correct.

So, in order to avoid modifying over a thousand of PIN_FIELD_BASE()
calls, restore previous mt8189_pinctrl_register_base_names entry order.

Fixes: 518919276c41 ("pinctrl: mediatek: mt8189: align register base names to dt-bindings ones")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8189.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8189.c b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
index f6a3e584588b0e8a1aafa9dca74c559974a57af5..cd4cdff309a12b6987362b111e0613bf29b60d84 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8189.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
@@ -1642,7 +1642,7 @@ static const struct mtk_pin_reg_calc mt8189_reg_cals[PINCTRL_PIN_REG_MAX] = {
 };
 
 static const char * const mt8189_pinctrl_register_base_names[] = {
-	"base", "lm", "rb0", "rb1", "bm0", "bm1", "bm2", "lt0", "lt1", "rt",
+	"base", "bm0", "bm1", "bm2", "lm",  "lt0", "lt1", "rb0", "rb1", "rt",
 };
 
 static const struct mtk_eint_hw mt8189_eint_hw = {

---
base-commit: e47d97576181b31291cf58e77d737d21def0e160
change-id: 20251203-mt8189-pinctrl-fix-regname-order-8ecce1da422a

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


