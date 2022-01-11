Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236AF48AC55
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 12:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349409AbiAKLXG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 06:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349440AbiAKLXC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 06:23:02 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32F8C06175C
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 03:23:01 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id lr15-20020a17090b4b8f00b001b19671cbebso5251245pjb.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1fEL/KVXQTE5AFQeTwaZaRarWCZCE1VjWBv8zykoqdY=;
        b=QvkvjmrvGZQq6KX1p+b9jRBnwdYwTHBqvdbuW/mMltZPFt0nG/YHdjgwUaIK+CXEbc
         RC96srRjO9HMfi5xOAbvokyZ4lS5um5OsYATwqKsAlnI0XrhDFMsS5udxTpXCST/JAio
         D5x9YVt4OjqNJiAHP0wwVs2J3PRVrLwrEPXjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1fEL/KVXQTE5AFQeTwaZaRarWCZCE1VjWBv8zykoqdY=;
        b=y5PWxiHnYlPbwVlCz2cAbRGZjx0j0WauZNCw+i9TCEGUXbdQ71ProWPcTciyibVfiY
         x/kzL25txcMMxiH1xajRYs4pDcQtQ3dSWpA7mQjFekWkMaEN5g8XfM68ZTkHYDg1qDg6
         A9Zkq9GrTZLQezarfP2d5mIQCmJ9hbj+B4ZgJtDkfFHaFDKE1hVKPxIo5qi4tgGxXfuu
         BcEudUm6WNDZRC/8uqFvnhKZg3S6TMl9e1++k0RIxglQL4S+oa54Jx6Dkk+54avUENKj
         giBzXW4MyOr2zzdXXVclwcNIGrTqSeH1tPoS/Lg5bwASDrGc/n3nHXnzJBEEB2+EUmQX
         MpqQ==
X-Gm-Message-State: AOAM533ldakQOdscSnbFGimgQ/H0EkWgM/M1oBuiQVa5NaF/qDG+f3TV
        B2N2lGC7FzpHqqaKinVGdvzXmw==
X-Google-Smtp-Source: ABdhPJxDZb8hKxuj9Fyjpv8O0cKzuluDJhQ8YRywEa9PHkMM1/QHq5Y5ZmWv+lFYPzArvfca0QIniQ==
X-Received: by 2002:a17:903:110d:b0:149:a833:af21 with SMTP id n13-20020a170903110d00b00149a833af21mr4177450plh.14.1641900181239;
        Tue, 11 Jan 2022 03:23:01 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
        by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:23:00 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 5/7] pinctrl: mediatek: paris: Drop extra newline in mtk_pctrl_show_one_pin()
Date:   Tue, 11 Jan 2022 19:22:42 +0800
Message-Id: <20220111112244.1483783-6-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The caller of mtk_pctrl_show_one_pin() is responsible for printing the
full line. mtk_pctrl_show_one_pin(), called through mtk_pctrl_dbg_show(),
should only produce a string containing the extra information the driver
wants included.

Drop the extra newlines.

Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration dump via debugfs.")
Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index d259f075c62d..1bacabfbc183 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -639,12 +639,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 			pullup);
 
 	if (r1 != -1) {
-		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
+		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)",
 			r1, r0);
 	} else if (rsel != -1) {
-		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
-	} else {
-		len += scnprintf(buf + len, buf_len - len, "\n");
+		len += scnprintf(buf + len, buf_len - len, " (%1d)", rsel);
 	}
 
 	return len;
-- 
2.34.1.575.g55b058a8bb-goog

