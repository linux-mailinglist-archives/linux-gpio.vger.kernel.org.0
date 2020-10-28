Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC3F29D550
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgJ1WAD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729374AbgJ1V75 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:59:57 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6CFC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:59:57 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id b138so466690yba.5
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SLwuvMzZvnnRNQP9we9x59FzXelhwfghvGsrUjCw4VU=;
        b=RhHG4HNLIvQOsKCKHMFdQG5fs/Mi3bnrL+uhZVtOtEPwgm7l8Kvlgq5+7bAAIJDIZy
         Ws2PXYZVCaUR12gMSyaiAYhIMDvGbUlv+Ej83F2O+nIySiFW2fsYHQrp12w//YPSzbf7
         xb36K+7+JCa5forimaubJnMEPqQAeU7CqhIiejJE7uke9RLQ6+Y22KO0G5TUzIcvFIZD
         k4NFqDjN7dU+7PuIZJJkzVKtD4Uqx5xauUIjz70dJvYImXDu3e3R0eYdu4Wiq4wKtD5E
         GRwSgaI4X2KVd+3wdqacGA2Pm3CzZFP8WdyZY4h9llIGUaSqJYZ8u0GfZeL4AbYPP0tJ
         6zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SLwuvMzZvnnRNQP9we9x59FzXelhwfghvGsrUjCw4VU=;
        b=fSn+OVAkyQB3CXVpZfHQD5OLqYx3Z6Vo5kZEWyasjkV4lMmiqAvY5uUbNBKXC+LJLa
         NJ3xajIWLdaq0JPmZx8VDdY2SSN3mb6Mlsc16Gw8nmfygB58Ul7ajzVNhD98jzqHnoEJ
         ksqNOa7YBC1Yr4nLyA9g+zTDS9To09Z7B3w7c/NcN8v22ygk9gkbbuehHuBvYmagvst+
         e5SSbbootRM6xJOTKHIgRgNrWY8yBugOSKMBhISzp14qEmvfoARrtin8Nvmu3xE6ud4t
         gDUk1Y49PhQNubvbdc+ouEIaB4PS8FRnLWCnmNCSM5NCkxfP1TK1NUFg6edhY6L8y6Rl
         rbwA==
X-Gm-Message-State: AOAM532vMVoBi96tEGh90kmQjlSuHxTXr83sS06zNRowxUobHvKrCXFp
        nVeqt53VG59Zwe97c4uM/5KwwR7P4XiMeQ==
X-Google-Smtp-Source: ABdhPJzcQn+pi4scFs4Et0ODIMxdwgv+wQwl2Usiplw+seac0umWnfV8DesXaeFja8jdkurmnB1XQg==
X-Received: by 2002:a05:6830:1e70:: with SMTP id m16mr5395840otr.51.1603898412480;
        Wed, 28 Oct 2020 08:20:12 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h6sm2708389oia.51.2020.10.28.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 08:20:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] pinctrl: qcom: sm8250: Specify PDC map
Date:   Wed, 28 Oct 2020 08:20:40 -0700
Message-Id: <20201028152040.1142473-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Specify the PDC mapping for SM8250, so that gpio interrupts are
propertly mapped to the wakeup IRQs of the PDC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Resending this as it didn't seem to have hit the list.

 drivers/pinctrl/qcom/pinctrl-sm8250.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index 826df0d637ea..af144e724bd9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1313,6 +1313,22 @@ static const struct msm_pingroup sm8250_groups[] = {
 	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sm8250_pdc_map[] = {
+	{ 0, 79 }, { 1, 84 }, { 2, 80 }, { 3, 82 }, { 4, 107 }, { 7, 43 },
+	{ 11, 42 }, { 14, 44 }, { 15, 52 }, { 19, 67 }, { 23, 68 }, { 24, 105 },
+	{ 27, 92 }, { 28, 106 }, { 31, 69 }, { 35, 70 }, { 39, 37 },
+	{ 40, 108 }, { 43, 71 }, { 45, 72 }, { 47, 83 }, { 51, 74 }, { 55, 77 },
+	{ 59, 78 }, { 63, 75 }, { 64, 81 }, { 65, 87 }, { 66, 88 }, { 67, 89 },
+	{ 68, 54 }, { 70, 85 }, { 77, 46 }, { 80, 90 }, { 81, 91 }, { 83, 97 },
+	{ 84, 98 }, { 86, 99 }, { 87, 100 }, { 88, 101 }, { 89, 102 },
+	{ 92, 103 }, { 93, 104 }, { 100, 53 }, { 103, 47 }, { 104, 48 },
+	{ 108, 49 }, { 109, 94 }, { 110, 95 }, { 111, 96 }, { 112, 55 },
+	{ 113, 56 }, { 118, 50 }, { 121, 51 }, { 122, 57 }, { 123, 58 },
+	{ 124, 45 }, { 126, 59 }, { 128, 76 }, { 129, 86 }, { 132, 93 },
+	{ 133, 65 }, { 134, 66 }, { 136, 62 }, { 137, 63 }, { 138, 64 },
+	{ 142, 60 }, { 143, 61 }
+};
+
 static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
 	.pins = sm8250_pins,
 	.npins = ARRAY_SIZE(sm8250_pins),
@@ -1323,6 +1339,8 @@ static const struct msm_pinctrl_soc_data sm8250_pinctrl = {
 	.ngpios = 181,
 	.tiles = sm8250_tiles,
 	.ntiles = ARRAY_SIZE(sm8250_tiles),
+	.wakeirq_map = sm8250_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sm8250_pdc_map),
 };
 
 static int sm8250_pinctrl_probe(struct platform_device *pdev)
-- 
2.28.0

