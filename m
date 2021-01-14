Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C222F6F07
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 00:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731017AbhANXlb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 18:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbhANXla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 18:41:30 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E98C061575
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 15:40:50 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id md11so4020705pjb.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 15:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwOjwyg6i4iA1UJ1S2Hj9B446AoSw0O4Qio8BG/OuQM=;
        b=Yo6HU+GsLdc4Gahgl+nfm4NocqQdafahxS/Vy3BfbRYl3bgPmcG6TSygnYPzXrNXeu
         CRDUVqqTqJvsei4ONiyztLN9CEtAv3hcZZktGya9ZbG3dQBAj4BGykJtAztwLAeIwN/n
         VrfRce4jDw7P8biviuBPvVBlVU7wfOHpmAdKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwOjwyg6i4iA1UJ1S2Hj9B446AoSw0O4Qio8BG/OuQM=;
        b=S9k7WBAwWbo82OkCondFWFhyGIOBgklPUhMpi2meib1MjKR1v1e4/zNpVDwkiuJsOv
         8NbMymW4bRcOSe7zMImqIYCr01kijbC7A+06ohynGlwRxvADF70K88b3/P3wy8wF8vNR
         KnAhobg4/eaOgJm8jo0+Vub5jwY+o02sVUKcKyFCgG4BT/IpLpdgBTgRA5rLbrscYE0F
         5mzEfjhyIj2NAD/4tDbN91EN1xhz4MJvmylBkzLkGbB+KJyfGpIKxshGYTL7Abn34hH6
         iyVDn3OPMAbUUsIlYFaNV5kfrxdqhf22tRKESXFiEetxwhf5V18GakFRkLLEKZIa6tMi
         P2lQ==
X-Gm-Message-State: AOAM533GW0nRmbYvOStkPsS8THnTan0nxIkz4PQRLbNmZ0iXsgGmnpon
        dTvmuer9KXCs0NdwTlQE7FipwgbbTQb2VQ0l
X-Google-Smtp-Source: ABdhPJyK2hTjgJqcjghcPAjC14/kP/FnaiRkzCCIPV1ht4vchLlBt1rWXpO8h+VZXa4U0HFKpDBIuw==
X-Received: by 2002:a17:902:7007:b029:dc:e89:50f1 with SMTP id y7-20020a1709027007b02900dc0e8950f1mr9940803plk.72.1610667650223;
        Thu, 14 Jan 2021 15:40:50 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id x1sm6498804pfj.95.2021.01.14.15.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 15:40:49 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Neeraj Upadhyay <neeraju@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/4] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
Date:   Thu, 14 Jan 2021 15:40:24 -0800
Message-Id: <20210114154004.v6.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
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

