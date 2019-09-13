Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 691B8B27B4
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390466AbfIMV7t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59796 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390350AbfIMV7t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 13FEA61213; Fri, 13 Sep 2019 21:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411988;
        bh=DGRUcZkX4E9MP9Et/d3SKghyE5Vp0MuEkL3EhOi3LeA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Imn5MV4F/B/4jek4DtGuiAOwq9WprEWOogJfWQ6hbbMfoMTGRuz8/UeAKIavy2kBM
         Xg38QsptXuOi1xAMPXwOjEBq4zxDkY/QjmH6HoZmD16/YDqOSVNA8phAQdGHG5cR1A
         6YWMOT6zPxkCO/Ond3eSERxOLLsNRjU2bOLDO9IA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82031611C5;
        Fri, 13 Sep 2019 21:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411987;
        bh=DGRUcZkX4E9MP9Et/d3SKghyE5Vp0MuEkL3EhOi3LeA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WdDYeuyc+ms22wHWnXHHwjHmZGuIFJNkoSaXiQTsX5hBFF6Xz2RXoRdLCi4jago4x
         XBK1S1lcto54FMBwApzioCMjfRQL8Flx3/VXqPqYJ+H0wlyd8qmD0EZISF4dgSsR+c
         Jm6qmB2gwLQRWRSfOjjkKmEnr7OHsJLHYYXgqRGg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82031611C5
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add SPI config register
Date:   Fri, 13 Sep 2019 15:59:14 -0600
Message-Id: <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In addition to configuring the PDC, additional registers that interface
the GIC have to be configured to match the GPIO type. The registers on
some QCOM SoCs are access restricted, while on other SoCs are not. They
SoCs with access restriction to these SPI registers need to be written
from the firmware using the SCM interface. Add a flag to indicate if the
register is to be written using SCM interface.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.txt   | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 8e0797c..e329f8d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -24,6 +24,9 @@ Properties:
 	Usage: required
 	Value type: <prop-encoded-array>
 	Definition: Specifies the base physical address for PDC hardware.
+		    Optionally, specify the PDC's GIC interface registers that
+		    need to be configured for wakeup capable GPIOs routed to
+		    the PDC.
 
 - interrupt-cells:
 	Usage: required
@@ -50,15 +53,23 @@ Properties:
 		    The second element is the GIC hwirq number for the PDC port.
 		    The third element is the number of interrupts in sequence.
 
+- qcom,scm-spi-cfg:
+	Usage: optional
+	Value type: <bool>
+	Definition: Specifies if the SPI configuration registers have to be
+		    written from the firmware. Sometimes the PDC interface
+		    register to the GIC can only be written from the firmware.
+
 Example:
 
 	pdc: interrupt-controller@b220000 {
 		compatible = "qcom,sdm845-pdc";
-		reg = <0xb220000 0x30000>;
+		reg = <0 0x0b220000 0 0x30000>, <0 0x179900f0 0 0x60>;
 		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
 		#interrupt-cells = <2>;
 		interrupt-parent = <&intc>;
 		interrupt-controller;
+		qcom,scm-spi-cfg;
 	};
 
 DT binding of a device that wants to use the GIC SPI 514 as a wakeup
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

