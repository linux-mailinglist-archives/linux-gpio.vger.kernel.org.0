Return-Path: <linux-gpio+bounces-38004-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XQKxEBR3ImpqXwEAu9opvQ
	(envelope-from <linux-gpio+bounces-38004-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 09:13:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC55B645D21
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Jun 2026 09:13:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=O0PYnkqN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38004-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38004-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93009303EBBA
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2026 07:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C9744CF2C;
	Fri,  5 Jun 2026 07:13:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F342EC0A7
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 07:13:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643601; cv=none; b=lEoAZr+cOe/WupK5hPiOQUSozonJYV995KJ/PLW76WKBgEUTBvNzGXbrY/+h4gQNzg4Eqf8HAES1FwTN1hHxIqIDzuHGXaHemse4XLk1s/e7Rcuuy0B2krhlafpbFEe2sZcOic8IOsPW6C8lJCuTivBtYivnMEN5FGCN7SaGUjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643601; c=relaxed/simple;
	bh=VNtNVfT9VsVsDIDYTScHhy43UIkmP+fuELtkDd6wgtY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Od9Zrcc5PuPzQFFRWDg8NQKHGi0uTa8GVfnvcMgvjJd+8mizdo7Bi5mIqgq/qAlRZ67Krlc7qyXtCs4I6i9Z5m03V4i2QVrF2MTNGVBmbAeBY8i1kBOoYonrBY9TCap8ta7C5biZBDnKDn3MVsTqe85N2Rxy/OXwB5Qbfoje3QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0PYnkqN; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45efa80e0afso1239754f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2026 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643598; x=1781248398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OAHd6WydKYBQCkvMXE/3oSe9e9pm1fVvh4h5O21kqfs=;
        b=O0PYnkqNVKRgEvvVr0/dqU+YBi+eruFK5DTsY7XRGzgnzkmSIriXR+VuflVn8beJPg
         HcR/8KtmacvLIF7MZFzu5CbcpqE8fDfjij70rRnahRh7bVu3XrfiMPVLyxv4X/q752Oh
         fRoiECJGDR+cck5nK5XVX76KcouTiGnjeDPV730969v4cNE2rZhpcXZ+mZFEXjorgSjd
         Q9x3QmN5loaMc5SuuTeudB5+xt6uff6yEg8kiDXh/vyFPcvC8Pw0DvoKc305QjNhFunB
         1VWd+K+7lzUHNNgtc857tX7RMtngatTdetNI1ZljB1FY1jwCAf7pwkDJYzWK5N7vtfJa
         P94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643598; x=1781248398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAHd6WydKYBQCkvMXE/3oSe9e9pm1fVvh4h5O21kqfs=;
        b=fYw7QVCKO8p9P5Io7K+F4nhz5M4bFgbeiAzmM43DJmpcz6TnvoQ2pBo4H310MFI6LS
         U+4GkkF4Snik2SxqzEmpn+SYFJxD21c+N9wLw7r5GN9m3aKXjFf/dCNmOBLjn0RkNnjX
         9GU2qPgwSJ3Q6nRyh7ZXbo3W990d64AUvyDGUIeuiVof/ZH/y6IJh5xqkm6b6cwfbOqE
         WgJqq4ydqDZntT4Bw2Psz8/O+kB6VbSa7HcuBNVO12Dt+TS2EIdJGdXrMA8RX1VIqPON
         6O6+4wxgpymP2S4tdBR5ae5ogPywnNlASQVyUtvarJR44HhPAeeTy5naW+zFch3JrP1V
         pf6w==
X-Forwarded-Encrypted: i=1; AFNElJ90LJYMDHGHavAmEXDB6+aHSyA8hFHSBf+jC4Fp7xLerH+kh1d4phVyjU0NgfnquGXofUyg/b1Z+3Go@vger.kernel.org
X-Gm-Message-State: AOJu0YyMKs7HAbpOPWciAIF1ghS8pPEyBAGjGTXhnkfc8KTTt0roCzye
	RxpqZ8wA4oK13Oyv9wr5EX1r0K0RLtjFls46l0PCH3sxVt+f3fx6LeZrtnW4ag==
X-Gm-Gg: Acq92OFlkMe1gGwyvrEwOgCyVv2HNmGtQVvvD47KbJ0iVpAx+nZVpYSSmDd+CRJvYaN
	jmyz2+VzJ3EAcOgkd9f4lH7MDeRzdzdXt944jYbrJ7AxCJikGHcb/r4yzd+xVmspb3gbiFGkxQ/
	Lf1jNWPJIY0AAwN5+LvY050Y/vRv/ddveu5vOM6lCt3NZwyWoMcbTpBNItq1N9dwp8jIhalok9O
	Zf3sKNCrtvGhG3pFYCyUAJ3hqvN9AUpXBJWCtvFcHFFMNOvtW5l2AgaHaZuqIryOt/bsfHBirt5
	KURByrkS9uhMk7sX/VCowsJgsl4uplWe5eytkD5Nt0KHMEyfrvcGBE6NyDpUpNY1Ffr1VzQY4+M
	cIKRFswcPFE8O6JlC+0QjH0VpOdIGdqUg0jYwIZXzzl/QR82TYYnRmAGgtak4CasQqFWSqkdyG5
	YJt0NlPWBvVSiyB9ESpMgcYWgWBgUQGGErR3JGG3qNgr/je46YjsdWUBA8Qt2CoBHI+ZHD0NxjE
	yuOR80=
X-Received: by 2002:adf:fd8b:0:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-460304f6b48mr2770670f8f.9.1780643597933;
        Fri, 05 Jun 2026 00:13:17 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm22221465f8f.15.2026.06.05.00.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:13:16 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: Move Airoha driver to dedicated directory
Date: Fri,  5 Jun 2026 09:12:31 +0200
Message-ID: <20260605071233.28873-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38004-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:lorenzo@kernel.org,m:sean.wang@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ansuelsmth@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email,vger.kernel.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC55B645D21

In preparation for additional SoC support, move the Airoha pinctrl driver
for AN7581 SoC to a dedicated directory.

This is to tidy things up and keep code organized without polluting the
Mediatek driver directory.

The driver doesn't depend on any generic or common code from the Mediatek
codebase so it can be safely moved without any modification.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                   |  2 +-
 drivers/pinctrl/Kconfig                       |  1 +
 drivers/pinctrl/Makefile                      |  1 +
 drivers/pinctrl/airoha/Kconfig                | 20 +++++++++++++++++++
 drivers/pinctrl/airoha/Makefile               |  3 +++
 .../{mediatek => airoha}/pinctrl-airoha.c     |  0
 drivers/pinctrl/mediatek/Kconfig              | 17 +---------------
 drivers/pinctrl/mediatek/Makefile             |  1 -
 8 files changed, 27 insertions(+), 18 deletions(-)
 create mode 100644 drivers/pinctrl/airoha/Kconfig
 create mode 100644 drivers/pinctrl/airoha/Makefile
 rename drivers/pinctrl/{mediatek => airoha}/pinctrl-airoha.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0ef0b9ce5..38bf92149a15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21024,7 +21024,7 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
-F:	drivers/pinctrl/mediatek/pinctrl-airoha.c
+F:	drivers/pinctrl/airoha/pinctrl-airoha.c
 
 PIN CONTROLLER - AMD
 M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..e0babad31445 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -679,6 +679,7 @@ config PINCTRL_RP1
 	  multi function device.
 
 source "drivers/pinctrl/actions/Kconfig"
+source "drivers/pinctrl/airoha/Kconfig"
 source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
 source "drivers/pinctrl/berlin/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..36c55858801f 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_PINCTRL_ZYNQMP)	+= pinctrl-zynqmp.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
 obj-y				+= actions/
+obj-y				+= airoha/
 obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
 obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
diff --git a/drivers/pinctrl/airoha/Kconfig b/drivers/pinctrl/airoha/Kconfig
new file mode 100644
index 000000000000..03adaeae8fc3
--- /dev/null
+++ b/drivers/pinctrl/airoha/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Airoha pinctrl drivers"
+	depends on ARCH_AIROHA || COMPILE_TEST
+
+config PINCTRL_AIROHA
+	tristate "Airoha EN7581 pin control"
+	depends on OF
+	depends on ARM64 || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select REGMAP_MMIO
+	help
+	  Say yes here to support pin controller and gpio driver
+	  on Airoha EN7581 SoC.
+
+endmenu
diff --git a/drivers/pinctrl/airoha/Makefile b/drivers/pinctrl/airoha/Makefile
new file mode 100644
index 000000000000..a25b744dd7a8
--- /dev/null
+++ b/drivers/pinctrl/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
similarity index 100%
rename from drivers/pinctrl/mediatek/pinctrl-airoha.c
rename to drivers/pinctrl/airoha/pinctrl-airoha.c
diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 4819617d9368..97980cc28b9c 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "MediaTek pinctrl drivers"
-	depends on ARCH_MEDIATEK || ARCH_AIROHA || RALINK || COMPILE_TEST
+	depends on ARCH_MEDIATEK || RALINK || COMPILE_TEST
 
 config EINT_MTK
 	tristate "MediaTek External Interrupt Support"
@@ -126,21 +126,6 @@ config PINCTRL_MT8127
 	select PINCTRL_MTK
 
 # For ARMv8 SoCs
-config PINCTRL_AIROHA
-	tristate "Airoha EN7581 pin control"
-	depends on OF
-	depends on ARM64 || COMPILE_TEST
-	select PINMUX
-	select GENERIC_PINCONF
-	select GENERIC_PINCTRL_GROUPS
-	select GENERIC_PINMUX_FUNCTIONS
-	select GPIOLIB
-	select GPIOLIB_IRQCHIP
-	select REGMAP_MMIO
-	help
-	  Say yes here to support pin controller and gpio driver
-	  on Airoha EN7581 SoC.
-
 config PINCTRL_MT2712
 	bool "MediaTek MT2712 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index ae765bd99965..6dc17b0c23f9 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -8,7 +8,6 @@ obj-$(CONFIG_PINCTRL_MTK_MOORE)		+= pinctrl-moore.o
 obj-$(CONFIG_PINCTRL_MTK_PARIS)		+= pinctrl-paris.o
 
 # SoC Drivers
-obj-$(CONFIG_PINCTRL_AIROHA)		+= pinctrl-airoha.o
 obj-$(CONFIG_PINCTRL_MT7620)		+= pinctrl-mt7620.o
 obj-$(CONFIG_PINCTRL_MT7621)		+= pinctrl-mt7621.o
 obj-$(CONFIG_PINCTRL_MT76X8)		+= pinctrl-mt76x8.o
-- 
2.53.0


