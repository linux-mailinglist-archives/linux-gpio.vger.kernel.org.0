Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F5321D932
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730380AbgGMOvV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730030AbgGMOth (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:37 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C39C061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:37 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o8so13578342wmh.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xfpl3krDlT8kqZoXWzMglbVA6yEQ7zQak8/zpsxBtws=;
        b=QFwy12mDhDjXsi8jVGm7MW3MzZHhi8fRtIBh763h/vU/iQIW2/e1ZjkNEqZRwTIsqI
         CVDQDQtRvNYzadV4mD+IQhF2tjgLdCuLoPFkjryFjF+nPggWzC0JBnNsAKpEeIzOXDXN
         fBc6w3f1kv0Efauvy1IP3qnvUxn9KYSk+OMgMICKfSwkIp22oX5CnpBORnfGVuGhgGPl
         uLTtCHN2qxiRuJPvxhRJ8RiGLDOSzQrIGXTmhwimhR2qFsDxEKYXSflgGfLyb2xInSbI
         qPiG9SuYlN0KdAhvKjOTrbIia8fR6wPLyfXDZTIGySrTc4wLowscvahoSUb0jdJEOErV
         Np+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xfpl3krDlT8kqZoXWzMglbVA6yEQ7zQak8/zpsxBtws=;
        b=MlD2a022Wvu4IeV+nLso+Lfrp8uRA3DdZzutrSRC/Dp07UONXXZ9EU4HLjYcy7TJ6A
         B+rOeEh22Edsjhosm8IKG0OvPIo3U39eApSve2hzf3SBONFK3uzWnDHO6v6U9zIwk2KD
         7iwrAYZ1EXb3wkGgfFwFpS19a46oxWDeDau/OKtfOxow49G67FKBT8mIy0SDW/aDY/pm
         WmGJggGFT3PZO0N6DwanGLmEx8cPuN6nwXFG/Cfl6bsk71pa0EYo9qT4DAC76MGHqBd1
         i7+A+EqswjHY3y6J0kPsLRGvXhAuYI/atOiS+jFL4QEcA6/R5ow7CJSBbmHB1WHgji0g
         J5kQ==
X-Gm-Message-State: AOAM5304Avn/Fy8XPZEGUzuljqkD3l+BplLWf9AEk38QcxEsvkrRqzFX
        oz6Omkoox2UrN4itHUy1KSXi3g==
X-Google-Smtp-Source: ABdhPJy3THByD16kYAsdQxLpJ7HKN6a8GpMJZ7qg/5/jCy7o5x18Xh0IE12RhAiUnL2EOxQsIhqfHw==
X-Received: by 2002:a1c:7fd7:: with SMTP id a206mr319860wmd.104.1594651776266;
        Mon, 13 Jul 2020 07:49:36 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:35 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH 03/25] pinctrl: bcm: pinctrl-bcm281xx: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Mon, 13 Jul 2020 15:49:08 +0100
Message-Id: <20200713144930.1034632-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There has been little to no attempt to document any of the demoted
structures here.  These are obviously not kerneldoc headers.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/bcm/pinctrl-bcm281xx.c:65: warning: cannot understand function prototype: 'enum bcm281xx_pin_type '
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c:79: warning: cannot understand function prototype: 'struct bcm281xx_pin_function '
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c:89: warning: cannot understand function prototype: 'struct bcm281xx_pinctrl_data '

Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 71e6661783006..9ab1f427286a7 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -59,7 +59,7 @@
 #define BCM281XX_HDMI_PIN_REG_MODE_MASK		0x0010
 #define BCM281XX_HDMI_PIN_REG_MODE_SHIFT	4
 
-/**
+/*
  * bcm281xx_pin_type - types of pin register
  */
 enum bcm281xx_pin_type {
@@ -73,7 +73,7 @@ static enum bcm281xx_pin_type std_pin = BCM281XX_PIN_TYPE_STD;
 static enum bcm281xx_pin_type i2c_pin = BCM281XX_PIN_TYPE_I2C;
 static enum bcm281xx_pin_type hdmi_pin = BCM281XX_PIN_TYPE_HDMI;
 
-/**
+/*
  * bcm281xx_pin_function- define pin function
  */
 struct bcm281xx_pin_function {
@@ -82,7 +82,7 @@ struct bcm281xx_pin_function {
 	const unsigned ngroups;
 };
 
-/**
+/*
  * bcm281xx_pinctrl_data - Broadcom-specific pinctrl data
  * @reg_base - base of pinctrl registers
  */
-- 
2.25.1

