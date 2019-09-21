Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFFB5B9D59
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2019 12:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407498AbfIUKMZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Sep 2019 06:12:25 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43679 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407499AbfIUKMZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Sep 2019 06:12:25 -0400
Received: by mail-wr1-f68.google.com with SMTP id q17so9115631wrx.10;
        Sat, 21 Sep 2019 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/YLFnT7jeM7N62aPlQui6fZMwjoWInLqwWkHnwPmpAU=;
        b=gUhi6edCMRDXCwEQpiXs9K/6D2ko1gG28kTlPWUtlSs66KfXqRVu4bJbRIlp2+IbcO
         17eT5IUY7lzfAEDDB/ElrFJp6Np/Ba6/fy2DY9J1igaJfWrlVHDI+Justn6wGc5hno9a
         ZhXli7NpemZk8cMIuWWrdPByGjJnODR4fvjp8h60zmc/SKLBx9VGKnZZM/LmSXU1UzKJ
         rw+pPuPjGEhD4DDxvfSHz3O0gb1Lj3Z5yQHyWMuDAxUnWLR93H9nUF3y0yvS9m7geMBa
         NVFg5ldh9YdxftMsrFYHHcpoNiw4BZia8HW9oP320K+CDDUmvybvS/CL8Dp+Xizl1o0N
         3tbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/YLFnT7jeM7N62aPlQui6fZMwjoWInLqwWkHnwPmpAU=;
        b=owtQZ02Lj/z9e1Il8YwP6KVZYAguvL3OIszCXoW6zgoGrceQXxaEA+bgyVsqQfd9Vp
         PfnwevzpMLjAjslHhSRJz0sZ5PL6bAbsAAvKjbu7cA1b3oCA97Ir1xRkTs9MiACqT9ow
         fzviDHkA8RzUcHJ4DbJ1Ni9cXZRQIwhd8/GhdJYP6yCKZVaEyISGy+l0TW8EDQQO9Nlb
         U9mvN9zFgWe8SSeTxRD95gCW7hcQwN18p5bhEhM4+lBZiRZ//pUt9B0WFmE7kNbfsLAT
         sXBA0uqcflfmDznYgEEFOokK29eRgZ01Exdz6QNA/4qmV0TwB5Ss00/viY0aBnUVE0ei
         dcmg==
X-Gm-Message-State: APjAAAV3n7u63CLUask9DHmX0xAoPS8PJLLPgYvNsXocCKYxWeFtKrfg
        fAnBQIHdjf9Agcaj+ASLrsum7tW/+o8=
X-Google-Smtp-Source: APXvYqwH97vurSxnGBBuJCCvU0U+PGB1sOD7georAHWmAxl9A5zC4NcQSy7Cw/dc8Yw0xQX5S34Ojg==
X-Received: by 2002:a5d:428c:: with SMTP id k12mr15356463wrq.196.1569060742602;
        Sat, 21 Sep 2019 03:12:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id l1sm6129262wrb.1.2019.09.21.03.12.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:12:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 5/5] soc: qcom: rpmpd: Add rpm power domains for msm8956
Date:   Sat, 21 Sep 2019 12:12:07 +0200
Message-Id: <20190921101207.65042-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921101207.65042-1-kholk11@gmail.com>
References: <20190921101207.65042-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

The MSM8956 SoC has two main voltage-level power domains, VDD_CX
and VDD_MX, which also have their own voltage-floor-level (VFL)
corner.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
 drivers/soc/qcom/rpmpd.c                      | 23 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        |  8 +++++++
 3 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
index eb35b22f9e23..30176b1e595a 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
@@ -5,6 +5,7 @@ which then translates it into a corresponding voltage on a rail
 
 Required Properties:
  - compatible: Should be one of the following
+	* qcom,msm8956-rpmpd: RPM Power domain for the msm8956 family of SoC
 	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
 	* qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of SoC
 	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 3c1a55cf25d6..b50f62851461 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -115,6 +115,28 @@ struct rpmpd_desc {
 
 static DEFINE_MUTEX(rpmpd_lock);
 
+/* msm8956 RPM Power Domains */
+DEFINE_RPMPD_PAIR(msm8956, vddcx, vddcx_ao, SMPA, LEVEL, 2);
+DEFINE_RPMPD_PAIR(msm8956, vddmx, vddmx_ao, SMPA, LEVEL, 6);
+
+DEFINE_RPMPD_VFL(msm8956, vddcx_vfl, RWSC, 2);
+DEFINE_RPMPD_VFL(msm8956, vddmx_vfl, RWSM, 6);
+
+static struct rpmpd *msm8956_rpmpds[] = {
+	[MSM8956_VDDCX] =	&msm8956_vddcx,
+	[MSM8956_VDDCX_AO] =	&msm8956_vddcx_ao,
+	[MSM8956_VDDCX_VFL] =	&msm8956_vddcx_vfl,
+	[MSM8956_VDDMX] =	&msm8956_vddmx,
+	[MSM8956_VDDMX_AO] =	&msm8956_vddmx_ao,
+	[MSM8956_VDDMX_VFL] =	&msm8956_vddmx_vfl,
+};
+
+static const struct rpmpd_desc msm8956_desc = {
+	.rpmpds = msm8956_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8956_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_HIGH,
+};
+
 /* msm8996 RPM Power domains */
 DEFINE_RPMPD_PAIR(msm8996, vddcx, vddcx_ao, SMPA, CORNER, 1);
 DEFINE_RPMPD_PAIR(msm8996, vddmx, vddmx_ao, SMPA, CORNER, 2);
@@ -198,6 +220,7 @@ static const struct rpmpd_desc qcs404_desc = {
 };
 
 static const struct of_device_id rpmpd_match_table[] = {
+	{ .compatible = "qcom,msm8956-rpmpd", .data = &msm8956_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 30a0aee0df57..3423f964c233 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -27,6 +27,14 @@
 #define RPMH_REGULATOR_LEVEL_TURBO	384
 #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
 
+/* MSM8956 Power Domain Indexes */
+#define MSM8956_VDDCX		0
+#define MSM8956_VDDCX_AO	1
+#define MSM8956_VDDCX_VFL	2
+#define MSM8956_VDDMX		3
+#define MSM8956_VDDMX_AO	4
+#define MSM8956_VDDMX_VFL	5
+
 /* MSM8996 Power Domain Indexes */
 #define MSM8996_VDDCX		0
 #define MSM8996_VDDCX_AO	1
-- 
2.21.0

