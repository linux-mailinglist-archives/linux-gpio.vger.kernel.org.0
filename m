Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A41421D929
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730359AbgGMOvL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730073AbgGMOtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:40 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A83C061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:39 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j18so13588282wmi.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uHw7vfvkoUl/p+J0u5Wb1MljRc1mmHUiGpf+lUlkzX0=;
        b=LtwsOLQBSd935qDg45xtuJw1DsUvUlXVZjJbx/aESPvqCbQKILkSfnn5RNWUVbgV2x
         VI914y8yiPOmbKi8YiBaEBwt/4cgx33qyJtNA0FA+AWJuy06NSblJBdOG25jj8XCMgFl
         F/wju0wkxqQEpBHCKhEItmEYgl5Tw0Jp235Cu/tKBRc7JFGLMxWWyVWecZqmvJLOE+06
         V/93fvuIbubbN+OFWr/CSjS1Zb+o2UDipa7mbGPRIiAqvZj6rkTDeApLzOii7vFPbJx2
         +SzuCHJiY0n2N2GRz2TmSE2HbUb+I1PORUjdjg5PFrg2MelwSgdJbFkMZfMQcaAT1JGL
         m2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uHw7vfvkoUl/p+J0u5Wb1MljRc1mmHUiGpf+lUlkzX0=;
        b=YAp1ywdlle1A37J9sy80OfPQ2NMnDbCO6icxf6EArx6Hn4KL7Rv3gqsa/jQAPtIG0M
         iTnkIZOzT99wHxuRzK65ejH1gNDmUiMTRm5gUFNWCTsNMIAEgL8FgTK2FK83FwA3rNt4
         962oHIhm3gMfE+sDtDcxH+gC0v7ErAbOtSUB5Hlj2D+ssrmO6NVf4q19AFKfLZUGplHr
         C5Yn0/Xn5jhtizC9aZPIoRrsKn3r3Sul0JLUPYsxoHjXw4oKq3BDZ29kjVAK7PkPtx0O
         kIFHrht2JtZjga8FOR/oDdC2t0yDGxxMLid6tc7K5WtALL6wTBT2AIvGICfnf/UjMYzT
         5IuA==
X-Gm-Message-State: AOAM5304ypBMIUWc4I8GJmGkHXnG5+wuXSxS2nEw2jQropMB9y61jGab
        vDPbVGFi+ZNduVRAe+GHjLe6Qw==
X-Google-Smtp-Source: ABdhPJzdyzPd8UNr1xBZ1aB/AYvkeJC2J4Kk5V8tjjunLbWbzabpwC0c0v3arMWicoKNSwUlIpJUmw==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr316828wmg.110.1594651778433;
        Mon, 13 Jul 2020 07:49:38 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:37 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 05/25] pinctrl: qcom: pinctrl-msm: Complete 'struct msm_pinctrl' documentation
Date:   Mon, 13 Jul 2020 15:49:10 +0100
Message-Id: <20200713144930.1034632-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add missing descriptions for attributes and fix 1 formatting issue.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/qcom/pinctrl-msm.c:75: warning: Function parameter or member 'desc' not described in 'msm_pinctrl'
 drivers/pinctrl/qcom/pinctrl-msm.c:75: warning: Function parameter or member 'irq_chip' not described in 'msm_pinctrl'
 drivers/pinctrl/qcom/pinctrl-msm.c:75: warning: Function parameter or member 'intr_target_use_scm' not described in 'msm_pinctrl'
 drivers/pinctrl/qcom/pinctrl-msm.c:75: warning: Function parameter or member 'soc' not described in 'msm_pinctrl'
 drivers/pinctrl/qcom/pinctrl-msm.c:75: warning: Function parameter or member 'phys_base' not described in 'msm_pinctrl'

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83b7d64bc4c14..56b36d4b54668 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -40,16 +40,20 @@
  * @dev:            device handle.
  * @pctrl:          pinctrl handle.
  * @chip:           gpiochip handle.
+ * @desc:           pin controller descriptor
  * @restart_nb:     restart notifier block.
+ * @irq_chip:       irq chip information
  * @irq:            parent irq for the TLMM irq_chip.
+ * @intr_target_use_scm: route irq to application cpu using scm calls
  * @lock:           Spinlock to protect register resources as well
  *                  as msm_pinctrl data structures.
  * @enabled_irqs:   Bitmap of currently enabled irqs.
  * @dual_edge_irqs: Bitmap of irqs that need sw emulated dual edge
  *                  detection.
  * @skip_wake_irqs: Skip IRQs that are handled by wakeup interrupt controller
- * @soc;            Reference to soc_data of platform specific data.
+ * @soc:            Reference to soc_data of platform specific data.
  * @regs:           Base addresses for the TLMM tiles.
+ * @phys_base:      Physical base address
  */
 struct msm_pinctrl {
 	struct device *dev;
-- 
2.25.1

