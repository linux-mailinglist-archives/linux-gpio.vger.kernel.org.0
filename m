Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA79203122
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgFVH6A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgFVH56 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:57:58 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06FFC061794;
        Mon, 22 Jun 2020 00:57:57 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id mb16so17046085ejb.4;
        Mon, 22 Jun 2020 00:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vOaD65bKJPMimt94w6Iz9NW+9a5Iv3mlmDas8EqB+QU=;
        b=eOwq3qHLmGL+p2E8c8xuZ669C5ZqpUlnUYF/k0oaDale13WusfNZrJIBH+YKhJqPm+
         /fcWnyHgDW4T6doT2YK55zbdaURSM80sjMoFS1p4vWgGU8pFbUs2opwKz8j93B3TtPsW
         SGr0eZirk42PfyPkEJtSP1oS1znPu6mzEDFeEww4/dK2oLunAw0L2Kd/A/uBKcAWoobi
         9nDlZEs+rAfnpBxIf7ng9Blg+4rNKnLlYDQhyEYa18u1IPMI7QMAe56gpL/MKf+fhB2p
         8SwOdaRkWdiQnp2XWqkltjlruUFeazqyRLcQtTppWSqX8JgoSdAkSjY4ifDRDEMhErKF
         zSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vOaD65bKJPMimt94w6Iz9NW+9a5Iv3mlmDas8EqB+QU=;
        b=teYghI4fM+Jat0U83qqRXLcE/ZEZGcYoVP9vupLsQImmKDiEjVzXGQPfeB8ltuZe01
         5ISOP/YPfwT6i+KXF1Nqen/GpbjkMilH/4qYFG3w4uZ4kQOlKF919NZo23P1BX3sMpHa
         ITxpL/+5Dx247gJp2VULJyMrR0z1MySpMarGWshBRxZ5krehFIc/NjRvsILMsC55KPUW
         gDq9vOlZPrAdVMS7/gfB9zdQFBB03N2yCOkhPTpI79fqKH0dfhloJGAYS5HNaqQy2v0M
         L56L4XeJq7rn6znNzJaaoh99ymM+wo3QYA+VZYoNfK431s4lGow+EinsJ5RzQXRuD6AO
         ahCw==
X-Gm-Message-State: AOAM531XMgBoxqD8s/IV+BWma8Nd57FIpDVeoZxJCg0EX0CPcJQaPXcm
        Q4Igr/7SKHIO8HN9yCjVqUjzZQ3H7Jo=
X-Google-Smtp-Source: ABdhPJy3uKhTAViWQ20r2lR/B7mHsl6AVgqzcMMhn8sGhINrbf9NHXNAaHZX/pFT15DNhRQicetReA==
X-Received: by 2002:a17:906:90cd:: with SMTP id v13mr2829181ejw.247.1592812676754;
        Mon, 22 Jun 2020 00:57:56 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id b4sm10511606ejp.40.2020.06.22.00.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:57:56 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/8] pinctrl: qcom: spmi-gpio: Add pm660(l) compatibility
Date:   Mon, 22 Jun 2020 09:57:39 +0200
Message-Id: <20200622075749.21925-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622075749.21925-1-konradybcio@gmail.com>
References: <20200622075749.21925-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for pm660(l) SPMI GPIOs. The PMICs feature
13 and 12 GPIOs respectively, though with a lot of
holes inbetween.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index fe0be8a6ebb7..95ca66e24e7c 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1118,6 +1118,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
 	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
 	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
+	/* pm660 has 13 GPIOs with holes on 1, 5, 6, 7, 8 and 10 */
+	{ .compatible = "qcom,pm660-gpio", .data = (void *) 13 },
+	/* pm660l has 12 GPIOs with holes on 1, 2, 10, 11 and 12 */
+	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
 	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
-- 
2.27.0

