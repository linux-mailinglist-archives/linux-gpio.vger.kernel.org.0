Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0849510E5D8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 07:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfLBGNP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 01:13:15 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59187 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726474AbfLBGNO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 01:13:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 7311F22653;
        Mon,  2 Dec 2019 01:13:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 02 Dec 2019 01:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=KfBRrhFBf9c8i
        MsygybgqXbOkUXr/sjlQli8oIqtUDA=; b=LZC2Uf8xZon5cmCeIYCVzppjbP4x0
        TMPXSvjOC3FJRwvf2ZtpdIEzS68ixEADx/0hQFtbZDtRICH858prWIhYlE1wW0Ug
        NAJF5md1LK5J45tAVZPcPy0kG9ZpEFMrnXsnlNlWHhiM23Ky6Tt1tPN7CRWG/JZ0
        du3TQ7qPmxqO4zaSxMXdEzbChVB0etC4bW2QKxxLwN5mq1q4+wovGo2oKJ5MNWQ9
        L4txNFfLA5++iXbPr33/ZHPrkNF/xk0yom2vnwwjsrIvndwWmIhIx2fA/bAScsL5
        FFLPsG4VTAdQ+G0rDcl0HdrDk+3UyYK1pPedi0DdU7xJAsR6pOXYoEDOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=KfBRrhFBf9c8iMsygybgqXbOkUXr/sjlQli8oIqtUDA=; b=GQYrsNWg
        b136+ZHtUt+/3w9srqrxY0c9KwSmQsft3F9v9IRpVsQ5Il+yQ9qnoAWEu+CCvGQQ
        62JuvOHsAuJZrivQRJtqYqDii3592HLpf4UUHKttWmASADRaJKfk7ppo9WcNZ1SQ
        h6qI/WYXx8kwWedGYxtQ3C2WspJNTHZJMgCci2kowkNYktzcke8aFsPmG+3cIy+3
        1fpBv819w4VeTT/8dCvP8+weXM5oSFS2UvLsevxFYlxfvs9gyOI301GvOx5Uv4o2
        YGUOYnxx0IdywbmV890lT7qNgtgdjADZi5P9IVn1Moe61xcASFufoHLkTTS9fYc2
        yjytQkj3L7k8vw==
X-ME-Sender: <xms:eavkXV23eehNitEouPofpyerJu-f57O3yUPLU3Xq7Dpm2uv1KOTcSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejgedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
    ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepudduke
    drvdduuddrledvrddufeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
    jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpeeh
X-ME-Proxy: <xmx:eavkXZcg4WA8FqlRwyiq06BpQOBsau0cS7WkkHpkm6bw_WihiFPgLA>
    <xmx:eavkXbFEVIwKWFgG2y4DcsrK3vOnIcizSK1MZFxqFP6Ss5qTMdeL9A>
    <xmx:eavkXQNgmZmBZb1llQAboQEFByUJ-YFpLv2A5uC6aa_A1kOYz2abaw>
    <xmx:eavkXbBFHRGjpglObvaucqu4iCN0i2eEXKwY2jDM3LYtVh5dJ9J_fQ>
Received: from mistburn.lan (unknown [118.211.92.13])
        by mail.messagingengine.com (Postfix) with ESMTPA id BDAA58005A;
        Mon,  2 Dec 2019 01:13:09 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Johnny Huang <johnny_huang@aspeedtech.com>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] pinctrl: aspeed: Use masks to describe pinconf bitfields
Date:   Mon,  2 Dec 2019 16:44:31 +1030
Message-Id: <20191202061432.3996-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202061432.3996-1-andrew@aj.id.au>
References: <20191202061432.3996-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Johnny Huang <johnny_huang@aspeedtech.com>

Since some of the AST2600 pinconf setting are not just single bit, modified
aspeed_pin_config @bit to @mask and add @mask to aspeed_pin_config_map to
support configuring multiple bits.

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
[AJ: Tweak commit message]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 10 +++++-----
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 10 +++++-----
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 12 ++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    |  7 ++++---
 4 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 62b8aa53b627..bfed0e274643 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2595,11 +2595,11 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pinmux_data *ctx,
 }
 
 static const struct aspeed_pin_config_map aspeed_g4_pin_config_map[] = {
-	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1},
-	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0},
-	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1},
-	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0},
-	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1},
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1, BIT_MASK(0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0, BIT_MASK(0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1, BIT_MASK(0)},
 };
 
 static const struct aspeed_pinmux_ops aspeed_g4_ops = {
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 2acbcf3d508a..0cab4c2576e2 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2781,11 +2781,11 @@ static int aspeed_g5_sig_expr_set(struct aspeed_pinmux_data *ctx,
 }
 
 static const struct aspeed_pin_config_map aspeed_g5_pin_config_map[] = {
-	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1},
-	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0},
-	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1},
-	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0},
-	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1},
+	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0, BIT_MASK(0)},
+	{ PIN_CONFIG_BIAS_DISABLE,   -1, 1, BIT_MASK(0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH,  8, 0, BIT_MASK(0)},
+	{ PIN_CONFIG_DRIVE_STRENGTH, 16, 1, BIT_MASK(0)},
 };
 
 static const struct aspeed_pinmux_ops aspeed_g5_ops = {
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index fc68aca7b36c..b625a657171e 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -464,7 +464,7 @@ int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		return rc;
 
 	pmap = find_pinconf_map(pdata, param, MAP_TYPE_VAL,
-			(val & BIT(pconf->bit)) >> pconf->bit);
+			(val & pconf->mask) >> __ffs(pconf->mask));
 
 	if (!pmap)
 		return -EINVAL;
@@ -512,17 +512,17 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 		if (WARN_ON(!pmap))
 			return -EINVAL;
 
-		val = pmap->val << pconf->bit;
+		val = pmap->val << __ffs(pconf->mask);
 
 		rc = regmap_update_bits(pdata->scu, pconf->reg,
-					BIT(pconf->bit), val);
+					pmap->mask, val);
 
 		if (rc < 0)
 			return rc;
 
-		pr_debug("%s: Set SCU%02X[%d]=%d for param %d(=%d) on pin %d\n",
-				__func__, pconf->reg, pconf->bit, pmap->val,
-				param, arg, offset);
+		pr_debug("%s: Set SCU%02X[%lu]=%d for param %d(=%d) on pin %d\n",
+				__func__, pconf->reg, __ffs(pconf->mask),
+				pmap->val, param, arg, offset);
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 27d3929b6aca..6f0f03395617 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -24,8 +24,7 @@ struct aspeed_pin_config {
 	enum pin_config_param param;
 	unsigned int pins[2];
 	unsigned int reg;
-	u8 bit;
-	u8 value;
+	u32 mask;
 };
 
 #define ASPEED_PINCTRL_PIN(name_) \
@@ -39,7 +38,7 @@ struct aspeed_pin_config {
 	.param = param_, \
 	.pins = {pin0_, pin1_}, \
 	.reg = reg_, \
-	.bit = bit_ \
+	.mask = BIT_MASK(bit_) \
 }
 
 /*
@@ -48,6 +47,7 @@ struct aspeed_pin_config {
  * @param: pinconf configuration parameter
  * @arg: The supported argument for @param, or -1 if any value is supported
  * @val: The register value to write to configure @arg for @param
+ * @mask: The bitfield mask for @val
  *
  * The map is to be used in conjunction with the configuration array supplied
  * by the driver implementation.
@@ -56,6 +56,7 @@ struct aspeed_pin_config_map {
 	enum pin_config_param param;
 	s32 arg;
 	u32 val;
+	u32 mask;
 };
 
 struct aspeed_pinctrl_data {
-- 
2.20.1

