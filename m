Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D421542D958
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 14:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhJNMfy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 08:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhJNMfy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 08:35:54 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74AEFC061570
        for <linux-gpio@vger.kernel.org>; Thu, 14 Oct 2021 05:33:49 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t2so18977183wrb.8
        for <linux-gpio@vger.kernel.org>; Thu, 14 Oct 2021 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOaq3Ei7m1maDGDV1twf5fWkAZyqziUgFKsdh7K//Hw=;
        b=jX4D3DsQgUJbmdRSmZPYtlO3R93q7prvnz7RjaEVAEWQL3Qci59edH834chrE0IIzA
         BTnz775MgynQSVght1Nyfv0n6mKoInRXMyg5FN3yVhFySIFUBxWHYIm5wg6o8s3yG8R6
         RrAcxcYAOemSdEKCTj8ldhvYCq01ScBuR4udSHKw1feQeZpT2YeNt8kfFE4h06gEmJ3t
         uAHpQXX9dZRL3IFiNP6xi/FWSERx1dRYXZuqXueRFLSjr0Vm3NNg1vMQGguCpMVaLKwm
         E/3nrl1UI/dm4JFbfqyA2aqQAvF3Aee01kQI9kQiF7VVkqpHKhB417boKeIbHorR8Fdy
         Rzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOaq3Ei7m1maDGDV1twf5fWkAZyqziUgFKsdh7K//Hw=;
        b=vAqUFq/hF2ZggvsTtYfniJFpeJuTIgEpJVVY5rYHHlg+Wr6c2EAI/gIRFzz3RbPhT9
         VifqfekZl3nWZoDmN5cUjppqHiUNykXgED6LWfFmlC3CrsDom1QXS0EKynrId26pLuZo
         KYNkmB/vEtjX/HhrQPmYScgJW3+DzErhit4qBtqAvh6rbs7Z0YAoAFUtUHdfzSMQGkIL
         DvzTkyvgKusoAXsW3LAWfyNCtqPxxsUG/GqpxHd2a9mcUGTUnd/ID6p1r+5AfQ+URrKj
         QbVyrFck0bbiHQM6B/Qn/+Lyhb750tBPE5fnjximdj1tqY70qXl4ff6twsL8nRhhosqI
         qNdA==
X-Gm-Message-State: AOAM533LlYm4ZVDnhzkUQBgYS5k94LIoNGpf6/j3eu5wonql3I/B8yhC
        X77lOXhIPLZ2ytYeyC9HLBvbexrLCyw=
X-Google-Smtp-Source: ABdhPJwiBDunlaHmUuKcNVnm07JL58n7v2d8i9kl3VZpPdrv4zS8KJWWji3YEFOh9MZBeLz7THTUsQ==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr5534012wmc.165.1634214828063;
        Thu, 14 Oct 2021 05:33:48 -0700 (PDT)
Received: from dummy-pc.bisdn.de (dslb-088-073-007-228.088.073.pools.vodafone-ip.de. [88.73.7.228])
        by smtp.gmail.com with ESMTPSA id h22sm2492786wmq.42.2021.10.14.05.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:33:47 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] gpio: xgs-iproc: fix parsing of ngpios property
Date:   Thu, 14 Oct 2021 14:33:42 +0200
Message-Id: <20211014123342.174711-1-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

of_property_read_u32 returns 0 on success, not true, so we need to
invert the check to actually take over the provided ngpio value.

Fixes: 6a41b6c5fc20 ("gpio: Add xgs-iproc driver")
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
This is based on
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git,
which is the tree for GPIO according to MAINTAINERS, but hasn't been
updated since ~5.11 - is this still the correct tree?

It doesn't matter much for this patch though, the driver is virtually
untouched since then.

 drivers/gpio/gpio-xgs-iproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index ad5489a65d54..dd40277b9d06 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -224,7 +224,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	}
 
 	chip->gc.label = dev_name(dev);
-	if (of_property_read_u32(dn, "ngpios", &num_gpios))
+	if (!of_property_read_u32(dn, "ngpios", &num_gpios))
 		chip->gc.ngpio = num_gpios;
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.33.0

