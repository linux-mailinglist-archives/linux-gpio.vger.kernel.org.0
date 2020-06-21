Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F426202D3D
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730818AbgFUVih (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgFUVie (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:38:34 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DE3C061794;
        Sun, 21 Jun 2020 14:38:33 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id k11so15982853ejr.9;
        Sun, 21 Jun 2020 14:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uFrjNrpCN3ztWJ49/VIXZ9CeZ4er+je0BNmpNUdRSbU=;
        b=rNfu7qiKTJJSH0ANM2WHzbxQWPd5FdX/xJ6Y86oxTEGkKLzHdN86vJwXKgpoIuvMgI
         cS/dBT+kF7VJWZanMRL/DhnDiLUc92Rs8nPH0/3zIZ4cv9GitDs3qrb0f4ZujXTzD0MZ
         9GbthKrt9yXUwrgepFH46to6y7HkjM3rMU3JNwych9184N3YFoOztIx+6+bM/uXoy714
         0UfpHSGuF0u6HagF6Pha/uQSPfqFXMSJaE0cEe8jU0ouOU6ilH+wbVjT33JpntieLCPd
         F1jhHmfEqOXSfx4qYrrRJ0EFuuR4vyCDASk4NfnJbBFiUcL2pfsPMd38fbxIesZrewqE
         NL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uFrjNrpCN3ztWJ49/VIXZ9CeZ4er+je0BNmpNUdRSbU=;
        b=ZRfAEFElQ0RTUwXIUNOmxqaWqsyDqiyXZQemllgkvpoJCGxy0aa5YNx78nYZj4x8ZL
         3M44o4W4Y0o88CW6tUf5/9f4eossSpfvtEf5DGSGOohLD/oqQuVBnqdGAQv9I6uDRmvV
         EyTABDQuei9idtyEq4p4IIbRHn8FAVjNwkMSpcNcb/xnKUxEoHqKUewsL9P1QXecChKI
         b+EoeSROMFRhHA/mcVAlDEhnSJIcaFGyaxz2z+P6LQJW+l/qC9HQhAkiFKe3jedZAFpc
         vk2djFjxwASSxPerTj8TTa4u4tehlR1gUrgJKGScv3s1gnfUu9c+oSfInTOEPD6FXJb2
         XRkg==
X-Gm-Message-State: AOAM531wtT5j5/C9yp63r21bkMXg/WWMLdVtcSXdKS9kiTyMoPEuOC1k
        e1PYHFsGFg2W/fZlafE05OY=
X-Google-Smtp-Source: ABdhPJzhbtgPKBwQP3mdVsb8YNWW9GjVLl+AoA8Q5+r/UfaMFeD4kHOmdaI5odtS1yW+9FlhQKZTPw==
X-Received: by 2002:a17:906:b292:: with SMTP id q18mr9241459ejz.253.1592775512176;
        Sun, 21 Jun 2020 14:38:32 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id w3sm10130012ejn.87.2020.06.21.14.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 14:38:31 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 2/8] Documentation: Document pm660(l) SPMI GPIOs compatible
Date:   Sun, 21 Jun 2020 23:37:58 +0200
Message-Id: <20200621213806.551879-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621213806.551879-1-konradybcio@gmail.com>
References: <20200621213806.551879-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 7be5de8d253f..f8a5651d498a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -23,6 +23,8 @@ PMIC's from Qualcomm.
 		    "qcom,pmi8994-gpio"
 		    "qcom,pmi8998-gpio"
 		    "qcom,pms405-gpio"
+                    "qcom,pm660-gpio"
+                    "qcom-pm660l-gpio"
 		    "qcom,pm8150-gpio"
 		    "qcom,pm8150b-gpio"
 		    "qcom,pm6150-gpio"
-- 
2.27.0

