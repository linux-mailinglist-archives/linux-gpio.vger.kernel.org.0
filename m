Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484DF2681D5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 01:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgIMXSZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 19:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgIMXSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 19:18:16 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5825C06178A
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 16:18:14 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id b12so15757827edz.11
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 16:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bWJY75AyULAxhQ0F3nLmzgFjwjfgQt1Qe/zoTX8XTmU=;
        b=gxOQysRutB8dPQHtSZKO0bqxRRznZVqn8tzuK0knwge0RgxsAuKhsF3Da83Z4e5bY+
         wmW6+Fl+1teyScO+Z9mUqBU6jPaCLg7Ay5k0IemYJoU6OvtbV/JPL5GbRcsTt6fv4aXz
         Ka/pIEqvw+H8oB4oIdhree9vuXMsfTypYfXdBsugmcj4NXQBC2J/2w3KH/7AcNRbSjoX
         zK+xycCg7ctZLlPSymnbooUkfflPRce7j2iDiemY6pEoedAzpx5EI7F4LszA1oAtUAdx
         1CyBzqmNYL9/HEmmumtzcotll0mhMmtN+rztzdOqwLK35ebdyhnlBJKzKna/b+dJrPSq
         nyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bWJY75AyULAxhQ0F3nLmzgFjwjfgQt1Qe/zoTX8XTmU=;
        b=l/vqNnENc2BpqIdGqseh3O8qyr230P+F8XBckrJbBDCagBYZsiqLqwl6XKZMkZ6bsZ
         0M1NJbAxu4+OpOyR0KudkkBmFovkowGOANnBC5ikA6tPYRnIHIFK4Q0ku5l8sluXyb4X
         Nk11ED0ULJQ84lbZA8kJAFErFvijvhtoWBCU+m8HaF8m4jSYFldmRN///9/9RxuIDU5p
         NHPTdxa1GiRCQFaELlhOGksae+hWBUS/1iAwj7CB8NhzZRifz90QvjoCqWu2OsFa9Wtu
         Ep6+fFJF6WdFFvO2sGaok5dCdx/8vRvy1Mr4qxrHHJ59tLHlaBk0zBFKjpPLhMkP6xpx
         o78Q==
X-Gm-Message-State: AOAM533ozFum8n4TEYIXOKaOq1WE2i3nwPyb/tMYBiYhJqOsYlDY2Ln9
        X+6Al+FZfnDhDcB9iNPrtCvz4A==
X-Google-Smtp-Source: ABdhPJyUpwWpjLuf78P5AvMtzIATLK3+4O53dXN2yVEul/Z4MFq/v2FHZkqRSXRJFfwlh1YFTPeH8g==
X-Received: by 2002:aa7:d6c6:: with SMTP id x6mr14725665edr.338.1600039092717;
        Sun, 13 Sep 2020 16:18:12 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:400:d0::26:8001])
        by smtp.gmail.com with ESMTPSA id g20sm6313489ejx.12.2020.09.13.16.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 16:18:11 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-arm-kernel@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2] pinctrl: single: check pinctrl_spec.args_count > 3
Date:   Mon, 14 Sep 2020 01:15:58 +0200
Message-Id: <20200913231557.2063071-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pinctrl_spec.args_count can either be 2 when #pinctrl-cells = 1 or
3 when #pinctrl-cells = 2.

There is currently only a check to make sure that it is 2 or greater.
This patch adds a check to make sure it is not greater than 3.

Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2 change:
- this is a fix to my prior email where I referred to #pinctrl-cells
  exceeding 3 which is incorrect.  It is pinctrl_spec.args_count which
  must be greater than 2 (when #pinctrl-cells = 1) and less than 3 (when
  #pinctrl-cells = 2)
https://lore.kernel.org/linux-omap/20200913210825.2022552-1-drew@beagleboard.org/


 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index efe41abc5d47..5cbf0e55087c 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1014,7 +1014,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 		if (res)
 			return res;
 
-		if (pinctrl_spec.args_count < 2) {
+		if (pinctrl_spec.args_count < 2 || pinctrl_spec.args_count > 3) {
 			dev_err(pcs->dev, "invalid args_count for spec: %i\n",
 				pinctrl_spec.args_count);
 			break;
-- 
2.25.1

