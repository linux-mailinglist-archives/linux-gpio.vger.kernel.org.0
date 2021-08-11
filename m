Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6C33E99AF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 22:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhHKU2U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 16:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhHKU2U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 16:28:20 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030F7C061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 13:27:56 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id go31so6740423ejc.6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 13:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=/fBXwRi3zHoXySC63co3Zg3PXm2L8vBGwxoAcufUXkE=;
        b=avVBCPDaLVUmDViSx3YbB7UlpUecmw+Dl9WLOuSsCFc3QzOCGYgUgykxq+RoRi/DKR
         gqM/V0uhDSZc4p781wOzqvPleRfs+SCh2cm8+S3Jy52lh23ZmYKZp8gPU5M7thqgI4/Q
         qcrPNbWgSK0DEGtyRfSboba8TsiKYluB7z7JDHpQIq34IclPX/CCn7Fbc9dxX2ni0wNO
         YKvpQxhQ3rOyNYGXqn9kaYax6gHNdMzbeF7Ixh5pB3m7Z5bFxGYEu94GzAhCVNmCnP1O
         DQQof8Gckr5sQQpheRhbuy/lFhXTNO4gWsdFDDNq7lTET0h1eg8ET0ug7t56RwlHZlUg
         A25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/fBXwRi3zHoXySC63co3Zg3PXm2L8vBGwxoAcufUXkE=;
        b=fySNoky94XWggvYVhz8V5piZx+pquN5DmiNiAzTbwkRg1DeAKtUUSJEJPYQLc8ozFt
         n4PomIeQqNoDLb7j4NB0FSJTN8MJigadC85RsRRacEywg+SMFUVSoQ9gr51p3FHGehJC
         0k8z8qmJKffnhIy3Qqf0rkIjGYCpqQFaH6C4aqedoHRbxjcxp/DTfN6ybmy4GhsuRnS0
         AcLLbNXJUb2UBNA9e/Mu8kpZSGBZTOSIpzrJVysNuHZnWZwiNfEpE41nTs3fyK26syAC
         gI/JzGuETkLMqC9eVjQd08GRP3nS4tCtKzRFGu2Wzw0ta/rRgahkqOZr4H1kyvTaSXQV
         cU3A==
X-Gm-Message-State: AOAM53033D0dWSWBXQTS6OFnxWG8x4O03/6pE1LhfeCc7nCnybuN1sYr
        d0mKKSxSWXigHOrG91vxR51B5Jp1c8i6Uw==
X-Google-Smtp-Source: ABdhPJza6hhstiptmW8MZiHRPpoG6hxDjeyvEurzf5TaW7W6YwdRbkysNloYH4rSzqWFA9FpnqxTUQ==
X-Received: by 2002:a17:906:1f82:: with SMTP id t2mr277207ejr.499.1628713674568;
        Wed, 11 Aug 2021 13:27:54 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id q9sm142191ejf.70.2021.08.11.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 13:27:54 -0700 (PDT)
Date:   Wed, 11 Aug 2021 22:27:52 +0200
From:   Ben Hutchings <ben.hutchings@mind.be>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH] gpio: omap: Enable software fallback for long debounce
 periods
Message-ID: <20210811202751.GB18930@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

omap2_set_gpio_debounce() currently returns -EINVAL if the debounce
period is too long to be handled in hardware.  gpiolib provides a
software fallback, but it is used only if the driver returns
-ENOTSUPP.

* Enable the software fallback by using the expected error code
* Downgrade the log message about this from info to debug, since
  the error is now handled

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 drivers/gpio/gpio-omap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index ca23f72165ca..93812480dd0a 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -190,7 +190,7 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 	if (enable) {
 		debounce = DIV_ROUND_UP(debounce, 31) - 1;
 		if ((debounce & OMAP4_GPIO_DEBOUNCINGTIME_MASK) != debounce)
-			return -EINVAL;
+			return -ENOTSUPP;
 	}
 
 	l = BIT(offset);
@@ -887,9 +887,9 @@ static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 
 	if (ret)
-		dev_info(chip->parent,
-			 "Could not set line %u debounce to %u microseconds (%d)",
-			 offset, debounce, ret);
+		dev_dbg(chip->parent,
+			"Could not set line %u debounce to %u microseconds (%d)",
+			offset, debounce, ret);
 
 	return ret;
 }
-- 
2.20.1
