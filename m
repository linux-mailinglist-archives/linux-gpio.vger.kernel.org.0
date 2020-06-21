Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5618D202D16
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730780AbgFUVic (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgFUVib (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:38:31 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B89AC061794;
        Sun, 21 Jun 2020 14:38:30 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dp18so15988291ejc.8;
        Sun, 21 Jun 2020 14:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vOaD65bKJPMimt94w6Iz9NW+9a5Iv3mlmDas8EqB+QU=;
        b=ZfRvOks8x4eZKFmfE5Tv5fnxiJyIVChgDMdjNtBw12PjfWwrFldU8WqcrGpDwf+/WL
         hfKvZ7u9Xq8/pA5lCLtCqR6hXy9YlrBhOyDyOu3O5EIYJkjpGsdJT6o4r7Wo4tdb+uYZ
         Z3NgGjV7qrxHLoiaxg4rO7R0s4XPFr4mh5uztKCQiac2ngKnfVMkdDwMig8ROS9tU5mY
         Nm3kROG6j4afGYwIYjBmM8+b/RW7y2Vya1e7WtCpm7sNlpOwGhEdjW0urESHGmqJyTyt
         SropEABhi92hQescEeipy6QdeJ6n9qNViix04s0BNxsqcyi3g7THxe5OWaOZ9+Svp1lT
         Bviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vOaD65bKJPMimt94w6Iz9NW+9a5Iv3mlmDas8EqB+QU=;
        b=LxK2pEOr44AzV1JEZIfCt8ArRpllgLxlW9HEWAibwcH8IgpVece0jJrSvBSg0BbGkF
         3CP+Sj1JmfN+Bwsi2AzDk1HAyeySrnQW6Pinv/gM/dQ5X9awO915sQmOnjRCONMM/TNd
         ypbh0ea4uzU2xutSaFKbYLp89FTLclRkqXrAD3ODALs6HL0CbRB1x3rbo3BkQ929DZb+
         SGvDtptSYcZV0MX+k9VxwT7sJ8VOOAgFBIUmaOti2PcojspEAi0QzV0lHTTDyDHOUYWk
         Qywvs6ZDd87kYX4lqdUr9My82Eusn627z2KEkhwLRAtoe4KQjMTxTEU0/klI9LiiRZ/L
         PcjA==
X-Gm-Message-State: AOAM530dlkYtF2iq9NpO8J49g8e5LspGYDQvGZqHNZ9N8GIsjyLQ62hN
        TL9eTEjg2m/sbnvxu6ZOBew=
X-Google-Smtp-Source: ABdhPJz/nnnl5zmqsFoq4flJnMi5EIIlb4LFRwTyHnFT3p6gshsTe31aCKAx09uZGFUoGUTAL9JkCA==
X-Received: by 2002:a17:906:73db:: with SMTP id n27mr12915388ejl.16.1592775508804;
        Sun, 21 Jun 2020 14:38:28 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id w3sm10130012ejn.87.2020.06.21.14.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 14:38:28 -0700 (PDT)
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
Subject: [PATCH 1/8] pinctrl: qcom: spmi-gpio: Add pm660(l) compatibility
Date:   Sun, 21 Jun 2020 23:37:57 +0200
Message-Id: <20200621213806.551879-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621213806.551879-1-konradybcio@gmail.com>
References: <20200621213806.551879-1-konradybcio@gmail.com>
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

