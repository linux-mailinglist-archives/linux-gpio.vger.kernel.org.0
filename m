Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26017768EC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Aug 2023 21:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbjHITjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Aug 2023 15:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233955AbjHITjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2023 15:39:18 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED51D1BD9
        for <linux-gpio@vger.kernel.org>; Wed,  9 Aug 2023 12:39:14 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9a828c920so2861871fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Aug 2023 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691609953; x=1692214753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scHhpJUMzh48LPTYd+vtq/rRvZwD6bIb5v4LTSQLFkQ=;
        b=tsbL6KN45SrtH2mGdzr+Zt/Heo9gCqN1luo5IfDxltewLZb4je6A3xZBiF70XwEWIB
         5/kkAQ3lD++wgVYBMjIsjkbWiau3wnCaukyNgyI93YoEb5OJkX3muVyzabPqJMIBl+nl
         ub3zt+OuDoqZ75qMLvyiwmK0QAvoEDJfzh0Q1xPNlk7/W0ZbGTguua5IJPqu9oLDZbOM
         DUXP7LwxjxFmrq3foWNENFYd9XlOsQ8hA6Y6Y+WXWW+bWmwY9H4WGpf9oIU+7/FVdwX6
         peVLhBGmy9MnaWV00tMbD2qIUg8hYLJUElPakv161O1YWsKLikJIydpNOCTq4BRS3Iu6
         id8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691609953; x=1692214753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scHhpJUMzh48LPTYd+vtq/rRvZwD6bIb5v4LTSQLFkQ=;
        b=befZYI2xRap15Y2K5B0AulT8N7GwNKi197F/pWNDGnBgT6dkfK+9kQJY1xz81BgUUq
         GWCnQAUHEfrCbumX6KK93B0SDRkfvpPapTt4XgGsdtx0ZV78e7xKR9Mjnzavn0QroNPe
         fbSP6FgH2HIbWgB/cK8jhKwTmoeP7YB5ThsgdGiV4VzQiAGNJmq7b1WSaMFNCKhmW/4e
         X3EgIdcIQgcpdIn16icKpuYCGlbf5p/Ub+phxua+hQERFK04jpK2l9a6G3WP5TIzxRSG
         aM5QZpsg/OCgZ0uPyK9zlAjBXMFN2Ni7Ytw9OGqQXvjIUKk66MI6CszBwt208g66cjrV
         Xl8w==
X-Gm-Message-State: AOJu0YzQcyu1kpj+4wny65ZvVLgX7yI6r06inekAJFPPyLGJZujZFnf7
        fHT2BrdexwC2UAlZU5gra4HccA==
X-Google-Smtp-Source: AGHT+IHurHBiaH7/Vjd3iZA3MCs1rWy2hTZdWA/koce8qrDiOUiwcxFFlbt1TB4xVuc1GAKw6FUt0Q==
X-Received: by 2002:a2e:3109:0:b0:2b6:ef2b:da5e with SMTP id x9-20020a2e3109000000b002b6ef2bda5emr110152ljx.49.1691609953018;
        Wed, 09 Aug 2023 12:39:13 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id x6-20020a2e9c86000000b002b9fe77d00dsm2885287lji.93.2023.08.09.12.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 12:39:12 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 09 Aug 2023 21:38:57 +0200
Subject: [PATCH 4/5] pinctrl: qcom: sm6125: Add MPM pin mappings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230809-topic-mpm_mappings-v1-4-5e17dd76b3c8@linaro.org>
References: <20230809-topic-mpm_mappings-v1-0-5e17dd76b3c8@linaro.org>
In-Reply-To: <20230809-topic-mpm_mappings-v1-0-5e17dd76b3c8@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691609947; l=1945;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mi6tyaaFaIGRYVB8wfaRQeWL03aQpxrSwoKIZ8Ywe4k=;
 b=mQplNLrfdABOmb0kAk8NkBnDyjp6NS61Zp5QhFo49xa/giZvIaw/v49QXdunxFribHHeXcUiL
 6MILr9GgvUHD8e6Q/vpIbFqr/HUEb4NTEVHBJdUgfkrlV3gVEXNd2E3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pin <-> wakeirq mappings to allow for waking up the AP from sleep
through MPM-connected pins.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm6125.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm6125.c b/drivers/pinctrl/qcom/pinctrl-sm6125.c
index d5e2b896954c..ea377f025d60 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6125.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6125.c
@@ -1221,6 +1221,18 @@ static const struct msm_pingroup sm6125_groups[] = {
 	[140] = SDC_QDSD_PINGROUP(sdc2_data, SOUTH, 0x58b000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sm6125_mpm_map[] = {
+	{ 5, 43 }, { 6, 45 }, { 7, 59 }, { 8, 72 }, { 9, 83 }, { 13, 124 }, { 14, 1 }, { 15, 3 },
+	{ 16, 4 }, { 17, 9 }, { 18, 13 }, { 19, 15 }, { 20, 17 }, { 21, 19 }, { 22, 21 },
+	{ 23, 14 }, { 24, 25 }, { 25, 26 }, { 26, 27 }, { 27, 29 }, { 28, 33 }, { 29, 36 },
+	{ 30, 42 }, { 31, 44 }, { 32, 47 }, { 33, 50 }, { 34, 70 }, { 35, 75 }, { 36, 79 },
+	{ 37, 80 }, { 38, 81 }, { 39, 82 }, { 40, 85 }, { 41, 86 }, { 42, 88 }, { 43, 89 },
+	{ 44, 91 }, { 45, 92 }, { 46, 93 }, { 47, 94 }, { 48, 95 }, { 49, 96 }, { 50, 98 },
+	{ 51, 99 }, { 52, 101 }, { 53, 102 }, { 54, 105 }, { 55, 107 }, { 56, 110 }, { 57, 111 },
+	{ 58, 112 }, { 59, 118 }, { 60, 122 }, { 61, 123 }, { 62, 126 }, { 63, 128 }, { 64, 100 },
+	{ 65, 130 }, { 66, 131 }, { 67, 132 }, { 70, 97 }, { 71, 120 }, { 84, 22 },
+};
+
 static const struct msm_pinctrl_soc_data sm6125_tlmm = {
 	.pins = sm6125_pins,
 	.npins = ARRAY_SIZE(sm6125_pins),
@@ -1231,6 +1243,8 @@ static const struct msm_pinctrl_soc_data sm6125_tlmm = {
 	.ngpios = 134,
 	.tiles = sm6125_tiles,
 	.ntiles = ARRAY_SIZE(sm6125_tiles),
+	.wakeirq_map = sm6125_mpm_map,
+	.nwakeirq_map = ARRAY_SIZE(sm6125_mpm_map),
 };
 
 static int sm6125_tlmm_probe(struct platform_device *pdev)

-- 
2.41.0

