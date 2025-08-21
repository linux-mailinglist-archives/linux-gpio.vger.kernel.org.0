Return-Path: <linux-gpio+bounces-24688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A7EB2E99A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 02:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE6E6806C4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 00:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968721F1517;
	Thu, 21 Aug 2025 00:45:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEF81E7C23;
	Thu, 21 Aug 2025 00:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755737149; cv=none; b=XkbRfVj2UnLSw7+zwi0ncpWHNp1F38gWIS1ZoSzTvTMpdW8cWobp2TRSe7rJoOh/q9Ui0mnpTZwg7DHpvAs9WSLLbSBmX5jLkw0t9gQ5rvbav5tT1B0je/qtAJ+lmYc6rwhUuERJumNHpE+gDZMA1kde8iwYXp+6KUu/y58val0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755737149; c=relaxed/simple;
	bh=0OEygut+RxWS2rm0T1RcAcv45NFTwBUwmnwutiogBFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKDc26JDoQHbF/xViEjftBm71y+hYnVfoPmZdB6VKtQXVhEoOY15f5jleMTqHYLZMd4SDOs+RNyMACn9TMPORdLXVlI3PLk6+11uueI71GMPWjrmCgBRtXL6b1/1zPZwnkbqltadTIJ65V1WsEMcwXKEGsBy/zrPq+KmXpRVf/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67ED82573;
	Wed, 20 Aug 2025 17:45:39 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A630E3F63F;
	Wed, 20 Aug 2025 17:45:45 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 3/9] pinctrl: sunxi: only use PortK special handling on A523
Date: Thu, 21 Aug 2025 01:42:26 +0100
Message-ID: <20250821004232.8134-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 pinctrl IP requires an exception for addressing PortK,
since the registers for this GPIO bank did not fit anymore in the
existing MMIO frame. Since the A523 was also the first SoC to actually
implement PortK, we just enabled this quirk unconditionally.
Now the new Allwinner A733 changed the MMIO frame layout, so PortK can
and must be handled without any special code.

Mark the special casing for PortK with the ELEVEN_BANKS quirk flag we
introduced, so that it will only be used on SoCs using the A523 pinctrl
IP.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index a5e390c7ba0ba..2af6ebef7a10b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -67,7 +67,7 @@ static u32 sunxi_bank_offset(const struct sunxi_pinctrl *pctl, u32 pin)
 {
 	u32 offset = 0;
 
-	if (pin >= PK_BASE) {
+	if (pin >= PK_BASE && (pctl->flags & SUNXI_PINCTRL_ELEVEN_BANKS)) {
 		pin -= PK_BASE;
 		offset = PIO_BANK_K_OFFSET;
 	}
-- 
2.46.3


