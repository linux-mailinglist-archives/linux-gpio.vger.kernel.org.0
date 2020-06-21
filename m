Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64DF202D37
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730838AbgFUVii (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730811AbgFUVih (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:38:37 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7D7C061795;
        Sun, 21 Jun 2020 14:38:36 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id e22so1393379edq.8;
        Sun, 21 Jun 2020 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nzouIcqNeHmwTME7jVaUjFBAtS8z2sOjc/dsKSoeppE=;
        b=Nyj911siu9dLwcURrkAGn8AqGDBMLdun4vj2BO/+KSR92oT2+Hjb+qpgcV5QiyPP1q
         DknOejgADOjn8caVmy43xurt9daEIASfezTqBfvJv3JbJpAD00ynFHLIZ+RKfsi2ne6Q
         WsTsSJI6BCJZGVrOyWT6Lxp1PTq8kN93os0moLZPhh9sbSg7ig5IAPzwRCsykKm/QYu6
         LMKax/+FnHxRsYU2MPrL2SzUZGWt9NIHYmYFmyobP2NJ05GD38b+2eBDh51Skk4nZwGt
         tfvNuIzzts9MjbXV8hym12GmOQifY5mtROndR8E5oHKjBoiLBTpKVMzGPuXigb7CmCvz
         pejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nzouIcqNeHmwTME7jVaUjFBAtS8z2sOjc/dsKSoeppE=;
        b=Zm9lW/mWDSwrRsnsCK88t5+q3yGZlK5qxSYHACtYaJZxRXaYdfRwM8VLtGt0Cd+Fr6
         Kof1Onh7UWmWBn5fg/5uiteBFF2/YLtMooi6NozeNKS5Dh2BLxTdlFKTfTHwPBLlUPPL
         3vPSSE6r+MZ/m27zzLZ7FpoVZL9r9lFpmf3DkK+YSYYcj3VWOdoOVjHwetESm6O/Ba9f
         PsCDUmo6WdIOcyRylnI6TVfFyP6b4m6VmgwajHKqhR5hw5UkbZWHtYDPi6PCIDVRqcy+
         S+wss2Gbcncp4Hn45lb0mwpE39RVfgg1GRa4zWEUXI1OJ955/Od5SU1xT3RegY3VXlJu
         89dg==
X-Gm-Message-State: AOAM533oC/xMHg/njmJ5QKxJavVz9g6rsMUENjYrtQwOs0mCSxo5U5ag
        lMC9w2oOAWtOMp4mAViCDeY=
X-Google-Smtp-Source: ABdhPJzYlHqpU5x74Vh8tehIGsqfJ9Wl0CPmHi1JaJTn0+q8U/bOPRdCkausY0w6VsejRnLMi+qWNA==
X-Received: by 2002:a05:6402:206e:: with SMTP id bd14mr14246042edb.105.1592775515544;
        Sun, 21 Jun 2020 14:38:35 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id w3sm10130012ejn.87.2020.06.21.14.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 14:38:35 -0700 (PDT)
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
Subject: [PATCH 3/8] soc: qcom: socinfo: Add socinfo entry for SDM630
Date:   Sun, 21 Jun 2020 23:37:59 +0200
Message-Id: <20200621213806.551879-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621213806.551879-1-konradybcio@gmail.com>
References: <20200621213806.551879-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds missing soc ID for SDM630.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 5983c6ffb078..705f142ee588 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -202,6 +202,7 @@ static const struct soc_id soc_id[] = {
 	{ 310, "MSM8996AU" },
 	{ 311, "APQ8096AU" },
 	{ 312, "APQ8096SG" },
+	{ 318, "SDM630" },
 	{ 321, "SDM845" },
 	{ 341, "SDA845" },
 };
-- 
2.27.0

