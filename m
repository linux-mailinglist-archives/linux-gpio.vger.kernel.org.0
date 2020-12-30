Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4762E7A87
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Dec 2020 16:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgL3PnR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Dec 2020 10:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgL3PnQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Dec 2020 10:43:16 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD55C06179C;
        Wed, 30 Dec 2020 07:42:36 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id g24so11113255qtq.12;
        Wed, 30 Dec 2020 07:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N4Z6AhJilnlXeLxA+iKYxp/M8/ETHwPd3nAZGuYmO/s=;
        b=Qh3jayu1EDCyj1NDcIhdiMYAFauCpIi72rDar6XiBey1YDB3kZGayzwkgNVsgqygVC
         +txHiPGc+U0PkyZmX9TXFUj168YPbQL63vPavBfuyPBFynfu0YH7qRlJ1Ib3AQnL/p9Q
         pneFrTb9LusyZvNyI73rdkfvgesM0Lg8tZPxzo24o1+FM/xntFDBXcKsdd/QAPnuA1kR
         TpSwXYx6/1eq6HGPv0xhrNuXwDmOpUB/yHI/rUzeUwuF5Xcq2R95KBMVjUozpnn2gXcj
         /BVE0jaiK1Or0wAI5IIykWTg4ZqHhrE4Qqu8hc4Kxl7rF4pxKlgFvaRuXGOi9VRTjo2k
         BzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N4Z6AhJilnlXeLxA+iKYxp/M8/ETHwPd3nAZGuYmO/s=;
        b=d02TockTmSEBw5Txcvq1H5T4d0njCX+NMT0IZI07nbG2TtMUUyZ95jYWWl4fARHzjB
         4e/PUKn4iv+crUVLbDiE8MeIxy99i0eHoG3aY0Quo3RcKp9nR6v5bPeyZz67b33G+N1O
         zu4tWi0zB+TEOYntrWcn3BUnWayAavXEQWVPoRDg4RvzPLJ/z3DT7QVKRRqE79t62la/
         LuQhb3CRMNAkDQx5kvfP1RlPuV34Xh0jMvyV/8gfi/WvtdldHqsPiGogukPTd3VHvdr3
         dzyCujQXf6+qIIpMNKlLARQQds4zJ0V6sZR69YY3XtxT8DNtw3qAX/piP8hVoLUGHeAC
         orhA==
X-Gm-Message-State: AOAM532in2GL75Rz60LBeKCrJHRMqFlek60oMDAROJo0zLxI57d9c61g
        YWiYY90L6AWobIyiaTnnZEA=
X-Google-Smtp-Source: ABdhPJwLzrAA8bfqbq7xJ5AdFzGW25KDDu80eJT2wAHRDXJp3zApbSftBMYNsESHMCu7I2PX5Ul0nQ==
X-Received: by 2002:ac8:4545:: with SMTP id z5mr52269936qtn.356.1609342955645;
        Wed, 30 Dec 2020 07:42:35 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:a80:d66:6051:ad08:aa32])
        by smtp.gmail.com with ESMTPSA id o4sm26694832qta.26.2020.12.30.07.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 07:42:34 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, sandor.yu@nxp.com,
        Sandor Yu <Sandor.yu@nxp.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] gpio: 74x164: Introduce the 'registers-default' property
Date:   Wed, 30 Dec 2020 12:41:07 -0300
Message-Id: <20201230154107.4151-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201230154107.4151-1-festevam@gmail.com>
References: <20201230154107.4151-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sandor Yu <Sandor.yu@nxp.com>

On the imx7d-sdb board, there is one output pin of the 74x164 that
controls all peripherals power supply (PERI_3V).

This pin should be at high voltage level when the 74x164 is probed,
otherwise the modules dependent on PERI_3V3 will not be powered.

Add a new optional property called 'registers-default' that allows
describing the default output value for each shift register.

Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpio/gpio-74x164.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 05637d585152..4be51ee4d44c 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -141,6 +141,9 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->registers = nregs;
 	chip->gpio_chip.ngpio = GEN_74X164_NUMBER_GPIOS * chip->registers;
 
+	of_property_read_u8_array(spi->dev.of_node, "registers-default",
+				  chip->buffer, chip->registers);
+
 	chip->gpio_chip.can_sleep = true;
 	chip->gpio_chip.parent = &spi->dev;
 	chip->gpio_chip.owner = THIS_MODULE;
-- 
2.17.1

