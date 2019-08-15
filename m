Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 286D38E4B9
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 08:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfHOGFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 02:05:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46266 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfHOGFR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 02:05:17 -0400
Received: by mail-pg1-f194.google.com with SMTP id m3so268324pgv.13;
        Wed, 14 Aug 2019 23:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QR+1SuJZ5tZbGg7qkLCJVmhmhdJKRiKQpawR4Js8Xuk=;
        b=J40S5LgVIFbpKF4VcPkepw8kzEiHWTibNmix/H9iDdsHe3GMUIUit3NqDx7wuVJiyt
         G+Fk1scK5zD3KNi7jRf70kvb0zWiL1uCzhfbVoZtm93VwnediryTfIWwBvTXQgHr+/5K
         QY11ruKyR6sVQJlZs0iQl+xzDM7vmQ3r06HWrJg0SPT00wfF4HBq1DKKgxMV5VkCB526
         WV/BSIGogVvcg3tOmnVQE4vc0M2uxG5qHRMhuLBb+lhsDYTzrmb1wITXCC2CFe5lMpJu
         SNwct2lCmtQH3i7kJ3BpdWXA/BPLz9UEClEv/FrfWKsk8Ab9GEyUWLSPZTVUpjzzL5oW
         uWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QR+1SuJZ5tZbGg7qkLCJVmhmhdJKRiKQpawR4Js8Xuk=;
        b=RlWgDM03w0g5LeGwKbBvhGF4UdkDdUT8kQL35fUmohMLMV6SrMF15UfukBEtQdp+D9
         jsc53Zt4sMLKiGhibaMlwro/SdAAEuxUJ6rMOCgKtkmzhQITdNCLay5jTq1rjQrSkNln
         fSRpF8xOG5IQJsKtdYzRmfdiKgPc1kQTxJ+fjZpp3s+R00yIYuF1SioHxRupA3E0DvVw
         JAXU4GmwSfoPZRqVnSNVfHrG8CbQMRPgR7uOcygj9Whj99SQEw/QvQDEPe5XZJTw+PGV
         1uV7smMlOb8o08NnjmA0Q+fm/EO8tRbb+L9KQGGuTpiEOEbDaemrGmuwsa5eLOF3l+A5
         /IKA==
X-Gm-Message-State: APjAAAWCl+Z/+l2a4UOzF2mU0hPIY1MHN9oVYzAGa02XaIXegbj2tGyv
        2CFoflMpzVQcEgPXVHgrOCBxlzI7
X-Google-Smtp-Source: APXvYqwlHIKuxDnvidJF57JWbVKhk+wa/hb/uzQXQgc5YbmR5QYd0mamBhaxNsx5WykXdcAyh54Z8A==
X-Received: by 2002:a17:90a:ec12:: with SMTP id l18mr812807pjy.6.1565849117142;
        Wed, 14 Aug 2019 23:05:17 -0700 (PDT)
Received: from localhost.localdomain ([110.225.3.176])
        by smtp.gmail.com with ESMTPSA id l31sm1492817pgm.63.2019.08.14.23.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 23:05:16 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: rza1: Add of_node_put() before return
Date:   Thu, 15 Aug 2019 11:35:03 +0530
Message-Id: <20190815060503.2853-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return in
three places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 021e37b7689e..8eeb9545137b 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -866,8 +866,10 @@ static int rza1_dt_node_pin_count(struct device_node *np)
 	npins = 0;
 	for_each_child_of_node(np, child) {
 		of_pins = of_find_property(child, "pinmux", NULL);
-		if (!of_pins)
+		if (!of_pins) {
+			of_node_put(child);
 			return -EINVAL;
+		}
 
 		npins += of_pins->length / sizeof(u32);
 	}
@@ -1025,8 +1027,10 @@ static int rza1_dt_node_to_map(struct pinctrl_dev *pctldev,
 		for_each_child_of_node(np, child) {
 			ret = rza1_parse_pinmux_node(rza1_pctl, child, mux_conf,
 						     grpin);
-			if (ret < 0)
+			if (ret < 0) {
+				of_node_put(child);
 				return ret;
+			}
 
 			grpin += ret;
 			mux_conf += ret;
@@ -1272,8 +1276,10 @@ static int rza1_gpio_register(struct rza1_pinctrl *rza1_pctl)
 
 		ret = rza1_parse_gpiochip(rza1_pctl, child, &gpio_chips[i],
 					  &gpio_ranges[i]);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 
 		++i;
 	}
-- 
2.19.1

