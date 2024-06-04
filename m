Return-Path: <linux-gpio+bounces-7125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D578FB4E5
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 16:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D3D282AFE
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 14:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA84B82D7A;
	Tue,  4 Jun 2024 14:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPjrhY/7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18D9179AF;
	Tue,  4 Jun 2024 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717510336; cv=none; b=Lmdxs2VAiwhMqQ9bqVAsgVFxEJND0xzUWrCOWafM0notqUDJB5MDITcwR/zTlyFgSRCAafgFuBvNHQq8ts+DppmlPw/enMPbfiuJ9vdPgvg6hOG6U1ArHGED5m2AbP+m1zUyf2qmY+xRQFwdhOEuO5+0T7UiwTpEqPp6j0vIGEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717510336; c=relaxed/simple;
	bh=eMyXSOQOT43iLqcN4yT0wGM8KoO/1+7sYYREbBUtemg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyDoPVCWdlnni12hax7P2muu5QVLV1njOVp7aw0r9rfnz4kRnS8LTYOv1qNJCMVSbJXp1K5Uz5JI6jsyx3hq/dHseCyrg7FQMZzDPbunbiyTCiuRkDCs5YrwYgCD7WtrQdHOosgZ+Hs2hUPMD5+qYVPiQE43w4ctasTfrpk1zkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPjrhY/7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52b8d483a08so4545517e87.1;
        Tue, 04 Jun 2024 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717510333; x=1718115133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmSb1T/VVTzErPc/hVH5RhenzFyIr1nmaXQZzXj2G2k=;
        b=gPjrhY/7aed5GNF3G3yn6GhuzI5oiwHL+WhEuN5wyAgQsbU+fIL1HimwHHfTpJqpJF
         qn1agwYPDZkrDQrXLKqGVwpWDnvstncP31xQNZsozut/9Pq91sNlP45iW0YyWbhRai64
         C5BSuqB6Ww/6ZoQ57DRjXIx3h1S5VXuG1a0TFCdmLhwlmZ274a1hDl/ayktmtu2SROOn
         9OeRFYFNNDNt4m83BnTotwRch59MyLL7iwOcG4ggygxVwFZmnaF7KGV0mXoRE97LO6Th
         cN25UDWv9inbjXxaLAr9p6/7n8HKLNN9WC/DS+D73yfj5ao5KL/F0MFbq4tRLGN2BEEZ
         OF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717510333; x=1718115133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmSb1T/VVTzErPc/hVH5RhenzFyIr1nmaXQZzXj2G2k=;
        b=mip0d3F7PZIXkhIC+Pru/h9TGKmKibbIGRp3ZmDb0e4Qvi1d7tJj3ypQ8pt8PGVhuY
         8ouo82UbZqrDT5/qlTwZJbF+paOP5ied48mghxCsZDoVe7k654eluBC1Z086yTxyrZJx
         VpklAKanc6VOz46JRVWJuMjO7mxB53hY46KuwfapKiy0rti4FstopK4Z0IRg1SILh8VL
         M2ENgYZtYOlfKgZdrzr/Z8Skv3bpV4eE9kJUXi6audHk0Ht7wmnW03RjCU8bJUoRSe/i
         PRQErZV0D61R7SwNx7EA1IHB7gQUk31YiiM+xPrJ34l9fOyGtt6kInbTbY33Qme0Th4z
         yl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtQJEp29hj0meGKRV15NxFM2fM8+o4qurlg7+lU6m4c/Zdd1Ls4KqBAxPd9bCms9FhQuS6tIWXnUK8eBC5YZDOpNR+WCubrI4Pw8WrTdG5FVpNzQZhG8Uv3nHBc5qvGe7bHPD49uIQTkne1tqEcOtYpoG/s/vRWPgcBgYs3ZsbleWSbVQ=
X-Gm-Message-State: AOJu0YwWEjRMyqyD7Ce6oHunN+SiEdTIYAtsvT+C0Z+cZo+tDskwrgMU
	2BxKi7H/5IwOn2mXlYUXQwSs0pT0iVh18GoIniHZ0LBadBV8WTvq
X-Google-Smtp-Source: AGHT+IHYQNbt+cYQfc7+Uhr8tfuad6kxVxl6LzEFNoBOEmCGkZdeactT1NLRjFLrcC/X7wM3oRe0vA==
X-Received: by 2002:a05:6512:7b:b0:52b:8843:b084 with SMTP id 2adb3069b0e04-52b896bfa33mr8318743e87.47.1717510333160;
        Tue, 04 Jun 2024 07:12:13 -0700 (PDT)
Received: from yoga-710.tas.nnz-ipc.net ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b982d3de7sm742743e87.2.2024.06.04.07.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 07:12:12 -0700 (PDT)
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
Subject: [PATCH v3 1/2] pinctrl: rockchip: delay recalced_mask and route_mask init
Date: Tue,  4 Jun 2024 19:10:19 +0500
Message-ID: <20240604141020.21725-2-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604141020.21725-1-dmt.yashin@gmail.com>
References: <20240604141020.21725-1-dmt.yashin@gmail.com>
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
index cc647db76927..b252d1454ce0 100644
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


