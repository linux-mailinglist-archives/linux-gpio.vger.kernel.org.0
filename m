Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C29BEAB26D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 08:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389006AbfIFG0c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 02:26:32 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:47102 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfIFG0c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 02:26:32 -0400
Received: by mail-pl1-f194.google.com with SMTP id t1so2606800plq.13;
        Thu, 05 Sep 2019 23:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VywQQgwoddW91Jq4aMSrybOZ072q9St1Z4i5rxfAKss=;
        b=GGNMeOiyYHFVFbotkWPcgoumWVou3FxdbVs9/ZllGyRMZj3CYE50mPl9eaGFK1SSJ1
         ehwBhp1UScc4KWEVlRPTVx5dcCy+WX7EbS7TTARFNII+ncgxuk21EEMFuOwhgWtIa+hy
         /f6e7unxpJT7Gy1vtgrYz8B8OK/i7/jJyGmy06Zd2HRGt0nVcQhxLxpf/i6vGD+oGigX
         CpnNnsbajWYqKej4a5ukjmDX2t/YD8+maxsED7v6pUHoO6keEhTC2ZjlnTfxTkfPQXbD
         vTYcDqCdcICnYEKy+XEg3z7BLeBcmQK0pGKWBNT+XrnEdIR8+Zot+2wioR+D/zN7vM4n
         vGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VywQQgwoddW91Jq4aMSrybOZ072q9St1Z4i5rxfAKss=;
        b=ccQ9r9amEQbh0fm4AQC3+9NX+4nWibbqq+Xy1XNpL6k2F+gkLcYSaZzEjNl0BFEHiV
         6IYvnv03BAsxIC9+tTDkkkLAZ2pWe6W5EVQeSxvwgUENxO2yGoQLwBL/YYwmMlZg3ZZE
         riWCXcsQzjcCyQv9sX+CX22/08S3i4IyOy1zYqsEcgTgxFiBSvH0C467ImXQqTHZmchR
         DFl6FMLG/rs4dduLfYIU683wlj51/u24U+VSYWUmiVEk+HWcoF479DO5EdpaYuigV+GM
         JXR32UuFdOP04XkMDPXFQiB0UgLj8iCvlqr+RwkT+5g/Lt0CsY06CrkAyoWh9Xts0fHm
         QM5A==
X-Gm-Message-State: APjAAAWiY2eSTkvym3fryYwOoKPWDhUZoMg4SsOCF01Z6/I5T1H5enTL
        UWgNS6ownm/jCxeCI8g0G40=
X-Google-Smtp-Source: APXvYqyB4ARXWSH67d+dolbjyhdZvVBxPlfvR8PsPQ1/637E5ASl4JnhB8dHZykbbS8hKbyHlvXzkg==
X-Received: by 2002:a17:902:aa02:: with SMTP id be2mr7780215plb.172.1567751191484;
        Thu, 05 Sep 2019 23:26:31 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id c64sm1631254pfc.19.2019.09.05.23.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 23:26:30 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org
Cc:     Rashmica Gupta <rashmica.g@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/5] gpio/aspeed: Fix incorrect number of banks
Date:   Fri,  6 Sep 2019 16:26:22 +1000
Message-Id: <20190906062623.13354-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current calculation for the number of GPIO banks is only correct if
the number of GPIOs is a multiple of 32 (if there were 31 GPIOs we would
currently say there are 0 banks, which is incorrect).

Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9defe25d4721..b83e23aecd18 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = -1;
 
 	/* Allocate a cache of the output registers */
-	banks = gpio->config->nr_gpios >> 5;
+	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
 	gpio->dcache = devm_kcalloc(&pdev->dev,
 				    banks, sizeof(u32), GFP_KERNEL);
 	if (!gpio->dcache)
-- 
2.20.1

