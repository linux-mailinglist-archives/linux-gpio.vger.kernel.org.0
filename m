Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673A92F70CF
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 04:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732360AbhAODR0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 22:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbhAODRZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 22:17:25 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D05C061575
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 19:16:45 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id p15so4179633pjv.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 19:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hyxvs6de5u+Z0m5qJhr7VhYBFLTdTIfC8RRDwWALIGE=;
        b=HAbKDK5rv41PPGuh2wyV3MFE70eGf6mPnEf1NMLGeGm5JRHPpB+hLQ0wdNWXyhMPtb
         1lSfZ3g9SzALttGKdtcHryzu9F9zSNz9l7pYqXWq5LskTDzwlHt0eDRHme0McQ0KPd/l
         FlkBqLs5lznTP1vC9juIYvp4WhILRV84VdIsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hyxvs6de5u+Z0m5qJhr7VhYBFLTdTIfC8RRDwWALIGE=;
        b=XBbUXhp1kfKjjR3PTuTUK0bSoELhkeaX6SZsBgq8JybugbeMBHx6hYr4lehn7ohJvA
         BHszZoiSxT8TRLT1g5EumT+lI1PF4L8WbFsyzsTjuVTCM8FtttvFWKbX4DU+R1v2QgLG
         LqZ2wyOz8v6QXhS5fNnR12KubAVH6sXiNdlthCPBjQFA2CBZjcQUMbhtrDcjGO4CCbFn
         j//YTdX7SL6DTbcuTsO4uXSW5ieFnHog54N4eoxfympTp37u+OWI5rC67zmnq7HwAmr3
         Cg4OkYglteXoOQW5Lavs33Qll+c0ZhvQOSv5+N8swZg6qAKu8vw9eBoMR88QwmINf4WN
         JDrA==
X-Gm-Message-State: AOAM533786jfiP6I23CE8mprfIcmO1yDTFJOqHreySNOn2bk56RyVvIk
        XSVBBon4SvWa6TzX00Ic8SWe3w==
X-Google-Smtp-Source: ABdhPJz/TOwL5g0bqm8zhaIK26fsyTXSQybdBfLWLSXM8nfDQ0sR5O5NUGxSTueSzAcyJf0vMtJh7g==
X-Received: by 2002:a17:902:d50d:b029:de:5b13:498d with SMTP id b13-20020a170902d50db02900de5b13498dmr5498673plg.38.1610680605123;
        Thu, 14 Jan 2021 19:16:45 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q26sm6346318pfl.219.2021.01.14.19.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:16:44 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/4] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
Date:   Thu, 14 Jan 2021 19:16:21 -0800
Message-Id: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There's currently a comment in the code saying function 0 is GPIO.
Instead of hardcoding it, let's add a member where an SoC can specify
it.  No known SoCs use a number other than 0, but this just makes the
code clearer.  NOTE: no SoC code needs to be updated since we can rely
on zero-initialization.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v6)

Changes in v6:
- Don't wrap line; bust through 80 columns!

 drivers/pinctrl/qcom/pinctrl-msm.c | 3 +--
 drivers/pinctrl/qcom/pinctrl-msm.h | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index e051aecf95c4..d1261188fb6e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -210,8 +210,7 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 	if (!g->nfuncs)
 		return 0;
 
-	/* For now assume function 0 is GPIO because it always is */
-	return msm_pinmux_set_mux(pctldev, g->funcs[0], offset);
+	return msm_pinmux_set_mux(pctldev, g->funcs[pctrl->soc->gpio_func], offset);
 }
 
 static const struct pinmux_ops msm_pinmux_ops = {
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 333f99243c43..e31a5167c91e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -118,6 +118,7 @@ struct msm_gpio_wakeirq_map {
  * @wakeirq_dual_edge_errata: If true then GPIOs using the wakeirq_map need
  *                            to be aware that their parent can't handle dual
  *                            edge interrupts.
+ * @gpio_func: Which function number is GPIO (usually 0).
  */
 struct msm_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
@@ -134,6 +135,7 @@ struct msm_pinctrl_soc_data {
 	const struct msm_gpio_wakeirq_map *wakeirq_map;
 	unsigned int nwakeirq_map;
 	bool wakeirq_dual_edge_errata;
+	unsigned int gpio_func;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
-- 
2.30.0.284.gd98b1dd5eaa7-goog

