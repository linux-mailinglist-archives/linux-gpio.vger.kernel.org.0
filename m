Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B92321D8ED
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730007AbgGMOtg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729895AbgGMOtf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:35 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670F4C061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:35 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o8so13578223wmh.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1vzOm+Wxxl66itaxak6yGc68arwrZOiyNRd2hReQUvM=;
        b=bxE70Uh4AXsVWAKo2T/XG7xcyZ+wYk/UE1Oj1K9VheDTBBbntgw6I9aN6Ryi7YN7Hd
         6A/lzM75vKOg0Rg/hp2HH+KfpCdQWtpMbivGS+KZiryf00AIWPO5b4ml+6JbAUxG4YDX
         bKrQytCckcWMV4+BR6JXl8+eE2NhiSSgRXwLROGl0lLVHpbu+AR5OUTFkQlfEKH4lHRL
         ne2dSkONSTP6gT8rCuD6mxOyMe6Vfag456jJXcvCWCSf2EI8wUPnMbKKxGTmvqKCumMj
         a5PJIUWXaAnsLpHnPMb45J+SuCWO8KLCHYkQt5Q+CiIltc44bST5yeme+9ecSrDDB8GY
         zBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vzOm+Wxxl66itaxak6yGc68arwrZOiyNRd2hReQUvM=;
        b=TleEVcEIBjb0Am47dKubnrM1o4aXLaeY7XPry7veMVNWp65CcDMmn5ZT9JY0J+LyZI
         OUMTeRecdy/3FFmEgTp77ebM077/lU5YpUU+QeVIOyTBQCv8bwlxfDfTjl73qeD5YXL6
         3ScqXzWaizo7RN54g6AA3wfvZpgwKMuFF3Ez7HReFh5zgQSGrw4Lqxg6T9yAQtu35zlm
         W2ZCL9eG2fTT/z5+AlCoFrkoQwYbyV72UpVooewMKKnvGVS+Pzgu41MhceSnar2fxYM3
         clTI5xRZj0Iv+YrBErNHtQQ6m3gppBJnufmhcPH/yK59VsZUHPfhN/N4TvJSxB7+uRwP
         8c8Q==
X-Gm-Message-State: AOAM533BsEBKiJXixFAJisT33Y4UmcCzXDdHvLcSDsW49HF0bwO0JVZJ
        LgOfsQ1Mg7FZuOzO8fjw+9An05i8FbA=
X-Google-Smtp-Source: ABdhPJxw1sWGNmpSzrakQy8c0E8EiVET1wI4zlCcDuNthed/Tk9AxB5PCD73LubEHuDLzgs51Mw6zQ==
X-Received: by 2002:a1c:2095:: with SMTP id g143mr267721wmg.113.1594651774136;
        Mon, 13 Jul 2020 07:49:34 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:33 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        David Liu <liuwei@actions-semi.com>
Subject: [PATCH 01/25] pinctrl: actions: pinctrl-owl: Supply missing 'struct owl_pinctrl' attribute descriptions
Date:   Mon, 13 Jul 2020 15:49:06 +0100
Message-Id: <20200713144930.1034632-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/actions/pinctrl-owl.c:52: warning: Function parameter or member 'clk' not described in 'owl_pinctrl'
 drivers/pinctrl/actions/pinctrl-owl.c:52: warning: Function parameter or member 'irq_chip' not described in 'owl_pinctrl'
 drivers/pinctrl/actions/pinctrl-owl.c:52: warning: Function parameter or member 'num_irq' not described in 'owl_pinctrl'
 drivers/pinctrl/actions/pinctrl-owl.c:52: warning: Function parameter or member 'irq' not described in 'owl_pinctrl'

Cc: "Andreas Färber" <afaerber@suse.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: David Liu <liuwei@actions-semi.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/actions/pinctrl-owl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 5a0c8e87aa7cd..7efdfb4f3e9ba 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -35,8 +35,12 @@
  * @pctrldev: pinctrl handle
  * @chip: gpio chip
  * @lock: spinlock to protect registers
+ * @clk: clock control
  * @soc: reference to soc_data
  * @base: pinctrl register base address
+ * @irq_chip: IRQ chip information
+ * @num_irq: number of possible interrupts
+ * @irq: interrupt numbers
  */
 struct owl_pinctrl {
 	struct device *dev;
-- 
2.25.1

