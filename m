Return-Path: <linux-gpio+bounces-7214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 732678FDE75
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 08:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3145CB21A4D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 06:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B64838DE0;
	Thu,  6 Jun 2024 06:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="bl/uTMwt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6C48821;
	Thu,  6 Jun 2024 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717653896; cv=none; b=oKlaor8UDRrtHFK6C3HYi8ALa9AcnZIFOthZH9/GBJTpBgLU2arMVGnV6T+fMseuMnJXX5C7woufTXYIkU3bQixBIsu11FSG7AVbHencyA0/4+BD/fZsxBqhNJw5jEEO8K2cHZC3PfRcZj3YsX6qR4FwWFn3BjBCZ2CvAnyckpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717653896; c=relaxed/simple;
	bh=v8/ma7BpGBftxWXl1+PFhZJskdJ03bvSfLJ5cHT8Hpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sy+V1nNvMCUQzxBF1F8AI9MZrKBPZPcnsq84fFsMnfoij1lmxudQFkLcxgx6WgOy7HN4sVfbBu/20zjWN8/SbCdEaGe3Dl3fIQKrxyVMDdHWvEh2V+Rea2hhqXx+UgKEJLegJnoqxTD6LVWYr7avONQvfOmWlumoR3PeLtSlna4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=bl/uTMwt; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
From: Huang-Huang Bao <i@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1717653892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fk/BOxyCTjOzgG9SEUwbMyLuyPityyyids3LNWp9eDw=;
	b=bl/uTMwtS7fyjNqS2GWxVWJM+NAQ0MgTEAHJnskm600p2zmz0PYWrsFYanw+txeeJXnGwB
	LIFRYq3ahrVTl2jQbCjlwSWORHrEJdRwZ1hzs7Y7fKcjSQomGxxCb0RgwEaFecliTR8fjV
	L3jgMQi3X2X8VMEfNNBmaUDLCJ1VwFg=
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huang-Huang Bao <i@eh5.me>
Subject: [PATCH 2/3] pinctrl: rockchip: use dedicated pinctrl type for RK3328
Date: Thu,  6 Jun 2024 14:04:34 +0800
Message-ID: <20240606060435.765716-3-i@mail.eh5.me>
In-Reply-To: <20240606060435.765716-1-i@eh5.me>
References: <20240606060435.765716-1-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rk3328_pin_ctrl uses type of RK3288 which has a hack in
rockchip_pinctrl_suspend and rockchip_pinctrl_resume to restore GPIO6-C6
at assume, the hack is not applicable to RK3328 as GPIO6 is not even
exist in it. So use a dedicated pinctrl type to skip this hack.

Signed-off-by: Huang-Huang Bao <i@eh5.me>
---
 drivers/pinctrl/pinctrl-rockchip.c | 5 ++++-
 drivers/pinctrl/pinctrl-rockchip.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 23531ea0d088..24ee88863ce3 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2478,6 +2478,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3188:
 	case RK3288:
 	case RK3308:
+	case RK3328:
 	case RK3368:
 	case RK3399:
 	case RK3568:
@@ -2536,6 +2537,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3188:
 	case RK3288:
 	case RK3308:
+	case RK3328:
 	case RK3368:
 	case RK3399:
 	case RK3568:
@@ -2798,6 +2800,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3188:
 	case RK3288:
 	case RK3308:
+	case RK3328:
 	case RK3368:
 	case RK3399:
 	case RK3568:
@@ -3822,7 +3825,7 @@ static struct rockchip_pin_ctrl rk3328_pin_ctrl = {
 		.pin_banks		= rk3328_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3328_pin_banks),
 		.label			= "RK3328-GPIO",
-		.type			= RK3288,
+		.type			= RK3328,
 		.grf_mux_offset		= 0x0,
 		.iomux_recalced		= rk3328_mux_recalced_data,
 		.niomux_recalced	= ARRAY_SIZE(rk3328_mux_recalced_data),
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 4759f336941e..849266f8b191 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -193,6 +193,7 @@ enum rockchip_pinctrl_type {
 	RK3188,
 	RK3288,
 	RK3308,
+	RK3328,
 	RK3368,
 	RK3399,
 	RK3568,
-- 
2.45.2


