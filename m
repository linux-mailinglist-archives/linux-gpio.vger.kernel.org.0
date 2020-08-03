Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4786B23A840
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 16:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgHCOVH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 10:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgHCOVG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 10:21:06 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158A1C061756;
        Mon,  3 Aug 2020 07:21:06 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id i26so24028275edv.4;
        Mon, 03 Aug 2020 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wbCyApa2X2f4UsWCh/NHyG+lVeEf7BI87hUKtzO/G4U=;
        b=X8qVjxSTaMzWHRimr+QtI4Fpt5cEuZqCqJ7ZqBLizpfYb9O3tbpx3ML426co6jGmpv
         CcL4RMqJcizSJFwO8OhJg1cOv2pfkUOY/vLD5NlaOg5EBIUdb1lbb/E4r3maKuiBnj9q
         JpRJqi/LLqBToyqyPefXKjHDEPZBTNXWTZZPCHLgOY+mwwfyHxz0amxeoKt3D9cj/lNk
         wnIcyuuDqrPQFRfG4VAvP348CA5ixQ8nNYze8whtQypmrU4ROah1LBZiPuy9GWY10a0A
         70uEzWMBbdQukRzSKbMML08winYq0wE4DozN/1fJJTJM9avmnjnQM+CRKavMGneDI5QB
         8dIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wbCyApa2X2f4UsWCh/NHyG+lVeEf7BI87hUKtzO/G4U=;
        b=pHRv0v0WswaY4J9G5Zn64+BVzXEcZQcTwAl2KYf+ZW/FVXpj11O6qFla+JZwEvQVtc
         a7GoBaD8JLDeUEz2Du5qMsQAd/ngfW8pYJs439vgBicDo+PBApDaL2EZhwR2Vd40wek4
         O2jTGPPzRd0mkZCsT75bb7xSZkeWD+V/neKs7jJCQGU7vyGSHUt7lDZntfWhda5kAEX6
         BzjZv1mzdMhRVDu2Yl9uB7fQFsLrFp/EZtplRqu5TQtMOnsKP7LNgNLW4RvAOq+IETH/
         tgEfRWmzukOTlUz7fpf8aHqc/PGWe8P7CphuTACEQTLI2HERF7IjXQzsxejsXueX/QmL
         Wt5w==
X-Gm-Message-State: AOAM530DgLSyZl8qKcThN1mRbzONUxEPJS3aiuU5eR7UVyoSJtyjKz+G
        JNmWH2bmxATBdeAKutTDcn/n6pZC
X-Google-Smtp-Source: ABdhPJymutnG36f0kCPfsVbGRsOl5KZZJmH+vwZAhz5M+LfUE9UFm1kqTYoFRyoM3iEMYS62ssE/Lg==
X-Received: by 2002:a05:6402:1c88:: with SMTP id cy8mr16273439edb.24.1596464464749;
        Mon, 03 Aug 2020 07:21:04 -0700 (PDT)
Received: from localhost.localdomain ([86.121.43.21])
        by smtp.gmail.com with ESMTPSA id p3sm15608432edx.75.2020.08.03.07.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:21:03 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: [PATCH v2 3/3] MAINTAINERS: Set pinctrl binding entry for all Actions Semi Owl SoCs
Date:   Mon,  3 Aug 2020 17:20:56 +0300
Message-Id: <1a9eb2b12c151d4d765d2aa74dc9cd58b3c117dc.1596461275.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
References: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the pinctrl binding entry to match all members of Actions Semi
Owl SoCs.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
Changes in v2:
 - Discarded the S500 specific pinctrl binding entry and instead use
   a generic rule to match all members of Actions Semi Owl SoCs, per
   Mani's suggestion
 - Renamed patch to reflect the new changes, the original name was:
   'Add pinctrl binding entry for Actions Semi'

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index acfa5e85a6eb..a1e22a107a1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1519,7 +1519,7 @@ F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
 F:	Documentation/devicetree/bindings/dma/owl-dma.txt
 F:	Documentation/devicetree/bindings/i2c/i2c-owl.txt
 F:	Documentation/devicetree/bindings/mmc/owl-mmc.yaml
-F:	Documentation/devicetree/bindings/pinctrl/actions,s900-pinctrl.txt
+F:	Documentation/devicetree/bindings/pinctrl/actions,*
 F:	Documentation/devicetree/bindings/power/actions,owl-sps.txt
 F:	Documentation/devicetree/bindings/timer/actions,owl-timer.txt
 F:	arch/arm/boot/dts/owl-*
-- 
2.28.0

