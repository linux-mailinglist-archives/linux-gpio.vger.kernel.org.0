Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257A320F5C7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 15:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388175AbgF3Neg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 09:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388182AbgF3Nd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:33:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FFBC08C5DC
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:58 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g75so18824946wme.5
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7A8fd8K6Xg2GcpEMDl/hEl1oZDzE0C0aQNCJLDk0izk=;
        b=XwN9XpGGLLINb9bmDd9M7rq+kabOna2BscILWUe9Ys6KgtxEY+IvgWHLEoz0xXSSe1
         tuwsdOmyH6jqNLGgiXb9sxAWHTg8xzvjeuK3NpnVTdmeORXc/6gyDSIH8o1nFbzHzJic
         9mxzn+WvbvuC7gCHzWU847yTLCQ9aDVzScRidwsujRs5m/5XB7/akP33NYHmgwaLteWb
         5IVrU1IZ+BCLITm0zbvFvVtao1FhFbrp1lU6tlXx+IWW1lpfOnrLK7No9Ji4DgdYUe7k
         eGwkbeAZy0xAdcYz2AkElYtIHM9E1mzVMV2z+gBLshSbpcRyFtkZNinm5+eXnkBBEgvl
         UAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7A8fd8K6Xg2GcpEMDl/hEl1oZDzE0C0aQNCJLDk0izk=;
        b=PXqHWkgU21PiYzac5GjtfVgvDhlt7TN0r6ilQ+8BB0W/8w1Z1KqpZTfBoPfZCQZGdD
         5k8AqALaR5WcavL3jMVPw78j+J5n50t9fe8ItRmXlZZGU9NJX2hbhjv1RAxXKul1cbks
         HTSt/XkJDz98vXknZ/GukO8045rTvwtmXfWpCMU3WLUOJpqBacgfiRmhMxQc7+9wZsHM
         kjiMfsDLEhxXz4eVoVXgDhYS5ntXK5g+MYXTKuvKOazvfd10kWrGtfvfluvOV9kZ98fl
         QuTEuuyreEmozD3IFJEl0U02rP8HzRqgFLbuViT3WQr699gr4LpbmX8SZfu+Ef+ITCzn
         Z9qQ==
X-Gm-Message-State: AOAM533ueGh6ISBWmNu9WKXyVLuT74xVQdJ3ZFYQ1WEEpWtZHKTjoSsr
        ETYfecLb8jN2OpQJ12i2naiBpA==
X-Google-Smtp-Source: ABdhPJynqohsoRrFIShWDkghOLuISD4f4oZVbWRjLzqNeAhn5TwaZv0Qb5XUX2AFsAIp934hGFepEw==
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr22909206wmb.105.1593524037244;
        Tue, 30 Jun 2020 06:33:57 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:56 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Shravan Kumar Ramani <sramani@mellanox.com>
Subject: [PATCH 08/10] gpio: gpio-mlxbf: Tell the compiler that ACPI functions may not be used
Date:   Tue, 30 Jun 2020 14:33:43 +0100
Message-Id: <20200630133345.2232932-9-lee.jones@linaro.org>
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

 drivers/gpio/gpio-mlxbf.c:130:36: warning: ‘mlxbf_gpio_acpi_match’ defined but not used [-Wunused-const-variable=]
 130 | static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
 | ^~~~~~~~~~~~~~~~~~~~~

Cc: Shravan Kumar Ramani <sramani@mellanox.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-mlxbf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index 894aaf55fc96c..1fa9973f55b96 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -127,7 +127,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 }
 #endif
 
-static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
+static const struct acpi_device_id __maybe_unused mlxbf_gpio_acpi_match[] = {
 	{ "MLNXBF02", 0 },
 	{}
 };
-- 
2.25.1

