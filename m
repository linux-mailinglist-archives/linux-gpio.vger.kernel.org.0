Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D961C9D64
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 23:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgEGVfh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 17:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgEGVfh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 17:35:37 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8488C05BD0A
        for <linux-gpio@vger.kernel.org>; Thu,  7 May 2020 14:35:35 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q24so3224053pjd.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2020 14:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4v4vnXxurYJQOROnZvnzfPloWHp2bwE01an31yUPp4o=;
        b=jsEDGiwhIeWeIH5fsxZpLrFy4wAWrwHVPQ0Th5YaMdW+DiPGF2V2BrQMyLzoKF17KF
         qOZcFB9rQwZ1ibCZZ7iw4wbdZFNITQzkcLMUR6z/TFf0zAHfWY2lf/cGJq0O1FOcsMFr
         KWwrbKtdHEusvC97ESZz7VfnP6l0eiZX9wXIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4v4vnXxurYJQOROnZvnzfPloWHp2bwE01an31yUPp4o=;
        b=nRSCZukCqxQHAyjfMsyO1TfRAoXlPgGcc93gVHbpyrhEXWq8mDYQdLlrann1jfI6i5
         pX+UHmGtqeU/ECZ5n8GTTC9bj4G0dpFO47FpARynBESfOkwOQtqmi6psrd+qTMWLoqVB
         +MUYcbLItKZRoGiBhgwlm9jSR8n5xHRlbC3x7xiw6AmIL8C+iCYZhj5gjkwPotMp0bHs
         SasCgy/O1iXiud+7Nlh+1l6ZKu3PJQrmTnun6NvH+90m9s9obtWpe8Btj5Tdm+g6D5zP
         q1U+lJxxFxeB0W7q2AU8nPRqETioLkme9d/J8XCyckBXI7lsmKxWobI5RxsQuKmpRLp4
         n76A==
X-Gm-Message-State: AGi0PuYqwKMtyZd+nR2+tImpNPIP2MBrJBalriQVR4sHimJstqPg6bJi
        46M6CMy3JAexLE0q9KDbCZN0xg==
X-Google-Smtp-Source: APiQypJrX9Sds2V0tZ/XbcQs1N2tNz4bQqjgUQgoczdv15D6aqrUlNeX63mmz/+P2v3/w/VqhJ8N3w==
X-Received: by 2002:a17:902:9f90:: with SMTP id g16mr15528385plq.215.1588887335252;
        Thu, 07 May 2020 14:35:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i10sm5884860pfa.166.2020.05.07.14.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 14:35:34 -0700 (PDT)
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
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
Date:   Thu,  7 May 2020 14:35:00 -0700
Message-Id: <20200507143354.v5.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507213500.241695-1-dianders@chromium.org>
References: <20200507213500.241695-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We don't have the HPD line hooked up to the bridge chip.  Add it as
suggested in the patch ("dt-bindings: drm/bridge: ti-sn65dsi86:
Document no-hpd").

NOTE: this patch isn't expected to have any effect but just keeps us
cleaner for the future.  Currently the driver in Linux just assumes
that nobody has HPD hooked up.  This change allows us to later
implement HPD support in the driver without messing up sdm845-cheza.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 9070be43a309..5938f8b2aa2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -548,6 +548,8 @@ sn65dsi86_bridge: bridge@2d {
 		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 		clock-names = "refclk";
 
+		no-hpd;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.26.2.645.ge9eca65c58-goog

