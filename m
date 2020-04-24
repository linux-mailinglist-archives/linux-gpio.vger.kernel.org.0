Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610B11B7A50
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 17:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgDXPln (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 11:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgDXPlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Apr 2020 11:41:42 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776B2C09B045;
        Fri, 24 Apr 2020 08:41:42 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 18so4964429pfx.6;
        Fri, 24 Apr 2020 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e6UUELKHTRaIcS4QV07X3ojg7mLYoqqYg7x69qbXEkQ=;
        b=NxQn4qOKgz8xVV7lxduOyYb3+YCe4TyyGDtxoi9a9lQ43/mbSE75yKhsXIIbBkbjLH
         cDCvTpXkFsuBO3Klr1iLl3Do97q5nEmBhgZh3m85X0pZGDvtT0khadl95d9OIK1UkSh9
         x89xDEw1ys0X2IbDopkojpxRd+PtImGMNBOb3avmy/y9HsSezXsK8Wn8hxLjba2cNOB2
         M0X4VGiwPeFAHBtDXquCH7eP/kas/Euiv10uhm8deETb68oYgIFNTn2z4XMGubVd7vo/
         wlD/cQr+HHUUqJWLJJFmHswMRLkOnyY8MBhf4keuBf8upBRvBZYOfr35Iq7/Rxhf8hH1
         boiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e6UUELKHTRaIcS4QV07X3ojg7mLYoqqYg7x69qbXEkQ=;
        b=UpEcJBEqGqAmOj5keY9o5ad3mdtPedA/gQCrYKF+NuERiQlNyhXEtZqBsA0A+jC8UK
         0Zer5MHK1vPKMm5n6muxWzYtjRt29eGmRCHGdbDSiuZkrjgAd/rdxP9YupMGoElGn/HU
         kxSTHVTyh5t0DfvC28TX0we959NNQMM0xRulTB9pi23fkxL0I0KsrX5lRK6yWjEbcN/u
         PenQXaZ39lAWlplBgBBJlQqzF27LHBnccSBpw92JmlXgRUP+PBj5yE3ZPUGxv9nmR0BE
         2AmE2afm7/xrKIDX0cBzJ1OvxcqUnGCUhJAQsRqgG9wMUZotR3LNB1XhdolKQ7FChis1
         gunw==
X-Gm-Message-State: AGi0PuYqhyQWj56ftTbNH4xq/1nYhAK37yDYPr2y8+aTPqHP3DF1pkrf
        mQUUkWQPaKH+h2Qsq3kflQLkqc+v1Vg=
X-Google-Smtp-Source: APiQypLEeCOlNG0+Rqfu88xx7FRmNk43AaBB/EAQTUmGncEwTg9rT0JpRiLBp8O7HKG5LYUF08p1vg==
X-Received: by 2002:a63:5f4d:: with SMTP id t74mr9844812pgb.385.1587742902107;
        Fri, 24 Apr 2020 08:41:42 -0700 (PDT)
Received: from localhost (176.122.158.64.16clouds.com. [176.122.158.64])
        by smtp.gmail.com with ESMTPSA id v127sm5950379pfv.77.2020.04.24.08.41.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 08:41:41 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 2/2] gpio: mm-lantiq: Fix small typo
Date:   Fri, 24 Apr 2020 23:41:03 +0800
Message-Id: <20200424154103.10311-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200424154103.10311-1-zhengdejin5@gmail.com>
References: <20200424154103.10311-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix a spelling typo in gpio-mm-lantiq.c by codespell
s/dont/don't/

Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- split patch v1 (only one patch) into patches for each driver
	  by Bartosz's suggestion. thanks Bartosz.

 drivers/gpio/gpio-mm-lantiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index f460d71b0c92..538e31fe8903 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -36,7 +36,7 @@ struct ltq_mm {
  * @chip:     Pointer to our private data structure.
  *
  * Write the shadow value to the EBU to set the gpios. We need to set the
- * global EBU lock to make sure that PCI/MTD dont break.
+ * global EBU lock to make sure that PCI/MTD don't break.
  */
 static void ltq_mm_apply(struct ltq_mm *chip)
 {
-- 
2.25.0

