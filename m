Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7A4A10B3C3
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 17:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfK0QqB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 11:46:01 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44232 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfK0QqA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 11:46:00 -0500
Received: by mail-pf1-f195.google.com with SMTP id d199so6654181pfd.11;
        Wed, 27 Nov 2019 08:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Tj5ZEHjlL0iZSNA+rHkAWXmN0KEeZgtZHyN1eOwk32Y=;
        b=k9J2Ifpg4j+1FH8t6rWuy0uynpeC4gjGtBp09I2ky9UZukixjIow3FIhPcE2F/M7ED
         Tc9yNQguerPjWujTgAKtdngHQiYwOFy7g8DyinPmwYSOd2biBcy3hDxi+0zd/H2CKPoR
         ZOkXucWQZEweQ9f+CBAle5Wcrb5VK6F2pUWErYXFH7Zt8dQ2FOeuaKDQt0g9/x577lJr
         LbAVBHGx7hv+F+mSttjNRr7LM4CIcFHO5INuzmF7sr1tPLrNn9hSUd+8jgqPNdzoEgWJ
         X2bWOSjbftKm/ad0Yy4j3knPQVjngjsE/9w/L7TXAS5RUx6w1XSKp1uda0Cm/nfUg+m0
         c9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tj5ZEHjlL0iZSNA+rHkAWXmN0KEeZgtZHyN1eOwk32Y=;
        b=mMalvUn5HtfkWEAWIplS+9+PyFMt2XW5rt+yg38uGBRhSSxt6+/9kl8Y4k69inKMVZ
         z4ujKglbvKYpzANz5q+tvE5pydoCWYIIOe5JIkeUEZ/Vn3GH6/EI3COIK5gYucizurey
         lQqdb6knvQsnickjk2xLbsestQql3/b0/gNNrs2kdmnR6/+C5YlruPFsSQ4JgMrExkMk
         ckNgeC+xj0l+aroo/O1oDXuzBhNHQY2gOXkTZ5vE0rByHDHpuHhiJrcCd7aNdClJ1LGA
         ZF+lsWhnBbLFIBQvTRhU3EG+Vmzq44vkh9SaLcqqfMaamdDIJevkiKKs4Txaf1S7JsyU
         fiOg==
X-Gm-Message-State: APjAAAXDBWRy9TkK50PKeWLk6NfiH4In+D1nCCh/q7ByHaGpM9y2xMup
        s7b5bSytS+cCl0rYV6/GefY=
X-Google-Smtp-Source: APXvYqzlUwwE1e5ZlvYiDCVGgUwc4Bu633wd7znJmjBhjUROKMtJj5O/PGEBApa4LvO6N5r6fvnykw==
X-Received: by 2002:a62:2686:: with SMTP id m128mr48513352pfm.143.1574873159861;
        Wed, 27 Nov 2019 08:45:59 -0800 (PST)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id i9sm4113911pfk.24.2019.11.27.08.45.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 08:45:59 -0800 (PST)
Date:   Wed, 27 Nov 2019 22:15:48 +0530
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
Subject: [PATCH 4/5] pinctrl: sh-pfc: Use the correct style for SPDX License
 Identifier
Message-ID: <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
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
header files related to Reneses Soc pinctrl driver.
It assigns explicit block comment for the SPDX License Identifier.

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/sh-pfc/core.h   | 4 ++--
 drivers/pinctrl/sh-pfc/sh_pfc.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.h b/drivers/pinctrl/sh-pfc/core.h
index b5b1d163e98a..5ad0ab8f9e14 100644
--- a/drivers/pinctrl/sh-pfc/core.h
+++ b/drivers/pinctrl/sh-pfc/core.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * SuperH Pin Function Controller support.
  *
  * Copyright (C) 2012  Renesas Solutions Corp.
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 640d2a4cb838..fff9cbb7a0f8 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * SuperH Pin Function Controller Support
  *
  * Copyright (c) 2008 Magnus Damm
-- 
2.17.1

