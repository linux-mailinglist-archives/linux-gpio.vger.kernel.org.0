Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F07A1869C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 10:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfEIIOX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 04:14:23 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14984 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfEIIOX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 04:14:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd3e13a0000>; Thu, 09 May 2019 01:13:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 May 2019 01:14:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 May 2019 01:14:22 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 May
 2019 08:14:21 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 9 May 2019 08:14:22 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd3e02e0008>; Thu, 09 May 2019 01:09:21 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <pdeschrijver@nvidia.com>, <josephl@nvidia.com>,
        <smangipudi@nvidia.com>, <ldewangan@nvidia.com>,
        <vidyas@nvidia.com>, Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [Patch-V2 2/4] pinctrl: tegra: Support 32 bit register access
Date:   Thu, 9 May 2019 13:38:14 +0530
Message-ID: <1557389296-10257-2-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
References: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557389626; bh=9yMa0MdESN+pqf3yySouNjMJ8Zwp0P/OmYwg+K6jF8I=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=J2BXM12oxrdqWYx4UJrlHxPtNvpUtPpxr3TUyCXrbzXhIWEKE6VQwHtY+BxZpRg1O
         iOSjYcKWOclsg1KZkoxULIOEOG68MtVRWJjsJy/qFhJEVqI/LfD/i+lUMdXdBVmeUw
         hjQIJsWd1HIPHdNIAedXXSBAmjtA0jEZgJV4occrX+ib+LrUpuFEuEzWEXIUmVdoqC
         XPGT8sRsdhvb0PfiO1eitzKDF8H4ERbjAq9Qjvsj2j3Z1NEjk+5koW/C1ok+egjLft
         LZUiTQh3O3o2ayl0kUG4EjGzXJbGr9n01zsYmfbOw/ARGDrfIwnrhRU0cINNQpAmD3
         DuIIncJ/YPF8g==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra194 chip has 32 bit pinctrl registers. Existing register defines in
header are only 16 bit.
Modified common pinctrl-tegra driver to support 32 bit registers of
Tegra 194 and later chips.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 8 ++++----
 drivers/pinctrl/tegra/pinctrl-tegra.h | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index a5008c0..76e88c4 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -292,7 +292,7 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 			     const struct tegra_pingroup *g,
 			     enum tegra_pinconf_param param,
 			     bool report_err,
-			     s8 *bank, s16 *reg, s8 *bit, s8 *width)
+			     s8 *bank, s32 *reg, s8 *bit, s8 *width)
 {
 	switch (param) {
 	case TEGRA_PINCONF_PARAM_PULL:
@@ -451,7 +451,7 @@ static int tegra_pinconf_group_get(struct pinctrl_dev *pctldev,
 	const struct tegra_pingroup *g;
 	int ret;
 	s8 bank, bit, width;
-	s16 reg;
+	s32 reg;
 	u32 val, mask;
 
 	g = &pmx->soc->groups[group];
@@ -480,7 +480,7 @@ static int tegra_pinconf_group_set(struct pinctrl_dev *pctldev,
 	const struct tegra_pingroup *g;
 	int ret, i;
 	s8 bank, bit, width;
-	s16 reg;
+	s32 reg;
 	u32 val, mask;
 
 	g = &pmx->soc->groups[group];
@@ -548,7 +548,7 @@ static void tegra_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	const struct tegra_pingroup *g;
 	int i, ret;
 	s8 bank, bit, width;
-	s16 reg;
+	s32 reg;
 	u32 val;
 
 	g = &pmx->soc->groups[group];
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 44c7194..82cd947 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -143,10 +143,10 @@ struct tegra_pingroup {
 	const unsigned *pins;
 	u8 npins;
 	u8 funcs[4];
-	s16 mux_reg;
-	s16 pupd_reg;
-	s16 tri_reg;
-	s16 drv_reg;
+	s32 mux_reg;
+	s32 pupd_reg;
+	s32 tri_reg;
+	s32 drv_reg;
 	u32 mux_bank:2;
 	u32 pupd_bank:2;
 	u32 tri_bank:2;
-- 
2.7.4

