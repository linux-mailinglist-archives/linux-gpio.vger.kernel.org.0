Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5089C1C9D59
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 23:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgEGVfc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 17:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgEGVfb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 17:35:31 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0858C05BD0D
        for <linux-gpio@vger.kernel.org>; Thu,  7 May 2020 14:35:29 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s18so3066690pgl.12
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2020 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XfNEDCRiXjCC8oOylpb9JNhfA9+c9hrQufk7O01EutI=;
        b=JEPOGcmwFBfW5QCKms1+maouE+hSH796fyxNeSs6NafNDFXUhutuNYMqtyu+Cz4ftE
         smDDleCiYarIBTBNcvs9qhyaX4KxL7re6xdgs706c6CBvnOPokM8Q5Hjxqfd+u70iMzN
         L4Nfj73BfoYxzl3kVdWZnth1x62n3HdcVf5uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XfNEDCRiXjCC8oOylpb9JNhfA9+c9hrQufk7O01EutI=;
        b=peuOLNY9nlr6q/y94Ct7kA1/6JOMORg2JUipEabNNF0h5rnUiJb/V5ohL1ZprKjgJo
         lt1m9mnALxPugH8/C+9vQTJv1x85oYrve46zdoy2fbj77EnxUXdxtV9Wb839QUXu/IjN
         GZK9zZNTWTpNEP+yY+5bRNJNQrYpRJ/LSe0jx83TQL6LdjDNp7h+oAAVI7ZcuYik3Sdh
         38vql2ba+38N88l6h5j+Zsq2OdKxt4/NLU0sag1IXzER4hU3N9NXx9kZLVHZqEWuFsqV
         d1v2/NSsug8R89He/tQMdIVmM/8sMCu1Bo9yndYkcS3P48xs2QfwRsL1kazOG/kAkrOm
         VoUw==
X-Gm-Message-State: AGi0PuZu1dJ+bMV7FyLEUi+WC56WvQmK9aCNmWaTg5bCiaQdm9FmOZfd
        3viZd0WFTV3izoC3J8678Zgs6A==
X-Google-Smtp-Source: APiQypIN4LGb4WwjVAsqDkdk6/Lm8XZyQnvUfoNsrt2XHG4HD0F4xJ4m0Ae8nle3ctmT2+GxbHwNUA==
X-Received: by 2002:a63:741e:: with SMTP id p30mr13075429pgc.433.1588887329409;
        Thu, 07 May 2020 14:35:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i10sm5884860pfa.166.2020.05.07.14.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 14:35:28 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, jernej.skrabec@siol.net,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] dt-bindings: display: Add hpd-gpios to panel-common bindings
Date:   Thu,  7 May 2020 14:34:56 -0700
Message-Id: <20200507143354.v5.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507213500.241695-1-dianders@chromium.org>
References: <20200507213500.241695-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the cases where there is no connector in a system there's no great
place to put "hpd-gpios".  As per discussion [1] the best place to put
it is in the panel.  Add this to the device tree bindings.

[1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2

 .../devicetree/bindings/display/panel/panel-common.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ed051ba12084..e9a04a3a4f5f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -96,6 +96,12 @@ properties:
       (hot plug detect) signal, but the signal isn't hooked up so we should
       hardcode the max delay from the panel spec when powering up the panel.
 
+  hpd-gpios:
+    maxItems: 1
+    description:
+      If Hot Plug Detect (HPD) is connected to a GPIO in the system rather
+      than a dedicated HPD pin the pin can be specified here.
+
   # Control I/Os
 
   # Many display panels can be controlled through pins driven by GPIOs. The nature
-- 
2.26.2.645.ge9eca65c58-goog

