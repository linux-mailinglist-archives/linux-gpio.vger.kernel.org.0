Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE91710B3B8
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 17:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfK0Qoe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 11:44:34 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:38621 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfK0Qoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 11:44:34 -0500
Received: by mail-pj1-f67.google.com with SMTP id f7so10267268pjw.5;
        Wed, 27 Nov 2019 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=whErUc4BDiJMZ5xY3J/KJ/8CM+fMkJiEkPObAvIrJNY=;
        b=IrlA9jBoYhmnJLv3XX1CbNuYLMmcJ20omNiqylLbqKNY7YXmt5Qg/tzaiDbcvEWRJK
         LAHOhWLyA/laKOk7HCohToz0fPm5rZ5anSEPArvahmgydJXYD3d4FJ3loZNxqXeNWl1y
         wtepn0Z6Bpw2qvYFLZfU3TKSbDcDJBi7F+805QOAsDJrFTbBkgAr6IDkKcb1mgHK26xx
         7dH6YKmNo7AA3SOht4pAksRArEDouCbxLv/ZbHdVujMaso/1Il1sUuXGTjNla8xixG95
         AkBCdedD7tjrwJxwv7h4Mjl+WBKvopx/3Dnfvhf99W9n9FKhOJFvkpkzsqY7dQT1aWUN
         tKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=whErUc4BDiJMZ5xY3J/KJ/8CM+fMkJiEkPObAvIrJNY=;
        b=CaKGxqU1tTAJS8612/qRqvJmc5MfKMuNItl+HTFlpxvU9Z6m9nMoto24QiFiyLPDL5
         T19F2x0NIIlF++McVYRyV1CaSdMuan9rr7gVQTubEDwfwmZSgXv9i2yQ9jOeSTBTnwvA
         DDSsv7UOmn5p/fQiTz7ZEA6NoehGwQ+vWsV5IE0USikonYgyW6VNmoZP0F26OK6+Jw4i
         R/kfA3RCMLDS/3CapFWSbtcZQRRu5IIAZuPB/hYcwBUa8xfBV7fY2LDZCvFuwqJNd0LQ
         s8Op9G78R/r3yuBORlW/f7XQ/FhQDci9DWe5DkaitJF9OVW1is1eRgR174r1aqURHd5K
         zmbg==
X-Gm-Message-State: APjAAAXZFh6Ls7WmboPXCnxULfYjWIEQ+oQSLA9uPUzQZUlUkLVyTXSx
        ml1THW2DWsoCErYbgnXCmIFj7+Ja49m5Tw==
X-Google-Smtp-Source: APXvYqxU5CUXFdGJB2Ooeq9rK1fyfcqrLOz+Hg0d0n70pp541B+B9o7dx7Stb4JEkXaH6oaMWoeZug==
X-Received: by 2002:a17:902:bb84:: with SMTP id m4mr4987230pls.255.1574873073243;
        Wed, 27 Nov 2019 08:44:33 -0800 (PST)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id z11sm18371211pfg.117.2019.11.27.08.44.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 08:44:32 -0800 (PST)
Date:   Wed, 27 Nov 2019 22:14:22 +0530
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
Subject: [PATCH 3/5] pinctrl: meson-axg: Use the correct style for SPDX
 License Identifier
Message-ID: <bcb86aa22d8d8499502bbd8c54a364be24886a86.1574871463.git.nishadkamdar@gmail.com>
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
header file related Meson axg SoC pinctrl driver.
It assigns explicit block comment for the SPDX License Identifier.

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
index 8ff88bf2e849..aa79d7ecee00 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
 /*
  * Copyright (c) 2017 Baylibre SAS.
  * Author:  Jerome Brunet  <jbrunet@baylibre.com>
@@ -5,7 +6,6 @@
  * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
  * Author: Xingyu Chen <xingyu.chen@amlogic.com>
  *
- * SPDX-License-Identifier: (GPL-2.0+ or MIT)
  */
 
 struct meson_pmx_bank {
-- 
2.17.1

