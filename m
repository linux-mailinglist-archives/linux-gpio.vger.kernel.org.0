Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C67AE122B1F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 13:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfLQMRS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 07:17:18 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34956 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbfLQMRR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2019 07:17:17 -0500
Received: by mail-wr1-f68.google.com with SMTP id g17so11068074wro.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2019 04:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=e9s9oPlqXY3bctDM3DAHIJFutY3Ax0XREhVRz8vU2/r0RE5AQiKlprlrrhlwjSUKnU
         I4MNJ6If8bH8sOZ/8V8co/C8+VmqvSH+0TE9JWQjAlvN5D8Hu1cYG72tuFzM72STIrIx
         8Z7L6qC+b+xgUl6hi7VzTgXqyOA/7TE2//DxOL1bg5v6g0P1Iu43cZPvXE4l5EsfOaTz
         381W/UqQI3VECNLJO1D8aX97tm+2wRw2dckwE25xta8py1wh4vBWgJ6TYVG86CLQah5v
         d0CvEauJ67z2iUN9K6EgAvlhrN3ky0wQKeqS4hhetqXQg/RDE0785FOABqsg2WjS5dkh
         dxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=kB2C2QBwBPMNyAlwmLxv2pHgkzQWD1UyYD5sUDFH/aozgsMczNifvd10YtBIYjxgJB
         z5DTYppkd7XAIaKGPYoFIkXJK1T8dH2mdJzc8vTUkypYxoYeTfzk1IZ3ZN0YubJJNxvK
         OgD6Im89tbcoesVtrNy7i6hQ69dPSwKvYHHPBcyOicr8AA/LhqtI41DIe+r9wLhAuaQC
         F7R8OTQlBa03TUl7vm1O80SXOxuaKHEU66Ufe9djhN9/9LeI2TBYQRh3c8g1/KgIOcoS
         ntE7s5OvjH8NCSZO1lQraJSRTEREcRwIpA9OH5LrEpbqldCh8gwJ5ZIUCDIAVaA6jkr8
         sdnw==
X-Gm-Message-State: APjAAAVlbr8f5URmlk5hfWZNH8worNWY1eiAskuHNcrEXByr0dubNI6n
        1ORER6kMIV/WslQ51AW9JbLpUw==
X-Google-Smtp-Source: APXvYqwUd8iYagOOPCAYY210HLyKnjSRxtsp4sXkvd58+blKgW/ZwzPQFg9MOF97O4mj3QOzD6d58Q==
X-Received: by 2002:a5d:55d1:: with SMTP id i17mr35902104wrw.165.1576585033342;
        Tue, 17 Dec 2019 04:17:13 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f1sm25087270wru.6.2019.12.17.04.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 04:17:12 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v5 10/11] ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
Date:   Tue, 17 Dec 2019 12:16:41 +0000
Message-Id: <20191217121642.28534-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
References: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds compatible strings for DB845c and Lenovo Yoga C630
soundcard. Based on this compatible strings common machine driver
will be in better position to setup board specific configuration.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/qcom,sdm845.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
index 408c4837e6d5..ca8c89e88bfa 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
@@ -5,7 +5,10 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
 - compatible:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "qcom,sdm845-sndcard"
+	Definition: must be one of this
+			"qcom,sdm845-sndcard"
+			"qcom,db845c-sndcard"
+			"lenovo,yoga-c630-sndcard"
 
 - audio-routing:
 	Usage: Optional
-- 
2.21.0

