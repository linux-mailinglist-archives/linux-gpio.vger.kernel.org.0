Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA1D2A8A90
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 00:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732434AbgKEXTp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 18:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732430AbgKEXTo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 18:19:44 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F840C0613CF;
        Thu,  5 Nov 2020 15:19:43 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id e7so2557243pfn.12;
        Thu, 05 Nov 2020 15:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cU4M3aO8qNJPEDcKvc9bBkdj1lsD85B54nwk8zjxH+w=;
        b=uSzJkTaI8hT3mLK+ArT+3F+RuaNucDSTpT0h7/8Ymo4J0M80PMs+32Uyx+KulVsXn2
         uDEl51QZtfSKP2reRpI2nb97nk9X8BkxiR6uCASh11HueeouSIws0W2lCiMHjangXABn
         Xdk+JU6VqGcPV2b4c0mmGQUnLjreB/y4C1btMNNsy7CWWFEyQICeuFw5/3Dr63KhLHVC
         kaX0TjL1P+3RkrqDYy5//IpT2EuWppraY7UFJjpjkUC22XFCo6wYZJal1NxiFNheumco
         uFgX5/HqPYZb2RqzKN67CjqNH/N0rYj6ONyw8BNjOciiLK1RWuceGG/D3V2N5ZDkjHHz
         fB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cU4M3aO8qNJPEDcKvc9bBkdj1lsD85B54nwk8zjxH+w=;
        b=tOfbxtfIxWDj9DfwFI6aw4P+CU5Y/eVRgdqf/QH0wFpZuW+cnturVvBIqwOxspgqK0
         BMC05TJHXsQHHc2xZJiKz0gGnr5vNvMh7CYqmalVNHlaDtVSYE4uzw96bARCDYELL+Ac
         57N8ucPjTj8Xb7MHuzYy7FpusGZYsEhN2u47CZxyJstki3EszZH8ADLyHq57cgcZegW8
         vEr8eR3wN2/sgQOTW5blBFWSRwiP++X+NrpSLSpau7qSP0GVHrA2NxFoN6u2ifTPTKnP
         fqcU1nLp5uO61dgTNcJxrMv04vQQH1uLNky7NEH6w8FqMMgVnVt3+JMbQus/0qngsmPT
         j9Fw==
X-Gm-Message-State: AOAM532I1vBGqxXaAY6uLmGw0xTzSTNrEp2B+Nd85XGFy+LbfAIAbHnY
        g6gbNBOLEEZmrvR2Zk/ifWA=
X-Google-Smtp-Source: ABdhPJzG+698/3x4qsSqZKPRK6U5QQsJRfmcRkBLQwF3ME8sDn+cvyXpuYK44n6CcES+uipk38t7iQ==
X-Received: by 2002:a63:c6:: with SMTP id 189mr170411pga.417.1604618382788;
        Thu, 05 Nov 2020 15:19:42 -0800 (PST)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id 34sm3393528pgv.53.2020.11.05.15.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 15:19:42 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/4] pinctrl: amd: use higher precision for 512 RtcClk
Date:   Fri,  6 Nov 2020 07:19:10 +0800
Message-Id: <20201105231912.69527-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105231912.69527-1-coiby.xu@gmail.com>
References: <20201105231912.69527-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RTC is 32.768kHz thus 512 RtcClk equals 15625 usec. The documentation
likely has dropped precision and that's why the driver mistakenly took
the slightly deviated value.

Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Link: https://lore.kernel.org/linux-gpio/2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com/
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index d6b2b4bd337c..4aea3e05e8c6 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -156,7 +156,7 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 			pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
 			pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
 		} else if (debounce < 250000) {
-			time = debounce / 15600;
+			time = debounce / 15625;
 			pin_reg |= time & DB_TMR_OUT_MASK;
 			pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
 			pin_reg |= BIT(DB_TMR_LARGE_OFF);
-- 
2.28.0

