Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0A910B3CD
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 17:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK0Qr7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 11:47:59 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42196 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfK0Qr7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 11:47:59 -0500
Received: by mail-pl1-f193.google.com with SMTP id j12so10011405plt.9;
        Wed, 27 Nov 2019 08:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9SZAmWvTSiI+gHLgs5Po7ArlmvrbXeX2vqZ4bfPjpcs=;
        b=bVuk4J6e71rPLDTWea4PmbbDyI1l7WwhvvuQPxoo5ZcZ+tUzptPml87q3c50o92rSb
         o5IRsIZ8Egk8d93YITnfjKr+EJHRDVe4wUABMkWcK1SMJqHe8V7WFlZqv13ap+g7Zl0B
         yS66lfpC7NQrIt0Tcrc4CjnhgIvttv5Km/TpjcPQ/PvZW4s/RZKWBIMu0A/pExYsEXc2
         oyd6YM7NZgjUK/fRtLJwE+n6olKwLe5eg/0DIPa1cqW6IZB6x4AODFc2GUAUsScfV27Z
         Bu4piH4y+rcvrkRl+DfEwimTYhXtCxyeXVQ4BJcvHWkD42uGT+UwxEkxARnoMaw25qTN
         KCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9SZAmWvTSiI+gHLgs5Po7ArlmvrbXeX2vqZ4bfPjpcs=;
        b=tVvDjHBGNUTylE8QR1i8TWbXGIntzmUdUuukFwpxyoRlLqvq5QSkfnlsbtIawC7cXe
         TrwNFvgyHTYZWwo92w4t1jeXqT4dIPTpDLUo+eD+pq/KzrAPYAF+7BZ+7NITcGGqqMqh
         Vk06udWye+2N7UW7gBxRVfM/n1FDOZVP/7b3PM6KubYhmmxUfmYKYNqIw2eT7MVzg3id
         99xM7ZWJZiUHOdtz34lL2cxXIgmzUAkrl2BPIbd77Fmt2SuOGZN0fwAlfUah8o1/ZGQg
         UJaavOGBE2Nn7HdifxIIIFSZA3aQAolRjm/8pz1K9nfYe9jEuA5pQ+K9eveG+ejiu9Zs
         A4dA==
X-Gm-Message-State: APjAAAX+/QC43A35All0TS4cesfE2cuDK8rUbBacifAKkJjbXkdn3i9u
        s1+uZEQu/AvlPysP6hsD7MgQBSwv9+7iMQ==
X-Google-Smtp-Source: APXvYqzi9jGmQiu2kA4LX2jnITpm6qRbd3wi313jRCjlpWXyLG1o/AqnWEHm4gPv739pkR1Ong4KUQ==
X-Received: by 2002:a17:902:b702:: with SMTP id d2mr5147195pls.104.1574873277975;
        Wed, 27 Nov 2019 08:47:57 -0800 (PST)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id i9sm4117846pfk.24.2019.11.27.08.47.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 08:47:57 -0800 (PST)
Date:   Wed, 27 Nov 2019 22:17:46 +0530
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
Subject: [PATCH 5/5] pinctrl: stm32: Use the correct style for SPDX License
 Identifier
Message-ID: <14bb695da50f7af8499e7dfc32c2ab753d92a3e9.1574871463.git.nishadkamdar@gmail.com>
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
header file related to STMicroelectronics pinctrl driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index ec0d34c33903..b0882d120765 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) Maxime Coquelin 2015
  * Copyright (C) STMicroelectronics 2017
-- 
2.17.1

