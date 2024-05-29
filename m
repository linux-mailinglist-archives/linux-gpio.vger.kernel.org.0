Return-Path: <linux-gpio+bounces-6861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC028D3996
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D7B91C23463
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACA315CD6A;
	Wed, 29 May 2024 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRhChaFm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBE015AAD5;
	Wed, 29 May 2024 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993883; cv=none; b=H+KsrDa7haOS4rtK3d9oSl0KKjFEqnbooD4GAGC3g3dydMZc8oPxfuhaS7ItZkcdw0TJuXk4oGYV3oed9zgg5z41h2K/WFSmxNFaA1/S1E1Yx8wzVM7v0DZmmWZ1TGmWnO79wlNsvjDj8VA/d7Gz7X8yN2hgrqpZqG4aNuwQHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993883; c=relaxed/simple;
	bh=0pXrs+ML4U9zPHyFJ97pmhikEkkdfqkCB9wqTGpEmrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Peobopjsze1eVQOD7XeAuoYHPjnpsl7ML26xqXlij3VjUGjhD9i9U6WG5bdZb9yaXbSHV38/Pmh6HpOho0Yeu7j30ISN64/aoppepNSs5v+j8SHzJhzNXYaY0yDlJmDnBJvVBIOQkkvdZAbyRkgG0NtQ8WhNaOxUGnafRnu5mSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRhChaFm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ae38957e8so893014e87.1;
        Wed, 29 May 2024 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716993880; x=1717598680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U+yxJOgIgs6wb05g1Hac981aYp4kXXW0AHwE6o7pS4=;
        b=VRhChaFmb17aa+8GG/oZ8Bqlpm/5QnxR35qaYPCHpz6VDKwCWAcXalz0oTJSUPdBiK
         58u568yoqIUjZcCzhHHZRLzPJ/dkq8sDDA725NYGQX5CzTvzd6Hx/flksNWhDjWkaCu8
         JlpvuAG5aICZYeHhGldYmZxEO8SN8+fSFgHVswfojJP1Sz4cRg0Nx0l25r4Q9Rmo8077
         TfxfRsaixRdpbN5a/m3RFMMrMdrH+eP2AFy9sGZd0PWT8C5JPv8tTW5HNRdJvcOfnwAj
         2rKffyB54WZz6v4zZr0Urb/2QjP0HIiTvdCn0QGDa2PBrKcPxj5oazgUGYq4xoayzXTx
         C8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993880; x=1717598680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+U+yxJOgIgs6wb05g1Hac981aYp4kXXW0AHwE6o7pS4=;
        b=UsCDxEbzMD3YdG/bF4wbchKfs6Li0uNiPt+j/BEmkViyDSvJoP1B9WPy/gp1HbG3Gh
         5D3aupUfNWkQVK+stip8lGCqC9MbKZm8eMKxVMSgoX7Kd2nkKWLNNyi6MClGvEPPuuIf
         PEvwhMzgSzFOKbkXJ/pj6Z2n7L/hyYzXsGkuY/Dulqu7KS+fY26fyWFW8AaHO6TSRTFM
         gV9AhrGin80haxYnFV7PdO+sqdoiH6gVqFGkI+p0ER+nZkevsi0vYDWrqvR7RdO/ph1q
         hrn7sVvDqEizSoiQaJs7wvUv567FS3N6RNwyQoHZMw8M74JG4hdDPrKPH+xuhvRIY5mj
         dU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQ05Rc8qnI+7rIsMKER05zwTKc0cAw6S5w8DacwVNEhs+EIi5GHrmwsonJnmpzvrusVLykCPHlUbLMFl5iP2H3a0wQ5TdM7o4JbPAxkZSNOrwsHH5PhjoGwkRAqa4hmuac5XJiftxtsTIeDZxv/sAL9Zbxmbd5R+ERqx4g/FOXljR08CI=
X-Gm-Message-State: AOJu0YwTNxK1/n7P67bUZUjiIEVZZdEFfiIh+I7X1oXyvtqqeE5fUooE
	lLkAXEqczqwcNywiAPq/Vyt0rlvXMMDhd3jQ6nVsz8I4IEIxihwU
X-Google-Smtp-Source: AGHT+IGXSCyoFfAW1lwdv04gyPkv0INTSF/iy4XiFcyte8XtFbghK3TSuFG3iUHYLLffXAwnLyDcLQ==
X-Received: by 2002:ac2:53a5:0:b0:51f:463c:c577 with SMTP id 2adb3069b0e04-5296410a5b4mr9026686e87.4.1716993879835;
        Wed, 29 May 2024 07:44:39 -0700 (PDT)
Received: from yoga-710.tas.nnz-ipc.net ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529ac903bd9sm928915e87.236.2024.05.29.07.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:44:39 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH v2 1/2] pinctrl: rockchip: delay recalced_mask and route_mask init
Date: Wed, 29 May 2024 19:35:33 +0500
Message-ID: <20240529143534.32402-2-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529143534.32402-1-dmt.yashin@gmail.com>
References: <20240529143534.32402-1-dmt.yashin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some SoC's like rk3308 additional runtime setup needed, so delay
recalced_mask and route_mask init.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 52 ++++++++++++++++++------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index cc647db76927..c290c755b4fb 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3170,6 +3170,36 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 	return 0;
 }
 
+static void iomux_recalced_routes_init(struct rockchip_pinctrl *info)
+{
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct rockchip_pin_bank *bank = ctrl->pin_banks;
+	int i, j;
+	
+	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
+
+		/* calculate the per-bank recalced_mask */
+		for (j = 0; j < ctrl->niomux_recalced; j++) {
+			int pin = 0;
+
+			if (ctrl->iomux_recalced[j].num == bank->bank_num) {
+				pin = ctrl->iomux_recalced[j].pin;
+				bank->recalced_mask |= BIT(pin);
+			}
+		}
+
+		/* calculate the per-bank route_mask */
+		for (j = 0; j < ctrl->niomux_routes; j++) {
+			int pin = 0;
+
+			if (ctrl->iomux_routes[j].bank_num == bank->bank_num) {
+				pin = ctrl->iomux_routes[j].pin;
+				bank->route_mask |= BIT(pin);
+			}
+		}
+	}
+}
+
 static const struct of_device_id rockchip_pinctrl_dt_match[];
 
 /* retrieve the soc specific data */
@@ -3265,26 +3295,6 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 
 			bank_pins += 8;
 		}
-
-		/* calculate the per-bank recalced_mask */
-		for (j = 0; j < ctrl->niomux_recalced; j++) {
-			int pin = 0;
-
-			if (ctrl->iomux_recalced[j].num == bank->bank_num) {
-				pin = ctrl->iomux_recalced[j].pin;
-				bank->recalced_mask |= BIT(pin);
-			}
-		}
-
-		/* calculate the per-bank route_mask */
-		for (j = 0; j < ctrl->niomux_routes; j++) {
-			int pin = 0;
-
-			if (ctrl->iomux_routes[j].bank_num == bank->bank_num) {
-				pin = ctrl->iomux_routes[j].pin;
-				bank->route_mask |= BIT(pin);
-			}
-		}
 	}
 
 	return ctrl;
@@ -3403,6 +3413,8 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 			return PTR_ERR(info->regmap_pmu);
 	}
 
+	iomux_recalced_routes_init(info);
+
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
-- 
2.39.2


