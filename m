Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8AA472600
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Dec 2021 10:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235554AbhLMJsl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 04:48:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235394AbhLMJoo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 04:44:44 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796CAC08EAFF
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 01:40:52 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id p13so14449735pfw.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 01:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uZDeQb0Ps3ShCtM92tys7SAGXkYQwfQLQeqO425ONg4=;
        b=WsDhAlcwPpF6QMfxvJ2P67WsPkBZ2RwqiGsys5KG4ocv1l6Vw+/xOscJIzSU7zt4Uh
         6TSc+/nrXr896LrOqoB9dVKioMfNxqgQOf2Tfn74zA7f6bK3GbW5XDHYsZNSe3YyWXfg
         5HzPAycOG4R/UDENjRSZmYQU/AEROJ7Jd19qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uZDeQb0Ps3ShCtM92tys7SAGXkYQwfQLQeqO425ONg4=;
        b=J+hdmOo/5IU/rdXxd8C7D//ducn2hgDINYV5UAYJiVRtzvctRt/eSv5J+nJWt2Z/O/
         rO2d3EdmMEPSEMKK3nE1v+BeMJV7rup7uhhuQupsbjWyzgaKggwloreOQkdqosG3TH0q
         ux0Kl1AscEdvDX3lgmd4fWxnLzywJoLzDA7ocAkVHT905ykNVXZj5je592jYgQtSxLWU
         cS/SImOu2DHbGyYSe5gEgkPbExTnXhlugyqdV/O9GAfN4+V0SphRnsug02Ihev/JwR7T
         1YLvaMqARyophSgjetkEFARfbTruFVlw25dNjVWUhJRvVvgceNXC0eiCalwsohk99x49
         QHqg==
X-Gm-Message-State: AOAM532P9kD1dXdXp9S9F0yVVDgVsJqmQ80cTH8BD6AZl/uhWL81lknt
        bCCYvDDmUs6oz+GFt6NoQJuEOQ==
X-Google-Smtp-Source: ABdhPJzl9btVCCXeNVhmFmt7knCVA9TwgiOdvW4x8BLB7eiAe9MFR+j20F51njzr0AhPUe8MZDaPqg==
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr51429721pgu.82.1639388452047;
        Mon, 13 Dec 2021 01:40:52 -0800 (PST)
Received: from shiro.work (p864106-ipngn200510sizuokaden.shizuoka.ocn.ne.jp. [180.9.58.106])
        by smtp.googlemail.com with ESMTPSA id d195sm10237609pga.41.2021.12.13.01.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 01:40:51 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: gpio: msc313: Add compatible for ssd20xd
Date:   Mon, 13 Dec 2021 18:40:32 +0900
Message-Id: <20211213094036.1787950-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213094036.1787950-1-daniel@0x0f.com>
References: <20211213094036.1787950-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a compatible string for "ssd20xd" for the SigmaStar SSD201
and SSD202D chips. These chips are the same die with different
memory bonded so they don't need their own strings.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
index fe1e1c63ffe3..18fe90387b87 100644
--- a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
@@ -14,7 +14,9 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    const: mstar,msc313-gpio
+    enum:
+      - mstar,msc313-gpio
+      - sstar,ssd20xd-gpio
 
   reg:
     maxItems: 1
-- 
2.34.1

