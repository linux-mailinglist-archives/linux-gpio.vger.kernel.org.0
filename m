Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6356F4261C6
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235472AbhJHB1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236131AbhJHB13 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:29 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E107C061760
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:34 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id r19so30680449lfe.10
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l105OhexlN6YNfKbmvTA4DJELYmmbABapWIiAJPQyxM=;
        b=y/co2dD2esQ18LGntt0gVHDGfAXcFRT6rLMVqTGdfs+AXzJavXcu4tAN+RYErFH6Dz
         2XXGOdR25b2SE8d/tedvc/KOoKcWXmUjt3uzrII9fFB9g+TUNgA0cbJkyhOchnwIX6Uy
         swz/6suR0pd0O2jPFW7hDf6uR7KnqiW87WZBKJZ/g3EvracbfQHwebvpgibhlqnbhNLw
         k3E+BdHTo5sC+c4Pqn3jSneKCiOfX9giusz7vyMN9zwTuBCeJiXa6NM066HXo7SaRwWZ
         MtZMPo356KBZO5F09lb5vK4cXqFshiXb756qfkceMaLIegimsVYL9EBIWjDkSj3rXbbN
         liZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l105OhexlN6YNfKbmvTA4DJELYmmbABapWIiAJPQyxM=;
        b=idBNbdObmg2wXwB9pTCVXME3kxFbA6ywI7WS3l5HwgP2/B7iF5ubXOPB6OC0WjW+Px
         QyOIFP5KA9TS8hRB5Wt8Ez6RCtuYzu3S8e0eTW01y6Ob/3gImx/wYtSd2S0pg1aboGPw
         PGghXM4MjZ2U15B71UrhSYStV+A9AAaRNj8QuMVDIf6VrKVrRAOPlWSnSmwdPpPugIsP
         T8VuFh6HOoFv1NKsoObYLV5MmwIg7bKeGsFrz1N6IDBKDI4/6i9H/eLnvdD8Ks0V4ZLd
         8JMq62QMnDqXlhF6TUH5H5lkxSMjCID4ib3PTRISZR4zej2CRkzTgBENeaAi8ub3IEBc
         mytQ==
X-Gm-Message-State: AOAM5320erkzRfBobynl67L6w0Y4kd1qfxaLkcgrBzae25uWHhk9eejj
        kw7HBy2NwuN609p29DKrMwsWNA==
X-Google-Smtp-Source: ABdhPJwopk30Bc926Mud4VJWcurop+dtnSxECkNEljaY0psvnPvu55RmvcNzZgPlZkT5eE4USvGsvQ==
X-Received: by 2002:a05:651c:1589:: with SMTP id h9mr364343ljq.151.1633656332732;
        Thu, 07 Oct 2021 18:25:32 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 07/25] ARM: dts: qcom-pma8084: add gpio-ranges to mpps nodes
Date:   Fri,  8 Oct 2021 04:25:06 +0300
Message-Id: <20211008012524.481877-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add gpio-ranges property to mpps device tree nodes, adding the mapping between
pinctrl and GPIO pins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-pma8084.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-pma8084.dtsi b/arch/arm/boot/dts/qcom-pma8084.dtsi
index e921c5e93a5d..fcee2afe6740 100644
--- a/arch/arm/boot/dts/qcom-pma8084.dtsi
+++ b/arch/arm/boot/dts/qcom-pma8084.dtsi
@@ -42,6 +42,7 @@ pma8084_mpps: mpps@a000 {
 			reg = <0xa000>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pma8084_mpps 0 0 8>;
 			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
 				     <0 0xa1 0 IRQ_TYPE_NONE>,
 				     <0 0xa2 0 IRQ_TYPE_NONE>,
-- 
2.30.2

