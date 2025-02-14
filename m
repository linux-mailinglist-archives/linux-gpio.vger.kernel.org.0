Return-Path: <linux-gpio+bounces-15976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 416D5A3530E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 01:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFCB83A973F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 00:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CDB28E0F;
	Fri, 14 Feb 2025 00:40:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1B517E;
	Fri, 14 Feb 2025 00:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739493605; cv=none; b=n2k1rvViSblGA+aqnaCI4WfVukPRumIxqNG+bTNc0I+z+aSStgfg3w1ZJJD2Xsg7gFZkrSRGLsHXZEwT+hYuMl+jQitzUo8AXlaOYASgdhLS6a2+BDUvGQmA4RqlOq1C3qbMpaUk37ghauxm50iJLDZK1DOMnUd04l8gp3zQdMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739493605; c=relaxed/simple;
	bh=121spaMlpCdmk+wzfSLjmbf5MLhgPjLXeYoXRdBa9Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phqWxjLHbQRgJBTPqXcAM0F1Y4iWRVFQQiVouzeF2tT639S1e70LLRB6/v2TNlzT10eROAekVODRTX2yC4p/5BEJ5x3FK4fHjdBORlJ+Q4mzBMNVS+13di7XVKKxk6MXUSBZnMl1Ha1dkN5Xzwt/97suWX1ARvoq79TbkjV2byI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EFF81A9A;
	Thu, 13 Feb 2025 16:40:23 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69B303F5A1;
	Thu, 13 Feb 2025 16:40:01 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] pinctrl: sunxi: increase number of GPIO bank regulators
Date: Fri, 14 Feb 2025 00:37:28 +0000
Message-ID: <20250214003734.14944-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250214003734.14944-1-andre.przywara@arm.com>
References: <20250214003734.14944-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By design, the Allwinner pinctrl IP always supported up to 11 GPIO banks,
though no SoC ever used more than 9 banks so far.
The Allwinner A523 has pins in all 11 banks, which exceeds the number of
per-bank regulators that we currently support, as this was set to 9.

Increase the size of the array to hold up to 11 regulator structs, to
support pins in bank J and K as well.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 8e2eca45b57f8..fbbf070a87542 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -155,7 +155,7 @@ struct sunxi_pinctrl {
 	struct gpio_chip		*chip;
 	const struct sunxi_pinctrl_desc	*desc;
 	struct device			*dev;
-	struct sunxi_pinctrl_regulator	regulators[9];
+	struct sunxi_pinctrl_regulator	regulators[11];
 	struct irq_domain		*domain;
 	struct sunxi_pinctrl_function	*functions;
 	unsigned			nfunctions;
-- 
2.46.3


