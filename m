Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0CAD44BC
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 17:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbfJKPsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 11:48:08 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32914 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfJKPsH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 11:48:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so6343156pfl.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 08:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8dslRAjltFEQ38TKy6sGKan1JS7Yvgm4Z9fGKBQoELg=;
        b=jnlARvAsn/TOSX7if0HMLqp4aaeRmNfCmkagBtl1ICKTPOtfUGvdXJtCgE2a7wBeZN
         glJCATcDhsf5QMmO330NnRT0T/agPdd45V8IERy8rU/tprjoBPJYRcymr3VZ99ouwBP4
         Jc8WhtnkTZsHxbo4jUKKoF/0N0Lt0AujR4Y1h4K2acfX/UaiDgkjnMr5zpzpiMILQeuk
         UQD2DU08lm8dYvUrJKmY82zbKeifPaEllO76SOzrx1CQIMDrehvJpvaV9xHHtmtGnQWL
         0DUN0BvS2oAWvh3BXPaXRG/i6xgparA+u6YYkCpA06llznAVgZ6F1GXUbiHSIKkV19Js
         FzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8dslRAjltFEQ38TKy6sGKan1JS7Yvgm4Z9fGKBQoELg=;
        b=KK00W2aC2YgIT5aw0r+L/gHXwdVJKvIhmYukNkEMnr1s4bYgxSiUHEHgWZRxx43Z1w
         8PPjUB2aNTbU0s4eVHxr/XecDJBIpfjODq4pLoAz4DoOt+ZTYJ4J2iBey3Vtt0esJmSl
         c5Q/CVCGdDBC2LXD+yegF3OBtW8y0Z+B0OoApE/p/0UF0wqvXWC9uPFYUD/u7BJtUBKT
         795KiR4HBm2WY8B1c5mL8N127nVCzRKsujAM2Npbvf4sm7zI+KdvoCwuVHws4FZYwRkF
         BMGhXSBrwz0lEdDZ+0k26fO8rGoK8nxf8/sosnYzzWyPhWGT3ugAcSmvXHwlmy1s5gGu
         cuyw==
X-Gm-Message-State: APjAAAU6m186RPJ3HGf7YQ95ssg8vsTuRDKn1Wy+gEWXMR2SadJR1Yn7
        DHk1ggrS97ml6iX5zQg6VkG+zMbFqDgp4w==
X-Google-Smtp-Source: APXvYqwzIcAMf9Z7QGgX6X94Vc4sg5panbdXlTX+D3IoRLtDau4s0DRz9iWADPzSxref8A92Bisy9Q==
X-Received: by 2002:aa7:9e88:: with SMTP id p8mr17680901pfq.10.1570808886880;
        Fri, 11 Oct 2019 08:48:06 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v28sm13755404pgn.17.2019.10.11.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 08:48:06 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 3/5] gpiolib: pull requires explicit input mode
Date:   Fri, 11 Oct 2019 23:46:48 +0800
Message-Id: <20191011154650.1749-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011154650.1749-1-warthog618@gmail.com>
References: <20191011154650.1749-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch prevents pull up/down flags being applied to as-is line
requests, which should be left as-is, and for output mode for which
setting pulls is not currently supported.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0912a00b2960..a634c340920b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -559,6 +559,12 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
 		return -EINVAL;
 
+	/* PULL_UP and PULL_DOWN flags only make sense for input mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_PULL_UP) ||
+	     (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)))
+		return -EINVAL;
+
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
 		return -ENOMEM;
-- 
2.23.0

