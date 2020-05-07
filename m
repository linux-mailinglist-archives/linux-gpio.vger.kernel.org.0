Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B565B1C9D67
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 23:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbgEGVfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 17:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbgEGVfg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 17:35:36 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557C2C05BD12
        for <linux-gpio@vger.kernel.org>; Thu,  7 May 2020 14:35:34 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id h12so4289687pjz.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2020 14:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fbjU22n436fNS4tm9Z/DQEhrNON6zU3/PI+8bjMf9/o=;
        b=ENdo3wyFIDnDOOps1rk+zv5ProXXQ+9MQz5G/1HA4jSM5UDNXkl9+hmeBnvG9M3leO
         NSh4AFWRaMg3Lf/9zJc93B0KoxcSPKM5Ml1/hYEPKQFxomyzrN2OmnKaWC1HQe39/uQm
         EOhKMqjbzPhv07nF6b2So6ZrxNKoRCqeCCMpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fbjU22n436fNS4tm9Z/DQEhrNON6zU3/PI+8bjMf9/o=;
        b=cHjSH2gvllazHAms0alvyjgqUg2aCBsySADoXYe/2nHLWePRJpg4pew0ivEEDlTXJg
         T5OCZKt2tVKu36SdZdwysYbC+VGzyUBPMp0cphkPkGkGjqNdPArkBmwrPYk+b1jMaHmf
         Xs3cLfKA7aIq/Lkn6aG1VG848ee6YgSGkfTn/Civnnqcq0Sz14xvpSCMuTOogS6MTFCq
         w3/CYuI/T4eMeK4RhQUzsWLsz+HadA6Mf8OSLtY8HeifFJ9W80jzTMuXTv0D22JEmgGs
         hxcZ25yWLOirYUJHln7UtfSGrYNE5LsvBQWsNHFDWruPCkPPf6etao23oeiNcjueJxSs
         TkNQ==
X-Gm-Message-State: AGi0PuYZrGs+xsTitm5N1ImxjDgj8rHIy7vjxnSHpxV5cOhVfh5N30eR
        abrgBXB4IpRvUp90itOHTfqDTg==
X-Google-Smtp-Source: APiQypJBBpiB37bVUcSXNEkVSPOGBlPdXdGwMwr4Q977C7AhF9IZS/u97Q/SlXzZLRIaBaM4TgLqgA==
X-Received: by 2002:a17:90a:2ac2:: with SMTP id i2mr2277713pjg.91.1588887333807;
        Thu, 07 May 2020 14:35:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i10sm5884860pfa.166.2020.05.07.14.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 14:35:33 -0700 (PDT)
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
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
Date:   Thu,  7 May 2020 14:34:59 -0700
Message-Id: <20200507143354.v5.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507213500.241695-1-dianders@chromium.org>
References: <20200507213500.241695-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ti-sn65dsi86 MIPI DSI to eDP bridge chip has a dedicated hardware
HPD (Hot Plug Detect) pin on it, but it's mostly useless for eDP
because of excessive debouncing in hardware.  Specifically there is no
way to disable the debouncing and for eDP debouncing hurts you because
HPD is just used for knowing when the panel is ready, not for
detecting physical plug events.

Currently the driver in Linux just assumes that nobody has HPD hooked
up.  It relies on folks setting the "no-hpd" property in the panel
node to specify that HPD isn't hooked up and then the panel driver
using this to add some worst case delays when turning on the panel.

Apparently it's also useful to specify "no-hpd" in the bridge node so
that the bridge driver can make sure it's doing the right thing
without peeking into the panel [1].  This would be used if anyone ever
found it useful to implement support for the HW HPD pin on the bridge.
Let's add this property to the bindings.

NOTES:
- This is somewhat of a backward-incompatible change.  All current
  known users of ti-sn65dsi86 didn't have "no-hpd" specified in the
  bridge node yet none of them had HPD hooked up.  This worked because
  the current Linux driver just assumed that HPD was never hooked up.
  We could make it less incompatible by saying that for this bridge
  it's assumed HPD isn't hooked up _unless_ a property is defined, but
  "no-hpd" is much more standard and it's unlikely to matter unless
  someone quickly goes and implements HPD in the driver.
- It is sensible to specify "no-hpd" at the bridge chip level and
  specify "hpd-gpios" at the panel level.  That would mean HPD is
  hooked up to some other GPIO in the system, just not the hardware
  HPD pin on the bridge chip.

[1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v5: None
Changes in v4:
- Tacked on "or is otherwise unusable." to description.

Changes in v3:
- useful implement => useful to implement

Changes in v2:
- ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd") new for v2.

 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 07d26121afca..be10e8cf31e1 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -28,6 +28,12 @@ properties:
     maxItems: 1
     description: GPIO specifier for GPIO1 pin on bridge (active low).
 
+  no-hpd:
+    type: boolean
+    description:
+      Set if the HPD line on the bridge isn't hooked up to anything or is
+      otherwise unusable.
+
   vccio-supply:
     description: A 1.8V supply that powers the digital IOs.
 
@@ -213,6 +219,8 @@ examples:
         clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
         clock-names = "refclk";
 
+        no-hpd;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.26.2.645.ge9eca65c58-goog

