Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9FC2FE9BA
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 13:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729943AbhAUMPI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 07:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730994AbhAUMOu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 07:14:50 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED49BC0613ED
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 04:14:01 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id m187so1258584wme.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 04:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1fh/a4DYJLi+AyFxFDtHnnnCfJUqWq8QRUBkRL69peM=;
        b=uhtmotDTNcSU3elkTAGv5ljRnhN+O0WXOi+p5MvFvHsI8xTZRnSfv//K0qPQAcyCTJ
         set7h6+CIAFEgUkRQeZbWhAip5XSFiM+vdUIyAfTUj44O4uJz9ORrFANHe5GiCegWyWF
         zbBxz60Z/Ze0CXHMVHw0ItPZyr80p2tiNaqKgKrVD1tGvzz0eoEZEVvMcGrY07kBHfDd
         SbeiJqTJIW2bJ0c4kmMrbXlgUtFcKiw8ngHPwQb64FWxbFACEhcvdc6wQ6cJ7o0OeriU
         EkYeDXVPUkno5yxMjmERrX1N9YIsccmM04qrPVkhW68XUhCNfLWoB4rPOi+vGC3/l3Ba
         HgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1fh/a4DYJLi+AyFxFDtHnnnCfJUqWq8QRUBkRL69peM=;
        b=MOmUw1nz3vZPiFlS2eprynXjS88fg+k/DFKI3Tk3diAYtz+oyGCDeLvdunm3cMNgXb
         Nmrn/v2Q+GravkM6EsX0YIe59Fk5Mo3VYZAtsJPf4BIaEAIIhm6gbP4iRglqhmpPskzX
         DLnhV3HNfILqOl92GDBZl/izpAK1UdSiJcYiIE9GvX5BYMf4AKrsS5/vE/UImZRJLOtm
         3LkPbNdSnCVpBnk2R9YE2xLgE9yfdUSSxUF1V1GeknpvwkYSGzZwc2b2k6xqIMFjBoNi
         LmaUzxtrxTLp4XMFJ6w2XwcXoMO3k+K/6H8eE4NQk2IzoJnlOj9RxKi+29wuyFiKI9CC
         PFQQ==
X-Gm-Message-State: AOAM533eADpHifWmbi6PW+JUh4XTjuIZ6cBc/mbefBIwBs8p67zcXqZR
        Z9PC41dzMVoYl0on7N7Jagl29YPjyDEghA==
X-Google-Smtp-Source: ABdhPJx9Bhv813mdnZiQlWQ4Uk812dfwvV+b3bgBmx5XiuSgvG/PaMMnuhhojD92G4yGmytdYhen2A==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr8828963wmh.85.1611231240762;
        Thu, 21 Jan 2021 04:14:00 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id w129sm7964855wmb.11.2021.01.21.04.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 04:14:00 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: mockup: tweak the Kconfig help text
Date:   Thu, 21 Jan 2021 13:13:55 +0100
Message-Id: <20210121121355.31654-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

gpio-mockup doesn't require SYSFS to be selected so drop that bit from
the Kconfig text.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c70f46e80a3b..e8e3ed803c07 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1633,8 +1633,7 @@ config GPIO_MOCKUP
 	select IRQ_SIM
 	help
 	  This enables GPIO Testing driver, which provides a way to test GPIO
-	  subsystem through sysfs(or char device) and debugfs. GPIO_SYSFS
-	  must be selected for this test.
+	  subsystem through sysfs (or char device) and debugfs.
 	  User could use it through the script in
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
-- 
2.29.1

