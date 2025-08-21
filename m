Return-Path: <linux-gpio+bounces-24693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5616B2E9A2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 02:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C8067B9671
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 00:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7581F4C8E;
	Thu, 21 Aug 2025 00:46:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C8F1EF38C;
	Thu, 21 Aug 2025 00:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755737160; cv=none; b=a25GaEny83J6MoWNsRQ8Bda6qLuvRkGbjSQanUb+a/KlEH2fQytQrALFTYBOnIIuL9Wso2cwtsDE/rtRGI0DKkc2ycC/5VPI49V5mR9n4FnWFtlnMThbu1945DxnaOoeSvPTHDcKsP4aqRM4V8xwYw5Bkcq+TVcq2mfc5QWtjP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755737160; c=relaxed/simple;
	bh=3wyMNsN5QUGbBFFidIk1AyniubIqULrz/pBv/jUsBek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xdycgr0FtAyv0iEbPbIbRYYc3VipvD56pztDYDaDyAJHK43TReY3nD+ShnaJoB/UR4ChFVIjFoXQBIQicfMuJa7R/1jbm8Ya3+Q87wqMvj+8Z9GR+t8WR8Yj0DoJoL422i9sYWOMPa0V+3D6CJxA/FZI0wxcrb+rX/Htsu6lGcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA2CB1F37;
	Wed, 20 Aug 2025 17:45:50 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E78D13F63F;
	Wed, 20 Aug 2025 17:45:56 -0700 (PDT)
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
Subject: [RFC PATCH 8/9] pinctrl: sunxi: a523-r: add a733-r compatible string
Date: Thu, 21 Aug 2025 01:42:31 +0100
Message-ID: <20250821004232.8134-9-andre.przywara@arm.com>
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

The secondary Allwinner A733 pincontroller ("-r") is interestingly not
using the same new MMIO frame layout as the main controller, but is in
fact very similar to the A523-r one: it has two banks, with 14 and 6 pins
each. From the driver's perspective, this is all we care about, so we can
re-use the a523-r pinctrl driver for the a733-r, too.

The individual pinmux settings are different, so we must not use the
a523-r compatible string as a fallback, but we can surely let the same
driver care for both the a523-r and a733-r IP, as the pinmux values will
be provided by the DT.

Add the a733-r compatible string to the match list, without further
distinguishing between the two. Should differences be discovered later,
we can easily split this up then.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 86a12bce0e335..437c955463bac 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -41,6 +41,7 @@ static int a523_r_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
 	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
 	{}
 };
 
-- 
2.46.3


