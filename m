Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8959410B3AA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 17:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfK0Qmp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 11:42:45 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36861 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbfK0Qmp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 11:42:45 -0500
Received: by mail-pg1-f196.google.com with SMTP id k13so11169258pgh.3;
        Wed, 27 Nov 2019 08:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xl4Glegm6mdECeLqfmquxCwZlwbSQB4i6Znnj9ZE+DI=;
        b=aaLImqaXXEFyDQoHrPEMGh8ndhdl9gZJuOmHyu+pZZDTZWbfo8bKC+whjrSQVWhuxU
         NYt+PbFK7OG+rEYQVDWtB8A0KHHEIDstj61l0+aHTIFEZ3ibUY4OeJYXrC+28XbcaqqY
         atqmBXE+O4sp1cYypiKae5R6bxlRt8myyVVJ1So1UTPM+Bv2pXNfGlal4+Fo2eYANxA/
         b9F0B4VdjmNO6gO5aXgVhVpAa8kcNBSkcwJzRmb4430VOcNRZAgSNLtP/9Oiq7y1w4ne
         sjDEqe9L1scDSQetQaLeZAncSNqzJT0GL8oFf05RRmWtALJqS5XFvK2+YIZ0W4zrVlL+
         F/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xl4Glegm6mdECeLqfmquxCwZlwbSQB4i6Znnj9ZE+DI=;
        b=sm4zht0CJP5BCBiW8y2MeACz+wJL4q4J3xfdoFlOamvD22jT/LS+XIRWQUhAb2feui
         gHUhHrWV0jloVV9qudV1bdwBxdVwG4hcD54gmTGHIvIzjg+AC5Xbw3r5/BFjxH20+pqW
         XDf33ffB8OUs7CBnVat0JqiD07ytGPP0r0qAZVRWEwFUfImqzZl6FsxN+hLjwoiGVe9o
         lfoAuUnz+p8fj2nxwRDaJSd4jy44o+YiMpbeP2IbIPKoUkh+YXZmB41WonXn5XkCKbsc
         omfmGEIilmDAUT45eTXFHTfRqgb87S13jLs9luRETlayo0gqTzhu9eEkhAxGJ7zGHiC9
         G1Nw==
X-Gm-Message-State: APjAAAW/xX3we6aGAIunyDdJnj80aUaDDl2EP/L0JUFkd5oGzG1mo/ny
        d88A2SopTZNBiG965T3VJeg=
X-Google-Smtp-Source: APXvYqwlDU2Ab8PAuwqLDAc5/btU/U8B8e0EchIgGnZlTuxZOq1jBwxBcCm7mSvfv1ntAHxZjKgsbg==
X-Received: by 2002:a65:590f:: with SMTP id f15mr5870948pgu.381.1574872964385;
        Wed, 27 Nov 2019 08:42:44 -0800 (PST)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id v3sm16827100pfn.129.2019.11.27.08.42.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 08:42:43 -0800 (PST)
Date:   Wed, 27 Nov 2019 22:12:33 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] pinctrl: mediatek: Use the correct style for SPDX
 License Identifier
Message-ID: <2994fb2f3375790e832396cdbb0a279dc8c8839f.1574871463.git.nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1574871463.git.nishadkamdar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch corrects the SPDX License Identifier style in
header file related mediatek mt2712 pinctrl driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h
index ba2356a8ab89..845c408b5fdb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2018 MediaTek Inc.
  * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
-- 
2.17.1

