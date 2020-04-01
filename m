Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8354619A905
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 11:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgDAJ7i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 05:59:38 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41964 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgDAJ7i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Apr 2020 05:59:38 -0400
Received: by mail-pf1-f195.google.com with SMTP id a24so5035504pfc.8;
        Wed, 01 Apr 2020 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZFJYkNTLPTvW0oZP4hQZw69H17w9e4DABkwJauGrsvo=;
        b=eL4q4H6Zt5YlAbKdGHOx9nPUwYyeVLd8gWzbyNjMb+PArhgTPXrdrN0vGoqynXZCHM
         bTUPxgvwyvLNWUmWikJB96MLc/q7p99Whot2IDvpAIih7IkuqqqpeulUjoycInqlmtTz
         YYmW/quAM6JvZw5EebP81bK1FWO7Or2oWQEgHHB7Qp5EucBuXAUo/tpH6nLmP4Pu4deI
         BDr/gtXlNYrPdo6qGq+tWu/4tF/J4zy6pwOwonWdWGK1vzHLgzaTzQrugJVUQyR1Q8si
         I18MVUBIkyFE4nbqLvVPzFJCYfNZsP2QALovJcqotQZWuZMfZsc9ilUVp6SPZcX+vOTf
         uNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZFJYkNTLPTvW0oZP4hQZw69H17w9e4DABkwJauGrsvo=;
        b=WE4OWrjVgyGCl4FfBlaJCTpIcFSAljMKKuXpDy09SD57kSJoZ6amWyxhFEWqCEImHg
         TSQs5lEDXUD6pRCdcZ+sohxWWhYsFzYKkyII0zflT3s9iYJtRY3DOzwbbosnBWU1R73I
         QxvBcvcx5G3nNMyadRKyJD9IxPIF0n5EgKhUM7nkkVfpbQHvrVXrRqiJSQeAQ83/ubsl
         nGo57t1pLcAYfWLL+1QnrglGXJpGF5E1AkmwAIwm2kizNM526Ut+lE/b8XnAIWencLy3
         FO0REpeY0ILPu4XtIgANGvdLYljZBvWiVFIjM9iDxHYmQgHWoMvokXq3wrqXY658zGH2
         t5Ow==
X-Gm-Message-State: ANhLgQ31OEcyJexyJ4GMRXlUUdAHkt6ONDP7elvyhooEpGOyM6JyX/iI
        08X7hDaPPhvSHUaGiR7JfhM=
X-Google-Smtp-Source: ADFU+vu9WPaFbRtOf34kOndOIVRRGnNKP2ecacE/QeJKWr0KIdaMENcjJk3uMNIgv0dOfNUHrIEdSQ==
X-Received: by 2002:a63:f454:: with SMTP id p20mr22194762pgk.149.1585735176370;
        Wed, 01 Apr 2020 02:59:36 -0700 (PDT)
Received: from sh03840pcu.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id v25sm1132712pgl.55.2020.04.01.02.59.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 01 Apr 2020 02:59:35 -0700 (PDT)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "gpio: eic-sprd: Use devm_platform_ioremap_resource()"
Date:   Wed,  1 Apr 2020 17:59:25 +0800
Message-Id: <8d3579f4b49bb675dc805035960f24852898be28.1585734060.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit 0f5cb8cc27a266c81e6523b436479802e9aafc9e.

This commit will cause below warnings, since our EIC controller can support
differnt banks on different Spreadtrum SoCs, and each bank has its own base
address, we will get invalid resource warning if the bank number is less than
SPRD_EIC_MAX_BANK on some Spreadtrum SoCs.

So we should not use devm_platform_ioremap_resource() here to remove the
warnings.

[    1.118508] sprd-eic 40210000.gpio: invalid resource
[    1.118535] sprd-eic 40210000.gpio: invalid resource
[    1.119034] sprd-eic 40210080.gpio: invalid resource
[    1.119055] sprd-eic 40210080.gpio: invalid resource
[    1.119462] sprd-eic 402100a0.gpio: invalid resource
[    1.119482] sprd-eic 402100a0.gpio: invalid resource
[    1.119893] sprd-eic 402100c0.gpio: invalid resource
[    1.119913] sprd-eic 402100c0.gpio: invalid resource

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/gpio/gpio-eic-sprd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index bb287f3..8c97577 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -569,6 +569,7 @@ static int sprd_eic_probe(struct platform_device *pdev)
 	const struct sprd_eic_variant_data *pdata;
 	struct gpio_irq_chip *irq;
 	struct sprd_eic *sprd_eic;
+	struct resource *res;
 	int ret, i;
 
 	pdata = of_device_get_match_data(&pdev->dev);
@@ -595,9 +596,13 @@ static int sprd_eic_probe(struct platform_device *pdev)
 		 * have one bank EIC, thus base[1] and base[2] can be
 		 * optional.
 		 */
-		sprd_eic->base[i] = devm_platform_ioremap_resource(pdev, i);
-		if (IS_ERR(sprd_eic->base[i]))
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		if (!res)
 			continue;
+
+		sprd_eic->base[i] = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(sprd_eic->base[i]))
+			return PTR_ERR(sprd_eic->base[i]);
 	}
 
 	sprd_eic->chip.label = sprd_eic_label_name[sprd_eic->type];
-- 
1.9.1

