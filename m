Return-Path: <linux-gpio+bounces-8175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F6392E38D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 11:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69B8E1F22E09
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 09:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969DC156F5D;
	Thu, 11 Jul 2024 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUZ3fhWS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765B156C6A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jul 2024 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720690688; cv=none; b=ovkAC31l6wWcvgHVkve5V0y45Q+PHZCPC6vmzSpvDK2gCMOPehQOIQonGJHTyERJVdwCUcuRtO/pu/9yGe+rfBJmfRuDkjkrF7QzBvm+UGoSTbY3jMLQKbSk9EZpo/x4e8f7HWAFc1nEcsEgDHGYIqEbexViDqy+pQ8dbO//eII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720690688; c=relaxed/simple;
	bh=WrqaJmAAllwF2lX26NM6VCkccaq+3XJvLkShVBlREYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bE5Hcn8YUPzH11GYv0jwVXo1FKwSHGxlHriqydnTL2/SvuvITaC9JqoyWQxykVVcirxpMI3+ruv6pLR1RbqpsYZ8k9x5NoKfW3Kn4ncljZZTgMnMmmv/+d7zqPo5Ma23alW7I+16t73+bWNVfA1Zw7QY2P6wkQjH8JAeaj8nYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUZ3fhWS; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77c25beae1so78048266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jul 2024 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720690684; x=1721295484; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vtm3g0wVvH8T4JQMpomMsIPVuRYp3oJIFms5ruCK3E4=;
        b=iUZ3fhWS+fIBMunjTyHRS9Ac6u2HtaKeBBBCaHU0CctDApvZgXBURbstqbuBxItNdx
         OOo6pO10rKN/8qV1tKZsgcJbMPnLFCmNmL7bP3xgAKoJOKqyQIbFMzJLK6g0M7bIMN3N
         0MOzwGIhqG0qjCTU83ZwmegUiKJOWrM+JRJmS4aVSvUfmYqVSpkLOIRsHttolCppRiFP
         zd1mIDVO1b9zdXdrlf8VCtR5BJeo2RlR61ie7z6YMnB85Bmsj5m+5hu7RS4Fu2jmDM3k
         f96aY977baG9MrD42uzf/DLJdNJ/ykxk0tiRWk+7TxSKgiGAX8BWz4xAHOVFunXpGbtm
         bNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720690684; x=1721295484;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vtm3g0wVvH8T4JQMpomMsIPVuRYp3oJIFms5ruCK3E4=;
        b=B81p9pyu5bYL1tsOHjLYhb2WlaWaolhXyAKc7413TFSFRVe72JPMx8S1/BEPtKK1Lv
         vSQBOtqf7HH7nC8PnncLpVXgYsUEb3V52Nrkwa04nJ9fOgPrMRAXjbGhcZIV+PRc9qYT
         6lEnPwlSAkFYPmHBXhR8fHJSxSx40WpIYBWDl8x/MbRefUg14WR6gwYm9hZTtIc2mF3l
         dRhcoIomjgXOctUNwStp7TPw52cvFbCZlZhjXkK/TNltPyr6aO+RsPL4RR7azdPLJRw/
         rK62vFlSq4jDwIGJpHJaro8A41s0m/62ZWGySgUtowkLhZ5l+lcrlto56CCbYvtEd2Y2
         WJBg==
X-Forwarded-Encrypted: i=1; AJvYcCVXFEFnw48Cdi2rytOLV0Op9wL59Olo5XOed3NYQ8KNHRkCOSFmxTGratMQL/qUGPFbWhaMiFjN3p/sfv9193lObuSApwezOzKYLw==
X-Gm-Message-State: AOJu0YyCZo3NZ1mtfn/7vWWL2xd08ETuu+He5NeAgzs74j+JClWVU6RB
	5S1xiwEys5fHAJVBglqL75mq5fAqytXlHW6Btk8L8fLyNBDYoTXYn5aiqX6VwXU=
X-Google-Smtp-Source: AGHT+IGWjR2keEOrWBH0DFC0WEy78M3ePZNOnnrC3T9ok1Mer9dBM2kVfoDFXV9MjJM9tjrjw2pK2Q==
X-Received: by 2002:a17:906:c082:b0:a77:c9cc:f971 with SMTP id a640c23a62f3a-a780b89c9a0mr553924066b.65.1720690683859;
        Thu, 11 Jul 2024 02:38:03 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc3f31d9sm3266753a12.44.2024.07.11.02.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:38:03 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 11 Jul 2024 11:37:57 +0200
Subject: [PATCH] pinctrl: qcom: x1e80100: Update PDC hwirq map
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-topic-x1e_pdc_tlmm-v1-1-e278b249d793@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPSnj2YC/x3MQQqAIBBA0avErBM0oqCrRIiNUw1UikYI4t2Tl
 m/xf4ZIgSnC1GQI9HJkd1eotgE8zL2TYFsNnex6OSolHucZRVKkvUX9nNclzIB2NHIbcLVQQx9
 o4/RP56WUD5rELFRkAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720690682; l=3361;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WrqaJmAAllwF2lX26NM6VCkccaq+3XJvLkShVBlREYs=;
 b=KDxXbPYT1PbOp7Nc0gylZY0GWjG7XYzgs4e4ix75XpgXP3FQAJ/VtlgqQ1MLuZUXKgtPKPZNC
 OUcVFI02IlwBzSxyjMCamPn+PigzulQQv7Y8+dKkHIEVmuJudjgF9K5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The current map seems to be out of sync (and includes a duplicate entry
for GPIO193..).

Replace it with the map present in shipping devices' ACPI tables.

This new one seems more complete, as it e.g. contains GPIO145 (PCIE6a
WAKE#)

Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index e30e93840357..6cd4d10e6fd6 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1813,18 +1813,21 @@ static const struct msm_pingroup x1e80100_groups[] = {
 
 static const struct msm_gpio_wakeirq_map x1e80100_pdc_map[] = {
 	{ 0, 72 }, { 2, 70 }, { 3, 71 }, { 6, 123 }, { 7, 67 }, { 11, 85 },
-	{ 15, 68 }, { 18, 122 }, { 19, 69 }, { 21, 158 }, { 23, 143 }, { 26, 129 },
-	{ 27, 144 }, { 28, 77 }, { 29, 78 }, { 30, 92 }, { 32, 145 }, { 33, 115 },
-	{ 34, 130 }, { 35, 146 }, { 36, 147 }, { 39, 80 }, { 43, 148 }, { 47, 149 },
-	{ 51, 79 }, { 53, 89 }, { 59, 87 }, { 64, 90 }, { 65, 106 }, { 66, 142 },
-	{ 67, 88 }, { 71, 91 }, { 75, 152 }, { 79, 153 }, { 80, 125 }, { 81, 128 },
-	{ 84, 137 }, { 85, 155 }, { 87, 156 }, { 91, 157 }, { 92, 138 }, { 94, 140 },
-	{ 95, 141 }, { 113, 84 }, { 121, 73 }, { 123, 74 }, { 129, 76 }, { 131, 82 },
-	{ 134, 83 }, { 141, 93 }, { 144, 94 }, { 147, 96 }, { 148, 97 }, { 150, 102 },
-	{ 151, 103 }, { 153, 104 }, { 156, 105 }, { 157, 107 }, { 163, 98 }, { 166, 112 },
-	{ 172, 99 }, { 181, 101 }, { 184, 116 }, { 193, 40 }, { 193, 117 }, { 196, 108 },
-	{ 203, 133 }, { 212, 120 }, { 213, 150 }, { 214, 121 }, { 215, 118 }, { 217, 109 },
-	{ 220, 110 }, { 221, 111 }, { 222, 124 }, { 224, 131 }, { 225, 132 },
+	{ 13, 86 }, { 15, 68 }, { 18, 122 }, { 19, 69 }, { 21, 158 }, { 23, 143 },
+	{ 24, 126 }, { 26, 129 }, { 27, 144 }, { 28, 77 }, { 29, 78 }, { 30, 92 },
+	{ 31, 159 }, { 32, 145 }, { 33, 115 }, { 34, 130 }, { 35, 146 }, { 36, 147 },
+	{ 38, 113 }, { 39, 80 }, { 43, 148 }, { 47, 149 }, { 51, 79 }, { 53, 89 },
+	{ 55, 81 }, { 59, 87 }, { 64, 90 }, { 65, 106 }, { 66, 142 }, { 67, 88 },
+	{ 68, 151 }, { 71, 91 }, { 75, 152 }, { 79, 153 }, { 80, 125 }, { 81, 128 },
+	{ 83, 154 }, { 84, 137 }, { 85, 155 }, { 87, 156 }, { 91, 157 }, { 92, 138 },
+	{ 93, 139 }, { 94, 140 }, { 95, 141 }, { 113, 84 }, { 121, 73 }, { 123, 74 },
+	{ 125, 75 }, { 129, 76 }, { 131, 82 }, { 134, 83 }, { 141, 93 }, { 144, 94 },
+	{ 145, 95 }, { 147, 96 }, { 148, 97 }, { 150, 102 }, { 151, 103 }, { 153, 104 },
+	{ 154, 100 }, { 156, 105 }, { 157, 107 }, { 163, 98 }, { 166, 112 }, { 172, 99 },
+	{ 175, 114 }, { 181, 101 }, { 184, 116 }, { 193, 117 }, { 196, 108 }, { 203, 133 },
+	{ 208, 134 }, { 212, 120 }, { 213, 150 }, { 214, 121 }, { 215, 118 }, { 217, 109 },
+	{ 219, 119 }, { 220, 110 }, { 221, 111 }, { 222, 124 }, { 224, 131 }, { 225, 132 },
+	{ 228, 135 }, { 230, 136 }, { 232, 162 },
 };
 
 static const struct msm_pinctrl_soc_data x1e80100_pinctrl = {

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240711-topic-x1e_pdc_tlmm-a6cd7a0f6cbd

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


