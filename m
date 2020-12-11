Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE152D81CB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 23:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406783AbgLKWRW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 17:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406772AbgLKWQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 17:16:29 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F775C0617B0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:15:45 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id r4so5286698pls.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 14:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N3hybBp7EUYCA3vGL47ftPnar6+AkmdADxaaYRIyKZE=;
        b=IqdIWdK3AZ7RmSWUrbjPiTZk4GWmPtRYtLtdE0Jsap6eA0nC323cZ2zPDMc5rybJWm
         BWQHUnL3QHMdd6pRWBI7vqfgRxMNINHucXyUgMQd9GuK4QQ5etVIbLwsAQI5s6mrHnY1
         3dTYROicSUrPOlBRkw2GYtIAARt4xkssKoB5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N3hybBp7EUYCA3vGL47ftPnar6+AkmdADxaaYRIyKZE=;
        b=UI1gCKpUFlcuUSo1pO/P0rMdMLGv08YvABSsz/hPLLSo/nW5QRGF36u0OSpFg5nSbw
         zusE5PsKdGaVkM/9Ri02lN6OlqJ1ig7i78IbaojXeeX2PbywXq0xgXrKuFIBcQEGY392
         CcXLDiBaQ3RXWfrOkrnKxnRaBa6ZHn7S0WQDpTFT1mAm4cMRk5jM0zzAvhi11psOvyGh
         odAsyKENLL3MY7re2buRgYFdSdnHhUI7UnIRdrDOFZv84j2q/8zW5sBTSPjyX29uGjBs
         pmSIcLu5ob+UA3DTuH3Lu2PrLt0bFbvWci9GII0pBmYplk0lWBq6Y/ONYfMWEtNgvqt4
         YTfQ==
X-Gm-Message-State: AOAM530sjpN3g3EG2z3giOad35vt/KIjC1+TQ2ZTQ/z+X0Gd/l2cxRKO
        DYUUtqbBbweDWysZbJ+8ygptTg==
X-Google-Smtp-Source: ABdhPJwcduZHs4/bikaZX1IttJEerdlqSiW7Uwf3rjhmzSFcy5PFsOMxMelHaiFKZG0ZUXeAR3aDNw==
X-Received: by 2002:a17:902:a504:b029:da:fbca:d49 with SMTP id s4-20020a170902a504b02900dafbca0d49mr6614064plq.72.1607724945117;
        Fri, 11 Dec 2020 14:15:45 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id s21sm11832981pgk.52.2020.12.11.14.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 14:15:44 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
Date:   Fri, 11 Dec 2020 14:15:36 -0800
Message-Id: <20201211141514.v4.2.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
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
---

(no changes since v1)

 drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-msm.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 77a25bdf0da7..588df91274e2 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -210,8 +210,8 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 	if (!g->nfuncs)
 		return 0;
 
-	/* For now assume function 0 is GPIO because it always is */
-	return msm_pinmux_set_mux(pctldev, g->funcs[0], offset);
+	return msm_pinmux_set_mux(pctldev,
+				  g->funcs[pctrl->soc->gpio_func], offset);
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
2.29.2.576.ga3fc446d84-goog

