Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9743421D8FD
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730248AbgGMOuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730238AbgGMOuC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:50:02 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F06C08C5DB
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:50:02 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f139so13447501wmf.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NyAKoCtSVFFVlxIAMUZJD+1tBL7lJyYgfugY7+GPMFU=;
        b=kJ7DOLoAu9v/O6Cbi/Rr3rtan9UVSoAht4Rn5M+Nf+Kux+7jzkhvmwINtpqPhSTIvK
         iJWQSdGWWV2MatEgzEqQH614wh4YjcFNBaoxK6CyyxkL4M7eFSRBUul0s2zVDwP+daOO
         AE7Vw4nHz7JtADXUoCivS29gGuP45f3HphgPT1Am3Awa2p7IsO3WZ9Vxp+lS5cDRQoBe
         qtMxiQcZ1c95UrKJgDRgDEWMpTi5HBuN2Ni2ykVu4BRYDz9IsX+GugjHJAlzWrGNQ5d3
         PxCEXpCmvbozje6X/dqtGMPTLbGMv/8+JYsGLpayQO7pXQ9U63TvxYmv0QN8FEQofkhz
         fXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NyAKoCtSVFFVlxIAMUZJD+1tBL7lJyYgfugY7+GPMFU=;
        b=iy3/Ch7YMlMFpFAzAApPlHfaejRyx9UiweiWMk3jdIpVBCCy+gcfPIoPnUl5z5gJo6
         0/WXbwwqvo17WQMHsQSTA7lQiTcQkbOgtk620FHPhQS3T26Z6hymru8lu3WO3L+XemXD
         veHTo2kXzFf0of2BKn2nCX8BprAErlZnWMlL/BhwRa/HhItkbvb/EQDJyUcW+piprv6g
         dJCo0qJBxfHE3voXY4JfA9K8Bw71bWPZG86/EoMbsQvmeYh8r5+88Qoi/eN2reeKMSZT
         iTaWZCA6oNg+ZtsJ4MV1R8gbzNhrSvheSFTQiZic9ScqWPCksXcwXNj72jFWsOSt5tde
         C6VQ==
X-Gm-Message-State: AOAM532UqFPs+0dBPQAxScc1nc0BAZfGA8xp1gGS+TUtk7MMwh6oLRQ/
        gaWdzM1oMbX7Mke7gaTGyA4nirULuic=
X-Google-Smtp-Source: ABdhPJxu6MBtughdKOf1ivpCaB2fLttFQ+Klr38ioj5ahU5z90A67dti25jN/DNpY6X9JObwfTbRuA==
X-Received: by 2002:a1c:ed05:: with SMTP id l5mr331704wmh.68.1594651800778;
        Mon, 13 Jul 2020 07:50:00 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:50:00 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, Ken Xue <Ken.Xue@amd.com>,
        "Wu, Jeff" <Jeff.Wu@amd.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 25/25] pinctrl: pinctrl-amd: Do not define 'struct acpi_device_id' when !CONFIG_ACPI
Date:   Mon, 13 Jul 2020 15:49:30 +0100
Message-Id: <20200713144930.1034632-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since ACPI_PTR() is used to NULLify the value when !CONFIG_ACPI,
'struct amd_gpio_acpi_match' becomes defined but unused.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/pinctrl-amd.c:959:36: warning: ‘amd_gpio_acpi_match’ defined but not used [-Wunused-const-variable=]
 959 | static const struct acpi_device_id amd_gpio_acpi_match[] = {

Cc: Ken Xue <Ken.Xue@amd.com>
Cc: "Wu, Jeff" <Jeff.Wu@amd.com>
Cc: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
Cc: Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index c34e6a950b3f6..ccf6120311193 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -956,12 +956,14 @@ static int amd_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id amd_gpio_acpi_match[] = {
 	{ "AMD0030", 0 },
 	{ "AMDI0030", 0},
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, amd_gpio_acpi_match);
+#endif
 
 static struct platform_driver amd_gpio_driver = {
 	.driver		= {
-- 
2.25.1

