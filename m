Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A4421D92A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbgGMOvL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbgGMOti (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87083C061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r12so16827468wrj.13
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TMIlOVRDCYaSAty7/afpaXFLg9AMRQm1G5k0VXrMmr0=;
        b=kzgxGc3N8RHSM05U2cbTEttiKSICBcl2ap2J0SyaJCAFyWNkScXmvzI5l9237ZFd1d
         tYsXS/CeVODSP5dh4AWxjwEuEkqLu+CgMnsfbDviVEovHt+0LGQZFxUHJruUpQtDWG72
         qo5ALHeTQEJI9nQQsPE1He4vUb8WBW76u4uqMfiS0ju6c42oM7GTIJz4gufaQDzEsjpH
         ezTKmNoHvf7lI7S2BZ5C1i5uvizrblnH0UrVvxd/Yn/iBUuFoaCcKGDq40SFwrGKhTOo
         tKxOdIxWkjDQywgSxP6+Va8svUfh1YnRBM/zfU2PLdIyms1JpFYFkoqfCIE2NUfGNhGp
         vIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TMIlOVRDCYaSAty7/afpaXFLg9AMRQm1G5k0VXrMmr0=;
        b=ct7u79K/EwZnfDwDfPjKtZyo46miVEZR/rP7EA4L0YkNJNioSnJqupp1ZWc/7tvYHa
         5lIAsL5ezDTXTd+3n1hzFMteG3gBQbwx7Ciu3y+ATqcVfXYL+mmeZ8SdvP8/JBw2DFp1
         C0dJzcFmM//HJIRC+CsYPLWFvsJ8ua9LS4Kly1WQTFslhuUWvffjhL8wRE+I5hx+J0/X
         yY6UJbW9w+LeR6rmqUwkL+d1jZDD2AVdYyLRI2ycL98T0pdutAPnvpqx3ihct5G7rXQZ
         9cCeaHdP4kdZcmUwQmuZNxz9vemA77jTuszvqraUH34AlCHIYXeh9SaR2M3DO3nbTUgy
         8NDw==
X-Gm-Message-State: AOAM533gw2UROqsy3G/dMza8RrIWz35TnLD3mGEyzRVKlFa2wXW5vUgf
        4SdG79KG91Da15rqzmEC67o1IA==
X-Google-Smtp-Source: ABdhPJwTKT4GJlQvG77L7gfYBSDpFZ6xtFBDE25t9ON82D4FbSU0ehp1cSeDnYtWZ7DbCKQ93IbN9w==
X-Received: by 2002:a5d:684f:: with SMTP id o15mr76695440wrw.148.1594651777326;
        Mon, 13 Jul 2020 07:49:37 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:36 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH 04/25] pinctrl: bcm: pinctrl-iproc-gpio: Rename incorrectly documented function param
Date:   Mon, 13 Jul 2020 15:49:09 +0100
Message-Id: <20200713144930.1034632-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:141: warning: Function parameter or member 'chip' not described in 'iproc_set_bit'
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:141: warning: Excess function parameter 'iproc_gpio' description in 'iproc_set_bit'

Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index a38f0d5f47ce9..e2bd2dce6bb41 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -131,7 +131,7 @@ static inline unsigned iproc_pin_to_gpio(unsigned pin)
  *  iproc_set_bit - set or clear one bit (corresponding to the GPIO pin) in a
  *  Iproc GPIO register
  *
- *  @iproc_gpio: Iproc GPIO device
+ *  @chip: Iproc GPIO device
  *  @reg: register offset
  *  @gpio: GPIO pin
  *  @set: set or clear
-- 
2.25.1

