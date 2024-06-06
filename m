Return-Path: <linux-gpio+bounces-7215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5386E8FDE77
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 08:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FB371C22D37
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 06:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE7D45024;
	Thu,  6 Jun 2024 06:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="N0OHZzx7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977843CF73;
	Thu,  6 Jun 2024 06:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717653898; cv=none; b=Hs9+Z5bVz7mPIxJgVnjccUeQFlv6wSlP1XU2/Lm+TRN4424OlqcLYXu10kv86AfqRF8gSytS+D6ZVo03rQpw504nPcTFnLt8Ep8JyaFxVvQ48+95ReVN9/r4mt3nZef/onlsV3ux5WAiJz28v+CjO6hzwbzsjs1LhTA94IsjW/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717653898; c=relaxed/simple;
	bh=OC/RhDqa8lH6HIJpNtL1mzMJHdYoAMzeaF3gHTb9Itw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHcORKYRz1yBWqUKdskee7BDFQrxUynqz+wtddgcec0WFNPGsogX7itzncCRyI7h5fbG2fU98foXiQxdNQLNfCfx/GF4h2EAhT258FpLg4w9j3M9+fgvJQ8sZTiqSRHJlXDs1fTfBYe1VAIXQDJqEXRl6Bs1nBHq0vX35PaCFuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=N0OHZzx7; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
From: Huang-Huang Bao <i@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1717653895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zzFshImQcnkQaOjfbtCDV/5BL1a1t8gOqnWdgJ2CXJI=;
	b=N0OHZzx7klyLzoJpE6VsKhaSkWRTjimHDHLLqjdY+5zHf4EppQoK2GFyIC31o3a7LsV7I5
	SN1aoJH9l37P2YBEV6iBEDTMykibsYsvpt2EtgCLhB5c6wxDRSsbL7flOjxPH8ZCEsc7SO
	GcpLjlGiQHeIetHlWD+QvfIr1MwPkk0=
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huang-Huang Bao <i@eh5.me>
Subject: [PATCH 3/3] pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set
Date: Thu,  6 Jun 2024 14:04:35 +0800
Message-ID: <20240606060435.765716-4-i@mail.eh5.me>
In-Reply-To: <20240606060435.765716-1-i@eh5.me>
References: <20240606060435.765716-1-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rockchip_pmx_set reset all pinmuxs in group to 0 in the case of error,
add missing bank data retrieval in that code to avoid setting mux on
unexpected pins.

Fixes: 14797189b35e ("pinctrl: rockchip: add return value to rockchip_set_mux")
Signed-off-by: Huang-Huang Bao <i@eh5.me>
---
 drivers/pinctrl/pinctrl-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 24ee88863ce3..3f56991f5b89 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2751,8 +2751,10 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 
 	if (ret) {
 		/* revert the already done pin settings */
-		for (cnt--; cnt >= 0; cnt--)
+		for (cnt--; cnt >= 0; cnt--) {
+			bank = pin_to_bank(info, pins[cnt]);
 			rockchip_set_mux(bank, pins[cnt] - bank->pin_base, 0);
+		}
 
 		return ret;
 	}
-- 
2.45.2


