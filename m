Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB613165E78
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 14:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgBTNPh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 08:15:37 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53289 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbgBTNPh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 08:15:37 -0500
Received: by mail-wm1-f66.google.com with SMTP id s10so1954740wmh.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 05:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=XbSocyvlHYbidOLh4UOVd5RVPSZd3HbLsAjRlUOFqzE=;
        b=cL9Qls0rrY+UzGeBw0dqcz5IcrwkrepfPyKpcfyhixITUM1d5/ShOLtYyv9e2ht9re
         vNF4EHS1lout8tWKpDNYeE1wRWJUB1sne2NqK/Fp8QN4MgqLCzv/LyFVKSl2MdP7TfsB
         jFYPfRkh6ytqAY8bNihNOxsftGETYTp9skzjC6gCf6wScN7+DVr3ntlwNTnbiS/vsVrq
         RW6sXB8KpGLV3EjfZJLIAAN+AZLCNu9ksf6Vt5nE4aSeDTxWlB0KqxTWvlA1uAqcXnQm
         31OCyhy4DJ6uyFnqeGplku3fQIs7GQi4AbO0uQU83nieE6vYGS8SxvvzL18IuhEZ+PGC
         aTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XbSocyvlHYbidOLh4UOVd5RVPSZd3HbLsAjRlUOFqzE=;
        b=Ztt1bKqk6VDNRzIn3hNrHy9bowZLvfMLuQkGGPYIsTefg4ALBKSwQPZZNUPM+foTWE
         y+9cEP9qGgEoQAE3Ck23JEElRwNy1YCAAt3fUQ05vh9gs699rt89I8LUX83JNdppeqch
         /l1WBqJpL6G5gy5wMnSK6fuJ72TPTJsV6+TG02YWncns0dtiqSbTmRG79DJ9H8j7PpSk
         bWjzdX1dm6mdWLfssXrIlo01f6vG6YmPD4Qmmlv49gJZM7FIId+VgnyucxC5U8ThlYai
         gKyVBrXzyvGFsCdzoUBckEFNqToQzphzUuFnKYHX8/buBrBqDdC+XMEFiguCBV9Mpl/q
         FWJw==
X-Gm-Message-State: APjAAAU8Xk34LlXtDl0eZHIOIMjmybkdmvweSByp8ukvLgo5k+J7JhGc
        8h73dR/8LOJK5ezud62m5PJUEA==
X-Google-Smtp-Source: APXvYqxJi6xwPPsEIzGnzgqipWlqaAxHhHMEH+ezeWOrFPemY21Bt4/b8HeNAvszDL/6lNpuF+oXFQ==
X-Received: by 2002:a7b:c851:: with SMTP id c17mr4468157wml.71.1582204535329;
        Thu, 20 Feb 2020 05:15:35 -0800 (PST)
Received: from nbelin-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d204sm4382774wmd.30.2020.02.20.05.15.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Feb 2020 05:15:34 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linus.walleij@linaro.org
Cc:     khilman@baylibre.com, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH RESEND] pinctrl: meson-gxl: fix GPIOX sdio pins
Date:   Thu, 20 Feb 2020 14:15:12 +0100
Message-Id: <1582204512-7582-1-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the gxl driver, the sdio cmd and clk pins are inverted. It has not caused
any issue so far because devices using these pins always take both pins
so the resulting configuration is OK.

Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---

Hi Linus,

Sorry for the the bad formatting of the first patch, this one should be fine.

Thanks

Nicolas

 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 1b6e8646700f..2ac921c83da9 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -147,8 +147,8 @@ static const unsigned int sdio_d0_pins[]	= { GPIOX_0 };
 static const unsigned int sdio_d1_pins[]	= { GPIOX_1 };
 static const unsigned int sdio_d2_pins[]	= { GPIOX_2 };
 static const unsigned int sdio_d3_pins[]	= { GPIOX_3 };
-static const unsigned int sdio_cmd_pins[]	= { GPIOX_4 };
-static const unsigned int sdio_clk_pins[]	= { GPIOX_5 };
+static const unsigned int sdio_clk_pins[]	= { GPIOX_4 };
+static const unsigned int sdio_cmd_pins[]	= { GPIOX_5 };
 static const unsigned int sdio_irq_pins[]	= { GPIOX_7 };
 
 static const unsigned int nand_ce0_pins[]	= { BOOT_8 };
-- 
2.7.4

