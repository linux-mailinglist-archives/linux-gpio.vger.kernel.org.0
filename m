Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431DA1B1DEF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 07:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgDUFHK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 01:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726754AbgDUFG6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 01:06:58 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92E2C061A10
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2020 22:06:57 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t4so4814607plq.12
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2020 22:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rJIEGMmKnB4qmjlxDkpNPpHgpkyR3Ib17vqADIfUNyc=;
        b=Nx0GHkdSSFwVcO0ZVTfVA67xDmtQrQR3ISUEjsXAFi7kPplFJ7bvMwndVFZQ2mQPIQ
         5+urO/oDX+ecQ6n4smIfS7jlrfGbpEwpLhyRBFjzIkKTBYlllsjxpA0YXGCzOkRFMRXM
         Ww1rLNK+kSpXpB9s6eMAHfyINCyzCA9O5lyOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rJIEGMmKnB4qmjlxDkpNPpHgpkyR3Ib17vqADIfUNyc=;
        b=lX/otDCC3UGj8QqGAMOzrwtcSEXmjdATPOioccJ/mWY7Nz6vNsWW/g9aak7w4ZLIpY
         c5ZLel9Ax2UCcQTLoUkM5OcS3MafVgB8c28CRgaOwQxJqBAU5xbzTMRUy7nneOx44FFi
         QDNmIdqMkzBurEV7VrmyXCufSe3x8HBo3hmgu2sUH4IZlXLIMPJX8RCpb8R+4dTsHM4W
         Vp+ZGMuWy4zuN+sNB8OPb+SxpMR0rGsHBOSB588/OcbxEEKDmyr8bTzeWkvuXubPwP5U
         6WjRoxcJ6nwSDHSVo9C9v7vSlhIjehZGMXCRbQmn0IBaSZjJUo0SEHl9HEqFpy/I0lRy
         CC/g==
X-Gm-Message-State: AGi0PuYpZ4mwPBf5VaBH9ajQE+o5RS9tuLThv2WnNQklp6BGTFAVn2yH
        JT56vCJqaeLW0eBf1fJvr6fcaQ==
X-Google-Smtp-Source: APiQypKf0qEtSgZ39UNfmQ6jEkTlqoHM3jrGCnKu6FbrTIcq/skJ+XDrheHaZdoGSLiH2iIfGj1naw==
X-Received: by 2002:a17:902:8a91:: with SMTP id p17mr20067418plo.248.1587445617462;
        Mon, 20 Apr 2020 22:06:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p68sm1184780pfb.89.2020.04.20.22.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 22:06:56 -0700 (PDT)
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
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
Date:   Mon, 20 Apr 2020 22:06:22 -0700
Message-Id: <20200420220458.v2.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421050622.8113-1-dianders@chromium.org>
References: <20200421050622.8113-1-dianders@chromium.org>
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
---

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

