Return-Path: <linux-gpio+bounces-25760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7ECB499A6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 21:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31482205D40
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369F324677C;
	Mon,  8 Sep 2025 19:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="GkuWSbhV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D10D246797
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 19:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359114; cv=none; b=fRRPdey+ePYNY2DLNqFhAifyDNBBkCv8SXDhHex5sbO/ZRqYLA7Tta8uC1OejK9T0rXt1oR0ICnywez9kO9FXFhgd4kBIv7vdgRDdFSb1KIbqzDgUeJjr6F3uhLSmzcCrrmA1FUW3B4qxgHL+ohBItpVt3i4Gmv9ZpY+vAdJyqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359114; c=relaxed/simple;
	bh=69wZ5GHrPC28zn0t4afWJoHx8q9PR+vnYPu2VWKajxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GbJXNaeZCkBcaj8RbI2DbWKq/g3nF18Tk8P3asioG2JZnJelxmKQJ4U3FPEoRWDUpGPy/3taJEOuIB/pyxD9KtHFLNFfaIxLNzsqgXNYHSUIl8GkrVRsQx0hKUBSp2x3s4wI+I58NQivdQxplVDYdd8HqHv8hh63924agI997+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=GkuWSbhV; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=GkuWSbhVXHil6qIMMVjeb4t5gL7UJ7Yi4LzVMs5TQLBluMeuudRFY1o9X3oxzkxw+2XThPtfuccv7WFGQQcS8mqq8NH68LTfNaAb9FxtKOsOm2Q95oduqqC6DPQdjV6DJWvUGZCi9BhdheZsfDEbPW4/1qpFxvmJM0ey09+ELw3jC5v4fFzrl7HirltiyKwb2l1RL4XfLGA2ab3l4Xxx2NBOSMusZb3SWlK2tCl7SQa6Zbw+HvmiRyA0rz3g2OokGryIbBajAVeOeLIw6g+ZFCQK6A+nRTPX3mfUd1BU1Ywb7FlFxqhIdyG8fXK3uUDvyWT5SWPfbJ4wuyzYZaJ5lQ==; s=purelymail2; d=purelymail.com; v=1; bh=69wZ5GHrPC28zn0t4afWJoHx8q9PR+vnYPu2VWKajxo=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 292196779;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 08 Sep 2025 19:18:14 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 08 Sep 2025 21:17:57 +0200
Subject: [PATCH 3/4] pinctrl: mediatek: Add debounce times for MT6878
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-mt6878-pinctrl-support-v1-3-3fb78c8ab4e8@mentallysanemainliners.org>
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757359086; l=1463;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=69wZ5GHrPC28zn0t4afWJoHx8q9PR+vnYPu2VWKajxo=;
 b=DdLiMNyKJkAG5VtyMqqRyNaNB2fQY33/0dbJMn98gXZidxqgMaWMM6c02MQBPL8pcqhuIk6XU
 iG1FN2hUtMSD5YJm/3HnNCCKKeAYejNjD37oKJS8NKmftXIB42Y0Y+z
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

MT6878 uses different debounce times than other SoCs. Add them to the
EINT driver.
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


