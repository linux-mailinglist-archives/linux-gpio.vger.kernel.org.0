Return-Path: <linux-gpio+bounces-18854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD7A89EFC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 15:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7974172ECE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8D52973D6;
	Tue, 15 Apr 2025 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5GvvPow"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6261C6FF5;
	Tue, 15 Apr 2025 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722545; cv=none; b=S/eciU+dgq/TtBiruQxu8WHAaKatbpLnMKHmB3Dz/tijecH0Vj8eclvKlKMdG8zXXGQhhXY99+T2EZp2W2kbYMVjEABSFmVsSWxRJLsLLUfAV4q/+UJSL8crribCmiU7PNoTWYR+KQG8ajvjOid+lleeMfHt3q3LNnqZSbZkVws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722545; c=relaxed/simple;
	bh=QFDkDFAT3VhVnKRrNWOubny/Nz5R3IXCOsIgn64ojr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aJkxlFk7pb0ohbW+VEiLovB72DGwGJFsWRhtSKuqCRA8+ZxCJPZgQ9CJpHKZ81leXUZxHR6C2wfGELhVR6KuM26WwHQM2YxSOtucDVOvkttiwDxsfLMatFae9/PtXjJft5t8qTcu2jNG8JvGDR100C9PG2MqZ/X3dw2nliyLHrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5GvvPow; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so60350335e9.2;
        Tue, 15 Apr 2025 06:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744722542; x=1745327342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Rr5zYZNgCCyc3PXvx3nbnYi3P6g/+Pn3OrtLxKtTCg=;
        b=I5GvvPowEOLtYgGIhPdFWqsNNB1Gw6vDYKLotzo/fSzyeepveBdfRMMPoMUEZSB7MZ
         CYPdCcu7YXaKYyGL4FpgyOj5rUJLnEcrCXJTSURZgU6tg0mxvU0nkFyOZNSOFekFjE/W
         UhCCmp1aMzReERBas/qwQdj+CDohSi2xLTXoU2c81JH90uSp4AZCwaFmF55KyCGyilMf
         BLGmiZeVBB9d7hdW76/4fsRtm2W4SJjfek9yhCiF6+E81D/BBOQOSBLfTr6t2nJ7PvWw
         INZWOUaOJG86hGrAOBCsCWF2MZDLuFqpuZJ5cBm9ZVPpcyXeJL//r+8cYLNw/tqO76vW
         dofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722542; x=1745327342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Rr5zYZNgCCyc3PXvx3nbnYi3P6g/+Pn3OrtLxKtTCg=;
        b=MyB2EBKFK6Q/GDRQfrQIGijql8shol0zx9xj2e70001iGcpIP9qTC//HzJ908Isq6P
         zRaPtg5fdLHexUDohwf+xPdm88uwoMG6t6nAkgV9PQZhB6K7C3OORaJ+3WtF+KA0mffj
         DVBbTxJwegnFD/Ym0Ro0HKE8zn311b3Rmm3SCv0+hbIARW81YMmpdaGw5t7ECSfmmxRZ
         3JjO08hmkDoymfvc8nB5Prqt0v4tSAAcDDdvGnv0//5nRfa37B4O7CeU/qePmZ9K0Z4p
         bZqB5TDTZsROu0dU/VqVeAWAKD3dH4C1Pt/UocoxHmK1xfOEj/vJpbr31Ao2eYhlsQeQ
         ruHA==
X-Forwarded-Encrypted: i=1; AJvYcCUKtXMKqaxQpE+gy9Jm3Tuv+ieue/PzhnIExKdkxHtKaIKidwZjDrQgHuSX6Jx0fmyD8RdQ4ocSpQvdi4DZ@vger.kernel.org, AJvYcCV5+xdX22jgSgbQTiMd8y+/6aZaNd8lrg6whuudsW04Eich8DBQqTPBKnYOys+YdeaQCj3Zp9NivF5W@vger.kernel.org
X-Gm-Message-State: AOJu0YxVXnJsDnM7jDDBWp1Qo8B1PnQF+53b4NKxCcDxUgpvvYpOYjvr
	qy5dG2n8ySrS6r4+vQr8WMJYofrNsyb6vu4ztOMdTCGacLnTqQ+b
X-Gm-Gg: ASbGncs+tQ79EiwKiCA1KxK8PoWYa1Bhn/xWkB3GKBcgAwJUeVjMLxM3HwvbvjSWSgY
	nQswlKRrYARUBt7hOfL23yjjvAJPTTF0BdIzreBttqFv+NbIu1beqDb/v3ZtHVDSkTXw+uHW9wY
	9rnfZ/88AcD1Nvz+bNQucNac4s/M9JnfW12LDP7EETNa19pns6QPk2oRrVqF6n2T6sQt2ntlDt9
	QQoopK2M6oS660hd1nbSCfqVkf8JR14VXVnDzzjZplJdk0S2NrRMRQU5Vd43fi43LVRyR6JDooW
	0VXbmvifb3LXWV0qFOkYRvJ/aHQ4nj/8RjhrO1ZmXzmXVsy9PSoWdHpo7ebSxtex
X-Google-Smtp-Source: AGHT+IFQt9bK/fzwjMoCS8WQxr8ncxGUzZccF7PHda2DnmXwCF48N39vOdoWSZSVOPvIpUZn8F6Tew==
X-Received: by 2002:a05:600c:1c8e:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-43f3a95c43amr128138885e9.19.1744722541153;
        Tue, 15 Apr 2025 06:09:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecb8dsm211644925e9.7.2025.04.15.06.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:09:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
Date: Tue, 15 Apr 2025 14:08:54 +0100
Message-ID: <20250415130854.242227-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add pinctrl support for the Renesas RZ/V2N SoC by reusing the existing
RZ/V2H(P) pin configuration data. The PFC block is nearly identical, with
the only difference being the absence of `PCIE1_RSTOUTB` on RZ/V2N.

To handle this, the rzv2h_dedicated_pins array is refactored into a common
and pcie1 subset. This enables reuse of the common portion across both
SoCs, while excluding PCIE1_RSTOUTB for RZ/V2N.

This change allows the pinctrl-rzg2l driver to support RZ/V2N without
duplicating large parts of the RZ/V2H configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi All,
This patch is from series [0]. Since most of the patches have already
been queued, I'm sending this one separately.
[0] https://lore.kernel.org/all/20250407191628.323613-11-prabhakar.mahadev-lad.rj@bp.renesas.com/
Cheers, Prabhakar
v2->v3:
- Split up rzv2h_dedicated_pins into common and pcie1 subsets to
  facilitate reuse for RZ/V2N.

v1->v2:
- No changes in the code.
---
 drivers/pinctrl/renesas/Kconfig         |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 299 +++++++++++++-----------
 2 files changed, 170 insertions(+), 130 deletions(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 3c18d908b21e..e16034fc1bbf 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -42,6 +42,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_RZG2L if ARCH_RZG2L
 	select PINCTRL_RZV2M if ARCH_R9A09G011
 	select PINCTRL_RZG2L if ARCH_R9A09G047
+	select PINCTRL_RZG2L if ARCH_R9A09G056
 	select PINCTRL_RZG2L if ARCH_R9A09G057
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
 	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c72e250f4a15..78fa08ff0faa 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2230,135 +2230,146 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 						       PIN_CFG_IO_VMC_SD1)) },
 };
 
-static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
-	{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0, PIN_CFG_NF) },
-	{ "TMS_SWDIO", RZG2L_SINGLE_PIN_PACK(0x3, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_IEN)) },
-	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
-	{ "WDTUDFCA", RZG2L_SINGLE_PIN_PACK(0x5, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						     PIN_CFG_PUPD | PIN_CFG_NOD)) },
-	{ "WDTUDFCM", RZG2L_SINGLE_PIN_PACK(0x5, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						     PIN_CFG_PUPD | PIN_CFG_NOD)) },
-	{ "SCIF_RXD", RZG2L_SINGLE_PIN_PACK(0x6, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						     PIN_CFG_PUPD)) },
-	{ "SCIF_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						     PIN_CFG_PUPD)) },
-	{ "XSPI0_CKP", RZG2L_SINGLE_PIN_PACK(0x7, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD | PIN_CFG_OEN)) },
-	{ "XSPI0_CKN", RZG2L_SINGLE_PIN_PACK(0x7, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD | PIN_CFG_OEN)) },
-	{ "XSPI0_CS0N", RZG2L_SINGLE_PIN_PACK(0x7, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						       PIN_CFG_PUPD | PIN_CFG_OEN)) },
-	{ "XSPI0_DS", RZG2L_SINGLE_PIN_PACK(0x7, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						     PIN_CFG_PUPD)) },
-	{ "XSPI0_RESET0N", RZG2L_SINGLE_PIN_PACK(0x7, 4, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-							  PIN_CFG_PUPD | PIN_CFG_OEN)) },
-	{ "XSPI0_RSTO0N", RZG2L_SINGLE_PIN_PACK(0x7, 5, (PIN_CFG_PUPD)) },
-	{ "XSPI0_INT0N", RZG2L_SINGLE_PIN_PACK(0x7, 6, (PIN_CFG_PUPD)) },
-	{ "XSPI0_ECS0N", RZG2L_SINGLE_PIN_PACK(0x7, 7, (PIN_CFG_PUPD)) },
-	{ "XSPI0_IO0", RZG2L_SINGLE_PIN_PACK(0x8, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "XSPI0_IO1", RZG2L_SINGLE_PIN_PACK(0x8, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "XSPI0_IO2", RZG2L_SINGLE_PIN_PACK(0x8, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "XSPI0_IO3", RZG2L_SINGLE_PIN_PACK(0x8, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "XSPI0_IO4", RZG2L_SINGLE_PIN_PACK(0x8, 4, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "XSPI0_IO5", RZG2L_SINGLE_PIN_PACK(0x8, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "XSPI0_IO6", RZG2L_SINGLE_PIN_PACK(0x8, 6, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "XSPI0_IO7", RZG2L_SINGLE_PIN_PACK(0x8, 7, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "SD0CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
-	{ "SD0CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						   PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0RSTN", RZG2L_SINGLE_PIN_PACK(0x9, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
-	{ "SD0DAT0", RZG2L_SINGLE_PIN_PACK(0xa, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0DAT1", RZG2L_SINGLE_PIN_PACK(0xa, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0DAT2", RZG2L_SINGLE_PIN_PACK(0xa, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0DAT3", RZG2L_SINGLE_PIN_PACK(0xa, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0DAT4", RZG2L_SINGLE_PIN_PACK(0xa, 4, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0DAT5", RZG2L_SINGLE_PIN_PACK(0xa, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0DAT6", RZG2L_SINGLE_PIN_PACK(0xa, 6, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0DAT7", RZG2L_SINGLE_PIN_PACK(0xa, 7, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD1CLK", RZG2L_SINGLE_PIN_PACK(0xb, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
-	{ "SD1CMD", RZG2L_SINGLE_PIN_PACK(0xb, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						   PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD1DAT0", RZG2L_SINGLE_PIN_PACK(0xc, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD1DAT1", RZG2L_SINGLE_PIN_PACK(0xc, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD1DAT2", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD1DAT3", RZG2L_SINGLE_PIN_PACK(0xc, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "PCIE0_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
-	{ "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
-	{ "ET0_MDIO", RZG2L_SINGLE_PIN_PACK(0xf, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						     PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "ET0_MDC", RZG2L_SINGLE_PIN_PACK(0xf, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						    PIN_CFG_PUPD)) },
-	{ "ET0_RXCTL_RXDV", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_PUPD)) },
-	{ "ET0_TXCTL_TXEN", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-							    PIN_CFG_PUPD)) },
-	{ "ET0_TXER", RZG2L_SINGLE_PIN_PACK(0x10, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "ET0_RXER", RZG2L_SINGLE_PIN_PACK(0x10, 3, (PIN_CFG_PUPD)) },
-	{ "ET0_RXC_RXCLK", RZG2L_SINGLE_PIN_PACK(0x10, 4, (PIN_CFG_PUPD)) },
-	{ "ET0_TXC_TXCLK", RZG2L_SINGLE_PIN_PACK(0x10, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-							   PIN_CFG_PUPD | PIN_CFG_OEN)) },
-	{ "ET0_CRS", RZG2L_SINGLE_PIN_PACK(0x10, 6, (PIN_CFG_PUPD)) },
-	{ "ET0_COL", RZG2L_SINGLE_PIN_PACK(0x10, 7, (PIN_CFG_PUPD)) },
-	{ "ET0_TXD0", RZG2L_SINGLE_PIN_PACK(0x11, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "ET0_TXD1", RZG2L_SINGLE_PIN_PACK(0x11, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "ET0_TXD2", RZG2L_SINGLE_PIN_PACK(0x11, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "ET0_TXD3", RZG2L_SINGLE_PIN_PACK(0x11, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "ET0_RXD0", RZG2L_SINGLE_PIN_PACK(0x11, 4, (PIN_CFG_PUPD)) },
-	{ "ET0_RXD1", RZG2L_SINGLE_PIN_PACK(0x11, 5, (PIN_CFG_PUPD)) },
-	{ "ET0_RXD2", RZG2L_SINGLE_PIN_PACK(0x11, 6, (PIN_CFG_PUPD)) },
-	{ "ET0_RXD3", RZG2L_SINGLE_PIN_PACK(0x11, 7, (PIN_CFG_PUPD)) },
-	{ "ET1_MDIO", RZG2L_SINGLE_PIN_PACK(0x12, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "ET1_MDC", RZG2L_SINGLE_PIN_PACK(0x12, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						     PIN_CFG_PUPD)) },
-	{ "ET1_RXCTL_RXDV", RZG2L_SINGLE_PIN_PACK(0x13, 0, (PIN_CFG_PUPD)) },
-	{ "ET1_TXCTL_TXEN", RZG2L_SINGLE_PIN_PACK(0x13, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+static const struct {
+	struct rzg2l_dedicated_configs common[77];
+	struct rzg2l_dedicated_configs pcie1[1];
+} rzv2h_dedicated_pins = {
+	.common = {
+		{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0, PIN_CFG_NF) },
+		{ "TMS_SWDIO", RZG2L_SINGLE_PIN_PACK(0x3, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_IEN)) },
+		{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+		{ "WDTUDFCA", RZG2L_SINGLE_PIN_PACK(0x5, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							     PIN_CFG_PUPD | PIN_CFG_NOD)) },
+		{ "WDTUDFCM", RZG2L_SINGLE_PIN_PACK(0x5, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							     PIN_CFG_PUPD | PIN_CFG_NOD)) },
+		{ "SCIF_RXD", RZG2L_SINGLE_PIN_PACK(0x6, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							     PIN_CFG_PUPD)) },
+		{ "SCIF_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							     PIN_CFG_PUPD)) },
+		{ "XSPI0_CKP", RZG2L_SINGLE_PIN_PACK(0x7, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD | PIN_CFG_OEN)) },
+		{ "XSPI0_CKN", RZG2L_SINGLE_PIN_PACK(0x7, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD | PIN_CFG_OEN)) },
+		{ "XSPI0_CS0N", RZG2L_SINGLE_PIN_PACK(0x7, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							       PIN_CFG_PUPD | PIN_CFG_OEN)) },
+		{ "XSPI0_DS", RZG2L_SINGLE_PIN_PACK(0x7, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							     PIN_CFG_PUPD)) },
+		{ "XSPI0_RESET0N", RZG2L_SINGLE_PIN_PACK(0x7, 4, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+								  PIN_CFG_PUPD | PIN_CFG_OEN)) },
+		{ "XSPI0_RSTO0N", RZG2L_SINGLE_PIN_PACK(0x7, 5, (PIN_CFG_PUPD)) },
+		{ "XSPI0_INT0N", RZG2L_SINGLE_PIN_PACK(0x7, 6, (PIN_CFG_PUPD)) },
+		{ "XSPI0_ECS0N", RZG2L_SINGLE_PIN_PACK(0x7, 7, (PIN_CFG_PUPD)) },
+		{ "XSPI0_IO0", RZG2L_SINGLE_PIN_PACK(0x8, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "XSPI0_IO1", RZG2L_SINGLE_PIN_PACK(0x8, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "XSPI0_IO2", RZG2L_SINGLE_PIN_PACK(0x8, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "XSPI0_IO3", RZG2L_SINGLE_PIN_PACK(0x8, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "XSPI0_IO4", RZG2L_SINGLE_PIN_PACK(0x8, 4, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "XSPI0_IO5", RZG2L_SINGLE_PIN_PACK(0x8, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "XSPI0_IO6", RZG2L_SINGLE_PIN_PACK(0x8, 6, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "XSPI0_IO7", RZG2L_SINGLE_PIN_PACK(0x8, 7, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "SD0CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+		{ "SD0CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							   PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD0RSTN", RZG2L_SINGLE_PIN_PACK(0x9, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+		{ "SD0DAT0", RZG2L_SINGLE_PIN_PACK(0xa, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD0DAT1", RZG2L_SINGLE_PIN_PACK(0xa, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD0DAT2", RZG2L_SINGLE_PIN_PACK(0xa, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD0DAT3", RZG2L_SINGLE_PIN_PACK(0xa, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD0DAT4", RZG2L_SINGLE_PIN_PACK(0xa, 4, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD0DAT5", RZG2L_SINGLE_PIN_PACK(0xa, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD0DAT6", RZG2L_SINGLE_PIN_PACK(0xa, 6, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD0DAT7", RZG2L_SINGLE_PIN_PACK(0xa, 7, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD1CLK", RZG2L_SINGLE_PIN_PACK(0xb, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
+		{ "SD1CMD", RZG2L_SINGLE_PIN_PACK(0xb, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							   PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD1DAT0", RZG2L_SINGLE_PIN_PACK(0xc, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD1DAT1", RZG2L_SINGLE_PIN_PACK(0xc, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD1DAT2", RZG2L_SINGLE_PIN_PACK(0xc, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "SD1DAT3", RZG2L_SINGLE_PIN_PACK(0xc, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							    PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "PCIE0_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 0, (PIN_CFG_IOLH_RZV2H |
+								  PIN_CFG_SR)) },
+		{ "ET0_MDIO", RZG2L_SINGLE_PIN_PACK(0xf, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							     PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "ET0_MDC", RZG2L_SINGLE_PIN_PACK(0xf, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
 							    PIN_CFG_PUPD)) },
-	{ "ET1_TXER", RZG2L_SINGLE_PIN_PACK(0x13, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						       PIN_CFG_PUPD)) },
-	{ "ET1_RXER", RZG2L_SINGLE_PIN_PACK(0x13, 3, (PIN_CFG_PUPD)) },
-	{ "ET1_RXC_RXCLK", RZG2L_SINGLE_PIN_PACK(0x13, 4, (PIN_CFG_PUPD)) },
-	{ "ET1_TXC_TXCLK", RZG2L_SINGLE_PIN_PACK(0x13, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-							   PIN_CFG_PUPD | PIN_CFG_OEN)) },
-	{ "ET1_CRS", RZG2L_SINGLE_PIN_PACK(0x13, 6, (PIN_CFG_PUPD)) },
-	{ "ET1_COL", RZG2L_SINGLE_PIN_PACK(0x13, 7, (PIN_CFG_PUPD)) },
-	{ "ET1_TXD0", RZG2L_SINGLE_PIN_PACK(0x14, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "ET1_TXD1", RZG2L_SINGLE_PIN_PACK(0x14, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "ET1_TXD2", RZG2L_SINGLE_PIN_PACK(0x14, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "ET1_TXD3", RZG2L_SINGLE_PIN_PACK(0x14, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
-						      PIN_CFG_PUPD)) },
-	{ "ET1_RXD0", RZG2L_SINGLE_PIN_PACK(0x14, 4, (PIN_CFG_PUPD)) },
-	{ "ET1_RXD1", RZG2L_SINGLE_PIN_PACK(0x14, 5, (PIN_CFG_PUPD)) },
-	{ "ET1_RXD2", RZG2L_SINGLE_PIN_PACK(0x14, 6, (PIN_CFG_PUPD)) },
-	{ "ET1_RXD3", RZG2L_SINGLE_PIN_PACK(0x14, 7, (PIN_CFG_PUPD)) },
+		{ "ET0_RXCTL_RXDV", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_PUPD)) },
+		{ "ET0_TXCTL_TXEN", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_RZV2H |
+								    PIN_CFG_SR |
+								    PIN_CFG_PUPD)) },
+		{ "ET0_TXER", RZG2L_SINGLE_PIN_PACK(0x10, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "ET0_RXER", RZG2L_SINGLE_PIN_PACK(0x10, 3, (PIN_CFG_PUPD)) },
+		{ "ET0_RXC_RXCLK", RZG2L_SINGLE_PIN_PACK(0x10, 4, (PIN_CFG_PUPD)) },
+		{ "ET0_TXC_TXCLK", RZG2L_SINGLE_PIN_PACK(0x10, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+								   PIN_CFG_PUPD | PIN_CFG_OEN)) },
+		{ "ET0_CRS", RZG2L_SINGLE_PIN_PACK(0x10, 6, (PIN_CFG_PUPD)) },
+		{ "ET0_COL", RZG2L_SINGLE_PIN_PACK(0x10, 7, (PIN_CFG_PUPD)) },
+		{ "ET0_TXD0", RZG2L_SINGLE_PIN_PACK(0x11, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "ET0_TXD1", RZG2L_SINGLE_PIN_PACK(0x11, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "ET0_TXD2", RZG2L_SINGLE_PIN_PACK(0x11, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "ET0_TXD3", RZG2L_SINGLE_PIN_PACK(0x11, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "ET0_RXD0", RZG2L_SINGLE_PIN_PACK(0x11, 4, (PIN_CFG_PUPD)) },
+		{ "ET0_RXD1", RZG2L_SINGLE_PIN_PACK(0x11, 5, (PIN_CFG_PUPD)) },
+		{ "ET0_RXD2", RZG2L_SINGLE_PIN_PACK(0x11, 6, (PIN_CFG_PUPD)) },
+		{ "ET0_RXD3", RZG2L_SINGLE_PIN_PACK(0x11, 7, (PIN_CFG_PUPD)) },
+		{ "ET1_MDIO", RZG2L_SINGLE_PIN_PACK(0x12, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_IEN | PIN_CFG_PUPD)) },
+		{ "ET1_MDC", RZG2L_SINGLE_PIN_PACK(0x12, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							     PIN_CFG_PUPD)) },
+		{ "ET1_RXCTL_RXDV", RZG2L_SINGLE_PIN_PACK(0x13, 0, (PIN_CFG_PUPD)) },
+		{ "ET1_TXCTL_TXEN", RZG2L_SINGLE_PIN_PACK(0x13, 1, (PIN_CFG_IOLH_RZV2H |
+								    PIN_CFG_SR |
+								    PIN_CFG_PUPD)) },
+		{ "ET1_TXER", RZG2L_SINGLE_PIN_PACK(0x13, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							       PIN_CFG_PUPD)) },
+		{ "ET1_RXER", RZG2L_SINGLE_PIN_PACK(0x13, 3, (PIN_CFG_PUPD)) },
+		{ "ET1_RXC_RXCLK", RZG2L_SINGLE_PIN_PACK(0x13, 4, (PIN_CFG_PUPD)) },
+		{ "ET1_TXC_TXCLK", RZG2L_SINGLE_PIN_PACK(0x13, 5, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+								   PIN_CFG_PUPD | PIN_CFG_OEN)) },
+		{ "ET1_CRS", RZG2L_SINGLE_PIN_PACK(0x13, 6, (PIN_CFG_PUPD)) },
+		{ "ET1_COL", RZG2L_SINGLE_PIN_PACK(0x13, 7, (PIN_CFG_PUPD)) },
+		{ "ET1_TXD0", RZG2L_SINGLE_PIN_PACK(0x14, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "ET1_TXD1", RZG2L_SINGLE_PIN_PACK(0x14, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "ET1_TXD2", RZG2L_SINGLE_PIN_PACK(0x14, 2, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "ET1_TXD3", RZG2L_SINGLE_PIN_PACK(0x14, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
+							      PIN_CFG_PUPD)) },
+		{ "ET1_RXD0", RZG2L_SINGLE_PIN_PACK(0x14, 4, (PIN_CFG_PUPD)) },
+		{ "ET1_RXD1", RZG2L_SINGLE_PIN_PACK(0x14, 5, (PIN_CFG_PUPD)) },
+		{ "ET1_RXD2", RZG2L_SINGLE_PIN_PACK(0x14, 6, (PIN_CFG_PUPD)) },
+		{ "ET1_RXD3", RZG2L_SINGLE_PIN_PACK(0x14, 7, (PIN_CFG_PUPD)) },
+		},
+	.pcie1 = {
+		{ "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_RZV2H |
+								  PIN_CFG_SR)) },
+	},
 };
 
 static struct rzg2l_dedicated_configs rzg3e_dedicated_pins[] = {
@@ -3349,13 +3360,37 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
 
+static struct rzg2l_pinctrl_data r9a09g056_data = {
+	.port_pins = rzv2h_gpio_names,
+	.port_pin_configs = r9a09g057_gpio_configs,
+	.n_ports = ARRAY_SIZE(r9a09g057_gpio_configs),
+	.dedicated_pins = rzv2h_dedicated_pins.common,
+	.n_port_pins = ARRAY_SIZE(r9a09g057_gpio_configs) * RZG2L_PINS_PER_PORT,
+	.n_dedicated_pins = ARRAY_SIZE(rzv2h_dedicated_pins.common),
+	.hwcfg = &rzv2h_hwcfg,
+	.variable_pin_cfg = r9a09g057_variable_pin_cfg,
+	.n_variable_pin_cfg = ARRAY_SIZE(r9a09g057_variable_pin_cfg),
+	.num_custom_params = ARRAY_SIZE(renesas_rzv2h_custom_bindings),
+	.custom_params = renesas_rzv2h_custom_bindings,
+#ifdef CONFIG_DEBUG_FS
+	.custom_conf_items = renesas_rzv2h_conf_items,
+#endif
+	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
+	.pmc_writeb = &rzv2h_pmc_writeb,
+	.oen_read = &rzv2h_oen_read,
+	.oen_write = &rzv2h_oen_write,
+	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
+	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
+};
+
 static struct rzg2l_pinctrl_data r9a09g057_data = {
 	.port_pins = rzv2h_gpio_names,
 	.port_pin_configs = r9a09g057_gpio_configs,
 	.n_ports = ARRAY_SIZE(r9a09g057_gpio_configs),
-	.dedicated_pins = rzv2h_dedicated_pins,
+	.dedicated_pins = rzv2h_dedicated_pins.common,
 	.n_port_pins = ARRAY_SIZE(r9a09g057_gpio_configs) * RZG2L_PINS_PER_PORT,
-	.n_dedicated_pins = ARRAY_SIZE(rzv2h_dedicated_pins),
+	.n_dedicated_pins = ARRAY_SIZE(rzv2h_dedicated_pins.common) +
+			    ARRAY_SIZE(rzv2h_dedicated_pins.pcie1),
 	.hwcfg = &rzv2h_hwcfg,
 	.variable_pin_cfg = r9a09g057_variable_pin_cfg,
 	.n_variable_pin_cfg = ARRAY_SIZE(r9a09g057_variable_pin_cfg),
@@ -3389,6 +3424,10 @@ static const struct of_device_id rzg2l_pinctrl_of_table[] = {
 		.compatible = "renesas,r9a09g047-pinctrl",
 		.data = &r9a09g047_data,
 	},
+	{
+		.compatible = "renesas,r9a09g056-pinctrl",
+		.data = &r9a09g056_data,
+	},
 	{
 		.compatible = "renesas,r9a09g057-pinctrl",
 		.data = &r9a09g057_data,
-- 
2.49.0


