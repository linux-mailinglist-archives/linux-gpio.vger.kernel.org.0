Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 227E8125F05
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 11:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfLSKdS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 05:33:18 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35134 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbfLSKdR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 05:33:17 -0500
Received: by mail-wr1-f68.google.com with SMTP id g17so5439140wro.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 02:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=NNOtGjrvusypzMTC6MJS8EMtqQcuO5BJE9acFErPQYUgb6qPZe3jFF4p61eL5laUxW
         tuAsMpR75YhavzwfcY99YsJDQOvMJcS/g71uP5dW1poVMEOAiKVXYsRv83f+P2DKINe6
         ZnH8A4QVwNGfb7XhFy+e184o1unmEhWRUyelBx1ihqKbSfSjJnwOu+rwKIZpZOefqAI9
         nV7h4ChVDZFlXPeBKt62DSex2V0RjzmGBNEQt6fObCtHkTLVVufjT5mmTO/dS8i/+hy5
         M8zjIOzc5MQ0W5LhXtQn2eW+HT5wpVfM3JQxOQVqqBIOcvWYf5puQLbrXgFxtBhSU9yK
         krmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=IKBTcJRUngamnbiQWhb6mGHaOOKbHlqVMP2ThzY7VCZFNbTbJeFjCzQAuRuZmyIIFF
         oVWT6pplmrGKMuAR3jVxBSkK/flCaq8qAZHX4TYVEYKfUY/AYpT/U4zFfmK7wcvT4mzu
         XL95OPxAB9qY2UjykEXaFc27MQ5ctMZMx0sNU/9/D7oSjN/oebbILtw4HprWFez5WAid
         RNMFn1OoYYyjxo6hCS3GQAX58usVsKAw8od+88Y3ThiIe+v+P/+0kJYmER0kPY60MJzC
         USpfq1CA0Jr9ZQDJdm688I3F18LrJOD8IT1tK6NYvmA0ASpUS1qMor1bATZsapQpxltT
         F8GA==
X-Gm-Message-State: APjAAAVbMSXqVGMglYbGFa7Z5BjBiqM4YHzoKLoIX6GVS69vILzL+Lys
        cmgZFtarQNrhbF/YZrrlSNOzeA==
X-Google-Smtp-Source: APXvYqxfo0snWNNJZR+HZ3eABwtxFyD/6cnRGxZomqgjOClUfLnrbHXMz0ncmNrqJw8+e8W1kW1oCw==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr8529223wrh.272.1576751595154;
        Thu, 19 Dec 2019 02:33:15 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i11sm5962942wrs.10.2019.12.19.02.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:33:14 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc:     robh@kernel.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 10/11] ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
Date:   Thu, 19 Dec 2019 10:31:52 +0000
Message-Id: <20191219103153.14875-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
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

