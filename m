Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1C91B1DF6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 07:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgDUFHQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 01:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726547AbgDUFGx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 01:06:53 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B9E1C0610D5
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2020 22:06:52 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id y6so376422pjc.4
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2020 22:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eGfBKJpSi90UFqlpYNStz7DM33anWi17Ai2zGXaXMWc=;
        b=mdzRnubwKP7krAS40Ea2KN23CScPHBKO1SR+AS0E+/6i+r66UtFj7LxigBVGbaH03H
         6mOa4r/1UEkt+v0t8swjMLve4coTvqfK3oY1x5oYuCKpxeBZjJ45n/4QyONrWNhCCJr7
         mxx+wneohm5w3rXhblsvBowD0WFWXphhzMzEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eGfBKJpSi90UFqlpYNStz7DM33anWi17Ai2zGXaXMWc=;
        b=q9Se+hfCi4TlM5i3VHlJeDWKTeU7NNb4Ctn1tFuKSqodIofa/0qrCiE7s6xZbwZ6nT
         9ksM9BybZT4BhvWBSP9/X06aNTeuxH+2lHKPvTZibqQJ+I46x81w4W95hawAOXZdDR0T
         DSMiGReP9Gw4km8Qi4L/CgVCg1nGa3eut25A9Xm79lZx/On+9NoE06yUW87YNcULkSt1
         cT0ruFoXzHMfQRCHxliSavLWzTu2n8M8gyyPIilZF6e60htcYetCfV6ZxO93GdTOCw5C
         xw832jcshi6VPlGy01RXHz1YtQK/KPSRLjlaxyMELOVgRF4A4GhW+XuralaIOHPsmAFq
         xufg==
X-Gm-Message-State: AGi0PubMDq8x6aLU3l8ujVqhLY0QwvscrLq3wy7B6ym/AkgOuMRRJliE
        TTrabWqM3iwJiStRPP6jjaJijA==
X-Google-Smtp-Source: APiQypJQNPdkuPcpRjjTTAYI/poAyKTtArgQxmjjnmtRkUI/zZQTGT50tl4mj8Sv4sxDO7Poue+Axw==
X-Received: by 2002:a17:90a:dc01:: with SMTP id i1mr3278786pjv.94.1587445611989;
        Mon, 20 Apr 2020 22:06:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p68sm1184780pfb.89.2020.04.20.22.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 22:06:51 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        jernej.skrabec@siol.net, swboyd@chromium.org,
        bjorn.andersson@linaro.org, robdclark@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: display: Add hpd-gpios to panel-common bindings
Date:   Mon, 20 Apr 2020 22:06:18 -0700
Message-Id: <20200420220458.v2.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421050622.8113-1-dianders@chromium.org>
References: <20200421050622.8113-1-dianders@chromium.org>
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
---

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
2.26.1.301.g55bc3eb7cb9-goog

