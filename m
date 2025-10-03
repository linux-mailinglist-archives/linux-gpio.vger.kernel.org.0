Return-Path: <linux-gpio+bounces-26787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7412DBB7159
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 15:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1013B423CCE
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 13:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597EA1DE892;
	Fri,  3 Oct 2025 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ggt9SLWp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25436381BA;
	Fri,  3 Oct 2025 13:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759499767; cv=none; b=D4Hq9pYezoliwNrwcfQjftuALvUQplNBOE3hw96tb7r3VTkgzdDO22VcHMnFeE+JFe5SPpII18ijxhfzTjcPZAEZmJhNa8arvCUyaMYqR0ou3YAsGldmLaJ+d0wLvvY3zrTPZMcU7mt/yC2u5U+S0QWM9d2/CJD/ATewxwXsfGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759499767; c=relaxed/simple;
	bh=APXL16u9DtsmEsPU93iOfNZjpSUSe6UPagw99C/Plzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i3oJusmbMOfa7i+D2yO1IhsDHcCyaLl9vfh0LLDv2R8qqKDLEG6051YwbKdXuK6v1rM9Oc0snEhcVRh1KXjg/3m757WBG7k++8nqrJ8OzajBDzo4+VzixgEQpGSMvJ9O3q5cVgroYgkboXGb5VblhyyjTgWR6a7XBqBOtIBiVbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ggt9SLWp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759499411;
	bh=APXL16u9DtsmEsPU93iOfNZjpSUSe6UPagw99C/Plzg=;
	h=From:Date:Subject:To:Cc:From;
	b=Ggt9SLWpKqSfaRytZouU7I7WygLTtSOqywnoCOk1auGHLUReQIj6aWCgHQ8ccQYfm
	 aDhHB5YCN3kY0RqjqX+g0p6FgLxWrIdvkuk9UQ0gILn276vmRRTHcJ6La+qk1OXbzl
	 tAjZ8z+1MVbys4VR4G2+QpbJSpHJqr2OqCVq2FHoDPlyVFJ+XRjXyghYX/fHsM2HZP
	 KXc5dnW+Mhqejly3DABMqGtJ6NwReWGRyk0Jsg2IsKgQrdc97h89Eezs/dYNcdsOeS
	 /ZaLUMMp1otn1oxWMsMB39tbuIYM+Lvm0ET409e5MlCrY+0l0cPlOV4aEawTOFOl/H
	 rQakgarywY3yg==
Received: from yukiji.home (lfbn-idf1-1-2269-27.w92-151.abo.wanadoo.fr [92.151.67.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8604917E00AC;
	Fri,  3 Oct 2025 15:50:11 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 03 Oct 2025 15:48:49 +0200
Subject: [PATCH] pinctrl: mediatek: mt8189: align register base names to
 dt-bindings ones
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEDU32gC/zWNQQrCMBBFrxJm7UASG2l7FekipmMdMGmdRCmU3
 t1gcfk+n/c2yCRMGXq1gdCHM8+pgjkpCA+fJkIeK4PV1hmtz3jnFWNpTdvhwikUeaLQlHykjMH
 psaHmElxnoRoWoXr/2a/DwUKvd42UY4Sbz4RhjpFLrxKtBf8hGPb9C78AvPqeAAAA
X-Change-ID: 20251003-fix-mt8189-pinctrl-regnames-c50d4e46c592
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759499411; l=1688;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=APXL16u9DtsmEsPU93iOfNZjpSUSe6UPagw99C/Plzg=;
 b=FtEYOCuxQadnGf2/o9O5sK78bMhzTIAs8Hdkmjhzw9XdolUDhujJGHWtbD/L0lo/zU/U1os8+
 xnXmI+K1GgUApnqB6mIta4ahvdP9cGxQllRifnouOgxj29wqyZLzSSQ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

The mt8189-pinctrl driver requires to probe that a device tree uses
in the device node the same names than mt8189_pinctrl_register_base_names
array. But they are not matching the required ones in the
"mediatek,mt8189-pinctrl" dt-bindings, leading to possible dtbs check
issues. The mt8189_pinctrl_register_base_names entry order is also
different.
So, align all mt8189_pinctrl_register_base_names entry names and order
on dt-bindings.

Fixes: a3fe1324c3c5 ("pinctrl: mediatek: Add pinctrl driver for mt8189")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8189.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8189.c b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
index 7028aff55ae5869880e9e9b14a3ad8cad6780bc6..f6a3e584588b0e8a1aafa9dca74c559974a57af5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8189.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
@@ -1642,9 +1642,7 @@ static const struct mtk_pin_reg_calc mt8189_reg_cals[PINCTRL_PIN_REG_MAX] = {
 };
 
 static const char * const mt8189_pinctrl_register_base_names[] = {
-	"gpio_base", "iocfg_bm0_base", "iocfg_bm1_base", "iocfg_bm2_base", "iocfg_lm_base",
-	"iocfg_lt0_base", "iocfg_lt1_base", "iocfg_rb0_base", "iocfg_rb1_base",
-	"iocfg_rt_base"
+	"base", "lm", "rb0", "rb1", "bm0", "bm1", "bm2", "lt0", "lt1", "rt",
 };
 
 static const struct mtk_eint_hw mt8189_eint_hw = {

---
base-commit: 4a7bcf9e0158d9976525370ff84401a1e955bbee
change-id: 20251003-fix-mt8189-pinctrl-regnames-c50d4e46c592

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


