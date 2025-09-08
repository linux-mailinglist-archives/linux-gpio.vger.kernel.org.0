Return-Path: <linux-gpio+bounces-25733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8188B48C56
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 13:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 930261B24102
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 11:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB52E2EAD0D;
	Mon,  8 Sep 2025 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExPoEner"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120C72EA752;
	Mon,  8 Sep 2025 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757331455; cv=none; b=WXsrH09Jorgen5PDeEBCru5gIq6AtN6VWb1txKohcv5YI+1YCO4b0o+uIm0A5Xovq2Zil4ZZiaifoPsONq6BAphLXExszJJBbCbDoLAs2jVQXSe3MkmJqbBx2c7G46eElVHTwzDqZbGKXGicIz6SfPMJ/RfEbE8hFZCNFDAGq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757331455; c=relaxed/simple;
	bh=MVlqy3slV3y6ZjiaqPiDqOaBDefxpITHFzQvxKK8Xzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aivjZU27cfoVG8KLECeAFC9vQ4Y5pKKaL2oYkUiZaRHVgl3c0RzGpks0vi4rQPSabosyK2LYbGjc6bo/bVdeAEUHJJEylCASqYQaiarMFkVnARkCmRGzsCIDYEsyFOPJGqvu0Uhmg/8QRqUeqoRE9QT67+hmp8kuVI23jNZtnHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExPoEner; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3dae49b117bso3735264f8f.1;
        Mon, 08 Sep 2025 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757331452; x=1757936252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0BqDeeLR0uUmM7C0k54IlZeBl9ozo62JGf6aTcx1wuY=;
        b=ExPoEnerwOlu6R3mdtWPxDqoQwiE8YD4NgHpha7pas0plGznDzuOFj88U/759jeroL
         8Uq2NFVtHnv3UN+7Ni2H6rXYqoC5/MO3e8qOeh5zzKp4ZKlJZ3ovMDIrkrR3+ym5KIs9
         VSoAeDddgGJdH7Y6Uzz14Dk+OHhGFmeiFaXTfhgbC0KXEwrXGXiYJPydUUaD20vygim3
         cI677N2H1jtNHxvP2EkC3eJ9Vno8xxIhSPFAZsUlw5uA55IuaNuq45mcTC0lDH08KbJM
         NQDAknuTi4VkXuHkvcLd6PDEkcYe5WqKu2pf7AvWG/lWgdTujT2W6C/sOneZT8Jr4Njl
         FOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757331452; x=1757936252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BqDeeLR0uUmM7C0k54IlZeBl9ozo62JGf6aTcx1wuY=;
        b=Xyd4Fj95Q8itRegLUYXfDalo4hUkOh+hZu9P4Qaibl+WKZJHxrWWwL8Nj/l7BzGf+y
         56dI5XPmBrwgr7vVfy8qvBfvkGWXaBitnH0ZK7WWNVdXRZacuH1axbZ3ilUgtWtXREE8
         YQtFxsHoyxqoAMS+tbTIPp9dNEYV6jXlL+jxZTSVdbp84L1Eme5dCjt8FhXfnWD75zM+
         cfNTnwDucc6qi8tVUdNls1xgBuZigbGo9xbc+FFk/CYvN9K+JSV+WHiifsQfcHo63Vsh
         MgPp7vL0mKHKVSeIzPy0GQmkvrb0a2DRFhKnZb3c8iXwh0xCTKXd0UBqhKDbCuGPTwl3
         aU+w==
X-Forwarded-Encrypted: i=1; AJvYcCWij0IP0STZF7uhma9p/c4wqqTGd9D+aqivRVvPIbDSkmo169utb76Jkn1qC2N/KIebLQxxN//qWRAS@vger.kernel.org, AJvYcCX+tmtOH6xRMY+PMNlAyOEt2+fUoZ+6eplbn/ULiNqdAMeP463suRTxsiAkutoFFS+WIQHMjMoOCo1nruSs@vger.kernel.org, AJvYcCXRUaI16DGvibuNpZu8KEx1NxMznP0sGV54bdWjr/PmoMvfMulSnMDaeGdtlDCXzVIUi7RLnZ8B@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+KxAP61Nw4vQFG0lV4zNAF/ec1XP7kSxSP+GTCTj06FoKTTtw
	vpQKcUIY6U8X7aN3AYsr8BSK8mdAospLRCUJXT98B+TVza/SZxuvsQJe
X-Gm-Gg: ASbGncvqkU3XVHExOIMD3sq4hWzU6JQPv+1b3xvQpp3M6I4HrodFNJKtMR/60KNCDcS
	5yQEFLsU0ivyM9VE48M291xVKXgkbxfhIzc77aZPSjbXL0KqJNCXAtxth/85SfdX/+HduVHmDor
	4Bz0adTgPCj7Ot1wkMxBWFgehTzpvbTKl4YlNiONAn/6SZ+tgM06RuIjW3ytiLMqZMD1lyiMCPz
	N3dbaFOsn9OSGAF/IuOkzfIqTSTPNFTx1CBhgdSNnCjnvHET7kfwEu3IHT/ZeGQ+jkzbB+OoEBQ
	FL20b7dsR/jp7pUAlVg9q+KutxxT8LgDfeeOy4EYtjhplWZg5wY0I383JCFAa2iA29Yrs59yUag
	kh62ts23v5eH/KgFCV+V9Al9xNwIfg18TBZf83GRye3h1DDVpmNN3I9I0pBRcljTVL6DPF9md3X
	8SB8qKNQ==
X-Google-Smtp-Source: AGHT+IFrUOxvTJ9AYf/YKS8fAGRSCkemugao7SAvxFhArk8O3Bfk9qqs7HkwmxNa2NacfsANFOZUEQ==
X-Received: by 2002:a05:6000:178e:b0:3d8:3eca:a978 with SMTP id ffacd0b85a97d-3e642e99b04mr5127314f8f.21.1757331451640;
        Mon, 08 Sep 2025 04:37:31 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab14esm476249525e9.21.2025.09.08.04.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 04:37:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
Date: Mon,  8 Sep 2025 13:37:19 +0200
Message-ID: <20250908113723.31559-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With further testing with an attached Aeonsemi it was discovered that
the pinctrl MDIO function applied the wrong bitmask. The error was
probably caused by the confusing documentation related to these bits.

Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
is never actually set but instead it's set force enable to the 2 GPIO
(gpio 1-2) for MDC and MDIO pin.

Applying this configuration permits correct functionality of any
externally attached PHY.

Cc: stable@vger.kernel.org
Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index f7f8fd2f35fc..d89da9581c55 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -108,6 +108,9 @@
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
 
+#define REG_FORCE_GPIO_EN			0x0228
+#define FORCE_GPIO_EN(n)			BIT(n)
+
 /* LED MAP */
 #define REG_LAN_LED0_MAPPING			0x027c
 #define REG_LAN_LED1_MAPPING			0x0280
@@ -718,17 +721,17 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 	{
 		.name = "mdio",
 		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_SGMII_MDIO_MODE_MASK,
-			GPIO_SGMII_MDIO_MODE_MASK
-		},
-		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
 			GPIO_MDC_IO_MASTER_MODE_MODE,
 			GPIO_MDC_IO_MASTER_MODE_MODE
 		},
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2),
+			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2)
+		},
 		.regmap_size = 2,
 	},
 };
-- 
2.51.0


