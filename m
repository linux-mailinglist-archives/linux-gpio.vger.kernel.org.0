Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21FD2AC80E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 23:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbgKIWKU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 17:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729493AbgKIWKU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 17:10:20 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9C3C0613CF;
        Mon,  9 Nov 2020 14:10:18 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so14654165lfc.4;
        Mon, 09 Nov 2020 14:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=em07hhH6gDh5I9dGKEWC68ecZytu6S4+fnY52W0wh6Q=;
        b=Awh5zaO/rgzS5lCFPTQzLJUOl0WgHmaUgmJF8oDukbCxXUcDE9LMT4JOBOpKTEKfw8
         +/TxdIlLNvjVpxmCfoCbuP5jfVt7+1/VUUDIrfTQQdy8FCaPzSaO6cxXXdvLZ2d22mY5
         9+6THMo0tNPmKZSWdQ0wNrY0FD97hmdOQKB5MjA2MtrzY1ELKyTLrY83OSrfl4Th+cVA
         W2k92ftsyUNf9IuhS5ajZmiwlQ/XLncU4sdQp+Se0cDx2U92i3tlk7gb63+ZplvOskGP
         y8R4B4EhwIG2Rhd/Ead2BLKwLjT7uCbwKIxefX3NRsIhG67tNcauMgR3YqdfCVuXMSMF
         bugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=em07hhH6gDh5I9dGKEWC68ecZytu6S4+fnY52W0wh6Q=;
        b=KTPa52QUgTyddjT3J7Q2R78GxEZamZqJ8M1gVU87xV/8M3W5YMy7gcaZRrSXVSrPB6
         vXu3e4rj1CyvIGubEHcZYwadnvjwMJogXMpIG37V2Zg3Vnp48xa+Vc51eT7kMntwxkZG
         5w67usTZRHKYDxMUbAshdA/VaTDzDJYdXigsw5idGdk7MK0P5fYb84R+tOD4ZDcK3lmh
         XdLbbe9heqHo55U+4q2cG/vC/Wl/VdmcMyTXbrJCxuUd39s5RcNQNeoWGm4kR1tuxPYk
         I45OhR68+J+JbbmhfF1F4dbOrLLPYDxat8bjJFyqcQ5+vLFm4JsHqAwHhHB9mC3b/+Rs
         J2bA==
X-Gm-Message-State: AOAM530axOpi4Q5nkWeHoXV1GJuksPM/jSmK7EA79ZMZ9RNgNJ3nE0e1
        GoIdFVnnb10GC9PO+7o6qlDJ8kM2ktbpoA==
X-Google-Smtp-Source: ABdhPJyBqz1JTzixTSdMkADwbEY9B0GlFHP45tNYqhkOd9EKb9zuCwnCjybAoOLmfVrLh9Ef+RPMIQ==
X-Received: by 2002:a19:bed7:: with SMTP id o206mr5807708lff.360.1604959816788;
        Mon, 09 Nov 2020 14:10:16 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-112.NA.cust.bahnhof.se. [155.4.221.112])
        by smtp.gmail.com with ESMTPSA id o7sm1586063ljg.41.2020.11.09.14.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 14:10:16 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] pinctrl: renesas: Constify sh73a0_vccq_mc0_ops
Date:   Mon,  9 Nov 2020 23:10:12 +0100
Message-Id: <20201109221012.177478-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The only usage of sh73a0_vccq_mc0_ops is to assign its address to the
ops field in the regulator_desc struct, which is a const pointer. Make
it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/pinctrl/renesas/pfc-sh73a0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
index afabd95105d5..96b91e95b1e1 100644
--- a/drivers/pinctrl/renesas/pfc-sh73a0.c
+++ b/drivers/pinctrl/renesas/pfc-sh73a0.c
@@ -4279,7 +4279,7 @@ static int sh73a0_vccq_mc0_get_voltage(struct regulator_dev *reg)
 	return 3300000;
 }
 
-static struct regulator_ops sh73a0_vccq_mc0_ops = {
+static const struct regulator_ops sh73a0_vccq_mc0_ops = {
 	.enable = sh73a0_vccq_mc0_enable,
 	.disable = sh73a0_vccq_mc0_disable,
 	.is_enabled = sh73a0_vccq_mc0_is_enabled,
-- 
2.29.2

