Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFDB74BCFC8
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Feb 2022 17:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240910AbiBTQYf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Feb 2022 11:24:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239743AbiBTQYe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Feb 2022 11:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5FD023466D
        for <linux-gpio@vger.kernel.org>; Sun, 20 Feb 2022 08:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645374252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=d7oGhO9RyJk651w44fYWCTKKiFIXgihgwU/ZZMuQImo=;
        b=hHzs+cS5l1QKzwRGrqxmzHSjA3zXDC+RKonnu0lZRq6ET1JxCtbA+QF3ruEyTRo6P/S+To
        Tjbpa0VdLdL+xe+JTN65Nj2cJDgQV9PUs3AfV/d3miKP3go97o//5EIFnWHEGiSbRA4Z3a
        NzD54S0r505isk77qtu4u5Jq48B2LB8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-Eod6PhkiNhOzSwPnOOeUzg-1; Sun, 20 Feb 2022 11:24:09 -0500
X-MC-Unique: Eod6PhkiNhOzSwPnOOeUzg-1
Received: by mail-qv1-f70.google.com with SMTP id w14-20020a0cfc4e000000b0042c1ac91249so14522133qvp.4
        for <linux-gpio@vger.kernel.org>; Sun, 20 Feb 2022 08:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7oGhO9RyJk651w44fYWCTKKiFIXgihgwU/ZZMuQImo=;
        b=VSIhQkEDksNSr2Zu83e1e3/VWZKcC4mPkaoM712keyOzm/ejezSVlwidTQP9r+m0Cp
         +RyD2hkG83tt4E2DZFtfXdHSkoMrhxsKAaPspYYId2Oc1OpqPrMepCemFDMqNleSBUKh
         ljQ51FdCEieEngXI1W1y/RSGI5mSSvI3NVRyoLV+nRtSMzyMH8Zf9LbBBIvKmgHDFjSl
         4LqP5OT1NgFb6GU2rRLyp46H7mFjnPLUt8z5qLhHcLSpYmUOMNjMnAvTqI3oOljMQLPa
         2+7M8/E3Zxp4nIvaHv6lIJDYR82e50pjs3DUdhOXvJfFEXh2KqYANw0FzAtUZw3DPrHD
         xDPg==
X-Gm-Message-State: AOAM530bToWs/qYFJnLRQHs9aOoKncB4Xlt/sAJTObdL3QS9rsMOpiJe
        bOzXXRnSCBfOLvjBsznxQbnbNjAnnq5cJQW3lXL9T/bsDMXTkbBhgqxm3FzhjWjglnwNwNIivNF
        NEYgtOdI93s/At/9R1GNbmA==
X-Received: by 2002:a0c:fc50:0:b0:431:3e78:f804 with SMTP id w16-20020a0cfc50000000b004313e78f804mr5799828qvp.5.1645374248865;
        Sun, 20 Feb 2022 08:24:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHutj+g27l213biSSVVZndnba7CvMojImSbm/9g8kjNOd1RFaH/9D5dybPfgy6nWfSam0jgA==
X-Received: by 2002:a0c:fc50:0:b0:431:3e78:f804 with SMTP id w16-20020a0cfc50000000b004313e78f804mr5799814qvp.5.1645374248631;
        Sun, 20 Feb 2022 08:24:08 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id b14sm3221980qtk.44.2022.02.20.08.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 08:24:08 -0800 (PST)
From:   trix@redhat.com
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] pinctrl: qcom: cleanup comments
Date:   Sun, 20 Feb 2022 08:23:55 -0800
Message-Id: <20220220162355.3594831-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Add leading space to spdx tag

Replacements
voilates to violates
sepearte to separate

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 4 ++--
 drivers/pinctrl/qcom/pinctrl-sm6125.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index 0d9654b4ab60..6bec7f143134 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -1622,8 +1622,8 @@ static const struct msm_pinctrl_soc_data sc8180x_acpi_pinctrl = {
 };
 
 /*
- * ACPI DSDT has one single memory resource for TLMM, which voilates the
- * hardware layout of 3 sepearte tiles.  Let's split the memory resource into
+ * ACPI DSDT has one single memory resource for TLMM, which violates the
+ * hardware layout of 3 separate tiles.  Let's split the memory resource into
  * 3 named ones, so that msm_pinctrl_probe() can map memory for ACPI in the
  * same way as for DT probe.
  */
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6125.c b/drivers/pinctrl/qcom/pinctrl-sm6125.c
index 724fa5a34465..170d4ffbb919 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6125.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6125.c
@@ -1,4 +1,4 @@
-//SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 
 #include <linux/module.h>
 #include <linux/of.h>
-- 
2.26.3

