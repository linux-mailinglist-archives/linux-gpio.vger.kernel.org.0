Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03DE6172A4
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 09:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfEHHdn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 03:33:43 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44875 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfEHHdm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 03:33:42 -0400
Received: by mail-pf1-f194.google.com with SMTP id y13so10031028pfm.11
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2019 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yDsrcSSMgKGSHP0Nk2ne2DJD7hpeUAFwPm0h/OfCnfA=;
        b=AObE5Z8+K0moA2ZDjDuuVYvjyFV8h5J1tWcLuUJBcmiP/jFRjCim4AgJX0Nca0aIPX
         EypRszSAUAWGvknuUsSwSlHu8TWCt1PWuSqCE5eNuSgzXtrbVcSeOWbvgsUU1UVdolnE
         dfDbBe8Icbe2pSeTEhAANpRG20bTjfj6NIgbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yDsrcSSMgKGSHP0Nk2ne2DJD7hpeUAFwPm0h/OfCnfA=;
        b=Fosu6MB2ppihgCqgDzZH55/M6217fSYDrf3u1t4EVCe9Ng4eu5DrtHbksb4dBsDZEO
         4jsXdD6h5WGH9CIpwruc5MFlx5PUr5ZZxK2e0qvCLxAAayKx47ZMcaflQRv0Pe69y1P7
         sh+2zkVs4aXkSRFMdb7iVAJ3/eJe8eC9gzKLx4pCahKSONoOW/IyhI59kp6BAsyMDw2u
         xSFxlTXMFBF3pEfekqzq02DbN5mReWuWXlK+bwsacnXPvx7EPXiKBPjvLov8quejlIN+
         X77Q+iIOdHNo3/kVVG6fCDniln78rooy8+7R0xpNZkENKZzpAnNXsZghNQaVLcxeg0Ny
         NxKQ==
X-Gm-Message-State: APjAAAUfFyRIGOeeRz/wrG7FencgVR1FPmqgViw4vUBPoab36oOH7R5o
        eYOd/qZNKB9AlwdPhq8CB47Gug==
X-Google-Smtp-Source: APXvYqwWepJc8Vx1tWBJxhjhsou707KRMm7b8Hle1JQuHz0nesKvf5DEHLJ8HVvOxV5wR8OOx+46Mg==
X-Received: by 2002:a62:e50a:: with SMTP id n10mr47328035pff.55.1557300821684;
        Wed, 08 May 2019 00:33:41 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id n26sm29539047pfi.165.2019.05.08.00.33.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 00:33:41 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org,
        swboyd@chromium.org
Subject: [PATCH v2 2/2] pinctrl: mediatek: mt8183: Add pm_ops
Date:   Wed,  8 May 2019 15:33:31 +0800
Message-Id: <20190508073331.27475-3-drinkcat@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190508073331.27475-1-drinkcat@chromium.org>
References: <20190508073331.27475-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Setting this up will configure wake from suspend properly,
and wake only for the interrupts that are setup in wake_mask,
not all interrupts.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt8183.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
index 2c7409ed16fae9c..9a74d5025be648d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
@@ -583,6 +583,7 @@ static struct platform_driver mt8183_pinctrl_driver = {
 	.driver = {
 		.name = "mt8183-pinctrl",
 		.of_match_table = mt8183_pinctrl_of_match,
+		.pm = &mtk_paris_pinctrl_pm_ops,
 	},
 	.probe = mt8183_pinctrl_probe,
 };
-- 
2.21.0.1020.gf2820cf01a-goog

