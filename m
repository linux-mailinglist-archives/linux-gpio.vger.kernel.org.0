Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A18122EE5
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 10:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730315AbfETIbj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 04:31:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35809 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728619AbfETIbj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 04:31:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id t1so5022575pgc.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OrAQvth9DS0BbK/1+rVAaMvZOv12ORH6Kc00AQPR8j8=;
        b=dm6WPKZxmB25DrwGg++fHJm7U4ZvExHZBZbglSw4gklBHn7XmbHZWA7UhRO/EXoyj+
         yVYK0JxaNy//NoByPOPnQfEzIYErYUuyDkY6JMY2G/QSE4zTSu10r0DDGslwPlyj/WbN
         0jq8VTC+UPGw5vAKD//RW6rMlEBZsK0/215Ds7ewPT/vCTfNV4K3qt6zl7Ft/IKXVyfQ
         bMotSTi4Kb0snz8HhVPyWs/7WmOVyzZskCG/iehWSgBdHYoAaZIeS9dfGD51TZEV9KFt
         Kc6RsMQoTX2XSJC4zPr9f5VnZosnYQF+nUQ5NmnBTfUmMd/GZ1cB62pJaMX67wocQsu9
         mNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OrAQvth9DS0BbK/1+rVAaMvZOv12ORH6Kc00AQPR8j8=;
        b=L/p+IL4Om5YMb1+d05IgmKxx/RRLE6M8Wu7VR2di6cd7o6gbjfiEi1CK2HeRshftfU
         KTg8/sBVZaTlLMab5aOXJVLL+ySOxiDrv2plcFlvm0PgmA2Tyje0VYQTAlJupZjkZPNK
         LsTg3TEMuR8qUf4JFh0/32h86SZEZSG8PKTGnLgNN1+GCVtE0ix1U7x38MKa7GlAeRVx
         fqBdC8kZr9BuuQ4eNjpuj6MFejGPZDIaRgbH3tfuS3n0R4cMRXS6MKm096XGicY+ceZz
         i260Uswn2Y25I0jZN9g4el4ckG3hNX5TTTfQg7zF5PJmX+TN2WrC5kz2iZ4Sw8bFkSnb
         tgUQ==
X-Gm-Message-State: APjAAAXxYFrjGrTjVS4Jd39M4AmYL7NSR3Ya17u0Q+wFXdvSYo0pbrVJ
        bu8bxlduNSbRFGcCzbYWr72k
X-Google-Smtp-Source: APXvYqxlNxMxliZvGQnWI7hiYwknDuVpqWTz56n4dwrL+kw4jWmgFG2uUze8ln+HnIIVYkjxXZEk4A==
X-Received: by 2002:a65:64da:: with SMTP id t26mr74512781pgv.322.1558341098785;
        Mon, 20 May 2019 01:31:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7203:2717:7d22:7fdb:b76e:242c])
        by smtp.gmail.com with ESMTPSA id s72sm24068220pgc.65.2019.05.20.01.31.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 01:31:38 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        linux-gpio@vger.kernel.org, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/5] dt-bindings: pinctrl: Document pinconf bindings for BM1880 SoC
Date:   Mon, 20 May 2019 14:01:00 +0530
Message-Id: <20190520083101.10229-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document pinconf bindings for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../pinctrl/bitmain,bm1880-pinctrl.txt        | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
index cc9a89aa4170..4eb089bcb5f3 100644
--- a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
@@ -14,7 +14,8 @@ phrase "pin configuration node".
 The pin configuration nodes act as a container for an arbitrary number of
 subnodes. Each of these subnodes represents some desired configuration for a
 pin, a group, or a list of pins or groups. This configuration for BM1880 SoC
-includes only pinmux as there is no pinconf support available in SoC.
+includes pinmux and various pin configuration parameters, such as pull-up,
+slew rate etc...
 
 Each configuration node can consist of multiple nodes describing the pinmux
 options. The name of each subnode is not important; all subnodes should be
@@ -84,6 +85,22 @@ Required Properties:
                   gpio66, gpio67, eth1, i2s0, i2s0_mclkin, i2s1, i2s1_mclkin,
                   spi0
 
+Optional Properties:
+
+- bias-disable:  No arguments. Disable pin bias.
+- bias-pull-down: No arguments. The specified pins should be configured as
+                  pull down.
+- bias-pull-up:   No arguments. The specified pins should be configured as
+                  pull up.
+- input-schmitt-enable: No arguments: Enable schmitt trigger for the specified
+                  pins
+- input-schmitt-disable: No arguments: Disable schmitt trigger for the specified
+                  pins
+- slew-rate:      Integer. Sets slew rate for the specified pins.
+                  Valid values are:
+                  <0>  - Slow
+                  <1>  - Fast
+
 Example:
         pinctrl: pinctrl@400 {
                 compatible = "bitmain,bm1880-pinctrl";
-- 
2.17.1

