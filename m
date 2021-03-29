Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E901934C192
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 04:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhC2CAM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 22:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbhC2B7v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 21:59:51 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC784C0613B3
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:59:51 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d8so3661422plh.11
        for <linux-gpio@vger.kernel.org>; Sun, 28 Mar 2021 18:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5evIgUHLH3iE2TL4J3188f+WN89LXupcPiWpSn3upRg=;
        b=mkI2MNoS6Q/el56D1urQ3F/hxkgi9Cc4jGujWEDbWa8KukNyFknpaqsBvLradFPCCh
         82Ajpw67gaE153YzbCFi+OZ7H3Y/JMaHNrphjBkXxNEJclXuWsBO0Qw/xBNAf3FMELPL
         vwNOq6BkK8fRMhkZeUp6pLGT6wsCBweI1AEYLBLoQHMObN4PMcxw+5XAw6BFLi7RR7NR
         8WaQ3l00nfuAHdb7GqPsXpyNFWE/ooiXYRksjlFwUKfw07uzx5TNIujOO8DZA20mKAor
         XhqIQuWMRN58d4Yhdyaisit7OyaUddCcZfH4JFlvCd0DiTwSHzCpqqHtU1E3IRb67s5/
         J8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5evIgUHLH3iE2TL4J3188f+WN89LXupcPiWpSn3upRg=;
        b=J3JooHb8xNlm2EVJ6HB8Lt62xJQDYb2rqzFYLLeludju0/MSyF10yO4HjKvIHzVokI
         11GJ/eCcGkRyrvrkMVdhEMMfMkU1divfpwUZvtc0gMWJxLDUXrIjGu9GABAFC/xQNZX+
         e1q6Tj6R5KjL/djIM6LBdxblBiy15KJEWQuGPFKhySVTv9/Hk0h+Yf7CdeEfN0FiUn/l
         GH9i/D5rnFKAGx13jko/TCSmCQRGd1YakZ3xNmhSOJm8LLvh1zBd6KICZKQdXBDle1Yd
         +svTSzyz6PuGdXVNda15YtwqD/eXmiQgajGjXQPhITT9O4fRfXkfoJfHvd6igjQe9C+T
         Ph8A==
X-Gm-Message-State: AOAM533e9vP/8AM+L7uKP1u1CoHg/lirqNVUTQv3L85LCoheTKPfNv6G
        br0z1LwbYvBszl5jzYGxxhspWw==
X-Google-Smtp-Source: ABdhPJzWcGlzZINaB0Jap/R7CzqpkSL0r8aRD9sbvqRTrnAhOddv0gNrJo7sUNFfZii8t877KZMCiQ==
X-Received: by 2002:a17:90a:77c5:: with SMTP id e5mr6189926pjs.189.1616983191306;
        Sun, 28 Mar 2021 18:59:51 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id w37sm14728027pgl.13.2021.03.28.18.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 18:59:50 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] spidev: Add Pensando CPLD compatible
Date:   Sun, 28 Mar 2021 18:59:29 -0700
Message-Id: <20210329015938.20316-5-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329015938.20316-1-brad@pensando.io>
References: <20210329015938.20316-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pensando Elba SoC platforms have a SPI connected CPLD
for platform management.

Signed-off-by: Brad Larson <brad@pensando.io>
---
 drivers/spi/spidev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index 8cb4d923aeaa..8b285852ce82 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -683,6 +683,7 @@ static const struct of_device_id spidev_dt_ids[] = {
 	{ .compatible = "dh,dhcom-board" },
 	{ .compatible = "menlo,m53cpld" },
 	{ .compatible = "cisco,spi-petra" },
+	{ .compatible = "pensando,cpld" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, spidev_dt_ids);
-- 
2.17.1

