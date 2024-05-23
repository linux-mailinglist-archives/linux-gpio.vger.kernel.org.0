Return-Path: <linux-gpio+bounces-6594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE848CDD1A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 01:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 404CE1C21DC2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 23:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C97E12836B;
	Thu, 23 May 2024 23:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHZlC5Mf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546E763E6;
	Thu, 23 May 2024 23:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716505597; cv=none; b=mWP7UYM/WggMlVlS4d11RkSOxpCTKxfgJcNDod2H5AZQWVWLnopD1E3cLAYrteS3Ja3svoB1SxLeml9J2hOaUY3gSmIiLylX3XYNvl/JXYGlxHumqobXwfty7ECcGugllUvzVSEDeimUp+V7ew3zIazkX/8X3IxZgc44aT7MNck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716505597; c=relaxed/simple;
	bh=hNCSMAcnDiMGOvNSsMHyMEXLmx+i9TQqkOFZ7n8IKHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rkw9atpMhS0+oqPDxIUOjAL3C4doi6V+XoMGaF12HI3ZcJP6QaVEYOjggZx0bQrMub1q27LG739L4XP0MnF4kfDaKTKDQBJLq7NjO1iqDOuMHXh1bzmOod6I8uEwkP4Z9Wyz+B99Gwen0GWwWRhSBr4qLEk16ehhgSGIdMLiQfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHZlC5Mf; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-792c031ffdeso555943585a.2;
        Thu, 23 May 2024 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716505594; x=1717110394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7/dP6fhcnZkgHFNd0TVGlOmGzBPrBq4kGIMBayt4b0=;
        b=jHZlC5MfHy9YzPQoa6ypEE/ReBHUr2Ff3Xk44NgesZu4pHXf99C2ZmuVoLPxgq2srX
         6Zyp8H11L2/+Jso1gzGpiZXtLemtgCmJWArr++jNR9rg1fH0CveQyR2/lFCm9bA0dLV+
         ZSADrDv2T7b5Br0NWuiwlyUUq9eXZQbYaPp9KTm5smjwPfzO2KOPOX/4+Y0e1mN6wHYQ
         3Z9J4k1m2Mvc9+E1i06Cfk5RkHJkmBk/L2bqEzREWlBSrqLT706tAZ+rhK2/N3XtQGDI
         AgvAqPyJ8vhEhs07EdF/rjOcxwQDKu75x4HsNJ3t+S+vEg31mUtxaBh5v5eCtIcTTgYJ
         ZSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716505594; x=1717110394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7/dP6fhcnZkgHFNd0TVGlOmGzBPrBq4kGIMBayt4b0=;
        b=c7QsIBWu/apLCRgGpK4ZcpBnmDjOKCFA9H2t2oA5ipmzMsMkM/fckk+1auGpcFZn4m
         aoRoP2X4D9eGVSxgXFfQnxHw6KQiXZa71LJX87P9hNQ6V8L6tK1toVGsXZ1Fc/1NCbHv
         magfX/FDyV9AqkQbxX7P9jK1mx8omT4fJPPzYdXltRlkzdgAvIGrXTpKfSdVJyHK3jfL
         UjkjA385+3Npab+hwGjov4bswv3BbdVwXNntd4toPGBwgzRf28WyUgYkEh2TTXjWbHE2
         1v8JFECEEKDH+1a1tAIi032CKClKTiXbbcP8y0bGH/BTV44CzK58nR2rQEZ3OjyFG86O
         MbGA==
X-Forwarded-Encrypted: i=1; AJvYcCXgJG3keoQUSZ+c2J7IfOuueeWo6gPb+65zDyAv3HdXO4uKCs6WQKFJHVneWI5qzneT0lvk7oD82SySOCtRojOgkPjGl5iyL8tsLfHRKMUwMkx1WAG6xH8X8ivJkm3lu0Xjizs4AfEwKvY=
X-Gm-Message-State: AOJu0YzpYnCvhPRBRg9Q/FgL89gC2H5yZuFMhWwunzq4WxiuRNbyLTiO
	V8vO1IsK0jYofll4CuQElZ24fIU7djEUYIYJHagE8dY3lcm7crV+
X-Google-Smtp-Source: AGHT+IFkStAecawLUJlZe8HUlwrF6X7OTVIS75iY0EMktJ2BJ9Bs61ONq5sppqGjT20S18KkQNEb3g==
X-Received: by 2002:a05:6214:2f09:b0:6ab:86fe:514c with SMTP id 6a1803df08f44-6abcd0b1f1cmr7611206d6.38.1716505594227;
        Thu, 23 May 2024 16:06:34 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac071048a3sm1300256d6.69.2024.05.23.16.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 16:06:33 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] pinctrl: qcom: sdm670: add pdc wakeirq map
Date: Thu, 23 May 2024 19:06:20 -0400
Message-ID: <20240523230619.256882-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PDC was hooked up as a wakeup parent in the DTS in
commit 71f080633d1e ("arm64: dts: qcom: sdm670: Hook up PDC as
wakeup-parent of TLMM"), but the wakeirq mapping was not defined so it
had no effect. Add the mapping for wakeup interrupts on the PDC to their
corresponding pins.

Configuring a pin IRQ as dual-edge would break it unless the
wakeirq_dual_edge_errata flag is set.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sdm670.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670.c b/drivers/pinctrl/qcom/pinctrl-sdm670.c
index 1e694a966953..894c042cb524 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670.c
@@ -1290,6 +1290,22 @@ static const int sdm670_reserved_gpios[] = {
 	58, 59, 60, 61, 62, 63, 64, 69, 70, 71, 72, 73, 74, 104, -1
 };
 
+static const struct msm_gpio_wakeirq_map sdm670_pdc_map[] = {
+	{ 1, 30 }, { 3, 31 }, { 5, 32 }, { 10, 33 }, { 11, 34 },
+	{ 20, 35 }, { 22, 36 }, { 24, 37 }, { 26, 38 }, { 30, 39 },
+	{ 31, 117 }, { 32, 41 }, { 34, 42 }, { 36, 43 }, { 37, 44 },
+	{ 38, 45 }, { 39, 46 }, { 40, 47 }, { 41, 115 }, { 43, 49 },
+	{ 44, 50 }, { 46, 51 }, { 48, 52 }, { 49, 118 }, { 52, 54 },
+	{ 53, 55 }, { 54, 56 }, { 56, 57 }, { 57, 58 }, { 66, 66 },
+	{ 68, 67 }, { 77, 70 }, { 78, 71 }, { 79, 72 }, { 80, 73 },
+	{ 84, 74 }, { 85, 75 }, { 86, 76 }, { 88, 77 }, { 89, 116 },
+	{ 91, 79 }, { 92, 80 }, { 95, 81 }, { 96, 82 }, { 97, 83 },
+	{ 101, 84 }, { 103, 85 }, { 115, 90 }, { 116, 91 }, { 117, 92 },
+	{ 118, 93 }, { 119, 94 }, { 120, 95 }, { 121, 96 }, { 122, 97 },
+	{ 123, 98 }, { 124, 99 }, { 125, 100 }, { 127, 102 }, { 128, 103 },
+	{ 129, 104 }, { 130, 105 }, { 132, 106 }, { 133, 107 }, { 145, 108 },
+};
+
 static const struct msm_pinctrl_soc_data sdm670_pinctrl = {
 	.pins = sdm670_pins,
 	.npins = ARRAY_SIZE(sdm670_pins),
@@ -1299,6 +1315,9 @@ static const struct msm_pinctrl_soc_data sdm670_pinctrl = {
 	.ngroups = ARRAY_SIZE(sdm670_groups),
 	.ngpios = 151,
 	.reserved_gpios = sdm670_reserved_gpios,
+	.wakeirq_map = sdm670_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sdm670_pdc_map),
+	.wakeirq_dual_edge_errata = true,
 };
 
 static int sdm670_pinctrl_probe(struct platform_device *pdev)
-- 
2.45.1


