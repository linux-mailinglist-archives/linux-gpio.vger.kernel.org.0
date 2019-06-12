Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEF8428EA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 16:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439699AbfFLO1L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 10:27:11 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35831 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439672AbfFLO1F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 10:27:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id m3so17189908wrv.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 07:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fy6aQtpj04fOwVei4zMchW/ihmwVQAgPeocDj7znWWs=;
        b=OrQ5ncDIKVyQSJV2lGbcoHTeQSe6MmmBwUcZC5zqV4QZ3vTVA1BtrgPUQ8jbMgb67v
         /kOxwnETofKRgBNj1b0HtE9u0AFFdOWCcPcAbfIoJnuGIvOw57czbPWLpltqHuWbXWRj
         fKXJ4DRXKuAYnQjGzz+tj23i+n5DN2bx3mYS5xPRMMAzHx9ZOqGZWEvU0hVNym6SnQL4
         Jg4GILy6YS//Erz1lNqcpODAIzqawBCFwBpA+4APbSeGmT0vek59soiMsm8V76nAUrCv
         Ljz98I133N7M+6ePZoFk6KumhrqC+Uk+SpqdoVV40pdsRct4z0Cgsbt4Rq99N2yIAGwK
         eWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fy6aQtpj04fOwVei4zMchW/ihmwVQAgPeocDj7znWWs=;
        b=nTjSLy0AW8i3xawInikF9dqG0uCaZLHGR+Zpo+GGgACiS52NbuzC+0BXNDsXOo73if
         M+SQkAeHzJ4ybQGpwuMx5IFoADBNF5Mi3JU4V4bxzTPi5kijXOSWzP7+9SVdmBVlWrmA
         sRbVm9TmD40QU0UOVSxKRtRLi+Whu0Ol2ZuQ7hcy2sign+xNnhYXr5xCwCumza9M34o4
         St6NtkGO9OYkVNMSEqTCO9OA48MhpVHYEWeB5E7LZS0Dd7aRWcYh3dEtN1iihTr+7d3R
         qtcWWlib0vYbRzqhwhAPYOItmsOeG1xf9iZsouVnjmBVFIcryXVcTP/C8xwnB21Apg5v
         AVMQ==
X-Gm-Message-State: APjAAAVB4jgCbuy5WpeCGr1AdvimRJ+S4zWeH1bO1D9EfEkRe/V6x+3W
        lf2CP+nGPu3j/NbJciwNZKvLwQ==
X-Google-Smtp-Source: APXvYqwFw+UqoHDB/67jT5cutBxDI1YWxBlU2IDiPnPIIo4Ib0zOzE+46btHcLsNuy0V0H4zJJx2KA==
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr42518942wrw.131.1560349623979;
        Wed, 12 Jun 2019 07:27:03 -0700 (PDT)
Received: from dell.watershed.co.uk ([185.80.132.160])
        by smtp.gmail.com with ESMTPSA id y18sm203959wmd.29.2019.06.12.07.27.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:27:03 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.or,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v4 5/6] usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
Date:   Wed, 12 Jun 2019 15:26:53 +0100
Message-Id: <20190612142654.9639-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612142654.9639-1-lee.jones@linaro.org>
References: <20190612142654.9639-1-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When booting with Device Tree, the current default boot configuration
table option, the request to boot via 'host mode' comes from the
'dr_mode' property.  A property of the same name can be used inside
ACPI tables too.  However it is missing from the SDM845's ACPI tables
so we have to supply this information using Platform Device Properties
instead.

This does not change the behaviour of any currently supported devices.
The property is only set on ACPI enabled platforms, thus for H/W
booting DT, unless a 'dr_mode' property is present, the default is
still OTG (On-The-Go) as per [0].  Any new ACPI devices added will
also be able to over-ride this implementation by providing a 'dr_mode'
property in their ACPI tables.  In cases where 'dr_mode' is omitted
from the tables AND 'host mode' should not be the default (very
unlikely), then we will have to add some way of choosing between them
at run time - most likely by ACPI HID.

[0] Documentation/devicetree/bindings/usb/generic.txt

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1e1f12b7991d..55ba04254e38 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -444,6 +444,11 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
+static const struct property_entry dwc3_qcom_acpi_properties[] = {
+	PROPERTY_ENTRY_STRING("dr_mode", "host"),
+	{}
+};
+
 static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 {
 	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
@@ -488,6 +493,13 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 		goto out;
 	}
 
+	ret = platform_device_add_properties(qcom->dwc3,
+					     dwc3_qcom_acpi_properties);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to add properties\n");
+		goto out;
+	}
+
 	ret = platform_device_add(qcom->dwc3);
 	if (ret)
 		dev_err(&pdev->dev, "failed to add device\n");
-- 
2.17.1

