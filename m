Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4257C20F5C4
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 15:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388228AbgF3Ne1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 09:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388187AbgF3NeA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:34:00 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0321C03E97B
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o11so20199222wrv.9
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EdUmnOFS5TbxKtJS43wBP3LOOE3V1mwzgMQ7fgYmUtc=;
        b=b3TJl39h/HPdI2rcHJlyhWwzcXi/la21VXhkpUf8MYbyH+xEy9gT+dwl26vyTyJJpN
         TKYzfmEoTP9+Q1yO4ACJSyyqiV5lmloZPd5X1g5PhacwvpOk6vPRbCgx6FvmWqfqnUEx
         1JflzHOd2GaJyjWgT2sUZbp2H5sV9YJFC1Oy/2/HkAroipRDUy0VNFU2/35nhrr4XXSd
         zhCCnXHoaLbQJZO71+qjKO39/0wxT0NlDB7pNBpZbRoIkMdbdDJHxLtqe6ggwn7ejT6o
         RGd+Kf5hIBNxVTP+yMGrIexXx53Wi7fs0b/59vKSfzaYDlVAcmjdXLooHBLqFC1lFVVR
         tGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EdUmnOFS5TbxKtJS43wBP3LOOE3V1mwzgMQ7fgYmUtc=;
        b=D5V87nXPWm3rg6sTOqDzZ0RQWMh2lj3RvkHwYGjo9I7Y/lEGUY+GJNmsa7J+dgDv1w
         iChg38t4Z3MJ0Dj46SiHrcNZ5rb4PrJqijcfZ5WfWwTsqZ7awNzY1oaDeWFy9r3VC96q
         s0Nv50bbnMV12p2I+C+sRMGay0fV4iJxloMAiJKYaOUaX/5rjI48X/sk80REN4tXNKfW
         SsjIs19lCfr2x9sVUFRpWcX3xBwok0ene2WkG0vBWSgtTKSCL9rXtWuuMwWiSwE1QZ5o
         D/a+k83nBusqUYfKbhOWV4bAbQ8fIQt2xvtrj4mualqcihngnBAm0gCT5AksXGCy0YcH
         2M4g==
X-Gm-Message-State: AOAM533q55EYlxiZSGtreM5YOpf9vDU1SbnZeuGdSZ4NjZOlsylosuSS
        +ojocvfaOaZFoo8j1VWGHdS/eg==
X-Google-Smtp-Source: ABdhPJz0CEADFFk8XWxoF3NfWv5G61HuV3p9+cKSio2MeKeDa7JGlGUrYUDZ8uy5pr8X3Nl+M9pn8Q==
X-Received: by 2002:a05:6000:11cc:: with SMTP id i12mr21614495wrx.224.1593524038502;
        Tue, 30 Jun 2020 06:33:58 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:57 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Asmaa Mnebhi <Asmaa@mellanox.com>
Subject: [PATCH 09/10] gpio: gpio-mlxbf2: Tell the compiler that ACPI functions may not be use
Date:   Tue, 30 Jun 2020 14:33:44 +0100
Message-Id: <20200630133345.2232932-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630133345.2232932-1-lee.jones@linaro.org>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

... as is the case when !CONFIG_ACPI.

Fixes the following W=1 kernel build warning:

 drivers/gpio/gpio-mlxbf2.c:312:36: warning: ‘mlxbf2_gpio_acpi_match’ defined but not used [-Wunused-const-variable=]
 312 | static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
 | ^~~~~~~~~~~~~~~~~~~~~~

Cc: Asmaa Mnebhi <Asmaa@mellanox.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-mlxbf2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 94d5efce1721c..861a8d0a84be0 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -309,7 +309,7 @@ static int mlxbf2_gpio_resume(struct platform_device *pdev)
 }
 #endif
 
-static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
+static const struct acpi_device_id __maybe_unused mlxbf2_gpio_acpi_match[] = {
 	{ "MLNXBF22", 0 },
 	{},
 };
-- 
2.25.1

