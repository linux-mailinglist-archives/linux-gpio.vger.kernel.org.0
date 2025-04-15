Return-Path: <linux-gpio+bounces-18848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3732A89C65
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A1B4443716
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD5C29B770;
	Tue, 15 Apr 2025 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M8HnkicC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7852918C3
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716226; cv=none; b=TDa/a+qNdS3zmgzZ27HlYAFeve3zB2bFOZ4V1RGdYme87Vuif0n78JxWM1JBYL0+Xwt77YTadQ1DQ55f5EMsjYQex+9SPIkYPWGpm1f/eagtL2Cq+0BOD53QCnhi6mf2iNeobVT2arICXq0B/+CFUcShMQtJ0k4aHF0orOaCVXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716226; c=relaxed/simple;
	bh=PF3l3c0RlgTSrkT0Lcop8ROwRYuJe0YUYCpoN+ANMf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m+ozlt5SUNUXfx+s1c3HqcrnZOn7JM4B1tZ4TsvctMy5H5D6qxPBylGdRE5+FwoMTS97+83U6G+Az5joj3E4sxtExUiScs9IhYzpvH2ztfbTIX/NuIODKLzCRI+LEEZX1YX6H65dPQ+0VzGOh8txqTqcfQkYF+prbwwjiiCniNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M8HnkicC; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736bfa487c3so4645194b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 04:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744716224; x=1745321024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xqiBmH3cXQhVO3Oi9TyesxzQNNmvWhKNONR9ZJLERQE=;
        b=M8HnkicCO+jItc2zihqNpMBT5YFs3bbhUk2b0WuOaHFPTkfgH7sBUbaez1Iv+qHACv
         zIUYvZ/dsaFrt4OTrTFAg09XW0ZYEBZG5yS67TkhMgBeIvWcXqzrG8rwWTtwA6RFC7E4
         wgm4EMXSFb5CW6Q2LQ7O3EfThyOFTY+w9FGmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716224; x=1745321024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqiBmH3cXQhVO3Oi9TyesxzQNNmvWhKNONR9ZJLERQE=;
        b=vwflesavluwS7A/1juzYCVtQHNvDMbLUjsWX5nq+tcwwwQUnLe4fS/Rm9rchIhVkpw
         U8GA2s5Lj6Ti1jOyEE/co9CUjiPqrHzGw48niON5aqsZ9wPNMZr1TdexXOg2hcGpNx5L
         n2l6Osa/Gs3HAoY6qn5WDctV0eddI0N0PhCQhxovXNS6SUT/Fd5zZS1ewZniz/HjyVbY
         nKd8g2h2rN76mqIWZ+66vzEzMrWk0K7VfuDBSy1ZXAkt5uPka5RAw8XWu6KVTp+tH7cC
         VEWZUfcMq3dlK/zhU634QIPBc1XzKoR6DH+Eg7KG0XNX0/Vl+AK/1BQTMBbiXGZ9G89b
         nffA==
X-Forwarded-Encrypted: i=1; AJvYcCUp8LTdS3mC85RZ/acc6fIZa2zQ7q/BMrwwlqEJF9oWlYBONXbVly4811hZDUPnMKiAU4CbjCt/3BSk@vger.kernel.org
X-Gm-Message-State: AOJu0YzneQVA5JtzYrHsUfsvt3STY54pRXdlZUXrlTeuHQqbUmkCBStZ
	UaeKdsuxXkLHiswrRbtkpP/8nwaS7++sT8c26sTFiDujBLbwrCrB7zLWYRG8hw==
X-Gm-Gg: ASbGnctaVlXkeAf+TPwYFkXKUj6RM0lFzjKjbd/PxHGAZq/cwLWpTAahewcM40TxTlA
	XDhLSmaIDn0CH8rEHyilWpYGjBpdf7ypU6uQ1b1EpBB66rsK5SyLkEjuJ9wgUz3Ncf4GYMxv5pp
	47/dK25Prze12gXipwDq9Y7Cq4jaWRdvxmadkrOAAQVXnJ4zbNia0wcX804N+K8tDReijuWivSb
	Q4sESuG2+pudveKdzeyKk+J9HXHx1JtqlGj+Xg6Q6dG3L5N+T9lxRMPxsJRlfkvUlxoDCOrqoh+
	wRU/pB3EZRb7Ih9LMXBqs59HNLONYJ5Cas+CHo5ctYippRyU3H4YQD+DKQ==
X-Google-Smtp-Source: AGHT+IHLztgc2AXA8MRVXKVLULr5aHlO9vKzoTKy2KAhml+hRnJpGVjxL+/NKMKFeR5E/N1M9tqKmA==
X-Received: by 2002:a05:6a00:1481:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73bd0e97a1emr19543011b3a.0.1744716224175;
        Tue, 15 Apr 2025 04:23:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:558:e14a:ece3:dc28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f105asm8244136b3a.116.2025.04.15.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:23:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers
Date: Tue, 15 Apr 2025 19:23:37 +0800
Message-ID: <20250415112339.2385454-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When EINT support for multiple addresses was introduced, the driver
library for the older generations (pinctrl-mtk-common) was not fixed
together. This resulted in invalid pointer accesses.

Fix up the filled in |struct mtk_eint| in pinctrl-mtk-common to match
what is now expected by the mtk-eint library.

Reported-by: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Closes: https://lore.kernel.org/all/43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn/
Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Stepped on this today on an MT8173 Chromebook. Thanks goes out to Uwe
for pointing out what was broken.

This should be applied and sent to Torvald's tree ASAP.

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 91edb539925a..7585de11854b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1015,7 +1015,13 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	if (!pctl->eint)
 		return -ENOMEM;
 
-	pctl->eint->base = devm_platform_ioremap_resource(pdev, 0);
+	pctl->eint->nbase = 1;
+	/* mtk-eint expects an array */
+	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(pctl->eint->base), GFP_KERNEL);
+	if (IS_ERR(pctl->eint->base))
+		return -ENOMEM;
+
+	pctl->eint->base[0] = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctl->eint->base))
 		return PTR_ERR(pctl->eint->base);
 
-- 
2.49.0.604.gff1f9ca942-goog


