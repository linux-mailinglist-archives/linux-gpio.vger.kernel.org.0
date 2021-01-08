Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0001A2EF685
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 18:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbhAHRg1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 12:36:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbhAHRg0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 12:36:26 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBCBC061380
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 09:35:46 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id s21so6654512pfu.13
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 09:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fIz/eHR9LskEHw4WLLVJ7WCTAff9/EEzxkuWGjNwGgU=;
        b=WlwaqwFsYhMsqUKnT/AaL7XcehUzRYirQrcBXLWPIBWhlDag9bjYtAVro7EPZ9PGtV
         RZNU3W3lobcv+R+adPpTbkKfDnllsiSMvx1JRCSe6qbJ7FBddv4+UNY0tkPZ8OiLZxVw
         ZnELNoxN4OylGrK8KvSs5q2vNXSZLDWfTYan8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fIz/eHR9LskEHw4WLLVJ7WCTAff9/EEzxkuWGjNwGgU=;
        b=U6FmsEb9vU2UjL4tyGEiiZF8c50jyCSOsqBSQyXC5XrLR3yT7zKJpPBC0xCpdEkxZ4
         +xdtnyemdVMr+30zNf4+k9VxWUNynm0tkYnk4GLIkCeaJd5YPBnCuPFBnoEJdJZxXfbl
         8ya5u7CuE6aP0qGTC8fDr0Ln7tCOOS8zE68e4pNT1eCNug76+DSdnLZTJ2afrh2GcOUr
         GiQR+K0gsniAldErEQ/jEwhyi+UvGsQILTutO6/1l+A6rskNt3UyRMXmkD3JYoCfNYQG
         MBaK82LDPdgdmxkVIQIt5RlScicVBtjMEAh2D9yL4hKDBDUu0b81meC+72wNGMWvY81P
         5Olw==
X-Gm-Message-State: AOAM532lBdlZgJHvKmqxZB/P0180SDRYT00INHddU42zz2jS3LLmeTgJ
        q+uuHtA7E4J780+b8izajyewlQ==
X-Google-Smtp-Source: ABdhPJwgCuoXzQ8WbtRCg6+DM7Uo1SMHWPIFQGnMvfK1xRW9OJclLvCSV+xdvBG2f8r5GKEvIhmTzA==
X-Received: by 2002:a62:9208:0:b029:19e:a15f:169e with SMTP id o8-20020a6292080000b029019ea15f169emr4585621pfd.71.1610127346134;
        Fri, 08 Jan 2021 09:35:46 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id z23sm10245619pfj.143.2021.01.08.09.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 09:35:45 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
Date:   Fri,  8 Jan 2021 09:35:13 -0800
Message-Id: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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
index e051aecf95c4..1d2a78452c2d 100644
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
2.29.2.729.g45daf8777d-goog

