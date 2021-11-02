Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3EF44261C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 04:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhKBDnz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 23:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhKBDny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 23:43:54 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72120C061764
        for <linux-gpio@vger.kernel.org>; Mon,  1 Nov 2021 20:41:20 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id n11so19925528oig.6
        for <linux-gpio@vger.kernel.org>; Mon, 01 Nov 2021 20:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aeZGOfwwnFzjEn/W/1IOfg4SXRk/9i0vOOQaYvl2ndc=;
        b=UlCdNN5fyuaVmrMcVZwRynpyFuMMAvOz6hBPX7fFsLAGRegSla/Elu0CEijN1t4CrX
         CAoP+QCZjORGaSrKOTxbRim1oQaIul3RNKQ4AcFnYYEDzJiAXH1EZRmbuKtHeCgU/ptm
         Yaxas7oF/k0bu4aJsI8FDgljOX80SNLGw++HfP/fZnCevLAx3NukDvKyAXCpF3euBG/f
         1UKBuU5nWgomT2vM5ERpEj5Or7RwUEklu/WrKHJqrvLiKkxP9xsUAjVAPHbYoLALI1wJ
         7tRjfTOXcT2b+4ikmV8vo3pFqUG+zVTBPxw6eU1hbL8mkWPmh9aGiyHL3tn1BOhocS97
         dGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aeZGOfwwnFzjEn/W/1IOfg4SXRk/9i0vOOQaYvl2ndc=;
        b=L+cG5/eftbRj+B/W5a2Ji34faszDf8+LijBxE19mi/oaZQHyYTeuVFrFSLpnLQWANZ
         EIxcjn24F/GRtc2AV/IhTNv7/fQquLT5GJo2jEPcDMONOfb5FnFPdUiO48RuegavF1wf
         LrkMeJpupYfVyGQRms5Dqql3wC4CZ7EJr1hcF6llJxEjiwUEFjiqOnd7XRcQ5yVp1vpP
         DECNK4/Q4wUfzUuMh0CDUZuyZlG2M1xzOKXrR6U0yszNXuNpOKJgr3F1YUDIEMfAavp1
         sEafMdl9h0n5yHNX8LVwGyLRaFLjSwWxP5xLpafwS6L/qHuoJzhgD3hmVAnWZ3ZJjVCv
         MOKQ==
X-Gm-Message-State: AOAM530w/eYQKIMfB1Uj70MOS5SiYDVqdIrcYqJqpxuxe9USYIwP6xCR
        +yAOYfi56YrDAfpugHxEjtbGsw==
X-Google-Smtp-Source: ABdhPJx+RCmVwj69D0ICqYXKngVu1j5eL6YiF7/5ZN2bAOqo1Fb4oR71luDyk8FVgAYW8XPOS6I8bQ==
X-Received: by 2002:a54:4499:: with SMTP id v25mr1167313oiv.71.1635824479610;
        Mon, 01 Nov 2021 20:41:19 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r21sm3900916otp.55.2021.11.01.20.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 20:41:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: [PATCH] pinctrl: qcom: sdm845: Enable dual edge errata
Date:   Mon,  1 Nov 2021 22:41:15 -0500
Message-Id: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It has been observed that dual edge triggered wakeirq GPIOs on SDM845
doesn't trigger interrupts on the falling edge.

Enabling wakeirq_dual_edge_errata for SDM845 indicates that the PDC in
SDM845 suffers from the same problem described, and worked around, by
Doug in 'c3c0c2e18d94 ("pinctrl: qcom: Handle broken/missing PDC dual
edge IRQs on sc7180")', so enable the workaround for SDM845 as well.

The specific problem seen without this is that gpio-keys does not detect
the falling edge of the LID gpio on the Lenovo Yoga C630 and as such
consistently reports the LID as closed.

Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index c51793f6546f..fdfd7b8f3a76 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1310,6 +1310,7 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.ngpios = 151,
 	.wakeirq_map = sdm845_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(sdm845_pdc_map),
+	.wakeirq_dual_edge_errata = true,
 };
 
 static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {
-- 
2.32.0

