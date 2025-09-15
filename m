Return-Path: <linux-gpio+bounces-26168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98593B57BBC
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F591164D14
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B27930DEC4;
	Mon, 15 Sep 2025 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="uu/gMIxT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644AA30BF55
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757940435; cv=none; b=C+EM0kmes8r5yz5r+kQ420mSfK131J0CMK8oCa3ZGcjJSz13iRlnjHjdNicE/RiV/k5eNWRpaDVxSDhkKrNd5qHEu5LGgxF75dObQLaGUq2ODYA7iYVb8PNltKuLk005ePOl1d2CP47Y92eDGAlUArLEuFWa2NYjiB7bVxXZMFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757940435; c=relaxed/simple;
	bh=EocTBfRhuqVV5QheA/P/utq8S19upYhfTSQz2Zpf1do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmAJCR3YUVm68Qn1r0zg4KBIEQBf/KOjHcgJnhKMB8J/tPkoKEB8Y21FdgS6xJ2RafZHw+5PS7agL8KNvpCbJtprNF0IRdD5BPjQnxAIHvEFBSJoxSpliXEsx78jaoqxDlytovOnDGcUJDIQqRkdK1kITyZzpNmzYPjc+DcQ4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=uu/gMIxT; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=uu/gMIxTOJZHAzP8oYJjcIpztQhHUgf09obUDi3ID1xeRLz9DRf3VWMWg4ECpxT0To7+QfDzfnlMkXL3dOrKUKjRD3kW+oQzP9GWTWT31zByp+BYgrLouVPsn70DfaHIClDbgpGK7mNHH6/lWYHVPmV5G6hsGNH/2D8zfmZdCXhUCu4U8FLxEO9NLOHfTx18TxIPpb1l077186jKGEmlFeIZDiTVQeLsqBwFxoIs0wzcEDmHE/8Boy2CLKPCq+Z5KDWaCLtOUT+8HcEoSYYVfC3VC5B1oPC2Ny2pqW1xdIQaQB6HsL54O2ijru34AVI3ybJjvppM6B1/qqHk6lv3dw==; s=purelymail3; d=purelymail.com; v=1; bh=EocTBfRhuqVV5QheA/P/utq8S19upYhfTSQz2Zpf1do=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1506483826;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 15 Sep 2025 12:46:32 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 15 Sep 2025 14:46:24 +0200
Subject: [PATCH v3 2/4] pinctrl: mediatek: Add debounce times for MT6878
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-mt6878-pinctrl-support-v3-2-593cc007d4cf@mentallysanemainliners.org>
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757940385; l=1617;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=EocTBfRhuqVV5QheA/P/utq8S19upYhfTSQz2Zpf1do=;
 b=U+bY7U9xUd0C4Z7k+0r/AwFbEZznVSRDowQDdQjlcm7N6QSO4UdkET41xnzth3uOtFhOcnt9v
 Jz3FjqFJ0s8D7dX9UbiW99RK2v6PUFV70apsJLXq7h7psGgaNN2LS3R
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

MT6878 uses different debounce times than other SoCs. Add them to the
EINT driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 5 +++++
 drivers/pinctrl/mediatek/mtk-eint.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 9f175c73613f84b47c0160947f32da7aca7d5a18..c8c5097c11c4d14eb41bdd7f9cb93b4a5756d2b2 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -66,6 +66,11 @@ const unsigned int debounce_time_mt6795[] = {
 };
 EXPORT_SYMBOL_GPL(debounce_time_mt6795);
 
+const unsigned int debounce_time_mt6878[] = {
+	156, 313, 625, 1250, 20000, 40000, 80000, 160000, 320000, 640000, 0
+};
+EXPORT_SYMBOL_GPL(debounce_time_mt6878);
+
 static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
 					 unsigned int eint_num,
 					 unsigned int offset)
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index fc31a4c0c77bf28b106943e9292d0dcc425c4922..3cdd6f6310cd0da5aa74623c5f1dbe8f8495d689 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -52,6 +52,7 @@ struct mtk_eint_pin {
 extern const unsigned int debounce_time_mt2701[];
 extern const unsigned int debounce_time_mt6765[];
 extern const unsigned int debounce_time_mt6795[];
+extern const unsigned int debounce_time_mt6878[];
 
 struct mtk_eint;
 

-- 
2.51.0


