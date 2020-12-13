Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739442D8EA1
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395443AbgLMQSL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389237AbgLMQSI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:18:08 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA32DC0613D6;
        Sun, 13 Dec 2020 08:17:27 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id c5so10352167wrp.6;
        Sun, 13 Dec 2020 08:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4FZ3cP1OuTxfK0gwz1Y/PUWxvlvZu7xp+4Ek4N5jpDQ=;
        b=WMlym3iS2H3oTcuHjFDLF3LoK1fESINRLhLoCueruLA3MTGES9p1UuprnXuoa3aqCf
         zgrAfrYESj5m/bSI5idH7XeazTPaWQG+/hNq63BG0zYyOYmm03m1P5a/G8aSwG1wS9Gv
         r7LSqmpVREu5vVRbrq8NqABd6b7dNMtnTu9OHDnbs6N4t566G8mJ/ppaOlLlb/4KQ1e7
         nywJy0lPIctVGUch1+0EFrApiRLCtBHgVjup/EHVna10mbGHTgXJV8wYJ/AI0FFaE3wI
         G0uTmULKxVdlUq5EYzV99jnwuI6PyJLiYNlZYlYwb+kvLMG+LpXvbCTqbRgcWswBCNWC
         a+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4FZ3cP1OuTxfK0gwz1Y/PUWxvlvZu7xp+4Ek4N5jpDQ=;
        b=rGodeef+e8c1drLgtMcihXyQFsE4mL5YjxLs0nFzFxkDlO2g34UQWcY/MRNd0+JGAG
         nKT6ijcZCzNg63QQSLHQmbi9cl+ngktaf1aFzvup46TIqbw0VE0AwHvop1b3c3R6LkoJ
         2KFjYvb99gpX1LBiylh6dFRe1N50p1gVQFPZjUXA7gGsJ/xmPOgfqQcIp4nQwXtylckI
         eWMEvEXG/mphCxefeSCoPZH/bGJPnzFK+VDatRvfJdTMbPDkskv/gmBWpFjI/jzWLuHr
         4b6hLhZipm6CC7e4lcIi9lYTiS93qM5NzzTqwVUUdmGN084xVnFJY45rsWtvS93/uJXk
         4tmA==
X-Gm-Message-State: AOAM531s1sqVrmG2bJ4bw59PreUdp8I7G5ycQjRKAX+pwvapgCKOsVn+
        sQOnzmuuRkx0ZaF4bumUehs=
X-Google-Smtp-Source: ABdhPJxtjsFp2GSspK6oOC9bf01KY9OFbN+m8KcBkj2GKuSkZQkFIpskgiaBW6McDgPFQQ4NVLybEg==
X-Received: by 2002:adf:a745:: with SMTP id e5mr24596097wrd.366.1607876246435;
        Sun, 13 Dec 2020 08:17:26 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 64sm27102073wmd.12.2020.12.13.08.17.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Dec 2020 08:17:25 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 2/8] pinctrl: ralink: rt2880: avoid double pointer to simplify code
Date:   Sun, 13 Dec 2020 17:17:15 +0100
Message-Id: <20201213161721.6514-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Double pointer is being used and assigned in a bit dirty way to
assign functions in pinctrl. Instead of doing this just avoid it
and use directly 'p->func' instead.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 42b1c6cecb57..c933e1a1d4fa 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -193,7 +193,6 @@ static struct rt2880_pmx_func gpio_func = {
 
 static int rt2880_pinmux_index(struct rt2880_priv *p)
 {
-	struct rt2880_pmx_func **f;
 	struct rt2880_pmx_group *mux = p->groups;
 	int i, j, c = 0;
 
@@ -218,31 +217,29 @@ static int rt2880_pinmux_index(struct rt2880_priv *p)
 	p->func_count++;
 
 	/* allocate our function and group mapping index buffers */
-	f = p->func = devm_kcalloc(p->dev,
-				   p->func_count,
-				   sizeof(*p->func),
-				   GFP_KERNEL);
+	p->func = devm_kcalloc(p->dev, p->func_count,
+			       sizeof(*p->func), GFP_KERNEL);
 	gpio_func.groups = devm_kcalloc(p->dev, p->group_count, sizeof(int),
 					GFP_KERNEL);
-	if (!f || !gpio_func.groups)
-		return -1;
+	if (!p->func || !gpio_func.groups)
+		return -ENOMEM;
 
 	/* add a backpointer to the function so it knows its group */
 	gpio_func.group_count = p->group_count;
 	for (i = 0; i < gpio_func.group_count; i++)
 		gpio_func.groups[i] = i;
 
-	f[c] = &gpio_func;
+	p->func[c] = &gpio_func;
 	c++;
 
 	/* add remaining functions */
 	for (i = 0; i < p->group_count; i++) {
 		for (j = 0; j < p->groups[i].func_count; j++) {
-			f[c] = &p->groups[i].func[j];
-			f[c]->groups = devm_kzalloc(p->dev, sizeof(int),
+			p->func[c] = &p->groups[i].func[j];
+			p->func[c]->groups = devm_kzalloc(p->dev, sizeof(int),
 						    GFP_KERNEL);
-			f[c]->groups[0] = i;
-			f[c]->group_count = 1;
+			p->func[c]->groups[0] = i;
+			p->func[c]->group_count = 1;
 			c++;
 		}
 	}
-- 
2.25.1

