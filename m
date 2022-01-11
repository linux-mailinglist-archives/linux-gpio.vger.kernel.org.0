Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B652748BA77
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 23:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345704AbiAKWFp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 17:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345732AbiAKWFo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 17:05:44 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC7CC06173F
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 14:05:43 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id x15so982697plg.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 14:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2pZg0j1z31z4dOAHR0v7nBDp7zlxEyAkVFUFENElCB8=;
        b=Q3Q9cgZpVUzHIhd8PSRDyNaoFL8ZmwZHfUxTsrOb9uxSVnZI5UKeJR/MwT9108Sh5+
         4npaWvqPeHxFmu3SHD4Ik/RxhBstWlDlvUvR1owC+KAxT2MDhAxvPudsVb7FqI7CqCKL
         geizo3KsG55e5q3+XbRecjvUKtorpRtOxYaTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2pZg0j1z31z4dOAHR0v7nBDp7zlxEyAkVFUFENElCB8=;
        b=Hthk+OF7ymxf65pZVhiYD3T8XId4Yl2RadfRlA6IYGgSus1mfSXV2H9xf2om1ptkVw
         P9vpcDgVLc5y5pd9xPVzjTLnr0S3UpTqKRMBH+HIcJysGJ6UuyB5PsG+lv7ltnJzRxYB
         mjFMfXil/JvLsEhKQ80FLRGPI3tOAShrZh1p4/eUHBNiQY+FKEFchxy0sdscUxIFN04M
         7iLhM7b8cFc3l7o4HP/pRoSl8GAGHMfQLOiwnYrqFEcSqXgjnfOl6yq3qpN/4OAklxtZ
         WubAFD5Q5IL0QgyrqTPML50VDJQBjiDqYVRNc07xXmgBQ9g54bu+agn3xOG6hj2Yxb8d
         dvgA==
X-Gm-Message-State: AOAM5323NZjbxR6TRpeh4NZvOxx/mhmHZwDP9iKA9sHzTmPTJGQsMMPS
        nCbbwM9LPokh6xR3Mdjmn9ZhjQ==
X-Google-Smtp-Source: ABdhPJxyOF4Tw0NiPrnu7TMfn/9n7P7Kn8lS425Di9hUjXcgZkzQf3zhSVj1wX3Rnpks5wsTSJq/Fg==
X-Received: by 2002:a05:6a00:2442:b0:4bc:e7ac:b5aa with SMTP id d2-20020a056a00244200b004bce7acb5aamr6529915pfj.56.1641938743547;
        Tue, 11 Jan 2022 14:05:43 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:ce5:9cab:3523:b066])
        by smtp.gmail.com with ESMTPSA id t207sm10700413pfc.205.2022.01.11.14.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 14:05:43 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: drive-strength doesn't default to 2 if unspecified
Date:   Tue, 11 Jan 2022 14:05:21 -0800
Message-Id: <20220111140519.1.Ie2662d6289af1e9758b14b37149703c846d5f509@changeid>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If the drive-strength isn't specified in the device tree then it
doesn't actually default to 2. Instead, it defaults to whatever the
heck the BIOS left it at. If the BIOS doesn't touch it then that means
it's whatever the heck the initial state of the pin was when the SoC
booted.

Reported-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index 3b37cf102d41..dac788bc9320 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -70,7 +70,6 @@ $defs:
     properties:
       drive-strength:
         enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
         description:
           Selects the drive strength for the specified pins, in mA.
 
-- 
2.34.1.575.g55b058a8bb-goog

