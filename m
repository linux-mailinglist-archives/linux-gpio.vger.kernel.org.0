Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A68204031
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 21:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgFVT0N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 15:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgFVT0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 15:26:12 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CBD5C061573;
        Mon, 22 Jun 2020 12:26:12 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id dr13so19166971ejc.3;
        Mon, 22 Jun 2020 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vOaD65bKJPMimt94w6Iz9NW+9a5Iv3mlmDas8EqB+QU=;
        b=MRugXwQO3Oyjdah+oDvGpsOeVIq44jEDMkQhxKQQDLVf6nbdcT6FtkLRGDyCwh5/KO
         oPU8iqWdzy55TDiPY0N9t+w+M5hswnCaoAoKHKBHDQ9NtLSpIQO8q1jQF2RMhIOXMV3O
         kZSIaHzHv4PzZ6kvA4t86pZmzuu41yNpMDYqXWs9IFdL+718J7v5ueoKbpd3ryZKG4ES
         GEMhRRH8FTP17ckp8I3q8BrjoPrBxpbhLER4yetAYtDM47DVGb1pZZ+/LT06+KX/KJE1
         w2BEx7fdbWaQyKcWwfY4niMqtgxRNXzCuocP6EwaPgMjgbgc0SmC1/727i7v6BcuyfTM
         XIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vOaD65bKJPMimt94w6Iz9NW+9a5Iv3mlmDas8EqB+QU=;
        b=NtshfQSQkqJ+hPVt4LRMfre3x3lT6nmb4Eh9P4T0lUdtf2PvtmT3z1zo3bhXa5IRHp
         khzEBxBEF2VfhMuS8HFlNYgaH7viersiBkDx46fPtGh4sTRVQR8GsB8vBNx4eV5/V3No
         BjA4uk1jaGonbgYIqM0KdfM6v8h5r4jaBBfNnPBuPpuhBLm9a8zGRRyQ9OLguOdKTjhf
         7/T4+QOyEpHEW1W7os6db4+086DuH0RZRjwCy16B/c8anopcusnBsYex/9SV/cG6a5PU
         K+M/CztzF95N+cvOBafvM6LQ5hbHfKURqAE085ve0RD6am8FcCV4wLwXEWqF6Bm3pBi0
         Gzag==
X-Gm-Message-State: AOAM533zIRgxmApPbV7EeO/Jjg45251lhQdNSQExc63lPGxhzMpMoVyQ
        MYab2htSlcoqv141zhP7dAE=
X-Google-Smtp-Source: ABdhPJy4puO9Nhu7zjYzK8es/M/v6VCoHxaj2ufIiMBh5WBaWdBhck36BKCtU5LpXWbAvvveKvMDyg==
X-Received: by 2002:a17:906:e2ca:: with SMTP id gr10mr7130578ejb.81.1592853971053;
        Mon, 22 Jun 2020 12:26:11 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id d16sm4043336ejo.31.2020.06.22.12.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:26:10 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/7] pinctrl: qcom: spmi-gpio: Add pm660(l) compatibility
Date:   Mon, 22 Jun 2020 21:25:51 +0200
Message-Id: <20200622192558.152828-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622192558.152828-1-konradybcio@gmail.com>
References: <20200622192558.152828-1-konradybcio@gmail.com>
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

