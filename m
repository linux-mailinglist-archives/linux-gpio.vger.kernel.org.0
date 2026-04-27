Return-Path: <linux-gpio+bounces-35532-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CT3CvvF7ml5xgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35532-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 04:12:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111F46C0D7
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 04:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 412C8300EF52
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 02:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DE52E7F3E;
	Mon, 27 Apr 2026 02:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AURVf7gp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293FA846A
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 02:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777255919; cv=none; b=ukju/BOfIYtpq4UAIuJLzyLHr4K7lkCQSps+HdWyrq76ImOetpUXTW6p9HOC7cr0Hcjz9pE4wmdoMbHSTs9VGN48RCmkQHQpzTwov5AbVgeiU6i0IkFfz5v47d4SGPwYmTG+R+NYSRk7ZLbwL1WBEsMC8P8WF0Gnl2NAWoek4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777255919; c=relaxed/simple;
	bh=+3p0Ns/EM0rIdRNtD3BpcOrY+O7vxIjfM2fOiRE5eDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7DM5UkSZyU6hFs59aHpcyfbxhAAzbXyiyfQQjKVlCe27Qod6QoMDfT+ru7DoYPeDA1DilAY7UCmE1NV9k6bZBnncII8/NhP4LeKVhJFNG7QFEQuw1nY1LTKk/JM6Egx+VN8lz2VJBbiewoqUinJr1yIxc5vm7VjzQMh1w7wq/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AURVf7gp; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso4227053a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 26 Apr 2026 19:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777255916; x=1777860716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mF/9AhbFaWy+vBCE+sic1C2hAqKkKmrRtazAAKk6boM=;
        b=AURVf7gpD6Ch5ReRDLf8vLE3d1QD5NKsx02A3ePLfBj/7QryvoXoXNkaX/zDaVr4Mi
         aPGl958hK4O1DrcKr2dw56GPu0xlCa4Y3TZfrMb3anlPMcl27WxiV+5bnkxo18j4FEdp
         QwhwaIPiki+6qTU2TUiY4TagVF4YalBuyjwj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777255916; x=1777860716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF/9AhbFaWy+vBCE+sic1C2hAqKkKmrRtazAAKk6boM=;
        b=oXI2umW4Fe9UWVtdWTLM8yk30nYfIMTsWeIdPQSr5US/qNZss8yiOIPY7zcbMxX21U
         pSdm6p9qFh6/aM+CG+9aIGFkYnd7f1K+px1HcPyYab478DPyD6IdZafimHc1ILnZT730
         o28+dKrfjl9MdxoTt8UMoUCFLjQzG6jmdeW2IMqCjgVlmG0Ake/22Lckwt2BgfPnuTqt
         iLomGsE9nz0JQut/7+HOFyAbcNvYACGLnGLhruAgzo3AyQEjUcs+eP8ZqmRrjErX3EpT
         iH9iBfjTut+YihaNu7IlT/zzKVLvHQlwFt8QkLPkYUVSt/iIHySFVPRxZ8TIJ+Z0ddpq
         4LBg==
X-Forwarded-Encrypted: i=1; AFNElJ9z730v6KilD2irSvnmEWwGMhOtOapme8mE5dWAzwydW0XxmvBd7bI5aM2+AyKSu0O6tlK6EcHVa4cx@vger.kernel.org
X-Gm-Message-State: AOJu0YzJrOYM5mvV5RDwPeeL9NQ74e//QHPZXeopEZaoIzLX26zoAlfZ
	fEMn+WHM9ck+TCvGFNA/dn9NzxVF6pCOIpqY9S39E4C/kN1J0iiZc0GNlRhI2SEnwA==
X-Gm-Gg: AeBDietmjgsPlYOU2vnbB1C1voHT9cBRIePhyL/Gve2x+CzMIZTO1dsRgX4geC1cZS5
	rdd0sRXt3ZiTlFuWvL6powEP07V21MpTKGMiepcewpFkPL5AhwUOdkTq8ddewfGmBewgBJra2rg
	ssEX7QBjFuFMlYqCgQfSiHXQyOVvUvY0nwHPtocNPhcGMUL+D2pNrQOtvHbjyyePOKvvV/bmhMO
	LiT6W3tpdejRFMvIg9kbQnYGBL7w/98eC6FuWCECcF5ultvaCoxIYvz6Wa0/jOpK6zhzAaOTPEI
	78LsArcW4e+Q4WbKDiocOHYDEw+r6hhGF+xSIudMXp79VOpraZaOM33M5ab7YDzF/xsSUkJiq1o
	jxSWj1vZ8McZHtVhP9qc+w3u46Q87VQDI8pCikmJO5E9V1hV2aZe6wm0ZTL4f1fEUMXEriXyn3m
	FywhLCzql0+yr5t/iX7Adwh5MwHm9JG+oxHq9Uaw35L+Di8evFoGHkvOcSF+pDbRfVYHkdkUdyL
	g9hbxj4DituKx/eaQY=
X-Received: by 2002:a05:6a20:158a:b0:39b:abdc:4215 with SMTP id adf61e73a8af0-3a08d68e0e4mr46011148637.10.1777255916491;
        Sun, 26 Apr 2026 19:11:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d2fa9sm31234668b3a.16.2026.04.26.19.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:11:56 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: eint: Drop base from mtk_eint_chip_write_mask()
Date: Mon, 27 Apr 2026 10:11:46 +0800
Message-ID: <20260427021148.2049555-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8111F46C0D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-35532-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]

When support for multiple EINT base addresses was added in commit
3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
addresses"), mtk_eint_chip_write_mask() was changed to write interrupt
masks for all base addresses in one call. However the "base" parameter
was left around and now causes sparse warnings:

    mtk-eint.c:428:44: warning: incorrect type in argument 2 (different address spaces)
    mtk-eint.c:428:44:    expected void [noderef] __iomem *base
    mtk-eint.c:428:44:    got void [noderef] __iomem **base
    mtk-eint.c:436:44: warning: incorrect type in argument 2 (different address spaces)
    mtk-eint.c:436:44:    expected void [noderef] __iomem *base
    mtk-eint.c:436:44:    got void [noderef] __iomem **base

Since the "base" parameter is no longer needed, just drop it.

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Only compile tested.
---
 drivers/pinctrl/mediatek/mtk-eint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 2a3c04eedc5f..47ac92ea98c2 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -246,7 +246,7 @@ static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
 }
 
 static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
-				     void __iomem *base, unsigned int **buf)
+				     unsigned int **buf)
 {
 	int inst, port, port_num;
 	void __iomem *reg;
@@ -425,7 +425,7 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 
 int mtk_eint_do_suspend(struct mtk_eint *eint)
 {
-	mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
+	mtk_eint_chip_write_mask(eint, eint->wake_mask);
 
 	return 0;
 }
@@ -433,7 +433,7 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
 
 int mtk_eint_do_resume(struct mtk_eint *eint)
 {
-	mtk_eint_chip_write_mask(eint, eint->base, eint->cur_mask);
+	mtk_eint_chip_write_mask(eint, eint->cur_mask);
 
 	return 0;
 }
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


