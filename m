Return-Path: <linux-gpio+bounces-35282-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IIwJBWd5mmeywEAu9opvQ
	(envelope-from <linux-gpio+bounces-35282-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 23:39:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0946B434462
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 23:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD88D30219AC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 21:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31C23A9D8E;
	Mon, 20 Apr 2026 21:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikqafPKd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041E3307AC6
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 21:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776721127; cv=none; b=TeXA5m5txFTmIoYRegX8AtqGimqwT43/gfDvkwTzuyUbiOYftxtRfg8hSBZ8x11+UEAcm0C4mnSysEVAl20CUcgFV76oPIYXWiSKTkkqSQXgmZqUgYz30vBLG8+0KCOJBs/5hub0Q/SjGw5XnrtiOjQVIQD06XP1NZiLDJeLKw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776721127; c=relaxed/simple;
	bh=2bZt2a2zRVSBV3MA0JWJ6SLazOmmGt1tpatOsImPFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVpdSfDspclz5b3E1ldYbORb6QoXyzs1IvYIqDKI5daEd/3O4ObfWyENsZxUs1huP0L80nLGOUWqYm6uNrP0d9xni8tTZUgJdhUKkbewUZEb5zGRcM8wChrY6Hw+Y6YP01qzmNHVdU2ojP2EAbiO582F2OXHCAkUtCnyuvL3eFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikqafPKd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so24577485e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721124; x=1777325924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=ikqafPKd4cs7KbLsgQuvv7ilKX55AdVT+VyJFu5Rn+NkhZ169tV0SBRZZbzmOuBov7
         wkXSzqi/Z5AD0S0Zzkav20uHMY6FZb1sPjQBbykMDr3bPuLSrX6lmtwfCIv/ViN6ML9D
         r3iFLyqrnm/aGS/bI1ZSwheZy8X7cbVVSqIm2gjHMac7J+0AMQb3ymMa42rbp5y+V2/S
         QaYMRiXeotnXiAapiGhd5uoOMM72Ljaq+vqYdyA9ioStq8rBici+TFsZ6pJVU+88/Anr
         yR45+QEUrwLkJ/ddyRnrhtYohRY9QMD9IUwzrR3WWniSvU8Bq3DibZ+BypropVcCzj5D
         RP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721124; x=1777325924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=O7joYsj/9ZeIWHGRoFiQ+HugcZdD69UhcbEPpVkOkg2Y1h/Mo3pr8JvEmUFUi8Xe6H
         vKJZXQS+eKROI3aWBhaCsay7FF/8rkAP8lOLfERIKgtF70cGwn6OmGg5chljobzyBuMQ
         Ssneo44MKPzHCqRuCtSibyetMEqPMPQrY3108gxYdmIISniFXJ7YEK1+E0rZpndlArbP
         2uVM+obVJjfXZWjy//WgYLHDuYBHCV6mvjNXjgvzRomlCfjxTAhnGgI7FpEWcuHse33K
         /FpP1ncgxSoa0H8uJqZ84PW/2ybi0Xl1QT3qObqvSCrFDxAmoKbfHyJ+UYflimZMNfIf
         FdPA==
X-Forwarded-Encrypted: i=1; AFNElJ8SPLhxBGmYWmwF40h89WxvdjkNBE6FtJ8f+XSTTCNvGL9xJ0cPDRckIGkV/kA7ld6JcSuwiDbPEi+h@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6NZVnkIOiwP0Fo2PrZpPMM0Ii3HRo3crfcL31beO/eUxllPDA
	nQsSZhBfAWqtags9wxFNkcOkSt3xayEyPBCN2mIQMgDpt789hRFdf4q/
X-Gm-Gg: AeBDievtJ0ISMF/AP7BFvTlh5v+V+jRx9r/gYC0DgfZuc/VWTUbbK/2mVAhtY07zatA
	V0DmpP9vGDBIMZya2iTjayDynNCkJQG/iN0zn9+2DAPrXgYol7IjBnJfwTo7kqeiBDBNPPTaCNG
	SEJ1Bve4k/QouHHOhE+XBdQMjB5EdBw1bGEskySqedkGrvHNM5Vk1/VTcBzvlrtVO0PDZCT1704
	D+ZRiTkaj65TUarFQ9CXkpFB6pxE+dwoILythTBcBvkXrgxox4adAl3H689N+i4L2USMjwkvzgW
	evVEAUytf03jKntruMxPCAQI9Onl1Nq3DbC08swut4/WARtH4MldJL+8cVYbwobtXSeJSKlk3Ma
	LxWfeITfjS6k6Zvozh5LFfPZjKl7QCeIiMw0ZVLMmJ3tUOijMXeBZ38y8Xv/pl3Y5POBxT9jBYd
	OBZQzlxl1MFI0rANV/TGUvkNDfL0au4Q==
X-Received: by 2002:a05:600c:a414:b0:48a:53ea:13e6 with SMTP id 5b1f17b1804b1-48a53ea14d3mr22358675e9.25.1776721124372;
        Mon, 20 Apr 2026 14:38:44 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:38:44 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Mon, 20 Apr 2026 22:30:05 +0100
Message-ID: <20260420213529.1645560-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35282-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,collabora.com,kernel.org,mediatek.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c04:e001:36c::12fc:5321:from];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,209.85.128.46:received,154.61.61.58:received];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0946B434462
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


