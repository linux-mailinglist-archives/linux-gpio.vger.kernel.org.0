Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0927CFCDDD
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 19:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfKNSgV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 13:36:21 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55896 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfKNSfp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 13:35:45 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 38259613D1; Thu, 14 Nov 2019 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756544;
        bh=Xe3y4lO0o+G7wd7o5uty7IuBxQRp8lK4R1EoiDy8RUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QDjReYuJxUcuaCQCjE1xNnytaQLOBJGOqPXkzLDtjL9tGrsYgAQ5+abJ9/3D8Sa2m
         wJ1237n5gxw+Qy2L4j1yCOrVhFlawfQOpDQppoAHVMPDm/+lF70h0/6NC3yBWXV4BB
         52Eoo5yUWJc0HKO6InpExZnBoTKfnrS2rWDXgOyA=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5CF31613E4;
        Thu, 14 Nov 2019 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756541;
        bh=Xe3y4lO0o+G7wd7o5uty7IuBxQRp8lK4R1EoiDy8RUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K6G0pOnU+LLlzlxbBo5KXbLCH/r/X7tbVbNBniOYwp3+xJAexZIlv8B6ldEy/uX3b
         T8ykRXPWFW5KrX4vuKF+vK8yppAp9HUBB4jAehxgFX5QFODGDciaujW6fo0pQF8xM9
         XOHVDibsttYHxxMQcaOTRlkA9l/iJhUeiPeLjCGY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5CF31613E4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 05/12] of: irq: document properties for wakeup interrupt parent
Date:   Thu, 14 Nov 2019 11:35:14 -0700
Message-Id: <1573756521-27373-6-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some interrupt controllers in a SoC, are always powered on and have a
select interrupts routed to them, so that they can wakeup the SoC from
suspend. Add wakeup-parent DT property to refer to these interrupt
controllers.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v1:
	- Remove whitespace at end of patch
---
 .../devicetree/bindings/interrupt-controller/interrupts.txt  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
index 4a3ee25..4ebfa00 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
@@ -108,3 +108,15 @@ commonly used:
 			sensitivity = <7>;
 		};
 	};
+
+3) Interrupt wakeup parent
+--------------------------
+
+Some interrupt controllers in a SoC, are always powered on and have a select
+interrupts routed to them, so that they can wakeup the SoC from suspend. These
+interrupt controllers do not fall into the category of a parent interrupt
+controller and can be specified by the "wakeup-parent" property and contain a
+single phandle referring to the wakeup capable interrupt controller.
+
+   Example:
+	wakeup-parent = <&pdc_intc>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

