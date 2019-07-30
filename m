Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C54A67B19A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 20:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbfG3SSs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 14:18:48 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41304 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387998AbfG3SQ1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 14:16:27 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so29101130pls.8
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 11:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=somlVG7aoLRTDNe0zC2Drx3Tdp0wP3Lq13vd9q8TT1M=;
        b=EBEboaQYV9O8iIM6zMNzpv8mUeY2ChFjVpMiAksAcInisqCt/i5VHf4CkWOv3Rh05j
         yinJoKRluXbD7HBvDWEQo53BlbwCh2uTqrm+6a6sZG9Y6cNKub2X27OWEDNdHzsgsnVW
         VNo4pbLsbAEyIPZpB9FD2B5bD6i3XHgy9nCsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=somlVG7aoLRTDNe0zC2Drx3Tdp0wP3Lq13vd9q8TT1M=;
        b=msmFINsEVEqjgKOds2PjXfd3RCcOP2DXudrtjJeZaulHyabO9/pFg1Fd9xxd6BP8+t
         s03bt9lsBrj86waxxf28Ze8yDCBgLHTZcu8uXpcHJQh08Y+VR60vKZMDkGxoApn8roJ+
         Acu14lg06qkEzHhEwVY0zmFwhp6UgBX+k63w7JnlBx6t0sfLHaROkIR3o7pPngCM0Lig
         IcIS9lhXwJOjF6QWj4hTWnn50sCW/BAEhqvbFs0IX73PePYPjq21KqDmASw1VAqqVmes
         l/ONI6eyPh3zOAIpUMMmxIFAh+vQ38OKAXNvKpoqzl2/jIAehqlFQ0ej6ebZpu0VB+RB
         PGJw==
X-Gm-Message-State: APjAAAVf9yzV3wsGrBrFaatGymMGC78xJBHYbwlDDDypqHA1IjMQuxEP
        +DLY1Mr+Ef9YqWLdQsAiw39VTQ==
X-Google-Smtp-Source: APXvYqxIkt5iVgs0+JZCzcg9/Lfm3fKrzE+StmdAm35afC4BtiXz82ANFeNTavglrAZZuqhuLArMMQ==
X-Received: by 2002:a17:902:583:: with SMTP id f3mr115777543plf.137.1564510586981;
        Tue, 30 Jul 2019 11:16:26 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 11:16:26 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 34/57] pinctrl: intel: Remove dev_err() usage after platform_get_irq()
Date:   Tue, 30 Jul 2019 11:15:34 -0700
Message-Id: <20190730181557.90391-35-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 drivers/pinctrl/intel/pinctrl-cherryview.c | 4 +---
 drivers/pinctrl/intel/pinctrl-intel.c      | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 03ec7a5d9d0b..cd4a69b4c5a8 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1703,10 +1703,8 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pctrl->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get interrupt number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	pctrl->pctldesc = chv_pinctrl_desc;
 	pctrl->pctldesc.name = dev_name(&pdev->dev);
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index a18d6eefe672..0487e8dc7654 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1354,10 +1354,8 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get interrupt number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = intel_pinctrl_pm_init(pctrl);
 	if (ret)
-- 
Sent by a computer through tubes

