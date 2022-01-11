Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E37E48AC57
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 12:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349459AbiAKLXI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 06:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349464AbiAKLXE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 06:23:04 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18AFC0611FD
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 03:23:03 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id m13so17820622pji.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 03:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XJMwdxQLK+Yc5aZgEkEqO4a/X5AXx9F4PfWhov8Hxs8=;
        b=bEhZlvmkQ32PtcvKm5aAqYIL6LQ9DPmV5HnMEm5KaCHP09pskGIZ4Kvr0nb6z6FMHf
         cHIEn4cz5BsFmf0iYpCnBNZDrE/Jx8xEoSHjtdpuQpB9sNxUZBUPx0x1uPiAH2SSvrJy
         q3WDPxuNcQ/0/BSgL/CJzOP2BE/Zvpgmk3hhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XJMwdxQLK+Yc5aZgEkEqO4a/X5AXx9F4PfWhov8Hxs8=;
        b=PSZ55XJIMn9n3SAkH7gljFA/nulRsBdK+mP879emibRl0/9kM6a+pzIWd68s8KDq+/
         3co8W+raadfMiEMsn3/+ku5LcESGQKpWJNEnyFiXZ1MHe7i+WctUIiyBfClM0ZR4kqTf
         P90pLjQoirRcYT8AOdN+fK5mxFYY9GycY9+sbChm0QtA+8DK2WTIFhC7tqdaU9SiZKC5
         xZuEUEFt/gYWrWidcq/umwetiBrd6wHz3tJYwMb4H5n+yZU6HpZdKqr1xQXzqR3k0Nrt
         MLvfllQztUZXxpG3kb6P5yPOVTqOlRtiGMe/q63nOiKGi0PpO6rBe+Gg8Vac43/9oK9C
         fUYw==
X-Gm-Message-State: AOAM531tCZwwXpXW/Ed2T9wqlE8dGGc/JUlYm93YHAVwThbCh6vLzZFq
        U5htqa/w0ylqrnzbkTh8LdTPqQ==
X-Google-Smtp-Source: ABdhPJwgUUs7J/x2q3ewoDI+20IVqHL13sU6jp2n1RvR1TuH3+R1TaGSPO//aJ658I0TcJ6ZRcLkyw==
X-Received: by 2002:a62:8784:0:b0:4bd:b012:5299 with SMTP id i126-20020a628784000000b004bdb0125299mr4049283pfe.37.1641900183579;
        Tue, 11 Jan 2022 03:23:03 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
        by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:23:03 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 6/7] pinctrl: mediatek: paris: Skip custom extra pin config dump for vrtual GPIOs
Date:   Tue, 11 Jan 2022 19:22:43 +0800
Message-Id: <20220111112244.1483783-7-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Virtual GPIOs do not have any hardware state associated with them. Any
attempt to read back hardware state for these pins result in error
codes.

Skip dumping extra pin config information for these virtual GPIOs.

Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration dump via debugfs.")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 1bacabfbc183..678c8aa33012 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -585,6 +585,9 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
+	if (mtk_is_virt_gpio(hw, gpio))
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 	pinmux = mtk_pctrl_get_pinmux(hw, gpio);
 	if (pinmux >= hw->soc->nfuncs)
-- 
2.34.1.575.g55b058a8bb-goog

