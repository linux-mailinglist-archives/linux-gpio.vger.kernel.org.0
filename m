Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE7822EDB
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 10:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731149AbfETIbW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 04:31:22 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44115 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729675AbfETIbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 04:31:22 -0400
Received: by mail-pg1-f195.google.com with SMTP id z16so6424997pgv.11
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YDxVfW0Drk7B/WkdvCIQOYRuq9nRhmzNbEq0alSDlGc=;
        b=eh592mysWWaYmUlTdrJu5JmfPhAPRF044bjHqVn0RRF+Cc2Qvpf8BdsBT/qFoMgXr2
         5WYW6pVaaaLsonApbGcCNPZ64vDP375PnN9spMsi/O/4+77Pa5K5j+U0G1JW8Hdlyk26
         ZaQGBEK8AmtDo3XTJyJ/tr1m7f1jRs8XBBzfie8q34ToPxL2G5ZgqZta6ZbrlNa0QKBP
         9+5BtOhM+2XG1ULJyQ48cve2UX73EL2Pf0oCJiVjDqWl2NMnFFNFgylX31O0ATpjy7It
         F0a3ZSGbmOfL7Ps8dHG3idQuEu8vAl7OWF/agtQUTaHdNgLG8oZuNVZB47QJDzevNA+4
         Zztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YDxVfW0Drk7B/WkdvCIQOYRuq9nRhmzNbEq0alSDlGc=;
        b=SYwiYVS1GWB/rnWBIxoOs7VJSlAT4hqJqG9eGikZzI/S5qOn1a15Tnlee+20BqZDN9
         QfMdKzYY6zlxbjdBIa0JlyGtk6jr0GL+WzuJJ4zVLoO7KQ+mh8fK0kfHv/RzAnFMywJZ
         ZzY9Ttk20oDFL9DUizSO5rtdIijWK8Gq0IKmIpOaS/aWnsCWXDdzKFSMxM34w74IyL45
         szSAc/ISbuQiG0hWYcYWgaFh+xI4cpRRT5vaQ8PXVuaqarVE0WDNUjgnBFj3YOHb3Hx0
         aYAcSqkbg4ge4LUWdP4oZ+sl8bs5T0RgHn2cTmz9SsWRkg1/IEUTWjn2pXj7/j4cMefM
         NNzg==
X-Gm-Message-State: APjAAAVC+FcmwVnQYe/lO6A7S72SThsrjgzmDmcUJK80n8P8oaVtWK2a
        AOjzXMK6WSj87mHFjxjJbm4v
X-Google-Smtp-Source: APXvYqwIB4PznKqCQ1cB5xDX9ohSxJ3Q8ajVmP/fHvwxtLD7sXxbiRog+BtNITGhoESjpgVTOlJXAA==
X-Received: by 2002:a63:7909:: with SMTP id u9mr67807558pgc.223.1558341081560;
        Mon, 20 May 2019 01:31:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7203:2717:7d22:7fdb:b76e:242c])
        by smtp.gmail.com with ESMTPSA id s72sm24068220pgc.65.2019.05.20.01.31.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 01:31:21 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        linux-gpio@vger.kernel.org, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/5] dt-bindings: pinctrl: Modify pinctrl memory map
Date:   Mon, 20 May 2019 14:00:57 +0530
Message-Id: <20190520083101.10229-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Earlier, the PWM registers were included as part of the pinctrl memory
map, but this turned to be useless as the muxing is being handled by the
SoC pin controller itself. So, lets modify the pinctrl memory map to
reflect the same.

Fixes: 07b734fbdea2 ("dt-bindings: pinctrl: Add BM1880 pinctrl binding")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
index ed34bb1ee81c..cc9a89aa4170 100644
--- a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
@@ -85,9 +85,9 @@ Required Properties:
                   spi0
 
 Example:
-        pinctrl: pinctrl@50 {
+        pinctrl: pinctrl@400 {
                 compatible = "bitmain,bm1880-pinctrl";
-                reg = <0x50 0x4B0>;
+                reg = <0x400 0x120>;
 
                 pinctrl_uart0_default: uart0-default {
                         pinmux {
-- 
2.17.1

