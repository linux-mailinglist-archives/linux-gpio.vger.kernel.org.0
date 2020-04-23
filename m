Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B633E1B60CE
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 18:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbgDWQ0Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 12:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729704AbgDWQ0V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Apr 2020 12:26:21 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C90C09B041
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 09:26:20 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a31so836315pje.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2020 09:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fs+VyUYiQhHLqjr9qU6M46uht+we4DMR37Sq8mHOUJg=;
        b=DpLPKwlMZsLZnxIioolM8ptTrEbItSx7IHdh1uPs+5fsxWGMGiV+5LduIaSEo0UdUH
         lfewHcUPuCS2CaHrmBVsSnkGCWg/Y04/Hd85eHRDtEqVH1g+b5xaPV0zWfvc0d0aJOmW
         t+u2CkySUhgOQJfywp7JUZRfHAv1W7wSiwO2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fs+VyUYiQhHLqjr9qU6M46uht+we4DMR37Sq8mHOUJg=;
        b=ZGpuqX5gRgNeFVC/ZpRftR1MzQ/r68smMsOz3AxqWntNMi3hO4LYBQ49h4w4/9LGa+
         zeP9HeJQt4bRD4tEdG1mbdmoAU0YXJvaVKVmxXGXt5h9NeOKUBwz64EgN4Me6Uuva15T
         VMo9ZH/FVKjd7/LpYRsVzvjd0RIoC9h2TD+k3mmGaTSniniT1ll8tP36z3ucFKwOlgq8
         +yq67izsf8S68lZwQbBjCayxAxjkTTq0y/hbjr98qmKM0syt+wreMFbO4kuvCuGNdbDN
         WDb8WmBPNDSqexxgA7ulxP689R+dfhwzoXICySdJWiBiuCqHEODE4HkQvI9fviCZFsq3
         n1jA==
X-Gm-Message-State: AGi0PuZDy68hhiFf3FwKX4gkMBNeW7Avu8a+B6zRmNynkr9NAGCkAL1X
        e7YPPY6CTzy9BOyQ3BEZx8WoQg==
X-Google-Smtp-Source: APiQypKJjjilIFJnRl4OpyzS4YRq70Qi1utK3lHOL5ENRwaojLCeKCJCNTxUDY7zc6N7YPo9khOOyw==
X-Received: by 2002:a17:90a:f68d:: with SMTP id cl13mr1559548pjb.107.1587659179681;
        Thu, 23 Apr 2020 09:26:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id d12sm2841927pfq.36.2020.04.23.09.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 09:26:18 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     swboyd@chromium.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@chromium.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
        bjorn.andersson@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
Date:   Thu, 23 Apr 2020 09:25:48 -0700
Message-Id: <20200423092431.v3.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200423162548.129661-1-dianders@chromium.org>
References: <20200423162548.129661-1-dianders@chromium.org>
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
2.26.1.301.g55bc3eb7cb9-goog

