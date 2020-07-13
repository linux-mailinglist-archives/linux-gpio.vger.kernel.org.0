Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C78821D912
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730164AbgGMOtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730159AbgGMOts (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:48 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3132DC061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:48 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a6so16866079wrm.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SMipzZYJu8LR1S684y2mNrnWVA5TCC4bAA7Iz5/5CcI=;
        b=zce1ip8zmaLh0pqXP0eF7z2mXwnarWeQ7nDj0kV29aJAUrksLMbtyCyhllEs4O/zyS
         DlLimcmdIq0ekjAoJRvy7abIF6MIpRMlVwGZqqFjJmM+feJ7SxwO3vini+w+xBkwr7OD
         K0Sp2LoSl9f+ClywO7+Y8RrJpb3Qa4qcT1X/hoH6r7aqg9zsAS+eWfEF7RHMs2P6zLQT
         QDAqObXmaxXvWmG6Rxb/K0PrZSx5s2O5MMWL849pw4RPD3yOhQuoBj3jyLnbcLWhl+qw
         CegHSweDUX51vGLFhU1CuFaRRnlpDmNOmWODanqUlMhFJN/IfwZXOV3szs34d9v0/zyP
         BpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SMipzZYJu8LR1S684y2mNrnWVA5TCC4bAA7Iz5/5CcI=;
        b=OwKi/5C2Z8eH0KaJ7jNMU6+7zUF8rIcyIOFFIi4pLCvPfR4sJGRQvAoQIl5v6FWdwX
         hwMzQlbErszeha+sBhWMrfytgt59EMnstzex9pwygCqVekPZtSr9ui14Z+yw93+pJS3p
         h5m5cp5MuRsrW9khJinEmKYCrtuG8PC3GkAuMa0i+YXDGgEMjX5js6cXk80zts9+TIHm
         qfz3cFZtzkhJmVNv99aECEaIJtznQK2rCul6xbkJWVPwyMw9SHVY4/Z9lPSYlD7hE6nv
         Xdnv0NBPFWC2Ek4qwuJZvSeqYrkF0+/2bSniUVHeKBkvNkjpUFEDJicR+WjXUjyxhFt7
         RxMg==
X-Gm-Message-State: AOAM532wq+7zuJRBeLW/kajVBEmUMCR/tgyhqSdagb2h3oQguQOMa4f0
        5ScaR94Tx3e/wdllmFU9xugpaw==
X-Google-Smtp-Source: ABdhPJw3ZQBd6lIQl7siqOdyvmglbqKHXtOVGj8IWar52W8ai94yFUDms0wk9biaFCx3CcZS6soCeg==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr77598965wrs.306.1594651786953;
        Mon, 13 Jul 2020 07:49:46 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:46 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 13/25] pinctrl: devicetree: Add one new attribute description and rename another two
Date:   Mon, 13 Jul 2020 15:49:18 +0100
Message-Id: <20200713144930.1034632-14-lee.jones@linaro.org>
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

 drivers/pinctrl/devicetree.c:27: warning: Function parameter or member 'map' not described in 'pinctrl_dt_map'
 drivers/pinctrl/devicetree.c:27: warning: Function parameter or member 'num_maps' not described in 'pinctrl_dt_map'
 drivers/pinctrl/devicetree.c:409: warning: Function parameter or member 'out_args' not described in 'pinctrl_parse_index_with_args'
 drivers/pinctrl/devicetree.c:409: warning: Excess function parameter 'out_arts' description in 'pinctrl_parse_index_with_args'

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/devicetree.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index c6fe7d64c9137..5eff8c2965528 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -17,7 +17,8 @@
  * struct pinctrl_dt_map - mapping table chunk parsed from device tree
  * @node: list node for struct pinctrl's @dt_maps field
  * @pctldev: the pin controller that allocated this struct, and will free it
- * @maps: the mapping table entries
+ * @map: the mapping table entries
+ * @num_maps: number of mapping table entries
  */
 struct pinctrl_dt_map {
 	struct list_head node;
@@ -397,7 +398,7 @@ static int pinctrl_copy_args(const struct device_node *np,
  * @np: pointer to device node with the property
  * @list_name: property that contains the list
  * @index: index within the list
- * @out_arts: entries in the list pointed by index
+ * @out_args: entries in the list pointed by index
  *
  * Finds the selected element in a pinctrl array consisting of an index
  * within the controller and a number of u32 entries specified for each
-- 
2.25.1

