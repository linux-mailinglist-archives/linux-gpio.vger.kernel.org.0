Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A41D2B4172
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 11:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbgKPKmt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 05:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729178AbgKPKms (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 05:42:48 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53979C0613D2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:48 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id 23so18106371wrc.8
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CxfKxZTg1DbPHJWPzb3+j86ivMqV6vfkqrTZ7ZDLxTg=;
        b=tMi80xynRp4hBqkNkBreCUIY5H8i99McNc6u7JRzeN5b/v1RcIzqYDuz+u4VLBDa9a
         DqGiqDNYLTHNHjEbTpskAdupj5OGTAqmbli3Sh2tR66LFdqndOIncLE7KFbI1/p27XrZ
         uSML2nMbyQEvBIBSnQZtXsOiXifpczCGJxey9QA9YKTKKs+QMZQCELrY7r8/Bk7T4e4g
         SN2u1YF/IbX1X6eQdfq++GZFXy4245JLonuWUsblKnFP/fxfXseQJDlnqiXMNXPjel3d
         1+287JeZmDMvKRaNBVubnTa9qIok9lF0OgCuoovXl+pqonNxE09wmRU6RjoRfSSVAxFP
         oqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CxfKxZTg1DbPHJWPzb3+j86ivMqV6vfkqrTZ7ZDLxTg=;
        b=UIKAk+gbv2J3AVobBXfyXLgrXzdrKtpTjsswzczb4Lhcr0ZqdD0hcOT2IrKv0FRT2e
         wWWPzMstZsAZJiE/2Wcxav2mPYXalX78FV4JBq+CCimi0OqIz6qp2kTOId4dxByLKG9C
         Ibnun/bpwpwlWUU8WeDEQU4apzLSjrhVFNMF7025WhyOkC5CL6I91uN9CbtgXbWSSHfL
         Ty/acoKW9GgjvroQ8GRBXCAltDwwg1UcP3vjcTR30B7eb0ZIgm+iEtxNUBt+6NgtPX5p
         YXMHAhDKYTe8YN2yGi9HrRmeQmcFRygXP1LhalDhB25YHWm0vXQFZSDwgEE4095bZZxV
         B6cg==
X-Gm-Message-State: AOAM530eOEsBuUEW8BHEBRL4IoxJ0lc/TccD8Hg/zkXI/cOYudv+y8dB
        U3esen0XkLg4jYQRVPJhWmRcvg==
X-Google-Smtp-Source: ABdhPJzUKjTNKTbXFWJcsJH8ygfAj6l68RwUt/AazhZ6d2KIvuU+crBrvhbEHSdvAoUUE2Of0Iu60Q==
X-Received: by 2002:adf:f304:: with SMTP id i4mr18285381wro.268.1605523367000;
        Mon, 16 Nov 2020 02:42:47 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id v16sm20583283wml.33.2020.11.16.02.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 02:42:46 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 1/7] gpio: exar: add a newline after the copyright notice
Date:   Mon, 16 Nov 2020 11:42:36 +0100
Message-Id: <20201116104242.19907-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116104242.19907-1-brgl@bgdev.pl>
References: <20201116104242.19907-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

It's customary to have a newline between the copyright header and the
includes. Add one to gpio-exar.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-exar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index b1accfba017d..4202dd363a11 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2015 Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  */
+
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
-- 
2.29.1

