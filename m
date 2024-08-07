Return-Path: <linux-gpio+bounces-8666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE594AF65
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 20:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A7F5B20AF4
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 18:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B7613DBA5;
	Wed,  7 Aug 2024 18:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWu7kcxJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169013D61A
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723054242; cv=none; b=jxNGzQcl/mVZ3A75+qWn+f953obPirM8erLMZyzQc2lhGaC0OcvSrwuwKwZbKZznwhSdK0ycZWStH/jG0icFVPl/ddsZMMCVjdHVcKKpN1pM9AqTdllFaUxW/VeCEIhuSaUXbwb2BZbDJgK7aBQVg1yYeVn+XbNHj1TllFov54s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723054242; c=relaxed/simple;
	bh=lxt3wUYsg32Y18gNjqNue90CYCyuNl1ac50RLDDEZ7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PU5UnGQmRzV2EmVRhT+VaYuKsU6GhwB5vg9aIDljAEvYpjgI1zYGbFBDv8u4jqHJUB2/g9jWUqEXtDVfrs3ObEfExiEoTYxXEi+rvoeeWQPxIqGK4C8gXpI1EKAn6Sv0HEmwuBFw62/0wIMf64uHCViA5NbT/OZX6oRlS1VllsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWu7kcxJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fdb28b1c16so278425ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723054239; x=1723659039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PzWFF3zyatgSU8DsPRQcSn1wkfXRR1Z5HCTDg1S0vdw=;
        b=BWu7kcxJq8dlEBdGysURkqa58LsOoPDHLm3HypP8EMLk0NeYL6WRSEpw6iOBBuVwBg
         +s3JDi4mPjemcTRiWL+pmfxZ/QxW37Ilbm/Bp/6xM2dRGxorWUW7oMzxG0XTnZGtDX4z
         p9J+rJLZNUhlw/knOawt9Vv3z7GsT+nT5HGrnWpKTsFpAJJZSR4ESnjcTCzUxzt60UPE
         imb+Q4XdcVDkpNqdzFqsqVmDGUPk+BNjGy34qzylVWOyfZI+4FeW+o396CgH2Nb59E3X
         40rZRho8G5rrufdGQg0tzV47Q7FpEAh2sEjaQP/lTH2dJnmD+grDyQEiv3tpnv5G3ESB
         ZGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723054239; x=1723659039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzWFF3zyatgSU8DsPRQcSn1wkfXRR1Z5HCTDg1S0vdw=;
        b=kyBdCbdwglRKPTtthmcVfmhuIPytiokxbo98ReUEVX8Xmmlk0dwws/C7v3aqEPWV5/
         CxtT2hr5PLO53Vc8aoNlnI+qlj1aiBPgHeP6xHqMHtfeESs1EH7jb9lMwW6HgJVzpx/T
         nkLHUYZXtCElU1i5XnXVtGEgmTaPfFOmMCt4ZOrrtU2iGsp3p3ezWOpWGcPFtAZHfs/U
         hRrNZ2d0y4FZ2NOtPoOa1jVHY4c576szivJ6mES8laxWHOZUhokc3n710xR/PLrluciQ
         yIfXnrZgV1t0yw+DKEmev2a0FbpGKHF/UPdoF5bVY6zMtc+iWt16Q7JfVCbKxf+hch+i
         99Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUFG+I5VRBwBhga97PrrQYkoQ0OKqy3yol82G3HNJagmcBjRzjZNAv3XsQiDag5zGZXSnn4kUZNPC83@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8zwx2rDvm+cA3i+P/T14n/BaRayPwbGVV1nyy8xJOUW34ptuv
	/2KRi+cPJKcDSdpd1eGLPSjOLUH0Z46FT3niogVoUWLS0kuooTdP
X-Google-Smtp-Source: AGHT+IHIE2Hukwhp/3pXgqVSa3SzFb0Uuqa/JkMxguoK3u4mdG7KI7VhP0Tm3hsZ8i/fO/V50tVHVA==
X-Received: by 2002:a17:902:ce86:b0:1fc:72f5:43b8 with SMTP id d9443c01a7336-1ff573c181fmr152793815ad.7.1723054239526;
        Wed, 07 Aug 2024 11:10:39 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5e1c:17b4:a72d:e3b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f5331asm109799365ad.70.2024.08.07.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 11:10:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linus.walleij@linaro.org
Cc: aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Date: Wed,  7 Aug 2024 15:10:33 -0300
Message-Id: <20240807181033.77848-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_LATE_SYSTEM_SLEEP_PM_OPS() with its modern
LATE_SYSTEM_SLEEP_PM_OPS() alternative.

The combined usage of pm_ptr() and LATE_SYSTEM_SLEEP_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Pass pm_ptr() to the correct ops structure.

 drivers/pinctrl/freescale/pinctrl-imx.c    | 7 +++----
 drivers/pinctrl/freescale/pinctrl-imx8mq.c | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9c2680df082c..d05c2c478e79 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -804,14 +804,14 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(imx_pinctrl_probe);
 
-static int __maybe_unused imx_pinctrl_suspend(struct device *dev)
+static int imx_pinctrl_suspend(struct device *dev)
 {
 	struct imx_pinctrl *ipctl = dev_get_drvdata(dev);
 
 	return pinctrl_force_sleep(ipctl->pctl);
 }
 
-static int __maybe_unused imx_pinctrl_resume(struct device *dev)
+static int imx_pinctrl_resume(struct device *dev)
 {
 	struct imx_pinctrl *ipctl = dev_get_drvdata(dev);
 
@@ -819,8 +819,7 @@ static int __maybe_unused imx_pinctrl_resume(struct device *dev)
 }
 
 const struct dev_pm_ops imx_pinctrl_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
-					imx_pinctrl_resume)
+	LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend, imx_pinctrl_resume)
 };
 EXPORT_SYMBOL_GPL(imx_pinctrl_pm_ops);
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mq.c b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
index 529eebe46298..316469e72a17 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mq.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mq.c
@@ -341,7 +341,7 @@ static struct platform_driver imx8mq_pinctrl_driver = {
 	.driver = {
 		.name = "imx8mq-pinctrl",
 		.of_match_table = imx8mq_pinctrl_of_match,
-		.pm = &imx_pinctrl_pm_ops,
+		.pm = pm_ptr(&imx_pinctrl_pm_ops),
 		.suppress_bind_attrs = true,
 	},
 	.probe = imx8mq_pinctrl_probe,
-- 
2.34.1


