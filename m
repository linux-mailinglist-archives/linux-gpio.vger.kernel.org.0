Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B1B21D8F4
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730160AbgGMOts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730158AbgGMOtr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:47 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31AF8C08C5DD
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:47 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f18so13445290wml.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vd2sj2C+/BCAJxR/LaESZDmFFOuWK440rmdqEyE8mPM=;
        b=XtQOx7in9ZZo01xvUwtPb71cD03LuqUg5mjxFCU8fVtsM9wgJaGzymWPTCk6RAAosp
         ESWRw35FOp86sTVMJwxSp+XrILjPVNaKm5eCK2pxO2YBb6xZ9H+ZLaT2vHvITumQzbXA
         e0xswYA716id0G4VTOndgM3E07J1+apu69twfPsO9ideH7JTLI24InIpLwGzS4rOXSku
         iX53kFdsr7ZTu3NI1ma4fddkk7UOmVlsaKTdkRDJvVngDCOaNBReUbBp7Vl1d+PWdMPt
         PhJ6s5Y+oUQR9YgEpQ4OFI9JYtM+nmya6l2zMAY7SOR3HlHAA0h9rqw1J/HhR4buc3eO
         nfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vd2sj2C+/BCAJxR/LaESZDmFFOuWK440rmdqEyE8mPM=;
        b=rBjVpdOh1ZC8nCXMJ2R9xOgM+NlLxzRSCA/cftu3Q4m/Nx3lCpxfWCeYLjwIw2a0eH
         rXrEFcLehLEq7T6wEzXUX8Lsr2zzJWILndlea9D5ssYgsxkLwzx71FpRUDeKK+fMAxmw
         t2z0inpqEvyfeEVRRXh8CF2WiPEWQUynPfz4sbiLiZFtg0zLPQ3dvUUmchYcy7pOpLP6
         cVvQBhek09RhO4f6SZZfgIb7zswPKexBrHJgG28XhGptnnIa/ERvfbUQ60tvugnP22Z2
         vrWh/KPx0KOohV3h5KlE2HwnJ88tnb14oXrPmD7keFS0YTYKdSUeJ434tbZcpMB9HzB6
         oqug==
X-Gm-Message-State: AOAM530Vc9nKHNNQ/Zy0bn1jIJe8+1z2shnJy+f0Avrwr7i89YKZI1pC
        fgC7sncmJU3EuNZWyerBBtgpIg==
X-Google-Smtp-Source: ABdhPJxZi7VY+XJomfZXlPnVlWacGDuJlQRdZkRS5KZ1z4wQpmgQAq+kQ5+pdP3A3wbPRVY3KfuHDg==
X-Received: by 2002:a05:600c:21ca:: with SMTP id x10mr288300wmj.63.1594651785916;
        Mon, 13 Jul 2020 07:49:45 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:45 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 12/25] pinctrl: pinmux: Add some missing parameter descriptions
Date:   Mon, 13 Jul 2020 15:49:17 +0100
Message-Id: <20200713144930.1034632-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

And rename another which has probably bitrotted.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/pinmux.c:83: warning: Function parameter or member 'pctldev' not described in 'pinmux_can_be_used_for_gpio'
 drivers/pinctrl/pinmux.c:108: warning: Function parameter or member 'pctldev' not described in 'pin_request'
 drivers/pinctrl/pinmux.c:261: warning: Function parameter or member 'gpio' not described in 'pinmux_request_gpio'
 drivers/pinctrl/pinmux.c:751: warning: Function parameter or member 'selector' not described in 'pinmux_generic_get_function'
 drivers/pinctrl/pinmux.c:751: warning: Excess function parameter 'group_selector' description in 'pinmux_generic_get_function'

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/pinmux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 9503ddf2edc76..bab888fe3f8e3 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -74,6 +74,7 @@ int pinmux_validate_map(const struct pinctrl_map *map, int i)
  * pinmux_can_be_used_for_gpio() - check if a specific pin
  *	is either muxed to a different function or used as gpio.
  *
+ * @pctldev: the associated pin controller device
  * @pin: the pin number in the global pin space
  *
  * Controllers not defined as strict will always return true,
@@ -96,6 +97,7 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned pin)
 
 /**
  * pin_request() - request a single pin to be muxed in, typically for GPIO
+ * @pctldev: the associated pin controller device
  * @pin: the pin number in the global pin space
  * @owner: a representation of the owner of this pin; typically the device
  *	name that controls its mux function, or the requested GPIO name
@@ -254,6 +256,7 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
  * @pctldev: pin controller device affected
  * @pin: the pin to mux in for GPIO
  * @range: the applicable GPIO range
+ * @gpio: number of requested GPIO
  */
 int pinmux_request_gpio(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range,
@@ -744,7 +747,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function_groups);
 /**
  * pinmux_generic_get_function() - returns a function based on the number
  * @pctldev: pin controller device
- * @group_selector: function number
+ * @selector: function number
  */
 struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
 						  unsigned int selector)
-- 
2.25.1

