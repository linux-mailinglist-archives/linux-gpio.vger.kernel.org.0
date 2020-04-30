Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FAB1C06D9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 21:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgD3TrB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 15:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbgD3Tq3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Apr 2020 15:46:29 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4273C08E859
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2020 12:46:29 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d24so2684049pll.8
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2020 12:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=69Vg9U3gBVUlkizCg48EDMT0ufV71AxAgwY37Mxv9RI=;
        b=Z+bKIp4ValF2xpimna9+2Wvkg/u4DEsTSNrLlwT6aivVRbhKKdgzGabovsdyTlg/69
         NmTZI1zkc/MfM85OdYnHp+oJxY9qD1946qXdgtwPHVuo9zs/v6RSG3B9Lux6QsKAsRh3
         8nQIkhHi7qaoCP6AUaiPJNszq2B3CrY2EfYVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69Vg9U3gBVUlkizCg48EDMT0ufV71AxAgwY37Mxv9RI=;
        b=G0cBChTHevZobvhWZT3mqP6Nfh7FiXasn7BwUVsTGRg8RbwZF/MqLwQKdLKHTvh2l6
         5h4Mk9nVZhph97Zk3cF6nEbTLBYxH4TCn5Kw8PEhZflrpDCqrYqWvfdoNOMTbt5uf0Ym
         dGCXUYdzC1J7BxUJrrAo7ckC2MtuhAGBjK2OVJ1vZ4lXsUsXpdBCcVd4t2Yq0zNOMWHm
         kzCxRh5fzRSNwTu8nzc1/13kQ1JoGTU9kkSMHQ1wbdDr10XFxoRjxzsehwqAD+f0R1ei
         fz4HLY/QtI1iaTsmRniMQiCwtqpiaKdgxUHkatGNEzWDgwO28VUbSzuM7PoS6TFgYci4
         izuQ==
X-Gm-Message-State: AGi0PubFXsyZqfplRV4uxYLkgFAXPDcCtQ9fKjw9mr7Z7/8kdLgFcOnD
        CAzqQ+PaIXIwtIc1cprmtk0ijg==
X-Google-Smtp-Source: APiQypLMm8BMm2i3v9zIi6LLFN1yz2hNg4Ay0PXQeF0bd8feavJN2Yy5iy7PQdAFV+JeZvO0jSoW7g==
X-Received: by 2002:a17:90a:cb0b:: with SMTP id z11mr500642pjt.62.1588275989203;
        Thu, 30 Apr 2020 12:46:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id u3sm495993pfb.105.2020.04.30.12.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:46:28 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     linux-gpio@vger.kernel.org, jonas@kwiboo.se,
        robdclark@chromium.org, bjorn.andersson@linaro.org,
        jeffrey.l.hugo@gmail.com, jernej.skrabec@siol.net,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: display: Add hpd-gpios to panel-common bindings
Date:   Thu, 30 Apr 2020 12:46:13 -0700
Message-Id: <20200430124442.v4.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200430194617.197510-1-dianders@chromium.org>
References: <20200430194617.197510-1-dianders@chromium.org>
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
---

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
2.26.2.526.g744177e7f7-goog

