Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E195F39FEB4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 20:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbhFHSK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Jun 2021 14:10:57 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:37486 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbhFHSK4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jun 2021 14:10:56 -0400
Received: by mail-oi1-f179.google.com with SMTP id h9so22424090oih.4
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jun 2021 11:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qtBn6+wQNM3SVHNHCv1FqEQ+GoHDdhutRmc/9Udy3Bc=;
        b=U+yLUTtLshRKyWAMvVGc5M6Gul0Hk2AKwfzjffWrBkjaMEjmds8VnwPq7KDH+OMF7C
         6ziYYlld6/i5tWzaZpYVAFvWd6sRa/ZU8qYN690iEQgKmAhI4LngAkcAVeI3iXxzLNz2
         YXAiUroSvLUBzyO85XcwKs6fItRJ+wqzWPXZAOjNs/8jUgjCYHrJHQhP5kuCeNE3g8GR
         xM/+z1CroRHQV7GOWahB1vFt6uQIyHg0+tSMK50DbHuc4WvqDQ0KBMpJZv5TQfS997Z1
         5eZnkxSt62AMYEFYoOuwpirg9p+PErulK+HFn4vFCEw3qVVLlRMJzYjNMPbM2dcjA5RH
         uDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qtBn6+wQNM3SVHNHCv1FqEQ+GoHDdhutRmc/9Udy3Bc=;
        b=ILllTVX98frzfm1HDpNd4e3GwTBN4f/DW++h1VtfToTJBd4jWmesDTHYhIOv6cSlnC
         18jcux11h1651HTnz6pgTuV8Z8O1Pl9Yl+5pAYhdhfYpIxONWUOZBn7B7idchlw4l0Q7
         LMjjhKpLo6RoJeHJQ8UeEwGiHLbu5ic7JqpzoXwEQWjOu6JkCnIbACrhlcJAijZpEg6I
         CrN+sEl4x8+Cm5MMEPTHqq6jxm/vfFoIozbO/oF3S95JyuJ/G4wkdlM2qtnIL86YXqOf
         4YPPKu+EHKBKycUxNpe1oLNoCJGsbw3h2geDykorMCQvbvvmbF9/UZovacUvhEEgln1Y
         yD0g==
X-Gm-Message-State: AOAM5304lI6hLWzaPkVL67jtIBk0ClHY0FrYmZsLnGQRZbDWFGRwrgCn
        bgvGfvfHtkCBc5krDIbC9YlcpA==
X-Google-Smtp-Source: ABdhPJwOoQ45O7PUk0iB4SrhSpnhTUzlcMavHr2RbdmemgcmbNRHLS8zUzxGVcgTrTLYXBaIUzxEgA==
X-Received: by 2002:aca:4843:: with SMTP id v64mr3576333oia.68.1623175669992;
        Tue, 08 Jun 2021 11:07:49 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p1sm2838772oou.14.2021.06.08.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:07:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: Make it possible to select SC8180x TLMM
Date:   Tue,  8 Jun 2021 11:07:02 -0700
Message-Id: <20210608180702.2064253-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's currently not possible to select the SC8180x TLMM driver, due to it
selecting PINCTRL_MSM, rather than depending on the same. Fix this.

Fixes: 97423113ec4b ("pinctrl: qcom: Add sc8180x TLMM driver")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 25d2f7f7f3b6..11e967dbb44b 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -223,7 +223,7 @@ config PINCTRL_SC7280
 config PINCTRL_SC8180X
 	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
 	depends on GPIOLIB && (OF || ACPI)
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
-- 
2.29.2

