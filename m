Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7E224EFF7
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 22:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfFUUVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jun 2019 16:21:14 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35146 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUUVO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jun 2019 16:21:14 -0400
Received: by mail-ed1-f65.google.com with SMTP id w20so4147725edd.2;
        Fri, 21 Jun 2019 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jqSjyrMoWRwF+do82t/l3WMtzN9PwjpWvsfZitq7qSk=;
        b=WdnB5LAW59jSJgUEDunfjsU/5l5fFVMI3/eFRKtiTEoiHYu4a2QM5fsze+aO0wy1eT
         2RpyXxFNo442c3fpamyEnpJe2I4B894rtJNhsdukEVui7mO8Ub4QTH02oqJZbRz9+gDu
         Yh+V9rejvZTuC2rYZCKUl1QDy3JF0rvYIP57MVf0Qi0nZ16LZ4vLNfFBHjxv5bB+G7cm
         8sesRSWyB3sf2HBMeGhlbk/CfiVf1Gi0NEcP6c0kDemuXE75s8Zjswio36544k8KmfY5
         Rw1VwYDeyxqzXxghdOEWplgmZdtLUHnTidI6tt8dT81iDIBfMpA29CYxKoBn2Pt3L+oq
         zq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jqSjyrMoWRwF+do82t/l3WMtzN9PwjpWvsfZitq7qSk=;
        b=Btq1tA7NV53bbP/PKx0LAd239vHW3eaVMtU49rwaEsy7FOfpBPMFYLQ4NRGUC5yMxU
         wBcFB67J33egyJH7YV9MhtZdjeEbwqoz7y6RHecaoodC6O6+hibD8zSDjJPsrMaGC28+
         EHpkIaGGhGQX5pTqmOLx3XGFq5+xh30ixvZ5WdtZFYtexTIMfKIP0gvsJXn5Xv0jwlz2
         Z08mBl2U1Yh2jnNkAuyh0lXk9+Fyca6GdCnb4fGtRwKsDtW0Zqogx4HxeYJJolOSC0lS
         YMqrzaC6VIG4hjYbVcZog45SR7PU28IkV6IsfA7eE+p5VPzlIF0JzFci/ospp30MAjzM
         9g9w==
X-Gm-Message-State: APjAAAUkQTzNso405tSfkGoyr6kxyA2BPh9/nVk8OkG1LDVR/t6puaHV
        nADn7oty4fg+hFPBRkaQKNM=
X-Google-Smtp-Source: APXvYqzenDJfKSir67f/YQyStUGcpJj5rohxQxWjWh4nYxPfnU6E8IJwdl+sHHnJnp30ejMd6+Dgpw==
X-Received: by 2002:a17:906:1596:: with SMTP id k22mr22688551ejd.102.1561148471594;
        Fri, 21 Jun 2019 13:21:11 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id g8sm585031eje.1.2019.06.21.13.21.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 13:21:10 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Lee Jones <lee.jones@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] pinctrl: qcom: sdm845: Fix CONFIG preprocessor guard
Date:   Fri, 21 Jun 2019 13:20:43 -0700
Message-Id: <20190621202043.95967-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Clang warns when CONFIG_ACPI is unset:

 drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: 'CONFIG_ACPI' is
 not defined, evaluates to 0 [-Wundef]
 #if CONFIG_ACPI
     ^
 1 warning generated.

Use ifdef instead of if to resolve this.

Fixes: a229105d7a1e ("pinctrl: qcom: sdm845: Provide ACPI support")
Link: https://github.com/ClangBuiltLinux/linux/issues/569
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 06790e5ece6c..39f498c09906 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1317,7 +1317,7 @@ static int sdm845_pinctrl_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#if CONFIG_ACPI
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id sdm845_pinctrl_acpi_match[] = {
 	{ "QCOM0217"},
 	{ },
-- 
2.22.0

