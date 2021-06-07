Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF9C39EA34
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 01:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhFGXhf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 19:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbhFGXhe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 19:37:34 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB390C061574;
        Mon,  7 Jun 2021 16:35:42 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id k5so10391975iow.12;
        Mon, 07 Jun 2021 16:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DJlT4Dci1+0InUjSiAenX5rip1gTrlvM4HWii2w9hbw=;
        b=FMFwdzLX6jso+5opTc9sIuOjkLMoMX04/v78JB3Ir07OALzGIszJagb0Y7sg5PjmKZ
         Z3Qx3yH20bUxaAkdVVXkNH2EX9NUTFYIE9pgVy67EqzfQ2E457dZUns4SS0Xuj0XLz3l
         vl96OIefkgIyLlTJiWjSj5kAOQR1ViDs03k1+os2NNSy8kAllIYF5f4lRarlcW+xtUl2
         jFPoDHvuiVdgoRVuHcAHGvcRDG4546dBJkSI+bAUqIQqWXIXXeJnicdv8RdHBkY7ym7S
         p2lRFWmkB5xOz0yRKLds2sNz5JBcu3nFBO9GfLehF19lgg0NSss/Ik3piNjiRbxuENI2
         QDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DJlT4Dci1+0InUjSiAenX5rip1gTrlvM4HWii2w9hbw=;
        b=VKUMIBFnbz6CYT10nhbuBRFAfT1kSu0df7rKOGveJ0em3oaw++K7kxzUPX2jdSfRhp
         5Z8yc0zEwh/BYYCgYP3nlxOdBq3tkkzZO5V6HkCz78lmvlWXcmwsRQEofTqhQa5t2oVU
         mPkVJo9ViSkxvvMTgiG0qLtfEOmWDc9WnjTJ/B2ft4LEstW/p5usl1zLXRTy5+V0VmuA
         mJGar9L4wyudwETmpbtHM7z/NlLZM/7r+jcqZ4tE4ukffE20gUUbQQrM+WUgQ2tt7Bla
         n/vtDYA2LL4ARstML8nJ37GIyz8BQJBHIh0ZxhCVaw5Q/VYiR/V0Y9tORxgJNbt8Bo98
         ZwNg==
X-Gm-Message-State: AOAM531NxYpALatPjNNecM8RgYvgaaztN1IjS0smdy15ARBrBjq+DqAh
        bP+/Cx8B2p6JDf11n6df2qA=
X-Google-Smtp-Source: ABdhPJz5bquAsSSRjzJCkY08pLaBZbDmDUjBMVpUtcvdYa2lEQITQtIONoYIZ85VonLmrbf651ZQwA==
X-Received: by 2002:a02:3ecf:: with SMTP id s198mr17143066jas.59.1623108941966;
        Mon, 07 Jun 2021 16:35:41 -0700 (PDT)
Received: from Crosshair-VIII-Hero.lan (066-188-147-045.res.spectrum.com. [66.188.147.45])
        by smtp.gmail.com with ESMTPSA id j4sm9198949iom.28.2021.06.07.16.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 16:35:41 -0700 (PDT)
From:   Chris Blake <chrisrblake93@gmail.com>
To:     ptyser@xes-inc.com, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, chunkeey@gmail.com,
        linux-gpio@vger.kernel.org
Cc:     Chris Blake <chrisrblake93@gmail.com>
Subject: [PATCH v3] mfd: lpc_ich: Enable GPIO driver for DH89xxCC
Date:   Mon,  7 Jun 2021 18:35:35 -0500
Message-Id: <20210607233535.4198-1-chrisrblake93@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Based on the Intel Datasheet for the DH89xxCC PCH, the GPIO driver
is the same as ICH_v5_GPIO, minus the fact the DH89xxCC also has
blink support. However, blink support isn't supported by the GPIO
driver so we should use ICH_v5_GPIO. Tested and working on a Meraki
MX100-HW.

Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
---

Changelog:
V3: Update commit message format and update contributor message.
V2: Updated commit message, and added Christian Lamparter as a
contributor.
V1: Initial Patch

 drivers/mfd/lpc_ich.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 3bbb29a7e7a5..f10e53187f67 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -489,6 +489,7 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 	[LPC_DH89XXCC] = {
 		.name = "DH89xxCC",
 		.iTCO_version = 2,
+		.gpio_version = ICH_V5_GPIO,
 	},
 	[LPC_PPT] = {
 		.name = "Panther Point",
-- 
2.25.1

