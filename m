Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D431529C9
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2020 12:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgBELWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Feb 2020 06:22:41 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:44807 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbgBELWk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2020 06:22:40 -0500
Received: by mail-il1-f196.google.com with SMTP id s85so1527877ill.11
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2020 03:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=pgwocbE6mhkA+OKhecgcAoXn10XYW3UASVoDr7OU9dI=;
        b=wI13iTubTuBMBiK5CXbDSnV98whJDiMVXtwTTvmUaPOouESwx7uSl+JRcgxKUj+5eT
         kJMfS4c0Wfmp0CUmxUH/AAmuoXPMshDoAXSsbdkRrl41dw5zes7AuPiBnqIb0t/heFqj
         vDL96yT5Z4hxVyycq/s0PPzY9Bpv1i0SR066Sd+d5Qk3fr8dxdqoiX3sg5oX36Ww6RiV
         JlYudq4/zIx+rlzxMBX20EwN224Ii5I9NfpFGhTTI+RSLmTnqzEfrOh9eyvUfI+QSbQD
         MppFNlKOlfnjy+btwdiXoyT+3vHlqJdVUHfXWn+ZXcT1KOv7iM+crNqzTlM/PYC5e39C
         aDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=pgwocbE6mhkA+OKhecgcAoXn10XYW3UASVoDr7OU9dI=;
        b=taiM2G+ftnab9t69NF8im+UfwDnqYA0f/v+VPNS77mKUitam588bfyp5gApwSPNf8m
         YrfyOb2fozhT/sRR3FDcFMOXcUpQREiM4MPW9Dd5RvBhRE5JkifgeJ4Yi0Jt+gMfWPyH
         llUmNv/bHJpvF33/MTMD9Hbs66IhrITkR0Fkaec8aNZsoNvQXs6P4m5hChwAAbgvMF7F
         NHJ2WvVup7VkYLra0yrmcGGOzhO0b8d3DEDdIYLYriI4PiWk2PEa5L4E6o014tkiMm31
         O9wzCTTJ3MnMDJp0oNpd9fnUuPGFPntefjOQWgdvNxAlSs0Yo7Kd0gHnwzj3UiyMdQYH
         LVIg==
X-Gm-Message-State: APjAAAU6s5W0Bvulx158eNVh0kd2/hwb6QEdYynw0zxMrSFqHA4N0Q2W
        cQL3WT4eoJSIyp4GFhxUSdISg35uwU9knrGo7QWnexvOVCw=
X-Google-Smtp-Source: APXvYqy/kucw9v8LMt0yJ4yjVyQ+82M1lz79DGqFguBC4nALluWsrP7cO1udl64OTrIrvtxDczxczFGsY1Y1pVHmmiE=
X-Received: by 2002:a92:990b:: with SMTP id p11mr11299858ili.254.1580901758511;
 Wed, 05 Feb 2020 03:22:38 -0800 (PST)
MIME-Version: 1.0
From:   Nicolas Belin <nbelin@baylibre.com>
Date:   Wed, 5 Feb 2020 12:22:27 +0100
Message-ID: <CAJZgTGF2ihuu_bSzQ93iBTf1YQ4_NM29S4iBFM8Fhd_RUaw2vQ@mail.gmail.com>
Subject: [PATCH] pinctrl: meson-gxl: fix GPIOX sdio pins
To:     linus.walleij@linaro.org
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the gxl driver, the sdio cmd and clk pins are inverted. It has not caused
any issue so far because devices using these pins always take both pins
so the resulting configuration is OK.

Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 72c5373c8dc1..e8d1f3050487 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -147,8 +147,8 @@ static const unsigned int sdio_d0_pins[]    = { GPIOX_0 };
 static const unsigned int sdio_d1_pins[]       = { GPIOX_1 };
 static const unsigned int sdio_d2_pins[]       = { GPIOX_2 };
 static const unsigned int sdio_d3_pins[]       = { GPIOX_3 };
-static const unsigned int sdio_cmd_pins[]      = { GPIOX_4 };
-static const unsigned int sdio_clk_pins[]      = { GPIOX_5 };
+static const unsigned int sdio_clk_pins[]      = { GPIOX_4 };
+static const unsigned int sdio_cmd_pins[]      = { GPIOX_5 };
 static const unsigned int sdio_irq_pins[]      = { GPIOX_7 };

 static const unsigned int nand_ce0_pins[]      = { BOOT_8 };
--
