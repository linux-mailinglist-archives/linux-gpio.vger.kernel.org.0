Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9611E94AC
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2020 02:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgEaALW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 20:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbgEaALV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 20:11:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA39C03E969;
        Sat, 30 May 2020 17:11:21 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c3so7757425wru.12;
        Sat, 30 May 2020 17:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rVJ4oym9rXNaA44QDrgvFNwDxvnSEboxykGaMiySkgs=;
        b=MVLxJVw32p1OtN2vdVxrhz6dYK+xoVjcLbAs9VH4QhsyENwRJtA5zZRCP/tlw9WNqS
         PficSCvAUSR6HHg03iTAhAdB/+mMS/lbTuyiQt52U5DGkBL7gR2o9g7tL36Z+U3lwEfj
         xMjAnN2m4HhzJTuZ3xuk1bEeVB4/MvBxsL/m9t1nfBH5kWEMYTXS/Q0I/dTDV1F+owx9
         bMDjuRYGM6ksnHPgXrbfjMC55mwKZzzoN0BVbzMHvI9CCUfy+9hSWSLCNZUvI4F2nYNG
         zTaN8mGpsyeZniEcJJ4u4zrmo/Q3ciEVYxZ83HkeG3EWGg24HCqBW8HEQ9UkeGI4P4Zm
         vgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rVJ4oym9rXNaA44QDrgvFNwDxvnSEboxykGaMiySkgs=;
        b=Gml17BV85o26Jiqc548Sa+cWif+mBImS0pybVybu5kZUU1AEG3PX8SH6xFUjjnxoic
         rqtha1qW6Lx4vqEuS/JhK440fH05QQZSjp8z+XRnxk2k1641It3+baoeRJMNDNaUpFRg
         o1npoz83z9i/vEEG53BoHWXOA3cDMAQty+ReVCvreFyLV9dpXxkvXHh3Vve+/x5o+FHI
         ghAOPQpXfhtTr9+QWb73aCrChH7eb4ROItAuaScwY7VbBDj9xhgIsZeNNn1FMtDamX4B
         neY6hVAy6Qyp5LkzfaZSlBbDkW8eaAOXCxfOZvlddEEEev2CcW9i+lhnG8J02I85VYOZ
         uv/w==
X-Gm-Message-State: AOAM532x20Uo/25dUsVe8yLI7XrIdFkJkrU5fl/bmdbmzVzdRTr9gNSq
        xMduOgQDhID7dRWf3EkCJIygD277
X-Google-Smtp-Source: ABdhPJwqp1mCH35XDunsWOItoM/EABnx5HwsMdbjoQ7rQPkUJ9ipZrg/XucyJy/4w1gIBktL9lbVwg==
X-Received: by 2002:adf:c44e:: with SMTP id a14mr14272619wrg.50.1590883879709;
        Sat, 30 May 2020 17:11:19 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d17sm15455807wrg.75.2020.05.30.17.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 17:11:19 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH v3 3/4] pinctrl: bcm2835: Match BCM7211 compatible string
Date:   Sat, 30 May 2020 17:11:00 -0700
Message-Id: <20200531001101.24945-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200531001101.24945-1-f.fainelli@gmail.com>
References: <20200531001101.24945-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The BCM7211 SoC uses the same pinconf_ops as the ones defined for the
BCM2711 SoC, match the compatible string and use the correct set of
options.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 06bd2b70af3c..1b00d93aa66e 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1137,6 +1137,10 @@ static const struct of_device_id bcm2835_pinctrl_match[] = {
 		.compatible = "brcm,bcm2711-gpio",
 		.data = &bcm2711_plat_data,
 	},
+	{
+		.compatible = "brcm,bcm7211-gpio",
+		.data = &bcm2711_plat_data,
+	},
 	{}
 };
 
-- 
2.17.1

