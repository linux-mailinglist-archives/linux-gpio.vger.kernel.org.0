Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41EDB8C25B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 22:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfHMUzb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 16:55:31 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46942 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbfHMUzb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Aug 2019 16:55:31 -0400
Received: by mail-oi1-f194.google.com with SMTP id t24so654240oij.13;
        Tue, 13 Aug 2019 13:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vRcjRzXsLYZcKkMeLECf7vG301P7B0XZvNn+RUsuARg=;
        b=jbslUDlcqZaPMbf8V3k6oJIBCiDezD1vvng9FHtTyLQ10mJlOgqTIj3K+okxas0hsG
         XLV2NgqbMREtHwh+cq3F5wmFyQ0iKUA7iUbWeXz6WBgIZ3PmCUmaUPylR6vQ64zop59c
         nVT3XpvlEsNLN0umtREfrP55c3797Dbhby+u9d7D1RM3DDOh72Z72uGm+P8cfMvt+Grg
         ZauJHSNZGJDvxCN/+5T1MWqmwW9w+T6UxduW4GzGRK4lKObuUA2UDCYjyAtawDYLNTPA
         K7lrqU60OhpAkTkCPtuELIbGfY+H5mOZYHrVC2hJxADIlSCEcP0iaL1GQBVmsQpu2usT
         indQ==
X-Gm-Message-State: APjAAAWwTJw9k3gBJAVDsccvBJYnKVEU3/0VVtEq8qjyShK5+qXO1jKa
        vQNLBB3qIxofvRWwnyH7JczqDZo=
X-Google-Smtp-Source: APXvYqxjYk48K/xApN8bRzF+K+cyfVT+7GZOGNiswrJt4E2UxIRabfgvTQ/6FwmQTxYes48I9p8I+g==
X-Received: by 2002:a02:7121:: with SMTP id n33mr45263919jac.19.1565729730148;
        Tue, 13 Aug 2019 13:55:30 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
        by smtp.googlemail.com with ESMTPSA id m10sm204917375ioj.75.2019.08.13.13.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2019 13:55:29 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: stm32: Fix 'st,syscfg' schema
Date:   Tue, 13 Aug 2019 14:55:28 -0600
Message-Id: <20190813205528.16651-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The proper way to add additional contraints to an existing json-schema
is using 'allOf' to reference the base schema. Using just '$ref' doesn't
work. Fix this for the 'st,syscfg' property.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I've got some other fixes queued up and can take this via the DT tree.

Rob

 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 91d3e78b3395..400df2da018a 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -37,7 +37,8 @@ properties:
   hwlocks: true
 
   st,syscfg:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
     description: Should be phandle/offset/mask
     items:
       - description: Phandle to the syscon node which includes IRQ mux selection.
-- 
2.20.1

