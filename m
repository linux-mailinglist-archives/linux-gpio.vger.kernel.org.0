Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2540F302CA7
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 21:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732016AbhAYUha (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 15:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732060AbhAYUhZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 15:37:25 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE58C061573
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 12:36:43 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id c132so9737930pga.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 12:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vLNudODCN1CmPDQtZqo0+OpRWcr9Knsnb1yDtwZN/WE=;
        b=qkJ5VNO6e16r31myDIV7Nv9FegoO+Cxx6Ln/nuKhuviAN6Xm5DrV+zSXchVpwDQxpJ
         JHxbYF6yjaZXLaCD1JJe3jvMSktETIQnr8Nf21AMIXXwFu2Vl6ddbZ3p5rsLbbimuV41
         CQ/5GW3/e01AEXTYWPSspDUjiA2MRxKI/42ulRagQkg/G/6gf/6HeS/ouyP61UEJbqVr
         ID0vkrb1Vn7qkmUlwbycBqkcml06s4dpYk30d8c+3SXrSEeVfik4nWwzx+jFcETSr/5z
         9CDIi/xUGpmV7LrKXEf/ouuU43r2UCpF4wuGjoE7/k+fAa76QGJ18vMDrK+mD8FOKjCk
         DIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vLNudODCN1CmPDQtZqo0+OpRWcr9Knsnb1yDtwZN/WE=;
        b=on8fYZ1PdzZ9hbDf1EDjeXh2gQgBpVUMK+WQSW83BMwViqCRJvty1lz5YUE4ts2euv
         4BS7IQaVoEYeNxNGysEn+exIUh8b6zL8GJME4sjPDr29t9YnvhA1+0uaX86x3wmxX3lH
         DwkRezUwKHzt12nQoWxTWrIQ6L48Si93R4ZlQB85uWtV8bau/Qnf5J3QWuuqQ0VyMQYI
         f1Uu/oZZ7odmazTu3d1FeiaZ1ZrDtvBNpys5qEiBb/b9VtFNHWGaOnl8Mytt1YVDulvi
         A7PSEv2LkOl5jeI0XF6fiI80km8jXkuBP0zzRsbUvvFzfdXVoMgNuaGWG7InAHLloRGb
         4+QQ==
X-Gm-Message-State: AOAM532k0AZIBrcKeLxsNAQMz0GJWSCCz+AOs6+g1wH9XdIVKqB2Lx97
        Onvt7L60z/vqbj6YRIUhuOA2ObD6udbFng==
X-Google-Smtp-Source: ABdhPJwm+Irv4THAvbkORJDKvLv/3CRZusFzb8f4HLMEIhWwZRV2E7hyahABO+afAa3yA/+dfd8RuQ==
X-Received: by 2002:a65:6645:: with SMTP id z5mr2178023pgv.23.1611607002776;
        Mon, 25 Jan 2021 12:36:42 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:dd5e:ff29:33fe:cad2])
        by smtp.gmail.com with ESMTPSA id i67sm17689821pfc.153.2021.01.25.12.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 12:36:41 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH v2] pinctrl: single: set function name when adding function
Date:   Mon, 25 Jan 2021 12:35:43 -0800
Message-Id: <20210125203542.51513-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pcs_add_function() fails to set the function name in struct pcs_function
when adding a new function.  As a result this line in pcs_set_mux():

        dev_dbg(pcs->dev, "enabling %s function%i\n",
                func->name, fselector);

prints "(null)" for the function:

pinctrl-single 44e10800.pinmux: enabling (null) function0
pinctrl-single 44e10800.pinmux: enabling (null) function1
pinctrl-single 44e10800.pinmux: enabling (null) function2
pinctrl-single 44e10800.pinmux: enabling (null) function3

With this fix, the output is now:

pinctrl-single 44e10800.pinmux: enabling pinmux-uart0-pins function0
pinctrl-single 44e10800.pinmux: enabling pinmux-mmc0-pins function1
pinctrl-single 44e10800.pinmux: enabling pinmux-i2c0-pins function2
pinctrl-single 44e10800.pinmux: enabling pinmux-mmc0-pins function3

Cc: Jason Kridner <jkridner@beagleboard.org>
Cc: Robert Nelson <robertcnelson@beagleboard.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2 change:
- correctly base on mainline, sorry for the noise in v1

 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index f3cd7e296712..7771316dfffa 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -777,6 +777,7 @@ static int pcs_add_function(struct pcs_device *pcs,
 
 	function->vals = vals;
 	function->nvals = nvals;
+	function->name = name;
 
 	selector = pinmux_generic_add_function(pcs->pctl, name,
 					       pgnames, npgnames,
-- 
2.25.1

