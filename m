Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61FE0EC22B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbfKALo2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:44:28 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41293 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfKALo2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:44:28 -0400
Received: by mail-pl1-f195.google.com with SMTP id t10so4248507plr.8
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2019 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HYcyXicczGqedwkA0RX8302L7yCCyvi02ECWDZ4H3YE=;
        b=K8lPz0xbqkif8mu4Vpb1ZlmII+LJ9AghPx3gJDzNG2rhm+44raNPCGoJgz/d9uEqN8
         npI85sgp7zI5cZOrDA/1+2zG/fJfxUxJ4ghBIdc5Oz348+f33pNNOTAaeRyM2yGRq4pu
         N48IBvQRVsYkOlYZGp+FYliFvwziH4/gDUbqCwwP7kv1BOyZfJNN0BZ/sQlru43otWQ7
         AEem+qbTpEHuDe1wYqRQddoKtzYIewAQluie9i3GH5aSeSL2zRJqyR1owaiyCclpstxa
         QGXbL4kttrkQSRgsgXCPeDTctgE0W2q1uQSjIMqtQKoU4NKmX5FpDI5S5Y6FOSTkkUSK
         xsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HYcyXicczGqedwkA0RX8302L7yCCyvi02ECWDZ4H3YE=;
        b=WMOgPBE6w3WQCtzPetpb96eC4O/4ymHWNxh3nueWCPyctrwcJNe1G8X/jV1SJqC4Ub
         jkBjp7UiKnswNCF/7Gsv6SJlj/sjfYDo4Hef6ub2iWWaH19MXKmhsAXL6tXJBtHtI5tz
         VaT57UKjTNkkM7oYT/Hg0olRx1BNrs1w/TxF+T8s7j1sbxLWv0vHOD9kCE+TOcaVE6tb
         91ShPmtDf7OlDAFqqaVyoP4N0SEXFm4P5Xk7dHZb+f4qsLUZD6l6DozKkPcxeZ9Rs0wK
         MHD1qboiHWBWkBXg/4iApEuUx09G5nF/wMeJG1w1sNgFkKezJWPgC9Cc/FB8og3r/yxR
         unzw==
X-Gm-Message-State: APjAAAUXq7i+xPnxJCc7Z8XLdfcQpITrSSCoE24m3hzb6EQqNbItho00
        vkL7Vb8hHLLyzxOc1+URjYE=
X-Google-Smtp-Source: APXvYqxxBeFgiDe+3GxSxlLRXtmr9OiJaT8BFyJpCcyTxwJ9uPKrlRzc4nA1MO3S219RRdDHemNCAw==
X-Received: by 2002:a17:902:243:: with SMTP id 61mr11948850plc.66.1572608667449;
        Fri, 01 Nov 2019 04:44:27 -0700 (PDT)
Received: from localhost ([43.224.245.181])
        by smtp.gmail.com with ESMTPSA id t27sm7006693pfq.169.2019.11.01.04.44.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Nov 2019 04:44:27 -0700 (PDT)
From:   lijiazi <jqqlijiazi@gmail.com>
X-Google-Original-From: lijiazi <lijiazi@xiaomi.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     lijiazi <lijiazi@xiaomi.com>, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: just return if no valid maps
Date:   Fri,  1 Nov 2019 19:43:52 +0800
Message-Id: <29421e7720443a2454830963186f00583c76ce1e.1572588550.git.lijiazi@xiaomi.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If there is a problem with a pinctrl node of a device,
for example, config child node do not have prop specified in
dt_params, num_maps maybe 0. On this condition, no need remember
this map.

Signed-off-by: lijiazi <lijiazi@xiaomi.com>
---
 drivers/pinctrl/devicetree.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 5d6d8b1..dedf450 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -147,6 +147,14 @@ static int dt_to_map_one_config(struct pinctrl *p,
 	ret = ops->dt_node_to_map(pctldev, np_config, &map, &num_maps);
 	if (ret < 0)
 		return ret;
+	else if (num_maps == 0) {
+		/* if no valid maps, maybe caused by empty pinctrl node
+		 * or typing error, no need remember, just return
+		 */
+		dev_info(p->dev,
+			"there is not valid maps for state %s\n", statename);
+		return 0;
+	}
 
 	/* Stash the mapping table chunk away for later use */
 	return dt_remember_or_free_map(p, statename, pctldev, map, num_maps);
-- 
2.7.4

