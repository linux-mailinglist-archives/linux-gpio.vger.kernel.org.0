Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7201321D914
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgGMOtx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730183AbgGMOtw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:52 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A91C061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:52 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g10so176840wmc.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kYHKuzSRZW2pgI75+9BhMiR0lmiLVyArtYOYZ4zdXms=;
        b=CkZ69wB415MviJkg4zRJn+beBy9bX2MMg9Jisvlhmq6L7OMczSmD5kCqw6qiQV2wWT
         f+bYeNEhbbnIo9rbQQGCRtGcpPc9J53DUlaC2nUJdiJHbN+ccfA0UYDXIM7O+55oNIHQ
         HG4qHvuZ8TPGw2IDsHAQYg9491cBy1xw2wxuUWT3zn+IKivPT5A03cJoZgiJcqJ/q2Mo
         ttECc8UNsz/Ild+2UzIWoM0PH1e57nKUpkTSOqnw6N8/iBA2HJC4ujAEcqubj07ZAReN
         LQgUybSRNEL1PGQNc0yVbgh1P0qIN4dSI2lFMbLfFRRxvxztMSLBnPtoihHOo1FZYj1Y
         OlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kYHKuzSRZW2pgI75+9BhMiR0lmiLVyArtYOYZ4zdXms=;
        b=tlyO7aVkamG2QRBPREcAMHc98kSM1qPbvkGuTHRSNzquBP/lW9fUmcc7vPxk5bp4HD
         M16qFylrWQQvUMmsaPQdMMeR5w6ywcqmzXA6dYJtcU1yFinGavAdFcTUP9vFt8b1/fid
         tr67tbc4FTbGM3llIADXT6l0XeS+cy9S89UY2ru0EQtCwo+ZZh2VMcXFDEt/p+KojOEt
         DE9PHR9Cz7QvvCFZJO9FDknBdfb7Mee/b8AAoWkPX6xLCk36XTpLXNk//o4j/rYTbYVS
         99xxU1dHSGR091AH2/+HdlvAZVfA1sWcM+fpBVM8ndNoNaj08HhUCfgGH2WLTiPoWgwp
         MxBw==
X-Gm-Message-State: AOAM5300hUkAVu73GMab37GJ1o5bAGOlU+NsaEAMEJvuO3zW2iPEGFEn
        7Bwnz4gJKq+T6lYgGSak7ZG1+A==
X-Google-Smtp-Source: ABdhPJz7hrmOvAspGEd4WX05KuXDtMLMHcNxPLhyyfObQj28nOWtLpzcOds3unTAiI6rpPbg7qgr9g==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr315832wmc.150.1594651791331;
        Mon, 13 Jul 2020 07:49:51 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:50 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 17/25] pinctrl: pinctrl-at91: Demote non-kerneldoc header and complete another
Date:   Mon, 13 Jul 2020 15:49:22 +0100
Message-Id: <20200713144930.1034632-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The documentation header for 'struct at91_pinctrl_mux_ops' was missing
entries for {g,s}et_drivestrength and {g,s}et_slewrate.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/pinctrl-at91.c:77: warning: cannot understand function prototype: 'enum drive_strength_bit '
 drivers/pinctrl/pinctrl-at91.c:187: warning: Function parameter or member 'get_drivestrength' not described in 'at91_pinctrl_mux_ops'
 drivers/pinctrl/pinctrl-at91.c:187: warning: Function parameter or member 'set_drivestrength' not described in 'at91_pinctrl_mux_ops'
 drivers/pinctrl/pinctrl-at91.c:187: warning: Function parameter or member 'get_slewrate' not described in 'at91_pinctrl_mux_ops'
 drivers/pinctrl/pinctrl-at91.c:187: warning: Function parameter or member 'set_slewrate' not described in 'at91_pinctrl_mux_ops'

Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/pinctrl-at91.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 37997e5ab0538..77e1b9ed3a634 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -66,7 +66,7 @@ static int gpio_banks;
 #define DEBOUNCE_VAL_SHIFT	17
 #define DEBOUNCE_VAL	(0x3fff << DEBOUNCE_VAL_SHIFT)
 
-/**
+/*
  * These defines will translated the dt binding settings to our internal
  * settings. They are not necessarily the same value as the register setting.
  * The actual drive strength current of low, medium and high must be looked up
@@ -162,6 +162,10 @@ struct at91_pin_group {
  * @set_pulldown: enable/disable pulldown
  * @get_schmitt_trig: get schmitt trigger status
  * @disable_schmitt_trig: disable schmitt trigger
+ * @get_drivestrength: get driver strength
+ * @set_drivestrength: set driver strength
+ * @get_slewrate: get slew rate
+ * @set_slewrate: set slew rate
  * @irq_type: return irq type
  */
 struct at91_pinctrl_mux_ops {
-- 
2.25.1

