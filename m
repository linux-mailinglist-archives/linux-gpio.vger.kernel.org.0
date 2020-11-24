Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1842C19C1
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 01:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbgKXAC1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 19:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728606AbgKXACW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 19:02:22 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C45C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 16:02:20 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id x15so9713253pll.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 16:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fw5pTrGt8cRDmQt546J+zjyV3tc7NtMZfxIm6B0Y+tw=;
        b=RQis3WvQ1SNRz7zQmrKK719gPBOlh25OBcvT9jAzxTFjvXsWrciBEkYt6v5Zbg91NT
         O9/zfn97owjAoxgtAYYMfa1/PCOYfbBzGoggSWHS4D7n/T/cXYhayNTDcE9VD8+APent
         D1L8TRD43pBJ6GAXCz1pVD+1PiT04N1XwsGx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fw5pTrGt8cRDmQt546J+zjyV3tc7NtMZfxIm6B0Y+tw=;
        b=nkuKOxyX4TcDbmb0wfel39TKYyxwQTqlyDP78hHQLuHvr7DHrAHxBuxIic0vxqC5tb
         WYuiZh19vk7xTu1N+MpBJMH6hVTNrXWnKikULPoIubjR49Bp+hK/LEZRH5uLfBe0z11b
         LpVjgEgtfZ9BBc/qx7vW5qan+GxiZCg4yuVyqJGHLaSMTAVS5FljzrX5VV2uwgHBt0uC
         b5Ar/qgaCIi7DVhZZj+LfUulm+AEKtqhDbZuUADrOn5sCE6YdqZmSU4cvy+dkcfUhJ6T
         8AypCUH7qns2c8SpBzP3qhww+LJ494iPXmLkoG52WdSVSMfpwtuBA2Jjj5YXi7w692lQ
         MhLA==
X-Gm-Message-State: AOAM533HM3T23lpgXTHj2+cObzJpkGZfBCGEZN1eYjxZe9fmI2Dvbkzl
        JUVDuQ3XtI17Fsb/xCwJUQqiBg==
X-Google-Smtp-Source: ABdhPJymEA16wber3riwA2RZRoOOVY05U+0/J44V0CVG/BRoWQRqmko0ta0Gf78Zof85Gs/h/IR8ZA==
X-Received: by 2002:a17:902:8b8c:b029:d8:de6f:ed35 with SMTP id ay12-20020a1709028b8cb02900d8de6fed35mr1751936plb.36.1606176140364;
        Mon, 23 Nov 2020 16:02:20 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id l133sm13091945pfd.112.2020.11.23.16.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 16:02:19 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
Date:   Mon, 23 Nov 2020 16:01:52 -0800
Message-Id: <20201123160139.2.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
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
---

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
2.29.2.454.gaff20da3a2-goog

