Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DC948FBA9
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 09:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234780AbiAPIdN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 03:33:13 -0500
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49]:56211 "EHLO
        out162-62-57-49.mail.qq.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234779AbiAPIdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 Jan 2022 03:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1642321989;
        bh=So3WZ5FvjllBHQzS197yDZc/bzSJMtX1iMxl4muakzA=;
        h=From:To:Cc:Subject:Date;
        b=vSo6fiS5OQSe2eTBNXUtVQhIM7S64f7fQ0+IVarUXhF0R2HzaPJ/dnE8pxchT70+7
         7QIR9oPKI5B/BKyq+Tk9cIvGvNAEXXapOSduy98ZkOMulzCKQGaix0w2NLQW+4NDeI
         4tH70MfY/ioAiHqdENTgtx8yrxKjrtWUzkB+rFWI=
Received: from localhost.localdomain ([43.227.136.188])
        by newxmesmtplogicsvrsza9.qq.com (NewEsmtp) with SMTP
        id 45A8D61B; Sun, 16 Jan 2022 16:17:26 +0800
X-QQ-mid: xmsmtpt1642321046t4sl5l64s
Message-ID: <tencent_949564FE01410898F3734D38FA284CC2E909@qq.com>
X-QQ-XMAILINFO: Ng3M1C/wDpyJYXCUJikaVHNA7js7JxKDFsyQSgSOzIFX1Ou7rzeXI/GvQqqQG2
         jeJQdwGI8g4hPFHuvhLr4iAEvrq7gGKc1rEdTy5Ye9Xb/2WxTM/vqc8bPzM+Ebf8AYC10i9VMlQM
         6lZxecf2x3PWVCv9WduYeRyyaR9iJwbBwBQFB5q2mCW+VmwW3aXpqpViE9bJod7Mrkg3FZX6kuyW
         gHP281X463p0T5zvGu0y+hcaKN3wYjMszZIsL6xwJeiUXe/PowhmvVOKaM6QeWmiTE8x7oP3A5B9
         YfxUCCFXB8BUJ4AMCPrdCpzVxJPn+Y6iP75RcpP8RwmTNvrvPjrk0ZjcccGM2Z4anFjADjMnLuQu
         BTvVHj5KUVImi+SQr+Pq8WHSBNiG8JR5mk4PPxWhD9W00wIxLrDIhCTmVvOJBS7hO/7rzSN4Bv9z
         U4MH4YojMHErVf051AmVBh1UbZARbnO1xjUF3Wcj0yzGbOdqLImHmc+9LdxR1X1FqZ0v2dpqSaxV
         ypjkS+2YPviSBYPUywARWCic5PJAtIMaUi22nEacpN7s0X7/Aif7ol4/hCqfU/B9jvMrI3cpCmul
         +s2E06/ifQbcSVvQfS8l/qPjvp2yWMmgoZWfFdDOdU2lFCpyr1qETiOSOoAR7uyDBjmbLbv5hKiF
         NHSsb+deT2Z6gZ0ltamsfijqjQA5T52nkyu5PCoUwpVNoUh70z/6rktpkDol8lEs1+bLT9Z65/VU
         HcXDbnrjq8ztQPGfRXUMyDsT5XU94EjcSDBIZeer9HJa2E6Tj/ZBWzLm+lOB5IwVS+LBLqQHpkbC
         fi8kB1SY0N56f+HrWw5BAwsyD9KUBIowKti223okH2y/cdQi6HtdN1XDWjU9oYl+aGLjNOqLk6f+
         KnbYNkBzYqbzLKaRwXMebH3REqSQXv6ubalMRA8Isqnr1bdmuLPkfmB+kkJOWtDcdyrZiWyx9p
From:   xkernel.wang@foxmail.com
To:     andy@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] gpio: merrifield: check the return value of devm_kstrdup()
Date:   Sun, 16 Jan 2022 16:16:38 +0800
X-OQ-MSGID: <20220116081638.2676-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Xiaoke Wang <xkernel.wang@foxmail.com>

devm_kstrdup() returns pointer to allocated string on success,
NULL on failure. So it is better to check the return value of it.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/gpio/gpio-merrifield.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 42c4d9d..f3d1bae 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -409,6 +409,9 @@ static int mrfld_gpio_add_pin_ranges(struct gpio_chip *chip)
 	int retval;
 
 	pinctrl_dev_name = mrfld_gpio_get_pinctrl_dev_name(priv);
+	if (!pinctrl_dev_name)
+		return -ENOMEM;
+
 	for (i = 0; i < ARRAY_SIZE(mrfld_gpio_ranges); i++) {
 		range = &mrfld_gpio_ranges[i];
 		retval = gpiochip_add_pin_range(&priv->chip, pinctrl_dev_name,
-- 
