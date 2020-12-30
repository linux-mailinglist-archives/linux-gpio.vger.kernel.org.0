Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BC52E7CDE
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Dec 2020 22:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgL3VuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Dec 2020 16:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgL3VuN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Dec 2020 16:50:13 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D695C061575;
        Wed, 30 Dec 2020 13:49:33 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id j26so11821431qtq.8;
        Wed, 30 Dec 2020 13:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZClGJsDfX7YB10TwVOzt3CEzn7hkyHKuqXbXszdr9pM=;
        b=e/5GHwLIUsaNDt68gR5NPnHiheOxpWZhJoEQ4F3j1tXXLMzs2phkSeoibhkCZC0AdW
         YgbWSuzkZjQJIUxaoEH9IlX1ccYM15+iBmZwUIKwzuZZ6bm7gWqYBvZs8MT+5vpbwnwZ
         eR52R87ypI5Cpy+sP05zuz/2fkZ5yq1iwAHUeT2ezJ27orcrKZVKhoKYC3tB4Z460Dke
         +LKR4OchIyfSKjid/9xUtxOduBUndwzYvgweCs8Yi7Pm9DVgX8Fd8lvTH7vMR3fBmEye
         E09Tmtml4GRHtssbeBC8Cbehrcr6ZvQbGWM8tgKsA1JO3GBsSgrn26qviZiR4q2e6Ruh
         t5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZClGJsDfX7YB10TwVOzt3CEzn7hkyHKuqXbXszdr9pM=;
        b=Jpylwvi+yOdc/lnV3yk43Q94eeG/ygNhb/pI6f96jD4eo557OVr49g6+TaGr9qCwrg
         zKYDSXvcYw93uLXUV2VjqCilKy6Kh8csZWjmplx4+Se8W9Gk18WwPxOZEYHjbUGNfIEF
         9cICphw9uMB4lHHk+jArZq7uflCuNHZds1cz7jTBx0137d5fRddHbIxdxLehGPlVZQml
         B7oSqFi4/WSfCJdxMYUljTL7foWIiJTFYm7+nw/RLLwym7n2uu1yuFYY+dssH8YWHDMx
         9j88S2uBIwVtm5qxBz28YfR9NJ4PPpM05QaPi+kjES+JliHgESX+9BAMyA+zDdPAKu8N
         dikA==
X-Gm-Message-State: AOAM533xdmjM2gH3zx37Ko89iy+fN5nrLfxO2PB1zr+mDHu47wqrm3Xt
        A6NG0+Hr/OtnuaFvX6HoOtMe6N6dtc43dw==
X-Google-Smtp-Source: ABdhPJwN6Um4Rx6SlCPijT281NmeeZPoM4WoUUAnmE7bpS7j0Oz6N/i5tUfXoxSNl1UALTWEyGAVIA==
X-Received: by 2002:ac8:71c7:: with SMTP id i7mr53655034qtp.47.1609364972278;
        Wed, 30 Dec 2020 13:49:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:a80:d66:6051:ad08:aa32])
        by smtp.gmail.com with ESMTPSA id k26sm28973590qtb.41.2020.12.30.13.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 13:49:31 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, sandor.yu@nxp.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 2/2] gpio: 74x164: Introduce the 'registers-default' property
Date:   Wed, 30 Dec 2020 18:49:18 -0300
Message-Id: <20201230214918.17133-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201230214918.17133-1-festevam@gmail.com>
References: <20201230214918.17133-1-festevam@gmail.com>
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

Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
-Add Sandor's Signed-off-by tag.

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

