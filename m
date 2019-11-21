Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 746611057DE
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 18:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfKURGL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 12:06:11 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40818 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfKURGD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 12:06:03 -0500
Received: by mail-wr1-f67.google.com with SMTP id 4so2028186wro.7
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=OiGjZ/6HgFqifxkfowVtJjQqTqFfdS/ToscQHYZuAZ457wTJBcCYUY+ZlWODG59Bha
         GghowrjEwvVNEf8bryAhzrQm36CGD+RvjQpy6Z5PWKv5tmhsXmuTJpd2JjpPV6vrC+iv
         AM7zvsDjFlJY9Pn/ieonZa0PmbpX2NUPvzn+APuOy8HBuOrvBXuevczg+Nh2fLbz+I7R
         ZxCE148bKqFoPCYxbQ8SCeTh3k9c+/cdJ91DJxX9YjomlnMhaOEEbuE3f4L4HPCgvBxw
         F1e5g7qgsWnrgyDbPl70cSDThUZ8WFcRBIL4GJ/3erLwkKfg8FAh7oBKe0ebBWEDmVQo
         petA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=r/BPrBKLSQWgMgnNCsaPrtGAKRMyoNcxoxEBBemoaDNbZ8IZjwlusZMRHVA+Msg1n7
         3Qg2jIAC5ANVcqnC2qN3SAotd54qqdsZeMeH6mIWhvLRIeLCGX7xMCcpocH42vJbHsbP
         Yqams45pgMQ58vBEnwMvbn37Gl1ISRPr1X2wPS1L94ToD/0OdB3q+nmXBCUAXb0fNKhc
         7a3ndCIVd0lGZVfgt/ZZOmIJ57pMjWG1nTcxrAzoA04IjD1le8LCavqmmw/3YuIzBuZQ
         hAI/hkCLTdbNfb+C0rBInt/rG8DTjWHhu0bWrnY1IFFsTkxngKEHWgJoVk5XXUTzuf3W
         bpQA==
X-Gm-Message-State: APjAAAVgJIGhDlvL/ZjhTUj52K3jBjR7H1P48HsQQgtEb/SlwmEFZ3Q8
        FIyzILgTRcmxWGq5dNxnBqgQ6w==
X-Google-Smtp-Source: APXvYqxxTp8LzEjyKmHdLa9JtltjBFMatq0lqKOl/TmxVgxr67cJZBCxg7paChQjot9qRNj/gCVHQw==
X-Received: by 2002:adf:edc5:: with SMTP id v5mr12049689wro.322.1574355960208;
        Thu, 21 Nov 2019 09:06:00 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i71sm4423731wri.68.2019.11.21.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 09:05:59 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 11/12] ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
Date:   Thu, 21 Nov 2019 17:05:08 +0000
Message-Id: <20191121170509.10579-12-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
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

