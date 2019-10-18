Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA6CDBAA3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 02:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503892AbfJRAU2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 20:20:28 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34024 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503896AbfJRAUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 20:20:13 -0400
Received: by mail-wm1-f68.google.com with SMTP id y135so8125069wmc.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 17:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NZWEuOshpiNrmyDr2BuiL5UEvx3WUO4xIJT4AKpVkTM=;
        b=XEPefSy5Ju8wuMJddkKTBWBWOpVaKin6k9vJK9Er3uza05kaPr8mVP8GHlwMzsTN3c
         51WAKd033YvZ0HyJqR2V3AaZnRtp4trh0qNtYdTSU4N1Y8TYcWl6Xh/gZVKCAMAUG7sD
         hOAeauv2RO/s/tAAvIjbBT2E1F/ZwDkN8zxmxsWNoP2/4mR3BVfGZatHXOhn7M6gAuvJ
         6SSYHGYzRdqpZj6tseXBBE0BWv2NJFym4VrpTf+zRd8ygQkA9hCfDMrpJlq6LfYZyjWm
         zzkFTmefkqk2y5mfclSa4fhGeEOlXS6sPn1bM84S7loWkLkxFK0nIAaJmg2t8gk8YFnv
         46rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NZWEuOshpiNrmyDr2BuiL5UEvx3WUO4xIJT4AKpVkTM=;
        b=M61oJouavFFMTBk3OGFXXTJz3lWtXgNqwoV8jiKLvlbplYMJy5bJPujERHNpfnC2ND
         aSAQcE5JvAnFsxnQDN5hjgACcgdN0I+kPN+Wl0HFdPakEE5FrpyRxWIkS8MZishuzrhq
         vU54hBL3lXm0gBwWT605vRuurV3CsFAtsUuyrm+pRHxVcoEOCf05Du6wyCDvq8YyO29j
         WKlkFNdm17U2WBTMdndkOTkH8hsqg6Fb881Fd6e/IfaZUKQrSxPeQ+QN4MtzXbFqvUPA
         +AzYe82fcLnZlJj86wPvmXfQ9BTd9X8IZdptprxI8+/6SmIBKWsV1qmpa10QwXBVxiRe
         lkWQ==
X-Gm-Message-State: APjAAAXE+lqDBfxctdeHLWius5Wktq6WdOO047C+FpdSAiWHPdSYCZPP
        vCcBCT99jPv+KFtwML6stbW/vH4DtMs=
X-Google-Smtp-Source: APXvYqzCUxv1oQ4PtToSq0FPZjkkOcPpbUYYZIa9wsxT5Wo/p8ciGcsMINDkZInIGlSgDZFH46szBw==
X-Received: by 2002:a1c:7917:: with SMTP id l23mr4663874wme.60.1571358009564;
        Thu, 17 Oct 2019 17:20:09 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id z189sm4851248wmc.25.2019.10.17.17.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 17:20:08 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        lee.jones@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 10/11] ASoC: dt-bindings: Add compatible for DB845c and Lenovo Yoga
Date:   Fri, 18 Oct 2019 01:18:48 +0100
Message-Id: <20191018001849.27205-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
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

