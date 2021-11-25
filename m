Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8549945E2CC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245185AbhKYWCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 17:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhKYWA3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 17:00:29 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCB2C06179C;
        Thu, 25 Nov 2021 13:53:37 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu18so19483096lfb.0;
        Thu, 25 Nov 2021 13:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVJr77gpEIa8Ln6f/UcL4zgGfSDpE2hZ3y/G1TUsxAU=;
        b=G/EQy0KJe/9NsLEsLM0Wr0mCHcKU31I4esiYXF9+4c9lv1PZdoJ9n7WicClBi5JvYq
         tgeEDiQjUVlQ3bQdLchk61LpABjIfU6UGzIVAkYqSQjIDByldlcEBHsfd9efnUatLh5k
         AFGY6BmQW/E8tTL7pmFTFzQfx1/9KLT5ee8Iw/OXphjeLwTkYapwpXlFD/PdxpleyOp4
         FjPFzEs9JZBchf8yVdnaZ3gNARXohCXmeIRM0lGZrba1Tm6QBWvN/EmRcDqAYRIQqq/S
         zN7eQHS+Zmy2lXDQSqtyvbZN+tEqgbMdNVNKjM3otR4EvoAI/OruYkZeIqoDhFJrOXO1
         kDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVJr77gpEIa8Ln6f/UcL4zgGfSDpE2hZ3y/G1TUsxAU=;
        b=2VIvD0XMN5WyjtGKapJRcza7Hwt1R+/hRT417JaiyEmEgRw7fqnQe26Mc0j9/W+Fyg
         iF0A6Ht6om9oZ7Sa7W+5PWGd3vL590scLUFw47ohWTmtDPK/9CWlxt9Blq3VnIF7i4ub
         R/QUThNox3syGoAfHRNL7pi255bWMfJkFV3iBzqc7sFZ3oNci7icq9SYojuXtCVCEXlh
         0WW0rLBEqhITquTbXxHfPhxbbV7UEyIGTRGE8eBkHYRXicmyRdgsPqjpUBgTYbgo6kmP
         XN3dr3Oox5pV58PYzDV2HZXB1h119dMzb5Nik8kPUBN6l8taWw7SyYwYhtRpjZURDfMh
         XEiQ==
X-Gm-Message-State: AOAM533GrELRjrSw/2Nw2gjswFwXnLbNEdsKWpTES2GmlRmodprx8rzK
        ++Bsl2xdrHqD5KjRkr72tE3NdJ7GHfTATA==
X-Google-Smtp-Source: ABdhPJz/GZxIjRFQoFp6qOwdkagNuEdAKF7VFzquwQ25bln+kcdz1nHW484XxCWkwsl222IDzokBLQ==
X-Received: by 2002:ac2:5df6:: with SMTP id z22mr25919312lfq.230.1637877215416;
        Thu, 25 Nov 2021 13:53:35 -0800 (PST)
Received: from localhost.localdomain (public-gprs212807.centertel.pl. [46.134.170.136])
        by smtp.googlemail.com with ESMTPSA id c12sm341606lji.29.2021.11.25.13.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:53:35 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH v2,1/5] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
Date:   Thu, 25 Nov 2021 22:53:10 +0100
Message-Id: <20211125215310.62371-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125213451.62010-1-dominikkobinski314@gmail.com>
References: <20211125213451.62010-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for pm8226 SPMI GPIOs. The PMIC features
8 GPIOs, with no holes inbetween.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 5283d5e9e8bc..0f0102f38cbb 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1159,6 +1159,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	/* pm8150l has 12 GPIOs with holes on 7 */
 	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pmc8180c-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8226-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
-- 
2.34.0

