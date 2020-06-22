Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60FF9203DFB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 19:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbgFVRcP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 13:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729922AbgFVRcP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 13:32:15 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3D9C061796
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:32:13 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id p18so14295009eds.7
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 10:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ovMidJWukcafnyUoSegnCUeUmM9YyWMYRmZkPwlZahM=;
        b=S1nZPtuCdm9ch5pQNWiGH0hwwTOBb4GAKeUf+HVXrp4fLD6NUbUuL94SbjOI/LSS72
         SLNwG0UwdqqXjt2F0prL0dbz+CAh/m9BMSqbcY8gilzAsxJZPdXM0F/urV0hyXeybDkL
         RhONouhDGUBW1IMPo9Mh0nnQCnmVrs4ki9G9ZDrM0tzF9L0IgeqlFVeBl6hGOe89GYZC
         FPY3Hi8tOBAASdiHPFbx2ohJrv7c+1Y8WlJBxgF0WK4NF0ZE8tRaayrg3oCbaRKiz/Hi
         G8Z3m2Qj/LZjTZDHt92amMenX3Z4xHL3JGnDuOoBSIMDDbD/g3LDAXEid83jDqzzdEit
         24ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ovMidJWukcafnyUoSegnCUeUmM9YyWMYRmZkPwlZahM=;
        b=Ci71Cz4Mn6ZLgWiMOSfSsoN3D8x0L8NvkgvYaFLSBJTIoexonjNkVAlHyMIirLALwE
         M2HjHYClCKvJCdbWwOLAp5G33vGacji0AX4ZHm6Fr6658Q18FTW2MzHx8pep4+apYlAG
         gVznMSb2/Qxdcv31RrY2e4TzxgVpXnUrETsH/xugcOWKomWDxJvwc8W4v45jATERJ0R9
         NnjQnOhZAmOY+ajwUM/qO2a8fis64jkkDLEL0ZSoj5w5692TqXay6hUqIAvVI8A/Fhxo
         lc9mHFhReH8zftRlxdW8dfP5A6q3W4O/kZtStmObeqN74smSM+ouVEoZ7pIaf4s4ypAM
         H5fQ==
X-Gm-Message-State: AOAM530DoaIxZXy/nIXIWBSpo7/TiLsYbxVoK/BkcEfKWwIRlPEra9QB
        FylX2UyIcs+6xqb6RzAWk2KvSw==
X-Google-Smtp-Source: ABdhPJwe6Gd4k/+os6hh1s7VvLRlLAAlNwHWabRdlzNF1D1Cg3UJFff7cvs543eV0RNNYMW2oKsqUA==
X-Received: by 2002:aa7:da8c:: with SMTP id q12mr18327099eds.385.1592847132701;
        Mon, 22 Jun 2020 10:32:12 -0700 (PDT)
Received: from localhost.localdomain (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id z1sm4747386ejb.41.2020.06.22.10.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:32:11 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3 1/3] pinctrl: single: parse #pinctrl-cells = 2
Date:   Mon, 22 Jun 2020 19:29:49 +0200
Message-Id: <20200622172951.524306-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200622172951.524306-1-drew@beagleboard.org>
References: <20200622172951.524306-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
pcs_parse_one_pinctrl_entry() does an OR operation on to get the
value to store in the register.

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index a9d511982780..17b32cafe5f0 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1017,10 +1017,17 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 			break;
 		}
 
-		/* Index plus one value cell */
 		offset = pinctrl_spec.args[0];
 		vals[found].reg = pcs->base + offset;
-		vals[found].val = pinctrl_spec.args[1];
+
+		switch (pinctrl_spec.args_count) {
+		case 2:
+			vals[found].val = pinctrl_spec.args[1];
+			break;
+		case 3:
+			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
+			break;
+		}
 
 		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
 			pinctrl_spec.np, offset, pinctrl_spec.args[1]);
-- 
2.25.1

