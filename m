Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEE0CE8716
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 12:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733212AbfJ2L3Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 07:29:25 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37288 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732744AbfJ2L3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 07:29:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id q130so1995936wme.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2019 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=a7btE6bNZTalO6uJ2Q3J3SGFmmVteAIhrL2W5H4pHkfPFeWdizziBlnvYU1k1l7H1z
         VdrT98Yc2YK24o81kwrEhi25dlcKpAucXw20r5kJuGqR0fzFvFUw8IyUa3TgkZ2+N/t0
         kalOcSQm4sdNPsAmabcWb0eXbbr+cuZ9EAttgV9ScQoeY44mDD7Z2p8rOaFugm7ina25
         mWzB9+MTesKrQxHw6b6ECD69xcpwkkFvtIJszfhMRF/Ixrj+yHOnxxXqXgGK4gF1kTLt
         3V1IwLIrJdwy4tglpaWjmrMYZFXtJAcIj1zPGzAeDvXzO4ghDIJGPkCuTuwW2LyBmXRv
         xIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=WLQRGmFKvAQlwFNC6GlBZd2+PmKwUtpYMkMR3dg1L6t2bX+GSh2knRhYKxl7k1sqHc
         8CMvlEvCqJjmIdPwlSC0guNZC0Mm3RNywrtLdvT43dhFgL5Lwt9/ZtUaTNW5WMA41pH5
         Q4CoQPJAH4gSS0LZ15SVH3VZ8bt+bahHap7aBiaRlg8mkSS8i0kAIjEFT4Qw7cQs1axx
         f0styFzlg9UALW0BCEYyac4oMXHuiDM8qzQE3ij/Rr49BqebSUtPt45JctZzm4o3trxO
         EIuwNG7g0V1h/ev/OevvgBNFs9jA28yWFLb77RILoelreQPB05zAfXaDtvedjB19dBhJ
         LbTQ==
X-Gm-Message-State: APjAAAXnyjMLbifgSoDVX7SwdRZvQqzjMKGEtJhMFDx/zcEAdIP9l1eg
        /RPDBwQjCEw1apxkyjlOZRW+5Q==
X-Google-Smtp-Source: APXvYqy1tl4LyuCywYWNRuqXZdWjtRzeYlP86wtCjCStz54zWcC6oJciXhUYQAJM9je4iY3Kq745ww==
X-Received: by 2002:a1c:d8:: with SMTP id 207mr3548367wma.65.1572348547207;
        Tue, 29 Oct 2019 04:29:07 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 04:29:06 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 10/11] ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
Date:   Tue, 29 Oct 2019 11:26:59 +0000
Message-Id: <20191029112700.14548-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
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

