Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88C085C29
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 09:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731548AbfHHHzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 03:55:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47101 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfHHHzJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 03:55:09 -0400
Received: by mail-pf1-f196.google.com with SMTP id c3so20497491pfa.13
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 00:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AenDtBrpVG4930TDhGN2DV+HTpyLOWcIzVhLu9zuE4w=;
        b=sd8ghvqFngt6Wd7gYlTDBvi+xzGc5m8Gcv+Q1s68B8x6rx+kNgEaCyXniwyuD/BTlD
         464oe3yobiTKksTwqQnuNIMzWq2o8Os1uztTYyMvMBNpthEq1dJznYaU3GNcclhQAonO
         i6z+pA3yMIh9GXZK/W2ubhcTJQtvaCQ7TXhOwwpxixhU0WiXaPRCYQDtptxZ/FTeongT
         bS655Lmu2EroNzrH7I3qQP+pubvA6mxUAixK6f1tmiF6qd+b3RXhlvB5nMNmh0ju9qMS
         kbuYAqUnx851oU4+T0iQcx3uE+tBC0Qy2q0iup9NZuNmJ1xphwZiUxLVPiY4ABvR1Tkp
         YdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AenDtBrpVG4930TDhGN2DV+HTpyLOWcIzVhLu9zuE4w=;
        b=ZYxC7c6T72MboZ7RdqBL2FY5Hj5DhlVfVcDgZQ+dGiC3y2wgXiMsLvO1R86dFOFUkM
         j3E3+vTM0vLkPMhxVV6HQbFKgCC3pw+9ttwHtcYYozuHGE77ytkpl6X8LPpxTJKe6TM3
         +Ew9GATruT9oAewhh4ipJccSj5pwEsW+q/jp+rQ1A5lwCJrksb5O9qBXv5NWoccakVqx
         yRsRptR3il8XZ30W7sL43gBGzUxM0Z38iw7LNVtdoUWmTWlP1yLgOk2UUMWuGJR6NbW0
         32H/pOAFGk8UPpv+rhoAlQYUK0fiICAVFBKazNfSmEbJyvJam95+xIcynZaXg4aXbdTL
         xnxQ==
X-Gm-Message-State: APjAAAW0HqNWK3RcLKhkqwcVcsi2p53D9IKbzaGuqBNQKrNJQAf1Qbwc
        z2UHpxQD/C+XfcqNtdi3jKc=
X-Google-Smtp-Source: APXvYqwwX8sR5i5r5i+v6lD32wo6zEVFVFqLJblNiw7wl0jbxCwGEUiMOVlzTRqeOr0TI/WrD2DBCA==
X-Received: by 2002:a62:e315:: with SMTP id g21mr14409156pfh.225.1565250909269;
        Thu, 08 Aug 2019 00:55:09 -0700 (PDT)
Received: from localhost.localdomain ([122.163.44.6])
        by smtp.gmail.com with ESMTPSA id v14sm9370402pgi.79.2019.08.08.00.55.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 00:55:08 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: stm32: stm32: Add of_node_put() before return
Date:   Thu,  8 Aug 2019 13:24:56 +0530
Message-Id: <20190808075457.16109-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_child_of_node and
for_each_available_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return in
two places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index b453aed1bbeb..2d5e0435af0a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -615,6 +615,7 @@ static int stm32_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				&reserved_maps, num_maps);
 		if (ret < 0) {
 			pinctrl_utils_free_map(pctldev, *map, *num_maps);
+			of_node_put(np);
 			return ret;
 		}
 	}
@@ -1468,8 +1469,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	for_each_available_child_of_node(np, child) {
 		if (of_property_read_bool(child, "gpio-controller")) {
 			ret = stm32_gpiolib_register_bank(pctl, child);
-			if (ret)
+			if (ret) {
+				of_node_put(child);
 				return ret;
+			}
 
 			pctl->nbanks++;
 		}
-- 
2.19.1

