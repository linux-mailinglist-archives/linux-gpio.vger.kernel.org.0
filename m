Return-Path: <linux-gpio+bounces-38883-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v4xxHqYHPWpBwAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38883-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 12:49:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A50296C4D3C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 12:49:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G2ATD4H5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38883-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38883-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0558B3022890
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 10:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DCA389110;
	Thu, 25 Jun 2026 10:48:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D243876C9
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 10:48:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384497; cv=none; b=NvRwcPqiP6AydHalEFeFtBqBaSWGnWpKYn6LPBUjk0f4SN20qDlIgp4HAGQ4E4t1/F2h6VAuq2oU8I/DwV8aIxWXlh7ce2lUkXXFmtWNlCyEQG+6dUf4c3MmiU3xUREgEZ07sOW/JqdhgB2fiUf5TgG03Oqp+T1NExpiVgN0lV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384497; c=relaxed/simple;
	bh=KKl0pdjvJsqziABMU7UE3B0WY5JWH+q3vbfksCme2v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AruOvj2tTTtrfnT9Kq5LmnoKab+sGntUxCa+WIZmtOsRWZc9lrc1EWev05y4rHIuv4EP3KXwCDLzmKFZM7+o/S36pPCw6EH9ihGhduN2jht1H0zpy75tUx3QdkFQiW7WUnZvDmMauZI2JPdKkd10UMLRxdPIBPdnwUpXWWcRIc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2ATD4H5; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-462bb734793so1439327f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384489; x=1782989289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t97RRkulCfn6VzCimrK4xsZtwPYaVXkTSlv0a/AkVRc=;
        b=G2ATD4H5qXWXfVaBte2M77At0NyA+ZMOvsHi4aOofJnEuCLaHiZG/uZ6t31Y1egMXJ
         FlJzazqL0qu+ex/1yKJwSSmZe9oV4EiiY+N+jNXGE/0kZsZCpU0a5475B7tmVFnYy7dA
         B9Ij6LluUqIKWbGuJSJazlzBmbNHFvhv1JHgCaCMSawOd5ANWLFcJg/Z4XK1pOPrGazQ
         4gf97xTBWfLycN6iQMDKCDUq5ectwOMDaGmX98gO/qMUafI3jDpI7EqRyXMa298AYv60
         X+r46l5ySw/AMyQWFYbzQ6CcowZnH4axOM0j23M06C11nK6cn3sABjkHT9DCg0jNi1Sx
         NkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384489; x=1782989289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t97RRkulCfn6VzCimrK4xsZtwPYaVXkTSlv0a/AkVRc=;
        b=M9doyfWGl0yl8rKE/SXCuCUuFVpJf6ckihIp1juyf97kWmpaH9RyM+9XpJeaEjf7u+
         4ibL4yBg7TTm0+LpgBOxcXVuwj7svHPySAqfAGbWCmiTb7jrVJrANPmpvUg+/xN+UYbM
         ZwJqX5pjOo2FNSQGfrbEv92UYA9Xg4gsl1H6kg7cJmApK3paoolgjQ1ixrPVni6yTKGn
         HrdekJw4ObcKzoTkuBQD0CpvpakmPrv+87PsI5XDF0m48YIpFNn7wXWeYniiOEIuzVio
         jGXS9KTFF+9V3hp/0foXdSTSx4cpMULlzzw8PD3oKVh9VbDf0/AKyBYix7ooXp3bRyey
         MMag==
X-Forwarded-Encrypted: i=1; AHgh+RpQjIM833H2vQSs2x5uAt0ziZkqMWxy1P7+0Tevk+IaXVgjXpRded0SVeoSPoiexxjDzjNPdyLpe2yQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwzPjoLl8ho5XNNNdD4SZSj3GVkE50ow9RGS7k1i4TOiNdeOVez
	u3t4Lyhh7NaLt+bcqy8q8VmjsuAlaw4N8R7JyPWnn63MNcJZw5C3Vij2
X-Gm-Gg: AfdE7cmz5uo86HylkO6vl4dgVqRFZe0+qUQyo+o/lpSI3PiRlym5/wUEb1d8udXVhgp
	rAwiFd48kimHBbaYk32qRgt0CE2sBZEhqEJkEKV6WsxUfSmc+QQeWh6+pOx86tgnwhvbwUpcTEm
	65+zgLRLQR5xnPko9PIqE9k2fvssR2qBJPmxXRPpQBFv6w3DUT0HYHaojgf/FpfxOjw5Ej1fiyU
	r8IrIQVAkR8i459qOtuIUqciwzkG/k7/7O4esX5/CUEieReANHuKqyygMsmSnxhx6nioAGYgGUW
	6Gzrw4Ecw34Cvq4M7KKj5JPBNUhxbyk4qshRiFvg/YOqr9MmCI1yxTko6IA+7hKglqAhWEM8OK/
	DwQdNbm8OsxoYl4uEpjYuPtNX0FihLscyd+Iv5xTB17HmaVU8R4JN3hkhiINnxtybIs7BVHURoF
	Lp4sq+WCZB0tOjIrfr
X-Received: by 2002:a05:6000:41e9:b0:463:cbee:44a with SMTP id ffacd0b85a97d-46dc11e3188mr3142986f8f.33.1782384488470;
        Thu, 25 Jun 2026 03:48:08 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:48:07 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 2/3] pinctrl: mediatek: mt8516/mt8167: Migrate driver to pinctrl-paris platform
Date: Thu, 25 Jun 2026 12:46:31 +0200
Message-ID: <20260625104742.113803-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625104742.113803-1-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38883-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:sean.wang@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mediatek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A50296C4D3C

Migrate the mt8516/mt8167 pinctrl driver to the paris platform driver.
This change lets us correctly describe the two base addresses (GPIO/EINT)
used by the SoCs in their device tree. It also adds support for driving
strength capability and R1R0 pullup-pulldown on pins.

Since the driver for mt8167 pinctrl is identical to the mt8516 one except
for pin definitions there is no need for a separate driver, so drop it and
add a compatible to the other one.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/pinctrl/mediatek/Kconfig              |  11 +-
 drivers/pinctrl/mediatek/Makefile             |   1 -
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     | 345 --------
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     | 770 +++++++++++-------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h | 562 +++++++------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h | 512 ++++++------
 6 files changed, 1006 insertions(+), 1195 deletions(-)
 delete mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8167.c

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 97980cc28b9c..28edd53f12ed 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -214,13 +214,6 @@ config PINCTRL_MT7988
 	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_MOORE
 
-config PINCTRL_MT8167
-	bool "MediaTek MT8167 pin control"
-	depends on OF
-	depends on ARM64 || COMPILE_TEST
-	default ARM64 && ARCH_MEDIATEK
-	select PINCTRL_MTK
-
 config PINCTRL_MT8173
 	bool "MediaTek MT8173 pin control"
 	depends on OF
@@ -300,11 +293,11 @@ config PINCTRL_MT8365
 	select PINCTRL_MTK
 
 config PINCTRL_MT8516
-	bool "MediaTek MT8516 pin control"
+	bool "MediaTek MT8516/MT8167 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
-	select PINCTRL_MTK
+	select PINCTRL_MTK_PARIS
 
 # For PMIC
 config PINCTRL_MT6397
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index 6dc17b0c23f9..1533a93b14d3 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -30,7 +30,6 @@ obj-$(CONFIG_PINCTRL_MT7629)		+= pinctrl-mt7629.o
 obj-$(CONFIG_PINCTRL_MT7981)		+= pinctrl-mt7981.o
 obj-$(CONFIG_PINCTRL_MT7986)		+= pinctrl-mt7986.o
 obj-$(CONFIG_PINCTRL_MT7988)		+= pinctrl-mt7988.o
-obj-$(CONFIG_PINCTRL_MT8167)		+= pinctrl-mt8167.o
 obj-$(CONFIG_PINCTRL_MT8173)		+= pinctrl-mt8173.o
 obj-$(CONFIG_PINCTRL_MT8183)		+= pinctrl-mt8183.o
 obj-$(CONFIG_PINCTRL_MT8186)		+= pinctrl-mt8186.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
deleted file mode 100644
index c812d614e9d4..000000000000
--- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
+++ /dev/null
@@ -1,345 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2020 MediaTek Inc.
- * Author: Min.Guo <min.guo@mediatek.com>
- */
-
-#include <dt-bindings/pinctrl/mt65xx.h>
-#include <linux/of.h>
-#include <linux/module.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-
-#include "pinctrl-mtk-common.h"
-#include "pinctrl-mtk-mt8167.h"
-
-static const struct mtk_drv_group_desc mt8167_drv_grp[] = {
-	/* 0E4E8SR 4/8/12/16 */
-	MTK_DRV_GRP(4, 16, 1, 2, 4),
-	/* 0E2E4SR  2/4/6/8 */
-	MTK_DRV_GRP(2, 8, 1, 2, 2),
-	/* E8E4E2  2/4/6/8/10/12/14/16 */
-	MTK_DRV_GRP(2, 16, 0, 2, 2)
-};
-
-static const struct mtk_pin_drv_grp mt8167_pin_drv[] = {
-	MTK_PIN_DRV_GRP(0, 0xd00, 0, 0),
-	MTK_PIN_DRV_GRP(1, 0xd00, 0, 0),
-	MTK_PIN_DRV_GRP(2, 0xd00, 0, 0),
-	MTK_PIN_DRV_GRP(3, 0xd00, 0, 0),
-	MTK_PIN_DRV_GRP(4, 0xd00, 0, 0),
-
-	MTK_PIN_DRV_GRP(5, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(6, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(7, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(8, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(9, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(10, 0xd00, 4, 0),
-
-	MTK_PIN_DRV_GRP(11, 0xd00, 8, 0),
-	MTK_PIN_DRV_GRP(12, 0xd00, 8, 0),
-	MTK_PIN_DRV_GRP(13, 0xd00, 8, 0),
-
-	MTK_PIN_DRV_GRP(14, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(15, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(16, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(17, 0xd00, 12, 2),
-
-	MTK_PIN_DRV_GRP(18, 0xd10, 0, 0),
-	MTK_PIN_DRV_GRP(19, 0xd10, 0, 0),
-	MTK_PIN_DRV_GRP(20, 0xd10, 0, 0),
-
-	MTK_PIN_DRV_GRP(21, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(22, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(23, 0xd00, 12, 2),
-
-	MTK_PIN_DRV_GRP(24, 0xd00, 8, 0),
-	MTK_PIN_DRV_GRP(25, 0xd00, 8, 0),
-
-	MTK_PIN_DRV_GRP(26, 0xd10, 4, 1),
-	MTK_PIN_DRV_GRP(27, 0xd10, 4, 1),
-	MTK_PIN_DRV_GRP(28, 0xd10, 4, 1),
-	MTK_PIN_DRV_GRP(29, 0xd10, 4, 1),
-	MTK_PIN_DRV_GRP(30, 0xd10, 4, 1),
-
-	MTK_PIN_DRV_GRP(31, 0xd10, 8, 1),
-	MTK_PIN_DRV_GRP(32, 0xd10, 8, 1),
-	MTK_PIN_DRV_GRP(33, 0xd10, 8, 1),
-
-	MTK_PIN_DRV_GRP(34, 0xd10, 12, 0),
-	MTK_PIN_DRV_GRP(35, 0xd10, 12, 0),
-
-	MTK_PIN_DRV_GRP(36, 0xd20, 0, 0),
-	MTK_PIN_DRV_GRP(37, 0xd20, 0, 0),
-	MTK_PIN_DRV_GRP(38, 0xd20, 0, 0),
-	MTK_PIN_DRV_GRP(39, 0xd20, 0, 0),
-
-	MTK_PIN_DRV_GRP(40, 0xd20, 4, 1),
-
-	MTK_PIN_DRV_GRP(41, 0xd20, 8, 1),
-	MTK_PIN_DRV_GRP(42, 0xd20, 8, 1),
-	MTK_PIN_DRV_GRP(43, 0xd20, 8, 1),
-
-	MTK_PIN_DRV_GRP(44, 0xd20, 12, 1),
-	MTK_PIN_DRV_GRP(45, 0xd20, 12, 1),
-	MTK_PIN_DRV_GRP(46, 0xd20, 12, 1),
-	MTK_PIN_DRV_GRP(47, 0xd20, 12, 1),
-
-	MTK_PIN_DRV_GRP(48, 0xd30, 0, 1),
-	MTK_PIN_DRV_GRP(49, 0xd30, 0, 1),
-	MTK_PIN_DRV_GRP(50, 0xd30, 0, 1),
-	MTK_PIN_DRV_GRP(51, 0xd30, 0, 1),
-
-	MTK_PIN_DRV_GRP(54, 0xd30, 8, 1),
-
-	MTK_PIN_DRV_GRP(55, 0xd30, 12, 1),
-	MTK_PIN_DRV_GRP(56, 0xd30, 12, 1),
-	MTK_PIN_DRV_GRP(57, 0xd30, 12, 1),
-
-	MTK_PIN_DRV_GRP(62, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(63, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(64, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(65, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(66, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(67, 0xd40, 8, 1),
-
-	MTK_PIN_DRV_GRP(68, 0xd40, 12, 2),
-
-	MTK_PIN_DRV_GRP(69, 0xd50, 0, 2),
-
-	MTK_PIN_DRV_GRP(70, 0xd50, 4, 2),
-	MTK_PIN_DRV_GRP(71, 0xd50, 4, 2),
-	MTK_PIN_DRV_GRP(72, 0xd50, 4, 2),
-	MTK_PIN_DRV_GRP(73, 0xd50, 4, 2),
-
-	MTK_PIN_DRV_GRP(100, 0xd50, 8, 1),
-	MTK_PIN_DRV_GRP(101, 0xd50, 8, 1),
-	MTK_PIN_DRV_GRP(102, 0xd50, 8, 1),
-	MTK_PIN_DRV_GRP(103, 0xd50, 8, 1),
-
-	MTK_PIN_DRV_GRP(104, 0xd50, 12, 2),
-
-	MTK_PIN_DRV_GRP(105, 0xd60, 0, 2),
-
-	MTK_PIN_DRV_GRP(106, 0xd60, 4, 2),
-	MTK_PIN_DRV_GRP(107, 0xd60, 4, 2),
-	MTK_PIN_DRV_GRP(108, 0xd60, 4, 2),
-	MTK_PIN_DRV_GRP(109, 0xd60, 4, 2),
-
-	MTK_PIN_DRV_GRP(110, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(111, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(112, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(113, 0xd70, 0, 2),
-
-	MTK_PIN_DRV_GRP(114, 0xd70, 4, 2),
-
-	MTK_PIN_DRV_GRP(115, 0xd60, 12, 2),
-
-	MTK_PIN_DRV_GRP(116, 0xd60, 8, 2),
-
-	MTK_PIN_DRV_GRP(117, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(118, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(119, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(120, 0xd70, 0, 2),
-};
-
-static const struct mtk_pin_spec_pupd_set_samereg mt8167_spec_pupd[] = {
-	MTK_PIN_PUPD_SPEC_SR(14, 0xe50, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(15, 0xe60, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(16, 0xe60, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(17, 0xe60, 10, 9, 8),
-
-	MTK_PIN_PUPD_SPEC_SR(21, 0xe60, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(22, 0xe70, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(23, 0xe70, 6, 5, 4),
-
-	MTK_PIN_PUPD_SPEC_SR(40, 0xe80, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(41, 0xe80, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(42, 0xe90, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(43, 0xe90, 6, 5, 4),
-
-	MTK_PIN_PUPD_SPEC_SR(68, 0xe50, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(69, 0xe50, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(70, 0xe40, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(71, 0xe40, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(72, 0xe40, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(73, 0xe50, 2, 1, 0),
-
-	MTK_PIN_PUPD_SPEC_SR(104, 0xe40, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(105, 0xe30, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(106, 0xe20, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(107, 0xe30, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(108, 0xe30, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(109, 0xe30, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(110, 0xe10, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(111, 0xe10, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(112, 0xe10, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(113, 0xe10, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(114, 0xe20, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(115, 0xe20, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(116, 0xe20, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(117, 0xe00, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(118, 0xe00, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(119, 0xe00, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(120, 0xe00, 2, 1, 0),
-};
-
-static const struct mtk_pin_ies_smt_set mt8167_ies_set[] = {
-	MTK_PIN_IES_SMT_SPEC(0, 6, 0x900, 2),
-	MTK_PIN_IES_SMT_SPEC(7, 10, 0x900, 3),
-	MTK_PIN_IES_SMT_SPEC(11, 13, 0x900, 12),
-	MTK_PIN_IES_SMT_SPEC(14, 17, 0x900, 13),
-	MTK_PIN_IES_SMT_SPEC(18, 20, 0x910, 10),
-	MTK_PIN_IES_SMT_SPEC(21, 23, 0x900, 13),
-	MTK_PIN_IES_SMT_SPEC(24, 25, 0x900, 12),
-	MTK_PIN_IES_SMT_SPEC(26, 30, 0x900, 0),
-	MTK_PIN_IES_SMT_SPEC(31, 33, 0x900, 1),
-	MTK_PIN_IES_SMT_SPEC(34, 39, 0x900, 2),
-	MTK_PIN_IES_SMT_SPEC(40, 40, 0x910, 11),
-	MTK_PIN_IES_SMT_SPEC(41, 43, 0x900, 10),
-	MTK_PIN_IES_SMT_SPEC(44, 47, 0x900, 11),
-	MTK_PIN_IES_SMT_SPEC(48, 51, 0x900, 14),
-	MTK_PIN_IES_SMT_SPEC(52, 53, 0x910, 0),
-	MTK_PIN_IES_SMT_SPEC(54, 54, 0x910, 2),
-	MTK_PIN_IES_SMT_SPEC(55, 57, 0x910, 4),
-	MTK_PIN_IES_SMT_SPEC(58, 59, 0x900, 15),
-	MTK_PIN_IES_SMT_SPEC(60, 61, 0x910, 1),
-	MTK_PIN_IES_SMT_SPEC(62, 65, 0x910, 5),
-	MTK_PIN_IES_SMT_SPEC(66, 67, 0x910, 6),
-	MTK_PIN_IES_SMT_SPEC(68, 68, 0x930, 2),
-	MTK_PIN_IES_SMT_SPEC(69, 69, 0x930, 1),
-	MTK_PIN_IES_SMT_SPEC(70, 70, 0x930, 6),
-	MTK_PIN_IES_SMT_SPEC(71, 71, 0x930, 5),
-	MTK_PIN_IES_SMT_SPEC(72, 72, 0x930, 4),
-	MTK_PIN_IES_SMT_SPEC(73, 73, 0x930, 3),
-	MTK_PIN_IES_SMT_SPEC(100, 103, 0x910, 7),
-	MTK_PIN_IES_SMT_SPEC(104, 104, 0x920, 12),
-	MTK_PIN_IES_SMT_SPEC(105, 105, 0x920, 11),
-	MTK_PIN_IES_SMT_SPEC(106, 106, 0x930, 0),
-	MTK_PIN_IES_SMT_SPEC(107, 107, 0x920, 15),
-	MTK_PIN_IES_SMT_SPEC(108, 108, 0x920, 14),
-	MTK_PIN_IES_SMT_SPEC(109, 109, 0x920, 13),
-	MTK_PIN_IES_SMT_SPEC(110, 110, 0x920, 9),
-	MTK_PIN_IES_SMT_SPEC(111, 111, 0x920, 8),
-	MTK_PIN_IES_SMT_SPEC(112, 112, 0x920, 7),
-	MTK_PIN_IES_SMT_SPEC(113, 113, 0x920, 6),
-	MTK_PIN_IES_SMT_SPEC(114, 114, 0x920, 10),
-	MTK_PIN_IES_SMT_SPEC(115, 115, 0x920, 1),
-	MTK_PIN_IES_SMT_SPEC(116, 116, 0x920, 0),
-	MTK_PIN_IES_SMT_SPEC(117, 117, 0x920, 5),
-	MTK_PIN_IES_SMT_SPEC(118, 118, 0x920, 4),
-	MTK_PIN_IES_SMT_SPEC(119, 119, 0x920, 3),
-	MTK_PIN_IES_SMT_SPEC(120, 120, 0x920, 2),
-	MTK_PIN_IES_SMT_SPEC(121, 124, 0x910, 9),
-};
-
-static const struct mtk_pin_ies_smt_set mt8167_smt_set[] = {
-	MTK_PIN_IES_SMT_SPEC(0, 6, 0xA00, 2),
-	MTK_PIN_IES_SMT_SPEC(7, 10, 0xA00, 3),
-	MTK_PIN_IES_SMT_SPEC(11, 13, 0xA00, 12),
-	MTK_PIN_IES_SMT_SPEC(14, 17, 0xA00, 13),
-	MTK_PIN_IES_SMT_SPEC(18, 20, 0xA10, 10),
-	MTK_PIN_IES_SMT_SPEC(21, 23, 0xA00, 13),
-	MTK_PIN_IES_SMT_SPEC(24, 25, 0xA00, 12),
-	MTK_PIN_IES_SMT_SPEC(26, 30, 0xA00, 0),
-	MTK_PIN_IES_SMT_SPEC(31, 33, 0xA00, 1),
-	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA00, 2),
-	MTK_PIN_IES_SMT_SPEC(40, 40, 0xA10, 11),
-	MTK_PIN_IES_SMT_SPEC(41, 43, 0xA00, 10),
-	MTK_PIN_IES_SMT_SPEC(44, 47, 0xA00, 11),
-	MTK_PIN_IES_SMT_SPEC(48, 51, 0xA00, 14),
-	MTK_PIN_IES_SMT_SPEC(52, 53, 0xA10, 0),
-	MTK_PIN_IES_SMT_SPEC(54, 54, 0xA10, 2),
-	MTK_PIN_IES_SMT_SPEC(55, 57, 0xA10, 4),
-	MTK_PIN_IES_SMT_SPEC(58, 59, 0xA00, 15),
-	MTK_PIN_IES_SMT_SPEC(60, 61, 0xA10, 1),
-	MTK_PIN_IES_SMT_SPEC(62, 65, 0xA10, 5),
-	MTK_PIN_IES_SMT_SPEC(66, 67, 0xA10, 6),
-	MTK_PIN_IES_SMT_SPEC(68, 68, 0xA30, 2),
-	MTK_PIN_IES_SMT_SPEC(69, 69, 0xA30, 1),
-	MTK_PIN_IES_SMT_SPEC(70, 70, 0xA30, 3),
-	MTK_PIN_IES_SMT_SPEC(71, 71, 0xA30, 4),
-	MTK_PIN_IES_SMT_SPEC(72, 72, 0xA30, 5),
-	MTK_PIN_IES_SMT_SPEC(73, 73, 0xA30, 6),
-
-	MTK_PIN_IES_SMT_SPEC(100, 103, 0xA10, 7),
-	MTK_PIN_IES_SMT_SPEC(104, 104, 0xA20, 12),
-	MTK_PIN_IES_SMT_SPEC(105, 105, 0xA20, 11),
-	MTK_PIN_IES_SMT_SPEC(106, 106, 0xA30, 13),
-	MTK_PIN_IES_SMT_SPEC(107, 107, 0xA20, 14),
-	MTK_PIN_IES_SMT_SPEC(108, 108, 0xA20, 15),
-	MTK_PIN_IES_SMT_SPEC(109, 109, 0xA30, 0),
-	MTK_PIN_IES_SMT_SPEC(110, 110, 0xA20, 9),
-	MTK_PIN_IES_SMT_SPEC(111, 111, 0xA20, 8),
-	MTK_PIN_IES_SMT_SPEC(112, 112, 0xA20, 7),
-	MTK_PIN_IES_SMT_SPEC(113, 113, 0xA20, 6),
-	MTK_PIN_IES_SMT_SPEC(114, 114, 0xA20, 10),
-	MTK_PIN_IES_SMT_SPEC(115, 115, 0xA20, 1),
-	MTK_PIN_IES_SMT_SPEC(116, 116, 0xA20, 0),
-	MTK_PIN_IES_SMT_SPEC(117, 117, 0xA20, 5),
-	MTK_PIN_IES_SMT_SPEC(118, 118, 0xA20, 4),
-	MTK_PIN_IES_SMT_SPEC(119, 119, 0xA20, 3),
-	MTK_PIN_IES_SMT_SPEC(120, 120, 0xA20, 2),
-	MTK_PIN_IES_SMT_SPEC(121, 124, 0xA10, 9),
-};
-
-static const struct mtk_pinctrl_devdata mt8167_pinctrl_data = {
-	.pins = mtk_pins_mt8167,
-	.npins = ARRAY_SIZE(mtk_pins_mt8167),
-	.grp_desc = mt8167_drv_grp,
-	.n_grp_cls = ARRAY_SIZE(mt8167_drv_grp),
-	.pin_drv_grp = mt8167_pin_drv,
-	.n_pin_drv_grps = ARRAY_SIZE(mt8167_pin_drv),
-	.spec_ies = mt8167_ies_set,
-	.n_spec_ies = ARRAY_SIZE(mt8167_ies_set),
-	.spec_pupd = mt8167_spec_pupd,
-	.n_spec_pupd = ARRAY_SIZE(mt8167_spec_pupd),
-	.spec_smt = mt8167_smt_set,
-	.n_spec_smt = ARRAY_SIZE(mt8167_smt_set),
-	.spec_pull_set = mtk_pctrl_spec_pull_set_samereg,
-	.spec_ies_smt_set = mtk_pconf_spec_set_ies_smt_range,
-	.dir_offset = 0x0000,
-	.pullen_offset = 0x0500,
-	.pullsel_offset = 0x0600,
-	.dout_offset = 0x0100,
-	.din_offset = 0x0200,
-	.pinmux_offset = 0x0300,
-	.type1_start = 125,
-	.type1_end = 125,
-	.port_shf = 4,
-	.port_mask = 0xf,
-	.port_align = 4,
-	.mode_mask = 0xf,
-	.mode_per_reg = 5,
-	.mode_shf = 4,
-	.eint_hw = {
-		.port_mask = 7,
-		.ports     = 6,
-		.ap_num    = 169,
-		.db_cnt    = 64,
-		.db_time = debounce_time_mt6795,
-	},
-};
-
-static const struct of_device_id mt8167_pctrl_match[] = {
-	{ .compatible = "mediatek,mt8167-pinctrl", .data = &mt8167_pinctrl_data },
-	{}
-};
-
-MODULE_DEVICE_TABLE(of, mt8167_pctrl_match);
-
-static struct platform_driver mtk_pinctrl_driver = {
-	.probe = mtk_pctrl_common_probe,
-	.driver = {
-		.name = "mediatek-mt8167-pinctrl",
-		.of_match_table = mt8167_pctrl_match,
-		.pm = pm_sleep_ptr(&mtk_eint_pm_ops),
-	},
-};
-
-static int __init mtk_pinctrl_init(void)
-{
-	return platform_driver_register(&mtk_pinctrl_driver);
-}
-arch_initcall(mtk_pinctrl_init);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
index 68d6638e7f4b..e00b5633bc67 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
@@ -1,345 +1,517 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2019 MediaTek Inc.
  * Author: Min.Guo <min.guo@mediatek.com>
+ * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
  */
 
-#include <dt-bindings/pinctrl/mt65xx.h>
-#include <linux/of.h>
-#include <linux/module.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-
-#include "pinctrl-mtk-common.h"
+#include "pinctrl-mtk-mt8167.h"
 #include "pinctrl-mtk-mt8516.h"
+#include "pinctrl-paris.h"
 
-static const struct mtk_drv_group_desc mt8516_drv_grp[] = {
-	/* 0E4E8SR 4/8/12/16 */
-	MTK_DRV_GRP(4, 16, 1, 2, 4),
-	/* 0E2E4SR  2/4/6/8 */
-	MTK_DRV_GRP(2, 8, 1, 2, 2),
-	/* E8E4E2  2/4/6/8/10/12/14/16 */
-	MTK_DRV_GRP(2, 16, 0, 2, 2)
-};
-
-static const struct mtk_pin_drv_grp mt8516_pin_drv[] = {
-	MTK_PIN_DRV_GRP(0, 0xd00, 0, 0),
-	MTK_PIN_DRV_GRP(1, 0xd00, 0, 0),
-	MTK_PIN_DRV_GRP(2, 0xd00, 0, 0),
-	MTK_PIN_DRV_GRP(3, 0xd00, 0, 0),
-	MTK_PIN_DRV_GRP(4, 0xd00, 0, 0),
-
-	MTK_PIN_DRV_GRP(5, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(6, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(7, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(8, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(9, 0xd00, 4, 0),
-	MTK_PIN_DRV_GRP(10, 0xd00, 4, 0),
-
-	MTK_PIN_DRV_GRP(11, 0xd00, 8, 0),
-	MTK_PIN_DRV_GRP(12, 0xd00, 8, 0),
-	MTK_PIN_DRV_GRP(13, 0xd00, 8, 0),
-
-	MTK_PIN_DRV_GRP(14, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(15, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(16, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(17, 0xd00, 12, 2),
-
-	MTK_PIN_DRV_GRP(18, 0xd10, 0, 0),
-	MTK_PIN_DRV_GRP(19, 0xd10, 0, 0),
-	MTK_PIN_DRV_GRP(20, 0xd10, 0, 0),
-
-	MTK_PIN_DRV_GRP(21, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(22, 0xd00, 12, 2),
-	MTK_PIN_DRV_GRP(23, 0xd00, 12, 2),
-
-	MTK_PIN_DRV_GRP(24, 0xd00, 8, 0),
-	MTK_PIN_DRV_GRP(25, 0xd00, 8, 0),
+#define PIN_FIELD15(_s_pin, _e_pin, _s_addr, _x_addrs, _s_bit, _x_bits)	\
+	PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs, _s_bit,	\
+		       _x_bits, 15, 0)
 
-	MTK_PIN_DRV_GRP(26, 0xd10, 4, 1),
-	MTK_PIN_DRV_GRP(27, 0xd10, 4, 1),
-	MTK_PIN_DRV_GRP(28, 0xd10, 4, 1),
-	MTK_PIN_DRV_GRP(29, 0xd10, 4, 1),
-	MTK_PIN_DRV_GRP(30, 0xd10, 4, 1),
+#define PIN_FIELD16(_s_pin, _e_pin, _s_addr, _x_addrs, _s_bit, _x_bits)	\
+	PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs, _s_bit,	\
+		       _x_bits, 16, 0)
 
-	MTK_PIN_DRV_GRP(31, 0xd10, 8, 1),
-	MTK_PIN_DRV_GRP(32, 0xd10, 8, 1),
-	MTK_PIN_DRV_GRP(33, 0xd10, 8, 1),
+#define PINS_FIELD16(_s_pin, _e_pin, _s_addr, _x_addrs, _s_bit, _x_bits)\
+	PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs, _s_bit,	\
+		       _x_bits, 16, 1)
 
-	MTK_PIN_DRV_GRP(34, 0xd10, 12, 0),
-	MTK_PIN_DRV_GRP(35, 0xd10, 12, 0),
-
-	MTK_PIN_DRV_GRP(36, 0xd20, 0, 0),
-	MTK_PIN_DRV_GRP(37, 0xd20, 0, 0),
-	MTK_PIN_DRV_GRP(38, 0xd20, 0, 0),
-	MTK_PIN_DRV_GRP(39, 0xd20, 0, 0),
-
-	MTK_PIN_DRV_GRP(40, 0xd20, 4, 1),
-
-	MTK_PIN_DRV_GRP(41, 0xd20, 8, 1),
-	MTK_PIN_DRV_GRP(42, 0xd20, 8, 1),
-	MTK_PIN_DRV_GRP(43, 0xd20, 8, 1),
-
-	MTK_PIN_DRV_GRP(44, 0xd20, 12, 1),
-	MTK_PIN_DRV_GRP(45, 0xd20, 12, 1),
-	MTK_PIN_DRV_GRP(46, 0xd20, 12, 1),
-	MTK_PIN_DRV_GRP(47, 0xd20, 12, 1),
-
-	MTK_PIN_DRV_GRP(48, 0xd30, 0, 1),
-	MTK_PIN_DRV_GRP(49, 0xd30, 0, 1),
-	MTK_PIN_DRV_GRP(50, 0xd30, 0, 1),
-	MTK_PIN_DRV_GRP(51, 0xd30, 0, 1),
-
-	MTK_PIN_DRV_GRP(54, 0xd30, 8, 1),
-
-	MTK_PIN_DRV_GRP(55, 0xd30, 12, 1),
-	MTK_PIN_DRV_GRP(56, 0xd30, 12, 1),
-	MTK_PIN_DRV_GRP(57, 0xd30, 12, 1),
+static const struct mtk_pin_field_calc mt8516_pin_dir_range[] = {
+	PIN_FIELD16(0, 124, 0x000, 0x10, 0, 1),
+};
 
-	MTK_PIN_DRV_GRP(62, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(63, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(64, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(65, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(66, 0xd40, 8, 1),
-	MTK_PIN_DRV_GRP(67, 0xd40, 8, 1),
+static const struct mtk_pin_field_calc mt8516_pin_do_range[] = {
+	PIN_FIELD16(0, 124, 0x100, 0x10, 0, 1),
+};
 
-	MTK_PIN_DRV_GRP(68, 0xd40, 12, 2),
+static const struct mtk_pin_field_calc mt8516_pin_di_range[] = {
+	PIN_FIELD16(0, 124, 0x200, 0x10, 0, 1),
+};
 
-	MTK_PIN_DRV_GRP(69, 0xd50, 0, 2),
+static const struct mtk_pin_field_calc mt8516_pin_mode_range[] = {
+	PIN_FIELD15(0, 124, 0x300, 0x10, 0, 3),
+};
 
-	MTK_PIN_DRV_GRP(70, 0xd50, 4, 2),
-	MTK_PIN_DRV_GRP(71, 0xd50, 4, 2),
-	MTK_PIN_DRV_GRP(72, 0xd50, 4, 2),
-	MTK_PIN_DRV_GRP(73, 0xd50, 4, 2),
+static const struct mtk_pin_field_calc mt8516_pin_pullen_range[] = {
+	PIN_FIELD16(0, 124, 0x500, 0x10, 0, 1),
+};
 
-	MTK_PIN_DRV_GRP(100, 0xd50, 8, 1),
-	MTK_PIN_DRV_GRP(101, 0xd50, 8, 1),
-	MTK_PIN_DRV_GRP(102, 0xd50, 8, 1),
-	MTK_PIN_DRV_GRP(103, 0xd50, 8, 1),
+static const struct mtk_pin_field_calc mt8516_pin_pullsel_range[] = {
+	PIN_FIELD16(0, 124, 0x600, 0x10, 0, 1),
+};
 
-	MTK_PIN_DRV_GRP(104, 0xd50, 12, 2),
+static const struct mtk_pin_field_calc mt8516_pin_ies_range[] = {
+	PINS_FIELD16(0, 6, 0x900, 0x10, 2, 1),
+	PINS_FIELD16(7, 10, 0x900, 0x10, 3, 1),
+	PINS_FIELD16(11, 13, 0x900, 0x10, 12, 1),
+	PINS_FIELD16(14, 17, 0x900, 0x10, 13, 1),
+	PINS_FIELD16(18, 20, 0x910, 0x10, 10, 1),
+	PINS_FIELD16(21, 23, 0x900, 0x10, 13, 1),
+	PINS_FIELD16(24, 25, 0x900, 0x10, 12, 1),
+	PINS_FIELD16(26, 30, 0x900, 0x10, 0, 1),
+	PINS_FIELD16(31, 33, 0x900, 0x10, 1, 1),
+	PINS_FIELD16(34, 39, 0x900, 0x10, 2, 1),
+	PIN_FIELD16(40, 40, 0x910, 0x10, 11, 1),
+	PINS_FIELD16(41, 43, 0x900, 0x10, 10, 1),
+	PINS_FIELD16(44, 47, 0x900, 0x10, 11, 1),
+	PINS_FIELD16(48, 51, 0x900, 0x10, 14, 1),
+	PINS_FIELD16(52, 53, 0x910, 0x10, 0, 1),
+	PIN_FIELD16(54, 54, 0x910, 0x10, 2, 1),
+	PINS_FIELD16(55, 57, 0x910, 0x10, 4, 1),
+	PINS_FIELD16(58, 59, 0x900, 0x10, 15, 1),
+	PINS_FIELD16(60, 61, 0x910, 0x10, 1, 1),
+	PINS_FIELD16(62, 65, 0x910, 0x10, 5, 1),
+	PINS_FIELD16(66, 67, 0x910, 0x10, 6, 1),
+	PIN_FIELD16(68, 68, 0x930, 0x10, 2, 1),
+	PIN_FIELD16(69, 69, 0x930, 0x10, 1, 1),
+	PIN_FIELD16(70, 70, 0x930, 0x10, 6, 1),
+	PIN_FIELD16(71, 71, 0x930, 0x10, 5, 1),
+	PIN_FIELD16(72, 72, 0x930, 0x10, 4, 1),
+	PIN_FIELD16(73, 73, 0x930, 0x10, 3, 1),
+	PINS_FIELD16(100, 103, 0x910, 0x10, 7, 1),
+	PIN_FIELD16(104, 104, 0x920, 0x10, 12, 1),
+	PIN_FIELD16(105, 105, 0x920, 0x10, 11, 1),
+	PIN_FIELD16(106, 106, 0x930, 0x10, 0, 1),
+	PIN_FIELD16(107, 107, 0x920, 0x10, 15, 1),
+	PIN_FIELD16(108, 108, 0x920, 0x10, 14, 1),
+	PIN_FIELD16(109, 109, 0x920, 0x10, 13, 1),
+	PIN_FIELD16(110, 110, 0x920, 0x10, 9, 1),
+	PIN_FIELD16(111, 111, 0x920, 0x10, 8, 1),
+	PIN_FIELD16(112, 112, 0x920, 0x10, 7, 1),
+	PIN_FIELD16(113, 113, 0x920, 0x10, 6, 1),
+	PIN_FIELD16(114, 114, 0x920, 0x10, 10, 1),
+	PIN_FIELD16(115, 115, 0x920, 0x10, 1, 1),
+	PIN_FIELD16(116, 116, 0x920, 0x10, 0, 1),
+	PIN_FIELD16(117, 117, 0x920, 0x10, 5, 1),
+	PIN_FIELD16(118, 118, 0x920, 0x10, 4, 1),
+	PIN_FIELD16(119, 119, 0x920, 0x10, 3, 1),
+	PIN_FIELD16(120, 120, 0x920, 0x10, 2, 1),
+	PINS_FIELD16(121, 124, 0x910, 0x10, 9, 1),
+};
 
-	MTK_PIN_DRV_GRP(105, 0xd60, 0, 2),
+static const struct mtk_pin_field_calc mt8516_pin_smt_range[] = {
+	PINS_FIELD16(0, 6, 0xa00, 0x10, 2, 1),
+	PINS_FIELD16(7, 10, 0xa00, 0x10, 3, 1),
+	PINS_FIELD16(11, 13, 0xa00, 0x10, 12, 1),
+	PINS_FIELD16(14, 17, 0xa00, 0x10, 13, 1),
+	PINS_FIELD16(18, 20, 0xa10, 0x10, 10, 1),
+	PINS_FIELD16(21, 23, 0xa00, 0x10, 13, 1),
+	PINS_FIELD16(24, 25, 0xa00, 0x10, 12, 1),
+	PINS_FIELD16(26, 30, 0xa00, 0x10, 0, 1),
+	PINS_FIELD16(31, 33, 0xa00, 0x10, 1, 1),
+	PINS_FIELD16(34, 39, 0xa00, 0x10, 2, 1),
+	PIN_FIELD16(40, 40, 0xa10, 0x10, 11, 1),
+	PINS_FIELD16(41, 43, 0xa00, 0x10, 10, 1),
+	PINS_FIELD16(44, 47, 0xa00, 0x10, 11, 1),
+	PINS_FIELD16(48, 51, 0xa00, 0x10, 14, 1),
+	PINS_FIELD16(52, 53, 0xa10, 0x10, 0, 1),
+	PIN_FIELD16(54, 54, 0xa10, 0x10, 2, 1),
+	PINS_FIELD16(55, 57, 0xa10, 0x10, 4, 1),
+	PINS_FIELD16(58, 59, 0xa00, 0x10, 15, 1),
+	PINS_FIELD16(60, 61, 0xa10, 0x10, 1, 1),
+	PINS_FIELD16(62, 65, 0xa10, 0x10, 5, 1),
+	PINS_FIELD16(66, 67, 0xa10, 0x10, 6, 1),
+	PIN_FIELD16(68, 68, 0xa30, 0x10, 2, 1),
+	PIN_FIELD16(69, 69, 0xa30, 0x10, 1, 1),
+	PIN_FIELD16(70, 70, 0xa30, 0x10, 3, 1),
+	PIN_FIELD16(71, 71, 0xa30, 0x10, 4, 1),
+	PIN_FIELD16(72, 72, 0xa30, 0x10, 5, 1),
+	PIN_FIELD16(73, 73, 0xa30, 0x10, 6, 1),
+	PINS_FIELD16(100, 103, 0xa10, 0x10, 7, 1),
+	PIN_FIELD16(104, 104, 0xa20, 0x10, 12, 1),
+	PIN_FIELD16(105, 105, 0xa20, 0x10, 11, 1),
+	PIN_FIELD16(106, 106, 0xa20, 0x10, 13, 1),
+	PIN_FIELD16(107, 107, 0xa20, 0x10, 14, 1),
+	PIN_FIELD16(108, 108, 0xa20, 0x10, 15, 1),
+	PIN_FIELD16(109, 109, 0xa30, 0x10, 0, 1),
+	PIN_FIELD16(110, 110, 0xa20, 0x10, 9, 1),
+	PIN_FIELD16(111, 111, 0xa20, 0x10, 8, 1),
+	PIN_FIELD16(112, 112, 0xa20, 0x10, 7, 1),
+	PIN_FIELD16(113, 113, 0xa20, 0x10, 6, 1),
+	PIN_FIELD16(114, 114, 0xa20, 0x10, 10, 1),
+	PIN_FIELD16(115, 115, 0xa20, 0x10, 1, 1),
+	PIN_FIELD16(116, 116, 0xa20, 0x10, 0, 1),
+	PIN_FIELD16(117, 117, 0xa20, 0x10, 5, 1),
+	PIN_FIELD16(118, 118, 0xa20, 0x10, 4, 1),
+	PIN_FIELD16(119, 119, 0xa20, 0x10, 3, 1),
+	PIN_FIELD16(120, 120, 0xa20, 0x10, 2, 1),
+	PINS_FIELD16(121, 124, 0xa10, 0x10, 9, 1),
+};
 
-	MTK_PIN_DRV_GRP(106, 0xd60, 4, 2),
-	MTK_PIN_DRV_GRP(107, 0xd60, 4, 2),
-	MTK_PIN_DRV_GRP(108, 0xd60, 4, 2),
-	MTK_PIN_DRV_GRP(109, 0xd60, 4, 2),
+static const struct mtk_pin_field_calc mt8516_pin_pupd_range[] = {
+	/* EINT */
+	PIN_FIELD16(14, 14, 0xe50, 0x10, 14, 1),	/* EINT14 */
+	PIN_FIELD16(15, 15, 0xe60, 0x10, 2, 1),		/* EINT15 */
+	PIN_FIELD16(16, 16, 0xe60, 0x10, 6, 1),		/* EINT16 */
+	PIN_FIELD16(17, 17, 0xe60, 0x10, 10, 1),	/* EINT17 */
+	PIN_FIELD16(21, 21, 0xe60, 0x10, 14, 1),	/* EINT21 */
+	PIN_FIELD16(22, 22, 0xe70, 0x10, 2, 1),		/* EINT22 */
+	PIN_FIELD16(23, 23, 0xe70, 0x10, 6, 1),		/* EINT23 */
+
+	/* KPROW */
+	PIN_FIELD16(40, 40, 0xe80, 0x10, 2, 1),		/* KPROW0 */
+	PIN_FIELD16(41, 41, 0xe80, 0x10, 6, 1),		/* KPROW1 */
+
+	PIN_FIELD16(42, 42, 0xe90, 0x10, 2, 1),		/* KPCOL0 */
+	PIN_FIELD16(43, 43, 0xe90, 0x10, 6, 1),		/* KPCOL1 */
+
+	/* MSDC2 */
+	PIN_FIELD16(68, 68, 0xe50, 0x10, 10, 1),	/* MSDC2_CMD */
+	PIN_FIELD16(69, 69, 0xe50, 0x10, 6, 1),		/* MSDC2_CLK */
+	PIN_FIELD16(70, 70, 0xe40, 0x10, 6, 1),		/* MSDC2_DAT0 */
+	PIN_FIELD16(71, 71, 0xe40, 0x10, 10, 1),	/* MSDC2_DAT1 */
+	PIN_FIELD16(72, 72, 0xe40, 0x10, 14, 1),	/* MSDC2_DAT2 */
+	PIN_FIELD16(73, 73, 0xe50, 0x10, 2, 1),		/* MSDC2_DAT3 */
+
+	/* MSDC1 */
+	PIN_FIELD16(104, 104, 0xe40, 0x10, 2, 1),	/* MSDC1_CMD */
+	PIN_FIELD16(105, 105, 0xe30, 0x10, 14, 1),	/* MSDC1_CLK */
+	PIN_FIELD16(106, 106, 0xe20, 0x10, 14, 1),	/* MSDC1_DAT0 */
+	PIN_FIELD16(107, 107, 0xe30, 0x10, 2, 1),	/* MSDC1_DAT1 */
+	PIN_FIELD16(108, 108, 0xe30, 0x10, 6, 1),	/* MSDC1_DAT2 */
+	PIN_FIELD16(109, 109, 0xe30, 0x10, 10, 1),	/* MSDC1_DAT3 */
+
+	/* MSDC0 */
+	PIN_FIELD16(110, 110, 0xe10, 0x10, 14, 1),	/* MSDC0_DAT7 */
+	PIN_FIELD16(111, 111, 0xe10, 0x10, 10, 1),	/* MSDC0_DAT6 */
+	PIN_FIELD16(112, 112, 0xe10, 0x10, 6, 1),	/* MSDC0_DAT5 */
+	PIN_FIELD16(113, 113, 0xe10, 0x10, 2, 1),	/* MSDC0_DAT4 */
+	PIN_FIELD16(114, 114, 0xe20, 0x10, 10, 1),	/* MSDC0_RSTB */
+	PIN_FIELD16(115, 115, 0xe20, 0x10, 2, 1),	/* MSDC0_CMD */
+	PIN_FIELD16(116, 116, 0xe20, 0x10, 6, 1),	/* MSDC0_CLK */
+	PIN_FIELD16(117, 117, 0xe00, 0x10, 14, 1),	/* MSDC0_DAT3 */
+	PIN_FIELD16(118, 118, 0xe00, 0x10, 10, 1),	/* MSDC0_DAT2 */
+	PIN_FIELD16(119, 119, 0xe00, 0x10, 6, 1),	/* MSDC0_DAT1 */
+	PIN_FIELD16(120, 120, 0xe00, 0x10, 2, 1),	/* MSDC0_DAT0 */
+};
 
-	MTK_PIN_DRV_GRP(110, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(111, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(112, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(113, 0xd70, 0, 2),
+static const struct mtk_pin_field_calc mt8516_pin_r0_range[] = {
+	/* EINT */
+	PIN_FIELD16(14, 14, 0xe50, 0x10, 12, 1),	/* EINT14 */
+	PIN_FIELD16(15, 15, 0xe60, 0x10, 0, 1),		/* EINT15 */
+	PIN_FIELD16(16, 16, 0xe60, 0x10, 4, 1),		/* EINT16 */
+	PIN_FIELD16(17, 17, 0xe60, 0x10, 8, 1),		/* EINT17 */
+	PIN_FIELD16(21, 21, 0xe60, 0x10, 12, 1),	/* EINT21 */
+	PIN_FIELD16(22, 22, 0xe70, 0x10, 0, 1),		/* EINT22 */
+	PIN_FIELD16(23, 23, 0xe70, 0x10, 4, 1),		/* EINT23 */
+
+	/* KPROW */
+	PIN_FIELD16(40, 40, 0xe80, 0x10, 0, 1),		/* KPROW0 */
+	PIN_FIELD16(41, 41, 0xe80, 0x10, 4, 1),		/* KPROW1 */
+	PIN_FIELD16(42, 42, 0xe90, 0x10, 0, 1),		/* KPCOL0 */
+	PIN_FIELD16(43, 43, 0xe90, 0x10, 4, 1),		/* KPCOL1 */
+
+	/* MSDC2 */
+	PIN_FIELD16(68, 68, 0xe50, 0x10, 8, 1),		/* MSDC2_CMD */
+	PIN_FIELD16(69, 69, 0xe50, 0x10, 4, 1),		/* MSDC2_CLK */
+	PIN_FIELD16(70, 70, 0xe40, 0x10, 4, 1),		/* MSDC2_DAT0 */
+	PIN_FIELD16(71, 71, 0xe40, 0x10, 8, 1),		/* MSDC2_DAT1 */
+	PIN_FIELD16(72, 72, 0xe40, 0x10, 12, 1),	/* MSDC2_DAT2 */
+	PIN_FIELD16(73, 73, 0xe50, 0x10, 0, 1),		/* MSDC2_DAT3 */
+
+	/* MSDC1 */
+	PIN_FIELD16(104, 104, 0xe40, 0x10, 0, 1),	/* MSDC1_CMD */
+	PIN_FIELD16(105, 105, 0xe30, 0x10, 12, 1),	/* MSDC1_CLK */
+	PIN_FIELD16(106, 106, 0xe20, 0x10, 12, 1),	/* MSDC1_DAT0 */
+	PIN_FIELD16(107, 107, 0xe30, 0x10, 0, 1),	/* MSDC1_DAT1 */
+	PIN_FIELD16(108, 108, 0xe30, 0x10, 4, 1),	/* MSDC1_DAT2 */
+	PIN_FIELD16(109, 109, 0xe30, 0x10, 8, 1),	/* MSDC1_DAT3 */
+
+	/* MSDC0 */
+	PIN_FIELD16(110, 110, 0xe10, 0x10, 12, 1),	/* MSDC0_DAT7 */
+	PIN_FIELD16(111, 111, 0xe10, 0x10, 8, 1),	/* MSDC0_DAT6 */
+	PIN_FIELD16(112, 112, 0xe10, 0x10, 4, 1),	/* MSDC0_DAT5 */
+	PIN_FIELD16(113, 113, 0xe10, 0x10, 0, 1),	/* MSDC0_DAT4 */
+	PIN_FIELD16(114, 114, 0xe20, 0x10, 8, 1),	/* MSDC0_RSTB */
+	PIN_FIELD16(115, 115, 0xe20, 0x10, 0, 1),	/* MSDC0_CMD */
+	PIN_FIELD16(116, 116, 0xe20, 0x10, 4, 1),	/* MSDC0_CLK */
+	PIN_FIELD16(117, 117, 0xe00, 0x10, 12, 1),	/* MSDC0_DAT3 */
+	PIN_FIELD16(118, 118, 0xe00, 0x10, 8, 1),	/* MSDC0_DAT2 */
+	PIN_FIELD16(119, 119, 0xe00, 0x10, 4, 1),	/* MSDC0_DAT1 */
+	PIN_FIELD16(120, 120, 0xe00, 0x10, 0, 1),	/* MSDC0_DAT0 */
+};
 
-	MTK_PIN_DRV_GRP(114, 0xd70, 4, 2),
+static const struct mtk_pin_field_calc mt8516_pin_r1_range[] = {
+	/* EINT */
+	PIN_FIELD16(14, 14, 0xe50, 0x10, 13, 1),	/* EINT14 */
+	PIN_FIELD16(15, 15, 0xe60, 0x10, 1, 1),		/* EINT15 */
+	PIN_FIELD16(16, 16, 0xe60, 0x10, 5, 1),		/* EINT16 */
+	PIN_FIELD16(17, 17, 0xe60, 0x10, 9, 1),		/* EINT17 */
+	PIN_FIELD16(21, 21, 0xe60, 0x10, 13, 1),	/* EINT21 */
+	PIN_FIELD16(22, 22, 0xe70, 0x10, 1, 1),		/* EINT22 */
+	PIN_FIELD16(23, 23, 0xe70, 0x10, 5, 1),		/* EINT23 */
+
+	/* KPROW */
+	PIN_FIELD16(40, 40, 0xe80, 0x10, 1, 1),		/* KPROW0 */
+	PIN_FIELD16(41, 41, 0xe80, 0x10, 5, 1),		/* KPROW1 */
+	PIN_FIELD16(42, 42, 0xe90, 0x10, 1, 1),		/* KPCOL0 */
+	PIN_FIELD16(43, 43, 0xe90, 0x10, 5, 1),		/* KPCOL1 */
+
+	/* MSDC2 */
+	PIN_FIELD16(68, 68, 0xe50, 0x10, 9, 1),		/* MSDC2_CMD */
+	PIN_FIELD16(69, 69, 0xe50, 0x10, 5, 1),		/* MSDC2_CLK */
+	PIN_FIELD16(70, 70, 0xe40, 0x10, 5, 1),		/* MSDC2_DAT0 */
+	PIN_FIELD16(71, 71, 0xe40, 0x10, 9, 1),		/* MSDC2_DAT1 */
+	PIN_FIELD16(72, 72, 0xe40, 0x10, 13, 1),	/* MSDC2_DAT2 */
+	PIN_FIELD16(73, 73, 0xe50, 0x10, 1, 1),		/* MSDC2_DAT3 */
+
+	/* MSDC1 */
+	PIN_FIELD16(104, 104, 0xe40, 0x10, 1, 1),	/* MSDC1_CMD */
+	PIN_FIELD16(105, 105, 0xe30, 0x10, 13, 1),	/* MSDC1_CLK */
+	PIN_FIELD16(106, 106, 0xe20, 0x10, 13, 1),	/* MSDC1_DAT0 */
+	PIN_FIELD16(107, 107, 0xe30, 0x10, 1, 1),	/* MSDC1_DAT1 */
+	PIN_FIELD16(108, 108, 0xe30, 0x10, 5, 1),	/* MSDC1_DAT2 */
+	PIN_FIELD16(109, 109, 0xe30, 0x10, 9, 1),	/* MSDC1_DAT3 */
+
+	/* MSDC0 */
+	PIN_FIELD16(110, 110, 0xe10, 0x10, 13, 1),	/* MSDC0_DAT7 */
+	PIN_FIELD16(111, 111, 0xe10, 0x10, 9, 1),	/* MSDC0_DAT6 */
+	PIN_FIELD16(112, 112, 0xe10, 0x10, 5, 1),	/* MSDC0_DAT5 */
+	PIN_FIELD16(113, 113, 0xe10, 0x10, 1, 1),	/* MSDC0_DAT4 */
+	PIN_FIELD16(114, 114, 0xe20, 0x10, 9, 1),	/* MSDC0_RSTB */
+	PIN_FIELD16(115, 115, 0xe20, 0x10, 1, 1),	/* MSDC0_CMD */
+	PIN_FIELD16(116, 116, 0xe20, 0x10, 5, 1),	/* MSDC0_CLK */
+	PIN_FIELD16(117, 117, 0xe00, 0x10, 13, 1),	/* MSDC0_DAT3 */
+	PIN_FIELD16(118, 118, 0xe00, 0x10, 9, 1),	/* MSDC0_DAT2 */
+	PIN_FIELD16(119, 119, 0xe00, 0x10, 5, 1),	/* MSDC0_DAT1 */
+	PIN_FIELD16(120, 120, 0xe00, 0x10, 1, 1),	/* MSDC0_DAT0 */
+};
 
-	MTK_PIN_DRV_GRP(115, 0xd60, 12, 2),
+static const struct mtk_pin_field_calc mt8516_pin_drv_range[] = {
+	PINS_FIELD16(0, 4, 0xd00, 0x10, 0, 2),
+	PINS_FIELD16(5, 10, 0xd00, 0x10, 4, 2),
+	PINS_FIELD16(11, 13, 0xd00, 0x10, 8, 2),
+	PINS_FIELD16(14, 17, 0xd00, 0x10, 12, 2),
+	PINS_FIELD16(18, 20, 0xd10, 0x10, 0, 2),
+	PINS_FIELD16(21, 23, 0xd00, 0x10, 12, 2),
+	PINS_FIELD16(24, 25, 0xd00, 0x10, 8, 2),
+	PINS_FIELD16(26, 30, 0xd10, 0x10, 4, 2),
+	PINS_FIELD16(31, 33, 0xd10, 0x10, 8, 2),
+	PINS_FIELD16(34, 35, 0xd10, 0x10, 12, 2),
+	PINS_FIELD16(36, 39, 0xd20, 0x10, 0, 2),
+	PIN_FIELD16(40, 40, 0xd20, 0x10, 4, 2),
+	PINS_FIELD16(41, 43, 0xd20, 0x10, 8, 2),
+	PINS_FIELD16(44, 47, 0xd20, 0x10, 12, 2),
+	PINS_FIELD16(48, 51, 0xd30, 0x10, 12, 2),
+
+	PIN_FIELD16(54, 54, 0xd30, 0x10, 8, 2),
+	PINS_FIELD16(55, 57, 0xd30, 0x10, 0, 2),
+
+	PINS_FIELD16(62, 67, 0xd40, 0x10, 8, 2),
+	PIN_FIELD16(68, 68, 0xd40, 0x10, 12, 2),
+	PIN_FIELD16(69, 69, 0xd50, 0x10, 0, 2),
+	PINS_FIELD16(70, 73, 0xd50, 0x10, 4, 2),
+
+	PINS_FIELD16(100, 103, 0xd50, 0x10, 8, 2),
+	PIN_FIELD16(104, 104, 0xd50, 0x10, 12, 2),
+	PIN_FIELD16(105, 105, 0xd60, 0x10, 0, 2),
+	PINS_FIELD16(106, 109, 0xd60, 0x10, 4, 2),
+	PINS_FIELD16(110, 113, 0xd70, 0x10, 0, 2),
+	PIN_FIELD16(114, 114, 0xd70, 0x10, 4, 2),
+	PIN_FIELD16(115, 115, 0xd60, 0x10, 12, 2),
+	PIN_FIELD16(116, 116, 0xd60, 0x10, 8, 2),
+	PINS_FIELD16(117, 120, 0xd70, 0x10, 0, 2),
+};
 
-	MTK_PIN_DRV_GRP(116, 0xd60, 8, 2),
+static const struct mtk_pin_field_calc mt8516_pin_sr_range[] = {
+	PINS_FIELD16(0, 4, 0xd00, 0x10, 3, 1),
+	PINS_FIELD16(5, 10, 0xd00, 0x10, 7, 1),
+	PINS_FIELD16(11, 13, 0xd00, 0x10, 11, 1),
+	PINS_FIELD16(14, 17, 0xd00, 0x10, 15, 1),
+	PINS_FIELD16(18, 20, 0xd10, 0x10, 3, 1),
+	PINS_FIELD16(21, 23, 0xd00, 0x10, 15, 1),
+	PINS_FIELD16(24, 25, 0xd00, 0x10, 11, 1),
+	PINS_FIELD16(26, 30, 0xd10, 0x10, 7, 1),
+	PINS_FIELD16(31, 33, 0xd10, 0x10, 11, 1),
+	PINS_FIELD16(34, 35, 0xd10, 0x10, 15, 1),
+	PINS_FIELD16(36, 39, 0xd20, 0x10, 3, 1),
+	PIN_FIELD16(40, 40, 0xd20, 0x10, 7, 1),
+	PINS_FIELD16(41, 43, 0xd20, 0x10, 11, 1),
+	PINS_FIELD16(44, 47, 0xd20, 0x10, 15, 1),
+	PINS_FIELD16(48, 51, 0xd30, 0x10, 15, 1),
+
+	PIN_FIELD16(54, 54, 0xd30, 0x10, 11, 1),
+	PINS_FIELD16(55, 57, 0xd30, 0x10, 3, 1),
+
+	PINS_FIELD16(62, 67, 0xd40, 0x10, 11, 1),
+	PIN_FIELD16(68, 68, 0xd40, 0x10, 15, 1),
+	PIN_FIELD16(69, 69, 0xd50, 0x10, 3, 1),
+	PINS_FIELD16(70, 73, 0xd50, 0x10, 7, 1),
+
+	PINS_FIELD16(100, 103, 0xd50, 0x10, 11, 1),
+	PIN_FIELD16(104, 104, 0xd50, 0x10, 15, 1),
+	PIN_FIELD16(105, 105, 0xd60, 0x10, 3, 1),
+	PINS_FIELD16(106, 109, 0xd60, 0x10, 7, 1),
+	PINS_FIELD16(110, 113, 0xd70, 0x10, 3, 1),
+	PIN_FIELD16(114, 114, 0xd70, 0x10, 7, 1),
+	PIN_FIELD16(115, 115, 0xd60, 0x10, 15, 1),
+	PIN_FIELD16(116, 116, 0xd60, 0x10, 11, 1),
+	PINS_FIELD16(117, 120, 0xd70, 0x10, 3, 1),
+};
 
-	MTK_PIN_DRV_GRP(117, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(118, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(119, 0xd70, 0, 2),
-	MTK_PIN_DRV_GRP(120, 0xd70, 0, 2),
+static const struct mtk_pin_reg_calc mt8516_reg_cals[PINCTRL_PIN_REG_MAX] = {
+	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8516_pin_mode_range),
+	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8516_pin_dir_range),
+	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8516_pin_di_range),
+	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8516_pin_do_range),
+	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt8516_pin_sr_range),
+	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8516_pin_smt_range),
+	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt8516_pin_drv_range),
+	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8516_pin_pupd_range),
+	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8516_pin_r0_range),
+	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8516_pin_r1_range),
+	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8516_pin_ies_range),
+	[PINCTRL_PIN_REG_PULLEN] = MTK_RANGE(mt8516_pin_pullen_range),
+	[PINCTRL_PIN_REG_PULLSEL] = MTK_RANGE(mt8516_pin_pullsel_range),
 };
 
-static const struct mtk_pin_spec_pupd_set_samereg mt8516_spec_pupd[] = {
-	MTK_PIN_PUPD_SPEC_SR(14, 0xe50, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(15, 0xe60, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(16, 0xe60, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(17, 0xe60, 10, 9, 8),
-
-	MTK_PIN_PUPD_SPEC_SR(21, 0xe60, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(22, 0xe70, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(23, 0xe70, 6, 5, 4),
-
-	MTK_PIN_PUPD_SPEC_SR(40, 0xe80, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(41, 0xe80, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(42, 0xe90, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(43, 0xe90, 6, 5, 4),
-
-	MTK_PIN_PUPD_SPEC_SR(68, 0xe50, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(69, 0xe50, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(70, 0xe40, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(71, 0xe40, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(72, 0xe40, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(73, 0xe50, 2, 1, 0),
-
-	MTK_PIN_PUPD_SPEC_SR(104, 0xe40, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(105, 0xe30, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(106, 0xe20, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(107, 0xe30, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(108, 0xe30, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(109, 0xe30, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(110, 0xe10, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(111, 0xe10, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(112, 0xe10, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(113, 0xe10, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(114, 0xe20, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(115, 0xe20, 2, 1, 0),
-	MTK_PIN_PUPD_SPEC_SR(116, 0xe20, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(117, 0xe00, 14, 13, 12),
-	MTK_PIN_PUPD_SPEC_SR(118, 0xe00, 10, 9, 8),
-	MTK_PIN_PUPD_SPEC_SR(119, 0xe00, 6, 5, 4),
-	MTK_PIN_PUPD_SPEC_SR(120, 0xe00, 2, 1, 0),
+static const struct mtk_eint_hw mt8516_eint_hw = {
+	.port_mask = 7,
+	.ports     = 6,
+	.ap_num    = 169,
+	.db_cnt    = 64,
+	.db_time   = debounce_time_mt6795,
 };
 
-static const struct mtk_pin_ies_smt_set mt8516_ies_set[] = {
-	MTK_PIN_IES_SMT_SPEC(0, 6, 0x900, 2),
-	MTK_PIN_IES_SMT_SPEC(7, 10, 0x900, 3),
-	MTK_PIN_IES_SMT_SPEC(11, 13, 0x900, 12),
-	MTK_PIN_IES_SMT_SPEC(14, 17, 0x900, 13),
-	MTK_PIN_IES_SMT_SPEC(18, 20, 0x910, 10),
-	MTK_PIN_IES_SMT_SPEC(21, 23, 0x900, 13),
-	MTK_PIN_IES_SMT_SPEC(24, 25, 0x900, 12),
-	MTK_PIN_IES_SMT_SPEC(26, 30, 0x900, 0),
-	MTK_PIN_IES_SMT_SPEC(31, 33, 0x900, 1),
-	MTK_PIN_IES_SMT_SPEC(34, 39, 0x900, 2),
-	MTK_PIN_IES_SMT_SPEC(40, 40, 0x910, 11),
-	MTK_PIN_IES_SMT_SPEC(41, 43, 0x900, 10),
-	MTK_PIN_IES_SMT_SPEC(44, 47, 0x900, 11),
-	MTK_PIN_IES_SMT_SPEC(48, 51, 0x900, 14),
-	MTK_PIN_IES_SMT_SPEC(52, 53, 0x910, 0),
-	MTK_PIN_IES_SMT_SPEC(54, 54, 0x910, 2),
-	MTK_PIN_IES_SMT_SPEC(55, 57, 0x910, 4),
-	MTK_PIN_IES_SMT_SPEC(58, 59, 0x900, 15),
-	MTK_PIN_IES_SMT_SPEC(60, 61, 0x910, 1),
-	MTK_PIN_IES_SMT_SPEC(62, 65, 0x910, 5),
-	MTK_PIN_IES_SMT_SPEC(66, 67, 0x910, 6),
-	MTK_PIN_IES_SMT_SPEC(68, 68, 0x930, 2),
-	MTK_PIN_IES_SMT_SPEC(69, 69, 0x930, 1),
-	MTK_PIN_IES_SMT_SPEC(70, 70, 0x930, 6),
-	MTK_PIN_IES_SMT_SPEC(71, 71, 0x930, 5),
-	MTK_PIN_IES_SMT_SPEC(72, 72, 0x930, 4),
-	MTK_PIN_IES_SMT_SPEC(73, 73, 0x930, 3),
-	MTK_PIN_IES_SMT_SPEC(100, 103, 0x910, 7),
-	MTK_PIN_IES_SMT_SPEC(104, 104, 0x920, 12),
-	MTK_PIN_IES_SMT_SPEC(105, 105, 0x920, 11),
-	MTK_PIN_IES_SMT_SPEC(106, 106, 0x930, 0),
-	MTK_PIN_IES_SMT_SPEC(107, 107, 0x920, 15),
-	MTK_PIN_IES_SMT_SPEC(108, 108, 0x920, 14),
-	MTK_PIN_IES_SMT_SPEC(109, 109, 0x920, 13),
-	MTK_PIN_IES_SMT_SPEC(110, 110, 0x920, 9),
-	MTK_PIN_IES_SMT_SPEC(111, 111, 0x920, 8),
-	MTK_PIN_IES_SMT_SPEC(112, 112, 0x920, 7),
-	MTK_PIN_IES_SMT_SPEC(113, 113, 0x920, 6),
-	MTK_PIN_IES_SMT_SPEC(114, 114, 0x920, 10),
-	MTK_PIN_IES_SMT_SPEC(115, 115, 0x920, 1),
-	MTK_PIN_IES_SMT_SPEC(116, 116, 0x920, 0),
-	MTK_PIN_IES_SMT_SPEC(117, 117, 0x920, 5),
-	MTK_PIN_IES_SMT_SPEC(118, 118, 0x920, 4),
-	MTK_PIN_IES_SMT_SPEC(119, 119, 0x920, 3),
-	MTK_PIN_IES_SMT_SPEC(120, 120, 0x920, 2),
-	MTK_PIN_IES_SMT_SPEC(121, 124, 0x910, 9),
+static const unsigned int mt8516_pull_type[] = {
+	MTK_PULL_PULLSEL_TYPE,/*0*/		MTK_PULL_PULLSEL_TYPE,/*1*/
+	MTK_PULL_PULLSEL_TYPE,/*2*/		MTK_PULL_PULLSEL_TYPE,/*3*/
+	MTK_PULL_PULLSEL_TYPE,/*4*/		MTK_PULL_PULLSEL_TYPE,/*5*/
+	MTK_PULL_PULLSEL_TYPE,/*6*/		MTK_PULL_PULLSEL_TYPE,/*7*/
+	MTK_PULL_PULLSEL_TYPE,/*8*/		MTK_PULL_PULLSEL_TYPE,/*9*/
+	MTK_PULL_PULLSEL_TYPE,/*10*/		MTK_PULL_PULLSEL_TYPE,/*11*/
+	MTK_PULL_PULLSEL_TYPE,/*12*/		MTK_PULL_PULLSEL_TYPE,/*13*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*14*/		MTK_PULL_PUPD_R1R0_TYPE,/*15*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*16*/		MTK_PULL_PUPD_R1R0_TYPE,/*17*/
+	MTK_PULL_PULLSEL_TYPE,/*18*/		MTK_PULL_PULLSEL_TYPE,/*19*/
+	MTK_PULL_PULLSEL_TYPE,/*20*/		MTK_PULL_PUPD_R1R0_TYPE,/*21*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*22*/		MTK_PULL_PUPD_R1R0_TYPE,/*23*/
+	MTK_PULL_PULLSEL_TYPE,/*24*/		MTK_PULL_PULLSEL_TYPE,/*25*/
+	MTK_PULL_PULLSEL_TYPE,/*26*/		MTK_PULL_PULLSEL_TYPE,/*27*/
+	MTK_PULL_PULLSEL_TYPE,/*28*/		MTK_PULL_PULLSEL_TYPE,/*29*/
+	MTK_PULL_PULLSEL_TYPE,/*30*/		MTK_PULL_PULLSEL_TYPE,/*31*/
+	MTK_PULL_PULLSEL_TYPE,/*32*/		MTK_PULL_PULLSEL_TYPE,/*33*/
+	MTK_PULL_PULLSEL_TYPE,/*34*/		MTK_PULL_PULLSEL_TYPE,/*35*/
+	MTK_PULL_PULLSEL_TYPE,/*36*/		MTK_PULL_PULLSEL_TYPE,/*37*/
+	MTK_PULL_PULLSEL_TYPE,/*38*/		MTK_PULL_PULLSEL_TYPE,/*39*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*40*/		MTK_PULL_PUPD_R1R0_TYPE,/*41*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*42*/		MTK_PULL_PUPD_R1R0_TYPE,/*43*/
+	MTK_PULL_PULLSEL_TYPE,/*44*/		MTK_PULL_PULLSEL_TYPE,/*45*/
+	MTK_PULL_PULLSEL_TYPE,/*46*/		MTK_PULL_PULLSEL_TYPE,/*47*/
+	MTK_PULL_PULLSEL_TYPE,/*48*/		MTK_PULL_PULLSEL_TYPE,/*49*/
+	MTK_PULL_PULLSEL_TYPE,/*50*/		MTK_PULL_PULLSEL_TYPE,/*51*/
+	MTK_PULL_PULLSEL_TYPE,/*52*/		MTK_PULL_PULLSEL_TYPE,/*53*/
+	MTK_PULL_PULLSEL_TYPE,/*54*/		MTK_PULL_PULLSEL_TYPE,/*55*/
+	MTK_PULL_PULLSEL_TYPE,/*56*/		MTK_PULL_PULLSEL_TYPE,/*57*/
+	MTK_PULL_PULLSEL_TYPE,/*58*/		MTK_PULL_PULLSEL_TYPE,/*59*/
+	MTK_PULL_PULLSEL_TYPE,/*60*/		MTK_PULL_PULLSEL_TYPE,/*61*/
+	MTK_PULL_PULLSEL_TYPE,/*62*/		MTK_PULL_PULLSEL_TYPE,/*63*/
+	MTK_PULL_PULLSEL_TYPE,/*64*/		MTK_PULL_PULLSEL_TYPE,/*65*/
+	MTK_PULL_PULLSEL_TYPE,/*66*/		MTK_PULL_PULLSEL_TYPE,/*67*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*68*/		MTK_PULL_PUPD_R1R0_TYPE,/*69*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*70*/		MTK_PULL_PUPD_R1R0_TYPE,/*71*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*72*/		MTK_PULL_PUPD_R1R0_TYPE,/*73*/
+	MTK_PULL_PULLSEL_TYPE,/*74*/		MTK_PULL_PULLSEL_TYPE,/*75*/
+	MTK_PULL_PULLSEL_TYPE,/*76*/		MTK_PULL_PULLSEL_TYPE,/*77*/
+	MTK_PULL_PULLSEL_TYPE,/*78*/		MTK_PULL_PULLSEL_TYPE,/*79*/
+	MTK_PULL_PULLSEL_TYPE,/*80*/		MTK_PULL_PULLSEL_TYPE,/*81*/
+	MTK_PULL_PULLSEL_TYPE,/*82*/		MTK_PULL_PULLSEL_TYPE,/*83*/
+	MTK_PULL_PULLSEL_TYPE,/*84*/		MTK_PULL_PULLSEL_TYPE,/*85*/
+	MTK_PULL_PULLSEL_TYPE,/*86*/		MTK_PULL_PULLSEL_TYPE,/*87*/
+	MTK_PULL_PULLSEL_TYPE,/*88*/		MTK_PULL_PULLSEL_TYPE,/*89*/
+	MTK_PULL_PULLSEL_TYPE,/*90*/		MTK_PULL_PULLSEL_TYPE,/*91*/
+	MTK_PULL_PULLSEL_TYPE,/*92*/		MTK_PULL_PULLSEL_TYPE,/*93*/
+	MTK_PULL_PULLSEL_TYPE,/*94*/		MTK_PULL_PULLSEL_TYPE,/*95*/
+	MTK_PULL_PULLSEL_TYPE,/*96*/		MTK_PULL_PULLSEL_TYPE,/*97*/
+	MTK_PULL_PULLSEL_TYPE,/*98*/		MTK_PULL_PULLSEL_TYPE,/*99*/
+	MTK_PULL_PULLSEL_TYPE,/*100*/		MTK_PULL_PULLSEL_TYPE,/*101*/
+	MTK_PULL_PULLSEL_TYPE,/*102*/		MTK_PULL_PULLSEL_TYPE,/*103*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*104*/		MTK_PULL_PUPD_R1R0_TYPE,/*105*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*106*/		MTK_PULL_PUPD_R1R0_TYPE,/*107*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*108*/		MTK_PULL_PUPD_R1R0_TYPE,/*109*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*110*/		MTK_PULL_PUPD_R1R0_TYPE,/*111*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*112*/		MTK_PULL_PUPD_R1R0_TYPE,/*113*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*114*/		MTK_PULL_PUPD_R1R0_TYPE,/*115*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*116*/		MTK_PULL_PUPD_R1R0_TYPE,/*117*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*118*/		MTK_PULL_PUPD_R1R0_TYPE,/*119*/
+	MTK_PULL_PUPD_R1R0_TYPE,/*120*/		MTK_PULL_PULLSEL_TYPE,/*121*/
+	MTK_PULL_PULLSEL_TYPE,/*122*/		MTK_PULL_PULLSEL_TYPE,/*123*/
+	MTK_PULL_PULLSEL_TYPE,/*124*/
 };
 
-static const struct mtk_pin_ies_smt_set mt8516_smt_set[] = {
-	MTK_PIN_IES_SMT_SPEC(0, 6, 0xA00, 2),
-	MTK_PIN_IES_SMT_SPEC(7, 10, 0xA00, 3),
-	MTK_PIN_IES_SMT_SPEC(11, 13, 0xA00, 12),
-	MTK_PIN_IES_SMT_SPEC(14, 17, 0xA00, 13),
-	MTK_PIN_IES_SMT_SPEC(18, 20, 0xA10, 10),
-	MTK_PIN_IES_SMT_SPEC(21, 23, 0xA00, 13),
-	MTK_PIN_IES_SMT_SPEC(24, 25, 0xA00, 12),
-	MTK_PIN_IES_SMT_SPEC(26, 30, 0xA00, 0),
-	MTK_PIN_IES_SMT_SPEC(31, 33, 0xA00, 1),
-	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA00, 2),
-	MTK_PIN_IES_SMT_SPEC(40, 40, 0xA10, 11),
-	MTK_PIN_IES_SMT_SPEC(41, 43, 0xA00, 10),
-	MTK_PIN_IES_SMT_SPEC(44, 47, 0xA00, 11),
-	MTK_PIN_IES_SMT_SPEC(48, 51, 0xA00, 14),
-	MTK_PIN_IES_SMT_SPEC(52, 53, 0xA10, 0),
-	MTK_PIN_IES_SMT_SPEC(54, 54, 0xA10, 2),
-	MTK_PIN_IES_SMT_SPEC(55, 57, 0xA10, 4),
-	MTK_PIN_IES_SMT_SPEC(58, 59, 0xA00, 15),
-	MTK_PIN_IES_SMT_SPEC(60, 61, 0xA10, 1),
-	MTK_PIN_IES_SMT_SPEC(62, 65, 0xA10, 5),
-	MTK_PIN_IES_SMT_SPEC(66, 67, 0xA10, 6),
-	MTK_PIN_IES_SMT_SPEC(68, 68, 0xA30, 2),
-	MTK_PIN_IES_SMT_SPEC(69, 69, 0xA30, 1),
-	MTK_PIN_IES_SMT_SPEC(70, 70, 0xA30, 3),
-	MTK_PIN_IES_SMT_SPEC(71, 71, 0xA30, 4),
-	MTK_PIN_IES_SMT_SPEC(72, 72, 0xA30, 5),
-	MTK_PIN_IES_SMT_SPEC(73, 73, 0xA30, 6),
-
-	MTK_PIN_IES_SMT_SPEC(100, 103, 0xA10, 7),
-	MTK_PIN_IES_SMT_SPEC(104, 104, 0xA20, 12),
-	MTK_PIN_IES_SMT_SPEC(105, 105, 0xA20, 11),
-	MTK_PIN_IES_SMT_SPEC(106, 106, 0xA30, 13),
-	MTK_PIN_IES_SMT_SPEC(107, 107, 0xA20, 14),
-	MTK_PIN_IES_SMT_SPEC(108, 108, 0xA20, 15),
-	MTK_PIN_IES_SMT_SPEC(109, 109, 0xA30, 0),
-	MTK_PIN_IES_SMT_SPEC(110, 110, 0xA20, 9),
-	MTK_PIN_IES_SMT_SPEC(111, 111, 0xA20, 8),
-	MTK_PIN_IES_SMT_SPEC(112, 112, 0xA20, 7),
-	MTK_PIN_IES_SMT_SPEC(113, 113, 0xA20, 6),
-	MTK_PIN_IES_SMT_SPEC(114, 114, 0xA20, 10),
-	MTK_PIN_IES_SMT_SPEC(115, 115, 0xA20, 1),
-	MTK_PIN_IES_SMT_SPEC(116, 116, 0xA20, 0),
-	MTK_PIN_IES_SMT_SPEC(117, 117, 0xA20, 5),
-	MTK_PIN_IES_SMT_SPEC(118, 118, 0xA20, 4),
-	MTK_PIN_IES_SMT_SPEC(119, 119, 0xA20, 3),
-	MTK_PIN_IES_SMT_SPEC(120, 120, 0xA20, 2),
-	MTK_PIN_IES_SMT_SPEC(121, 124, 0xA10, 9),
+static const struct mtk_pin_soc mt8167_pinctrl_data = {
+	.reg_cal = mt8516_reg_cals,
+	.pins = mtk_pins_mt8167,
+	.npins = ARRAY_SIZE(mtk_pins_mt8167),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt8167),
+	.nfuncs = 8,
+	.eint_hw = &mt8516_eint_hw,
+	.gpio_m = 0,
+	.ies_present = true,
+	.base_names = mtk_default_register_base_names,
+	.nbase_names = ARRAY_SIZE(mtk_default_register_base_names),
+	.pull_type = mt8516_pull_type,
+	.bias_disable_set = mtk_pinconf_bias_disable_set_rev1,
+	.bias_disable_get = mtk_pinconf_bias_disable_get_rev1,
+	.bias_set = mtk_pinconf_bias_set_rev1,
+	.bias_get = mtk_pinconf_bias_get_rev1,
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_pull_get = mtk_pinconf_adv_pull_get,
+	.adv_pull_set = mtk_pinconf_adv_pull_set,
 };
 
-static const struct mtk_pinctrl_devdata mt8516_pinctrl_data = {
+static const struct mtk_pin_soc mt8516_pinctrl_data = {
+	.reg_cal = mt8516_reg_cals,
 	.pins = mtk_pins_mt8516,
 	.npins = ARRAY_SIZE(mtk_pins_mt8516),
-	.grp_desc = mt8516_drv_grp,
-	.n_grp_cls = ARRAY_SIZE(mt8516_drv_grp),
-	.pin_drv_grp = mt8516_pin_drv,
-	.n_pin_drv_grps = ARRAY_SIZE(mt8516_pin_drv),
-	.spec_ies = mt8516_ies_set,
-	.n_spec_ies = ARRAY_SIZE(mt8516_ies_set),
-	.spec_pupd = mt8516_spec_pupd,
-	.n_spec_pupd = ARRAY_SIZE(mt8516_spec_pupd),
-	.spec_smt = mt8516_smt_set,
-	.n_spec_smt = ARRAY_SIZE(mt8516_smt_set),
-	.spec_pull_set = mtk_pctrl_spec_pull_set_samereg,
-	.spec_ies_smt_set = mtk_pconf_spec_set_ies_smt_range,
-	.dir_offset = 0x0000,
-	.pullen_offset = 0x0500,
-	.pullsel_offset = 0x0600,
-	.dout_offset = 0x0100,
-	.din_offset = 0x0200,
-	.pinmux_offset = 0x0300,
-	.type1_start = 125,
-	.type1_end = 125,
-	.port_shf = 4,
-	.port_mask = 0xf,
-	.port_align = 4,
-	.mode_mask = 0xf,
-	.mode_per_reg = 5,
-	.mode_shf = 4,
-	.eint_hw = {
-		.port_mask = 7,
-		.ports     = 6,
-		.ap_num    = 169,
-		.db_cnt    = 64,
-		.db_time   = debounce_time_mt6795,
-	},
+	.ngrps = ARRAY_SIZE(mtk_pins_mt8516),
+	.nfuncs = 8,
+	.eint_hw = &mt8516_eint_hw,
+	.gpio_m = 0,
+	.ies_present = true,
+	.base_names = mtk_default_register_base_names,
+	.nbase_names = ARRAY_SIZE(mtk_default_register_base_names),
+	.pull_type = mt8516_pull_type,
+	.bias_disable_set = mtk_pinconf_bias_disable_set_rev1,
+	.bias_disable_get = mtk_pinconf_bias_disable_get_rev1,
+	.bias_set = mtk_pinconf_bias_set_rev1,
+	.bias_get = mtk_pinconf_bias_get_rev1,
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_pull_get = mtk_pinconf_adv_pull_get,
+	.adv_pull_set = mtk_pinconf_adv_pull_set,
 };
 
-static const struct of_device_id mt8516_pctrl_match[] = {
+static const struct of_device_id mt8516_pinctrl_of_match[] = {
+	{ .compatible = "mediatek,mt8167-pinctrl", .data = &mt8167_pinctrl_data },
 	{ .compatible = "mediatek,mt8516-pinctrl", .data = &mt8516_pinctrl_data },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8516_pinctrl_of_match);
 
-MODULE_DEVICE_TABLE(of, mt8516_pctrl_match);
-
-static struct platform_driver mtk_pinctrl_driver = {
-	.probe = mtk_pctrl_common_probe,
+static struct platform_driver mt8516_pinctrl_driver = {
 	.driver = {
 		.name = "mediatek-mt8516-pinctrl",
-		.of_match_table = mt8516_pctrl_match,
-		.pm = pm_sleep_ptr(&mtk_eint_pm_ops),
+		.of_match_table = mt8516_pinctrl_of_match,
+		.pm = pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),
 	},
+	.probe = mtk_paris_pinctrl_probe,
 };
 
-static int __init mtk_pinctrl_init(void)
+static int __init mt8516_pinctrl_init(void)
 {
-	return platform_driver_register(&mtk_pinctrl_driver);
+	return platform_driver_register(&mt8516_pinctrl_driver);
 }
-arch_initcall(mtk_pinctrl_init);
+arch_initcall(mt8516_pinctrl_init);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek MT8516/MT8167 Pinctrl Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h
index 225c41fc9b75..d0c603838644 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h
@@ -1,18 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2020 MediaTek Inc.
- */
 #ifndef __PINCTRL_MTK_MT8167_H
 #define __PINCTRL_MTK_MT8167_H
 
-#include <linux/pinctrl/pinctrl.h>
-#include "pinctrl-mtk-common.h"
+#include "pinctrl-paris.h"
 
-static const struct mtk_desc_pin mtk_pins_mt8167[] = {
+static const struct mtk_pin_desc mtk_pins_mt8167[] = {
 	MTK_PIN(
-		PINCTRL_PIN(0, "EINT0"),
-		NULL, "mt8167",
+		0, "EINT0",
 		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO0"),
 		MTK_FUNCTION(1, "PWM_B"),
 		MTK_FUNCTION(2, "DPI_CK"),
@@ -22,9 +18,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[6]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(1, "EINT1"),
-		NULL, "mt8167",
+		1, "EINT1",
 		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO1"),
 		MTK_FUNCTION(1, "PWM_C"),
 		MTK_FUNCTION(2, "DPI_D12"),
@@ -35,9 +31,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[7]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(2, "EINT2"),
-		NULL, "mt8167",
+		2, "EINT2",
 		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO2"),
 		MTK_FUNCTION(1, "CLKM0"),
 		MTK_FUNCTION(2, "DPI_D13"),
@@ -48,9 +44,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[8]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(3, "EINT3"),
-		NULL, "mt8167",
+		3, "EINT3",
 		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO3"),
 		MTK_FUNCTION(1, "CLKM1"),
 		MTK_FUNCTION(2, "DPI_D14"),
@@ -61,9 +57,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[9]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(4, "EINT4"),
-		NULL, "mt8167",
+		4, "EINT4",
 		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO4"),
 		MTK_FUNCTION(1, "CLKM2"),
 		MTK_FUNCTION(2, "DPI_D15"),
@@ -74,9 +70,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[10]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(5, "EINT5"),
-		NULL, "mt8167",
+		5, "EINT5",
 		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO5"),
 		MTK_FUNCTION(1, "UCTS2"),
 		MTK_FUNCTION(2, "DPI_D16"),
@@ -87,9 +83,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[11]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(6, "EINT6"),
-		NULL, "mt8167",
+		6, "EINT6",
 		MTK_EINT_FUNCTION(0, 6),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO6"),
 		MTK_FUNCTION(1, "URTS2"),
 		MTK_FUNCTION(2, "DPI_D17"),
@@ -100,9 +96,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[12]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(7, "EINT7"),
-		NULL, "mt8167",
+		7, "EINT7",
 		MTK_EINT_FUNCTION(0, 7),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO7"),
 		MTK_FUNCTION(1, "SQIRST"),
 		MTK_FUNCTION(2, "DPI_D6"),
@@ -113,9 +109,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[13]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(8, "EINT8"),
-		NULL, "mt8167",
+		8, "EINT8",
 		MTK_EINT_FUNCTION(0, 8),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO8"),
 		MTK_FUNCTION(1, "SQICK"),
 		MTK_FUNCTION(2, "CLKM3"),
@@ -126,9 +122,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[14]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(9, "EINT9"),
-		NULL, "mt8167",
+		9, "EINT9",
 		MTK_EINT_FUNCTION(0, 9),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO9"),
 		MTK_FUNCTION(1, "CLKM4"),
 		MTK_FUNCTION(2, "SDA2_0"),
@@ -139,9 +135,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[15]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(10, "EINT10"),
-		NULL, "mt8167",
+		10, "EINT10",
 		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO10"),
 		MTK_FUNCTION(1, "CLKM5"),
 		MTK_FUNCTION(2, "SCL2_0"),
@@ -152,9 +148,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[16]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(11, "EINT11"),
-		NULL, "mt8167",
+		11, "EINT11",
 		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO11"),
 		MTK_FUNCTION(1, "CLKM4"),
 		MTK_FUNCTION(2, "PWM_C"),
@@ -165,9 +161,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[17]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(12, "EINT12"),
-		NULL, "mt8167",
+		12, "EINT12",
 		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO12"),
 		MTK_FUNCTION(1, "CLKM5"),
 		MTK_FUNCTION(2, "PWM_A"),
@@ -178,9 +174,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[18]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(13, "EINT13"),
-		NULL, "mt8167",
+		13, "EINT13",
 		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO13"),
 		MTK_FUNCTION(3, "TSF_IN"),
 		MTK_FUNCTION(4, "ANT_SEL5"),
@@ -189,9 +185,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[19]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(14, "EINT14"),
-		NULL, "mt8167",
+		14, "EINT14",
 		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO14"),
 		MTK_FUNCTION(2, "I2S_8CH_DO1"),
 		MTK_FUNCTION(3, "TDM_RX_MCK"),
@@ -201,9 +197,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[8]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(15, "EINT15"),
-		NULL, "mt8167",
+		15, "EINT15",
 		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO15"),
 		MTK_FUNCTION(2, "I2S_8CH_LRCK"),
 		MTK_FUNCTION(3, "TDM_RX_BCK"),
@@ -213,9 +209,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[9]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(16, "EINT16"),
-		NULL, "mt8167",
+		16, "EINT16",
 		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO16"),
 		MTK_FUNCTION(2, "I2S_8CH_BCK"),
 		MTK_FUNCTION(3, "TDM_RX_LRCK"),
@@ -225,9 +221,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[10]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(17, "EINT17"),
-		NULL, "mt8167",
+		17, "EINT17",
 		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO17"),
 		MTK_FUNCTION(2, "I2S_8CH_MCK"),
 		MTK_FUNCTION(3, "TDM_RX_DI"),
@@ -237,9 +233,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[11]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(18, "EINT18"),
-		NULL, "mt8167",
+		18, "EINT18",
 		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO18"),
 		MTK_FUNCTION(2, "USB_DRVVBUS"),
 		MTK_FUNCTION(3, "I2S3_LRCK"),
@@ -249,9 +245,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[20]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(19, "EINT19"),
-		NULL, "mt8167",
+		19, "EINT19",
 		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO19"),
 		MTK_FUNCTION(1, "UCTS1"),
 		MTK_FUNCTION(2, "IDDIG"),
@@ -262,9 +258,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[21]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(20, "EINT20"),
-		NULL, "mt8167",
+		20, "EINT20",
 		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO20"),
 		MTK_FUNCTION(1, "URTS1"),
 		MTK_FUNCTION(3, "I2S3_DO"),
@@ -274,9 +270,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[22]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(21, "EINT21"),
-		NULL, "mt8167",
+		21, "EINT21",
 		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO21"),
 		MTK_FUNCTION(1, "NRNB"),
 		MTK_FUNCTION(2, "ANT_SEL0"),
@@ -284,9 +280,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[31]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(22, "EINT22"),
-		NULL, "mt8167",
+		22, "EINT22",
 		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO22"),
 		MTK_FUNCTION(2, "I2S_8CH_DO2"),
 		MTK_FUNCTION(3, "TSF_IN"),
@@ -296,9 +292,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[12]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(23, "EINT23"),
-		NULL, "mt8167",
+		23, "EINT23",
 		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO23"),
 		MTK_FUNCTION(2, "I2S_8CH_DO3"),
 		MTK_FUNCTION(3, "CLKM0"),
@@ -308,9 +304,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[13]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(24, "EINT24"),
-		NULL, "mt8167",
+		24, "EINT24",
 		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO24"),
 		MTK_FUNCTION(1, "DPI_D20"),
 		MTK_FUNCTION(2, "DPI_DE"),
@@ -321,9 +317,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[0]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(25, "EINT25"),
-		NULL, "mt8167",
+		25, "EINT25",
 		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO25"),
 		MTK_FUNCTION(1, "DPI_D19"),
 		MTK_FUNCTION(2, "DPI_VSYNC"),
@@ -334,25 +330,25 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[1]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(26, "PWRAP_SPI0_MI"),
-		NULL, "mt8167",
+		26, "PWRAP_SPI0_MI",
 		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO26"),
 		MTK_FUNCTION(1, "PWRAP_SPI0_MO"),
 		MTK_FUNCTION(2, "PWRAP_SPI0_MI")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(27, "PWRAP_SPI0_MO"),
-		NULL, "mt8167",
+		27, "PWRAP_SPI0_MO",
 		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO27"),
 		MTK_FUNCTION(1, "PWRAP_SPI0_MI"),
 		MTK_FUNCTION(2, "PWRAP_SPI0_MO")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(28, "PWRAP_INT"),
-		NULL, "mt8167",
+		28, "PWRAP_INT",
 		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO28"),
 		MTK_FUNCTION(1, "I2S0_MCK"),
 		MTK_FUNCTION(4, "I2S_8CH_MCK"),
@@ -360,44 +356,44 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(6, "I2S3_MCK")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(29, "PWRAP_SPI0_CK"),
-		NULL, "mt8167",
+		29, "PWRAP_SPI0_CK",
 		MTK_EINT_FUNCTION(0, 29),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO29"),
 		MTK_FUNCTION(1, "PWRAP_SPI0_CK")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(30, "PWRAP_SPI0_CSN"),
-		NULL, "mt8167",
+		30, "PWRAP_SPI0_CSN",
 		MTK_EINT_FUNCTION(0, 30),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO30"),
 		MTK_FUNCTION(1, "PWRAP_SPI0_CSN")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(31, "RTC32K_CK"),
-		NULL, "mt8167",
+		31, "RTC32K_CK",
 		MTK_EINT_FUNCTION(0, 31),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO31"),
 		MTK_FUNCTION(1, "RTC32K_CK")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(32, "WATCHDOG"),
-		NULL, "mt8167",
+		32, "WATCHDOG",
 		MTK_EINT_FUNCTION(0, 32),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO32"),
 		MTK_FUNCTION(1, "WATCHDOG")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(33, "SRCLKENA"),
-		NULL, "mt8167",
+		33, "SRCLKENA",
 		MTK_EINT_FUNCTION(0, 33),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO33"),
 		MTK_FUNCTION(1, "SRCLKENA0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(34, "URXD2"),
-		NULL, "mt8167",
+		34, "URXD2",
 		MTK_EINT_FUNCTION(0, 34),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO34"),
 		MTK_FUNCTION(1, "URXD2"),
 		MTK_FUNCTION(2, "DPI_D5"),
@@ -407,9 +403,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[0]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(35, "UTXD2"),
-		NULL, "mt8167",
+		35, "UTXD2",
 		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO35"),
 		MTK_FUNCTION(1, "UTXD2"),
 		MTK_FUNCTION(2, "DPI_HSYNC"),
@@ -420,9 +416,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[1]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(36, "MRG_CLK"),
-		NULL, "mt8167",
+		36, "MRG_CLK",
 		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO36"),
 		MTK_FUNCTION(1, "MRG_CLK"),
 		MTK_FUNCTION(2, "DPI_D4"),
@@ -433,9 +429,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[2]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(37, "MRG_SYNC"),
-		NULL, "mt8167",
+		37, "MRG_SYNC",
 		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO37"),
 		MTK_FUNCTION(1, "MRG_SYNC"),
 		MTK_FUNCTION(2, "DPI_D3"),
@@ -446,9 +442,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[3]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(38, "MRG_DI"),
-		NULL, "mt8167",
+		38, "MRG_DI",
 		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO38"),
 		MTK_FUNCTION(1, "MRG_DI"),
 		MTK_FUNCTION(2, "DPI_D1"),
@@ -459,9 +455,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[4]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(39, "MRG_DO"),
-		NULL, "mt8167",
+		39, "MRG_DO",
 		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO39"),
 		MTK_FUNCTION(1, "MRG_DO"),
 		MTK_FUNCTION(2, "DPI_D2"),
@@ -472,18 +468,18 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[5]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(40, "KPROW0"),
-		NULL, "mt8167",
+		40, "KPROW0",
 		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO40"),
 		MTK_FUNCTION(1, "KPROW0"),
 		MTK_FUNCTION(4, "IMG_TEST_CK"),
 		MTK_FUNCTION(7, "DBG_MON_B[4]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(41, "KPROW1"),
-		NULL, "mt8167",
+		41, "KPROW1",
 		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO41"),
 		MTK_FUNCTION(1, "KPROW1"),
 		MTK_FUNCTION(2, "IDDIG"),
@@ -492,17 +488,17 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[5]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(42, "KPCOL0"),
-		NULL, "mt8167",
+		42, "KPCOL0",
 		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO42"),
 		MTK_FUNCTION(1, "KPCOL0"),
 		MTK_FUNCTION(7, "DBG_MON_B[6]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(43, "KPCOL1"),
-		NULL, "mt8167",
+		43, "KPCOL1",
 		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO43"),
 		MTK_FUNCTION(1, "KPCOL1"),
 		MTK_FUNCTION(2, "USB_DRVVBUS"),
@@ -513,9 +509,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[7]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(44, "JTMS"),
-		NULL, "mt8167",
+		44, "JTMS",
 		MTK_EINT_FUNCTION(0, 44),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO44"),
 		MTK_FUNCTION(1, "JTMS"),
 		MTK_FUNCTION(2, "CONN_MCU_TMS"),
@@ -525,9 +521,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(6, "UDI_TMS_XI")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(45, "JTCK"),
-		NULL, "mt8167",
+		45, "JTCK",
 		MTK_EINT_FUNCTION(0, 45),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO45"),
 		MTK_FUNCTION(1, "JTCK"),
 		MTK_FUNCTION(2, "CONN_MCU_TCK"),
@@ -537,9 +533,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(6, "UDI_TCK_XI")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(46, "JTDI"),
-		NULL, "mt8167",
+		46, "JTDI",
 		MTK_EINT_FUNCTION(0, 46),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO46"),
 		MTK_FUNCTION(1, "JTDI"),
 		MTK_FUNCTION(2, "CONN_MCU_TDI"),
@@ -548,9 +544,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(6, "UDI_TDI_XI")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(47, "JTDO"),
-		NULL, "mt8167",
+		47, "JTDO",
 		MTK_EINT_FUNCTION(0, 47),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO47"),
 		MTK_FUNCTION(1, "JTDO"),
 		MTK_FUNCTION(2, "CONN_MCU_TDO"),
@@ -559,9 +555,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(6, "UDI_TDO")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(48, "SPI_CS"),
-		NULL, "mt8167",
+		48, "SPI_CS",
 		MTK_EINT_FUNCTION(0, 48),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO48"),
 		MTK_FUNCTION(1, "SPI_CSB"),
 		MTK_FUNCTION(3, "I2S0_DI"),
@@ -569,9 +565,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[23]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(49, "SPI_CK"),
-		NULL, "mt8167",
+		49, "SPI_CK",
 		MTK_EINT_FUNCTION(0, 49),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO49"),
 		MTK_FUNCTION(1, "SPI_CLK"),
 		MTK_FUNCTION(3, "I2S0_LRCK"),
@@ -579,9 +575,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[24]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(50, "SPI_MI"),
-		NULL, "mt8167",
+		50, "SPI_MI",
 		MTK_EINT_FUNCTION(0, 50),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO50"),
 		MTK_FUNCTION(1, "SPI_MI"),
 		MTK_FUNCTION(2, "SPI_MO"),
@@ -590,9 +586,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[25]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(51, "SPI_MO"),
-		NULL, "mt8167",
+		51, "SPI_MO",
 		MTK_EINT_FUNCTION(0, 51),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO51"),
 		MTK_FUNCTION(1, "SPI_MO"),
 		MTK_FUNCTION(2, "SPI_MI"),
@@ -601,32 +597,32 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[26]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(52, "SDA1"),
-		NULL, "mt8167",
+		52, "SDA1",
 		MTK_EINT_FUNCTION(0, 52),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO52"),
 		MTK_FUNCTION(1, "SDA1_0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(53, "SCL1"),
-		NULL, "mt8167",
+		53, "SCL1",
 		MTK_EINT_FUNCTION(0, 53),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO53"),
 		MTK_FUNCTION(1, "SCL1_0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(54, "DISP_PWM"),
-		NULL, "mt8167",
+		54, "DISP_PWM",
 		MTK_EINT_FUNCTION(0, 54),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO54"),
 		MTK_FUNCTION(1, "DISP_PWM"),
 		MTK_FUNCTION(2, "PWM_B"),
 		MTK_FUNCTION(7, "DBG_MON_B[2]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(55, "I2S_DATA_IN"),
-		NULL, "mt8167",
+		55, "I2S_DATA_IN",
 		MTK_EINT_FUNCTION(0, 55),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO55"),
 		MTK_FUNCTION(1, "I2S0_DI"),
 		MTK_FUNCTION(2, "UCTS0"),
@@ -637,9 +633,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[28]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(56, "I2S_LRCK"),
-		NULL, "mt8167",
+		56, "I2S_LRCK",
 		MTK_EINT_FUNCTION(0, 56),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO56"),
 		MTK_FUNCTION(1, "I2S0_LRCK"),
 		MTK_FUNCTION(3, "I2S3_LRCK"),
@@ -649,9 +645,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[29]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(57, "I2S_BCK"),
-		NULL, "mt8167",
+		57, "I2S_BCK",
 		MTK_EINT_FUNCTION(0, 57),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO57"),
 		MTK_FUNCTION(1, "I2S0_BCK"),
 		MTK_FUNCTION(2, "URTS0"),
@@ -662,91 +658,91 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[30]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(58, "SDA0"),
-		NULL, "mt8167",
+		58, "SDA0",
 		MTK_EINT_FUNCTION(0, 58),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO58"),
 		MTK_FUNCTION(1, "SDA0_0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(59, "SCL0"),
-		NULL, "mt8167",
+		59, "SCL0",
 		MTK_EINT_FUNCTION(0, 59),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO59"),
 		MTK_FUNCTION(1, "SCL0_0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(60, "SDA2"),
-		NULL, "mt8167",
+		60, "SDA2",
 		MTK_EINT_FUNCTION(0, 60),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO60"),
 		MTK_FUNCTION(1, "SDA2_0"),
 		MTK_FUNCTION(2, "PWM_B")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(61, "SCL2"),
-		NULL, "mt8167",
+		61, "SCL2",
 		MTK_EINT_FUNCTION(0, 61),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO61"),
 		MTK_FUNCTION(1, "SCL2_0"),
 		MTK_FUNCTION(2, "PWM_C")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(62, "URXD0"),
-		NULL, "mt8167",
+		62, "URXD0",
 		MTK_EINT_FUNCTION(0, 62),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO62"),
 		MTK_FUNCTION(1, "URXD0"),
 		MTK_FUNCTION(2, "UTXD0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(63, "UTXD0"),
-		NULL, "mt8167",
+		63, "UTXD0",
 		MTK_EINT_FUNCTION(0, 63),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO63"),
 		MTK_FUNCTION(1, "UTXD0"),
 		MTK_FUNCTION(2, "URXD0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(64, "URXD1"),
-		NULL, "mt8167",
+		64, "URXD1",
 		MTK_EINT_FUNCTION(0, 64),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO64"),
 		MTK_FUNCTION(1, "URXD1"),
 		MTK_FUNCTION(2, "UTXD1"),
 		MTK_FUNCTION(7, "DBG_MON_A[27]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(65, "UTXD1"),
-		NULL, "mt8167",
+		65, "UTXD1",
 		MTK_EINT_FUNCTION(0, 65),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO65"),
 		MTK_FUNCTION(1, "UTXD1"),
 		MTK_FUNCTION(2, "URXD1"),
 		MTK_FUNCTION(7, "DBG_MON_A[31]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(66, "LCM_RST"),
-		NULL, "mt8167",
+		66, "LCM_RST",
 		MTK_EINT_FUNCTION(0, 66),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO66"),
 		MTK_FUNCTION(1, "LCM_RST"),
 		MTK_FUNCTION(3, "I2S0_MCK"),
 		MTK_FUNCTION(7, "DBG_MON_B[3]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(67, "DSI_TE"),
-		NULL, "mt8167",
+		67, "DSI_TE",
 		MTK_EINT_FUNCTION(0, 67),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO67"),
 		MTK_FUNCTION(1, "DSI_TE"),
 		MTK_FUNCTION(3, "I2S_8CH_MCK"),
 		MTK_FUNCTION(7, "DBG_MON_B[14]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(68, "MSDC2_CMD"),
-		NULL, "mt8167",
+		68, "MSDC2_CMD",
 		MTK_EINT_FUNCTION(0, 68),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO68"),
 		MTK_FUNCTION(1, "MSDC2_CMD"),
 		MTK_FUNCTION(2, "I2S_8CH_DO4"),
@@ -756,9 +752,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[15]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(69, "MSDC2_CLK"),
-		NULL, "mt8167",
+		69, "MSDC2_CLK",
 		MTK_EINT_FUNCTION(0, 69),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO69"),
 		MTK_FUNCTION(1, "MSDC2_CLK"),
 		MTK_FUNCTION(2, "I2S_8CH_DO3"),
@@ -769,9 +765,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[16]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(70, "MSDC2_DAT0"),
-		NULL, "mt8167",
+		70, "MSDC2_DAT0",
 		MTK_EINT_FUNCTION(0, 70),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO70"),
 		MTK_FUNCTION(1, "MSDC2_DAT0"),
 		MTK_FUNCTION(2, "I2S_8CH_DO2"),
@@ -781,9 +777,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[17]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(71, "MSDC2_DAT1"),
-		NULL, "mt8167",
+		71, "MSDC2_DAT1",
 		MTK_EINT_FUNCTION(0, 71),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO71"),
 		MTK_FUNCTION(1, "MSDC2_DAT1"),
 		MTK_FUNCTION(2, "I2S_8CH_DO1"),
@@ -794,9 +790,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[18]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(72, "MSDC2_DAT2"),
-		NULL, "mt8167",
+		72, "MSDC2_DAT2",
 		MTK_EINT_FUNCTION(0, 72),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO72"),
 		MTK_FUNCTION(1, "MSDC2_DAT2"),
 		MTK_FUNCTION(2, "I2S_8CH_LRCK"),
@@ -807,9 +803,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[19]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(73, "MSDC2_DAT3"),
-		NULL, "mt8167",
+		73, "MSDC2_DAT3",
 		MTK_EINT_FUNCTION(0, 73),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO73"),
 		MTK_FUNCTION(1, "MSDC2_DAT3"),
 		MTK_FUNCTION(2, "I2S_8CH_BCK"),
@@ -820,203 +816,203 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[20]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(74, "TDN3"),
-		NULL, "mt8167",
+		74, "TDN3",
 		MTK_EINT_FUNCTION(0, 74),
-		MTK_FUNCTION(0, "GPI74"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO74"),
 		MTK_FUNCTION(1, "TDN3")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(75, "TDP3"),
-		NULL, "mt8167",
+		75, "TDP3",
 		MTK_EINT_FUNCTION(0, 75),
-		MTK_FUNCTION(0, "GPI75"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO75"),
 		MTK_FUNCTION(1, "TDP3")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(76, "TDN2"),
-		NULL, "mt8167",
+		76, "TDN2",
 		MTK_EINT_FUNCTION(0, 76),
-		MTK_FUNCTION(0, "GPI76"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO76"),
 		MTK_FUNCTION(1, "TDN2")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(77, "TDP2"),
-		NULL, "mt8167",
+		77, "TDP2",
 		MTK_EINT_FUNCTION(0, 77),
-		MTK_FUNCTION(0, "GPI77"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO77"),
 		MTK_FUNCTION(1, "TDP2")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(78, "TCN"),
-		NULL, "mt8167",
+		78, "TCN",
 		MTK_EINT_FUNCTION(0, 78),
-		MTK_FUNCTION(0, "GPI78"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO78"),
 		MTK_FUNCTION(1, "TCN")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(79, "TCP"),
-		NULL, "mt8167",
+		79, "TCP",
 		MTK_EINT_FUNCTION(0, 79),
-		MTK_FUNCTION(0, "GPI79"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO79"),
 		MTK_FUNCTION(1, "TCP")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(80, "TDN1"),
-		NULL, "mt8167",
+		80, "TDN1",
 		MTK_EINT_FUNCTION(0, 80),
-		MTK_FUNCTION(0, "GPI80"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO80"),
 		MTK_FUNCTION(1, "TDN1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(81, "TDP1"),
-		NULL, "mt8167",
+		81, "TDP1",
 		MTK_EINT_FUNCTION(0, 81),
-		MTK_FUNCTION(0, "GPI81"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO81"),
 		MTK_FUNCTION(1, "TDP1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(82, "TDN0"),
-		NULL, "mt8167",
+		82, "TDN0",
 		MTK_EINT_FUNCTION(0, 82),
-		MTK_FUNCTION(0, "GPI82"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO82"),
 		MTK_FUNCTION(1, "TDN0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(83, "TDP0"),
-		NULL, "mt8167",
+		83, "TDP0",
 		MTK_EINT_FUNCTION(0, 83),
-		MTK_FUNCTION(0, "GPI83"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO83"),
 		MTK_FUNCTION(1, "TDP0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(84, "RDN0"),
-		NULL, "mt8167",
+		84, "RDN0",
 		MTK_EINT_FUNCTION(0, 84),
-		MTK_FUNCTION(0, "GPI84"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO84"),
 		MTK_FUNCTION(1, "RDN0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(85, "RDP0"),
-		NULL, "mt8167",
+		85, "RDP0",
 		MTK_EINT_FUNCTION(0, 85),
-		MTK_FUNCTION(0, "GPI85"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO85"),
 		MTK_FUNCTION(1, "RDP0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(86, "RDN1"),
-		NULL, "mt8167",
+		86, "RDN1",
 		MTK_EINT_FUNCTION(0, 86),
-		MTK_FUNCTION(0, "GPI86"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO86"),
 		MTK_FUNCTION(1, "RDN1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(87, "RDP1"),
-		NULL, "mt8167",
+		87, "RDP1",
 		MTK_EINT_FUNCTION(0, 87),
-		MTK_FUNCTION(0, "GPI87"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO87"),
 		MTK_FUNCTION(1, "RDP1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(88, "RCN"),
-		NULL, "mt8167",
+		88, "RCN",
 		MTK_EINT_FUNCTION(0, 88),
-		MTK_FUNCTION(0, "GPI88"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO88"),
 		MTK_FUNCTION(1, "RCN")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(89, "RCP"),
-		NULL, "mt8167",
+		89, "RCP",
 		MTK_EINT_FUNCTION(0, 89),
-		MTK_FUNCTION(0, "GPI89"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO89"),
 		MTK_FUNCTION(1, "RCP")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(90, "RDN2"),
-		NULL, "mt8167",
+		90, "RDN2",
 		MTK_EINT_FUNCTION(0, 90),
-		MTK_FUNCTION(0, "GPI90"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO90"),
 		MTK_FUNCTION(1, "RDN2"),
 		MTK_FUNCTION(2, "CMDAT8")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(91, "RDP2"),
-		NULL, "mt8167",
+		91, "RDP2",
 		MTK_EINT_FUNCTION(0, 91),
-		MTK_FUNCTION(0, "GPI91"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO91"),
 		MTK_FUNCTION(1, "RDP2"),
 		MTK_FUNCTION(2, "CMDAT9")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(92, "RDN3"),
-		NULL, "mt8167",
+		92, "RDN3",
 		MTK_EINT_FUNCTION(0, 92),
-		MTK_FUNCTION(0, "GPI92"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO92"),
 		MTK_FUNCTION(1, "RDN3"),
 		MTK_FUNCTION(2, "CMDAT4")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(93, "RDP3"),
-		NULL, "mt8167",
+		93, "RDP3",
 		MTK_EINT_FUNCTION(0, 93),
-		MTK_FUNCTION(0, "GPI93"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO93"),
 		MTK_FUNCTION(1, "RDP3"),
 		MTK_FUNCTION(2, "CMDAT5")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(94, "RCN_A"),
-		NULL, "mt8167",
+		94, "RCN_A",
 		MTK_EINT_FUNCTION(0, 94),
-		MTK_FUNCTION(0, "GPI94"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO94"),
 		MTK_FUNCTION(1, "RCN_A"),
 		MTK_FUNCTION(2, "CMDAT6")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(95, "RCP_A"),
-		NULL, "mt8167",
+		95, "RCP_A",
 		MTK_EINT_FUNCTION(0, 95),
-		MTK_FUNCTION(0, "GPI95"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO95"),
 		MTK_FUNCTION(1, "RCP_A"),
 		MTK_FUNCTION(2, "CMDAT7")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(96, "RDN1_A"),
-		NULL, "mt8167",
+		96, "RDN1_A",
 		MTK_EINT_FUNCTION(0, 96),
-		MTK_FUNCTION(0, "GPI96"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO96"),
 		MTK_FUNCTION(1, "RDN1_A"),
 		MTK_FUNCTION(2, "CMDAT2"),
 		MTK_FUNCTION(3, "CMCSD2")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(97, "RDP1_A"),
-		NULL, "mt8167",
+		97, "RDP1_A",
 		MTK_EINT_FUNCTION(0, 97),
-		MTK_FUNCTION(0, "GPI97"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO97"),
 		MTK_FUNCTION(1, "RDP1_A"),
 		MTK_FUNCTION(2, "CMDAT3"),
 		MTK_FUNCTION(3, "CMCSD3")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(98, "RDN0_A"),
-		NULL, "mt8167",
+		98, "RDN0_A",
 		MTK_EINT_FUNCTION(0, 98),
-		MTK_FUNCTION(0, "GPI98"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO98"),
 		MTK_FUNCTION(1, "RDN0_A"),
 		MTK_FUNCTION(2, "CMHSYNC")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(99, "RDP0_A"),
-		NULL, "mt8167",
+		99, "RDP0_A",
 		MTK_EINT_FUNCTION(0, 99),
-		MTK_FUNCTION(0, "GPI99"),
+		DRV_GRP0, // N/A
+		MTK_FUNCTION(0, "GPIO99"),
 		MTK_FUNCTION(1, "RDP0_A"),
 		MTK_FUNCTION(2, "CMVSYNC")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(100, "CMDAT0"),
-		NULL, "mt8167",
+		100, "CMDAT0",
 		MTK_EINT_FUNCTION(0, 100),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO100"),
 		MTK_FUNCTION(1, "CMDAT0"),
 		MTK_FUNCTION(2, "CMCSD0"),
@@ -1025,9 +1021,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[21]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(101, "CMDAT1"),
-		NULL, "mt8167",
+		101, "CMDAT1",
 		MTK_EINT_FUNCTION(0, 101),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO101"),
 		MTK_FUNCTION(1, "CMDAT1"),
 		MTK_FUNCTION(2, "CMCSD1"),
@@ -1037,9 +1033,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[22]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(102, "CMMCLK"),
-		NULL, "mt8167",
+		102, "CMMCLK",
 		MTK_EINT_FUNCTION(0, 102),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO102"),
 		MTK_FUNCTION(1, "CMMCLK"),
 		MTK_FUNCTION(3, "ANT_SEL4"),
@@ -1047,29 +1043,29 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[23]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(103, "CMPCLK"),
-		NULL, "mt8167",
+		103, "CMPCLK",
 		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO103"),
 		MTK_FUNCTION(1, "CMPCLK"),
 		MTK_FUNCTION(2, "CMCSK"),
 		MTK_FUNCTION(3, "ANT_SEL5"),
-		MTK_FUNCTION(5, " TDM_RX_DI"),
+		MTK_FUNCTION(5, "TDM_RX_DI"),
 		MTK_FUNCTION(7, "DBG_MON_B[24]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(104, "MSDC1_CMD"),
-		NULL, "mt8167",
+		104, "MSDC1_CMD",
 		MTK_EINT_FUNCTION(0, 104),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO104"),
 		MTK_FUNCTION(1, "MSDC1_CMD"),
 		MTK_FUNCTION(4, "SQICS"),
 		MTK_FUNCTION(7, "DBG_MON_B[25]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(105, "MSDC1_CLK"),
-		NULL, "mt8167",
+		105, "MSDC1_CLK",
 		MTK_EINT_FUNCTION(0, 105),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO105"),
 		MTK_FUNCTION(1, "MSDC1_CLK"),
 		MTK_FUNCTION(2, "UDI_NTRST_XI"),
@@ -1079,9 +1075,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[26]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(106, "MSDC1_DAT0"),
-		NULL, "mt8167",
+		106, "MSDC1_DAT0",
 		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO106"),
 		MTK_FUNCTION(1, "MSDC1_DAT0"),
 		MTK_FUNCTION(2, "UDI_TMS_XI"),
@@ -1091,9 +1087,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[27]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(107, "MSDC1_DAT1"),
-		NULL, "mt8167",
+		107, "MSDC1_DAT1",
 		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO107"),
 		MTK_FUNCTION(1, "MSDC1_DAT1"),
 		MTK_FUNCTION(2, "UDI_TCK_XI"),
@@ -1103,9 +1099,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[28]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(108, "MSDC1_DAT2"),
-		NULL, "mt8167",
+		108, "MSDC1_DAT2",
 		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO108"),
 		MTK_FUNCTION(1, "MSDC1_DAT2"),
 		MTK_FUNCTION(2, "UDI_TDI_XI"),
@@ -1115,9 +1111,9 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[29]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(109, "MSDC1_DAT3"),
-		NULL, "mt8167",
+		109, "MSDC1_DAT3",
 		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO109"),
 		MTK_FUNCTION(1, "MSDC1_DAT3"),
 		MTK_FUNCTION(2, "UDI_TDO"),
@@ -1127,119 +1123,119 @@ static const struct mtk_desc_pin mtk_pins_mt8167[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[30]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(110, "MSDC0_DAT7"),
-		NULL, "mt8167",
+		110, "MSDC0_DAT7",
 		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO110"),
 		MTK_FUNCTION(1, "MSDC0_DAT7"),
 		MTK_FUNCTION(4, "NLD7")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(111, "MSDC0_DAT6"),
-		NULL, "mt8167",
+		111, "MSDC0_DAT6",
 		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO111"),
 		MTK_FUNCTION(1, "MSDC0_DAT6"),
 		MTK_FUNCTION(4, "NLD6")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(112, "MSDC0_DAT5"),
-		NULL, "mt8167",
+		112, "MSDC0_DAT5",
 		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO112"),
 		MTK_FUNCTION(1, "MSDC0_DAT5"),
 		MTK_FUNCTION(4, "NLD4")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(113, "MSDC0_DAT4"),
-		NULL, "mt8167",
+		113, "MSDC0_DAT4",
 		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO113"),
 		MTK_FUNCTION(1, "MSDC0_DAT4"),
 		MTK_FUNCTION(4, "NLD3")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(114, "MSDC0_RSTB"),
-		NULL, "mt8167",
+		114, "MSDC0_RSTB",
 		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO114"),
 		MTK_FUNCTION(1, "MSDC0_RSTB"),
 		MTK_FUNCTION(4, "NLD0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(115, "MSDC0_CMD"),
-		NULL, "mt8167",
+		115, "MSDC0_CMD",
 		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO115"),
 		MTK_FUNCTION(1, "MSDC0_CMD"),
 		MTK_FUNCTION(4, "NALE")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(116, "MSDC0_CLK"),
-		NULL, "mt8167",
+		116, "MSDC0_CLK",
 		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO116"),
 		MTK_FUNCTION(1, "MSDC0_CLK"),
 		MTK_FUNCTION(4, "NWEB")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(117, "MSDC0_DAT3"),
-		NULL, "mt8167",
+		117, "MSDC0_DAT3",
 		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO117"),
 		MTK_FUNCTION(1, "MSDC0_DAT3"),
 		MTK_FUNCTION(4, "NLD1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(118, "MSDC0_DAT2"),
-		NULL, "mt8167",
+		118, "MSDC0_DAT2",
 		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO118"),
 		MTK_FUNCTION(1, "MSDC0_DAT2"),
 		MTK_FUNCTION(4, "NLD5")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(119, "MSDC0_DAT1"),
-		NULL, "mt8167",
+		119, "MSDC0_DAT1",
 		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO119"),
 		MTK_FUNCTION(1, "MSDC0_DAT1"),
 		MTK_FUNCTION(4, "NLD8")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(120, "MSDC0_DAT0"),
-		NULL, "mt8167",
+		120, "MSDC0_DAT0",
 		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO120"),
 		MTK_FUNCTION(1, "MSDC0_DAT0"),
 		MTK_FUNCTION(4, "WATCHDOG"),
 		MTK_FUNCTION(5, "NLD2")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(121, "CEC"),
-		NULL, "mt8167",
+		121, "CEC",
 		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO121"),
 		MTK_FUNCTION(1, "CEC")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(122, "HTPLG"),
-		NULL, "mt8167",
+		122, "HTPLG",
 		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO122"),
 		MTK_FUNCTION(1, "HTPLG")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(123, "HDMISCK"),
-		NULL, "mt8167",
+		123, "HDMISCK",
 		MTK_EINT_FUNCTION(0, 123),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO123"),
 		MTK_FUNCTION(1, "HDMISCK")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(124, "HDMISD"),
-		NULL, "mt8167",
+		124, "HDMISD",
 		MTK_EINT_FUNCTION(0, 124),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO124"),
 		MTK_FUNCTION(1, "HDMISD")
 	),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h
index f7a4c6e4a026..fc4f8401b3c6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h
@@ -1,18 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2019 MediaTek Inc.
- */
 #ifndef __PINCTRL_MTK_MT8516_H
 #define __PINCTRL_MTK_MT8516_H
 
-#include <linux/pinctrl/pinctrl.h>
-#include "pinctrl-mtk-common.h"
+#include "pinctrl-paris.h"
 
-static const struct mtk_desc_pin mtk_pins_mt8516[] = {
+static const struct mtk_pin_desc mtk_pins_mt8516[] = {
 	MTK_PIN(
-		PINCTRL_PIN(0, "EINT0"),
-		NULL, "mt8516",
+		0, "EINT0",
 		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO0"),
 		MTK_FUNCTION(1, "PWM_B"),
 		MTK_FUNCTION(3, "I2S2_BCK"),
@@ -21,9 +17,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[6]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(1, "EINT1"),
-		NULL, "mt8516",
+		1, "EINT1",
 		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO1"),
 		MTK_FUNCTION(1, "PWM_C"),
 		MTK_FUNCTION(3, "I2S2_DI"),
@@ -33,9 +29,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[7]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(2, "EINT2"),
-		NULL, "mt8516",
+		2, "EINT2",
 		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO2"),
 		MTK_FUNCTION(1, "CLKM0"),
 		MTK_FUNCTION(3, "I2S2_LRCK"),
@@ -45,9 +41,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[8]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(3, "EINT3"),
-		NULL, "mt8516",
+		3, "EINT3",
 		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO3"),
 		MTK_FUNCTION(1, "CLKM1"),
 		MTK_FUNCTION(3, "SPI_MI"),
@@ -57,9 +53,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[9]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(4, "EINT4"),
-		NULL, "mt8516",
+		4, "EINT4",
 		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO4"),
 		MTK_FUNCTION(1, "CLKM2"),
 		MTK_FUNCTION(3, "SPI_MO"),
@@ -69,9 +65,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[10]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(5, "EINT5"),
-		NULL, "mt8516",
+		5, "EINT5",
 		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO5"),
 		MTK_FUNCTION(1, "UCTS2"),
 		MTK_FUNCTION(3, "SPI_CSB"),
@@ -81,9 +77,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[11]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(6, "EINT6"),
-		NULL, "mt8516",
+		6, "EINT6",
 		MTK_EINT_FUNCTION(0, 6),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO6"),
 		MTK_FUNCTION(1, "URTS2"),
 		MTK_FUNCTION(3, "SPI_CLK"),
@@ -92,9 +88,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[12]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(7, "EINT7"),
-		NULL, "mt8516",
+		7, "EINT7",
 		MTK_EINT_FUNCTION(0, 7),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO7"),
 		MTK_FUNCTION(1, "SQIRST"),
 		MTK_FUNCTION(3, "SDA1_0"),
@@ -104,9 +100,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[13]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(8, "EINT8"),
-		NULL, "mt8516",
+		8, "EINT8",
 		MTK_EINT_FUNCTION(0, 8),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO8"),
 		MTK_FUNCTION(1, "SQICK"),
 		MTK_FUNCTION(2, "CLKM3"),
@@ -116,9 +112,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[14]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(9, "EINT9"),
-		NULL, "mt8516",
+		9, "EINT9",
 		MTK_EINT_FUNCTION(0, 9),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO9"),
 		MTK_FUNCTION(1, "CLKM4"),
 		MTK_FUNCTION(2, "SDA2_0"),
@@ -128,9 +124,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[15]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(10, "EINT10"),
-		NULL, "mt8516",
+		10, "EINT10",
 		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO10"),
 		MTK_FUNCTION(1, "CLKM5"),
 		MTK_FUNCTION(2, "SCL2_0"),
@@ -140,9 +136,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[16]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(11, "EINT11"),
-		NULL, "mt8516",
+		11, "EINT11",
 		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO11"),
 		MTK_FUNCTION(1, "CLKM4"),
 		MTK_FUNCTION(2, "PWM_C"),
@@ -152,9 +148,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[17]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(12, "EINT12"),
-		NULL, "mt8516",
+		12, "EINT12",
 		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO12"),
 		MTK_FUNCTION(1, "CLKM5"),
 		MTK_FUNCTION(2, "PWM_A"),
@@ -164,9 +160,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[18]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(13, "EINT13"),
-		NULL, "mt8516",
+		13, "EINT13",
 		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO13"),
 		MTK_FUNCTION(3, "TSF_IN"),
 		MTK_FUNCTION(4, "ANT_SEL5"),
@@ -174,9 +170,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[19]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(14, "EINT14"),
-		NULL, "mt8516",
+		14, "EINT14",
 		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO14"),
 		MTK_FUNCTION(2, "I2S_8CH_DO1"),
 		MTK_FUNCTION(3, "TDM_RX_MCK"),
@@ -186,9 +182,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[8]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(15, "EINT15"),
-		NULL, "mt8516",
+		15, "EINT15",
 		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO15"),
 		MTK_FUNCTION(2, "I2S_8CH_LRCK"),
 		MTK_FUNCTION(3, "TDM_RX_BCK"),
@@ -198,9 +194,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[9]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(16, "EINT16"),
-		NULL, "mt8516",
+		16, "EINT16",
 		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO16"),
 		MTK_FUNCTION(2, "I2S_8CH_BCK"),
 		MTK_FUNCTION(3, "TDM_RX_LRCK"),
@@ -210,9 +206,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[10]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(17, "EINT17"),
-		NULL, "mt8516",
+		17, "EINT17",
 		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO17"),
 		MTK_FUNCTION(2, "I2S_8CH_MCK"),
 		MTK_FUNCTION(3, "TDM_RX_DI"),
@@ -222,9 +218,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[11]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(18, "EINT18"),
-		NULL, "mt8516",
+		18, "EINT18",
 		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO18"),
 		MTK_FUNCTION(2, "USB_DRVVBUS"),
 		MTK_FUNCTION(3, "I2S3_LRCK"),
@@ -234,9 +230,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[20]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(19, "EINT19"),
-		NULL, "mt8516",
+		19, "EINT19",
 		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO19"),
 		MTK_FUNCTION(1, "UCTS1"),
 		MTK_FUNCTION(2, "IDDIG"),
@@ -247,9 +243,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[21]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(20, "EINT20"),
-		NULL, "mt8516",
+		20, "EINT20",
 		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO20"),
 		MTK_FUNCTION(1, "URTS1"),
 		MTK_FUNCTION(3, "I2S3_DO"),
@@ -259,9 +255,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[22]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(21, "EINT21"),
-		NULL, "mt8516",
+		21, "EINT21",
 		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO21"),
 		MTK_FUNCTION(1, "NRNB"),
 		MTK_FUNCTION(2, "ANT_SEL0"),
@@ -269,9 +265,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[31]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(22, "EINT22"),
-		NULL, "mt8516",
+		22, "EINT22",
 		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO22"),
 		MTK_FUNCTION(2, "I2S_8CH_DO2"),
 		MTK_FUNCTION(3, "TSF_IN"),
@@ -281,9 +277,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[12]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(23, "EINT23"),
-		NULL, "mt8516",
+		23, "EINT23",
 		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO23"),
 		MTK_FUNCTION(2, "I2S_8CH_DO3"),
 		MTK_FUNCTION(3, "CLKM0"),
@@ -293,9 +289,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[13]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(24, "EINT24"),
-		NULL, "mt8516",
+		24, "EINT24",
 		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO24"),
 		MTK_FUNCTION(3, "ANT_SEL1"),
 		MTK_FUNCTION(4, "UCTS2"),
@@ -304,9 +300,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[0]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(25, "EINT25"),
-		NULL, "mt8516",
+		25, "EINT25",
 		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO25"),
 		MTK_FUNCTION(3, "ANT_SEL0"),
 		MTK_FUNCTION(4, "URTS2"),
@@ -315,25 +311,25 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[1]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(26, "PWRAP_SPI0_MI"),
-		NULL, "mt8516",
+		26, "PWRAP_SPI0_MI",
 		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO26"),
 		MTK_FUNCTION(1, "PWRAP_SPI0_MO"),
 		MTK_FUNCTION(2, "PWRAP_SPI0_MI")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(27, "PWRAP_SPI0_MO"),
-		NULL, "mt8516",
+		27, "PWRAP_SPI0_MO",
 		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO27"),
 		MTK_FUNCTION(1, "PWRAP_SPI0_MI"),
 		MTK_FUNCTION(2, "PWRAP_SPI0_MO")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(28, "PWRAP_INT"),
-		NULL, "mt8516",
+		28, "PWRAP_INT",
 		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO28"),
 		MTK_FUNCTION(1, "I2S0_MCK"),
 		MTK_FUNCTION(4, "I2S_8CH_MCK"),
@@ -341,44 +337,44 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(6, "I2S3_MCK")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(29, "PWRAP_SPI0_CK"),
-		NULL, "mt8516",
+		29, "PWRAP_SPI0_CK",
 		MTK_EINT_FUNCTION(0, 29),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO29"),
 		MTK_FUNCTION(1, "PWRAP_SPI0_CK")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(30, "PWRAP_SPI0_CSN"),
-		NULL, "mt8516",
+		30, "PWRAP_SPI0_CSN",
 		MTK_EINT_FUNCTION(0, 30),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO30"),
 		MTK_FUNCTION(1, "PWRAP_SPI0_CSN")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(31, "RTC32K_CK"),
-		NULL, "mt8516",
+		31, "RTC32K_CK",
 		MTK_EINT_FUNCTION(0, 31),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO31"),
 		MTK_FUNCTION(1, "RTC32K_CK")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(32, "WATCHDOG"),
-		NULL, "mt8516",
+		32, "WATCHDOG",
 		MTK_EINT_FUNCTION(0, 32),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO32"),
 		MTK_FUNCTION(1, "WATCHDOG")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(33, "SRCLKENA"),
-		NULL, "mt8516",
+		33, "SRCLKENA",
 		MTK_EINT_FUNCTION(0, 33),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO33"),
 		MTK_FUNCTION(1, "SRCLKENA0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(34, "URXD2"),
-		NULL, "mt8516",
+		34, "URXD2",
 		MTK_EINT_FUNCTION(0, 34),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO34"),
 		MTK_FUNCTION(1, "URXD2"),
 		MTK_FUNCTION(3, "UTXD2"),
@@ -387,9 +383,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[0]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(35, "UTXD2"),
-		NULL, "mt8516",
+		35, "UTXD2",
 		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO35"),
 		MTK_FUNCTION(1, "UTXD2"),
 		MTK_FUNCTION(3, "URXD2"),
@@ -398,9 +394,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[1]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(36, "MRG_CLK"),
-		NULL, "mt8516",
+		36, "MRG_CLK",
 		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO36"),
 		MTK_FUNCTION(1, "MRG_CLK"),
 		MTK_FUNCTION(3, "I2S0_BCK"),
@@ -410,9 +406,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[2]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(37, "MRG_SYNC"),
-		NULL, "mt8516",
+		37, "MRG_SYNC",
 		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO37"),
 		MTK_FUNCTION(1, "MRG_SYNC"),
 		MTK_FUNCTION(3, "I2S0_LRCK"),
@@ -422,9 +418,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[3]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(38, "MRG_DI"),
-		NULL, "mt8516",
+		38, "MRG_DI",
 		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO38"),
 		MTK_FUNCTION(1, "MRG_DI"),
 		MTK_FUNCTION(3, "I2S0_DI"),
@@ -434,9 +430,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[4]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(39, "MRG_DO"),
-		NULL, "mt8516",
+		39, "MRG_DO",
 		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO39"),
 		MTK_FUNCTION(1, "MRG_DO"),
 		MTK_FUNCTION(3, "I2S0_MCK"),
@@ -446,17 +442,17 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[5]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(40, "KPROW0"),
-		NULL, "mt8516",
+		40, "KPROW0",
 		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO40"),
 		MTK_FUNCTION(1, "KPROW0"),
 		MTK_FUNCTION(7, "DBG_MON_B[4]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(41, "KPROW1"),
-		NULL, "mt8516",
+		41, "KPROW1",
 		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO41"),
 		MTK_FUNCTION(1, "KPROW1"),
 		MTK_FUNCTION(2, "IDDIG"),
@@ -464,17 +460,17 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[5]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(42, "KPCOL0"),
-		NULL, "mt8516",
+		42, "KPCOL0",
 		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO42"),
 		MTK_FUNCTION(1, "KPCOL0"),
 		MTK_FUNCTION(7, "DBG_MON_B[6]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(43, "KPCOL1"),
-		NULL, "mt8516",
+		43, "KPCOL1",
 		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO43"),
 		MTK_FUNCTION(1, "KPCOL1"),
 		MTK_FUNCTION(2, "USB_DRVVBUS"),
@@ -483,43 +479,43 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[7]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(44, "JTMS"),
-		NULL, "mt8516",
+		44, "JTMS",
 		MTK_EINT_FUNCTION(0, 44),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO44"),
 		MTK_FUNCTION(1, "JTMS"),
 		MTK_FUNCTION(2, "CONN_MCU_TMS"),
 		MTK_FUNCTION(3, "CONN_MCU_AICE_JMSC")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(45, "JTCK"),
-		NULL, "mt8516",
+		45, "JTCK",
 		MTK_EINT_FUNCTION(0, 45),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO45"),
 		MTK_FUNCTION(1, "JTCK"),
 		MTK_FUNCTION(2, "CONN_MCU_TCK"),
 		MTK_FUNCTION(3, "CONN_MCU_AICE_JCKC")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(46, "JTDI"),
-		NULL, "mt8516",
+		46, "JTDI",
 		MTK_EINT_FUNCTION(0, 46),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO46"),
 		MTK_FUNCTION(1, "JTDI"),
 		MTK_FUNCTION(2, "CONN_MCU_TDI")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(47, "JTDO"),
-		NULL, "mt8516",
+		47, "JTDO",
 		MTK_EINT_FUNCTION(0, 47),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO47"),
 		MTK_FUNCTION(1, "JTDO"),
 		MTK_FUNCTION(2, "CONN_MCU_TDO")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(48, "SPI_CS"),
-		NULL, "mt8516",
+		48, "SPI_CS",
 		MTK_EINT_FUNCTION(0, 48),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO48"),
 		MTK_FUNCTION(1, "SPI_CSB"),
 		MTK_FUNCTION(3, "I2S0_DI"),
@@ -527,9 +523,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[23]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(49, "SPI_CK"),
-		NULL, "mt8516",
+		49, "SPI_CK",
 		MTK_EINT_FUNCTION(0, 49),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO49"),
 		MTK_FUNCTION(1, "SPI_CLK"),
 		MTK_FUNCTION(3, "I2S0_LRCK"),
@@ -537,9 +533,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[24]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(50, "SPI_MI"),
-		NULL, "mt8516",
+		50, "SPI_MI",
 		MTK_EINT_FUNCTION(0, 50),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO50"),
 		MTK_FUNCTION(1, "SPI_MI"),
 		MTK_FUNCTION(2, "SPI_MO"),
@@ -548,9 +544,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[25]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(51, "SPI_MO"),
-		NULL, "mt8516",
+		51, "SPI_MO",
 		MTK_EINT_FUNCTION(0, 51),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO51"),
 		MTK_FUNCTION(1, "SPI_MO"),
 		MTK_FUNCTION(2, "SPI_MI"),
@@ -559,31 +555,31 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[26]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(52, "SDA1"),
-		NULL, "mt8516",
+		52, "SDA1",
 		MTK_EINT_FUNCTION(0, 52),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO52"),
 		MTK_FUNCTION(1, "SDA1_0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(53, "SCL1"),
-		NULL, "mt8516",
+		53, "SCL1",
 		MTK_EINT_FUNCTION(0, 53),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO53"),
 		MTK_FUNCTION(1, "SCL1_0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(54, "GPIO54"),
-		NULL, "mt8516",
+		54, "GPIO54",
 		MTK_EINT_FUNCTION(0, 54),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO54"),
 		MTK_FUNCTION(2, "PWM_B"),
 		MTK_FUNCTION(7, "DBG_MON_B[2]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(55, "I2S_DATA_IN"),
-		NULL, "mt8516",
+		55, "I2S_DATA_IN",
 		MTK_EINT_FUNCTION(0, 55),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO55"),
 		MTK_FUNCTION(1, "I2S0_DI"),
 		MTK_FUNCTION(2, "UCTS0"),
@@ -594,9 +590,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[28]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(56, "I2S_LRCK"),
-		NULL, "mt8516",
+		56, "I2S_LRCK",
 		MTK_EINT_FUNCTION(0, 56),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO56"),
 		MTK_FUNCTION(1, "I2S0_LRCK"),
 		MTK_FUNCTION(3, "I2S3_LRCK"),
@@ -606,9 +602,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[29]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(57, "I2S_BCK"),
-		NULL, "mt8516",
+		57, "I2S_BCK",
 		MTK_EINT_FUNCTION(0, 57),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO57"),
 		MTK_FUNCTION(1, "I2S0_BCK"),
 		MTK_FUNCTION(2, "URTS0"),
@@ -619,90 +615,90 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_A[30]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(58, "SDA0"),
-		NULL, "mt8516",
+		58, "SDA0",
 		MTK_EINT_FUNCTION(0, 58),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO58"),
 		MTK_FUNCTION(1, "SDA0_0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(59, "SCL0"),
-		NULL, "mt8516",
+		59, "SCL0",
 		MTK_EINT_FUNCTION(0, 59),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO59"),
 		MTK_FUNCTION(1, "SCL0_0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(60, "SDA2"),
-		NULL, "mt8516",
+		60, "SDA2",
 		MTK_EINT_FUNCTION(0, 60),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO60"),
 		MTK_FUNCTION(1, "SDA2_0"),
 		MTK_FUNCTION(2, "PWM_B")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(61, "SCL2"),
-		NULL, "mt8516",
+		61, "SCL2",
 		MTK_EINT_FUNCTION(0, 61),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO61"),
 		MTK_FUNCTION(1, "SCL2_0"),
 		MTK_FUNCTION(2, "PWM_C")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(62, "URXD0"),
-		NULL, "mt8516",
+		62, "URXD0",
 		MTK_EINT_FUNCTION(0, 62),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO62"),
 		MTK_FUNCTION(1, "URXD0"),
 		MTK_FUNCTION(2, "UTXD0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(63, "UTXD0"),
-		NULL, "mt8516",
+		63, "UTXD0",
 		MTK_EINT_FUNCTION(0, 63),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO63"),
 		MTK_FUNCTION(1, "UTXD0"),
 		MTK_FUNCTION(2, "URXD0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(64, "URXD1"),
-		NULL, "mt8516",
+		64, "URXD1",
 		MTK_EINT_FUNCTION(0, 64),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO64"),
 		MTK_FUNCTION(1, "URXD1"),
 		MTK_FUNCTION(2, "UTXD1"),
 		MTK_FUNCTION(7, "DBG_MON_A[27]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(65, "UTXD1"),
-		NULL, "mt8516",
+		65, "UTXD1",
 		MTK_EINT_FUNCTION(0, 65),
+		DRV_GRP0,
 		MTK_FUNCTION(0, "GPIO65"),
 		MTK_FUNCTION(1, "UTXD1"),
 		MTK_FUNCTION(2, "URXD1"),
 		MTK_FUNCTION(7, "DBG_MON_A[31]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(66, "LCM_RST"),
-		NULL, "mt8516",
+		66, "LCM_RST",
 		MTK_EINT_FUNCTION(0, 66),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO66"),
 		MTK_FUNCTION(1, "LCM_RST"),
 		MTK_FUNCTION(3, "I2S0_MCK"),
 		MTK_FUNCTION(7, "DBG_MON_B[3]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(67, "GPIO67"),
-		NULL, "mt8516",
+		67, "GPIO67",
 		MTK_EINT_FUNCTION(0, 67),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO67"),
 		MTK_FUNCTION(3, "I2S_8CH_MCK"),
 		MTK_FUNCTION(7, "DBG_MON_B[14]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(68, "MSDC2_CMD"),
-		NULL, "mt8516",
+		68, "MSDC2_CMD",
 		MTK_EINT_FUNCTION(0, 68),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO68"),
 		MTK_FUNCTION(1, "MSDC2_CMD"),
 		MTK_FUNCTION(2, "I2S_8CH_DO4"),
@@ -712,9 +708,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[15]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(69, "MSDC2_CLK"),
-		NULL, "mt8516",
+		69, "MSDC2_CLK",
 		MTK_EINT_FUNCTION(0, 69),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO69"),
 		MTK_FUNCTION(1, "MSDC2_CLK"),
 		MTK_FUNCTION(2, "I2S_8CH_DO3"),
@@ -724,9 +720,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[16]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(70, "MSDC2_DAT0"),
-		NULL, "mt8516",
+		70, "MSDC2_DAT0",
 		MTK_EINT_FUNCTION(0, 70),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO70"),
 		MTK_FUNCTION(1, "MSDC2_DAT0"),
 		MTK_FUNCTION(2, "I2S_8CH_DO2"),
@@ -735,9 +731,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[17]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(71, "MSDC2_DAT1"),
-		NULL, "mt8516",
+		71, "MSDC2_DAT1",
 		MTK_EINT_FUNCTION(0, 71),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO71"),
 		MTK_FUNCTION(1, "MSDC2_DAT1"),
 		MTK_FUNCTION(2, "I2S_8CH_DO1"),
@@ -748,9 +744,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[18]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(72, "MSDC2_DAT2"),
-		NULL, "mt8516",
+		72, "MSDC2_DAT2",
 		MTK_EINT_FUNCTION(0, 72),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO72"),
 		MTK_FUNCTION(1, "MSDC2_DAT2"),
 		MTK_FUNCTION(2, "I2S_8CH_LRCK"),
@@ -760,9 +756,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[19]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(73, "MSDC2_DAT3"),
-		NULL, "mt8516",
+		73, "MSDC2_DAT3",
 		MTK_EINT_FUNCTION(0, 73),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO73"),
 		MTK_FUNCTION(1, "MSDC2_DAT3"),
 		MTK_FUNCTION(2, "I2S_8CH_BCK"),
@@ -773,203 +769,203 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[20]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(74, "TDN3"),
-		NULL, "mt8516",
+		74, "TDN3",
 		MTK_EINT_FUNCTION(0, 74),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO74"),
 		MTK_FUNCTION(1, "TDN3")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(75, "TDP3"),
-		NULL, "mt8516",
+		75, "TDP3",
 		MTK_EINT_FUNCTION(0, 75),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO75"),
 		MTK_FUNCTION(1, "TDP3")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(76, "TDN2"),
-		NULL, "mt8516",
+		76, "TDN2",
 		MTK_EINT_FUNCTION(0, 76),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO76"),
 		MTK_FUNCTION(1, "TDN2")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(77, "TDP2"),
-		NULL, "mt8516",
+		77, "TDP2",
 		MTK_EINT_FUNCTION(0, 77),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO77"),
 		MTK_FUNCTION(1, "TDP2")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(78, "TCN"),
-		NULL, "mt8516",
+		78, "TCN",
 		MTK_EINT_FUNCTION(0, 78),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO78"),
 		MTK_FUNCTION(1, "TCN")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(79, "TCP"),
-		NULL, "mt8516",
+		79, "TCP",
 		MTK_EINT_FUNCTION(0, 79),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO79"),
 		MTK_FUNCTION(1, "TCP")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(80, "TDN1"),
-		NULL, "mt8516",
+		80, "TDN1",
 		MTK_EINT_FUNCTION(0, 80),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO80"),
 		MTK_FUNCTION(1, "TDN1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(81, "TDP1"),
-		NULL, "mt8516",
+		81, "TDP1",
 		MTK_EINT_FUNCTION(0, 81),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO81"),
 		MTK_FUNCTION(1, "TDP1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(82, "TDN0"),
-		NULL, "mt8516",
+		82, "TDN0",
 		MTK_EINT_FUNCTION(0, 82),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO82"),
 		MTK_FUNCTION(1, "TDN0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(83, "TDP0"),
-		NULL, "mt8516",
+		83, "TDP0",
 		MTK_EINT_FUNCTION(0, 83),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO83"),
 		MTK_FUNCTION(1, "TDP0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(84, "RDN0"),
-		NULL, "mt8516",
+		84, "RDN0",
 		MTK_EINT_FUNCTION(0, 84),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO84"),
 		MTK_FUNCTION(1, "RDN0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(85, "RDP0"),
-		NULL, "mt8516",
+		85, "RDP0",
 		MTK_EINT_FUNCTION(0, 85),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO85"),
 		MTK_FUNCTION(1, "RDP0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(86, "RDN1"),
-		NULL, "mt8516",
+		86, "RDN1",
 		MTK_EINT_FUNCTION(0, 86),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO86"),
 		MTK_FUNCTION(1, "RDN1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(87, "RDP1"),
-		NULL, "mt8516",
+		87, "RDP1",
 		MTK_EINT_FUNCTION(0, 87),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO87"),
 		MTK_FUNCTION(1, "RDP1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(88, "RCN"),
-		NULL, "mt8516",
+		88, "RCN",
 		MTK_EINT_FUNCTION(0, 88),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO88"),
 		MTK_FUNCTION(1, "RCN")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(89, "RCP"),
-		NULL, "mt8516",
+		89, "RCP",
 		MTK_EINT_FUNCTION(0, 89),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO89"),
 		MTK_FUNCTION(1, "RCP")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(90, "RDN2"),
-		NULL, "mt8516",
+		90, "RDN2",
 		MTK_EINT_FUNCTION(0, 90),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO90"),
 		MTK_FUNCTION(1, "RDN2"),
 		MTK_FUNCTION(2, "CMDAT8")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(91, "RDP2"),
-		NULL, "mt8516",
+		91, "RDP2",
 		MTK_EINT_FUNCTION(0, 91),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO91"),
 		MTK_FUNCTION(1, "RDP2"),
 		MTK_FUNCTION(2, "CMDAT9")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(92, "RDN3"),
-		NULL, "mt8516",
+		92, "RDN3",
 		MTK_EINT_FUNCTION(0, 92),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO92"),
 		MTK_FUNCTION(1, "RDN3"),
 		MTK_FUNCTION(2, "CMDAT4")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(93, "RDP3"),
-		NULL, "mt8516",
+		93, "RDP3",
 		MTK_EINT_FUNCTION(0, 93),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO93"),
 		MTK_FUNCTION(1, "RDP3"),
 		MTK_FUNCTION(2, "CMDAT5")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(94, "RCN_A"),
-		NULL, "mt8516",
+		94, "RCN_A",
 		MTK_EINT_FUNCTION(0, 94),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO94"),
 		MTK_FUNCTION(1, "RCN_A"),
 		MTK_FUNCTION(2, "CMDAT6")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(95, "RCP_A"),
-		NULL, "mt8516",
+		95, "RCP_A",
 		MTK_EINT_FUNCTION(0, 95),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO95"),
 		MTK_FUNCTION(1, "RCP_A"),
 		MTK_FUNCTION(2, "CMDAT7")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(96, "RDN1_A"),
-		NULL, "mt8516",
+		96, "RDN1_A",
 		MTK_EINT_FUNCTION(0, 96),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO96"),
 		MTK_FUNCTION(1, "RDN1_A"),
 		MTK_FUNCTION(2, "CMDAT2"),
 		MTK_FUNCTION(3, "CMCSD2")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(97, "RDP1_A"),
-		NULL, "mt8516",
+		97, "RDP1_A",
 		MTK_EINT_FUNCTION(0, 97),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO97"),
 		MTK_FUNCTION(1, "RDP1_A"),
 		MTK_FUNCTION(2, "CMDAT3"),
 		MTK_FUNCTION(3, "CMCSD3")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(98, "RDN0_A"),
-		NULL, "mt8516",
+		98, "RDN0_A",
 		MTK_EINT_FUNCTION(0, 98),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO98"),
 		MTK_FUNCTION(1, "RDN0_A"),
 		MTK_FUNCTION(2, "CMHSYNC")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(99, "RDP0_A"),
-		NULL, "mt8516",
+		99, "RDP0_A",
 		MTK_EINT_FUNCTION(0, 99),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO99"),
 		MTK_FUNCTION(1, "RDP0_A"),
 		MTK_FUNCTION(2, "CMVSYNC")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(100, "CMDAT0"),
-		NULL, "mt8516",
+		100, "CMDAT0",
 		MTK_EINT_FUNCTION(0, 100),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO100"),
 		MTK_FUNCTION(1, "CMDAT0"),
 		MTK_FUNCTION(2, "CMCSD0"),
@@ -978,9 +974,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[21]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(101, "CMDAT1"),
-		NULL, "mt8516",
+		101, "CMDAT1",
 		MTK_EINT_FUNCTION(0, 101),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO101"),
 		MTK_FUNCTION(1, "CMDAT1"),
 		MTK_FUNCTION(2, "CMCSD1"),
@@ -990,9 +986,9 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[22]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(102, "CMMCLK"),
-		NULL, "mt8516",
+		102, "CMMCLK",
 		MTK_EINT_FUNCTION(0, 102),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO102"),
 		MTK_FUNCTION(1, "CMMCLK"),
 		MTK_FUNCTION(3, "ANT_SEL4"),
@@ -1000,181 +996,181 @@ static const struct mtk_desc_pin mtk_pins_mt8516[] = {
 		MTK_FUNCTION(7, "DBG_MON_B[23]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(103, "CMPCLK"),
-		NULL, "mt8516",
+		103, "CMPCLK",
 		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP2,
 		MTK_FUNCTION(0, "GPIO103"),
 		MTK_FUNCTION(1, "CMPCLK"),
 		MTK_FUNCTION(2, "CMCSK"),
 		MTK_FUNCTION(3, "ANT_SEL5"),
-		MTK_FUNCTION(5, " TDM_RX_DI"),
+		MTK_FUNCTION(5, "TDM_RX_DI"),
 		MTK_FUNCTION(7, "DBG_MON_B[24]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(104, "MSDC1_CMD"),
-		NULL, "mt8516",
+		104, "MSDC1_CMD",
 		MTK_EINT_FUNCTION(0, 104),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO104"),
 		MTK_FUNCTION(1, "MSDC1_CMD"),
 		MTK_FUNCTION(4, "SQICS"),
 		MTK_FUNCTION(7, "DBG_MON_B[25]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(105, "MSDC1_CLK"),
-		NULL, "mt8516",
+		105, "MSDC1_CLK",
 		MTK_EINT_FUNCTION(0, 105),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO105"),
 		MTK_FUNCTION(1, "MSDC1_CLK"),
 		MTK_FUNCTION(4, "SQISO"),
 		MTK_FUNCTION(7, "DBG_MON_B[26]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(106, "MSDC1_DAT0"),
-		NULL, "mt8516",
+		106, "MSDC1_DAT0",
 		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO106"),
 		MTK_FUNCTION(1, "MSDC1_DAT0"),
 		MTK_FUNCTION(4, "SQISI"),
 		MTK_FUNCTION(7, "DBG_MON_B[27]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(107, "MSDC1_DAT1"),
-		NULL, "mt8516",
+		107, "MSDC1_DAT1",
 		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO107"),
 		MTK_FUNCTION(1, "MSDC1_DAT1"),
 		MTK_FUNCTION(4, "SQIWP"),
 		MTK_FUNCTION(7, "DBG_MON_B[28]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(108, "MSDC1_DAT2"),
-		NULL, "mt8516",
+		108, "MSDC1_DAT2",
 		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO108"),
 		MTK_FUNCTION(1, "MSDC1_DAT2"),
 		MTK_FUNCTION(4, "SQIRST"),
 		MTK_FUNCTION(7, "DBG_MON_B[29]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(109, "MSDC1_DAT3"),
-		NULL, "mt8516",
+		109, "MSDC1_DAT3",
 		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO109"),
 		MTK_FUNCTION(1, "MSDC1_DAT3"),
-		MTK_FUNCTION(4, "SQICK"), /* WIP */
+		MTK_FUNCTION(4, "SQICK"),
 		MTK_FUNCTION(7, "DBG_MON_B[30]")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(110, "MSDC0_DAT7"),
-		NULL, "mt8516",
+		110, "MSDC0_DAT7",
 		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO110"),
 		MTK_FUNCTION(1, "MSDC0_DAT7"),
 		MTK_FUNCTION(4, "NLD7")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(111, "MSDC0_DAT6"),
-		NULL, "mt8516",
+		111, "MSDC0_DAT6",
 		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO111"),
 		MTK_FUNCTION(1, "MSDC0_DAT6"),
 		MTK_FUNCTION(4, "NLD6")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(112, "MSDC0_DAT5"),
-		NULL, "mt8516",
+		112, "MSDC0_DAT5",
 		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO112"),
 		MTK_FUNCTION(1, "MSDC0_DAT5"),
 		MTK_FUNCTION(4, "NLD4")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(113, "MSDC0_DAT4"),
-		NULL, "mt8516",
+		113, "MSDC0_DAT4",
 		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO113"),
 		MTK_FUNCTION(1, "MSDC0_DAT4"),
 		MTK_FUNCTION(4, "NLD3")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(114, "MSDC0_RSTB"),
-		NULL, "mt8516",
+		114, "MSDC0_RSTB",
 		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO114"),
 		MTK_FUNCTION(1, "MSDC0_RSTB"),
 		MTK_FUNCTION(4, "NLD0")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(115, "MSDC0_CMD"),
-		NULL, "mt8516",
+		115, "MSDC0_CMD",
 		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO115"),
 		MTK_FUNCTION(1, "MSDC0_CMD"),
 		MTK_FUNCTION(4, "NALE")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(116, "MSDC0_CLK"),
-		NULL, "mt8516",
+		116, "MSDC0_CLK",
 		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO116"),
 		MTK_FUNCTION(1, "MSDC0_CLK"),
 		MTK_FUNCTION(4, "NWEB")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(117, "MSDC0_DAT3"),
-		NULL, "mt8516",
+		117, "MSDC0_DAT3",
 		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO117"),
 		MTK_FUNCTION(1, "MSDC0_DAT3"),
 		MTK_FUNCTION(4, "NLD1")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(118, "MSDC0_DAT2"),
-		NULL, "mt8516",
+		118, "MSDC0_DAT2",
 		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO118"),
 		MTK_FUNCTION(1, "MSDC0_DAT2"),
 		MTK_FUNCTION(4, "NLD5")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(119, "MSDC0_DAT1"),
-		NULL, "mt8516",
+		119, "MSDC0_DAT1",
 		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO119"),
 		MTK_FUNCTION(1, "MSDC0_DAT1"),
 		MTK_FUNCTION(4, "NLD8")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(120, "MSDC0_DAT0"),
-		NULL, "mt8516",
+		120, "MSDC0_DAT0",
 		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO120"),
 		MTK_FUNCTION(1, "MSDC0_DAT0"),
 		MTK_FUNCTION(4, "WATCHDOG"),
 		MTK_FUNCTION(5, "NLD2")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(121, "GPIO121"),
-		NULL, "mt8516",
+		121, "GPIO121",
 		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO121")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(122, "GPIO122"),
-		NULL, "mt8516",
+		122, "GPIO122",
 		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO122")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(123, "GPIO123"),
-		NULL, "mt8516",
+		123, "GPIO123",
 		MTK_EINT_FUNCTION(0, 123),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO123")
 	),
 	MTK_PIN(
-		PINCTRL_PIN(124, "GPIO124"),
-		NULL, "mt8516",
+		124, "GPIO124",
 		MTK_EINT_FUNCTION(0, 124),
+		DRV_GRP0, // N/A
 		MTK_FUNCTION(0, "GPIO124")
 	),
 };
-- 
2.43.0


