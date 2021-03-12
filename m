Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552CF33846F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 04:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhCLDld (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 22:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbhCLDlP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 22:41:15 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DA5C061762
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 19:41:14 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id j20-20020a4ad6d40000b02901b66fe8acd6so1216709oot.7
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 19:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5yFgJ7GNzCdl3iz/LbbZhQ4yHwcT34AJuTdiL69mvWE=;
        b=HJn0dbcu7M0jqNWWVsXo9wgI0LF6Vf1Sm2PLlVEQvLtec3DGrpkSy6/ofprpIZtqr0
         gga5ZMzIUPlqSfzaSk15bWLouzUIdKn60z7hfuc/4fYz3oXaMMMaReRYSBtOPj3a6rjd
         pVCEDEPNxcuFDxHJdGtqqE5fi36RJv9Qw8vyDAf74rTCUrXE5+DJT+hHJwax5tSLGH0c
         XXf4bXM7hCRnYlnoElLYH64Mqz/ffV/gQYzMAKCOOFOcd5fdbnx+3NkKy2Z5T57JIzWu
         dXfH1xlGVIFLncUVL21v+7Ta/9TzdNQIC/H0uzTRGIurypVH0mMxyGqh0ry+SUMa4PbT
         4NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5yFgJ7GNzCdl3iz/LbbZhQ4yHwcT34AJuTdiL69mvWE=;
        b=tDN54VxGe9+JcJH62LXRCLbgTN+SinLxk1QBCQF5Ur6YfDIpzEKR6mfsev0yL9dcZq
         0a1yM6nFQ5wwP7AYxtX6EdRIBvW92qweI9T9TVVLOiCmEqnTDqXVPAqBjGN54IeZKOZg
         j2Qrap7fNiGoU2SYRHfGs+FBQAjpSVkr40JRi5SkadYhhc8x6VKYrQcNajtnqFh9xyyR
         PLx5xYqVrGSzn8P+D1NOL+hDah7CFxxnXqXhOzG5a+ddQfOp5jMiSjmWut3m0vs6FKzD
         zPtW3HgYXOlGu9fmvdQOb8ig7uQQJKqdfyzOEgQ4Fqn80QhDR8/K7w1Q3+9kpFg2IHrl
         smfQ==
X-Gm-Message-State: AOAM530encDAN+BJi1BmAtDBtHQW+v6wOtgq9NL5+u3bcljdeCrm0Kix
        Uft3rahKlsILpgubC7HiYATvKg==
X-Google-Smtp-Source: ABdhPJwtPHp/ZHLKHAgHpB/hhCguiU2sdSpdgd3vyIjZ50ITdVqZ1yMBFYVkk9Ie5Yvh9sv4Oo4IwA==
X-Received: by 2002:a4a:c706:: with SMTP id n6mr1733410ooq.19.1615520474221;
        Thu, 11 Mar 2021 19:41:14 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 18sm376829oir.4.2021.03.11.19.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 19:41:13 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Subject: [PATCH 1/2] pinctrl: qcom: sm8350: add GPIO wakeup interrupt map
Date:   Thu, 11 Mar 2021 19:42:17 -0800
Message-Id: <20210312034218.3324410-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lina Iyer <ilina@codeaurora.org>

GPIOs that can be configured as wakeup sources, have their interrupt
lines routed to PDC interrupt controller. Provide the interrupt map of
the GPIO to its wakeup capable interrupt parent.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm8350.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
index a406ed0ec7d3..4d8f8636c2b3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
@@ -1603,6 +1603,25 @@ static const struct msm_pingroup sm8350_groups[] = {
 	[206] = SDC_PINGROUP(sdc2_data, 0x1cf000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sm8350_pdc_map[] = {
+	{ 2, 117 }, { 7, 82 }, { 11, 83 }, { 14, 80 }, { 15, 146 },
+	{ 19, 121 }, { 23, 84 }, { 26, 86 }, { 27, 75 }, { 31, 85 },
+	{ 32, 97 }, { 34, 98 }, { 35, 131 }, { 36, 79 }, { 38, 99 },
+	{ 39, 92 }, { 40, 101 }, { 43, 137 }, { 44, 102 }, { 46, 96 },
+	{ 47, 93 }, { 50, 108 }, { 51, 127 }, { 55, 128 }, { 56, 81 },
+	{ 59, 112 }, { 60, 119 }, { 63, 73 }, { 67, 74 }, { 71, 134 },
+	{ 75, 103 }, { 79, 104 }, { 80, 126 }, { 81, 139 }, { 82, 140 },
+	{ 83, 141 }, { 84, 124 }, { 85, 109 }, { 86, 143 }, { 87, 138 },
+	{ 88, 122 }, { 89, 113 }, { 90, 114 }, { 91, 115 }, { 92, 76 },
+	{ 95, 147 }, { 96, 148 }, { 98, 149 }, { 99, 150 }, { 115, 125 },
+	{ 116, 106 }, { 117, 105 }, { 118, 116 }, { 119, 123 }, { 130, 145 },
+	{ 136, 72 }, { 140, 100 }, { 151, 110 }, { 153, 95 }, { 155, 107 },
+	{ 156, 94 }, { 157, 111 }, { 159, 118 }, { 162, 77 }, { 165, 78 },
+	{ 169, 70 }, { 172, 132 }, { 174, 87 }, { 175, 88 }, { 177, 89 },
+	{ 179, 120 }, { 180, 129 }, { 183, 90 }, { 185, 136 }, { 187, 142 },
+	{ 190, 144 }, { 198, 91 }, { 200, 133 }, { 202, 135 },
+};
+
 static const struct msm_pinctrl_soc_data sm8350_tlmm = {
 	.pins = sm8350_pins,
 	.npins = ARRAY_SIZE(sm8350_pins),
@@ -1611,6 +1630,8 @@ static const struct msm_pinctrl_soc_data sm8350_tlmm = {
 	.groups = sm8350_groups,
 	.ngroups = ARRAY_SIZE(sm8350_groups),
 	.ngpios = 204,
+	.wakeirq_map = sm8350_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sm8350_pdc_map),
 };
 
 static int sm8350_tlmm_probe(struct platform_device *pdev)
-- 
2.29.2

