Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD942ADEF9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 20:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731472AbgKJTBC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 14:01:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKJTBB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 14:01:01 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29667C0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:01:00 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id t18so6952749plo.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=MVoBrAjhEFC0PezMoFr9xs7sKqAwAIK39BN64pdwyhI=;
        b=yRy9BZRpLEUKgVbF4FtdJHEyaNyO44dEbAR5KNlxRYDB5EjVnL5I2uT3nADt6XvMI8
         v+yF9fVVrwOgpVm67P+x+Z+7MvPowXHQjiuRXYOgd+YGwonRkYX3kyNIPfAvopmQaknX
         Dm8f+VOITLpVW9BU0s/AE22svDmDn7XdhMT/HEatYUmmUR9xxoPzarfr/caXGJGq+Wps
         Fh0gmUVFZB9ve2nFwT2MU0U/6Z6lHaE84G2qDy6xh5u7EJW06qDmRSNuTnB1qh82sEYh
         KVfc3z5+HpxWQXmufs58xAOUub+tuDPzAN6F6QRcYCsj+F56MXtgsKYAIp4UaZD+evJY
         oFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MVoBrAjhEFC0PezMoFr9xs7sKqAwAIK39BN64pdwyhI=;
        b=X4bA6dQsV56BVM9G38MKMo7CEI/7muhPaGmvGDLvwW5oUHc/3oziMxfy0HAZWA9GFl
         Rh9pdYSflFsXEbvniqM8w1My683XTaUEZ2btMj8CUtm/DZBLwXprk6LiBble+fyU67uy
         dDSwr/2MXy9W1BJHIKprrKrHxf5tyMKzbHshbnULQQQleyq61zt7iScUMuiCJuHlp7eZ
         Qv/Y1ElEFq50+erJs4JKNw6IZK7ruMSzcuzoNk3+SgsiRKp5IG7crZrqc1wr+2W9nY2Y
         hbFI0rAVVGDtLEsY/n7U40BfxL88oJqo5s6xnkAU5ygy5ulgrKoUfPIzxtnh8gUy4VXO
         WFwg==
X-Gm-Message-State: AOAM531DCLkkz1+71nSSnlT8FEnwMmB7RBnNLUshsA+p6xsVbW5m9fFw
        VyhjR+oy2ni86Zs1q0w2LguoBg==
X-Google-Smtp-Source: ABdhPJy39usNgzc0ELAbsZ1o2b74F4mwRDVHWgQ4MQB9rjXVDvOgTuMkkyOqkdzBTaUA5kpGKQ3SvQ==
X-Received: by 2002:a17:902:a404:b029:d6:ebe0:6e57 with SMTP id p4-20020a170902a404b02900d6ebe06e57mr18000738plq.12.1605034859388;
        Tue, 10 Nov 2020 11:00:59 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id n1sm524660pfu.211.2020.11.10.11.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:00:58 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: Fix msm9853 Kconfig entry to depend on, not select PINCTRL_MSM
Date:   Tue, 10 Nov 2020 19:00:54 +0000
Message-Id: <20201110190054.20517-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

One fixup following my patch commit be117ca32261 ("pinctrl:
qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then
a selected config") being queued in LinusW's tree, as a new
config entry was added for the msm9853 that also needs the
change.

Applies to LinusW's pinctrl devel tree.

Cc: Andy Gross <agross@kernel.org>
Cc: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: Vladimir Lypak <junak.pub@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 8bdf878fe970c..cf56e029cd9c7 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -115,7 +115,7 @@ config PINCTRL_MSM8916
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
 	depends on GPIOLIB && OF
-	select PINCTRL_MSM
+	depends on PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
-- 
2.17.1

