Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB262D8EAA
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404865AbgLMQSu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404566AbgLMQSt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:18:49 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B879C0617A7;
        Sun, 13 Dec 2020 08:17:33 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id t16so13985333wra.3;
        Sun, 13 Dec 2020 08:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3TZb1oXr2CFfySaD0gQhDI23CCFyEFYHoaiVTmK47IU=;
        b=fSjuQqegVO2OnTO2KpRl8gXR23wJ0b9x5sI6nLyKMWm8wQqWJLwpm7J/o3N0PsF9gM
         P0IrEgBGIDUcfsA77w4gQb11yL79yeQ0v3Cabf3yppxl4PwirG+7w6P5l+bB4fzV/iiP
         1glOboCcOUkGs4sNKEzP//eow5rkiD19sstzJQyDTnmELy66XPsKQoAjIw+IBODrFOLI
         O9B5U79RG8xNSojjteJKU8+WRVfISCOu1EWZdlv3hsvAvAO2LmmNJdsfQ00sBB1x0gBx
         opwmUNYrbFelHliABo8W0QM9/3hZaHmMyodW4KJ9RTAdrlwPaN+DJakFJXLU9s8+xGIf
         RJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3TZb1oXr2CFfySaD0gQhDI23CCFyEFYHoaiVTmK47IU=;
        b=PUirzcViZxXvaUGmlfs9y4Unpthfnwp2abVKlu3mEx/LGAx0HYQvzI7C4Sl8WhCkTR
         I60ppiJ5RK0ocoX/4FWneaHHS/Cs4rxO8OveN4SbrykOOElNu+La59iH9ca/PcqHdyOh
         1SOsXog9E6Aiek/AmNnXz9GBRqqYExf9lPC6ftOIpAMoNlZPtmzWsHM2dHIlZ0P8nrjI
         7ZJHOTV5gA0Se/g0TNaqG7I4FJOhpW3JOoE3nRc5/m156QTu/F9PvGztZNMWM8+7DCVd
         Aj5c1dg8wEGSF8rCJ72DydNs0mgUYGVBpL3aKjkhBkxeKawh25G4ve6Cmak76pIOzaoT
         Pxpg==
X-Gm-Message-State: AOAM533l5DOWZ+tUDpyWaR4UIQe5/K7tRFDLx/KhquqsD+M2Qc3g2Y/S
        hQZnPzgDknUsQyxOa2UR2NI0sVOa7L8=
X-Google-Smtp-Source: ABdhPJz9L0Im5swqMG5cHeuSZzXmHd5yDHRImptEViZ08Hl/+enm94hZujAc0lmCHqupqDdviczkbw==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr17984953wro.231.1607876251826;
        Sun, 13 Dec 2020 08:17:31 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 64sm27102073wmd.12.2020.12.13.08.17.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Dec 2020 08:17:31 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 7/8]  pinctrl: ralink: rt2880: use 'PTR_ERR_OR_ZERO'
Date:   Sun, 13 Dec 2020 17:17:20 +0100
Message-Id: <20201213161721.6514-8-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 Avoid some boilerplate code using 'PTR_ERR_OR_ZERO'
 in probe function.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 5af1c8a20322..983da62ff3be 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -343,10 +343,8 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
 		return err;
 	}
 	dev = pinctrl_register(p->desc, &pdev->dev, p);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(dev);
 }
 
 static const struct of_device_id rt2880_pinmux_match[] = {
-- 
2.25.1

