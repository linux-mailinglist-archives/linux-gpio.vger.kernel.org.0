Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 450F1DE4C4
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 08:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfJUGos (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 02:44:48 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42465 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfJUGos (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 02:44:48 -0400
Received: by mail-pg1-f193.google.com with SMTP id f14so7137664pgi.9
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7S85Z16eqmxjvMi+R450sz/jCD08hapdQq20bxkJhIQ=;
        b=GuRCYZtGI6OJa6X8+/Ffb8CLtebpBzKn0NZw6zffUn9sUbMUSQw/2smdjQAyEdECD3
         dMQoJ9gWZR/CRhS+tkhIG7O7tZtUVlouDhfhyiAQw2z97JpcLK7xPgBnhtxfLaA8tn65
         uLzm7NNQq95muYyOqE612+gA7JyzPHObNYoj3nDvcwncyUqmu2oYZUqEOp2ew25NMmgo
         KN93tzSSewsfwDec/nSg8XESFTYjDhbU13AGcEXLTB3GLYNzOv7oMORl1H01diaRc26p
         bkEp1OO+6DilyontJxPS9m3bzCDZfJRqYjI5195khDfCWjZv4xw6ht9zGQk0/ZCOL6cw
         nQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7S85Z16eqmxjvMi+R450sz/jCD08hapdQq20bxkJhIQ=;
        b=lyGm4RTykzhvzRVfDd/jC/91yMGJyU+HxPx8wMDUqsENKWQddkRwex/d0y93uc3R5l
         FFVWQfZvrcT6AK1U9jYEXt1XxK+EmIbHm0MMwisGy7ZxDpipIdE15JTHgQwnhih8aNpi
         C1Z1c2YcQK6g4F6GoqA+RFxgZEHj9ZMfOfAT5N7eXjkgXa7g7BodoZpQzhsRKRWZnxdN
         HThH3wKHi/PrTcosfYnDse6OSl35U6N//0+nb5uXNz4Kt2VcscpJiWZ1TrSWBCOw+b3e
         3lTkg+5yvst8WvFJPrx8VUJqzn1dBatFfoZFDpFb0trRANtmsZmsVnAL19npWI68Pf/J
         SMXw==
X-Gm-Message-State: APjAAAXKMJ7AKH43ztlWODnfOZ9ru1Y0McHe7s0mr5P0u3gP015iGjlX
        3gJWx5TOTfSmJpXxOJEV7RUC
X-Google-Smtp-Source: APXvYqwxSvUROjDFsJmxjbMvpcDF5YALujo6V9ImzLknl4U15yQJoDhBjAS4yK3nij3Yun5eC568gA==
X-Received: by 2002:a63:2889:: with SMTP id o131mr24222845pgo.444.1571640285755;
        Sun, 20 Oct 2019 23:44:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:700f:8db6:2442:890f:ac37:8127])
        by smtp.gmail.com with ESMTPSA id d4sm13156624pjs.9.2019.10.20.23.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 23:44:45 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 4/4] MAINTAINERS: Add entry for RDA Micro GPIO driver and binding
Date:   Mon, 21 Oct 2019 12:14:13 +0530
Message-Id: <20191021064413.19840-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org>
References: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add MAINTAINERS entry for RDA Micro GPIO driver and devicetree binding.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a69e6db80c79..0303502cd146 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2150,9 +2150,11 @@ L:	linux-unisoc@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/boot/dts/rda8810pl-*
 F:	drivers/clocksource/timer-rda.c
+F:	drivers/gpio/gpio-rda.c
 F:	drivers/irqchip/irq-rda-intc.c
 F:	drivers/tty/serial/rda-uart.c
 F:	Documentation/devicetree/bindings/arm/rda.yaml
+F:	Documentation/devicetree/bindings/gpio/gpio-rda.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/rda,8810pl-intc.txt
 F:	Documentation/devicetree/bindings/serial/rda,8810pl-uart.txt
 F:	Documentation/devicetree/bindings/timer/rda,8810pl-timer.txt
-- 
2.17.1

