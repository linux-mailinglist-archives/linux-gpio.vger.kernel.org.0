Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF0919B4E3
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 19:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732121AbgDARt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 13:49:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60473 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727723AbgDARt5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Apr 2020 13:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585763394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=n8Ov33Z36+lHvF5rViWeNYhfdorHlSo9Is6iCBi878w=;
        b=OvB5xMfc/CAN4aImulapCwrQEUWLkAFJYu5xMIpbjZeI8Ya2s3UcC0+JvWs8f61PYT03cq
        OPmFe0yDt6tDFHgA4Pex9I1IwFGcRl9+tZtrT4ZeFAdbRXSn2jwSM1YZjm3k5lzOVNZQsy
        6w8cbAle+6wICwCfHKiPLitGdaTR5bk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-IzaHCQKjMNK1h9ZLpVQN2w-1; Wed, 01 Apr 2020 13:49:51 -0400
X-MC-Unique: IzaHCQKjMNK1h9ZLpVQN2w-1
Received: by mail-qv1-f69.google.com with SMTP id dh19so212726qvb.23
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2020 10:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n8Ov33Z36+lHvF5rViWeNYhfdorHlSo9Is6iCBi878w=;
        b=NBBGNOO8XGheUO/j3iEgOt3IfkQYdUgXhq5LHojFnhuqYeeMb/vZuxQzDa7H4hXGBU
         mk/gYtyc2EehSsZRt+O/PNPBflKxjEIvDG6As7tujrhwMfD0fYwdku1NPyj9yk7qNKMo
         eQdA39uWaeU3quvA/41fgLgOf/iAssq1L8k/biEhJdlm0APfJqaCSHkTOSrilbxoIC1Z
         /SkOF17lfyWdWk+bcBGIwHIO6I1Uwbmo2fNM/aPH4OlPzRQHt3sHB3/BSuPWAeQDjbkX
         C8l/pshWa1KZHCOn6MX2cpF+t7GlFfK8LQTyw3T7L9NT/ewnKWMcHl0eZPEkzkQDix3X
         BkQw==
X-Gm-Message-State: ANhLgQ3Zn9uVZC3112pQyhsH82rtjuDa6k9G7etoqxOP2TgEqa3zokUj
        NO7r0EWf+Ite0QDBMY8fGXl25HiE3SdjfbvDLww5LQ61UarsGSveSrmYHc7If1lzmCSX2mwZUF7
        wiaulW32urUhKSEIDLg/Hqg==
X-Received: by 2002:ac8:6f46:: with SMTP id n6mr11548340qtv.119.1585763390479;
        Wed, 01 Apr 2020 10:49:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtVsQ2XgHLfTDm93MKtCwvKwn+8GGG8LrSa5aKMaHcYuqx3eDFWBEhz6eMkU0V/+iU4Y44Tbg==
X-Received: by 2002:ac8:6f46:: with SMTP id n6mr11548319qtv.119.1585763390227;
        Wed, 01 Apr 2020 10:49:50 -0700 (PDT)
Received: from xps13.redhat.com (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id v17sm1812339qkf.83.2020.04.01.10.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 10:49:49 -0700 (PDT)
From:   Brian Masney <bmasney@redhat.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dhoward@redhat.com
Subject: [PATCH] drivers: gpio: xgene-sb: set valid IRQ type in to_irq()
Date:   Wed,  1 Apr 2020 13:49:37 -0400
Message-Id: <20200401174937.3969599-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

xgene-sb is setup to be a hierarchical IRQ chip with the GIC as the
parent chip. xgene_gpio_sb_to_irq() currently sets the default IRQ type
to IRQ_TYPE_NONE, which the GIC loudly complains about with a WARN_ON().
Let's set the initial default to a sane value (IRQ_TYPE_EDGE_RISING)
that was determined by decoding the ACPI tables on affected hardware:

    Device (_SB.GPSB)
    {
        Name (_HID, "APMC0D15")  // _HID: Hardware ID
        Name (_CID, "APMC0D15")  // _CID: Compatible ID
        Name (_UID, "GPIOSB")  // _UID: Unique ID
        ...
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            ...
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000048,
            }
            ...
        }
    }

This can be overridden later as needed with irq_set_irq_type().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpio/gpio-xgene-sb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 25d86441666e..b45bfa9baa26 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -122,7 +122,7 @@ static int xgene_gpio_sb_to_irq(struct gpio_chip *gc, u32 gpio)
 	fwspec.fwnode = gc->parent->fwnode;
 	fwspec.param_count = 2;
 	fwspec.param[0] = GPIO_TO_HWIRQ(priv, gpio);
-	fwspec.param[1] = IRQ_TYPE_NONE;
+	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
 	return irq_create_fwspec_mapping(&fwspec);
 }
 
-- 
2.25.1

