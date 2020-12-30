Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204892E7C83
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Dec 2020 22:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgL3VAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Dec 2020 16:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgL3VAN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Dec 2020 16:00:13 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082C5C061799;
        Wed, 30 Dec 2020 12:59:33 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id 186so14974985qkj.3;
        Wed, 30 Dec 2020 12:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/QQ50Ka1R1+U/IuErmUoFYUnJn6zHeQSm2AvNXowNLI=;
        b=c6sMjIaoTEUEMda470RAYFzwtifrbfH1IPQUw7bQkprFlgL+tbRrTJL6gWTW3cscj2
         33S862Lko+7qm1PzaYWfQhN5/3PsxYS2rKsxQgCO2ysgL8haGl2jDghOi1hAYGlTJumP
         WWEcrf00FIQG6JIBXi9MbmHD2fCeuqV53hgdfiKXSnlRJ0XVRUK6FyqAkI0InZsTFih8
         sCcvbx9DuD5FDVansvKmchAApMfQz2RDvhLTsPW2u67jlBmvLyxMD56SVLOmHWcG9iy1
         PQ8sZAa8fZTWI5y1dLJwkbyAwwuWfv1VidJEcD0ujPNuHZRq5JAWWg+/rJM4MVe/Nrf0
         RMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/QQ50Ka1R1+U/IuErmUoFYUnJn6zHeQSm2AvNXowNLI=;
        b=jfL++0LCJcdMp5jUhR7Fh4Uj6eFTJ63LyBZQSjvZHQrZoHUP8hugaw5lPdTsuMaXmn
         RNLi6mLQPS6eJE8PViOS53BDSuQ7nJztiT/3j+sZdh3Fb3bsozet77SWKWs9JryWijVH
         Uhl6TopRbMwY4AglByw5gIsWU8JvptkQysabDeH1wSNNpghpz8EuPFF/Mc6yRelTUCmW
         2ilF4qJnSzcE7UackSYFmsZiAHqv9MkKisXwg81sk7kyD+7rif9Fi8hDwq4Vv+o28ICD
         Ezirth06Ca6NRgzLaCzquIMnrfInQoyf1RH94efrVr8k9j5jtnzAe9+ga5khQyRMuhKn
         OV8A==
X-Gm-Message-State: AOAM530Ts+EiBhGmo8uXwFT5Wjau5hHwJIvz+q5KI6ZvdoeKpql7AkDx
        rm3tqAFiJvAqaJkr/HynO2k=
X-Google-Smtp-Source: ABdhPJwJezOL07gJfrppUlnz/ZiX1biblN7mipFNmTviy1s0R2N2LxGsoiNty4nKfrtjzkOPpym/xg==
X-Received: by 2002:a37:ac0f:: with SMTP id e15mr54617417qkm.450.1609361972259;
        Wed, 30 Dec 2020 12:59:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:a80:d66:6051:ad08:aa32])
        by smtp.gmail.com with ESMTPSA id m41sm20892474qtc.28.2020.12.30.12.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 12:59:31 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, sandor.yu@nxp.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] gpio: 74x164: Introduce the 'registers-default' property
Date:   Wed, 30 Dec 2020 17:59:16 -0300
Message-Id: <20201230205916.8875-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201230205916.8875-1-festevam@gmail.com>
References: <20201230205916.8875-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sandor Yu <sandor.yu@nxp.com>

On the imx7d-sdb board, there is one output pin of the 74x164 that
controls all peripherals power supply (PERI_3V).

This pin should be at high voltage level when the 74x164 is probed,
otherwise the modules dependent on PERI_3V3 will not be powered.

Add a new optional property called 'registers-default' that allows
describing the default output value for each shift register.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use the more generic device_property_read_u8_array(), which
also works in ACPI.

 drivers/gpio/gpio-74x164.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 05637d585152..a11637518774 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -141,6 +141,9 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->registers = nregs;
 	chip->gpio_chip.ngpio = GEN_74X164_NUMBER_GPIOS * chip->registers;
 
+	device_property_read_u8_array(&spi->dev, "registers-default",
+				      chip->buffer, chip->registers);
+
 	chip->gpio_chip.can_sleep = true;
 	chip->gpio_chip.parent = &spi->dev;
 	chip->gpio_chip.owner = THIS_MODULE;
-- 
2.17.1

