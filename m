Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4AE2D3EC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 04:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfE2Cmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 22:42:55 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43371 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfE2Cmz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 22:42:55 -0400
Received: by mail-pl1-f196.google.com with SMTP id gn7so365402plb.10;
        Tue, 28 May 2019 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2pzbdec/1JzOU+htU9qgwmgzRD0iXkmCaTXRbBzNegE=;
        b=QwH6V4R2xb0vcw3QrTM/J9tendGlR16G/+s3zQPU6a04C3HYdiHIxvYhx1aOcyXWYP
         ooS7hxyjSUzieuw9Qfp2wTMhLpHRVcu90eZ210CjprwDB9BDLDZ0PAJwQqqV7GrUmeBa
         YhrwMkhb1oWnkBplloGHwsZUkPIry9Hh84qj+inm1Me+v66pOlcL2kZhxYX97bJRhSJt
         p5QOVnTMQYQSz2qxoXVvt7APDOtdq/BGiWDtiWSp/wU4MISzFhnrJM5cMWDZjPxq6hD8
         xJD/BfW4NNf5GFpYKuIqgMfg3oGTg6MbO5fwKqi9mzQsu2c6b1qLxDEdKyliwWEUmoKk
         TsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2pzbdec/1JzOU+htU9qgwmgzRD0iXkmCaTXRbBzNegE=;
        b=o/ywa94WWEZb6Mu9ln5Kj1BxJ5nuBylQ/wn3UV4HP8T0Gb61BoCUd7hQdTLdskw0Wq
         k/UDveGW+xpD5pET36mNvrOCD7wvUGkLh2cYoS3l0VWlv5zmVm1wfXqp9XpRmdKY+JRW
         WsSjy5kCC659twe6DyEkcqnghpz0fhIw5KSVSXbs5hg8gTuyQxF4n40P1ls0qgtZUoZy
         wdnrh+hawvtdCMGNyV5aGxiO/NUKxlDhsQkICiV+6tiihKnZXAeOsGlHPV7N0UykLiK7
         F/MqOMjoCkoaa2ajWf01AZl+cXpgayCKYyhnoHzIMkz9JnkwEGMFHv7a1CLg6rIgBMtf
         pY3g==
X-Gm-Message-State: APjAAAW2K35Bi7ugBMSN1pP6VtoeLn40rwrWz+g5ExLV9A8rv5tqoKdX
        JmWgMCoFSjCkGFly6ESa3zo=
X-Google-Smtp-Source: APXvYqzrEGdW0HPJ6+WGHPma3v3/P3aC8F4tBF+UxqKOyrUZNity4s5dMzo8JslXmym7AtpRbpV/4w==
X-Received: by 2002:a17:902:8f8f:: with SMTP id z15mr86941174plo.93.1559097770190;
        Tue, 28 May 2019 19:42:50 -0700 (PDT)
Received: from xy-data.openstacklocal (ecs-159-138-22-150.compute.hwclouds-dns.com. [159.138.22.150])
        by smtp.gmail.com with ESMTPSA id w4sm15152249pfi.87.2019.05.28.19.42.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 28 May 2019 19:42:49 -0700 (PDT)
From:   Young Xiao <92siuyang@gmail.com>
To:     rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Young Xiao <92siuyang@gmail.com>
Subject: [PATCH] pinctrl: ns2: Fix potential NULL dereference
Date:   Wed, 29 May 2019 10:43:58 +0800
Message-Id: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

platform_get_resource() may fail and return NULL, so we should
better check it's return value to avoid a NULL pointer dereference
a bit later in the code.

Signed-off-by: Young Xiao <92siuyang@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 4b5cf0e..2bf6af7 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -1048,6 +1048,8 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return PTR_ERR(pinctrl->base0);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res)
+		return -EINVAL;
 	pinctrl->base1 = devm_ioremap_nocache(&pdev->dev, res->start,
 					resource_size(res));
 	if (!pinctrl->base1) {
-- 
2.7.4

