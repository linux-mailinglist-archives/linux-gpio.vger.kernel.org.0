Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF11E610D4
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2019 15:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfGFNef (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Jul 2019 09:34:35 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46667 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfGFNef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Jul 2019 09:34:35 -0400
Received: by mail-pf1-f194.google.com with SMTP id c73so799516pfb.13
        for <linux-gpio@vger.kernel.org>; Sat, 06 Jul 2019 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2T6CvqzI1H9VaIH3rEjm5s4R95w0LQDCU4vj4GJ8N1E=;
        b=EKeg0KQfzrM/UrTsQvyA3fBIEP95gPCFq0LX06Z3A66wYcPo2Ec9XsDfYGs5QAmXfx
         aPft/muTdH/8Z02dUrLxf/dv4h5yp/FwxNhHmfkDdR6AVoNErqET1NNa32ypyz4BKwOn
         UZy2urj87e6XLNV5NjaM0EMy75xaoBU2hjM7xbrTFr1j3du2WUn9VWGAnIDoGZSNZxjA
         MnqE8gh3tbKdd5++JHth4lELOVuT2bKVZCpOslGswBg9xEJ0himQ5sUxyB/bzdqxBnnN
         3H6jdK9OHdqgoVx0c0VAGtH0JsG5+Kustntft+fq+xrQ94ZIgNU7dWViSW4u8PK/z7Md
         suZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2T6CvqzI1H9VaIH3rEjm5s4R95w0LQDCU4vj4GJ8N1E=;
        b=ssPrxEhwFReuWxsGhr+hzqW9IQMi/Ht+cUTEn1S5YN0WN3coF1VhfX2Uk0GeNRmQN7
         96NdsnJ0vBd+tPskxuUFQLNvMe9nKrvYD5QO8L+6alyYAXvYS+urn9h72ZGIfbFRdSa1
         eBJ01VS+LW8VmVDwtcjKp1yS++p4/HPHakaZhCFpvBBWHpyyJCidC6ZUTYL6Z+sF6hoY
         N8XdO/HrhGxfne4iimWOQPHTY0OzYmJCoODzxD3XSyVxicejZIZ5q7erreXjo+kqhiC3
         uL6aUTODOcWScgXshWW6embtfXIFrGybarbUiNQ6ZI0DEidpIhY/UQghqOB51xHVrtkc
         AfvA==
X-Gm-Message-State: APjAAAUGSlZvr49riEkJryDz0gH1+HNlBFsdVNeJThWZ4Jvp+FGTO23v
        jdrgFxIprf5O+ybSYwIb1Eo=
X-Google-Smtp-Source: APXvYqyF+oo1RsJ58Hx0mLzxQw20UbvAY5s7MuXeOcnjftnAriITpavNI84AsfeBUw61LuDsWPJlRg==
X-Received: by 2002:a17:90a:9a83:: with SMTP id e3mr11538725pjp.105.1562420074824;
        Sat, 06 Jul 2019 06:34:34 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
        by smtp.gmail.com with ESMTPSA id b36sm25390035pjc.16.2019.07.06.06.34.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 06 Jul 2019 06:34:34 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] gpio: gpiolib-of.c: Add of_node_put() before break
Date:   Sat,  6 Jul 2019 19:04:22 +0530
Message-Id: <20190706133422.3372-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a break from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the break.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index aec7bd86ae7e..c9325efc1783 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -154,6 +154,7 @@ static void of_gpio_flags_quirks(struct device_node *np,
 							of_node_full_name(child));
 					*flags |= OF_GPIO_ACTIVE_LOW;
 				}
+				of_node_put(child);
 				break;
 			}
 		}
-- 
2.19.1

