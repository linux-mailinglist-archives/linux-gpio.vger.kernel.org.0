Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2EB43CACAD
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 21:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240272AbhGOTl0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 15:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344927AbhGOTki (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 15:40:38 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E422C06B6CA
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 12:13:47 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s18so10456171ljg.7
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 12:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Krd0KdIt7AxYBsgDXQUSitBUbG7LJwp8O8UWWfEtBx0=;
        b=tD4hrih3gnWsKw1piEfQwvBCltU2wmYRMfPG88sSBovSWgsUPIY+s0ZfqKwp8hCSTo
         vATl+irXD6XGeQ3vAENfyaoy6+YG/xvkTs4drVjJ+uBmCb08i1vCX3U0YBxB9UK4VW5X
         xvkWsq9w+hMBWiwELgA3BfhcEsRdxn+P7MPaIEO2YuCIzZQ2VlutohiVu8Sfalw9J6jn
         zDJpxmJ5T2HwOu/QmFgvx98Hh2fdOb0Wz+7qp1W+swFycCSlR6tNc9DotaIztTgPxdg4
         xlbvCAYssierKo48g3eD1kto6LeNpfHldvCnMlhK47I5KhpylaCHjl8UxsJpOcT1Gru+
         OrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Krd0KdIt7AxYBsgDXQUSitBUbG7LJwp8O8UWWfEtBx0=;
        b=X545tcokQ3WyGWBz2P2i6Tl/HbkHTmoRyWH0/eeYKhw5mMiBYSOLmDqtsA9ce6dpe/
         vbZr4WyvhyJsYYuqOLgogug4hqg+e251bSX2bBm8s9ZkYfO03Z8Q64pI9bDcpYD4P13a
         P84cM1z8ayU1RTOYy2F3SOAnudOH+ED3t2iN23qe18yyzoKVQzSTLaz9d/F86h9Ny8Ek
         4DTDOb76NTQdKrF9y2LIlinh902eTrBUkXkH/hg2fSPJY2SccU4wfLpEoAVp+5rlMGJn
         1MS/HOvCCJe5mSegR3Dup5w26c89G76MB+YPBBnuyYhAqdGHNlR9b56aMcffXJ3fIvtj
         pFbA==
X-Gm-Message-State: AOAM531Q/ywVr8/ahC2IOFe/lhREvfwSVe/94/S/5EHlrVUbJnueXCyG
        O/dh9dfIpf/LAdUFghLf8ekQLg==
X-Google-Smtp-Source: ABdhPJyIe6SJHYJYy5EJlBc9LNXoFsoG+EPuwolJ+zaCcAtFUKVC3a48VFW73CuGAq1KWRk9LBzydw==
X-Received: by 2002:a2e:a583:: with SMTP id m3mr5451211ljp.305.1626376424108;
        Thu, 15 Jul 2021 12:13:44 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id y22sm472357lfh.154.2021.07.15.12.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:13:43 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3 v6] gpio: pcf857x: Name instance after dev_name()
Date:   Thu, 15 Jul 2021 21:11:39 +0200
Message-Id: <20210715191141.430307-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Put the label on this gpio_chip from the dev_name() instead of
the client name.

The client name will be pcf8574 etc for all instances even if
there are several chips on a system.

This manifests on the DaVinci DM6467 (non-devicetree) which
will contain 3 different pcf8574 devices that as a result cannot
be told apart because they are all named "pcf8574", affecting
the GPIO descriptor tables which need a unique label per chip.

By passing in .dev_name in the struct i2c_board_info we can
explicitly name each instance and use that to discern the chips
when using board files.

Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v5->v6:
- Rebase on v5.14-rc1
ChangeLog ->v5:
- New patch to deal with the chip label
---
 drivers/gpio/gpio-pcf857x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index b7568ee33696..2271ec86e414 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -311,7 +311,7 @@ static int pcf857x_probe(struct i2c_client *client,
 	if (status < 0)
 		goto fail;
 
-	gpio->chip.label = client->name;
+	gpio->chip.label = dev_name(&client->dev);
 
 	gpio->client = client;
 	i2c_set_clientdata(client, gpio);
-- 
2.31.1

