Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFC99D7DD1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 19:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388813AbfJORbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 13:31:01 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40340 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388809AbfJORbB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 13:31:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id x127so12911054pfb.7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2019 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7S85Z16eqmxjvMi+R450sz/jCD08hapdQq20bxkJhIQ=;
        b=Z45Fjj80aeFnBh15QFiiV4ZDqGyQ5HJDbtqHNzqjgPSNVNPjO/x2poJPEIrrZSFwpm
         OCMem9CGwlp78RO8LfSd5G8mEF3Nyd2RFh624FvFc7lp5QpQOk+J9/X7AA1OJVuLBMVn
         1RleaZa0ecrjs9JrXlD4ReELJMFxpSUi0gdkDJiF4FnLpedmmsdC1A8CxoITnMEEOsTF
         TD0hM4gvbo4PJAMPxwFtNUirCtNcVbcD6tilIdvWAwLG73xWJC9hLBQGmXaWwpXZ1WS4
         AShMtc0G+WfW6FxqQSAnVlM55aI6K6lK4t8Fct+uwbgtxpNTlvASSWpOURuotpOnAcSK
         /kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7S85Z16eqmxjvMi+R450sz/jCD08hapdQq20bxkJhIQ=;
        b=Bpn8R4X+OFpTnWDUthuCSfcQfd3I2Q1OEw3kb/whCuSy0bfFO3TT7RTjojztuL+rUo
         Io45SlDE5MwTB6iPOYV73lqy9MskVgNuEm057hDc1VcYE2cyaYdle8UN2Pep51ruWxHc
         x4IfELapki886wF+6criQOz2GFpxA1zOKGDne/dT9v5RmuvAK8lbwGTRVmua9BlOqcbJ
         MmkQCVQCs1tV9qM56y6LNWioU6qcrZugGln12ggQQZyQwV4SYYNiymE3RRRdqaIgzAcM
         KuShvHZU8JLxcIdf5XZEs4qylD/KEhJ3hxkV44poSr+Bs4tH4IH5n8rbsVSSE1WXxetr
         PWzA==
X-Gm-Message-State: APjAAAUeTD9HPpknNonjZo9SjuMdv25AJdtc95NlcfbY9lSb+xLC7aKX
        c/HSgaGiBH1BGVkbQx7qJArr
X-Google-Smtp-Source: APXvYqzn4VlP4VPtakQV7y7Ju7xhPBj3ik8f7rFsUS7D6t1HhoQXFgGOrSFOlZClkEbJG1rQSgbgGA==
X-Received: by 2002:a17:90a:9f42:: with SMTP id q2mr43885643pjv.95.1571160659982;
        Tue, 15 Oct 2019 10:30:59 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6003:7cb8:25e8:2c45:fab2:b0c7])
        by smtp.gmail.com with ESMTPSA id w11sm28033563pfd.116.2019.10.15.10.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:30:59 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 4/4] MAINTAINERS: Add entry for RDA Micro GPIO driver and binding
Date:   Tue, 15 Oct 2019 23:00:26 +0530
Message-Id: <20191015173026.9962-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org>
References: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org>
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

